From: David Matlack <dmatlack@google.com>
Date: Tue, 21 Jun 2022 10:24:46 -0700
Subject: [PATCH v6 19/22] KVM: x86/mmu: Zap collapsible SPTEs in shadow
 MMU at all possible levels
In-Reply-To: <Yqyzavjp9eS9p4+m@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com> <20220516232138.1783324-20-dmatlack@google.com>
 <Yqyzavjp9eS9p4+m@google.com>
Message-ID: <CALzav=dG9f2X8GBLjQgR-Lj4yPKX2Adg3C+9_9aC83A7mzmbtw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 17, 2022 at 10:01 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, May 16, 2022, David Matlack wrote:
> > Currently KVM only zaps collapsible 4KiB SPTEs in the shadow MMU. This
> > is fine for now since KVM never creates intermediate huge pages during
> > dirty logging. In other words, KVM always replaces 1GiB pages directly
> > with 4KiB pages, so there is no reason to look for collapsible 2MiB
> > pages.
> >
> > However, this will stop being true once the shadow MMU participates in
> > eager page splitting. During eager page splitting, each 1GiB is first
> > split into 2MiB pages and then those are split into 4KiB pages. The
> > intermediate 2MiB pages may be left behind if an error condition causes
> > eager page splitting to bail early.
> >
> > No functional change intended.
> >
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index f83de72feeac..a5d96d452f42 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -6177,18 +6177,25 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
> >       return need_tlb_flush;
> >  }
> >
> > +static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
> > +                                        const struct kvm_memory_slot *slot)
> > +{
> > +     /*
> > +      * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1 since there's no need to zap
> > +      * pages that are already mapped at the maximum possible level.
> > +      */
> > +     if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
> > +                           PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1,
> > +                           true))
>
> No need to wrap, "true" fits easily on the previous line.  That said, I don't see
> any point in adding a helper.  It's highly unlike there will be another caller,
> and IMO it's not any more readable since I have to go look at another function
> when reading kvm_mmu_zap_collapsible_sptes().

I could see an argument for readability either way. Putting it in a
helper function abstracts away the details, which would aid
readability if the reader does not care about the implementation
details of the rmap case.

I also have been thinking about splitting the rmap stuff out of mmu.c
(e.g. into rmap.c or shadow_mmu.c) to mirror the TDP MMU. That way we
can have a more clear split between the TDP MMU and shadow MMU, each
with their own file, and with higher level MMU operations that need to
operate on either or both MMUs living in mmu.c.

>
> With some gentle massaging, the comment can squeeze onto two lines even with the
> extra level of indentation.
>
>                 /*
>                  * Note, use KVM_MAX_HUGEPAGE_LEVEL - 1, there's no need to zap
>                  * pages that are already mapped at the maximum hugepage level.
>                  */
>                 if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
>                                       PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1, true)
>                         kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
>
> > +             kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> > +}
> > +
> >  void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
> >                                  const struct kvm_memory_slot *slot)
> >  {
> >       if (kvm_memslots_have_rmaps(kvm)) {
> >               write_lock(&kvm->mmu_lock);
> > -             /*
> > -              * Zap only 4k SPTEs since the legacy MMU only supports dirty
> > -              * logging at a 4k granularity and never creates collapsible
> > -              * 2m SPTEs during dirty logging.
> > -              */
> > -             if (slot_handle_level_4k(kvm, slot, kvm_mmu_zap_collapsible_spte, true))
> > -                     kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> > +             kvm_rmap_zap_collapsible_sptes(kvm, slot);
> >               write_unlock(&kvm->mmu_lock);
> >       }
> >
> > --
> > 2.36.0.550.gb090851708-goog
> >

