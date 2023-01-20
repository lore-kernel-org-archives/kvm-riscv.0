From: Heiko Stübner <heiko@sntech.de>
Date: Fri, 20 Jan 2023 13:20:09 +0100
Subject: [PATCH v12 06/17] riscv: Reset vector register
In-Reply-To: <20220921214439.1491510-6-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-6-stillson@rivosinc.com>
Message-ID: <2331455.NG923GbCHz@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Mittwoch, 21. September 2022, 23:43:48 CET schrieb Chris Stillson:
> @@ -431,6 +431,29 @@ ENTRY(reset_regs)
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
>  #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_VECTOR
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
> +#endif /* CONFIG_VECTOR */
> +
>  .Lreset_regs_done:

Not sure how much they go together, but the #ifdef CONFIG_FPU block above
your new VECTOR block also jumps to the same .Lreset_regs_done, so with
the patch as is the vector-reset block is never reached in the !FPU case.

So maybe making them independent of each other might prevent issues
down the roead.



