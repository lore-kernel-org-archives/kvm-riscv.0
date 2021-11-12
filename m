From: Sean Christopherson <seanjc@google.com>
Date: Fri, 12 Nov 2021 01:05:27 +0000
Subject: [PATCH v5.5 24/30] KVM: Use interval tree to do fast hva lookup
 in memslots
In-Reply-To: <d76707b5-8710-b1a6-0cc6-defdaf9e37b7@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-25-seanjc@google.com>
 <d76707b5-8710-b1a6-0cc6-defdaf9e37b7@oracle.com>
Message-ID: <YY2919Td8f+F4EDr@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > @@ -1262,22 +1274,32 @@ static void kvm_replace_memslot(struct kvm_memslots *slots,
> >   				struct kvm_memory_slot *new)
> >   {
> >   	/*
> > -	 * Remove the old memslot from the hash list, copying the node data
> > -	 * would corrupt the list.
> > +	 * Remove the old memslot from the hash list and interval tree, copying
> > +	 * the node data would corrupt the structures.
> >   	 */
> >   	if (old) {
> >   		hash_del(&old->id_node);
> > +		interval_tree_remove(&old->hva_node, &slots->hva_tree);
> >   		if (!new)
> >   			return;
> >   	}
> > -	/* Copy the source *data*, not the pointer, to the destination. */
> > -	if (old)
> > +	/*
> > +	 * Copy the source *data*, not the pointer, to the destination.  If
> > +	 * @old is NULL, initialize @new's hva range.
> > +	 */
> > +	if (old) {
> >   		*new = *old;
> > +	} else if (new) {
> 
> Unnecessary check - if "new" is NULL then the code will crash anyway
> accessing this pointer unconditionally...
> 
> > +		new->hva_node.start = new->userspace_addr;
> > +		new->hva_node.last = new->userspace_addr +
> > +				     (new->npages << PAGE_SHIFT) - 1;
> > +	}
> >   	/* (Re)Add the new memslot. */
> >   	hash_add(slots->id_hash, &new->id_node, new->id);
> > +	interval_tree_insert(&new->hva_node, &slots->hva_tree);
> 
> ...in these two lines above.

Yep, definitely worthless.  I think this was another "plan for the future" idea
that didn't actually add value.

