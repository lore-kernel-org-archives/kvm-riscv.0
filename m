From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 15:53:11 +0300
Subject: [PATCH v2 28/43] KVM: VMX: Remove vCPU from PI wakeup list
 before updating PID.NV
In-Reply-To: <20211009021236.4122790-29-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-29-seanjc@google.com>
Message-ID: <558e7e4c36e649709837079a25c2f56fc5609fbe.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Remove the vCPU from the wakeup list before updating the notification
> vector in the posted interrupt post-block helper.  There is no need to
> wake the current vCPU as it is by definition not blocking.  Practically
> speaking this is a nop as it only shaves a few meager cycles in the
> unlikely case that the vCPU was migrated and the previous pCPU gets a
> wakeup IRQ right before PID.NV is updated.  The real motivation is to
> allow for more readable code in the future, when post-block is merged
> with vmx_vcpu_pi_load(), at which point removal from the list will be
> conditional on the old notification vector.
> 
> Opportunistically add comments to document why KVM has a per-CPU spinlock
> that, at first glance, appears to be taken only on the owning CPU.
> Explicitly call out that the spinlock must be taken with IRQs disabled, a
> detail that was "lost" when KVM switched from spin_lock_irqsave() to
> spin_lock(), with IRQs disabled for the entirety of the relevant path.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 49 +++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 2b2206339174..901b7a5f7777 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -10,10 +10,22 @@
>  #include "vmx.h"
>  
>  /*
> - * We maintain a per-CPU linked-list of vCPU, so in wakeup_handler() we
> - * can find which vCPU should be waken up.
> + * Maintain a per-CPU list of vCPUs that need to be awakened by wakeup_handler()
Nit: While at it, it would be nice to rename this to pi_wakeup_hanlder() so that it can be more easilly
found.


> + * when a WAKEUP_VECTOR interrupted is posted.  vCPUs are added to the list when
> + * the vCPU is scheduled out and is blocking (e.g. in HLT) with IRQs enabled.
s/interrupted/interrupt ?

Isn't that comment incorrect? As I see, the PI hardware is setup to use the WAKEUP_VECTOR
when vcpu blocks (in pi_pre_block) and then that vcpu is added to the list.
The pi_wakeup_hanlder just goes over the list and wakes up all vcpus on the lsit.


> + * The vCPUs posted interrupt descriptor is updated at the same time to set its
> + * notification vector to WAKEUP_VECTOR, so that posted interrupt from devices
> + * wake the target vCPUs.  vCPUs are removed from the list and the notification
> + * vector is reset when the vCPU is scheduled in.
>   */
>  static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
Also while at it, why not to rename this to 'blocked_vcpu_list'?
to explain that this is list of blocked vcpus. Its a per-cpu variable
so 'on_cpu' suffix isn't needed IMHO.

> +/*
> + * Protect the per-CPU list with a per-CPU spinlock to handle task migration.
> + * When a blocking vCPU is awakened _and_ migrated to a different pCPU, the
> + * ->sched_in() path will need to take the vCPU off the list of the _previous_
> + * CPU.  IRQs must be disabled when taking this lock, otherwise deadlock will
> + * occur if a wakeup IRQ arrives and attempts to acquire the lock.
> + */
>  static DEFINE_PER_CPU(spinlock_t, blocked_vcpu_on_cpu_lock);
>  
>  static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
> @@ -101,23 +113,28 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
>  	WARN(pi_desc->nv != POSTED_INTR_WAKEUP_VECTOR,
>  	     "Wakeup handler not enabled while the vCPU was blocking");
>  
> -	dest = cpu_physical_id(vcpu->cpu);
> -	if (!x2apic_mode)
> -		dest = (dest << 8) & 0xFF00;
> -
> -	do {
> -		old.control = new.control = READ_ONCE(pi_desc->control);
> -
> -		new.ndst = dest;
> -
> -		/* set 'NV' to 'notification vector' */
> -		new.nv = POSTED_INTR_VECTOR;
> -	} while (cmpxchg64(&pi_desc->control, old.control,
> -			   new.control) != old.control);
> -
> +	/*
> +	 * Remove the vCPU from the wakeup list of the _previous_ pCPU, which
> +	 * will not be the same as the current pCPU if the task was migrated.
> +	 */
>  	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
>  	list_del(&vcpu->blocked_vcpu_list);
>  	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
> +
> +	dest = cpu_physical_id(vcpu->cpu);
> +	if (!x2apic_mode)
> +		dest = (dest << 8) & 0xFF00;
It would be nice to have a function for this, this appears in this file twice.
Maybe there is a function already somewhere?


> +
> +	do {
> +		old.control = new.control = READ_ONCE(pi_desc->control);
> +
> +		new.ndst = dest;
> +
> +		/* set 'NV' to 'notification vector' */
> +		new.nv = POSTED_INTR_VECTOR;
> +	} while (cmpxchg64(&pi_desc->control, old.control,
> +			   new.control) != old.control);
> +
>  	vcpu->pre_pcpu = -1;
>  }
>  

Best regards,
	Maxim Levitsky



