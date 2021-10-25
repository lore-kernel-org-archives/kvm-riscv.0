From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 16:26:17 +0200
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
In-Reply-To: <20211009021236.4122790-36-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
Message-ID: <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:12, Sean Christopherson wrote:
> +	 */
> +	if (vcpu->mode == IN_GUEST_MODE) {
>   		int cpu = READ_ONCE(vcpu->cpu);
>   
>   		/*
> @@ -687,8 +692,13 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>   		if (cpu != get_cpu())
>   			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
>   		put_cpu();
> -	} else
> +	} else {
> +		/*
> +		 * Wake the vCPU if it was blocking.  KVM will then detect the
> +		 * pending IRQ when checking if the vCPU has a wake event.
> +		 */
>   		kvm_vcpu_wake_up(vcpu);
> +	}
>   

Does this still need to check the "running" flag?  That should be a 
strict superset of vcpu->mode == IN_GUEST_MODE.

Paolo


