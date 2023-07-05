From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 5 Jul 2023 11:28:18 -0700
Subject: [RESEND PATCH v5 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
In-Reply-To: <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-8-rananta@google.com>
 <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
Message-ID: <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 4, 2023 at 5:31?PM Gavin Shan <gshan@redhat.com> wrote:
>
>
> On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> > Implement the helper kvm_tlb_flush_vmid_range() that acts
> > as a wrapper for range-based TLB invalidations. For the
> > given VMID, use the range-based TLBI instructions to do
> > the job or fallback to invalidating all the TLB entries.
> >
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > ---
> >   arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
> >   arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
> >   2 files changed, 30 insertions(+)
> >
>
> It may be reasonable to fold this to PATCH[08/11] since kvm_tlb_flush_vmid_range() is
> only called by ARM64's kvm_arch_flush_remote_tlbs_range(), which is added by PATCH[08/11].
> In either way, the changes look good to me:
>
Ah, the patches 10 and 11 also call kvm_tlb_flush_vmid_range(), so
probably it's better to keep the definition isolated?

Regards,
Raghavendra
> Reviewed-by: Gavin Shan <gshan@redhat.com>
>
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 4cd6762bda805..1b12295a83595 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -682,4 +682,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
> >    *     kvm_pgtable_prot format.
> >    */
> >   enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
> > +
> > +/**
> > + * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
> > + *
> > + * @mmu:     Stage-2 KVM MMU struct
> > + * @addr:    The base Intermediate physical address from which to invalidate
> > + * @size:    Size of the range from the base to invalidate
> > + */
> > +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> > +                             phys_addr_t addr, size_t size);
> >   #endif      /* __ARM64_KVM_PGTABLE_H__ */
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 3d61bd3e591d2..df8ac14d9d3d4 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -631,6 +631,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
> >       return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
> >   }
> >
> > +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> > +                             phys_addr_t addr, size_t size)
> > +{
> > +     unsigned long pages, inval_pages;
> > +
> > +     if (!system_supports_tlb_range()) {
> > +             kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> > +             return;
> > +     }
> > +
> > +     pages = size >> PAGE_SHIFT;
> > +     while (pages > 0) {
> > +             inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
> > +             kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
> > +
> > +             addr += inval_pages << PAGE_SHIFT;
> > +             pages -= inval_pages;
> > +     }
> > +}
> > +
> >   #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
> >
> >   static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,
>
> Thanks,
> Gavin
>

