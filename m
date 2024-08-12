From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 12:55:04 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: sbi: Add IPI extension support
In-Reply-To: <20240810175744.166503-2-jamestiotio@gmail.com>
References: <20240810175744.166503-1-jamestiotio@gmail.com>
 <20240810175744.166503-2-jamestiotio@gmail.com>
Message-ID: <20240812-2ba194fcf113cf3307173f3c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 11, 2024 at 01:57:42AM GMT, James Raphael Tiovalen wrote:
> Add IPI EID and FID constants and a helper function to perform the IPI
> SBI ecall.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  lib/riscv/asm/sbi.h | 5 +++++
>  riscv/sbi.c         | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
> index 73ab5438..6b485dd3 100644
> --- a/lib/riscv/asm/sbi.h
> +++ b/lib/riscv/asm/sbi.h
> @@ -17,6 +17,7 @@
>  enum sbi_ext_id {
>  	SBI_EXT_BASE = 0x10,
>  	SBI_EXT_TIME = 0x54494d45,
> +	SBI_EXT_IPI = 0x735049,
>  	SBI_EXT_HSM = 0x48534d,
>  	SBI_EXT_SRST = 0x53525354,
>  };
> @@ -42,6 +43,10 @@ enum sbi_ext_time_fid {
>  	SBI_EXT_TIME_SET_TIMER = 0,
>  };
>  
> +enum sbi_ext_ipi_fid {
> +	SBI_EXT_IPI_SEND_IPI = 0,
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 2438c497..08bd6a95 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -32,6 +32,11 @@ static struct sbiret __time_sbi_ecall(unsigned long stime_value)
>  	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
>  }
>  
> +static struct sbiret __ipi_sbi_ecall(unsigned long hart_mask, unsigned long hart_mask_base)
> +{
> +	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, hart_mask, hart_mask_base, 0, 0, 0, 0);
> +}

This will likely come in handy for other tests. Let's add it with the name
sbi_send_ipi() to lib/riscv/sbi.c instead.

Thanks,
drew

> +
>  static bool env_or_skip(const char *env)
>  {
>  	if (!getenv(env)) {
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

