From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 13:20:20 +0300
Subject: [PATCH v2 21/43] KVM: VMX: Clean up PI pre/post-block WARNs
In-Reply-To: <20211009021236.4122790-22-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-22-seanjc@google.com>
Message-ID: <6b2bdfad87e268e861b6cc331d25790dade8e27b.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Move the WARN sanity checks out of the PI descriptor update loop so as
> not to spam the kernel log if the condition is violated and the update
> takes multiple attempts due to another writer.  This also eliminates a
> few extra uops from the retry path.
> 
> Technically not checking every attempt could mean KVM will now fail to
> WARN in a scenario that would have failed before, but any such failure
> would be inherently racy as some other agent (CPU or device) would have
> to concurrent modify the PI descriptor.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 351666c41bbc..67cbe6ab8f66 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -100,10 +100,11 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	struct pi_desc old, new;
>  	unsigned int dest;
>  
> +	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
> +	     "Wakeup handler not enabled while the vCPU was blocking");
> +
>  	do {
>  		old.control = new.control = pi_desc->control;
> -		WARN(old.nv != POSTED_INTR_WAKEUP_VECTOR,
> -		     "Wakeup handler not enabled while the VCPU is blocked\n");
>  
>  		dest = cpu_physical_id(vcpu->cpu);
>  
> @@ -161,13 +162,12 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
>  	}
>  
> +	WARN(pi_desc->sn == 1,
> +	     "Posted Interrupt Suppress Notification set before blocking");
> +
>  	do {
>  		old.control = new.control = pi_desc->control;
>  
> -		WARN((pi_desc->sn == 1),
> -		     "Warning: SN field of posted-interrupts "
> -		     "is set before blocking\n");
> -
>  		/*
>  		 * Since vCPU can be preempted during this process,
>  		 * vcpu->cpu could be different with pre_pcpu, we

Don't know for sure if this is desired. I'll would just use WARN_ON_ONCE instead
if the warning spams the log.

If there is a race I would rather want to catch it even if rare.

Best regards,
	Maxim Levitsky


