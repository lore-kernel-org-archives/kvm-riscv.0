From: Ackerley Tng <ackerleytng@google.com>
Date: Wed, 30 Aug 2023 16:44:51 +0000
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <30ffe039-c9e2-b996-500d-5e11bf6ea789@linux.intel.com> (message
 from Binbin Wu on Wed, 30 Aug 2023 23:12:19 +0800)
Message-ID: <diqz5y4wfpj0.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Binbin Wu <binbin.wu@linux.intel.com> writes:

>> <snip>
>>
>> +static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>> +{
>> +	struct address_space *mapping = inode->i_mapping;
>> +	pgoff_t start, index, end;
>> +	int r;
>> +
>> +	/* Dedicated guest is immutable by default. */
>> +	if (offset + len > i_size_read(inode))
>> +		return -EINVAL;
>> +
>> +	filemap_invalidate_lock_shared(mapping);
>> +
>> +	start = offset >> PAGE_SHIFT;
>> +	end = (offset + len) >> PAGE_SHIFT;
>> +
>> +	r = 0;
>> +	for (index = start; index < end; ) {
>> +		struct folio *folio;
>> +
>> +		if (signal_pending(current)) {
>> +			r = -EINTR;
>> +			break;
>> +		}
>> +
>> +		folio = kvm_gmem_get_folio(inode, index);
>> +		if (!folio) {
>> +			r = -ENOMEM;
>> +			break;
>> +		}
>> +
>> +		index = folio_next_index(folio);
>> +
>> +		folio_unlock(folio);
>> +		folio_put(folio);
> May be a dumb question, why we get the folio and then put it immediately?
> Will it make the folio be released back to the page allocator?
>

I was wondering this too, but it is correct.

In filemap_grab_folio(), the refcount is incremented in three places:

+ When the folio is created in filemap_alloc_folio(), it is given a
  refcount of 1 in

    filemap_alloc_folio() -> folio_alloc() -> __folio_alloc_node() ->
    __folio_alloc() -> __alloc_pages() -> get_page_from_freelist() ->
    prep_new_page() -> post_alloc_hook() -> set_page_refcounted()

+ Then, in filemap_add_folio(), the refcount is incremented twice:

    + The first is from the filemap (1 refcount per page if this is a
      hugepage):

        filemap_add_folio() -> __filemap_add_folio() -> folio_ref_add()

    + The second is a refcount from the lru list

        filemap_add_folio() -> folio_add_lru() -> folio_get() ->
        folio_ref_inc()

In the other path, if the folio exists in the page cache (filemap), the
refcount is also incremented through

    filemap_grab_folio() -> __filemap_get_folio() -> filemap_get_entry()
    -> folio_try_get_rcu()

I believe all the branches in kvm_gmem_get_folio() are taking a refcount
on the folio while the kernel does some work on the folio like clearing
the folio in clear_highpage() or getting the next index, and then when
done, the kernel does folio_put().

This pattern is also used in shmem and hugetlb. :)

I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
dropping though:

+ The refcount for the filemap depends on whether this is a hugepage or
  not, but folio_put() strictly drops a refcount of 1.
+ The refcount for the lru list is just 1, but doesn't the page still
  remain in the lru list?

>> +
>> +		/* 64-bit only, wrapping the index should be impossible. */
>> +		if (WARN_ON_ONCE(!index))
>> +			break;
>> +
>> +		cond_resched();
>> +	}
>> +
>> +	filemap_invalidate_unlock_shared(mapping);
>> +
>> +	return r;
>> +}
>> +
>>
>> <snip>

