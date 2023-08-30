From: Binbin Wu <binbin.wu@linux.intel.com>
Date: Wed, 30 Aug 2023 23:12:19 +0800
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
Message-ID: <30ffe039-c9e2-b996-500d-5e11bf6ea789@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/19/2023 7:44 AM, Sean Christopherson wrote:

[...]
> +
> +static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	/* TODO: Support huge pages. */
> +	folio = filemap_grab_folio(file->f_mapping, index);
> +	if (!folio)
Should use? if ((IS_ERR(folio)) instead.

> +		return NULL;
> +
> +	/*
> +	 * Use the up-to-date flag to track whether or not the memory has been
> +	 * zeroed before being handed off to the guest.  There is no backing
> +	 * storage for the memory, so the folio will remain up-to-date until
> +	 * it's removed.
> +	 *
> +	 * TODO: Skip clearing pages when trusted firmware will do it when
> +	 * assigning memory to the guest.
> +	 */
> +	if (!folio_test_uptodate(folio)) {
> +		unsigned long nr_pages = folio_nr_pages(folio);
> +		unsigned long i;
> +
> +		for (i = 0; i < nr_pages; i++)
> +			clear_highpage(folio_page(folio, i));
> +
> +		folio_mark_uptodate(folio);
> +	}
> +
> +	/*
> +	 * Ignore accessed, referenced, and dirty flags.  The memory is
> +	 * unevictable and there is no storage to write back to.
> +	 */
> +	return folio;
> +}
[...]
> +
> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
> +{
> +	struct address_space *mapping = inode->i_mapping;
> +	pgoff_t start, index, end;
> +	int r;
> +
> +	/* Dedicated guest is immutable by default. */
> +	if (offset + len > i_size_read(inode))
> +		return -EINVAL;
> +
> +	filemap_invalidate_lock_shared(mapping);
> +
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len) >> PAGE_SHIFT;
> +
> +	r = 0;
> +	for (index = start; index < end; ) {
> +		struct folio *folio;
> +
> +		if (signal_pending(current)) {
> +			r = -EINTR;
> +			break;
> +		}
> +
> +		folio = kvm_gmem_get_folio(inode, index);
> +		if (!folio) {
> +			r = -ENOMEM;
> +			break;
> +		}
> +
> +		index = folio_next_index(folio);
> +
> +		folio_unlock(folio);
> +		folio_put(folio);
May be a dumb question, why we get the folio and then put it immediately?
Will it make the folio be released back to the page allocator?

> +
> +		/* 64-bit only, wrapping the index should be impossible. */
> +		if (WARN_ON_ONCE(!index))
> +			break;
> +
> +		cond_resched();
> +	}
> +
> +	filemap_invalidate_unlock_shared(mapping);
> +
> +	return r;
> +}
> +
[...]
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
an extra ',? or maybe around?


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
[...]
> []


