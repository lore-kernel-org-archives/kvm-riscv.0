From: Sean Christopherson <seanjc@google.com>
Date: Thu, 27 Jul 2023 10:13:07 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com>
Message-ID: <ZMKlo+Fe8n/eLQ82@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023, Fuad Tabba wrote:
> Hi Sean,
> 
> <snip>
> ...
> 
> > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> >         case KVM_GET_STATS_FD:
> >                 r = kvm_vm_ioctl_get_stats_fd(kvm);
> >                 break;
> > +       case KVM_CREATE_GUEST_MEMFD: {
> > +               struct kvm_create_guest_memfd guest_memfd;
> > +
> > +               r = -EFAULT;
> > +               if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> > +                       goto out;
> > +
> > +               r = kvm_gmem_create(kvm, &guest_memfd);
> > +               break;
> > +       }
> 
> I'm thinking line of sight here, by having this as a vm ioctl (rather
> than a system iocl), would it complicate making it possible in the
> future to share/donate memory between VMs?

Maybe, but I hope not?

There would still be a primary owner of the memory, i.e. the memory would still
need to be allocated in the context of a specific VM.  And the primary owner should
be able to restrict privileges, e.g. allow a different VM to read but not write
memory.

My current thinking is to (a) tie the lifetime of the backing pages to the inode,
i.e. allow allocations to outlive the original VM, and (b) create a new file each
time memory is shared/donated with a different VM (or other entity in the kernel).

That should make it fairly straightforward to provide different permissions, e.g.
track them per-file, and I think should also avoid the need to change the memslot
binding logic since each VM would have it's own view/bindings.

Copy+pasting a relevant snippet from a lengthier response in a different thread[*]:

  Conceptually, I think KVM should to bind to the file.  The inode is effectively
  the raw underlying physical storage, while the file is the VM's view of that
  storage. 
  
  Practically, I think that gives us a clean, intuitive way to handle intra-host
  migration.  Rather than transfer ownership of the file, instantiate a new file
  for the target VM, using the gmem inode from the source VM, i.e. create a hard
  link.  That'd probably require new uAPI, but I don't think that will be hugely
  problematic.  KVM would need to ensure the new VM's guest_memfd can't be mapped
  until KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM (which would also need to verify the
  memslots/bindings are identical), but that should be easy enough to enforce.
  
  That way, a VM, its memslots, and its SPTEs are tied to the file, while allowing
  the memory and the *contents* of memory to outlive the VM, i.e. be effectively
  transfered to the new target VM.  And we'll maintain the invariant that each
  guest_memfd is bound 1:1 with a single VM.
  
  As above, that should also help us draw the line between mapping memory into a
  VM (file), and freeing/reclaiming the memory (inode).
  
  There will be extra complexity/overhead as we'll have to play nice with the
  possibility of multiple files per inode, e.g. to zap mappings across all files
  when punching a hole, but the extra complexity is quite small, e.g. we can use
  address_space.private_list to keep track of the guest_memfd instances associated
  with the inode.
  
  Setting aside TDX and SNP for the moment, as it's not clear how they'll support
  memory that is "private" but shared between multiple VMs, I think per-VM files
  would work well for sharing gmem between two VMs.  E.g. would allow a give page
  to be bound to a different gfn for each VM, would allow having different permissions
  for each file (e.g. to allow fallocate() only from the original owner).

[*] https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS at google.com

