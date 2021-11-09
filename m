From: Sean Christopherson <seanjc@google.com>
Date: Tue, 9 Nov 2021 01:17:39 +0000
Subject: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
In-Reply-To: <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
 <6407c2d3-854b-edf6-9990-b54a5baedd0a@oracle.com>
Message-ID: <YYnMM17yXMq8cCTn@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 09, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
> >   		kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
> >   	}
> > +	/*
> > +	 * Make a full copy of the old memslot, the pointer will become stale
> > +	 * when the memslots are re-sorted by update_memslots(), and the old
> > +	 * memslot needs to be referenced after calling update_memslots(), e.g.
> > +	 * to free its resources and for arch specific behavior.  This needs to
> > +	 * happen *after* (re)acquiring slots_arch_lock.
> > +	 */
> > +	slot = id_to_memslot(slots, new->id);
> > +	if (slot) {
> > +		old = *slot;
> > +	} else {
> > +		WARN_ON_ONCE(change != KVM_MR_CREATE);
> > +		memset(&old, 0, sizeof(old));
> > +		old.id = new->id;
> > +		old.as_id = as_id;
> > +	}
> > +
> > +	/* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> > +	memcpy(&new->arch, &old.arch, sizeof(old.arch));
> 
> Had "new" been zero-initialized completely in __kvm_set_memory_region()
> for safety (so it does not contain stack garbage - I don't mean just the
> new.arch field in the "if (!old.npages)" branch in that function but the
> whole struct) this line would be needed only in the "if (slot)" branch
> above (as Ben said).
> 
> Also, when patch 7 from this series removes this memcpy(),
> kvm_arch_prepare_memory_region() does indeed receive this field
> uninitialized - I know only x86 and ppcHV care
> and kvm_alloc_memslot_metadata() or kvmppc_core_prepare_memory_region_hv()
> then overwrites it unconditionally but it feels a bit wrong.
> 
> I am almost certain that compiler would figure out to only actually
> zero the fields that wouldn't be overwritten immediately anyway.
> 
> But on the other hand, this patch is only a fix for code that's going
> to be replaced anyway so perfection here probably isn't that important.

Yeah, that about sums up my feelings about the existing code.  That said, an
individual memslot isn't _that_ big, and memslot updates without the scalable
implementation are dreadfully slow anyways, so I'm leaning strongly toward your
suggestion of zeroing all of new as part of this fix.

