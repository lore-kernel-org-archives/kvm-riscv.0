From: Sean Christopherson <seanjc@google.com>
Date: Tue, 8 Aug 2023 14:13:26 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZNKv9ul2I7A4V7IF@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> I?d like to propose an alternative to the refcounting approach between
> the gmem file and associated kvm, where we think of KVM?s memslots as
> users of the gmem file.
> 
> Instead of having the gmem file pin the VM (i.e. take a refcount on
> kvm), we could let memslot take a refcount on the gmem file when the
> memslots are configured.
> 
> Here?s a POC patch that flips the refcounting (and modified selftests in
> the next commit):
> https://github.com/googleprodkernel/linux-cc/commit/7f487b029b89b9f3e9b094a721bc0772f3c8c797
> 
> One side effect of having the gmem file pin the VM is that now the gmem
> file becomes sort of a false handle on the VM:
> 
> + Closing the file destroys the file pointers in the VM and invalidates
>   the pointers

Yeah, this is less than ideal.  But, it's also how things operate today.  KVM
doesn't hold references to VMAs or files, e.g. if userspace munmap()s memory,
any and all SPTEs pointing at the memory are zapped.  The only difference with
gmem is that KVM needs to explicitly invalidate file pointers, instead of that
happening behind the scenes (no more VMAs to find).  Again, I agree the resulting
code is more complex than I would prefer, but from a userspace perspective I
don't see this as problematic.

> + Keeping the file open keeps the VM around in the kernel even though
>   the VM fd may already be closed.

That is perfectly ok.  There is plenty of prior art, as well as plenty of ways
for userspace to shoot itself in the foot.  E.g. open a stats fd for a vCPU and
the VM and all its vCPUs will be kept alive.  And conceptually it's sound,
anything created in the scope of a VM _should_ pin the VM.

> I feel that memslots form a natural way of managing usage of the gmem
> file. When a memslot is created, it is using the file; hence we take a
> refcount on the gmem file, and as memslots are removed, we drop
> refcounts on the gmem file.

Yes and no.  It's definitely more natural *if* the goal is to allow guest_memfd
memory to exist without being attached to a VM.  But I'm not at all convinced
that we want to allow that, or that it has desirable properties.  With TDX and
SNP in particuarly, I'm pretty sure that allowing memory to outlive the VM is
very underisable (more below).

> The KVM pointer is shared among all the bindings in gmem?s xarray, and we can
> enforce that a gmem file is used only with one VM:
> 
> + When binding a memslot to the file, if a kvm pointer exists, it must
>   be the same kvm as the one in this binding
> + When the binding to the last memslot is removed from a file, NULL the
>   kvm pointer.

Nullifying the KVM pointer isn't sufficient, because without additional actions
userspace could extract data from a VM by deleting its memslots and then binding
the guest_memfd to an attacker controlled VM.  Or more likely with TDX and SNP,
induce badness by coercing KVM into mapping memory into a guest with the wrong
ASID/HKID.

I can think of three ways to handle that:

  (a) prevent a different VM from *ever* binding to the gmem instance
  (b) free/zero physical pages when unbinding
  (c) free/zero when binding to a different VM

Option (a) is easy, but that pretty much defeats the purpose of decopuling
guest_memfd from a VM.

Option (b) isn't hard to implement, but it screws up the lifecycle of the memory,
e.g. would require memory when a memslot is deleted.  That isn't necessarily a
deal-breaker, but it runs counter to how KVM memlots currently operate.  Memslots
are basically just weird page tables, e.g. deleting a memslot doesn't have any
impact on the underlying data in memory.  TDX throws a wrench in this as removing
a page from the Secure EPT is effectively destructive to the data (can't be mapped
back in to the VM without zeroing the data), but IMO that's an oddity with TDX and
not necessarily something we want to carry over to other VM types.

There would also be performance implications (probably a non-issue in practice),
and weirdness if/when we get to sharing, linking and/or mmap()ing gmem.  E.g. what
should happen if the last memslot (binding) is deleted, but there outstanding userspace
mappings?

Option (c) is better from a lifecycle perspective, but it adds its own flavor of
complexity, e.g. the performant way to reclaim TDX memory requires the TDMR
(effectively the VM pointer), and so a deferred relcaim doesn't really work for
TDX.  And I'm pretty sure it *can't* work for SNP, because RMP entries must not
outlive the VM; KVM can't reuse an ASID if there are pages assigned to that ASID
in the RMP, i.e. until all memory belonging to the VM has been fully freed.

> Could binding gmem files not on creation, but at memslot configuration
> time be sufficient and simpler?

After working through the flows, I think binding on-demand would simplify the
refcounting (stating the obvious), but complicate the lifecycle of the memory as
well as the contract between KVM and userspace, and would break the separation of
concerns between the inode (physical memory / data) and file (VM's view / mappings).

