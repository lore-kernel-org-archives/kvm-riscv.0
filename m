From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 13:58:40 +0300
Subject: [PATCH v2 26/43] KVM: VMX: Read Posted Interrupt "control"
 exactly once per loop iteration
In-Reply-To: <20211009021236.4122790-27-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-27-seanjc@google.com>
Message-ID: <b078cce30f86672d7d8f8eaa0adc47d24def24e2.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Use READ_ONCE() when loading the posted interrupt descriptor control
> field to ensure "old" and "new" have the same base value.  If the
> compiler emits separate loads, and loads into "new" before "old", KVM
> could theoretically drop the ON bit if it were set between the loads.
> 
> Fixes: 28b835d60fcc ("KVM: Update Posted-Interrupts Descriptor when vCPU is preempted")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 414ea6972b5c..fea343dcc011 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -53,7 +53,7 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	/* The full case.  */
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		dest = cpu_physical_id(cpu);
>  
> @@ -104,7 +104,7 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		dest = cpu_physical_id(vcpu->cpu);
>  
> @@ -160,7 +160,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
>  	     "Posted Interrupt Suppress Notification set before blocking");
>  
>  	do {
> -		old.control = new.control = pi_desc->control;
> +		old.control = new.control = READ_ONCE(pi_desc->control);
>  
>  		/* set 'NV' to 'wakeup vector' */
>  		new.nv = POSTED_INTR_WAKEUP_VECTOR;

I wish there was a way to mark fields in a struct, as requiring 'READ_ONCE' on them
so that compiler would complain if this isn't done, or automatically use 'READ_ONCE'
logic.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


