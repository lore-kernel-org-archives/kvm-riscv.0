From: Xu Yilun <yilun.xu@linux.intel.com>
Date: Sun, 5 Nov 2023 21:02:32 +0800
Subject: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private
 memory
In-Reply-To: <20231027182217.3615211-21-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-21-seanjc@google.com>
Message-ID: <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +					      struct kvm_page_fault *fault)
> +{
> +	kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> +				      PAGE_SIZE, fault->write, fault->exec,
> +				      fault->is_private);
> +}
> +
> +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> +				   struct kvm_page_fault *fault)
> +{
> +	int max_order, r;
> +
> +	if (!kvm_slot_can_be_private(fault->slot)) {
> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +		return -EFAULT;
> +	}
> +
> +	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
> +			     &max_order);
> +	if (r) {
> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +		return r;

Why report KVM_EXIT_MEMORY_FAULT here? even with a ret != -EFAULT? This is
different from the decription where KVM_EXIT_MEMORY_FAULT is introduced:

  KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
  be implicit conversions.

  To allow for future possibilities where KVM reports KVM_EXIT_MEMORY_FAULT
  and fills run->memory_fault on _any_ unresolved fault, KVM returns
  "-EFAULT"

Thanks,
Yilun

> +	}
> +
> +	fault->max_level = min(kvm_max_level_for_order(max_order),
> +			       fault->max_level);
> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> +
> +	return RET_PF_CONTINUE;
> +}

