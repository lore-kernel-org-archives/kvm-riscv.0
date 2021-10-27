From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 17:10:06 +0300
Subject: [PATCH v2 12/43] KVM: x86: Tweak halt emulation helper names to
 free up kvm_vcpu_halt()
In-Reply-To: <20211009021236.4122790-13-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-13-seanjc@google.com>
Message-ID: <363479dd55760979da208cacf015a6f7fe2afd69.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Rename a variety of HLT-related helpers to free up the function name
> "kvm_vcpu_halt" for future use in generic KVM code, e.g. to differentiate
> between "block" and "halt".
> 
> No functional change intended.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/vmx/nested.c       |  2 +-
>  arch/x86/kvm/vmx/vmx.c          |  4 ++--
>  arch/x86/kvm/x86.c              | 13 +++++++------
>  4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 7aafc27ce7a9..328103a520d3 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1689,7 +1689,7 @@ int kvm_emulate_monitor(struct kvm_vcpu *vcpu);
>  int kvm_fast_pio(struct kvm_vcpu *vcpu, int size, unsigned short port, int in);
>  int kvm_emulate_cpuid(struct kvm_vcpu *vcpu);
>  int kvm_emulate_halt(struct kvm_vcpu *vcpu);
> -int kvm_vcpu_halt(struct kvm_vcpu *vcpu);
> +int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu);
>  int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu);
>  int kvm_emulate_wbinvd(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index af1bbb73430a..d0237a441feb 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -3619,7 +3619,7 @@ static int nested_vmx_run(struct kvm_vcpu *vcpu, bool launch)
>  		    !(nested_cpu_has(vmcs12, CPU_BASED_INTR_WINDOW_EXITING) &&
>  		      (vmcs12->guest_rflags & X86_EFLAGS_IF))) {
>  			vmx->nested.nested_run_pending = 0;
> -			return kvm_vcpu_halt(vcpu);
> +			return kvm_emulate_halt_noskip(vcpu);
>  		}
>  		break;
>  	case GUEST_ACTIVITY_WAIT_SIPI:
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 1c8b2b6e7ed9..5517893f12fc 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -4741,7 +4741,7 @@ static int handle_rmode_exception(struct kvm_vcpu *vcpu,
>  		if (kvm_emulate_instruction(vcpu, 0)) {
>  			if (vcpu->arch.halt_request) {
>  				vcpu->arch.halt_request = 0;
> -				return kvm_vcpu_halt(vcpu);
> +				return kvm_emulate_halt_noskip(vcpu);

Could you elaborate on why you choose _noskip suffix? 
 
As far as I see, kvm_vcpu_halt just calls __kvm_vcpu_halt with new VCPU run state/exit reason,
which is used only when local apic is not in the kernel (which is these days not that
supported configuration).

Other user of __kvm_vcpu_halt is something SEV related.
 
Best regards,
	Maxim Levitsky


>  			}
>  			return 1;
>  		}
> @@ -5415,7 +5415,7 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
>  
>  		if (vcpu->arch.halt_request) {
>  			vcpu->arch.halt_request = 0;
> -			return kvm_vcpu_halt(vcpu);
> +			return kvm_emulate_halt_noskip(vcpu);
>  		}
>  
>  		/*
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 4a52a08707de..9c23ae1d483d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8649,7 +8649,7 @@ void kvm_arch_exit(void)
>  #endif
>  }
>  
> -static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
> +static int __kvm_emulate_halt(struct kvm_vcpu *vcpu, int state, int reason)
>  {
>  	++vcpu->stat.halt_exits;
>  	if (lapic_in_kernel(vcpu)) {
> @@ -8661,11 +8661,11 @@ static int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
>  	}
>  }
>  
> -int kvm_vcpu_halt(struct kvm_vcpu *vcpu)
> +int kvm_emulate_halt_noskip(struct kvm_vcpu *vcpu)
>  {
> -	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
> +	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_HALTED, KVM_EXIT_HLT);
>  }
> -EXPORT_SYMBOL_GPL(kvm_vcpu_halt);
> +EXPORT_SYMBOL_GPL(kvm_emulate_halt_noskip);
>  
>  int kvm_emulate_halt(struct kvm_vcpu *vcpu)
>  {
> @@ -8674,7 +8674,7 @@ int kvm_emulate_halt(struct kvm_vcpu *vcpu)
>  	 * TODO: we might be squashing a GUESTDBG_SINGLESTEP-triggered
>  	 * KVM_EXIT_DEBUG here.
>  	 */
> -	return kvm_vcpu_halt(vcpu) && ret;
> +	return kvm_emulate_halt_noskip(vcpu) && ret;
>  }
>  EXPORT_SYMBOL_GPL(kvm_emulate_halt);
>  
> @@ -8682,7 +8682,8 @@ int kvm_emulate_ap_reset_hold(struct kvm_vcpu *vcpu)
>  {
>  	int ret = kvm_skip_emulated_instruction(vcpu);
>  
> -	return __kvm_vcpu_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD, KVM_EXIT_AP_RESET_HOLD) && ret;
> +	return __kvm_emulate_halt(vcpu, KVM_MP_STATE_AP_RESET_HOLD,
> +					KVM_EXIT_AP_RESET_HOLD) && ret;
>  }
>  EXPORT_SYMBOL_GPL(kvm_emulate_ap_reset_hold);
>  



