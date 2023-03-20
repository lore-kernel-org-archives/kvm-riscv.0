From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 20 Mar 2023 13:28:27 -0000
Subject: [PATCH -next v15 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230317113538.10878-11-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-11-andy.chiu@sifive.com>
Message-ID: <31f08283-b815-4e50-80ed-3f94987ef227@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 11:35:29AM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

I recall being mostly happy with the v13 of this, and the bits of
complaints I had there were resolved, as does the build issue in v14.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I think I also said that I would like if Heiko could have a brief look
at the insn parsing bits.

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/insn.h   | 29 +++++++++++
>  arch/riscv/include/asm/vector.h |  2 +
>  arch/riscv/kernel/traps.c       | 14 ++++-
>  arch/riscv/kernel/vector.c      | 90 +++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+), 2 deletions(-)
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
> +
> +/* parts of opcode for RVF, RVD and RVQ */
> +#define RVFDQ_FL_FS_WIDTH_OFF	12
> +#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
> +#define RVFDQ_FL_FS_WIDTH_W	2
> +#define RVFDQ_FL_FS_WIDTH_D	3
> +#define RVFDQ_LS_FS_WIDTH_Q	4
> +#define RVFDQ_OPCODE_FL		0x07
> +#define RVFDQ_OPCODE_FS		0x27
> +
> +/* parts of opcode for RVV */
> +#define RVV_OPCODE_VECTOR	0x57
> +#define RVV_VL_VS_WIDTH_8	0
> +#define RVV_VL_VS_WIDTH_16	5
> +#define RVV_VL_VS_WIDTH_32	6
> +#define RVV_VL_VS_WIDTH_64	7
> +#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
> +#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS
>  
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
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 3bfa223facd0..09f8dbad3dee 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -20,6 +20,7 @@
>  
>  extern unsigned long riscv_v_vsize;
>  void riscv_v_setup_vsize(void);
> +bool riscv_v_first_use_handler(struct pt_regs *regs);
>  
>  static __always_inline bool has_vector(void)
>  {
> @@ -163,6 +164,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
>  struct pt_regs;
>  
>  static __always_inline bool has_vector(void) { return false; }
> +static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 		do {} while (0)
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index f6fda94e8e59..2a98fe74274e 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -24,6 +24,7 @@
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
>  #include <asm/thread_info.h>
> +#include <asm/vector.h>
>  
>  int show_unhandled_signals = 1;
>  
> @@ -135,8 +136,17 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>  	SIGBUS, BUS_ADRALN, "instruction address misaligned");
>  DO_ERROR_INFO(do_trap_insn_fault,
>  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
> -DO_ERROR_INFO(do_trap_insn_illegal,
> -	SIGILL, ILL_ILLOPC, "illegal instruction");
> +
> +asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
> +{
> +	if (has_vector() && user_mode(regs)) {
> +		if (riscv_v_first_use_handler(regs))
> +			return;
> +	}
> +	do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
> +		      "Oops - illegal instruction");
> +}
> +
>  DO_ERROR_INFO(do_trap_load_fault,
>  	SIGSEGV, SEGV_ACCERR, "load access fault");
>  #ifndef CONFIG_RISCV_M_MODE
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 082baf2a061f..f13d2f3d77fb 100644
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
> @@ -19,3 +29,83 @@ void riscv_v_setup_vsize(void)
>  	riscv_v_disable();
>  }
>  
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
> +	return is_vector;
> +}
> +
> +static int riscv_v_thread_zalloc(void)
> +{
> +	void *datap;
> +
> +	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
> +	if (!datap)
> +		return -ENOMEM;
> +	current->thread.vstate.datap = datap;
> +	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
> +						    datap));
> +	return 0;
> +}
> +
> +bool riscv_v_first_use_handler(struct pt_regs *regs)
> +{
> +	__user u32 *epc = (u32 *)regs->epc;
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
> +	/* Filter out non-V instructions */
> +	if (!insn_is_vector(insn))
> +		return false;
> +
> +	/* Sanity check. datap should be null by the time of the first-use trap */
> +	WARN_ON(current->thread.vstate.datap);
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
> +
> -- 
> 2.17.1
> 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230320/31267376/attachment-0001.sig>
