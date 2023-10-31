From: Chao Gao <chao.gao@intel.com>
Date: Tue, 31 Oct 2023 14:30:20 +0800
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
Message-ID: <ZUCe/PGL2Q4OzDOX@chao-email>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>+{
>+	loff_t size = args->size;
>+	u64 flags = args->flags;
>+	u64 valid_flags = 0;
>+
>+	if (flags & ~valid_flags)
>+		return -EINVAL;
>+
>+	if (size < 0 || !PAGE_ALIGNED(size))
>+		return -EINVAL;

is size == 0 a valid case?

>+int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>+		  unsigned int fd, loff_t offset)
>+{
>+	loff_t size = slot->npages << PAGE_SHIFT;
>+	unsigned long start, end;
>+	struct kvm_gmem *gmem;
>+	struct inode *inode;
>+	struct file *file;
>+
>+	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
>+
>+	file = fget(fd);
>+	if (!file)
>+		return -EBADF;
>+
>+	if (file->f_op != &kvm_gmem_fops)
>+		goto err;
>+
>+	gmem = file->private_data;
>+	if (gmem->kvm != kvm)
>+		goto err;
>+
>+	inode = file_inode(file);
>+
>+	if (offset < 0 || !PAGE_ALIGNED(offset))
>+		return -EINVAL;

		goto err;

or hoist the check above fget().

>+
>+	if (offset + size > i_size_read(inode))
>+		goto err;
>+
>+	filemap_invalidate_lock(inode->i_mapping);
>+
>+	start = offset >> PAGE_SHIFT;
>+	end = start + slot->npages;
>+
>+	if (!xa_empty(&gmem->bindings) &&
>+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
>+		filemap_invalidate_unlock(inode->i_mapping);
>+		goto err;
>+	}
>+
>+	/*
>+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
>+	 * be see either a NULL file or this new file, no need for them to go
>+	 * away.
>+	 */
>+	rcu_assign_pointer(slot->gmem.file, file);
>+	slot->gmem.pgoff = start;
>+
>+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
>+	filemap_invalidate_unlock(inode->i_mapping);
>+
>+	/*
>+	 * Drop the reference to the file, even on success.  The file pins KVM,
>+	 * not the other way 'round.  Active bindings are invalidated if the
>+	 * file is closed before memslots are destroyed.
>+	 */
>+	fput(file);
>+	return 0;
>+
>+err:
>+	fput(file);
>+	return -EINVAL;

The cleanup, i.e., filemap_invalidate_unlock() and fput(), is common. So, I think it
may be slightly better to consolidate the common part e.g.,

	int ret = -EINVAL;

	...

	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
	ret = 0;
unlock:
	filemap_invalidate_unlock(inode->i_mapping);
err:
	/*
	 * Drop the reference to the file, even on success.  The file pins KVM,
	 * not the other way 'round.  Active bindings are invalidated if the
	 * file is closed before memslots are destroyed.
	 */
	fput(file);
	return ret;

