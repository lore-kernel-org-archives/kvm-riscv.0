From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Oct 2023 12:03:03 +0200
Subject: [PATCH 3/5] riscv: kernel: Use correct SYM_DATA_*() macro for
 data
In-Reply-To: <20231004143054.482091-4-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-4-cleger@rivosinc.com>
Message-ID: <20231023-153a19dd516176d3d3b9334e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 04, 2023 at 04:30:52PM +0200, Cl?ment L?ger wrote:
> Some data were incorrectly annotated with SYM_FUNC_*() instead of
> SYM_DATA_*() ones. Use the correct ones.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 64ac0dd6176b..a7aa2fd599d6 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -324,7 +324,7 @@ SYM_FUNC_END(__switch_to)
>  	.section ".rodata"
>  	.align LGREG
>  	/* Exception vector table */
> -SYM_CODE_START(excp_vect_table)
> +SYM_DATA_START_LOCAL(excp_vect_table)
>  	RISCV_PTR do_trap_insn_misaligned
>  	ALT_INSN_FAULT(RISCV_PTR do_trap_insn_fault)
>  	RISCV_PTR do_trap_insn_illegal
> @@ -342,12 +342,11 @@ SYM_CODE_START(excp_vect_table)
>  	RISCV_PTR do_page_fault   /* load page fault */
>  	RISCV_PTR do_trap_unknown
>  	RISCV_PTR do_page_fault   /* store page fault */
> -excp_vect_table_end:
> -SYM_CODE_END(excp_vect_table)
> +SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
>  
>  #ifndef CONFIG_MMU
> -SYM_CODE_START(__user_rt_sigreturn)
> +SYM_DATA_START(__user_rt_sigreturn)
>  	li a7, __NR_rt_sigreturn
>  	ecall
> -SYM_CODE_END(__user_rt_sigreturn)
> +SYM_DATA_END(__user_rt_sigreturn)
>  #endif
> -- 
> 2.42.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

