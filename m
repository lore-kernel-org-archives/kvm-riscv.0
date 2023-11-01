From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 10:51:31 +0000
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZUF8A5KpwpA6IKUH@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com> <ZUF8A5KpwpA6IKUH@google.com>
Message-ID: <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sean,

On Tue, Oct 31, 2023 at 10:13?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Oct 31, 2023, Fuad Tabba wrote:
> > Hi,
> >
> > On Fri, Oct 27, 2023 at 7:23?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > ...
> >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index e2252c748fd6..e82c69d5e755 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6079,6 +6079,15 @@ applied.
> > >  :Parameters: struct kvm_userspace_memory_region2 (in)
> > >  :Returns: 0 on success, -1 on error
> > >
> > > +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> > > +allows mapping guest_memfd memory into a guest.  All fields shared with
> > > +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> > > +flags to have KVM bind the memory region to a given guest_memfd range of
> > > +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
> > > +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
> > > +the target range must not be bound to any other memory region.  All standard
> > > +bounds checks apply (use common sense).
> > > +
> >
> > Bikeshedding here: Not sure if KVM_MEM_PRIVATE is the best name for
> > this. It gets confusing with KVM_MEMORY_ATTRIBUTE_PRIVATE, i.e., that
> > a region marked as KVM_MEM_PRIVATE is only potentially private. It did
> > confuse the rest of the team when I walked them through a previous
> > version of this code once. Would something like KVM_MEM_GUESTMEM make
> > more sense?
>
> Heh, deja vu.  We discussed this back in v7[*], and I came to the conclusion that
> choosing a name that wasn't explicitly tied to private memory wasn't justified.
> But that was before a KVM-owned guest_memfd was even an idea, and thus before we
> had anything close to a real use case.
>
> Since we now know that at least pKVM will use guest_memfd for shared memory, and
> odds are quite good that "regular" VMs will also do the same, i.e. will want
> guest_memfd with the concept of private memory, I agree that we should avoid
> PRIVATE.
>
> Though I vote for KVM_MEM_GUEST_MEMFD (or KVM_MEM_GUEST_MEMFD_VALID or
> KVM_MEM_USE_GUEST_MEMFD).  I.e. do our best to avoid ambiguity between referring
> to "guest memory" at-large and guest_memfd.

Yeah I remember that discussion, but I didn't realize how confusing it
was until I was presenting my work so far to the rest of the team, and
it confused them quite a bit. I'm happy with any of the other
alternatives that you suggest, as long as the distinction is clear.

> > > -See KVM_SET_USER_MEMORY_REGION.
> > > +A KVM_MEM_PRIVATE region _must_ have a valid guest_memfd (private memory) and
> > > +userspace_addr (shared memory).  However, "valid" for userspace_addr simply
> > > +means that the address itself must be a legal userspace address.  The backing
> > > +mapping for userspace_addr is not required to be valid/populated at the time of
> > > +KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
> > > +on-demand.
> >
> > Regarding requiring that a private region have both a valid
> > guest_memfd and a userspace_addr, should this be
> > implementation-specific? In pKVM at least, all regions for protected
> > VMs are private, and KVM doesn't care about the host userspace address
> > for those regions even when part of the memory is shared.
>
> Hmm, as of this patch, no, because the pKVM usage doesn't exist.  E.g.
>
> .  Because this literally documents the current ABI.  When

Ack.

> > > +When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
> > > +userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> > > +state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
> > > +is '0' for all gfns.  Userspace can control whether memory is shared/private by
> > > +toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
> >
> > In pKVM, guest memory is private by default, and most of it will
> > remain so for the lifetime of the VM. Userspace could explicitly mark
> > all the guest's memory as private at initialization, but it would save
> > a slight amount of work. That said, I understand that it might be
> > better to be consistent across implementations.
>
> Yeah, we discussed this in v12[*].  The default really doesn't matter for memory
> overheads or performances once supports range-based xarray entries, and if that
> isn't sufficient, KVM can internally invert the polarity of PRIVATE.
>
> But for the ABI, I think we put a stake in the ground and say that all memory is
> shared by default.  That way CoCo VMs and regular VMs (i.e VMs without the concept
> of private memory) all have the same ABI.  Practically speaking, the cost to pKVM
> (and likely every other CoCo VM type) is a single ioctl() during VM creation to
> "convert" all memory to private.
>
> [*] https://lore.kernel.org/all/ZRw6X2BptZnRPNK7 at google.com

Ack.

...

> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 78a0b09ef2a5..5d1a2f1b4e94 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -798,7 +798,7 @@ void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > >         }
> > >  }
> > >
> > > -static bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> > > +bool kvm_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
> > >  {
> > >         kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> > >         return kvm_unmap_gfn_range(kvm, range);
> > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
> > >  /* This does not remove the slot from struct kvm_memslots data structures */
> > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > >  {
> > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > +               kvm_gmem_unbind(slot);
> > > +
> >
> > Should this be called after kvm_arch_free_memslot()? Arch-specific ode
> > might need some of the data before the unbinding, something I thought
> > might be necessary at one point for the pKVM port when deleting a
> > memslot, but realized later that kvm_invalidate_memslot() ->
> > kvm_arch_guest_memory_reclaimed() was the more logical place for it.
> > Also, since that seems to be the pattern for arch-specific handlers in
> > KVM.
>
> Maybe?  But only if we can about symmetry between the allocation and free paths
> I really don't think kvm_arch_free_memslot() should be doing anything beyond a
> "pure" free.  E.g. kvm_arch_free_memslot() is also called after moving a memslot,
> which hopefully we never actually have to allow for guest_memfd, but any code in
> kvm_arch_free_memslot() would bring about "what if" questions regarding memslot
> movement.  I.e. the API is intended to be a "free arch metadata associated with
> the memslot".
>
> Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_reclaimed()?

It's about the host reclaiming ownership of guest memory when tearing
down a protected guest. In pKVM, we currently teardown the guest and
reclaim its memory when kvm_arch_destroy_vm() is called. The problem
with guestmem is that kvm_gmem_unbind() could get called before that
happens, after which the host might try to access the unbound guest
memory. Since the host hasn't reclaimed ownership of the guest memory
from hyp, hilarity ensues (it crashes).

Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
then I needed to move the unbind later in the function. I realized
later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
the right time), and is more aptly named.

Thanks,
/fuad

