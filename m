From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 18:33:37 +0300
Subject: [PATCH v2 31/43] KVM: Move x86 VMX's posted interrupt list_head
 to vcpu_vmx
In-Reply-To: <20211009021236.4122790-32-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-32-seanjc@google.com>
Message-ID: <eea801ba765679e34a7a94a947ae7340a5cad796.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Move the seemingly generic block_vcpu_list from kvm_vcpu to vcpu_vmx, and
> rename the list and all associated variables to clarify that it tracks
> the set of vCPU that need to be poked on a posted interrupt to the wakeup
> vector.  The list is not used to track _all_ vCPUs that are blocking, and
> the term "blocked" can be misleading as it may refer to a blocking
> condition in the host or the guest, where as the PI wakeup case is
> specifically for the vCPUs that are actively blocking from within the
> guest.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 39 +++++++++++++++++-----------------
>  arch/x86/kvm/vmx/vmx.c         |  2 ++
>  arch/x86/kvm/vmx/vmx.h         |  3 +++
>  include/linux/kvm_host.h       |  2 --
>  virt/kvm/kvm_main.c            |  2 --
>  5 files changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index d2b3d75c57d1..f1bcf8c32b6d 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -18,7 +18,7 @@
>   * wake the target vCPUs.  vCPUs are removed from the list and the notification
>   * vector is reset when the vCPU is scheduled in.
>   */
> -static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
> +static DEFINE_PER_CPU(struct list_head, wakeup_vcpus_on_cpu);
This looks good, you can disregard my comment on this variable from previous patch
where I nitpicked about it.

>  /*
>   * Protect the per-CPU list with a per-CPU spinlock to handle task migration.
>   * When a blocking vCPU is awakened _and_ migrated to a different pCPU, the
> @@ -26,7 +26,7 @@ static DEFINE_PER_CPU(struct list_head, blocked_vcpu_on_cpu);
>   * CPU.  IRQs must be disabled when taking this lock, otherwise deadlock will
>   * occur if a wakeup IRQ arrives and attempts to acquire the lock.
>   */
> -static DEFINE_PER_CPU(spinlock_t, blocked_vcpu_on_cpu_lock);
> +static DEFINE_PER_CPU(spinlock_t, wakeup_vcpus_on_cpu_lock);
>  
>  static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
>  {
> @@ -36,6 +36,7 @@ static inline struct pi_desc *vcpu_to_pi_desc(struct kvm_vcpu *vcpu)
>  void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  {
>  	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
> +	struct vcpu_vmx *vmx = to_vmx(vcpu);
>  	struct pi_desc old, new;
>  	unsigned long flags;
>  	unsigned int dest;
> @@ -71,9 +72,9 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  	 * current pCPU if the task was migrated.
>  	 */
>  	if (pi_desc->nv == POSTED_INTR_WAKEUP_VECTOR) {
> -		spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
> -		list_del(&vcpu->blocked_vcpu_list);
> -		spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
> +		spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
> +		list_del(&vmx->pi_wakeup_list);
> +		spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
>  	}
>  
>  	dest = cpu_physical_id(cpu);
> @@ -121,15 +122,16 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
>  static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
>  {
>  	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
> +	struct vcpu_vmx *vmx = to_vmx(vcpu);
>  	struct pi_desc old, new;
>  	unsigned long flags;
>  
>  	local_irq_save(flags);
>  
> -	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
> -	list_add_tail(&vcpu->blocked_vcpu_list,
> -		      &per_cpu(blocked_vcpu_on_cpu, vcpu->cpu));
> -	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
> +	spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
> +	list_add_tail(&vmx->pi_wakeup_list,
> +		      &per_cpu(wakeup_vcpus_on_cpu, vcpu->cpu));
> +	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
>  
>  	WARN(pi_desc->sn, "PI descriptor SN field set before blocking");
>  
> @@ -182,24 +184,23 @@ void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
>   */
>  void pi_wakeup_handler(void)
>  {
> -	struct kvm_vcpu *vcpu;
>  	int cpu = smp_processor_id();
> +	struct vcpu_vmx *vmx;
>  
> -	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
> -	list_for_each_entry(vcpu, &per_cpu(blocked_vcpu_on_cpu, cpu),
> -			blocked_vcpu_list) {
> -		struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
> +	spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
> +	list_for_each_entry(vmx, &per_cpu(wakeup_vcpus_on_cpu, cpu),
> +			    pi_wakeup_list) {
>  
> -		if (pi_test_on(pi_desc))
> -			kvm_vcpu_kick(vcpu);
> +		if (pi_test_on(&vmx->pi_desc))
> +			kvm_vcpu_kick(&vmx->vcpu);
>  	}
> -	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
> +	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
>  }
>  
>  void __init pi_init_cpu(int cpu)
>  {
> -	INIT_LIST_HEAD(&per_cpu(blocked_vcpu_on_cpu, cpu));
> -	spin_lock_init(&per_cpu(blocked_vcpu_on_cpu_lock, cpu));
> +	INIT_LIST_HEAD(&per_cpu(wakeup_vcpus_on_cpu, cpu));
> +	spin_lock_init(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
>  }
>  
>  bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 26ed8cd1a1f2..b3bb2031a7ac 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6848,6 +6848,8 @@ static int vmx_create_vcpu(struct kvm_vcpu *vcpu)
>  	BUILD_BUG_ON(offsetof(struct vcpu_vmx, vcpu) != 0);
>  	vmx = to_vmx(vcpu);
>  
> +	INIT_LIST_HEAD(&vmx->pi_wakeup_list);
> +
>  	err = -ENOMEM;
>  
>  	vmx->vpid = allocate_vpid();
> diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> index 592217fd7d92..d1a720be9a64 100644
> --- a/arch/x86/kvm/vmx/vmx.h
> +++ b/arch/x86/kvm/vmx/vmx.h
> @@ -298,6 +298,9 @@ struct vcpu_vmx {
>  	/* Posted interrupt descriptor */
>  	struct pi_desc pi_desc;
>  
> +	/* Used if this vCPU is waiting for PI notification wakeup. */
> +	struct list_head pi_wakeup_list;
> +
>  	/* Support for a guest hypervisor (nested VMX) */
>  	struct nested_vmx nested;
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 87996b22e681..c5961a361c73 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -304,8 +304,6 @@ struct kvm_vcpu {
>  	u64 requests;
>  	unsigned long guest_debug;
>  
> -	struct list_head blocked_vcpu_list;
> -
>  	struct mutex mutex;
>  	struct kvm_run *run;
>  
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 2bbf5c9d410f..c1850b60f38b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -426,8 +426,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
>  #endif
>  	kvm_async_pf_vcpu_init(vcpu);
>  
> -	INIT_LIST_HEAD(&vcpu->blocked_vcpu_list);
> -
>  	kvm_vcpu_set_in_spin_loop(vcpu, false);
>  	kvm_vcpu_set_dy_eligible(vcpu, false);
>  	vcpu->preempted = false;


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


