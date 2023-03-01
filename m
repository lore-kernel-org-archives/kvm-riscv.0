From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 21:34:33 +0000
Subject: [PATCH -next v14 16/19] riscv: prevent stack corruption by
 reserving task_pt_regs(p) early
In-Reply-To: <20230224170118.16766-17-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-17-andy.chiu@sifive.com>
Message-ID: <d20d93b0-a36f-41e0-aa4d-8525caca7fb5@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy
On Fri, Feb 24, 2023 at 05:01:15PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Early function calls, such as setup_vm, relocate_enable_mmu,

Here, and elsewhere in the series, please append the () to functions in
commit text.

> soc_early_init etc, are free to operate on stack. However,
> PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
> reserved for the placement of per-task register context pointed by
> task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
> the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
> tests, treating the kernel to save V context before V was actually
> allocated, resulting in a kernel panic.
> 
> Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
> calls from the top-level assembly.
> 
> Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/head.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index e16bb2185d55..11c3b94c4534 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -301,6 +301,7 @@ clear_bss_done:
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
>  	XIP_FIXUP_OFFSET sp
> +	addi sp, sp, -PT_SIZE_ON_STACK
>  #ifdef CONFIG_BUILTIN_DTB
>  	la a0, __dtb_start
>  	XIP_FIXUP_OFFSET a0
> @@ -318,6 +319,7 @@ clear_bss_done:
>  	/* Restore C environment */
>  	la tp, init_task
>  	la sp, init_thread_union + THREAD_SIZE
> +	addi sp, sp, -PT_SIZE_ON_STACK

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/42d304db/attachment.sig>
