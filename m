From: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Aug 2023 12:33:07 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
References: <ZNvaJ3igvcvTZ/8k@google.com> <diqzzg2ktiao.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZOO782YGRY0YMuPu@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 21, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Tue, Aug 15, 2023, Ackerley Tng wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> > Nullifying the KVM pointer isn't sufficient, because without additional actions
> >> > userspace could extract data from a VM by deleting its memslots and then binding
> >> > the guest_memfd to an attacker controlled VM.  Or more likely with TDX and SNP,
> >> > induce badness by coercing KVM into mapping memory into a guest with the wrong
> >> > ASID/HKID.
> >> >
> >> > I can think of three ways to handle that:
> >> >
> >> >   (a) prevent a different VM from *ever* binding to the gmem instance
> >> >   (b) free/zero physical pages when unbinding
> >> >   (c) free/zero when binding to a different VM
> >> >
> >> > Option (a) is easy, but that pretty much defeats the purpose of decopuling
> >> > guest_memfd from a VM.
> >> >
> >> > Option (b) isn't hard to implement, but it screws up the lifecycle of the memory,
> >> > e.g. would require memory when a memslot is deleted.  That isn't necessarily a
> >> > deal-breaker, but it runs counter to how KVM memlots currently operate.  Memslots
> >> > are basically just weird page tables, e.g. deleting a memslot doesn't have any
> >> > impact on the underlying data in memory.  TDX throws a wrench in this as removing
> >> > a page from the Secure EPT is effectively destructive to the data (can't be mapped
> >> > back in to the VM without zeroing the data), but IMO that's an oddity with TDX and
> >> > not necessarily something we want to carry over to other VM types.
> >> >
> >> > There would also be performance implications (probably a non-issue in practice),
> >> > and weirdness if/when we get to sharing, linking and/or mmap()ing gmem.  E.g. what
> >> > should happen if the last memslot (binding) is deleted, but there outstanding userspace
> >> > mappings?
> >> >
> >> > Option (c) is better from a lifecycle perspective, but it adds its own flavor of
> >> > complexity, e.g. the performant way to reclaim TDX memory requires the TDMR
> >> > (effectively the VM pointer), and so a deferred relcaim doesn't really work for
> >> > TDX.  And I'm pretty sure it *can't* work for SNP, because RMP entries must not
> >> > outlive the VM; KVM can't reuse an ASID if there are pages assigned to that ASID
> >> > in the RMP, i.e. until all memory belonging to the VM has been fully freed.

...

> I agree with you that nulling the KVM pointer is insufficient to keep
> host userspace out of the TCB. Among the three options (a) preventing a
> different VM (HKID/ASID) from binding to the gmem instance, or zeroing
> the memory either (b) on unbinding, or (c) on binding to another VM
> (HKID/ASID),
> 
> (a) sounds like adding a check issued to TDX/SNP upon binding and this
>     check would just return OK for software-protected VMs (line of sight
>     to removing host userspace from TCB).
> 
> Or, we could go further for software-protected VMs and add tracking in
> the inode to prevent the same inode from being bound to different
> "HKID/ASID"s, perhaps like this:
> 
> + On first binding, store the KVM pointer in the inode - not file (but
>   not hold a refcount)
> + On rebinding, check that the KVM matches the pointer in the inode
> + On intra-host migration, update the KVM pointer in the inode to allow
>   binding to the new struct kvm
> 
> I think you meant associating the file with a struct kvm at creation
> time as an implementation for (a), but technically since the inode is
> the representation of memory, tracking of struct kvm should be with the
> inode instead of the file.
> 
> (b) You're right that this messes up the lifecycle of the memory and
>     wouldn't work with intra-host migration.
> 
> (c) sounds like doing the clearing on a check similar to that of (a)

Sort of, though it's much nastier, because it requires the "old" KVM instance to
be alive enough to support various operations.  I.e. we'd have to make stronger
guarantees about exactly when the handoff/transition could happen.

> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> be independent of the refcounting method. What do you think?

No go.  Because again, the inode (physical memory) is coupled to the virtual machine
as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
single ASID.  And at some point in the future, I suspect we'll have multiple KVM
objects per HKID too.

The current SEV use case is for the migration helper, where two KVM objects share
a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
that means multiple struct kvm objects being associated with a single HKID.

To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
machine has been destroyed.

To put it differently, "struct kvm" is a KVM software construct that _usually_,
but not always, is associated 1:1 with a virtual machine.

And FWIW, stashing the pointer without holding a reference would not be a complete
solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
struct kvm was unbound and then freed, KVM could reuse the same memory for a new
struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
check.

