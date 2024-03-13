From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 12:06:04 +0100
Subject: [PATCH V2 1/6] riscv: Add test to probe SBI Extension
In-Reply-To: <20240313084644.277426-2-cem@kernel.org>
References: <20240313084644.277426-1-cem@kernel.org>
 <20240313084644.277426-2-cem@kernel.org>
Message-ID: <20240313-179beba6ccc2d1c01d88f0f4@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 09:46:19AM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Factor out vendor id test to a new helper, and add a new test for
> probing the SBI extension.
> Compare the retrieved value against an environment variable, as the
> implementation can return any non-zero value.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
> 
> V2:
> 	- change sbi_ecall()'s format, to fit a single line.
> 	- Make PROBE_EXT envvar optional, as suggested by Drew. This prevents
> 	  the test to bail if the envvar is not set.
> 
>  riscv/sbi.c | 43 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index ffb07a25..1d73d8f1 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -14,28 +14,49 @@ static void help(void)
>  	puts("An environ must be provided where expected values are given.\n");
>  }
>  
> -int main(int argc, char **argv)
> +static void check_base(void)
>  {
>  	struct sbiret ret;
>  	long expected;
>  
> -	if (argc > 1 && !strcmp(argv[1], "-h")) {
> -		help();
> -		exit(0);
> -	}
> -
> -	report_prefix_push("sbi");
> +	report_prefix_push("base");
>  
>  	if (!getenv("MVENDORID")) {
>  		report_skip("mvendorid: missing MVENDORID environment variable");
> -		goto done;
> +		return;
>  	}
> +
> +	report_prefix_push("mvendorid");
>  	expected = strtol(getenv("MVENDORID"), NULL, 0);
>  
>  	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> -	report(!ret.error, "mvendorid: no error");
> -	report(ret.value == expected, "mvendorid");
>  
> -done:
> +	report(!ret.error, "no sbi.error");
> +	report(ret.value == expected, "expected sbi.value");
> +	report_prefix_pop();
> +
> +	report_prefix_push("probe_ext");
> +	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
> +
> +	report(!ret.error, "no sbi.error");
> +	report(ret.value == expected, "expected sbi.value");
> +	report_prefix_pop();
> +
> +	report_prefix_pop();
> +}
> +
> +int main(int argc, char **argv)
> +{
> +
> +	if (argc > 1 && !strcmp(argv[1], "-h")) {
> +		help();
> +		exit(0);
> +	}
> +
> +	report_prefix_push("sbi");
> +	check_base();
> +
>  	return report_summary();
>  }
> -- 
> 2.44.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

