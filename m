From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 09:05:35 +0300
Subject: [PATCH v2 23/43] KVM: VMX: Use boolean returns for Posted
 Interrupt "test" helpers
In-Reply-To: <20211009021236.4122790-24-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-24-seanjc@google.com>
Message-ID: <49c6c208841a85dbcb397acdc7f20b81402e71fb.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Return bools instead of ints for the posted interrupt "test" helpers.
> The bit position of the flag being test does not matter to the callers,
> and is in fact lost by virtue of test_bit() itself returning a bool.
> 
> Returning ints is potentially dangerous, e.g. "pi_test_on(pi_desc) == 1"
> is safe-ish because ON is bit 0 and thus any sane implementation of
> pi_test_on() will work, but for SN (bit 1), checking "== 1" would rely on
> pi_test_on() to return 0 or 1, a.k.a. bools, as opposed to 0 or 2 (the
> positive bit position).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 4 ++--
>  arch/x86/kvm/vmx/posted_intr.h | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 6c2110d91b06..1688f8dc535a 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -185,7 +185,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  			   new.control) != old.control);
>  
>  	/* We should not block the vCPU if an interrupt is posted for it.  */
> -	if (pi_test_on(pi_desc) == 1)
> +	if (pi_test_on(pi_desc))
>  		__pi_post_block(vcpu);
>  
>  	local_irq_enable();
> @@ -216,7 +216,7 @@ void pi_wakeup_handler(void)
>  			blocked_vcpu_list) {
>  		struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
>  
> -		if (pi_test_on(pi_desc) == 1)
> +		if (pi_test_on(pi_desc))
>  			kvm_vcpu_kick(vcpu);
>  	}
>  	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
> diff --git a/arch/x86/kvm/vmx/posted_intr.h b/arch/x86/kvm/vmx/posted_intr.h
> index 7f7b2326caf5..36ae035f14aa 100644
> --- a/arch/x86/kvm/vmx/posted_intr.h
> +++ b/arch/x86/kvm/vmx/posted_intr.h
> @@ -40,7 +40,7 @@ static inline bool pi_test_and_clear_on(struct pi_desc *pi_desc)
>  			(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
> +static inline bool pi_test_and_set_pir(int vector, struct pi_desc *pi_desc)
>  {
>  	return test_and_set_bit(vector, (unsigned long *)pi_desc->pir);
>  }
> @@ -74,13 +74,13 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
>  		(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_on(struct pi_desc *pi_desc)
> +static inline bool pi_test_on(struct pi_desc *pi_desc)
>  {
>  	return test_bit(POSTED_INTR_ON,
>  			(unsigned long *)&pi_desc->control);
>  }
>  
> -static inline int pi_test_sn(struct pi_desc *pi_desc)
> +static inline bool pi_test_sn(struct pi_desc *pi_desc)
>  {
>  	return test_bit(POSTED_INTR_SN,
>  			(unsigned long *)&pi_desc->control);
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


