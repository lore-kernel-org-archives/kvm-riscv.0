From: Conor Dooley <conor@kernel.org>
Date: Sun, 30 Oct 2022 22:15:43 +0000
Subject: [PATCH 8/9] RISC-V: lib: Use named labels in memset
In-Reply-To: <20221027130247.31634-9-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-9-ajones@ventanamicro.com>
Message-ID: <Y173j6+YaxpLgf4E@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 03:02:46PM +0200, Andrew Jones wrote:
> In a coming patch we'll be adding more branch targets. Let's

rather minor nit: I don't think "In a coming patch" will be
particularly meaningful if anyone does some history diving.

> change the numeric labels to named labels to make it easier
> to read and integrate with.
> 
> No functional change intended.

It looks fine to me..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/lib/memset.S | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index e613c5c27998..74e4c7feec00 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -13,7 +13,7 @@ WEAK(memset)
>  
>  	/* Defer to byte-oriented fill for small sizes */
>  	sltiu	a3, a2, 16
> -	bnez	a3, 4f
> +	bnez	a3, .Lfinish
>  
>  	/*
>  	 * Round to nearest XLEN-aligned address
> @@ -21,17 +21,18 @@ WEAK(memset)
>  	 */
>  	addi	a3, t0, SZREG-1
>  	andi	a3, a3, ~(SZREG-1)
> -	beq	a3, t0, 2f		/* Skip if already aligned */
> +	beq	a3, t0, .Ldo_duff	/* Skip if already aligned */
>  
>  	/* Handle initial misalignment */
>  	sub	a4, a3, t0
> -1:
> +.Lmisaligned1:
>  	sb	a1, 0(t0)
>  	addi	t0, t0, 1
> -	bltu	t0, a3, 1b
> +	bltu	t0, a3, .Lmisaligned1
>  	sub	a2, a2, a4		/* Update count */
>  
> -2: /* Duff's device with 32 XLEN stores per iteration */
> +.Ldo_duff:
> +	/* Duff's device with 32 XLEN stores per iteration */
>  	/* Broadcast value into all bytes */
>  	andi	a1, a1, 0xff
>  	slli	a3, a1, 8
> @@ -48,7 +49,7 @@ WEAK(memset)
>  	add	a3, t0, a4
>  
>  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> -	beqz	a4, 3f			/* Shortcut if no remainder */
> +	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
>  	neg	a4, a4
>  	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
>  
> @@ -57,13 +58,13 @@ WEAK(memset)
>  
>  	/* Jump into loop body */
>  	/* Assumes 32-bit instruction lengths */
> -	la	a5, 3f
> +	la	a5, .Lduff_loop
>  #ifdef CONFIG_64BIT
>  	srli	a4, a4, 1
>  #endif
>  	add	a5, a5, a4
>  	jr	a5
> -3:
> +.Lduff_loop:
>  	REG_S	a1,        0(t0)
>  	REG_S	a1,    SZREG(t0)
>  	REG_S	a1,  2*SZREG(t0)
> @@ -98,17 +99,17 @@ WEAK(memset)
>  	REG_S	a1, 31*SZREG(t0)
>  
>  	addi	t0, t0, 32*SZREG
> -	bltu	t0, a3, 3b
> +	bltu	t0, a3, .Lduff_loop
>  	andi	a2, a2, SZREG-1		/* Update count */
>  
> -4:
> +.Lfinish:
>  	/* Handle trailing misalignment */
> -	beqz	a2, 6f
> +	beqz	a2, .Ldone
>  	add	a3, t0, a2
> -5:
> +.Lmisaligned2:
>  	sb	a1, 0(t0)
>  	addi	t0, t0, 1
> -	bltu	t0, a3, 5b
> -6:
> +	bltu	t0, a3, .Lmisaligned2
> +.Ldone:
>  	ret
>  END(__memset)
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

