From: Sean Christopherson <seanjc@google.com>
Date: Mon, 12 Dec 2022 23:26:35 +0000
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
In-Reply-To: <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
 <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
Message-ID: <Y5e4qxjHWoMt8YGs@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022, Paolo Bonzini wrote:
> On 12/9/22 20:07, Oliver Upton wrote:
> > >   - Naming. This series does not change the names of any existing code.
> > >     So all the KVM/x86 Shadow MMU-style terminology like
> > >     "shadow_page"/"sp"/"spte" persists. Should we keep that style in
> > >     common code or move toward something less shadow-paging-specific?
> > >     e.g. "page_table"/"pt"/"pte".
> > 
> > I would strongly be in favor of discarding the shadow paging residue if
> > x86 folks are willing to part ways with it ?
> 
> Yes, absolutely.  Something like to_shadow_page->to_mmu_data, sp->md,
> spt->hpt, spte->spte, sptep->hptep.

"host" will be confusing if when the primary MMU is involved though, e.g. I always
think of the primary MMU's page tables as the "host page tables".

What if we keep the "S" for SPT(E) and repurpose it to mean Secondary PTE?

