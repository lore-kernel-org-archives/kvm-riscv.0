From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 19 Aug 2022 16:26:08 +0200
Subject: [PATCH 2/4] riscv: Introduce support for defining instructions
In-Reply-To: <20220819140250.3892995-3-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
 <20220819140250.3892995-3-ajones@ventanamicro.com>
Message-ID: <20220819142608.uzqvtd7qfejvhzia@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 19, 2022 at 04:02:48PM +0200, Andrew Jones wrote:
> When compiling with toolchains that haven't yet been taught about
> new instructions we need to encode them ourselves. Create a new file
> where support for instruction definitions will evolve. We initiate
> the file with a macro called INSN_R(), which implements the R-type
> instruction encoding. INSN_R() will use the assembler's .insn
> directive when available, which should give the assembler a chance
> to do some validation. When .insn is not available we fall back to
> manual encoding.
> 
> Not only should using instruction encoding macros improve readability
> and maintainability of code over the alternative of inserting
> instructions directly (e.g. '.word 0xc0de'), but we should also gain
> potential for more optimized code after compilation because the
> compiler will have control over the input and output registers used.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                |  3 ++
>  arch/riscv/include/asm/insn-def.h | 82 +++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..f8f3b316b838 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,6 +227,9 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select DMA_DIRECT_REMAP
>  
> +config AS_HAS_INSN
> +	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
> +
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.erratas"
>  
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> new file mode 100644
> index 000000000000..4cd0208068dd
> --- /dev/null
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_INSN_DEF_H
> +#define __ASM_INSN_DEF_H
> +#include <asm/asm.h>
> +
> +#define INSN_R_FUNC7_SHIFT		25
> +#define INSN_R_RS2_SHIFT		20
> +#define INSN_R_RS1_SHIFT		15
> +#define INSN_R_FUNC3_SHIFT		12
> +#define INSN_R_RD_SHIFT			 7
> +#define INSN_R_OPCODE_SHIFT		 0
> +
> +#ifdef __ASSEMBLY__
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
> +	.endm
> +
> +#else
> +
> +#include <asm/gpr-num.h>
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.4byte	((\opcode << INSN_R_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_R_FUNC3_SHIFT) |		\
> +		 (\func7 << INSN_R_FUNC7_SHIFT) |		\
> +		 (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |		\
> +		 (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |	\
> +		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
> +        .endm

Doh, checkpatch told me about the spaces vs. tabs before .endm, but I
forgot to refresh before sending. I won't send a v2 until the series
gets more feedback, but I've already got it fixed.

> +
> +#endif
> +
> +#define INSN_R(...)	insn_r __VA_ARGS__
> +
> +#else /* ! __ASSEMBLY__ */
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
> +	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
> +
> +#else
> +
> +#include <linux/stringify.h>
> +#include <asm/gpr-num.h>
> +
> +#define DEFINE_INSN_R							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"		\
> +"	.4byte  ((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"	\
              ^
              ^ checkpatch didn't tell me those are spaces instead of a
	      tab, but I found it while fixing the other tab issue.

> +"		 (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"	\
> +"		 (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ") |"    \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) ") |"  \
> +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
> +"	.endm\n"
> +
> +#define UNDEFINE_INSN_R							\
> +"	.purgem insn_r\n"
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
> +	DEFINE_INSN_R							\
> +	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> +	UNDEFINE_INSN_R
> +
> +#endif
> +
> +#endif /* ! __ASSEMBLY__ */
> +
> +#define OPCODE(v)	__ASM_STR(v)
> +#define FUNC3(v)	__ASM_STR(v)
> +#define FUNC7(v)	__ASM_STR(v)
> +#define __REG(v)	__ASM_STR(x ## v)
> +#define RD(v)		__REG(v)
> +#define RS1(v)		__REG(v)
> +#define RS2(v)		__REG(v)
> +
> +#endif /* __ASM_INSN_DEF_H */
> -- 
> 2.37.1
> 

Thanks,
drew

