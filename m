From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Thu, 15 Dec 2022 15:20:09 +0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5onJulY3UQJNrmW@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com> <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com> <CAJhGHyBbjyKVEv3KcoOcPGQ28753FjR_rc9uNDEF3Dd-gNTRGQ@mail.gmail.com>
 <Y5onJulY3UQJNrmW@google.com>
Message-ID: <CAJhGHyBKttit3okKbBsG2U7y4Fr8TjVWHVTQWrcCr8JcUcgtSQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 15, 2022 at 3:42 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Dec 14, 2022, Lai Jiangshan wrote:
> > On Tue, Dec 13, 2022 at 1:47 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > >
> > > My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> > > address spaces to support SMM emulation was a mistake that should be contained to
> > > SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> > > even x86 can opt out.
> > >
> >
> >
> > I think the name ASID in kvm/x86 should be used for vmcb's ASID,
> > vmcs's VPID, and PCID. Using the name ASID for other purposes
> > would only result in unnecessary confusion.
>
> I agree in principle, but at this point fixing the problem would require a lot of
> churn since "as_id" is pervasive throughout the memslots code.
>
> It should be possible though, as I don't think anything in KVM's uAPI explicitly
> takes an as_id, i.e. it's KVM-internal terminology for the most part.
>
> > There is a bug for shadow paging when it uses two separate sets
> > of memslots which are using two sets of rmap and page-tracking.
> >
> > When SMM world is writing to a non-SMM page which happens to be
> > a guest pagetable in the non-SMM world, the write operation will
> > go smoothly without specially handled and the shadow page for the guest
> > pagetable is neither unshadowed nor marked unsync.  The shadow paging
> > code is unaware that the shadow page has deviated from the guest
> > pagetable.
>
> Won't the unsync code work as intended?  for_each_gfn_valid_sp_with_gptes()
> doesn't consume the slot and I don't see any explicit filtering on role.smm,
> i.e. should unsync all SPTEs for the gfn.
>
> Addressing the page-track case is a bit gross, but doesn't appear to be too
> difficult.  I wouldn't be surprised if there are other SMM => non-SMM bugs lurking
> though.
>
> ---
>  arch/x86/include/asm/kvm_page_track.h |  2 +-
>  arch/x86/kvm/mmu/mmu.c                |  7 +++---
>  arch/x86/kvm/mmu/mmu_internal.h       |  3 ++-
>  arch/x86/kvm/mmu/page_track.c         | 32 +++++++++++++++++++--------
>  arch/x86/kvm/mmu/spte.c               |  2 +-
>  5 files changed, 31 insertions(+), 15 deletions(-)

Could you send the patch in a new thread, please?

I will add my reviewed-by then.

It still lacks the parts that do write protection for sp->gfn.
kvm_vcpu_write_protect_gfn() has to handle the two worlds.
account_shadowed() and kvm_slot_page_track_add_page() have also
to handle the two worlds.

And I don't think there is any page-table in SMM-world, so
kvm_slot_page_track_is_active() can just skip the SMM-world
and check the non-SMM world only.

Thanks
Lai

>
> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
> index eb186bc57f6a..fdd9de31e160 100644
> --- a/arch/x86/include/asm/kvm_page_track.h
> +++ b/arch/x86/include/asm/kvm_page_track.h
> @@ -63,7 +63,7 @@ void kvm_slot_page_track_add_page(struct kvm *kvm,
>  void kvm_slot_page_track_remove_page(struct kvm *kvm,
>                                      struct kvm_memory_slot *slot, gfn_t gfn,
>                                      enum kvm_page_track_mode mode);
> -bool kvm_slot_page_track_is_active(struct kvm *kvm,
> +bool kvm_slot_page_track_is_active(struct kvm_vcpu *vcpu,
>                                    const struct kvm_memory_slot *slot,
>                                    gfn_t gfn, enum kvm_page_track_mode mode);
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 254bc46234e0..1c2200042133 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2715,9 +2715,10 @@ static void kvm_unsync_page(struct kvm *kvm, struct kvm_mmu_page *sp)
>   * were marked unsync (or if there is no shadow page), -EPERM if the SPTE must
>   * be write-protected.
>   */
> -int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
> +int mmu_try_to_unsync_pages(struct kvm_vcpu *vcpu, const struct kvm_memory_slot *slot,
>                             gfn_t gfn, bool can_unsync, bool prefetch)
>  {
> +       struct kvm *kvm = vcpu->kvm;
>         struct kvm_mmu_page *sp;
>         bool locked = false;
>
> @@ -2726,7 +2727,7 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
>          * track machinery is used to write-protect upper-level shadow pages,
>          * i.e. this guards the role.level == 4K assertion below!
>          */
> -       if (kvm_slot_page_track_is_active(kvm, slot, gfn, KVM_PAGE_TRACK_WRITE))
> +       if (kvm_slot_page_track_is_active(vcpu, slot, gfn, KVM_PAGE_TRACK_WRITE))
>                 return -EPERM;
>
>         /*
> @@ -4127,7 +4128,7 @@ static bool page_fault_handle_page_track(struct kvm_vcpu *vcpu,
>          * guest is writing the page which is write tracked which can
>          * not be fixed by page fault handler.
>          */
> -       if (kvm_slot_page_track_is_active(vcpu->kvm, fault->slot, fault->gfn, KVM_PAGE_TRACK_WRITE))
> +       if (kvm_slot_page_track_is_active(vcpu, fault->slot, fault->gfn, KVM_PAGE_TRACK_WRITE))
>                 return true;
>
>         return false;
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index ac00bfbf32f6..38040ab27986 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -156,7 +156,8 @@ static inline bool kvm_mmu_page_ad_need_write_protect(struct kvm_mmu_page *sp)
>         return kvm_x86_ops.cpu_dirty_log_size && sp->role.guest_mode;
>  }
>
> -int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
> +int mmu_try_to_unsync_pages(struct kvm_vcpu *vcpu,
> +                           const struct kvm_memory_slot *slot,
>                             gfn_t gfn, bool can_unsync, bool prefetch);
>
>  void kvm_mmu_gfn_disallow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> index 2e09d1b6249f..0e9bc837257e 100644
> --- a/arch/x86/kvm/mmu/page_track.c
> +++ b/arch/x86/kvm/mmu/page_track.c
> @@ -18,6 +18,7 @@
>
>  #include "mmu.h"
>  #include "mmu_internal.h"
> +#include "smm.h"
>
>  bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
>  {
> @@ -171,27 +172,40 @@ void kvm_slot_page_track_remove_page(struct kvm *kvm,
>  }
>  EXPORT_SYMBOL_GPL(kvm_slot_page_track_remove_page);
>
> +static bool __kvm_slot_page_track_is_active(const struct kvm_memory_slot *slot,
> +                                           gfn_t gfn, enum kvm_page_track_mode mode)
> +{
> +       int index;
> +
> +       if (!slot)
> +               return false;
> +
> +       index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
> +       return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
> +}
> +
>  /*
>   * check if the corresponding access on the specified guest page is tracked.
>   */
> -bool kvm_slot_page_track_is_active(struct kvm *kvm,
> +bool kvm_slot_page_track_is_active(struct kvm_vcpu *vcpu,
>                                    const struct kvm_memory_slot *slot,
>                                    gfn_t gfn, enum kvm_page_track_mode mode)
>  {
> -       int index;
> -
>         if (WARN_ON(!page_track_mode_is_valid(mode)))
>                 return false;
>
> -       if (!slot)
> -               return false;
> -
>         if (mode == KVM_PAGE_TRACK_WRITE &&
> -           !kvm_page_track_write_tracking_enabled(kvm))
> +           !kvm_page_track_write_tracking_enabled(vcpu->kvm))
>                 return false;
>
> -       index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
> -       return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
> +       if (__kvm_slot_page_track_is_active(slot, gfn, mode))
> +               return true;
> +
> +       if (!is_smm(vcpu))
> +               return false;
> +
> +       return __kvm_slot_page_track_is_active(gfn_to_memslot(vcpu->kvm, gfn),
> +                                              gfn, mode);
>  }
>
>  void kvm_page_track_cleanup(struct kvm *kvm)
> diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
> index c0fd7e049b4e..89ddd113c1b9 100644
> --- a/arch/x86/kvm/mmu/spte.c
> +++ b/arch/x86/kvm/mmu/spte.c
> @@ -220,7 +220,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>                  * e.g. it's write-tracked (upper-level SPs) or has one or more
>                  * shadow pages and unsync'ing pages is not allowed.
>                  */
> -               if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch)) {
> +               if (mmu_try_to_unsync_pages(vcpu, slot, gfn, can_unsync, prefetch)) {
>                         pgprintk("%s: found shadow page for %llx, marking ro\n",
>                                  __func__, gfn);
>                         wrprot = true;
>
> base-commit: e0ef1f14e97ff65adf6e2157952dbbd1e482065c
> --
>

