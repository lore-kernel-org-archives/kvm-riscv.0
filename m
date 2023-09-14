From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Sep 2023 11:15:52 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZQNN2AyDJ8dF0/6D@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 28, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
> >> be independent of the refcounting method. What do you think?
> >
> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
> > objects per HKID too.
> >
> > The current SEV use case is for the migration helper, where two KVM objects share
> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
> > that means multiple struct kvm objects being associated with a single HKID.
> >
> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
> > machine has been destroyed.
> >
> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
> > but not always, is associated 1:1 with a virtual machine.
> >
> > And FWIW, stashing the pointer without holding a reference would not be a complete
> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
> > check.
> 
> I agree that inode (physical memory) is coupled to the virtual machine
> as a more generic concept.
> 
> I was hoping that in the absence of CC hardware providing a HKID/ASID,
> the struct kvm pointer could act as a representation of the "virtual
> machine". You're definitely right that KVM could reuse a pointer and so
> that idea doesn't stand.
> 
> I thought about generating UUIDs to represent "virtual machines" in the
> absence of CC hardware, and this UUID could be transferred during
> intra-host migration, but this still doesn't take host userspace out of
> the TCB. A malicious host VMM could just use the migration ioctl to copy
> the UUID to a malicious dumper VM, which would then pass checks with a
> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
> because the memory is encrypted; with UUIDs there's no memory
> encryption.

I don't understand what problem you're trying to solve.  I don't see a need to
provide a single concrete representation/definition of a "virtual machine".  E.g.
there's no need for a formal definition to securely perform intrahost migration,
KVM just needs to ensure that the migration doesn't compromise guest security,
functionality, etc.

That gets a lot more complex if the target KVM instance (module, not "struct kvm")
is a different KVM, e.g. when migrating to a different host.  Then there needs to
be a way to attest that the target is trusted and whatnot, but that still doesn't
require there to be a formal definition of a "virtual machine".

> Circling back to the original topic, was associating the file with
> struct kvm at gmem file creation time meant to constrain the use of the
> gmem file to one struct kvm, or one virtual machine, or something else?

It's meant to keep things as simple as possible (relatively speaking).  A 1:1
association between a KVM instance and a gmem instance means we don't have to
worry about the edge cases and oddities I pointed out earlier in this thread.

> Follow up questions:
> 
> 1. Since the physical memory's representation is the inode and should be
>    coupled to the virtual machine (as a concept, not struct kvm), should
>    the binding/coupling be with the file, or the inode?

Both.  The @kvm instance is bound to a file, because the file is that @kvm's view
of the underlying memory, e.g. effectively provides the translation of guest
addresses to host memory.  The @kvm instance is indirectly bound to the inode
because the file is bound to the inode.

> 2. Should struct kvm still be bound to the file/inode at gmem file
>    creation time, since

Yes.

>    + struct kvm isn't a good representation of a "virtual machine"

I don't see how this is relevant, because as above, I don't see why we need a
canonical represenation of a virtual machine.

>    + we currently don't have anything that really represents a "virtual
>      machine" without hardware support

HKIDs and ASIDs don't provide a "virtual machine" representation either.  E.g. if
a TDX guest is live migrated to a different host, it will likely have a different
HKID, and definitely have a different encryption key, but it's still the same
virtual machine.

> I'd also like to bring up another userspace use case that Google has:
> re-use of gmem files for rebooting guests when the KVM instance is
> destroyed and rebuilt.
>
> When rebooting a VM there are some steps relating to gmem that are
> performance-sensitive:

If we (Google) really cared about performance, then we shouldn't destroy and recreate
the VM in the first place.  E.g. the cost of zapping, freeing, re-allocating and
re-populating SPTEs is far from trivial.  Pulling RESET shouldn't change what
memory that is assigned to a VM, and reseting stats is downright bizarre IMO.

In other words, I think Google's approach of destroying the VM to emulate a reboot
is asinine.  I'm not totally against extending KVM's uAPI to play nice with such
an approach, but I'm not exactly sympathetic either.

> a.      Zeroing pages from the old VM when we close a gmem file/inode
> b. Deallocating pages from the old VM when we close a gmem file/inode
> c.   Allocating pages for the new VM from the new gmem file/inode
> d.      Zeroing pages on page allocation
> 
> We want to reuse the gmem file to save re-allocating pages (b. and c.),
> and one of the two page zeroing allocations (a. or d.).
> 
> Binding the gmem file to a struct kvm on creation time means the gmem
> file can't be reused with another VM on reboot.

Not without KVM's assistance, which userspace will need for TDX and SNP VMs no
matter what, e.g. to ensure the new and old KVM instance get the same HKID/ASID.
And we've already mapped out the more complex case of intrahost migration, so I
don't expect this to be at all challenging to implement.

> Also, host userspace is forced to close the gmem file to allow the old VM to
> be freed.

Yes, but that can happen after the "new" VM has instantiated its file/view of
guest memory.

> For other places where files pin KVM, like the stats fd pinning vCPUs, I
> guess that matters less since there isn't much of a penalty to close and
> re-open the stats fd.

