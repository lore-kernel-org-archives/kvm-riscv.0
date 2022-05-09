From: Sean Christopherson <seanjc@google.com>
Date: Mon, 9 May 2022 16:48:12 +0000
Subject: [PATCH v4 20/20] KVM: x86/mmu: Extend Eager Page Splitting to
 nested MMUs
In-Reply-To: <20220422210546.458943-21-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-21-dmatlack@google.com>
Message-ID: <YnlFzMpJZNfFuFic@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> +static bool need_topup_split_caches_or_resched(struct kvm *kvm)
> +{
> +	if (need_resched() || rwlock_needbreak(&kvm->mmu_lock))
> +		return true;
> +
> +	/*
> +	 * In the worst case, SPLIT_DESC_CACHE_CAPACITY descriptors are needed
> +	 * to split a single huge page. Calculating how many are actually needed
> +	 * is possible but not worth the complexity.
> +	 */
> +	return need_topup(&kvm->arch.split_desc_cache, SPLIT_DESC_CACHE_CAPACITY) ||
> +		need_topup(&kvm->arch.split_page_header_cache, 1) ||
> +		need_topup(&kvm->arch.split_shadow_page_cache, 1);

Uber nit that Paolo will make fun of me for... please align indentiation

	return need_topup(&kvm->arch.split_desc_cache, SPLIT_DESC_CACHE_CAPACITY) ||
	       need_topup(&kvm->arch.split_page_header_cache, 1) ||
	       need_topup(&kvm->arch.split_shadow_page_cache, 1);

> +static void nested_mmu_split_huge_page(struct kvm *kvm,
> +				       const struct kvm_memory_slot *slot,
> +				       u64 *huge_sptep)
> +
> +{
> +	struct kvm_mmu_memory_cache *cache = &kvm->arch.split_desc_cache;
> +	u64 huge_spte = READ_ONCE(*huge_sptep);
> +	struct kvm_mmu_page *sp;
> +	bool flush = false;
> +	u64 *sptep, spte;
> +	gfn_t gfn;
> +	int index;
> +
> +	sp = nested_mmu_get_sp_for_split(kvm, huge_sptep);
> +
> +	for (index = 0; index < PT64_ENT_PER_PAGE; index++) {
> +		sptep = &sp->spt[index];
> +		gfn = kvm_mmu_page_get_gfn(sp, index);
> +
> +		/*
> +		 * The SP may already have populated SPTEs, e.g. if this huge
> +		 * page is aliased by multiple sptes with the same access
> +		 * permissions. These entries are guaranteed to map the same
> +		 * gfn-to-pfn translation since the SP is direct, so no need to
> +		 * modify them.
> +		 *
> +		 * However, if a given SPTE points to a lower level page table,
> +		 * that lower level page table may only be partially populated.
> +		 * Installing such SPTEs would effectively unmap a potion of the
> +		 * huge page, which requires a TLB flush.

Maybe explain why a TLB flush is required?  E.g. "which requires a TLB flush as
a subsequent mmu_notifier event on the unmapped region would fail to detect the
need to flush".

> +static bool nested_mmu_skip_split_huge_page(u64 *huge_sptep)

"skip" is kinda odd terminology.  It reads like a command, but it's actually
querying state _and_ it's returning a boolean, which I've learned to hate :-)

I don't see any reason for a helper, there's one caller and it can just do
"continue" directly.

> +static void kvm_nested_mmu_try_split_huge_pages(struct kvm *kvm,
> +						const struct kvm_memory_slot *slot,
> +						gfn_t start, gfn_t end,
> +						int target_level)
> +{
> +	int level;
> +
> +	/*
> +	 * Split huge pages starting with KVM_MAX_HUGEPAGE_LEVEL and working
> +	 * down to the target level. This ensures pages are recursively split
> +	 * all the way to the target level. There's no need to split pages
> +	 * already at the target level.
> +	 */
> +	for (level = KVM_MAX_HUGEPAGE_LEVEL; level > target_level; level--) {

Unnecessary braces.
> +		slot_handle_level_range(kvm, slot,
> +					nested_mmu_try_split_huge_pages,
> +					level, level, start, end - 1,
> +					true, false);

IMO it's worth running over by 4 chars to drop 2 lines:

	for (level = KVM_MAX_HUGEPAGE_LEVEL; level > target_level; level--)
		slot_handle_level_range(kvm, slot, nested_mmu_try_split_huge_pages,
					level, level, start, end - 1, true, false);
> +	}
> +}
> +
>  /* Must be called with the mmu_lock held in write-mode. */

Add a lockdep assertion, not a comment.

>  void kvm_mmu_try_split_huge_pages(struct kvm *kvm,
>  				   const struct kvm_memory_slot *memslot,
>  				   u64 start, u64 end,
>  				   int target_level)
>  {
> -	if (is_tdp_mmu_enabled(kvm))
> -		kvm_tdp_mmu_try_split_huge_pages(kvm, memslot, start, end,
> -						 target_level, false);
> +	if (!is_tdp_mmu_enabled(kvm))
> +		return;
> +
> +	kvm_tdp_mmu_try_split_huge_pages(kvm, memslot, start, end, target_level,
> +					 false);
> +
> +	if (kvm_memslots_have_rmaps(kvm))
> +		kvm_nested_mmu_try_split_huge_pages(kvm, memslot, start, end,
> +						    target_level);
>  
>  	/*
>  	 * A TLB flush is unnecessary at this point for the same resons as in
> @@ -6051,10 +6304,19 @@ void kvm_mmu_slot_try_split_huge_pages(struct kvm *kvm,
>  	u64 start = memslot->base_gfn;
>  	u64 end = start + memslot->npages;
>  
> -	if (is_tdp_mmu_enabled(kvm)) {
> -		read_lock(&kvm->mmu_lock);
> -		kvm_tdp_mmu_try_split_huge_pages(kvm, memslot, start, end, target_level, true);
> -		read_unlock(&kvm->mmu_lock);
> +	if (!is_tdp_mmu_enabled(kvm))
> +		return;
> +
> +	read_lock(&kvm->mmu_lock);
> +	kvm_tdp_mmu_try_split_huge_pages(kvm, memslot, start, end, target_level,
> +					 true);

Eh, let this poke out.

> +	read_unlock(&kvm->mmu_lock);
> +
> +	if (kvm_memslots_have_rmaps(kvm)) {
> +		write_lock(&kvm->mmu_lock);
> +		kvm_nested_mmu_try_split_huge_pages(kvm, memslot, start, end,
> +						    target_level);
> +		write_unlock(&kvm->mmu_lock);

Super duper nit: all other flows do rmaps first, than TDP MMU.  Might as well keep
that ordering here, otherwise it suggests there's a reason to be different.

>  	}
>  
>  	/*
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ab336f7c82e4..e123e24a130f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12161,6 +12161,12 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
>  		 * page faults will create the large-page sptes.
>  		 */
>  		kvm_mmu_zap_collapsible_sptes(kvm, new);
> +
> +		/*
> +		 * Free any memory left behind by eager page splitting. Ignore
> +		 * the module parameter since userspace might have changed it.
> +		 */
> +		free_split_caches(kvm);
>  	} else {
>  		/*
>  		 * Initially-all-set does not require write protecting any page,
> -- 
> 2.36.0.rc2.479.g8af0fa9b8e-goog
> 

