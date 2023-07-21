From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Jul 2023 13:59:36 +0200
Subject: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
In-Reply-To: <20230718234512.1690985-10-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-10-seanjc@google.com>
Message-ID: <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> +static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
> +			    unsigned long attrs)
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

Can you move this function to virt/kvm/kvm_main.c?

Thanks,

Paolo


