From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 21:54:04 +0000
Subject: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
In-Reply-To: <20230125142056.18356-5-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-5-andy.chiu@sifive.com>
Message-ID: <Y9Gk/FCFBbWC/Pyi@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:41PM +0000, Andy Chiu wrote:
> clear vector registers on boot if kernel supports V.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: broke this out to a seperate patch]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

But this patch didn't carry over the long list of contributors from it's
source? Seems a bit odd, that's all.
There was also an Rb from Palmer that got dropped too. Was that
intentional?
https://lore.kernel.org/linux-riscv/20220921214439.1491510-6-stillson at rivosinc.com/

Thanks,
Conor.

> ---
>  arch/riscv/kernel/head.S | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b865046e4dbb..ea803c96eeff 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -431,6 +431,29 @@ ENTRY(reset_regs)
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
>  #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +	csrr	t0, CSR_MISA
> +	li	t1, COMPAT_HWCAP_ISA_V
> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done
> +
> +	/*
> +	 * Clear vector registers and reset vcsr
> +	 * VLMAX has a defined value, VLEN is a constant,
> +	 * and this form of vsetvli is defined to set vl to VLMAX.
> +	 */
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	csrs	CSR_VCSR, x0
> +	vsetvli t1, x0, e8, m8, ta, ma
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0
> +	/* note that the caller must clear SR_VS */
> +#endif /* CONFIG_RISCV_ISA_V */
> +
>  .Lreset_regs_done:
>  	ret
>  END(reset_regs)
> -- 
> 2.17.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/3b5159b7/attachment-0001.sig>
