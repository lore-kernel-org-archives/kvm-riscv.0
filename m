From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Sun, 31 Oct 2021 18:35:57 +0200
Subject: [PATCH v2 38/43] KVM: Drop defunct kvm_arch_vcpu_(un)blocking()
 hooks
In-Reply-To: <20211009021236.4122790-39-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-39-seanjc@google.com>
Message-ID: <9addad02d861e20fc4e8a3c3efa983502ae2248c.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Remove kvm_arch_vcpu_(un)blocking() now that all implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/arm.c                | 10 ----------
>  arch/mips/include/asm/kvm_host.h    |  2 --
>  arch/powerpc/include/asm/kvm_host.h |  2 --
>  arch/s390/include/asm/kvm_host.h    |  2 --
>  arch/x86/include/asm/kvm-x86-ops.h  |  2 --
>  arch/x86/include/asm/kvm_host.h     | 13 -------------
>  include/linux/kvm_host.h            |  2 --
>  virt/kvm/kvm_main.c                 |  4 ----
>  8 files changed, 37 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9ff0e85a9f16..444d6f5a980a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -357,16 +357,6 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  	return kvm_timer_is_pending(vcpu);
>  }
>  
> -void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
> -void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
> -{
> -
> -}
> -
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  {
>  	struct kvm_s2_mmu *mmu;
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 72b90d45a46e..28110f71089b 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -895,8 +895,6 @@ static inline void kvm_arch_free_memslot(struct kvm *kvm,
>  					 struct kvm_memory_slot *slot) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLB
>  int kvm_arch_flush_remote_tlb(struct kvm *kvm);
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 4a195c161592..0dfee6866541 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -863,7 +863,5 @@ static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>  static inline void kvm_arch_exit(void) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #endif /* __POWERPC_KVM_HOST_H__ */
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index a22c9266ea05..25ed4ec66f4a 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1007,7 +1007,5 @@ static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>  		struct kvm_memory_slot *slot) {}
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
>  #endif
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index c2b007171abd..f2c38acdcad6 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -96,8 +96,6 @@ KVM_X86_OP(handle_exit_irqoff)
>  KVM_X86_OP_NULL(request_immediate_exit)
>  KVM_X86_OP(sched_in)
>  KVM_X86_OP_NULL(update_cpu_dirty_logging)
> -KVM_X86_OP_NULL(vcpu_blocking)
> -KVM_X86_OP_NULL(vcpu_unblocking)
>  KVM_X86_OP_NULL(update_pi_irte)
>  KVM_X86_OP_NULL(start_assignment)
>  KVM_X86_OP_NULL(apicv_post_state_restore)
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 76a8dddc1a48..bebd42926321 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1445,9 +1445,6 @@ struct kvm_x86_ops {
>  	const struct kvm_pmu_ops *pmu_ops;
>  	const struct kvm_x86_nested_ops *nested_ops;
>  
> -	void (*vcpu_blocking)(struct kvm_vcpu *vcpu);
> -	void (*vcpu_unblocking)(struct kvm_vcpu *vcpu);
> -
>  	int (*update_pi_irte)(struct kvm *kvm, unsigned int host_irq,
>  			      uint32_t guest_irq, bool set);
>  	void (*start_assignment)(struct kvm *kvm);
> @@ -1904,16 +1901,6 @@ static inline bool kvm_irq_is_postable(struct kvm_lapic_irq *irq)
>  		irq->delivery_mode == APIC_DM_LOWEST);
>  }
>  
> -static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
> -{
> -	static_call_cond(kvm_x86_vcpu_blocking)(vcpu);
> -}
> -
> -static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
> -{
> -	static_call_cond(kvm_x86_vcpu_unblocking)(vcpu);
> -}
> -
>  static inline int kvm_cpu_get_apicid(int mps_cpu)
>  {
>  #ifdef CONFIG_X86_LOCAL_APIC
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c5961a361c73..6a84b020daa6 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -966,8 +966,6 @@ void kvm_sigset_deactivate(struct kvm_vcpu *vcpu);
>  
>  void kvm_vcpu_halt(struct kvm_vcpu *vcpu);
>  bool kvm_vcpu_block(struct kvm_vcpu *vcpu);
> -void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu);
> -void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
>  bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
>  void kvm_vcpu_kick(struct kvm_vcpu *vcpu);
>  int kvm_vcpu_yield_to(struct kvm_vcpu *target);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index c1850b60f38b..96de905e26e4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3210,8 +3210,6 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  
>  	vcpu->stat.generic.blocking = 1;
>  
> -	kvm_arch_vcpu_blocking(vcpu);
> -
>  	prepare_to_rcuwait(wait);
>  	for (;;) {
>  		set_current_state(TASK_INTERRUPTIBLE);
> @@ -3224,8 +3222,6 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	}
>  	finish_rcuwait(wait);
>  
> -	kvm_arch_vcpu_unblocking(vcpu);
> -
>  	vcpu->stat.generic.blocking = 0;
>  
>  	return waited;

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>




