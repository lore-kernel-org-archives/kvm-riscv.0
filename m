From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 23 Oct 2023 11:59:07 +0200
Subject: [PATCH 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
In-Reply-To: <20231004143054.482091-3-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-3-cleger@rivosinc.com>
Message-ID: <20231023-136cad6e15a2c5c27b6176af@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 04, 2023 at 04:30:51PM +0200, Cl?ment L?ger wrote:
...
> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
> index 1930b388c3a0..5130033e3e02 100644
> --- a/arch/riscv/lib/memmove.S
> +++ b/arch/riscv/lib/memmove.S
> @@ -7,7 +7,6 @@
>  #include <asm/asm.h>
>  
>  SYM_FUNC_START(__memmove)
> -SYM_FUNC_START_WEAK(memmove)
>  	/*
>  	 * Returns
>  	 *   a0 - dest
> @@ -314,5 +313,6 @@ SYM_FUNC_START_WEAK(memmove)
>  
>  SYM_FUNC_END(memmove)

Should this one above be removed?

>  SYM_FUNC_END(__memmove)
> +SYM_FUNC_ALIAS_WEAK(memmove, __memmove)
>  SYM_FUNC_ALIAS(__pi_memmove, __memmove)
>  SYM_FUNC_ALIAS(__pi___memmove, __memmove)
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 34c5360c6705..35f358e70bdb 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -8,8 +8,7 @@
>  #include <asm/asm.h>
>  
>  /* void *memset(void *, int, size_t) */
> -ENTRY(__memset)
> -WEAK(memset)
> +SYM_FUNC_START(__memset)
>  	move t0, a0  /* Preserve return value */
>  
>  	/* Defer to byte-oriented fill for small sizes */
> @@ -110,4 +109,5 @@ WEAK(memset)
>  	bltu t0, a3, 5b
>  6:
>  	ret
> -END(__memset)
> +SYM_FUNC_END(__memset)
> +SYM_FUNC_ALIAS_WEAK(memset, __memset)
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 09b47ebacf2e..3ab438f30d13 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -10,8 +10,7 @@
>  	_asm_extable	100b, \lbl
>  	.endm
>  
> -ENTRY(__asm_copy_to_user)
> -ENTRY(__asm_copy_from_user)
> +SYM_FUNC_START(__asm_copy_to_user)
>  
>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -181,13 +180,13 @@ ENTRY(__asm_copy_from_user)
>  	csrc CSR_STATUS, t6
>  	sub a0, t5, a0
>  	ret
> -ENDPROC(__asm_copy_to_user)
> -ENDPROC(__asm_copy_from_user)
> +SYM_FUNC_END(__asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_to_user)
> +SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)

IIUC, we'll only have debug information for __asm_copy_to_user. I'm not
sure what that means for debugging. Is it possible to generate something
confusing?

>  EXPORT_SYMBOL(__asm_copy_from_user)
>  
>  
> -ENTRY(__clear_user)
> +SYM_FUNC_START(__clear_user)
>  
>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -233,5 +232,5 @@ ENTRY(__clear_user)
>  	csrc CSR_STATUS, t6
>  	sub a0, a3, a0
>  	ret
> -ENDPROC(__clear_user)
> +SYM_FUNC_END(__clear_user)
>  EXPORT_SYMBOL(__clear_user)
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 0194f4554130..7befa276fb01 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -7,15 +7,11 @@
>   * Author: Li Zhengyu (lizhengyu3 at huawei.com)
>   *
>   */
> -
> -.macro	size, sym:req
> -	.size \sym, . - \sym
> -.endm
> +#include <linux/linkage.h>
>  
>  .text
>  
> -.globl purgatory_start
> -purgatory_start:
> +SYM_CODE_START(purgatory_start)
>  
>  	lla	sp, .Lstack
>  	mv	s0, a0	/* The hartid of the current hart */
> @@ -28,8 +24,7 @@ purgatory_start:
>  	mv	a1, s1
>  	ld	a2, riscv_kernel_entry
>  	jr	a2
> -
> -size purgatory_start
> +SYM_CODE_END(purgatory_start)
>  
>  .align 4
>  	.rept	256
> @@ -39,9 +34,8 @@ size purgatory_start
>  
>  .data
>  
> -.globl riscv_kernel_entry
> -riscv_kernel_entry:
> +SYM_DATA_START(riscv_kernel_entry)
>  	.quad	0
> -size riscv_kernel_entry
> +SYM_DATA_END(riscv_kernel_entry)

I think we could also use the shorthand version for this one-liner.

SYM_DATA(riscv_kernel_entry, quad 0)

Thanks,
drew

