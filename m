From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 02 Mar 2023 12:07:21 +0100
Subject: [PATCH -next v14 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230224170118.16766-10-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com>
Message-ID: <87v8jj4djq.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index f704c8dd57e0..9e28c0199030 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -80,6 +80,9 @@ struct thread_info {
>  	.preempt_count	= INIT_PREEMPT_COUNT,	\
>  }
>  
> +void arch_release_task_struct(struct task_struct *tsk);
> +int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  /*
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 9c025f2efdc3..830f9d3c356b 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -10,6 +10,9 @@
>  
>  #ifdef CONFIG_RISCV_ISA_V
>  
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <asm/ptrace.h>
>  #include <asm/hwcap.h>
>  #include <asm/csr.h>
>  #include <asm/asm.h>
> @@ -75,7 +78,8 @@ static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src
>  		    "r" (src->vcsr) :);
>  }
>  
> -static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, void *datap)
> +static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
> +					 void *datap)

Please avoid code churn like this... 

>  {
>  	riscv_v_enable();
>  	__vstate_csr_save(save_to);
> @@ -93,7 +97,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to, vo
>  }
>  
>  static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
> -				    void *datap)
> +					    void *datap)

...and this.

>  {
>  	riscv_v_enable();
>  	asm volatile (
> @@ -110,6 +114,38 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>  	riscv_v_disable();
>  }
>  
> +static inline void riscv_v_vstate_save(struct task_struct *task,
> +				       struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
> +		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
> +
> +		__riscv_v_vstate_save(vstate, vstate->datap);
> +		__riscv_v_vstate_clean(regs);
> +	}
> +}
> +
> +static inline void riscv_v_vstate_restore(struct task_struct *task,
> +					  struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) != SR_VS_OFF) {
> +		struct __riscv_v_ext_state *vstate = &task->thread.vstate;
> +
> +		__riscv_v_vstate_restore(vstate, vstate->datap);
> +		__riscv_v_vstate_clean(regs);
> +	}
> +}
> +
> +static inline void __switch_to_vector(struct task_struct *prev,
> +				      struct task_struct *next)
> +{
> +	struct pt_regs *regs;
> +
> +	regs = task_pt_regs(prev);
> +	riscv_v_vstate_save(prev, regs);
> +	riscv_v_vstate_restore(next, task_pt_regs(next));
> +}
> +
>  #else /* ! CONFIG_RISCV_ISA_V  */
>  
>  struct pt_regs;
> @@ -118,6 +154,9 @@ static __always_inline bool has_vector(void) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 do {} while (0)
> +#define riscv_v_vstate_save(task, regs)		do {} while (0)
> +#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)
>  
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 8955f2432c2d..5e9506a32fbe 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -24,6 +24,7 @@
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
>  #include <asm/cpuidle.h>
> +#include <asm/vector.h>
>  
>  register unsigned long gp_in_global __asm__("gp");
>  
> @@ -148,12 +149,28 @@ void flush_thread(void)
>  	fstate_off(current, task_pt_regs(current));
>  	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
>  #endif
> +#ifdef CONFIG_RISCV_ISA_V
> +	/* Reset vector state */
> +	riscv_v_vstate_off(task_pt_regs(current));
> +	kfree(current->thread.vstate.datap);
> +	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
> +#endif
> +}
> +
> +void arch_release_task_struct(struct task_struct *tsk)
> +{
> +	/* Free the vector context of datap. */
> +	if (has_vector() && tsk->thread.vstate.datap)
                            ^^^^^^^^^^^^^^^^^^^^^^^^
No need to check for !NULL.


Bj?rn

