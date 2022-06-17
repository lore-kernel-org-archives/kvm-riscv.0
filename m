From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 19:08:10 +0000
Subject: [PATCH v6 22/22] KVM: x86/mmu: Extend Eager Page Splitting to
 nested MMUs
In-Reply-To: <20220516232138.1783324-23-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-23-dmatlack@google.com>
Message-ID: <YqzRGj6ryBZfGBSl@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> +	/*
> +	 * Memory cache used to allocate pte_list_desc structs while splitting
> +	 * huge pages. In the worst case, to split one huge page, 512
> +	 * pte_list_desc structs are needed to add each lower level leaf sptep
> +	 * to the rmap plus 1 to extend the parent_ptes rmap of the lower level
> +	 * page table.
> +	 *
> +	 * Protected by kvm->slots_lock.
> +	 */
> +#define SPLIT_DESC_CACHE_CAPACITY 513

I would strongly prefer to programmaticaly define this (note that SPTE_ENT_PER_PAGE
doesn't yet exist in kvm/queue, but hopefully will by the time you rebase; it's
PT64_ENT_PER_PAGE at the moment).  And I think we should define the min number of
objects separately from the capacity (see below).

	/*
	 * Memory cache used to allocate pte_list_desc structs while splitting
	 * huge pages.  In the worst case, to split one huge page, a struct will
	 * be needed to rmap every possible new child SPTE, plus one to extend
	 * the parent_ptes rmap of the newly create page table.
	 */
#define SPLIT_DESC_CACHE_MIN_NR_OBJECTS (SPTE_ENT_PER_PAGE + 1)

> +	struct kvm_mmu_memory_cache split_desc_cache;
>  };
>  

...

> +static int topup_split_caches(struct kvm *kvm)
> +{
> +     int r;
> +
> +     lockdep_assert_held(&kvm->slots_lock);
> +
> +     r = __kvm_mmu_topup_memory_cache(&kvm->arch.split_desc_cache,
> +                                      SPLIT_DESC_CACHE_CAPACITY,
> +                                      SPLIT_DESC_CACHE_CAPACITY);

min==capacity will be inefficient as consuming just one object from the cache
will force KVM to drop mmu_lock and topup the cache.

2*min seems like the logical choice.  Presumably it's common to need all 513
objects when splitting a page, so that at least lets KVM handle two huge pages
without having to drop mmu_lock.

> +     if (r)
> +             return r;
> +
> +     r = kvm_mmu_topup_memory_cache(&kvm->arch.split_page_header_cache, 1);
> +     if (r)
> +             return r;
> +
> +     return kvm_mmu_topup_memory_cache(&kvm->arch.split_shadow_page_cache, 1);
> +}

...

> @@ -6097,15 +6106,252 @@ void kvm_mmu_slot_remove_write_access(struct kvm *kvm,
>  		kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
>  }
>  
> +void free_split_caches(struct kvm *kvm)

This should be prefixed with kvm_mmu_, and since it's short, make it more explicit:

void kvm_mmu_free_eager_page_split_caches(struct kvm *kvm)

> +{
> +	lockdep_assert_held(&kvm->slots_lock);
> +
> +	kvm_mmu_free_memory_cache(&kvm->arch.split_desc_cache);
> +	kvm_mmu_free_memory_cache(&kvm->arch.split_page_header_cache);
> +	kvm_mmu_free_memory_cache(&kvm->arch.split_shadow_page_cache);
> +}
> +

...

> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 04812eaaf61b..4fe018ddd1cd 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12197,6 +12197,12 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
>  		 * page faults will create the large-page sptes.
>  		 */
>  		kvm_mmu_zap_collapsible_sptes(kvm, new);
> +
> +		/*
> +		 * Free any memory left behind by eager page splitting. Ignore
> +		 * the module parameter since userspace might have changed it.
> +		 */
> +		free_split_caches(kvm);

Freeing the caches only in kvm_mmu_slot_apply_flags() will leak memory, and the
kmem_cache code will yell about objects being in the cache when the global caches
are destroyed by mmu_destroy_caches().  When KVM destroys a VM, it directly frees
the memslots without updating struct kvm_memslots; see kvm_free_memslot().

kvm_mmu_uninit_vm() is probably the best landing spot even though it's called
before memslots are freed.  The VM is unreachable so nothing can be triggerring
page splitting.

All that said, I don't know that I agree that kvm_mmu_slot_apply_flags() is the
right place to free the caches.  I agree that _most_ use cases will toggle dirty
logging on all memslots, but I don't know that that holds true for _all_ use
cases as dirty logging is used for things other than live migration.

Even if we expand the capacity of the pte_list_desc cache (see below), at worst,
it's still less than 16kb of memory per VM, i.e. quite small.  And if the host is
under memory pressure, KVM really should purge the caches in mmu_shrink_scan().

I know we proposed dropping mmu_shrink_scan(), but the more I think about that,
the more I think that an outright drop is wrong.  The real issue is that KVM as
quite literally the dumbest possible "algorithm" for zapping possibly-in-use
shadow pages, and doesn't target the zapping to fit the cgroup that's under
pressure.

So for this, IMO rather than assume that freeing the caches when any memslot
disables dirty logging, I think it makes sense to initially keep the caches and
only free them at VM destruction.  Then in follow-up patches, if we want, free
the caches in the mmu_shrink_scan(), and/or add a function hook for toggling
eager_page_split to topup/free the caches accordingly.  That gives userspace
explicit control over when the caches are purged, and does the logical thing of
freeing the caches when eager_page_split is disabled.

>  	} else {
>  		/*
>  		 * Initially-all-set does not require write protecting any page,
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f94f72bbd2d3..17fc9247504d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1336,6 +1336,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm);
>  
>  #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>  int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
> +int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min);
>  int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc);
>  void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
>  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5e2e75014256..b9573e958a03 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -369,7 +369,7 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
>  		return (void *)__get_free_page(gfp_flags);
>  }
>  
> -static int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
> +int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)

+1 to Ricardo's feedback, expose this function in patch 21.

