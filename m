From: Binbin Wu <binbin.wu@linux.intel.com>
Date: Tue, 19 Sep 2023 17:01:31 +0800
Subject: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230914015531.1419405-15-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-15-seanjc@google.com>
Message-ID: <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 9/14/2023 9:55 AM, Sean Christopherson wrote:
[...]
> +
> +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
> +				      pgoff_t end)
> +{
> +	struct kvm_memory_slot *slot;
> +	struct kvm *kvm = gmem->kvm;
> +	unsigned long index;
> +	bool flush = false;
> +
> +	KVM_MMU_LOCK(kvm);
> +
> +	kvm_mmu_invalidate_begin(kvm);
> +
> +	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> +		pgoff_t pgoff = slot->gmem.pgoff;
> +
> +		struct kvm_gfn_range gfn_range = {
> +			.start = slot->base_gfn + max(pgoff, start) - pgoff,
> +			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
> +			.slot = slot,
> +			.may_block = true,
> +		};
> +
> +		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
> +	}
> +
> +	if (flush)
> +		kvm_flush_remote_tlbs(kvm);
> +
> +	KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
> +				    pgoff_t end)
> +{
> +	struct kvm *kvm = gmem->kvm;
> +
> +	KVM_MMU_LOCK(kvm);
> +	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT))
> +		kvm_mmu_invalidate_end(kvm);
kvm_mmu_invalidate_begin() is called unconditionally in 
kvm_gmem_invalidate_begin(),
but kvm_mmu_invalidate_end() is not here.
This makes the kvm_gmem_invalidate_{begin, end}() calls asymmetric.


> +	KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
> +{
> +	struct list_head *gmem_list = &inode->i_mapping->private_list;
> +	pgoff_t start = offset >> PAGE_SHIFT;
> +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
> +	struct kvm_gmem *gmem;
> +
> +	/*
> +	 * Bindings must stable across invalidation to ensure the start+end
> +	 * are balanced.
> +	 */
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	list_for_each_entry(gmem, gmem_list, entry) {
> +		kvm_gmem_invalidate_begin(gmem, start, end);
> +		kvm_gmem_invalidate_end(gmem, start, end);
> +	}
Why to loop for each gmem in gmem_list here?

IIUIC, offset is the offset according to the inode, it is only 
meaningful to the
inode passed in, i.e, it is only meaningful to the gmem binding with the 
inode,
not others.


> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	return 0;
> +}
> +
[...]

