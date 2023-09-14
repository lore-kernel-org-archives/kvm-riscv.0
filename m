From: Ackerley Tng <ackerleytng@google.com>
Date: Thu, 14 Sep 2023 23:19:34 +0000
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZQNN2AyDJ8dF0/6D@google.com>
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
 <ZQNN2AyDJ8dF0/6D@google.com>
Message-ID: <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Aug 28, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
>> >> be independent of the refcounting method. What do you think?
>> >
>> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
>> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
>> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
>> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
>> > objects per HKID too.
>> >
>> > The current SEV use case is for the migration helper, where two KVM objects share
>> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
>> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
>> > that means multiple struct kvm objects being associated with a single HKID.
>> >
>> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
>> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
>> > machine has been destroyed.
>> >
>> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
>> > but not always, is associated 1:1 with a virtual machine.
>> >
>> > And FWIW, stashing the pointer without holding a reference would not be a complete
>> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
>> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
>> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
>> > check.
>> 
>> I agree that inode (physical memory) is coupled to the virtual machine
>> as a more generic concept.
>> 
>> I was hoping that in the absence of CC hardware providing a HKID/ASID,
>> the struct kvm pointer could act as a representation of the "virtual
>> machine". You're definitely right that KVM could reuse a pointer and so
>> that idea doesn't stand.
>> 
>> I thought about generating UUIDs to represent "virtual machines" in the
>> absence of CC hardware, and this UUID could be transferred during
>> intra-host migration, but this still doesn't take host userspace out of
>> the TCB. A malicious host VMM could just use the migration ioctl to copy
>> the UUID to a malicious dumper VM, which would then pass checks with a
>> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
>> because the memory is encrypted; with UUIDs there's no memory
>> encryption.
>
> I don't understand what problem you're trying to solve.  I don't see a need to
> provide a single concrete representation/definition of a "virtual machine".  E.g.
> there's no need for a formal definition to securely perform intrahost migration,
> KVM just needs to ensure that the migration doesn't compromise guest security,
> functionality, etc.
>
> That gets a lot more complex if the target KVM instance (module, not "struct kvm")
> is a different KVM, e.g. when migrating to a different host.  Then there needs to
> be a way to attest that the target is trusted and whatnot, but that still doesn't
> require there to be a formal definition of a "virtual machine".
>
>> Circling back to the original topic, was associating the file with
>> struct kvm at gmem file creation time meant to constrain the use of the
>> gmem file to one struct kvm, or one virtual machine, or something else?
>
> It's meant to keep things as simple as possible (relatively speaking).  A 1:1
> association between a KVM instance and a gmem instance means we don't have to
> worry about the edge cases and oddities I pointed out earlier in this thread.
>

I looked through this thread again and re-read the edge cases and
oddities that was pointed out earlier (last paragraph at [1]) and I
think I understand better, and I have just one last clarification.

It was previously mentioned that binding on creation time simplifies the
lifecycle of memory:

"(a) prevent a different VM from *ever* binding to the gmem instance" [1]

Does this actually mean

"prevent a different struct kvm from *ever* binding to this gmem file"

?

If so, then binding on creation

+ Makes the gmem *file* (and just not the bindings xarray) the binding
  between struct kvm and the file.
+ Simplifies the KVM-userspace contract to "this gmem file can only be
  used with this struct kvm"

Binding on creation doesn't offer any way to block the contents of the
inode from being used with another "virtual machine" though, since we
can have more than one gmem file pointing to the same inode, and the
other gmem file is associated with another struct kvm. (And a strut kvm
isn't associated 1:1 with a virtual machine [2])

The point about an inode needing to be coupled to a virtual machine as a
thing [2] led me to try to find a single concrete representation of a
"virtual machine".

Is locking inode contents to a "virtual machine" outside the scope of
gmem? If so, then it is fine to bind on creation time, use a VM ioctl
over a system ioctl, and the method of refcounting in gmem v12 is okay.

[1] https://lore.kernel.org/lkml/ZNKv9ul2I7A4V7IF at google.com/
[2] https://lore.kernel.org/lkml/ZOO782YGRY0YMuPu at google.com/

> <snip>

