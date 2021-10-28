From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 18:46:11 +0300
Subject: [PATCH v2 34/43] KVM: x86: Remove defunct pre_block/post_block
 kvm_x86_ops hooks
In-Reply-To: <20211009021236.4122790-35-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-35-seanjc@google.com>
Message-ID: <412931e082b33403c8778cae7376325871ab0d54.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Drop kvm_x86_ops' pre/post_block() now that all implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  2 --
>  arch/x86/include/asm/kvm_host.h    | 12 ------------
>  arch/x86/kvm/vmx/vmx.c             | 13 -------------
>  arch/x86/kvm/x86.c                 |  6 +-----
>  4 files changed, 1 insertion(+), 32 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index cefe1d81e2e8..c2b007171abd 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -96,8 +96,6 @@ KVM_X86_OP(handle_exit_irqoff)
>  KVM_X86_OP_NULL(request_immediate_exit)
>  KVM_X86_OP(sched_in)
>  KVM_X86_OP_NULL(update_cpu_dirty_logging)
> -KVM_X86_OP_NULL(pre_block)
> -KVM_X86_OP_NULL(post_block)
>  KVM_X86_OP_NULL(vcpu_blocking)
>  KVM_X86_OP_NULL(vcpu_unblocking)
>  KVM_X86_OP_NULL(update_pi_irte)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 328103a520d3..76a8dddc1a48 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1445,18 +1445,6 @@ struct kvm_x86_ops {
>  	const struct kvm_pmu_ops *pmu_ops;
>  	const struct kvm_x86_nested_ops *nested_ops;
>  
> -	/*
> -	 * Architecture specific hooks for vCPU blocking due to
> -	 * HLT instruction.
> -	 * Returns for .pre_block():
> -	 *    - 0 means continue to block the vCPU.
> -	 *    - 1 means we cannot block the vCPU since some event
> -	 *        happens during this period, such as, 'ON' bit in
> -	 *        posted-interrupts descriptor is set.
> -	 */
> -	int (*pre_block)(struct kvm_vcpu *vcpu);
> -	void (*post_block)(struct kvm_vcpu *vcpu);
> -
>  	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
>  	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index a24f19874716..13e732a818f3 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7462,16 +7462,6 @@ void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu)
>  		secondary_exec_controls_clearbit(vmx, SECONDARY_EXEC_ENABLE_PML);
>  }
>  
> -static int vmx_pre_block(struct kvm_vcpu *vcpu)
> -{
> -	return 0;
> -}
> -
> -static void vmx_post_block(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
>  static void vmx_setup_mce(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu->arch.mcg_cap & MCG_LMCE_P)
> @@ -7665,9 +7655,6 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
>  	.cpu_dirty_log_size = PML_ENTITY_NUM,
>  	.update_cpu_dirty_logging = vmx_update_cpu_dirty_logging,
>  
> -	.pre_block = vmx_pre_block,
> -	.post_block = vmx_post_block,
> -
>  	.pmu_ops = &intel_pmu_ops,
>  	.nested_ops = &vmx_nested_ops,
>  
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 909e932a7ae7..9643f23c28c7 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9898,8 +9898,7 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  {
>  	bool hv_timer;
>  
> -	if (!kvm_arch_vcpu_runnable(vcpu) &&
> -	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
> +	if (!kvm_arch_vcpu_runnable(vcpu)) {
>  		/*
>  		 * Switch to the software timer before halt-polling/blocking as
>  		 * the guest's timer may be a break event for the vCPU, and the
> @@ -9921,9 +9920,6 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  		if (hv_timer)
>  			kvm_lapic_switch_to_hv_timer(vcpu);
>  
> -		if (kvm_x86_ops.post_block)
> -			static_call(kvm_x86_post_block)(vcpu);
> -
>  		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
>  			return 1;
>  	}

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


