From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 23 May 2023 17:49:01 -0700 (PDT)
Subject: [PATCH -next v20 12/26] riscv: Add ptrace vector support
In-Reply-To: <20230518161949.11203-13-andy.chiu@sifive.com>
Message-ID: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 18 May 2023 09:19:35 PDT (-0700), andy.chiu at sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> This patch adds ptrace support for riscv vector. The vector registers will
> be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
> right after the __riscv_v_ext_state data structure then it will be put in
> ubuf for ptrace system call to get or set. It will check if the datap got
> from ubuf is set to the correct address or not when the ptrace system call
> is trying to set the vector registers.
>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changelog V18:
>  - Use sizeof(vstate->datap) instead of sizeof(void*) (Eike)
> ---
>  arch/riscv/include/uapi/asm/ptrace.h |  7 +++
>  arch/riscv/kernel/ptrace.c           | 70 ++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 78 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index 586786d023c4..e8d127ec5cf7 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -94,6 +94,13 @@ struct __riscv_v_ext_state {
>  	 */
>  };
>
> +/*
> + * According to spec: The number of bits in a single vector register,
> + * VLEN >= ELEN, which must be a power of 2, and must be no greater than
> + * 2^16 = 65536bits = 8192bytes
> + */
> +#define RISCV_MAX_VLENB (8192)
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 23c48b14a0e7..1d572cf3140f 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -7,6 +7,7 @@
>   * Copied from arch/tile/kernel/ptrace.c
>   */
>
> +#include <asm/vector.h>
>  #include <asm/ptrace.h>
>  #include <asm/syscall.h>
>  #include <asm/thread_info.h>
> @@ -24,6 +25,9 @@ enum riscv_regset {
>  #ifdef CONFIG_FPU
>  	REGSET_F,
>  #endif
> +#ifdef CONFIG_RISCV_ISA_V
> +	REGSET_V,
> +#endif
>  };
>
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -80,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
>  }
>  #endif
>
> +#ifdef CONFIG_RISCV_ISA_V
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target == current)
> +		riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
> +	membuf_zero(&to, sizeof(vstate->datap));
> +
> +	/* Copy all the vector registers from vstate. */
> +	return membuf_write(&to, vstate->datap, riscv_v_vsize);
> +}
> +
> +static int riscv_vr_set(struct task_struct *target,
> +			const struct user_regset *regset,
> +			unsigned int pos, unsigned int count,
> +			const void *kbuf, const void __user *ubuf)
> +{
> +	int ret, size;
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/* Copy rest of the vstate except datap */
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
> +				 offsetof(struct __riscv_v_ext_state, datap));
> +	if (unlikely(ret))
> +		return ret;
> +
> +	/* Skip copy datap. */
> +	size = sizeof(vstate->datap);
> +	count -= size;
> +	ubuf += size;
> +
> +	/* Copy all the vector registers. */
> +	pos = 0;
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
> +				 0, riscv_v_vsize);
> +	return ret;
> +}
> +#endif
> +
>  static const struct user_regset riscv_user_regset[] = {
>  	[REGSET_X] = {
>  		.core_note_type = NT_PRSTATUS,
> @@ -99,6 +158,17 @@ static const struct user_regset riscv_user_regset[] = {
>  		.set = riscv_fpr_set,
>  	},
>  #endif
> +#ifdef CONFIG_RISCV_ISA_V
> +	[REGSET_V] = {
> +		.core_note_type = NT_RISCV_VECTOR,
> +		.align = 16,
> +		.n = ((32 * RISCV_MAX_VLENB) +
> +		      sizeof(struct __riscv_v_ext_state)) / sizeof(__u32),
> +		.size = sizeof(__u32),
> +		.regset_get = riscv_vr_get,
> +		.set = riscv_vr_set,
> +	},
> +#endif
>  };
>
>  static const struct user_regset_view riscv_user_native_view = {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ac3da855fb19..7d8d9ae36615 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -440,6 +440,7 @@ typedef struct elf64_shdr {
>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */

IIUC we're OK to define note types here, as they're all sub-types of the 
"LINUX" note as per the comment?  I'm not entirely sure, though.

Maybe Arnd knows?

>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from NT_RISCV_VECTOR

Thanks!

