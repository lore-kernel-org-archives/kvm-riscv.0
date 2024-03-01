From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 1 Mar 2024 09:25:21 +0100
Subject: [PATCH 1/6] riscv: Add test to probe SBI Extension
In-Reply-To: <20240229124246.309304-2-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-2-cem@kernel.org>
Message-ID: <20240229-b8364d5b7f297dcd978f952d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:42:07PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Factor out vendor id test to a new helper, and add a new test for probing the
> SBI extension.
> Compare the retrieved value against an environment variable, as the
> implementation can return any non-zero value.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
>  riscv/sbi.c | 52 ++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index ffb07a25..9dc82ecb 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -14,28 +14,56 @@ static void help(void)
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

We don't want to bail on all SBI base tests when a single expected value
environment variable is missing, but, looking ahead, I see the pattern
changes with the next patch to only skip the one test, so this patch is
fine.

>  	}
> +
> +	report_prefix_push("mvendorid");
>  	expected = strtol(getenv("MVENDORID"), NULL, 0);
>  
> -	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> -	report(!ret.error, "mvendorid: no error");
> -	report(ret.value == expected, "mvendorid");
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
> +			0, 0, 0, 0, 0, 0);

We use the Linux kernel's coding style (we encourage running the kernel's
checkpatch on patches). The kernel allows 100 chars and we're even more
tolerant of long lines in kvm-unit-tests. The zeros in sbi_ecall can be
annoying, though, so feel free to create a wrapper for a short-hand.

> +
> +	report(!ret.error, "no sbi.error");
> +	report(ret.value == expected, "expected sbi.value");
> +	report_prefix_pop();
> +
> +	if (!getenv("PROBE_EXT")) {
> +		report_skip("probe_ext: missing PROBE_EXT environment variable");
> +		return;
> +	}
> +
> +	report_prefix_push("probe_ext");
> +	expected = strtol(getenv("PROBE_EXT"), NULL, 0);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
> +			SBI_EXT_BASE, 0, 0, 0, 0, 0);
> +
> +	report(!ret.error, "no sbi.error");
> +	report(ret.value == expected, "expected sbi.value");

I think the expected value environment variable (PROBE_EXT) can be
optional in this case. Most implementations will return 0 or 1,
particularly for probing the Base extension. So, here I'd do

 expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1; 

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
>  
> -done:
>  	return report_summary();
>  }
> -- 
> 2.43.2
>

Thanks,
drew

