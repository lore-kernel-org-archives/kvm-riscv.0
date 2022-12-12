From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Dec 2022 00:43:17 +0100
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
In-Reply-To: <Y5e4qxjHWoMt8YGs@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <Y5OHVzBSHPmAq2FO@google.com>
 <eb93beee-9d43-1c1e-250c-28ab7e9ebed9@redhat.com>
 <Y5e4qxjHWoMt8YGs@google.com>
Message-ID: <f1026204-1895-1a7e-5bf8-3527223f3778@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/13/22 00:26, Sean Christopherson wrote:
>>> I would strongly be in favor of discarding the shadow paging residue if
>>> x86 folks are willing to part ways with it ?
>> Yes, absolutely.  Something like to_shadow_page->to_mmu_data, sp->md,
>> spt->hpt, spte->spte, sptep->hptep.
> "host" will be confusing if when the primary MMU is involved though, e.g. I always
> think of the primary MMU's page tables as the "host page tables".
> 
> What if we keep the "S" for SPT(E) and repurpose it to mean Secondary PTE?

Makes sense, so just to_shadow_page->to_secmmu_page?

Paolo


