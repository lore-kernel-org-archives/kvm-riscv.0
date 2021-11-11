From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Fri, 12 Nov 2021 00:52:29 +0100
Subject: [PATCH v5.5 26/30] KVM: Keep memslots in tree-based structures
 instead of array-based ones
In-Reply-To: <20211104002531.1176691-27-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-27-seanjc@google.com>
Message-ID: <5f5c80ce-9189-def3-9c50-d5a504925253@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 
> The current memslot code uses a (reverse gfn-ordered) memslot array for
> keeping track of them.
> 
> Because the memslot array that is currently in use cannot be modified
> every memslot management operation (create, delete, move, change flags)
> has to make a copy of the whole array so it has a scratch copy to work on.
> 
> Strictly speaking, however, it is only necessary to make copy of the
> memslot that is being modified, copying all the memslots currently present
> is just a limitation of the array-based memslot implementation.
> 
> Two memslot sets, however, are still needed so the VM continues to run
> on the currently active set while the requested operation is being
> performed on the second, currently inactive one.
> 
> In order to have two memslot sets, but only one copy of actual memslots
> it is necessary to split out the memslot data from the memslot sets.
> 
> The memslots themselves should be also kept independent of each other
> so they can be individually added or deleted.
> 
> These two memslot sets should normally point to the same set of
> memslots. They can, however, be desynchronized when performing a
> memslot management operation by replacing the memslot to be modified
> by its copy.  After the operation is complete, both memslot sets once
> again point to the same, common set of memslot data.
> 
> This commit implements the aforementioned idea.
> 
> For tracking of gfns an ordinary rbtree is used since memslots cannot
> overlap in the guest address space and so this data structure is
> sufficient for ensuring that lookups are done quickly.
> 
> The "last used slot" mini-caches (both per-slot set one and per-vCPU one),
> that keep track of the last found-by-gfn memslot, are still present in the
> new code.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/mmu.c                |   8 +-
>   arch/powerpc/kvm/book3s_64_mmu_hv.c |   4 +-
>   arch/powerpc/kvm/book3s_hv.c        |   3 +-
>   arch/powerpc/kvm/book3s_hv_nested.c |   4 +-
>   arch/powerpc/kvm/book3s_hv_uvmem.c  |  14 +-
>   arch/s390/kvm/kvm-s390.c            |  24 +-
>   arch/s390/kvm/kvm-s390.h            |   6 +-
>   arch/x86/kvm/debugfs.c              |   6 +-
>   arch/x86/kvm/mmu/mmu.c              |   8 +-
>   include/linux/kvm_host.h            | 141 +++--
>   virt/kvm/kvm_main.c                 | 809 ++++++++++++++--------------
>   11 files changed, 524 insertions(+), 503 deletions(-)
> 
(..)
> +/*
> + * Replace @old with @new in the inactive memslots.
> + *
> + * With NULL @old this simply adds @new.
> + * With NULL @new this simply removes @old.
> + *
> + * If @new is non-NULL its hva_node[slots_idx] range has to be set
> + * appropriately.
> + */
> +static void kvm_replace_memslot(struct kvm *kvm,
>   				struct kvm_memory_slot *old,
>   				struct kvm_memory_slot *new)
>   {
> -	/*
> -	 * Remove the old memslot from the hash list and interval tree, copying
> -	 * the node data would corrupt the structures.
> -	 */
> +	int as_id = kvm_memslots_get_as_id(old, new);
> +	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
> +	int idx = slots->node_idx;
> +
>   	if (old) {
> -		hash_del(&old->id_node);
> -		interval_tree_remove(&old->hva_node, &slots->hva_tree);
> +		hash_del(&old->id_node[idx]);
> +		interval_tree_remove(&old->hva_node[idx], &slots->hva_tree);
>   
> -		if (!new)
> +		if ((long)old == atomic_long_read(&slots->last_used_slot))
> +			atomic_long_set(&slots->last_used_slot, (long)new);

Open-coding cmpxchg() is way less readable than a direct call.

The open-coded version also compiles on x86 to multiple instructions with
a branch, instead of just a single instruction.

> +static void kvm_invalidate_memslot(struct kvm *kvm,
> +				   struct kvm_memory_slot *old,
> +				   struct kvm_memory_slot *working_slot)
> +{
> +	/*
> +	 * Mark the current slot INVALID.  As with all memslot modifications,
> +	 * this must be done on an unreachable slot to avoid modifying the
> +	 * current slot in the active tree.
> +	 */
> +	kvm_copy_memslot(working_slot, old);
> +	working_slot->flags |= KVM_MEMSLOT_INVALID;
> +	kvm_replace_memslot(kvm, old, working_slot);
> +
> +	/*
> +	 * Activate the slot that is now marked INVALID, but don't propagate
> +	 * the slot to the now inactive slots. The slot is either going to be
> +	 * deleted or recreated as a new slot.
> +	 */
> +	kvm_swap_active_memslots(kvm, old->as_id);
> +
> +	/*
> +	 * From this point no new shadow pages pointing to a deleted, or moved,
> +	 * memslot will be created.  Validation of sp->gfn happens in:
> +	 *	- gfn_to_hva (kvm_read_guest, gfn_to_pfn)
> +	 *	- kvm_is_visible_gfn (mmu_check_root)
> +	 */
> +	kvm_arch_flush_shadow_memslot(kvm, old);

This should flush the currently active slot (that is, "working_slot",
not "old") to not introduce a behavior change with respect to the existing
code.

That's also what the previous version of this patch set did.

Thanks,
Maciej

