From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 16:23:12 +0100
Subject: [PATCH 39/44] KVM: Drop kvm_count_lock and instead protect
 kvm_usage_count with kvm_lock
In-Reply-To: <20221102231911.3107438-40-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-40-seanjc@google.com>
Message-ID: <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 00:19, Sean Christopherson wrote:
> +- kvm_lock is taken outside kvm->mmu_lock

Not surprising since one is a mutex and one is an rwlock. :)  You can 
drop this hunk as well as the "Opportunistically update KVM's locking 
documentation" sentence in the commit message.

>   - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock
>   
>   - kvm->arch.mmu_lock is an rwlock.  kvm->arch.tdp_mmu_pages_lock and
> @@ -216,15 +220,11 @@ time it will be set using the Dirty tracking mechanism described above.
>   :Type:		mutex
>   :Arch:		any
>   :Protects:	- vm_list
> -
> -``kvm_count_lock``
> -^^^^^^^^^^^^^^^^^^
> -
> -:Type:		raw_spinlock_t
> -:Arch:		any
> -:Protects:	- hardware virtualization enable/disable
> -:Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
> -		migration.
> +		- kvm_usage_count
> +		- hardware virtualization enable/disable
> +		- module probing (x86 only)

What do you mean exactly by "module probing"?  Is it anything else than 
what is serialized by vendor_module_lock?

Paolo

> +:Comment:	KVM also disables CPU hotplug via cpus_read_lock() during
> +		enable/disable.
>   
>   ``kvm->mn_invalidate_lock``
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4e765ef9f4bd..c8d92e6c3922 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -100,7 +100,6 @@ EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
>    */
>   
>   DEFINE_MUTEX(kvm_lock);
> -static DEFINE_RAW_SPINLOCK(kvm_count_lock);
>   LIST_HEAD(vm_list);
>   
>   static cpumask_var_t cpus_hardware_enabled;
> @@ -5028,9 +5027,10 @@ static void hardware_enable_nolock(void *junk)
>   
>   static int kvm_online_cpu(unsigned int cpu)
>   {
> +	unsigned long flags;
>   	int ret = 0;
>   
> -	raw_spin_lock(&kvm_count_lock);
> +	mutex_lock(&kvm_lock);
>   	/*
>   	 * Abort the CPU online process if hardware virtualization cannot
>   	 * be enabled. Otherwise running VMs would encounter unrecoverable
> @@ -5039,13 +5039,16 @@ static int kvm_online_cpu(unsigned int cpu)
>   	if (kvm_usage_count) {
>   		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
>   
> +		local_irq_save(flags);
>   		hardware_enable_nolock(NULL);
> +		local_irq_restore(flags);
> +
>   		if (atomic_read(&hardware_enable_failed)) {
>   			atomic_set(&hardware_enable_failed, 0);
>   			ret = -EIO;
>   		}
>   	}
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
>   	return ret;
>   }
>   
> @@ -5061,10 +5064,13 @@ static void hardware_disable_nolock(void *junk)
>   
>   static int kvm_offline_cpu(unsigned int cpu)
>   {
> -	raw_spin_lock(&kvm_count_lock);
> -	if (kvm_usage_count)
> +	mutex_lock(&kvm_lock);
> +	if (kvm_usage_count) {
> +		preempt_disable();
>   		hardware_disable_nolock(NULL);
> -	raw_spin_unlock(&kvm_count_lock);
> +		preempt_enable();
> +	}
> +	mutex_unlock(&kvm_lock);
>   	return 0;
>   }
>   
> @@ -5079,9 +5085,11 @@ static void hardware_disable_all_nolock(void)
>   
>   static void hardware_disable_all(void)
>   {
> -	raw_spin_lock(&kvm_count_lock);
> +	cpus_read_lock();
> +	mutex_lock(&kvm_lock);
>   	hardware_disable_all_nolock();
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
> +	cpus_read_unlock();
>   }
>   
>   static int hardware_enable_all(void)
> @@ -5097,7 +5105,7 @@ static int hardware_enable_all(void)
>   	 * Disable CPU hotplug to prevent scenarios where KVM sees
>   	 */
>   	cpus_read_lock();
> -	raw_spin_lock(&kvm_count_lock);
> +	mutex_lock(&kvm_lock);
>   
>   	kvm_usage_count++;
>   	if (kvm_usage_count == 1) {
> @@ -5110,7 +5118,7 @@ static int hardware_enable_all(void)
>   		}
>   	}
>   
> -	raw_spin_unlock(&kvm_count_lock);
> +	mutex_unlock(&kvm_lock);
>   	cpus_read_unlock();
>   
>   	return r;
> @@ -5716,6 +5724,15 @@ static void kvm_init_debug(void)
>   
>   static int kvm_suspend(void)
>   {
> +	/*
> +	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
> +	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
> +	 * is stable.  Assert that kvm_lock is not held as a paranoid sanity
> +	 * check that the system isn't suspended when KVM is enabling hardware.
> +	 */
> +	lockdep_assert_not_held(&kvm_lock);
> +	lockdep_assert_irqs_disabled();
> +
>   	if (kvm_usage_count)
>   		hardware_disable_nolock(NULL);
>   	return 0;
> @@ -5723,10 +5740,11 @@ static int kvm_suspend(void)
>   
>   static void kvm_resume(void)
>   {
> -	if (kvm_usage_count) {
> -		lockdep_assert_not_held(&kvm_count_lock);
> +	lockdep_assert_not_held(&kvm_lock);
> +	lockdep_assert_irqs_disabled();
> +
> +	if (kvm_usage_count)
>   		hardware_enable_nolock(NULL);
> -	}
>   }
>   
>   static struct syscore_ops kvm_syscore_ops = {


