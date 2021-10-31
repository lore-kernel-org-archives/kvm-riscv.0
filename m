From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 01 Nov 2021 00:30:07 +0200
Subject: [PATCH v2 42/43] KVM: VMX: Fold fallback path into triggering
 posted IRQ helper
In-Reply-To: <20211009021236.4122790-43-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-43-seanjc@google.com>
Message-ID: <ffce26d0540acb7550be719255689b61210919c1.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Move the fallback "wake_up" path into the helper to trigger posted
> interrupt helper now that the nested and non-nested paths are identical.

Nit: I think you refer to patch 41 here, but I think that nested and non nested paths were identical
before as well, so this patch could be done without patch 41 as well.


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index f505fee3cf5c..b0d97cf18c34 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -3927,7 +3927,7 @@ static void vmx_msr_filter_changed(struct kvm_vcpu *vcpu)
>  	pt_update_intercept_for_msr(vcpu);
>  }
>  
> -static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
> +static inline void kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
>  						     int pi_vec)
>  {
>  #ifdef CONFIG_SMP
> @@ -3958,10 +3958,15 @@ static inline bool kvm_vcpu_trigger_posted_interrupt(struct kvm_vcpu *vcpu,
>  		 */
>  
>  		apic->send_IPI_mask(get_cpu_mask(vcpu->cpu), pi_vec);
> -		return true;
> +		return;
>  	}
>  #endif
> -	return false;
> +	/*
> +	 * The vCPU isn't in the guest; wake the vCPU in case it is blocking,
> +	 * otherwise do nothing as KVM will grab the highest priority pending
> +	 * IRQ via ->sync_pir_to_irr() in vcpu_enter_guest().
> +	 */
> +	kvm_vcpu_wake_up(vcpu);
>  }
>  
>  static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
> @@ -3984,8 +3989,7 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
>  		 */
>  		kvm_make_request(KVM_REQ_EVENT, vcpu);
>  		/* the PIR and ON have been set by L1. */
> -		if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR))
> -			kvm_vcpu_wake_up(vcpu);
> +		kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
>  		return 0;
>  	}
>  	return -1;
> @@ -4022,9 +4026,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
>  	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
>  	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
>  	 */
> -	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR))
> -		kvm_vcpu_wake_up(vcpu);
> -
> +	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_VECTOR);
>  	return 0;
>  }
>  



