From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 2 Dec 2022 12:59:02 +0000
Subject: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware
 enabling/disabling
In-Reply-To: <20221130230934.1014142-43-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-43-seanjc@google.com>
Message-ID: <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
> Disable CPU hotplug when enabling/disabling hardware to prevent the
> corner case where if the following sequence occurs:
> 
>   1. A hotplugged CPU marks itself online in cpu_online_mask
>   2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
>      callback
>   3  hardware_{en,dis}able_all() is invoked on another CPU
> 
> the hotplugged CPU will be included in on_each_cpu() and thus get sent
> through hardware_{en,dis}able_nolock() before kvm_online_cpu() is called.

Should we explicitly call out what is the consequence of such case, otherwise
it's hard to tell whether this truly is an issue?

IIUC, since now the compatibility check has already been moved to
kvm_arch_hardware_enable(), the consequence is hardware_enable_all() will fail
if the now online cpu isn't compatible, which will results in failing to create
the first VM.  This isn't ideal since the incompatible cpu should be rejected to
go online instead.

> 
>         start_secondary { ...
>                 set_cpu_online(smp_processor_id(), true); <- 1
>                 ...
>                 local_irq_enable();  <- 2
>                 ...
>                 cpu_startup_entry(CPUHP_AP_ONLINE_IDLE); <- 3
>         }
> 
> KVM currently fudges around this race by keeping track of which CPUs have
> done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
> cpus have virtualization enabled"), but that's an inefficient, convoluted,
> and hacky solution.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> [sean: split to separate patch, write changelog]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c  | 11 ++++++++++-
>  virt/kvm/kvm_main.c | 12 ++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index dad30097f0c3..d2ad383da998 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9281,7 +9281,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
>  
>  static int kvm_x86_check_processor_compatibility(void)
>  {
> -	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
> +	int cpu = smp_processor_id();
> +	struct cpuinfo_x86 *c = &cpu_data(cpu);
> +
> +	/*
> +	 * Compatibility checks are done when loading KVM and when enabling
> +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> +	 * compatible, i.e. KVM should never perform a compatibility check on
> +	 * an offline CPU.
> +	 */
> +	WARN_ON(!cpu_online(cpu));

IMHO this chunk logically should belong to previous patch.  IIUC disabling CPU
hotplug during hardware_enable_all() doesn't have relationship to this WARN().

>  
>  	if (__cr4_reserved_bits(cpu_has, c) !=
>  	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f26ea779710a..d985b24c423b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5098,15 +5098,26 @@ static void hardware_disable_all_nolock(void)
>  
>  static void hardware_disable_all(void)
>  {
> +	cpus_read_lock();
>  	raw_spin_lock(&kvm_count_lock);
>  	hardware_disable_all_nolock();
>  	raw_spin_unlock(&kvm_count_lock);
> +	cpus_read_unlock();
>  }
>  
>  static int hardware_enable_all(void)
>  {
>  	int r = 0;
>  
> +	/*
> +	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
> +	 * is called, and so on_each_cpu() between them includes the CPU that
> +	 * is being onlined.  As a result, hardware_enable_nolock() may get
> +	 * invoked before kvm_online_cpu(), which also enables hardware if the
> +	 * usage count is non-zero.  Disable CPU hotplug to avoid attempting to
> +	 * enable hardware multiple times.

It won't enable hardware multiple times, right?  Since hardware_enable_nolock()
has below check:

        if (cpumask_test_cpu(cpu, cpus_hardware_enabled))                      
                return;                                                        
                                                                                                                                                   
        cpumask_set_cpu(cpu, cpus_hardware_enabled);     

IIUC the only issue is the one that I replied in the changelog.

Or perhaps I am missing something?

> +	 */
> +	cpus_read_lock();
>  	raw_spin_lock(&kvm_count_lock);
>  
>  	kvm_usage_count++;
> @@ -5121,6 +5132,7 @@ static int hardware_enable_all(void)
>  	}
>  
>  	raw_spin_unlock(&kvm_count_lock);
> +	cpus_read_unlock();
>  
>  	return r;
>  }

