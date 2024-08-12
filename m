From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 12:58:27 +0200
Subject: [kvm-unit-tests PATCH 2/3] riscv: sbi: Add HSM extension
 functions
In-Reply-To: <20240810175744.166503-3-jamestiotio@gmail.com>
References: <20240810175744.166503-1-jamestiotio@gmail.com>
 <20240810175744.166503-3-jamestiotio@gmail.com>
Message-ID: <20240812-849b12c320b1064dc95c485c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 11, 2024 at 01:57:43AM GMT, James Raphael Tiovalen wrote:
> Add helper functions to perform hart-related operations to prepare for
> the HSM tests. Also add the HSM state IDs and default suspend type
> constants.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  lib/riscv/asm/sbi.h | 18 ++++++++++++++++++
>  lib/riscv/sbi.c     | 15 +++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 6b485dd3..5cebc4d9 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -47,6 +47,21 @@ enum sbi_ext_ipi_fid {
>  	SBI_EXT_IPI_SEND_IPI = 0,
>  };
>  
> +enum sbi_ext_hsm_sid {
> +	SBI_EXT_HSM_STARTED = 0,
> +	SBI_EXT_HSM_STOPPED,
> +	SBI_EXT_HSM_START_PENDING,
> +	SBI_EXT_HSM_STOP_PENDING,
> +	SBI_EXT_HSM_SUSPENDED,
> +	SBI_EXT_HSM_SUSPEND_PENDING,
> +	SBI_EXT_HSM_RESUME_PENDING,
> +};
> +
> +enum sbi_ext_hsm_hart_suspend_type {
> +	SBI_EXT_HSM_HART_SUSPEND_RETENTIVE = 0,
> +	SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE = 0x80000000,
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> @@ -59,6 +74,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  
>  void sbi_shutdown(void);
>  struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
> +struct sbiret sbi_hart_stop(void);
> +struct sbiret sbi_hart_get_status(unsigned long hartid);
> +struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque);
>  long sbi_probe(int ext);
>  
>  #endif /* !__ASSEMBLY__ */
> diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
> index 3d4236e5..a5c18450 100644
> --- a/lib/riscv/sbi.c
> +++ b/lib/riscv/sbi.c
> @@ -39,6 +39,21 @@ struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned
>  	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START, hartid, entry, sp, 0, 0, 0);
>  }
>  
> +struct sbiret sbi_hart_stop(void)
> +{
> +	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
> +}
> +
> +struct sbiret sbi_hart_get_status(unsigned long hartid)
> +{
> +	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STATUS, hartid, 0, 0, 0, 0, 0);
> +}
> +
> +struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque)
> +{
> +	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
> +}

Let's put sbi_hart_suspend in riscv/sbi.c for now. I can't think of why
that would useful outside of the HSM tests. stop and get-status are good
to have in the library though.

Thanks,
drew

> +
>  long sbi_probe(int ext)
>  {
>  	struct sbiret ret;
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

