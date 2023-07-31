From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 11:01:53 -0700
Subject: [PATCH v7 08/12] KVM: arm64: Define kvm_tlb_flush_vmid_range()
In-Reply-To: <87lef1qzim.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-9-rananta@google.com>
 <87o7jxr06t.wl-maz@kernel.org> <87lef1qzim.wl-maz@kernel.org>
Message-ID: <CAJHc60xC-Bs-0uoqkytDVcwHTxVnW7eyVxfHhO0mRrupVbdaYg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 6:01?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 27 Jul 2023 13:47:06 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Sat, 22 Jul 2023 03:22:47 +0100,
> > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > >
> > > Implement the helper kvm_tlb_flush_vmid_range() that acts
> > > as a wrapper for range-based TLB invalidations. For the
> > > given VMID, use the range-based TLBI instructions to do
> > > the job or fallback to invalidating all the TLB entries.
> > >
> > > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
> > >  arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
> > >  2 files changed, 30 insertions(+)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > > index 8294a9a7e566..5e8b1ff07854 100644
> > > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > > @@ -754,4 +754,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
> > >   *    kvm_pgtable_prot format.
> > >   */
> > >  enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
> > > +
> > > +/**
> > > + * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
> > > + *
> > > + * @mmu:   Stage-2 KVM MMU struct
> > > + * @addr:  The base Intermediate physical address from which to invalidate
> > > + * @size:  Size of the range from the base to invalidate
> > > + */
> > > +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> > > +                           phys_addr_t addr, size_t size);
> > >  #endif     /* __ARM64_KVM_PGTABLE_H__ */
> > > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > > index aa740a974e02..5d14d5d5819a 100644
> > > --- a/arch/arm64/kvm/hyp/pgtable.c
> > > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > > @@ -670,6 +670,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
> > >     return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
> > >  }
> > >
> > > +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> > > +                           phys_addr_t addr, size_t size)
> > > +{
> > > +   unsigned long pages, inval_pages;
> > > +
> > > +   if (!system_supports_tlb_range()) {
> > > +           kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> > > +           return;
> > > +   }
> > > +
> > > +   pages = size >> PAGE_SHIFT;
> > > +   while (pages > 0) {
> > > +           inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
> > > +           kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
> > > +
> > > +           addr += inval_pages << PAGE_SHIFT;
> > > +           pages -= inval_pages;
> > > +   }
> > > +}
> > > +
> >
> > This really shouldn't live in pgtable.c. This code gets linked into
> > the EL2 object. What do you think happens if, for some reason, this
> > gets called *from EL2*?
>
> Ah, actually, nothing too bad would happen, as we convert the
> kvm_call_hyp() into a function call.
>
> But still, we don't need two copies of this stuff, and it can live in
> mmu.c.
>
But since we have a couple of references in pgtable.c to
kvm_tlb_flush_vmid_range(), wouldn't that be an (linking) issue if we
moved the definition to mmu.c?

ld: error: undefined symbol: __kvm_nvhe_kvm_tlb_flush_vmid_range
>>> referenced by pgtable.c:1148 (./arch/arm64/kvm/hyp/nvhe/../pgtable.c:1148)
>>>               arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o:(__kvm_nvhe_kvm_pgtable_stage2_unmap) in archive vmlinux.a
...

Or is there some other way to make it work?

- Raghavendra

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

