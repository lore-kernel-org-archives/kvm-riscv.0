From: Björn Töpel <bjorn@kernel.org>
Date: Tue, 07 Feb 2023 15:36:59 +0100
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <20230125142056.18356-11-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
Message-ID: <875ycdy22c.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy,

(Keeping the huge Cc:-list for now...)

Andy Chiu <andy.chiu@sifive.com> writes:

> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> new file mode 100644
> index 000000000000..cdd58d1c8b3c
> --- /dev/null
> +++ b/arch/riscv/kernel/vector.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 SiFive
> + * Author: Andy Chiu <andy.chiu@sifive.com>
> + */
> +#include <linux/sched/signal.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +#include <linux/uaccess.h>
> +
> +#include <asm/thread_info.h>
> +#include <asm/processor.h>
> +#include <asm/insn.h>
> +#include <asm/vector.h>
> +#include <asm/ptrace.h>
> +#include <asm/bug.h>
> +
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;
> +	if (opcode == OPCODE_VECTOR) {
> +		return true;
> +	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
> +		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
> +
> +		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
> +		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
> +			return true;
> +	} else if (opcode == RVG_OPCODE_SYSTEM) {
> +		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +int rvv_thread_zalloc(void)
> +{
> +	void *datap;
> +
> +	datap = kzalloc(riscv_vsize, GFP_KERNEL);
> +	if (!datap)
> +		return -ENOMEM;
> +	current->thread.vstate.datap = datap;
> +	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_state,
> +						    datap));
> +	return 0;
> +}
> +
> +bool rvv_first_use_handler(struct pt_regs *regs)
> +{
> +	__user u32 *epc = (u32 *)regs->epc;
> +	u32 tval = (u32)regs->badaddr;
> +
> +	/* If V has been enabled then it is not the first-use trap */
> +	if (vstate_query(regs))
> +		return false;
> +	/* Get the instruction */
> +	if (!tval) {
> +		if (__get_user(tval, epc))
> +			return false;
> +	}
> +	/* Filter out non-V instructions */
> +	if (!insn_is_vector(tval))
> +		return false;
> +	/* Sanity check. datap should be null by the time of the first-use trap */
> +	WARN_ON(current->thread.vstate.datap);
> +	/*
> +	 * Now we sure that this is a V instruction. And it executes in the
> +	 * context where VS has been off. So, try to allocate the user's V
> +	 * context and resume execution.
> +	 */
> +	if (rvv_thread_zalloc()) {
> +		force_sig(SIGKILL);
> +		return true;
> +	}

Should the altstack size be taken into consideration, like x86 does in
validate_sigaltstack() (see __xstate_request_perm()).

Related; Would it make sense to implement sigaltstack_size_valid() for
riscv, analogous to x86?


Bj?rn

