From: Vineet Gupta <vineetg@rivosinc.com>
Date: Mon, 30 Jan 2023 18:55:22 -0800
Subject: [PATCH -next v13 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230125142056.18356-10-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-10-andy.chiu@sifive.com>
Message-ID: <eb3a3efd-89f7-db94-f99a-daa51065706c@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

For some reason I was looking closely at this patch today.

On 1/25/23 06:20, Andy Chiu wrote:
>   /* Whitelist the fstate from the task_struct for hardened usercopy */
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index df1aa589b7fd..69e24140195d 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/jump_label.h>
>   #include <linux/sched/task_stack.h>
> +#include <asm/vector.h>
>   #include <asm/hwcap.h>
>   #include <asm/processor.h>
>   #include <asm/ptrace.h>
> @@ -68,6 +69,21 @@ static __always_inline bool has_fpu(void) { return false; }
>   #define __switch_to_fpu(__prev, __next) do { } while (0)
>   #endif
>   
> +#ifdef CONFIG_RISCV_ISA_V
> +static inline void __switch_to_vector(struct task_struct *prev,
> +				      struct task_struct *next)
> +{
> +	struct pt_regs *regs;
> +
> +	regs = task_pt_regs(prev);
> +	if (unlikely(regs->status & SR_SD))

Do we really need to check SR_SD, isn't checking for? SR_VS_DIRTY enough.
If yes, we can remove the check here and keep the existing one on 
vstate_save()

> +		vstate_save(prev, regs);
> +	vstate_restore(next, task_pt_regs(next));
> +}
> +#else /* ! CONFIG_RISCV_ISA_V  */
> +#define __switch_to_vector(__prev, __next) do { } while (0)
> +#endif /* CONFIG_RISCV_ISA_V  */
> +

Can we de-lutter switch_to.h some more and move both the definitions of 
__switch_to_vector into vector.h ?


>   extern struct task_struct *__switch_to(struct task_struct *,
>   				       struct task_struct *);
>   
> @@ -77,6 +93,8 @@ do {							\
>   	struct task_struct *__next = (next);		\
>   	if (has_fpu())					\
>   		__switch_to_fpu(__prev, __next);	\
> +	if (has_vector())					\
> +		__switch_to_vector(__prev, __next);	\
>   	((last) = __switch_to(__prev, __next));		\
>   } while (0)
>   



