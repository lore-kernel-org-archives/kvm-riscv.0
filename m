From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 12:11:41 +0100
Subject: [PATCH V2 2/6] riscv: Factor out environment variable check and
 report generation
In-Reply-To: <20240313084644.277426-3-cem@kernel.org>
References: <20240313084644.277426-1-cem@kernel.org>
 <20240313084644.277426-3-cem@kernel.org>
Message-ID: <20240313-ce781d871afc27c6af263b2e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 09:46:20AM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> We do check Environment variables and generate reports all the time,
> so use a couple of helpers for that
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
> 
> V2:
> 	- Rename env_is_defined() to env_or_skip()
> 	- Add information about gen_report() in the commit message
> 	- PROBE_EXT is not mandatory, so we don't need to pass it to
> 	  env_or_skip().
> 
>  riscv/sbi.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 1d73d8f1..519fcbe3 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -14,6 +14,23 @@ static void help(void)
>  	puts("An environ must be provided where expected values are given.\n");
>  }
>  
> +static bool env_or_skip(const char *env)
> +{
> +
> +	if (!getenv(env)) {
> +		report_skip("missing %s environment variable", env);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void gen_report(struct sbiret *ret, long expected)

I see you add expected_error in a later patch. I probably would have done
that here at function introduction time, but OK.

> +{
> +	report(!ret->error, "no sbi.error");
> +	report(ret->value == expected, "expected sbi.value");
> +}
> +
>  static void check_base(void)
>  {
>  	struct sbiret ret;
> @@ -21,27 +38,18 @@ static void check_base(void)
>  
>  	report_prefix_push("base");
>  
> -	if (!getenv("MVENDORID")) {
> -		report_skip("mvendorid: missing MVENDORID environment variable");
> -		return;
> -	}
> -
>  	report_prefix_push("mvendorid");
> -	expected = strtol(getenv("MVENDORID"), NULL, 0);
> -
> -	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> -
> -	report(!ret.error, "no sbi.error");
> -	report(ret.value == expected, "expected sbi.value");
> +	if (env_or_skip("MVENDORID")) {
> +		expected = strtol(getenv("MVENDORID"), NULL, 0);
> +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> +		gen_report(&ret, expected);
> +	}
>  	report_prefix_pop();
>  
>  	report_prefix_push("probe_ext");
>  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> -
>  	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
> -
> -	report(!ret.error, "no sbi.error");
> -	report(ret.value == expected, "expected sbi.value");
> +	gen_report(&ret, expected);
>  	report_prefix_pop();
>  
>  	report_prefix_pop();
> -- 
> 2.44.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

