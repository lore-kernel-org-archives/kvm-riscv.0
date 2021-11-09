From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:37:45 +0100
Subject: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
In-Reply-To: <20211104002531.1176691-2-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
Message-ID: <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> When modifying memslots, snapshot the "old" memslot and copy it to the
> "new" memslot's arch data after (re)acquiring slots_arch_lock.  x86 can
> change a memslot's arch data while memslot updates are in-progress so
> long as it holds slots_arch_lock, thus snapshotting a memslot without
> holding the lock can result in the consumption of stale data.
> 
> Fixes: b10a038e84d1 ("KVM: mmu: Add slots_arch_lock for memslot arch fields")
> Cc: stable at vger.kernel.org
> Cc: Ben Gardon <bgardon@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 47 ++++++++++++++++++++++++++++++---------------
>   1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3f6d450355f0..99e69375c4c9 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1531,11 +1531,10 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
>   
>   static int kvm_set_memslot(struct kvm *kvm,
>   			   const struct kvm_userspace_memory_region *mem,
> -			   struct kvm_memory_slot *old,
>   			   struct kvm_memory_slot *new, int as_id,
>   			   enum kvm_mr_change change)
>   {
> -	struct kvm_memory_slot *slot;
> +	struct kvm_memory_slot *slot, old;
>   	struct kvm_memslots *slots;
>   	int r;
>   
> @@ -1566,7 +1565,7 @@ static int kvm_set_memslot(struct kvm *kvm,
>   		 * Note, the INVALID flag needs to be in the appropriate entry
>   		 * in the freshly allocated memslots, not in @old or @new.
>   		 */
> -		slot = id_to_memslot(slots, old->id);
> +		slot = id_to_memslot(slots, new->id);
>   		slot->flags |= KVM_MEMSLOT_INVALID;
>   
>   		/*
> @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
>   		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
>   	}
>   
> +	/*
> +	 * Make a full copy of the old memslot, the pointer will become stale
> +	 * when the memslots are re-sorted by update_memslots(), and the old
> +	 * memslot needs to be referenced after calling update_memslots(), e.g.
> +	 * to free its resources and for arch specific behavior.  This needs to
> +	 * happen *after* (re)acquiring slots_arch_lock.
> +	 */
> +	slot = id_to_memslot(slots, new->id);
> +	if (slot) {
> +		old = *slot;
> +	} else {
> +		WARN_ON_ONCE(change != KVM_MR_CREATE);
> +		memset(&old, 0, sizeof(old));
> +		old.id = new->id;
> +		old.as_id = as_id;
> +	}
> +
> +	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> +	memcpy(&new->arch, &old.arch, sizeof(old.arch));

Had "new" been zero-initialized completely in __kvm_set_memory_region()
for safety (so it does not contain stack garbage - I don't mean just the
new.arch field in the "if (!old.npages)" branch in that function but the
whole struct) this line would be needed only in the "if (slot)" branch
above (as Ben said).

Also, when patch 7 from this series removes this memcpy(),
kvm_arch_prepare_memory_region() does indeed receive this field
uninitialized - I know only x86 and ppcHV care
and kvm_alloc_memslot_metadata() or kvmppc_core_prepare_memory_region_hv()
then overwrites it unconditionally but it feels a bit wrong.

I am almost certain that compiler would figure out to only actually
zero the fields that wouldn't be overwritten immediately anyway.

But on the other hand, this patch is only a fix for code that's going
to be replaced anyway so perfection here probably isn't that important.

Thanks,
Maciej

