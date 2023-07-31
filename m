From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 11:26:09 -0700
Subject: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for unmap
In-Reply-To: <87jzulqz0v.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-13-rananta@google.com>
 <87jzulqz0v.wl-maz@kernel.org>
Message-ID: <CAJHc60zGzAqWw2iZwNEG_bWERXkz_io7ae-K_tf_kh6xcOBxLA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023 at 6:12?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 22 Jul 2023 03:22:51 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > The current implementation of the stage-2 unmap walker traverses
> > the given range and, as a part of break-before-make, performs
> > TLB invalidations with a DSB for every PTE. A multitude of this
> > combination could cause a performance bottleneck on some systems.
> >
> > Hence, if the system supports FEAT_TLBIRANGE, defer the TLB
> > invalidations until the entire walk is finished, and then
> > use range-based instructions to invalidate the TLBs in one go.
> > Condition deferred TLB invalidation on the system supporting FWB,
> > as the optimization is entirely pointless when the unmap walker
> > needs to perform CMOs.
> >
> > Rename stage2_put_pte() to stage2_unmap_put_pte() as the function
> > now serves the stage-2 unmap walker specifically, rather than
> > acting generic.
> >
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > ---
> >  arch/arm64/kvm/hyp/pgtable.c | 67 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 58 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 5ef098af1736..cf88933a2ea0 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -831,16 +831,54 @@ static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t n
> >       smp_store_release(ctx->ptep, new);
> >  }
> >
> > -static void stage2_put_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> > -                        struct kvm_pgtable_mm_ops *mm_ops)
> > +struct stage2_unmap_data {
> > +     struct kvm_pgtable *pgt;
> > +     bool defer_tlb_flush_init;
> > +};
> > +
> > +static bool __stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
> > +{
> > +     /*
> > +      * If FEAT_TLBIRANGE is implemented, defer the individual
> > +      * TLB invalidations until the entire walk is finished, and
> > +      * then use the range-based TLBI instructions to do the
> > +      * invalidations. Condition deferred TLB invalidation on the
> > +      * system supporting FWB, as the optimization is entirely
> > +      * pointless when the unmap walker needs to perform CMOs.
> > +      */
> > +     return system_supports_tlb_range() && stage2_has_fwb(pgt);
> > +}
> > +
> > +static bool stage2_unmap_defer_tlb_flush(struct stage2_unmap_data *unmap_data)
> > +{
> > +     bool defer_tlb_flush = __stage2_unmap_defer_tlb_flush(unmap_data->pgt);
> > +
> > +     /*
> > +      * Since __stage2_unmap_defer_tlb_flush() is based on alternative
> > +      * patching and the TLBIs' operations behavior depend on this,
> > +      * track if there's any change in the state during the unmap sequence.
> > +      */
> > +     WARN_ON(unmap_data->defer_tlb_flush_init != defer_tlb_flush);
> > +     return defer_tlb_flush;
>
> I really don't understand what you're testing here. The ability to
> defer TLB invalidation is a function of the system capabilities
> (range+FWB) and a single flag that is only set on the host for pKVM.
>
> How could that change in the middle of the life of the system? if
> further begs the question about the need for the unmap_data data
> structure.
>
> It looks to me that we could simply pass the pgt pointer around and be
> done with it. Am I missing something obvious?
>
From one of the previous comments [1] (used in a different context),
I'm given to understand that since these feature checks are governed
by alternative patching, they can potentially change (at runtime?). Is
that not the case and I have misunderstood the idea in comment [1]
entirely? Is it solely used for optimization purposes and set only
once?
If that's the case, I can get rid of the WARN_ON() and unmap_data.

- Raghavendra

[1]: https://lore.kernel.org/all/ZGPPj1AXS0Uah2Ug at linux.dev/
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

