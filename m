From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 31 Mar 2023 12:56:11 +0200
Subject: [PATCH -next v17 05/20] riscv: Disable Vector Instructions for kernel
 itself
In-Reply-To: <20230327164941.20491-6-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-6-andy.chiu@sifive.com>
Message-ID: <3227690.44csPzL39Z@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Montag, 27. M?rz 2023, 18:49:25 CEST schrieb Andy Chiu:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Disable vector instructions execution for kernel mode at its entrances.

nit: Might be nice to just add the simple explanation from the code-
comments that this helps for example to find illegal vector uses in the
kernel space, similar to the fpu.

> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
>  arch/riscv/kernel/entry.S |  6 +++---
>  arch/riscv/kernel/head.S  | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3fbb100bc9e4..e9ae284a55c1 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -48,10 +48,10 @@ _save_context:
>  	 * Disable user-mode memory access as it should only be set in the
>  	 * actual user copy routines.
>  	 *
> -	 * Disable the FPU to detect illegal usage of floating point in kernel
> -	 * space.
> +	 * Disable the FPU/Vector to detect illegal usage of floating point
> +	 * or vector in kernel space.
>  	 */
> -	li t0, SR_SUM | SR_FS
> +	li t0, SR_SUM | SR_FS_VS
>  
>  	REG_L s0, TASK_TI_USER_SP(tp)
>  	csrrc s1, CSR_STATUS, t0
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 3fd6a4bd9c3e..e16bb2185d55 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -140,10 +140,10 @@ secondary_start_sbi:
>  	.option pop
>  
>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>  
>  	/* Set trap vector to spin forever to help debug */
> @@ -234,10 +234,10 @@ pmp_done:
>  .option pop
>  
>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>  
>  #ifdef CONFIG_RISCV_BOOT_SPINWAIT
> 





