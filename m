From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 11 Nov 2024 10:17:56 +0100
Subject: [kvm-unit-tests PATCH v7 1/2] riscv: sbi: Fix entry point of HSM
 tests
In-Reply-To: <20241110171633.113515-2-jamestiotio@gmail.com>
References: <20241110171633.113515-1-jamestiotio@gmail.com>
 <20241110171633.113515-2-jamestiotio@gmail.com>
Message-ID: <20241111-a92e91173a670b48b3620222@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 11, 2024 at 01:16:32AM +0800, James Raphael Tiovalen wrote:
> With the current trick of setting opaque as hartid, the HSM tests would
> not be able to catch a bug where a0 is set to opaque and a1 is set to
> hartid. Fix this issue by setting a1 to an array with some magic number
> as the first element and hartid as the second element, following the
> behavior of the SUSP tests.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  riscv/sbi-tests.h | 13 ++++++++++---
>  riscv/sbi-asm.S   | 33 +++++++++++++++++++--------------
>  riscv/sbi.c       |  1 +
>  3 files changed, 30 insertions(+), 17 deletions(-)

This doesn't apply to the latest riscv/sbi branch, but I'll try to sort it
out.

Thanks,
drew

> 
> diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
> index d0a7561a..162f0d53 100644
> --- a/riscv/sbi-tests.h
> +++ b/riscv/sbi-tests.h
> @@ -9,9 +9,16 @@
>  #define SBI_CSR_SATP_IDX	4
>  
>  #define SBI_HSM_TEST_DONE	(1 << 0)
> -#define SBI_HSM_TEST_HARTID_A1	(1 << 1)
> -#define SBI_HSM_TEST_SATP	(1 << 2)
> -#define SBI_HSM_TEST_SIE	(1 << 3)
> +#define SBI_HSM_TEST_MAGIC_A1	(1 << 1)
> +#define SBI_HSM_TEST_HARTID_A1	(1 << 2)
> +#define SBI_HSM_TEST_SATP	(1 << 3)
> +#define SBI_HSM_TEST_SIE	(1 << 4)
> +
> +#define SBI_HSM_MAGIC		0x453
> +
> +#define SBI_HSM_MAGIC_IDX	0
> +#define SBI_HSM_HARTID_IDX	1
> +#define SBI_HSM_NUM_OF_PARAMS	2
>  
>  #define SBI_SUSP_TEST_SATP	(1 << 0)
>  #define SBI_SUSP_TEST_SIE	(1 << 1)
> diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
> index e871ea50..9ac77c5c 100644
> --- a/riscv/sbi-asm.S
> +++ b/riscv/sbi-asm.S
> @@ -30,34 +30,39 @@
>  .balign 4
>  sbi_hsm_check:
>  	li	HSM_RESULTS_MAP, 0
> -	bne	a0, a1, 1f
> +	REG_L	t0, ASMARR(a1, SBI_HSM_MAGIC_IDX)
> +	li	t1, SBI_HSM_MAGIC
> +	bne	t0, t1, 1f
> +	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_MAGIC_A1
> +1:	REG_L	t0, ASMARR(a1, SBI_HSM_HARTID_IDX)
> +	bne	a0, t0, 2f
>  	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_HARTID_A1
> -1:	csrr	t0, CSR_SATP
> -	bnez	t0, 2f
> +2:	csrr	t0, CSR_SATP
> +	bnez	t0, 3f
>  	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_SATP
> -2:	csrr	t0, CSR_SSTATUS
> +3:	csrr	t0, CSR_SSTATUS
>  	andi	t0, t0, SR_SIE
> -	bnez	t0, 3f
> +	bnez	t0, 4f
>  	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_SIE
> -3:	call	hartid_to_cpu
> +4:	call	hartid_to_cpu
>  	mv	HSM_CPU_INDEX, a0
>  	li	t0, -1
> -	bne	HSM_CPU_INDEX, t0, 5f
> -4:	pause
> -	j	4b
> -5:	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_DONE
> +	bne	HSM_CPU_INDEX, t0, 6f
> +5:	pause
> +	j	5b
> +6:	ori	HSM_RESULTS_MAP, HSM_RESULTS_MAP, SBI_HSM_TEST_DONE
>  	add	t0, HSM_RESULTS_ARRAY, HSM_CPU_INDEX
>  	sb	HSM_RESULTS_MAP, 0(t0)
>  	la	t1, sbi_hsm_stop_hart
>  	add	t1, t1, HSM_CPU_INDEX
> -6:	lb	t0, 0(t1)
> +7:	lb	t0, 0(t1)
>  	pause
> -	beqz	t0, 6b
> +	beqz	t0, 7b
>  	li	a7, 0x48534d	/* SBI_EXT_HSM */
>  	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
>  	ecall
> -7:	pause
> -	j	7b
> +8:	pause
> +	j	8b
>  
>  .balign 4
>  .global sbi_hsm_check_hart_start
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 6f2d3e35..300e5cc9 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -483,6 +483,7 @@ static void check_ipi(void)
>  unsigned char sbi_hsm_stop_hart[NR_CPUS];
>  unsigned char sbi_hsm_hart_start_checks[NR_CPUS];
>  unsigned char sbi_hsm_non_retentive_hart_suspend_checks[NR_CPUS];
> +unsigned long sbi_hsm_hart_start_params[NR_CPUS * SBI_HSM_NUM_OF_PARAMS];
>  
>  #define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
>  #define DBCN_WRITE_BYTE_TEST_BYTE	((u8)'a')
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

