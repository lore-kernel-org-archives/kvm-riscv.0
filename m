From: Yan Zhao <yan.y.zhao@intel.com>
Date: Fri, 15 Sep 2023 14:32:06 +0800
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
Message-ID: <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> In confidential computing usages, whether a page is private or shared is
> necessary information for KVM to perform operations like page fault
> handling, page zapping etc. There are other potential use cases for
> per-page memory attributes, e.g. to make memory read-only (or no-exec,
> or exec-only, etc.) without having to modify memslots.
> 
...
>> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +				     unsigned long attrs)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	unsigned long index;
> +	bool has_attrs;
> +	void *entry;
> +
> +	rcu_read_lock();
> +
> +	if (!attrs) {
> +		has_attrs = !xas_find(&xas, end);
> +		goto out;
> +	}
> +
> +	has_attrs = true;
> +	for (index = start; index < end; index++) {
> +		do {
> +			entry = xas_next(&xas);
> +		} while (xas_retry(&xas, entry));
> +
> +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
Should "xa_to_value(entry) != attrs" be "!(xa_to_value(entry) & attrs)" ?

> +			has_attrs = false;
> +			break;
> +		}
> +	}
> +
> +out:
> +	rcu_read_unlock();
> +	return has_attrs;
> +}
> +
...
> +/* Set @attributes for the gfn range [@start, @end). */
> +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +				     unsigned long attributes)
> +{
> +	struct kvm_mmu_notifier_range pre_set_range = {
> +		.start = start,
> +		.end = end,
> +		.handler = kvm_arch_pre_set_memory_attributes,
> +		.on_lock = kvm_mmu_invalidate_begin,
> +		.flush_on_ret = true,
> +		.may_block = true,
> +	};
> +	struct kvm_mmu_notifier_range post_set_range = {
> +		.start = start,
> +		.end = end,
> +		.arg.attributes = attributes,
> +		.handler = kvm_arch_post_set_memory_attributes,
> +		.on_lock = kvm_mmu_invalidate_end,
> +		.may_block = true,
> +	};
> +	unsigned long i;
> +	void *entry;
> +	int r = 0;
> +
> +	entry = attributes ? xa_mk_value(attributes) : NULL;
Also here, do we need to get existing attributes of a GFN first ?

> +	mutex_lock(&kvm->slots_lock);
> +
> +	/* Nothing to do if the entire range as the desired attributes. */
> +	if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
> +		goto out_unlock;
> +
> +	/*
> +	 * Reserve memory ahead of time to avoid having to deal with failures
> +	 * partway through setting the new attributes.
> +	 */
> +	for (i = start; i < end; i++) {
> +		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
> +		if (r)
> +			goto out_unlock;
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &pre_set_range);
> +
> +	for (i = start; i < end; i++) {
> +		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +				    GFP_KERNEL_ACCOUNT));
> +		KVM_BUG_ON(r, kvm);
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &post_set_range);
> +
> +out_unlock:
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	return r;
> +}
 

