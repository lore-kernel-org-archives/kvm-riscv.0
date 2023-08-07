From: Ackerley Tng <ackerleytng@google.com>
Date: Mon, 07 Aug 2023 23:06:45 +0000
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:44:55 -0700)
Message-ID: <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

>   <snip>

> +static int kvm_gmem_release(struct inode *inode, struct file *file)
> +{
> +	struct kvm_gmem *gmem = file->private_data;
> +	struct kvm_memory_slot *slot;
> +	struct kvm *kvm = gmem->kvm;
> +	unsigned long index;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	/*
> +	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> +	 * reference to the file and thus no new bindings can be created, but
> +	 * dereferencing the slot for existing bindings needs to be protected
> +	 * against memslot updates, specifically so that unbind doesn't race
> +	 * and free the memslot (kvm_gmem_get_file() will return NULL).
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +
> +	xa_for_each(&gmem->bindings, index, slot)
> +		rcu_assign_pointer(slot->gmem.file, NULL);
> +
> +	synchronize_rcu();
> +
> +	/*
> +	 * All in-flight operations are gone and new bindings can be created.
> +	 * Zap all SPTEs pointed at by this file.  Do not free the backing
> +	 * memory, as its lifetime is associated with the inode, not the file.
> +	 */
> +	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
> +	kvm_gmem_invalidate_end(gmem, 0, -1ul);
> +
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	list_del(&gmem->entry);
> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	xa_destroy(&gmem->bindings);
> +	kfree(gmem);
> +
> +	kvm_put_kvm(kvm);
> +
> +	return 0;
> +}
> +

> <snip>

> +
> +int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> +		  unsigned int fd, loff_t offset)
> +{
> +	loff_t size = slot->npages << PAGE_SHIFT;
> +	unsigned long start, end, flags;
> +	struct kvm_gmem *gmem;
> +	struct inode *inode;
> +	struct file *file;
> +
> +	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
> +
> +	file = fget(fd);
> +	if (!file)
> +		return -EINVAL;
> +
> +	if (file->f_op != &kvm_gmem_fops)
> +		goto err;
> +
> +	gmem = file->private_data;
> +	if (gmem->kvm != kvm)
> +		goto err;
> +
> +	inode = file_inode(file);
> +	flags = (unsigned long)inode->i_private;
> +
> +	/*
> +	 * For simplicity, require the offset into the file and the size of the
> +	 * memslot to be aligned to the largest possible page size used to back
> +	 * the file (same as the size of the file itself).
> +	 */
> +	if (!kvm_gmem_is_valid_size(offset, flags) ||
> +	    !kvm_gmem_is_valid_size(size, flags))
> +		goto err;
> +
> +	if (offset + size > i_size_read(inode))
> +		goto err;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	start = offset >> PAGE_SHIFT;
> +	end = start + slot->npages;
> +
> +	if (!xa_empty(&gmem->bindings) &&
> +	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> +		filemap_invalidate_unlock(inode->i_mapping);
> +		goto err;
> +	}
> +
> +	/*
> +	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> +	 * be see either a NULL file or this new file, no need for them to go
> +	 * away.
> +	 */
> +	rcu_assign_pointer(slot->gmem.file, file);
> +	slot->gmem.pgoff = start;
> +
> +	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	/*
> +	 * Drop the reference to the file, even on success.  The file pins KVM,
> +	 * not the other way 'round.  Active bindings are invalidated if the
> +	 * file is closed before memslots are destroyed.
> +	 */
> +	fput(file);
> +	return 0;
> +
> +err:
> +	fput(file);
> +	return -EINVAL;
> +}
> +

I?d like to propose an alternative to the refcounting approach between
the gmem file and associated kvm, where we think of KVM?s memslots as
users of the gmem file.

Instead of having the gmem file pin the VM (i.e. take a refcount on
kvm), we could let memslot take a refcount on the gmem file when the
memslots are configured.

Here?s a POC patch that flips the refcounting (and modified selftests in
the next commit):
https://github.com/googleprodkernel/linux-cc/commit/7f487b029b89b9f3e9b094a721bc0772f3c8c797

One side effect of having the gmem file pin the VM is that now the gmem
file becomes sort of a false handle on the VM:

+ Closing the file destroys the file pointers in the VM and invalidates
  the pointers
+ Keeping the file open keeps the VM around in the kernel even though
  the VM fd may already be closed.

I feel that memslots form a natural way of managing usage of the gmem
file. When a memslot is created, it is using the file; hence we take a
refcount on the gmem file, and as memslots are removed, we drop
refcounts on the gmem file.

The KVM pointer is shared among all the bindings in gmem?s xarray, and we can enforce that a gmem file is used only with one VM:

+ When binding a memslot to the file, if a kvm pointer exists, it must
  be the same kvm as the one in this binding
+ When the binding to the last memslot is removed from a file, NULL the
  kvm pointer.

When the VM is freed, KVM will iterate over all the memslots, removing
them one at a time and eventually NULLing the kvm pointer.

I believe the ?KVM?s memslots using the file? approach is also simpler
because all accesses to the bindings xarray and kvm pointer can be
serialized using filemap_invalidate_lock(), and we are already using
this lock regardless of refcounting approach. This serialization means
we don?t need to use RCU on file/kvm pointers since accesses are already
serialized.

There?s also no need to specially clean up the associated KVM when the
file reference close, because by the time the .release() handler is
called, any file references held by memslots would have been dropped,
and so the bindings would have been removed, and the kvm pointer would
have been NULLed out.

The corollary to this approach is that at creation time, the file won?t
be associated with any kvm, and we can use a system ioctl instead of a
VM-specific ioctl as Fuad brought up [1] (Association with kvm before
the file is used with memslots is possible would mean more tracking so
that kvm can close associated files when it is closed.)

One reason for binding gmem files to a specific VM on creation is to
allow (in future) a primary VM to control permissions on the memory for
other files [2]. This permission control can still be enforced with the
?KVM?s memslots using the file? approach. The enforcement rules will
just be delayed till the first binding between a VM and a gmem file.

Could binding gmem files not on creation, but at memslot configuration
time be sufficient and simpler?

[1] https://lore.kernel.org/lkml/CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg at mail.gmail.com/
[2] https://lore.kernel.org/lkml/ZMKlo+Fe8n%2FeLQ82 at google.com/

> <snip>

