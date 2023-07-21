From: Yan Zhao <yan.y.zhao@intel.com>
Date: Fri, 21 Jul 2023 14:26:11 +0800
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
Message-ID: <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:

May I know why KVM now needs to register to callback .change_pte()?
As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
surrounded by .invalidate_range_{start,end}().

While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
to zap all leaf SPTEs, and page fault path will not install new SPTEs
successfully before kvm_mmu_notifier_invalidate_range_end(),
kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
update PFN.

Or could we just delete completely
"kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);"
from kvm_mmu_notifier_change_pte() ?

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6db9ef288ec3..55f03a68f1cd 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1721,7 +1721,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -	kvm_pfn_t pfn = pte_pfn(range->pte);
> +	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
>  
>  	if (!kvm->arch.mmu.pgt)
>  		return false;
> diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
> index e8c08988ed37..7b2ac1319d70 100644
> --- a/arch/mips/kvm/mmu.c
> +++ b/arch/mips/kvm/mmu.c
> @@ -447,7 +447,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	gpa_t gpa = range->start << PAGE_SHIFT;
> -	pte_t hva_pte = range->pte;
> +	pte_t hva_pte = range->arg.pte;
>  	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
>  	pte_t old_pte;
>  
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index f2eb47925806..857f4312b0f8 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -559,7 +559,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	int ret;
> -	kvm_pfn_t pfn = pte_pfn(range->pte);
> +	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
>  
>  	if (!kvm->arch.pgd)
>  		return false;
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..d72f2b20f430 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1588,7 +1588,7 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
>  	for_each_slot_rmap_range(range->slot, PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL,
>  				 range->start, range->end - 1, &iterator)
>  		ret |= handler(kvm, iterator.rmap, range->slot, iterator.gfn,
> -			       iterator.level, range->pte);
> +			       iterator.level, range->arg.pte);
>  
>  	return ret;
>  }
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 512163d52194..6250bd3d20c1 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1241,7 +1241,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
>  	u64 new_spte;
>  
>  	/* Huge pages aren't expected to be modified without first being zapped. */
> -	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
> +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);
>  
>  	if (iter->level != PG_LEVEL_4K ||
>  	    !is_shadow_present_pte(iter->old_spte))
> @@ -1255,9 +1255,9 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
>  	 */
>  	tdp_mmu_iter_set_spte(kvm, iter, 0);
>  
> -	if (!pte_write(range->pte)) {
> +	if (!pte_write(range->arg.pte)) {
>  		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
> -								  pte_pfn(range->pte));
> +								  pte_pfn(range->arg.pte));
>  
>  		tdp_mmu_iter_set_spte(kvm, iter, new_spte);
>  	}
 

