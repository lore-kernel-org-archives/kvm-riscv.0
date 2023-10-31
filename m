From: Sean Christopherson <seanjc@google.com>
Date: Tue, 31 Oct 2023 07:10:08 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZUCe/PGL2Q4OzDOX@chao-email>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUCe/PGL2Q4OzDOX@chao-email>
Message-ID: <ZUEKwOQoibAEWAzU@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 31, 2023, Chao Gao wrote:
> >+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >+{
> >+	loff_t size = args->size;
> >+	u64 flags = args->flags;
> >+	u64 valid_flags = 0;
> >+
> >+	if (flags & ~valid_flags)
> >+		return -EINVAL;
> >+
> >+	if (size < 0 || !PAGE_ALIGNED(size))
> >+		return -EINVAL;
> 
> is size == 0 a valid case?

Nope, this is a bug.

> >+	if (!xa_empty(&gmem->bindings) &&
> >+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> >+		filemap_invalidate_unlock(inode->i_mapping);
> >+		goto err;
> >+	}
> >+
> >+	/*
> >+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> >+	 * be see either a NULL file or this new file, no need for them to go
> >+	 * away.
> >+	 */
> >+	rcu_assign_pointer(slot->gmem.file, file);
> >+	slot->gmem.pgoff = start;
> >+
> >+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> >+	filemap_invalidate_unlock(inode->i_mapping);
> >+
> >+	/*
> >+	 * Drop the reference to the file, even on success.  The file pins KVM,
> >+	 * not the other way 'round.  Active bindings are invalidated if the
> >+	 * file is closed before memslots are destroyed.
> >+	 */
> >+	fput(file);
> >+	return 0;
> >+
> >+err:
> >+	fput(file);
> >+	return -EINVAL;
> 
> The cleanup, i.e., filemap_invalidate_unlock() and fput(), is common. So, I think it
> may be slightly better to consolidate the common part e.g.,

I would prefer to keep this as-is.  Only goto needs the unlock, and I find it easier
to understand the success vs. error paths with explicit returns.  But it's not a
super strong preference.

