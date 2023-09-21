From: Binbin Wu <binbin.wu@linux.intel.com>
Date: Thu, 21 Sep 2023 13:58:00 +0800
Subject: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZQsAiGuw/38jIOV7@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-15-seanjc@google.com>
 <e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com>
 <ZQsAiGuw/38jIOV7@google.com>
Message-ID: <f9ca9457-ca64-484c-7306-97a3236210da@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 9/20/2023 10:24 PM, Sean Christopherson wrote:
> On Tue, Sep 19, 2023, Binbin Wu wrote:
>>
>> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
>> [...]
>>> +
>>> +static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
>>> +				      pgoff_t end)
>>> +{
>>> +	struct kvm_memory_slot *slot;
>>> +	struct kvm *kvm = gmem->kvm;
>>> +	unsigned long index;
>>> +	bool flush = false;
>>> +
>>> +	KVM_MMU_LOCK(kvm);
>>> +
>>> +	kvm_mmu_invalidate_begin(kvm);
>>> +
>>> +	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
>>> +		pgoff_t pgoff = slot->gmem.pgoff;
>>> +
>>> +		struct kvm_gfn_range gfn_range = {
>>> +			.start = slot->base_gfn + max(pgoff, start) - pgoff,
>>> +			.end = slot->base_gfn + min(pgoff + slot->npages, end) - pgoff,
>>> +			.slot = slot,
>>> +			.may_block = true,
>>> +		};
>>> +
>>> +		flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
>>> +	}
>>> +
>>> +	if (flush)
>>> +		kvm_flush_remote_tlbs(kvm);
>>> +
>>> +	KVM_MMU_UNLOCK(kvm);
>>> +}
>>> +
>>> +static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
>>> +				    pgoff_t end)
>>> +{
>>> +	struct kvm *kvm = gmem->kvm;
>>> +
>>> +	KVM_MMU_LOCK(kvm);
>>> +	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT))
>>> +		kvm_mmu_invalidate_end(kvm);
>> kvm_mmu_invalidate_begin() is called unconditionally in
>> kvm_gmem_invalidate_begin(),
>> but kvm_mmu_invalidate_end() is not here.
>> This makes the kvm_gmem_invalidate_{begin, end}() calls asymmetric.
> Another ouch :-(
>
> And there should be no need to acquire mmu_lock() unconditionally, the inode's
> mutex protects the bindings, not mmu_lock.
>
> I'll get a fix posted today.  I think KVM can also add a sanity check to detect
> unresolved invalidations, e.g.
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7ba1ab1832a9..2a2d18070856 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1381,8 +1381,13 @@ static void kvm_destroy_vm(struct kvm *kvm)
>           * No threads can be waiting in kvm_swap_active_memslots() as the
>           * last reference on KVM has been dropped, but freeing
>           * memslots would deadlock without this manual intervention.
> +        *
> +        * If the count isn't unbalanced, i.e. KVM did NOT unregister between
> +        * a start() and end(), then there shouldn't be any in-progress
> +        * invalidations.
>           */
>          WARN_ON(rcuwait_active(&kvm->mn_memslots_update_rcuwait));
> +       WARN_ON(!kvm->mn_active_invalidate_count && kvm->mmu_invalidate_in_progress);
>          kvm->mn_active_invalidate_count = 0;
>   #else
>          kvm_flush_shadow_all(kvm);
>
>
> or an alternative style
>
> 	if (kvm->mn_active_invalidate_count)
> 		kvm->mn_active_invalidate_count = 0;
> 	else
> 		WARN_ON(kvm->mmu_invalidate_in_progress)
>
>>> +	KVM_MMU_UNLOCK(kvm);
>>> +}
>>> +
>>> +static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>>> +{
>>> +	struct list_head *gmem_list = &inode->i_mapping->private_list;
>>> +	pgoff_t start = offset >> PAGE_SHIFT;
>>> +	pgoff_t end = (offset + len) >> PAGE_SHIFT;
>>> +	struct kvm_gmem *gmem;
>>> +
>>> +	/*
>>> +	 * Bindings must stable across invalidation to ensure the start+end
>>> +	 * are balanced.
>>> +	 */
>>> +	filemap_invalidate_lock(inode->i_mapping);
>>> +
>>> +	list_for_each_entry(gmem, gmem_list, entry) {
>>> +		kvm_gmem_invalidate_begin(gmem, start, end);
>>> +		kvm_gmem_invalidate_end(gmem, start, end);
>>> +	}
>> Why to loop for each gmem in gmem_list here?
>>
>> IIUIC, offset is the offset according to the inode, it is only meaningful to
>> the inode passed in, i.e, it is only meaningful to the gmem binding with the
>> inode, not others.
> The code is structured to allow for multiple gmem instances per inode.  This isn't
> actually possible in the initial code base, but it's on the horizon[*].  I included
> the list-based infrastructure in this initial series to ensure that guest_memfd
> can actually support multiple files per inode, and to minimize the churn when the
> "link" support comes along.
>
> [*] https://lore.kernel.org/all/cover.1691446946.git.ackerleytng at google.com
Got it, thanks for the explanation!




