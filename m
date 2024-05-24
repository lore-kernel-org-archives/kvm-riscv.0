From: maobibo <maobibo@loongson.cn>
Date: Fri, 24 May 2024 09:50:50 +0800
Subject: [PATCH v2 4/6] KVM: Delete the now unused kvm_arch_sched_in()
In-Reply-To: <20240522014013.1672962-5-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-5-seanjc@google.com>
Message-ID: <d2810a82-3111-36f0-c27d-fb7c4c7efe58@loongson.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2024/5/22 ??9:40, Sean Christopherson wrote:
> Delete kvm_arch_sched_in() now that all implementations are nops.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h     | 1 -
>   arch/loongarch/include/asm/kvm_host.h | 1 -
>   arch/mips/include/asm/kvm_host.h      | 1 -
>   arch/powerpc/include/asm/kvm_host.h   | 1 -
>   arch/riscv/include/asm/kvm_host.h     | 1 -
>   arch/s390/include/asm/kvm_host.h      | 1 -
>   arch/x86/kvm/pmu.c                    | 6 +++---
>   arch/x86/kvm/x86.c                    | 5 -----
>   include/linux/kvm_host.h              | 2 --
>   virt/kvm/kvm_main.c                   | 1 -
>   10 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 8170c04fde91..615e7a2e5590 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1225,7 +1225,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
>   }
>   
>   static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   
>   void kvm_arm_init_debug(void);
>   void kvm_arm_vcpu_init_debug(struct kvm_vcpu *vcpu);
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index c87b6ea0ec47..4162a252cdf6 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -261,7 +261,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
>   static inline void kvm_arch_hardware_unsetup(void) {}
>   static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 179f320cc231..6743a57c1ab4 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -890,7 +890,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 8abac532146e..c4fb6a27fb92 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -897,7 +897,6 @@ struct kvm_vcpu_arch {
>   static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>   static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>   static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>   
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index d96281278586..dd77c2db6819 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -286,7 +286,6 @@ struct kvm_vcpu_arch {
>   };
>   
>   static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   
>   #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
>   
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index 95990461888f..e9fcaf4607a6 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1045,7 +1045,6 @@ extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>   extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>   
>   static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>   static inline void kvm_arch_free_memslot(struct kvm *kvm,
>   					 struct kvm_memory_slot *slot) {}
>   static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index a593b03c9aed..f9149c9fc275 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -521,9 +521,9 @@ void kvm_pmu_handle_event(struct kvm_vcpu *vcpu)
>   	}
>   
>   	/*
> -	 * Unused perf_events are only released if the corresponding MSRs
> -	 * weren't accessed during the last vCPU time slice. kvm_arch_sched_in
> -	 * triggers KVM_REQ_PMU if cleanup is needed.
> +	 * Release unused perf_events if the corresponding guest MSRs weren't
> +	 * accessed during the last vCPU time slice (need_cleanup is set when
> +	 * the vCPU is scheduled back in).
>   	 */
>   	if (unlikely(pmu->need_cleanup))
>   		kvm_pmu_cleanup(vcpu);
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index e924d1c51e31..59aa772af755 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12586,11 +12586,6 @@ bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu)
>   	return (vcpu->arch.apic_base & MSR_IA32_APICBASE_BSP) != 0;
>   }
>   
> -void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu)
> -{
> -
> -}
> -
>   void kvm_arch_free_vm(struct kvm *kvm)
>   {
>   #if IS_ENABLED(CONFIG_HYPERV)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index bde69f74b031..c404c428a866 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1495,8 +1495,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>   					struct kvm_guest_debug *dbg);
>   int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
>   
> -void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
> -
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
>   void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
>   int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7ecea573d121..b312d0cbe60b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -6286,7 +6286,6 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
>   	WRITE_ONCE(vcpu->ready, false);
>   
>   	__this_cpu_write(kvm_running_vcpu, vcpu);
> -	kvm_arch_sched_in(vcpu, cpu);
>   	kvm_arch_vcpu_load(vcpu, cpu);
>   
>   	WRITE_ONCE(vcpu->scheduled_out, false);
> 

Reviewed-by: Bibo Mao <maobibo@loongson.cn>


