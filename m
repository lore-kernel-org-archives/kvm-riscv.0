From: Sean Christopherson <seanjc@google.com>
Date: Wed, 1 Nov 2023 14:55:46 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
Message-ID: <ZULJYg5cf1UrNq3e@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 01, 2023, Fuad Tabba wrote:
> > > > @@ -1034,6 +1034,9 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
> > > >  /* This does not remove the slot from struct kvm_memslots data structures */
> > > >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > > >  {
> > > > +       if (slot->flags & KVM_MEM_PRIVATE)
> > > > +               kvm_gmem_unbind(slot);
> > > > +
> > >
> > > Should this be called after kvm_arch_free_memslot()? Arch-specific ode
> > > might need some of the data before the unbinding, something I thought
> > > might be necessary at one point for the pKVM port when deleting a
> > > memslot, but realized later that kvm_invalidate_memslot() ->
> > > kvm_arch_guest_memory_reclaimed() was the more logical place for it.
> > > Also, since that seems to be the pattern for arch-specific handlers in
> > > KVM.
> >
> > Maybe?  But only if we can about symmetry between the allocation and free paths
> > I really don't think kvm_arch_free_memslot() should be doing anything beyond a
> > "pure" free.  E.g. kvm_arch_free_memslot() is also called after moving a memslot,
> > which hopefully we never actually have to allow for guest_memfd, but any code in
> > kvm_arch_free_memslot() would bring about "what if" questions regarding memslot
> > movement.  I.e. the API is intended to be a "free arch metadata associated with
> > the memslot".
> >
> > Out of curiosity, what does pKVM need to do at kvm_arch_guest_memory_reclaimed()?
> 
> It's about the host reclaiming ownership of guest memory when tearing
> down a protected guest. In pKVM, we currently teardown the guest and
> reclaim its memory when kvm_arch_destroy_vm() is called. The problem
> with guestmem is that kvm_gmem_unbind() could get called before that
> happens, after which the host might try to access the unbound guest
> memory. Since the host hasn't reclaimed ownership of the guest memory
> from hyp, hilarity ensues (it crashes).
> 
> Initially, I hooked reclaim guest memory to kvm_free_memslot(), but
> then I needed to move the unbind later in the function. I realized
> later that kvm_arch_guest_memory_reclaimed() gets called earlier (at
> the right time), and is more aptly named.

Aha!  I suspected that might be the case.

TDX and SNP also need to solve the same problem of "reclaiming" memory before it
can be safely accessed by the host.  The plan is to add an arch hook (or two?)
into guest_memfd that is invoked when memory is freed from guest_memfd.

Hooking kvm_arch_guest_memory_reclaimed() isn't completely correct as deleting a
memslot doesn't *guarantee* that guest memory is actually reclaimed (which reminds
me, we need to figure out a better name for that thing before introducing
kvm_arch_gmem_invalidate()).

The effective false positives aren't fatal for the current usage because the hook
is used only for x86 SEV guests to flush caches.  An unnecessary flush can cause
performance issues, but it doesn't affect correctness. For TDX and SNP, and IIUC
pKVM, false positives are fatal because KVM could assign memory back to the host
that is still owned by guest_memfd.

E.g. a misbehaving userspace could prematurely delete a memslot.  And the more
fun example is intrahost migration, where the plan is to allow pointing multiple
guest_memfd files at a single guest_memfd inode:
https://lore.kernel.org/all/cover.1691446946.git.ackerleytng at google.com

There was a lot of discussion for this, but it's scattered all over the place.
The TL;DR is is that the inode will represent physical memory, and a file will
represent a given "struct kvm" instance's view of that memory.  And so the memory
isn't reclaimed until the inode is truncated/punched.

I _think_ this reflects the most recent plan from the guest_memfd side:
https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.1689893403.git.isaku.yamahata at intel.com

