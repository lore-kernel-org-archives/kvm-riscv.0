From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 14:28:29 +0300
Subject: [PATCH v2 27/43] KVM: VMX: Move Posted Interrupt ndst
 computation out of write loop
In-Reply-To: <20211009021236.4122790-28-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-28-seanjc@google.com>
Message-ID: <643d9c249b5863f04290a6f047ea1a2d98bd75f9.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Hoist the CPU => APIC ID conversion for the Posted Interrupt descriptor
> out of the loop to write the descriptor, preemption is disabled so the
> CPU won't change, and if the APIC ID changes KVM has bigger problems.
> 
> No functional change intended.

Is preemption always disabled in vmx_vcpu_pi_load? vmx_vcpu_pi_load is called from vmx_vcpu_load,
which is called indirectly from vcpu_load which is called from many ioctls,
which userspace does. In these places I don't think that preemption is disabled.

Best regards,
	Maxim Levitsky

> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index fea343dcc011..2b2206339174 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -51,17 +51,15 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  		goto after_clear_sn;
>  	}
>  
> -	/* The full case.  */
> +	/* The full case.  Set the new destination and clear SN. */
> +	dest = cpu_physical_id(cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
> +
>  	do {
>  		old.control = new.control = READ_ONCE(pi_desc->control);
>  
> -		dest = cpu_physical_id(cpu);
> -
> -		if (x2apic_mode)
> -			new.ndst = dest;
> -		else
> -			new.ndst = (dest << 8) & 0xFF00;
> -
> +		new.ndst = dest;
>  		new.sn = 0;
>  	} while (cmpxchg64(&pi_desc->control, old.control,
>  			   new.control) != old.control);
> @@ -103,15 +101,14 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
> +	dest = cpu_physical_id(vcpu->cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
> +
>  	do {
>  		old.control = new.control = READ_ONCE(pi_desc->control);
>  
> -		dest = cpu_physical_id(vcpu->cpu);
> -
> -		if (x2apic_mode)
> -			new.ndst = dest;
> -		else
> -			new.ndst = (dest << 8) & 0xFF00;
> +		new.ndst = dest;
>  
>  		/* set 'NV' to 'notification vector' */
>  		new.nv = POSTED_INTR_VECTOR;



