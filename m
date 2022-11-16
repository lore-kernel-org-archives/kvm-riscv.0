From: Huang, Kai <kai.huang@intel.com>
Date: Wed, 16 Nov 2022 01:46:51 +0000
Subject: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
In-Reply-To: <20221102231911.3107438-14-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-14-seanjc@google.com>
Message-ID: <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Acquire a new mutex, vendor_module_lock, in kvm_x86_vendor_init() while
> doing hardware setup to ensure that concurrent calls are fully serialized.
> KVM rejects attempts to load vendor modules if a different module has
> already been loaded, but doesn't handle the case where multiple vendor
> modules are loaded at the same time, and module_init() doesn't run under
> the global module_mutex.
> 
> Note, in practice, this is likely a benign bug as no platform exists that
> supports both SVM and VMX, i.e. barring a weird VM setup, one of the
> vendor modules is guaranteed to fail a support check before modifying
> common KVM state.
> 
> Alternatively, KVM could perform an atomic CMPXCHG on .hardware_enable,
> but that comes with its own ugliness as it would require setting
> .hardware_enable before success is guaranteed, e.g. attempting to load
> the "wrong" could result in spurious failure to load the "right" module.
> 
> Introduce a new mutex as using kvm_lock is extremely deadlock prone due
> to kvm_lock being taken under cpus_write_lock(), and in the future, under
> under cpus_read_lock().  Any operation that takes cpus_read_lock() while
> holding kvm_lock would potentially deadlock, e.g. kvm_timer_init() takes
> cpus_read_lock() to register a callback.  In theory, KVM could avoid
> such problematic paths, i.e. do less setup under kvm_lock, but avoiding
> all calls to cpus_read_lock() is subtly difficult and thus fragile.  E.g.
> updating static calls also acquires cpus_read_lock().
> 
> Inverting the lock ordering, i.e. always taking kvm_lock outside
> cpus_read_lock(), is not a viable option, e.g. kvm_online_cpu() takes
> kvm_lock and is called under cpus_write_lock().

"kvm_online_cpu() takes kvm_lock and is called under cpus_write_lock()" hasn't
happened yet.

> 
> The lockdep splat below is dependent on future patches to take
> cpus_read_lock() in hardware_enable_all(), but as above, deadlock is
> already is already possible.

IIUC kvm_lock by design is supposed to protect vm_list, thus IMHO naturally it
doesn't fit to protect multiple vendor module loading.

Looks above argument is good enough.  I am not sure  whether we need additional
justification which comes from future patches. :)

Also, do you also want to update Documentation/virt/kvm/locking.rst" in this
patch?

> 
> 
>   ======================================================
>   WARNING: possible circular locking dependency detected
>   6.0.0-smp--7ec93244f194-init2 #27 Tainted: G           O
>   ------------------------------------------------------
>   stable/251833 is trying to acquire lock:
>   ffffffffc097ea28 (kvm_lock){+.+.}-{3:3}, at: hardware_enable_all+0x1f/0xc0 [kvm]
> 
>                but task is already holding lock:
>   ffffffffa2456828 (cpu_hotplug_lock){++++}-{0:0}, at: hardware_enable_all+0xf/0xc0 [kvm]
> 
>                which lock already depends on the new lock.
> 
>                the existing dependency chain (in reverse order) is:
> 
>                -> #1 (cpu_hotplug_lock){++++}-{0:0}:
>          cpus_read_lock+0x2a/0xa0
>          __cpuhp_setup_state+0x2b/0x60
>          __kvm_x86_vendor_init+0x16a/0x1870 [kvm]
>          kvm_x86_vendor_init+0x23/0x40 [kvm]
>          0xffffffffc0a4d02b
>          do_one_initcall+0x110/0x200
>          do_init_module+0x4f/0x250
>          load_module+0x1730/0x18f0
>          __se_sys_finit_module+0xca/0x100
>          __x64_sys_finit_module+0x1d/0x20
>          do_syscall_64+0x3d/0x80
>          entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
>                -> #0 (kvm_lock){+.+.}-{3:3}:
>          __lock_acquire+0x16f4/0x30d0
>          lock_acquire+0xb2/0x190
>          __mutex_lock+0x98/0x6f0
>          mutex_lock_nested+0x1b/0x20
>          hardware_enable_all+0x1f/0xc0 [kvm]
>          kvm_dev_ioctl+0x45e/0x930 [kvm]
>          __se_sys_ioctl+0x77/0xc0
>          __x64_sys_ioctl+0x1d/0x20
>          do_syscall_64+0x3d/0x80
>          entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
>                other info that might help us debug this:
> 
>    Possible unsafe locking scenario:
> 
>          CPU0                    CPU1
>          ----                    ----
>     lock(cpu_hotplug_lock);
>                                  lock(kvm_lock);
>                                  lock(cpu_hotplug_lock);
>     lock(kvm_lock);
> 
>                 *** DEADLOCK ***
> 
>   1 lock held by stable/251833:
>    #0: ffffffffa2456828 (cpu_hotplug_lock){++++}-{0:0}, at: hardware_enable_all+0xf/0xc0 [kvm]
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index a0ca401d3cdf..218707597bea 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -128,6 +128,7 @@ static int kvm_vcpu_do_singlestep(struct kvm_vcpu *vcpu);
>  static int __set_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
>  static void __get_sregs2(struct kvm_vcpu *vcpu, struct kvm_sregs2 *sregs2);
>  
> +static DEFINE_MUTEX(vendor_module_lock);
>  struct kvm_x86_ops kvm_x86_ops __read_mostly;
>  
>  #define KVM_X86_OP(func)					     \
> @@ -9280,7 +9281,7 @@ void kvm_arch_exit(void)
>  
>  }
>  
> -int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
> +static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  {
>  	u64 host_pat;
>  	int r;
> @@ -9413,6 +9414,17 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  	kmem_cache_destroy(x86_emulator_cache);
>  	return r;
>  }
> +
> +int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
> +{
> +	int r;
> +
> +	mutex_lock(&vendor_module_lock);
> +	r = __kvm_x86_vendor_init(ops);
> +	mutex_unlock(&vendor_module_lock);
> +
> +	return r;
> +}
>  EXPORT_SYMBOL_GPL(kvm_x86_vendor_init);
>  
>  void kvm_x86_vendor_exit(void)
> @@ -9435,7 +9447,6 @@ void kvm_x86_vendor_exit(void)
>  	cancel_work_sync(&pvclock_gtod_work);
>  #endif
>  	static_call(kvm_x86_hardware_unsetup)();
> -	kvm_x86_ops.hardware_enable = NULL;
>  	kvm_mmu_vendor_module_exit();
>  	free_percpu(user_return_msrs);
>  	kmem_cache_destroy(x86_emulator_cache);
> @@ -9443,6 +9454,9 @@ void kvm_x86_vendor_exit(void)
>  	static_key_deferred_flush(&kvm_xen_enabled);
>  	WARN_ON(static_branch_unlikely(&kvm_xen_enabled.key));
>  #endif
> +	mutex_lock(&vendor_module_lock);
> +	kvm_x86_ops.hardware_enable = NULL;
> +	mutex_unlock(&vendor_module_lock);
>  }
>  EXPORT_SYMBOL_GPL(kvm_x86_vendor_exit);
>  

