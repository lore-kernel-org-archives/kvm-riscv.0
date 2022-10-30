From: Conor Dooley <conor@kernel.org>
Date: Sun, 30 Oct 2022 21:08:35 +0000
Subject: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
In-Reply-To: <20221027130247.31634-4-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-4-ajones@ventanamicro.com>
Message-ID: <Y17n0xRqGPihGkRJ@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 03:02:41PM +0200, Andrew Jones wrote:
> CBO instructions use the I-type of instruction format where
> the immediate is used to identify the CBO instruction type.
> Add I-type instruction encoding support to insn-def and also
> add cbo.zero.

Cool, I like this a lot more than putting cc-option & linker version
number checks into Kbuild stuff. I guess if this gets applied, I'll
send one ripping my checks in Kconfig out and replace it with one of
these?

I mostly just cross-checked the numbers etc here and things look grand.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

One minor comment below.

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/insn-def.h | 50 +++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 16044affa57c..f13054716556 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -12,6 +12,12 @@
>  #define INSN_R_RD_SHIFT			 7
>  #define INSN_R_OPCODE_SHIFT		 0
>  
> +#define INSN_I_SIMM12_SHIFT		20
> +#define INSN_I_RS1_SHIFT		15
> +#define INSN_I_FUNC3_SHIFT		12
> +#define INSN_I_RD_SHIFT			 7
> +#define INSN_I_OPCODE_SHIFT		 0
> +
>  #ifdef __ASSEMBLY__
>  
>  #ifdef CONFIG_AS_HAS_INSN
> @@ -20,6 +26,10 @@
>  	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
>  	.endm
>  
> +	.macro insn_i, opcode, func3, rd, rs1, simm12
> +	.insn	i \opcode, \func3, \rd, \rs1, \simm12
> +	.endm
> +
>  #else
>  
>  #include <asm/gpr-num.h>
> @@ -33,9 +43,18 @@
>  		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
>  	.endm
>  
> +	.macro insn_i, opcode, func3, rd, rs1, simm12
> +	.4byte	((\opcode << INSN_I_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_I_FUNC3_SHIFT) |		\
> +		 (.L__gpr_num_\rd << INSN_I_RD_SHIFT) |		\
> +		 (.L__gpr_num_\rs1 << INSN_I_RS1_SHIFT) |	\
> +		 (\simm12 << INSN_I_SIMM12_SHIFT))
> +	.endm
> +
>  #endif
>  
>  #define __INSN_R(...)	insn_r __VA_ARGS__
> +#define __INSN_I(...)	insn_i __VA_ARGS__
>  
>  #else /* ! __ASSEMBLY__ */
>  
> @@ -44,6 +63,9 @@
>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
>  	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
>  
> +#define __INSN_I(opcode, func3, rd, rs1, simm12)	\
> +	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
> +
>  #else
>  
>  #include <linux/stringify.h>
> @@ -60,14 +82,32 @@
>  "		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
>  "	.endm\n"
>  
> +#define DEFINE_INSN_I							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
> +"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
> +"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \

It'd be nice if these macros had aligned \s. I know the file is pretty
inconsistent in that regard and I'm not asking you to change those but I
think it'd be nice to do so for stuff that's just being added now.

Thanks,
Conor.

> +"		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
> +"	.endm\n"
> +
>  #define UNDEFINE_INSN_R							\
>  "	.purgem insn_r\n"
>  
> +#define UNDEFINE_INSN_I							\
> +"	.purgem insn_i\n"
> +
>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
>  	DEFINE_INSN_R							\
>  	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
>  	UNDEFINE_INSN_R
>  
> +#define __INSN_I(opcode, func3, rd, rs1, simm12)			\
> +	DEFINE_INSN_I							\
> +	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
> +	UNDEFINE_INSN_I
> +
>  #endif
>  
>  #endif /* ! __ASSEMBLY__ */
> @@ -76,9 +116,14 @@
>  	__INSN_R(RV_##opcode, RV_##func3, RV_##func7,		\
>  		 RV_##rd, RV_##rs1, RV_##rs2)
>  
> +#define INSN_I(opcode, func3, rd, rs1, simm12)			\
> +	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
> +		 RV_##rs1, RV_##simm12)
> +
>  #define RV_OPCODE(v)		__ASM_STR(v)
>  #define RV_FUNC3(v)		__ASM_STR(v)
>  #define RV_FUNC7(v)		__ASM_STR(v)
> +#define RV_SIMM12(v)		__ASM_STR(v)
>  #define RV_RD(v)		__ASM_STR(v)
>  #define RV_RS1(v)		__ASM_STR(v)
>  #define RV_RS2(v)		__ASM_STR(v)
> @@ -87,6 +132,7 @@
>  #define RV___RS1(v)		__RV_REG(v)
>  #define RV___RS2(v)		__RV_REG(v)
>  
> +#define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
>  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
>  
>  #define HFENCE_VVMA(vaddr, asid)				\
> @@ -134,4 +180,8 @@
>  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
>  	       __RD(0), RS1(gaddr), RS2(vmid))
>  
> +#define CBO_ZERO(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +
>  #endif /* __ASM_INSN_DEF_H */
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

