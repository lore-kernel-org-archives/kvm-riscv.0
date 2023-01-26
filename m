From: Conor Dooley <conor@kernel.org>
Date: Thu, 26 Jan 2023 21:44:41 +0000
Subject: [PATCH -next v13 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230125142056.18356-10-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-10-andy.chiu@sifive.com>
Message-ID: <Y9L0SXMpWWi9L1Ty@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:46PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
> 
> [guoren at linux.alibaba.com: First available porting to support vector
> context switching]
> [nick.knight at sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
> code refine]
> [vincent.chen at sifive.com: Fix the might_sleep issue in vstate_save,
> vstate_restore]
> [andrew at sifive.com: Optimize task switch codes of vector]
> [ruinland.tsai at sifive.com: Fix the arch_release_task_struct free wrong
> datap issue]
> [vineetg: Fixed lkp warning with W=1 build]
> [andy.chiu: Use inline asm for task switches]
> 
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

More comments about what people did than patch description, lol!

Anyways, this patch breaks the build for every config we have, so please
fix that when you are re-submitting:
https://patchwork.kernel.org/project/linux-riscv/patch/20230125142056.18356-10-andy.chiu at sifive.com/

Any of allmodconfig, rv32_defconfig, nommu_{k210,virt}_defconfig should
reproduce with gcc 12.2 - but I have no idea if it's the same same
failures for all 4.

> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/asm/switch_to.h   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/thread_info.h |  3 +++
>  arch/riscv/include/asm/vector.h      | 26 ++++++++++++++++++++++++++
>  arch/riscv/kernel/process.c          | 18 ++++++++++++++++++
>  arch/riscv/kernel/traps.c            | 14 ++++++++++++--
>  6 files changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 94a0590c6971..44d2eb381ca6 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -39,6 +39,7 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +	struct __riscv_v_state vstate;

__riscv_d_ext_state
__riscv_v_state

:thinking: These should ideally match, probably no harm in adding the
_ext to the v one, no?

> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 549bde5c970a..1a48ff89b2b5 100644
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
> @@ -111,8 +112,17 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>  	SIGBUS, BUS_ADRALN, "instruction address misaligned");
>  DO_ERROR_INFO(do_trap_insn_fault,
>  	SIGSEGV, SEGV_ACCERR, "instruction access fault");
> -DO_ERROR_INFO(do_trap_insn_illegal,
> -	SIGILL, ILL_ILLOPC, "illegal instruction");
> +
> +asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
> +{
> +	if (has_vector() && user_mode(regs)) {
> +		if (rvv_first_use_handler(regs))

And there's your build error, as this function is only added in the next
patch.

Thanks,
Conor.

> +			return;
> +	}
> +	do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
> +		      "Oops - illegal instruction");
> +}

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230126/36576346/attachment-0001.sig>
