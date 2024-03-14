From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Mar 2024 08:09:40 +0100
Subject: [PATCH V4 2/6] riscv: Add test to probe SBI Extension
In-Reply-To: <20240313215106.325766-3-cem@kernel.org>
References: <20240313215106.325766-1-cem@kernel.org>
 <20240313215106.325766-3-cem@kernel.org>
Message-ID: <20240314-89851062e8a6464de302583b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 10:50:53PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Factor out vendor id test to a new helper, and add a new test for
> probing the SBI extension.
> Compare the retrieved value against an environment variable, as the
> implementation can return any non-zero value.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> 
> ---
> V4:
> 	- rebase on previous patch update (blank line removal)
> 	- Fix sbi_ecall to pass SBI_BASE_EXT as argument
> V3:
> 	- Adapt patch to use __base_sbi_ecall
> 
>  riscv/sbi.c | 43 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 76b72a80..519c5a0c 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -19,28 +19,49 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
>  	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
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
>  	ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
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
> +	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
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

