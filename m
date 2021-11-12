From: Sean Christopherson <seanjc@google.com>
Date: Fri, 12 Nov 2021 00:51:03 +0000
Subject: [PATCH v5.5 26/30] KVM: Keep memslots in tree-based structures
 instead of array-based ones
In-Reply-To: <5f5c80ce-9189-def3-9c50-d5a504925253@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-27-seanjc@google.com>
 <5f5c80ce-9189-def3-9c50-d5a504925253@oracle.com>
Message-ID: <YY26dxv2kM3m2H7Z@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > -	/*
> > -	 * Remove the old memslot from the hash list and interval tree, copying
> > -	 * the node data would corrupt the structures.
> > -	 */
> > +	int as_id = kvm_memslots_get_as_id(old, new);
> > +	struct kvm_memslots *slots = kvm_get_inactive_memslots(kvm, as_id);
> > +	int idx = slots->node_idx;
> > +
> >   	if (old) {
> > -		hash_del(&old->id_node);
> > -		interval_tree_remove(&old->hva_node, &slots->hva_tree);
> > +		hash_del(&old->id_node[idx]);
> > +		interval_tree_remove(&old->hva_node[idx], &slots->hva_tree);
> > -		if (!new)
> > +		if ((long)old == atomic_long_read(&slots->last_used_slot))
> > +			atomic_long_set(&slots->last_used_slot, (long)new);
> 
> Open-coding cmpxchg() is way less readable than a direct call.

Doh, I meant to call this out and/or add a comment.

My objection to cmpxchg() is that it implies atomicity is required (the kernel's
version adds the lock), which is very much not the case.  So this isn't strictly
an open-coded version of cmpxchg().

> The open-coded version also compiles on x86 to multiple instructions with
> a branch, instead of just a single instruction.

Yeah.  The lock can't be contended, so that part of cmpxchg is a non-issue.  But
that's also why I don't love using cmpxchg.

I don't have a strong preference, I just got briefly confused by the atomicity part.

> > +static void kvm_invalidate_memslot(struct kvm *kvm,
> > +				   struct kvm_memory_slot *old,
> > +				   struct kvm_memory_slot *working_slot)
> > +{
> > +	/*
> > +	 * Mark the current slot INVALID.  As with all memslot modifications,
> > +	 * this must be done on an unreachable slot to avoid modifying the
> > +	 * current slot in the active tree.
> > +	 */
> > +	kvm_copy_memslot(working_slot, old);
> > +	working_slot->flags |= KVM_MEMSLOT_INVALID;
> > +	kvm_replace_memslot(kvm, old, working_slot);
> > +
> > +	/*
> > +	 * Activate the slot that is now marked INVALID, but don't propagate
> > +	 * the slot to the now inactive slots. The slot is either going to be
> > +	 * deleted or recreated as a new slot.
> > +	 */
> > +	kvm_swap_active_memslots(kvm, old->as_id);
> > +
> > +	/*
> > +	 * From this point no new shadow pages pointing to a deleted, or moved,
> > +	 * memslot will be created.  Validation of sp->gfn happens in:
> > +	 *	- gfn_to_hva (kvm_read_guest, gfn_to_pfn)
> > +	 *	- kvm_is_visible_gfn (mmu_check_root)
> > +	 */
> > +	kvm_arch_flush_shadow_memslot(kvm, old);
> 
> This should flush the currently active slot (that is, "working_slot",
> not "old") to not introduce a behavior change with respect to the existing
> code.
> 
> That's also what the previous version of this patch set did.

Eww.  I would much prefer to "fix" the existing code in a prep patch.  It shouldn't
matter, but arch code really should not get passed an INVALID slot.

