From: Sean Christopherson <seanjc@google.com>
Date: Fri, 12 Nov 2021 01:03:51 +0000
Subject: [PATCH v5.5 23/30] KVM: Resolve memslot ID via a hash table
 instead of via a static array
In-Reply-To: <f0b364ed-bf9e-5de9-0449-6d7ba3682405@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-24-seanjc@google.com>
 <f0b364ed-bf9e-5de9-0449-6d7ba3682405@oracle.com>
Message-ID: <YY29d7Vb6aiv93mu@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > 
> > Memslot ID to the corresponding memslot mappings are currently kept as
> > indices in static id_to_index array.
> > The size of this array depends on the maximum allowed memslot count
> > (regardless of the number of memslots actually in use).
> > 
> > This has become especially problematic recently, when memslot count cap was
> > removed, so the maximum count is now full 32k memslots - the maximum
> > allowed by the current KVM API.
> > 
> > Keeping these IDs in a hash table (instead of an array) avoids this
> > problem.
> > 
> > Resolving a memslot ID to the actual memslot (instead of its index) will
> > also enable transitioning away from an array-based implementation of the
> > whole memslots structure in a later commit.
> > 
> > Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > Co-developed-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   include/linux/kvm_host.h | 16 +++----
> >   virt/kvm/kvm_main.c      | 96 +++++++++++++++++++++++++++++++---------
> >   2 files changed, 84 insertions(+), 28 deletions(-)
> > 
> (..)
> > @@ -1259,17 +1257,49 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
> >   	return 0;
> >   }
> > +static void kvm_replace_memslot(struct kvm_memslots *slots,
> > +				struct kvm_memory_slot *old,
> > +				struct kvm_memory_slot *new)
> > +{
> > +	/*
> > +	 * Remove the old memslot from the hash list, copying the node data
> > +	 * would corrupt the list.
> > +	 */
> > +	if (old) {
> > +		hash_del(&old->id_node);
> > +
> > +		if (!new)
> > +			return;
> > +	}
> > +
> > +	/* Copy the source *data*, not the pointer, to the destination. */
> > +	if (old)
> > +		*new = *old;
> 
> This way of writing it (that, is re-checking whether "old" is not-NULL)
> suggests that it could have been set to NULL inside the previous block
> (since the last check), which isn't true.

Yeah, I think I was trying to minimize the logic delta in future patches, but
looking back at the diffs, that didn't pan out.  I've no objection to folding
the two together.

