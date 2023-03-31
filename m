From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 15:08:37 +0200
Subject: [PATCH -next v17 10/20] riscv: Allocate user's vector context in the
 first-use trap
In-Reply-To: <20230327164941.20491-11-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-11-andy.chiu@sifive.com>
Message-ID: <2409883.jE0xQCEvom@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:30 CEST schrieb Andy Chiu:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/insn.h   | 29 +++++++++++
>  arch/riscv/include/asm/vector.h |  2 +
>  arch/riscv/kernel/traps.c       | 26 +++++++++-
>  arch/riscv/kernel/vector.c      | 90 +++++++++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 8d5c84f2d5ef..4e1505cef8aa 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -137,6 +137,26 @@
>  #define RVG_OPCODE_JALR		0x67
>  #define RVG_OPCODE_JAL		0x6f
>  #define RVG_OPCODE_SYSTEM	0x73
> +#define RVG_SYSTEM_CSR_OFF	20
> +#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)

The CSR instructions are all I-type instructions it seems, but I do
understand where this is coming from, as for CSRs this is not an IMM
but an unsigned value

> +/* parts of opcode for RVF, RVD and RVQ */
> +#define RVFDQ_FL_FS_WIDTH_OFF	12
> +#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
> +#define RVFDQ_FL_FS_WIDTH_W	2
> +#define RVFDQ_FL_FS_WIDTH_D	3
> +#define RVFDQ_LS_FS_WIDTH_Q	4
> +#define RVFDQ_OPCODE_FL		0x07
> +#define RVFDQ_OPCODE_FS		0x27


> +/* parts of opcode for RVV */
> +#define RVV_OPCODE_VECTOR	0x57
> +#define RVV_VL_VS_WIDTH_8	0
> +#define RVV_VL_VS_WIDTH_16	5
> +#define RVV_VL_VS_WIDTH_32	6
> +#define RVV_VL_VS_WIDTH_64	7
> +#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
> +#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS

Same issue for those (FL_FS + VL_VS), but those even don't declare
being part of any *-type scheme in the spec.

So all of them mix content-definitions (RV*_OPCODE_*) with structure-
definitions and right now I don't know how to feel about that ;-) .

On the one hand I like the original separation, but on the other hand it
doesn't feel useful to put these single-use definitions somewhere above.


>  /* parts of opcode for RVC*/
>  #define RVC_OPCODE_C0		0x0
> @@ -304,6 +324,15 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
>  
> +#define RVG_EXTRACT_SYSTEM_CSR(x) \
> +	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
> +
> +#define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
> +	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
> +				   RVFDQ_FL_FS_WIDTH_MASK); })
> +
> +#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
> +
>  /*
>   * Get the immediate from a J-type instruction.
>   *


> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 03582e2ade83..ea59f32adf46 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -4,9 +4,19 @@
>   * Author: Andy Chiu <andy.chiu@sifive.com>
>   */
>  #include <linux/export.h>
> +#include <linux/sched/signal.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
>  
> +#include <asm/thread_info.h>
> +#include <asm/processor.h>
> +#include <asm/insn.h>
>  #include <asm/vector.h>
>  #include <asm/csr.h>
> +#include <asm/ptrace.h>
> +#include <asm/bug.h>
>  
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> @@ -18,3 +28,83 @@ void riscv_v_setup_vsize(void)
>  	riscv_v_vsize = csr_read(CSR_VLENB) * 32;
>  	riscv_v_disable();
>  }
> +
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
> +	bool is_vector = false;
> +	u32 width, csr;
> +
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;
> +
> +	switch (opcode) {
> +	case RVV_OPCODE_VECTOR:
> +		is_vector = true;
> +		break;
> +	case RVV_OPCODE_VL:
> +	case RVV_OPCODE_VS:
> +		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
> +		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
> +			is_vector = true;
> +		break;
> +	case RVG_OPCODE_SYSTEM:
> +		csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			is_vector = true;
> +		break;
> +	}

blank line?

> +	return is_vector;

I guess a matter of style-preference, but the other option would be to
just return true from inside the case elements, and simply false here.


> +}
> +
> +static int riscv_v_thread_zalloc(void)
> +{
> +	void *datap;
> +
> +	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
> +	if (!datap)
> +		return -ENOMEM;

blank line?

> +	current->thread.vstate.datap = datap;
> +	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
> +						    datap));
> +	return 0;
> +}
> +
> +bool riscv_v_first_use_handler(struct pt_regs *regs)
> +{
> +	u32 __user *epc = (u32 __user *)regs->epc;
> +	u32 insn = (u32)regs->badaddr;
> +
> +	/* If V has been enabled then it is not the first-use trap */
> +	if (riscv_v_vstate_query(regs))
> +		return false;
> +
> +	/* Get the instruction */
> +	if (!insn) {
> +		if (__get_user(insn, epc))
> +			return false;
> +	}

blank?

> +	/* Filter out non-V instructions */
> +	if (!insn_is_vector(insn))
> +		return false;
> +
> +	/* Sanity check. datap should be null by the time of the first-use trap */
> +	WARN_ON(current->thread.vstate.datap);

blank?

> +	/*
> +	 * Now we sure that this is a V instruction. And it executes in the
> +	 * context where VS has been off. So, try to allocate the user's V
> +	 * context and resume execution.
> +	 */
> +	if (riscv_v_thread_zalloc()) {
> +		force_sig(SIGKILL);
> +		return true;
> +	}
> +	riscv_v_vstate_on(regs);
> +	return true;
> +}
> 

in any case,

Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


Heiko




