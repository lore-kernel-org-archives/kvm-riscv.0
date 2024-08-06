From: Marc Zyngier <maz@kernel.org>
Date: Tue, 06 Aug 2024 09:55:22 +0100
Subject: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns accessed/dirty before dropping mmu_lock
In-Reply-To: <ZrFfvjy_-Tyx4xUV@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-55-seanjc@google.com>
	<ZrFfgzRbiqT-Zi2O@linux.dev>
	<ZrFfvjy_-Tyx4xUV@linux.dev>
Message-ID: <86ikwe2fph.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 06 Aug 2024 00:26:54 +0100,
Oliver Upton <oliver.upton@linux.dev> wrote:
> 
> On Mon, Aug 05, 2024 at 11:26:03PM +0000, Oliver Upton wrote:
> > [+cc Fuad]
> 
> Take 2!
> 
> > Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> > the page as dirty out of the critical section") that restructuring
> > around the MMU lock was helpful for reuse (presumably for pKVM), but I
> > lack the context there.
> > 
> > On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > > page/folio dirty after it has been written back can make some filesystems
> > > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > 
> > typo: s/will/with/
> > 
> > > the race is minuscule, hence the lack of complaints).  See the link below
> > > for details.

Should we consider reverting 9c30fc615daa then?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

