From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 12:33:00 +0100
Subject: [PATCH 6/6] riscv: Add a wrapper to call sbi_ecall for base
 extension
In-Reply-To: <20240313084644.277426-7-cem@kernel.org>
References: <20240313084644.277426-1-cem@kernel.org>
 <20240313084644.277426-7-cem@kernel.org>
Message-ID: <20240313-a7597b9ba706043ba95d5278@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 09:46:24AM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> All SBI extension functions accepts at most one argument, so create a
> wrapper around sbi_ecall() to avoid needing to pass in arguments 1 to 5
> all the time, also, the wrapper can specify SBI_EXT_BASE directly.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
>  riscv/sbi.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 65492fd6..82513d61 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -36,6 +36,11 @@ static void gen_report(struct sbiret *ret,
>  	report(ret->value == expected_value, "expected sbi.value");
>  }
>  
> +static inline struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)

Drop 'inline'. It's useless for static functions in .c files.

> +{
> +	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
> +}
> +
>  static void check_base(void)
>  {
>  	struct sbiret ret;
> @@ -46,7 +51,7 @@ static void check_base(void)
>  	report_prefix_push("mvendorid");
>  	if (env_or_skip("MVENDORID")) {
>  		expected = strtol(getenv("MVENDORID"), NULL, 0);
> -		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
>  		gen_report(&ret, 0, expected);
>  	}
>  	report_prefix_pop();
> @@ -54,23 +59,21 @@ static void check_base(void)
>  	report_prefix_push("sbi_impl_id");
>  	if (env_or_skip("SBI_IMPLID")) {
>  		expected = strtol(getenv("SBI_IMPLID"), NULL, 0);
> -		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID,
> -				SBI_EXT_BASE, 0, 0, 0, 0, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_ID, SBI_EXT_BASE);

As pointed out in a previous patch the arg should be zero.

>  		gen_report(&ret, 0, expected);
>  	}
>  	report_prefix_pop();
>  
>  	report_prefix_push("probe_ext");
>  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> -	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
> +	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
>  	gen_report(&ret, 0, expected);
>  	report_prefix_pop();
>  
>  	report_prefix_push("marchid");
>  	if (env_or_skip("MARCHID")) {
>  		expected = strtol(getenv("MARCHID"), NULL, 0);
> -		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
> -				SBI_EXT_BASE_GET_MARCHID, 0, 0, 0, 0, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE_GET_MARCHID);

As pointed out in a previous patch the fid should get-marchid and the arg
should be zero.

>  		gen_report(&ret, 0, expected);
>  	}
>  	report_prefix_pop();
> -- 
> 2.44.0
>

The wrapper is good, but this patch should come near the beginning of the
series so we're not adding a bunch of code in earlier patches just to
modify it later.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

