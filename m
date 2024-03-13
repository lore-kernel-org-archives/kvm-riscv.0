From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 21:05:14 +0100
Subject: [PATCH 3/6] riscv: Factor out environment variable check and
 report generation
In-Reply-To: <20240313145336.311611-4-cem@kernel.org>
References: <20240313145336.311611-1-cem@kernel.org>
 <20240313145336.311611-4-cem@kernel.org>
Message-ID: <20240313-21a9ffe5d482342e0a232e63@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 03:53:26PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> We do check Environment variables and generate reports all the time,
> so use a couple of helpers for that
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
> V3:
> 	- Adapt to use __base_sbi_ecall()
> 
>  riscv/sbi.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 55bfcd42..ce0be84f 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -19,6 +19,23 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
>  	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
>  }
>  
> +static bool env_or_skip(const char *env)
> +{
> +

stray blank line here (might want to check your editor settings...)

> +	if (!getenv(env)) {
> +		report_skip("missing %s environment variable", env);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void gen_report(struct sbiret *ret, long expected)
> +{
> +	report(!ret->error, "no sbi.error");
> +	report(ret->value == expected, "expected sbi.value");
> +}
> +
>  static void check_base(void)
>  {
>  	struct sbiret ret;
> @@ -26,27 +43,18 @@ static void check_base(void)
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
> -	ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
> -
> -	report(!ret.error, "no sbi.error");
> -	report(ret.value == expected, "expected sbi.value");
> +	if (env_or_skip("MVENDORID")) {
> +		expected = strtol(getenv("MVENDORID"), NULL, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
> +		gen_report(&ret, expected);
> +	}
>  	report_prefix_pop();
>  
>  	report_prefix_push("probe_ext");
>  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> -
>  	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, 0);
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

With the fixups it'll need after fixing the last patch and the removal of
the blank line,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

