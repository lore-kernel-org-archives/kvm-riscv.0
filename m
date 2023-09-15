From: Yan Zhao <yan.y.zhao@intel.com>
Date: Fri, 15 Sep 2023 13:40:00 +0800
Subject: [RFC PATCH v12 18/33] KVM: x86/mmu: Handle page fault for
 private memory
In-Reply-To: <20230914015531.1419405-19-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-19-seanjc@google.com>
Message-ID: <ZQPuMK6D/7UzDH+D@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 06:55:16PM -0700, Sean Christopherson wrote:
....
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
> +	}
> +
> +	fault->max_level = min(kvm_max_level_for_order(max_order),
> +			       fault->max_level);
> +	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
> +
> +	return RET_PF_CONTINUE;
> +}
> +
>  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  {
>  	struct kvm_memory_slot *slot = fault->slot;
> @@ -4293,6 +4356,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  			return RET_PF_EMULATE;
>  	}
>  
> +	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
In patch 21,
fault->is_private is set as:
	".is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT)",
then, the inequality here means memory attribute has been updated after
last check.
So, why an exit to user space for converting is required instead of a mere retry?

Or, is it because how .is_private is assigned in patch 21 is subjected to change
in future? 

> +		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +		return -EFAULT;
> +	}
> +
> +	if (fault->is_private)
> +		return kvm_faultin_pfn_private(vcpu, fault);
> +
>  	async = false;
>  	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
>  					  fault->write, &fault->map_writable,
> @@ -7184,6 +7255,19 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
>  }
>  
 

