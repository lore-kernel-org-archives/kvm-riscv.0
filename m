From: Binbin Wu <binbin.wu@linux.intel.com>
Date: Mon, 18 Sep 2023 15:51:43 +0800
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
Message-ID: <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
[...]
>   
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +/*
> + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> + * matching @attrs.
> + */
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
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
IIUIC, xas_find() is inclusive for "end", so here should be "end - 1" ?


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
>
[...]

