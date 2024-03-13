From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 12:19:00 +0100
Subject: [PATCH V2 4/6] riscv: Enable gen_report() to print the wrong
 value in case of failure
In-Reply-To: <20240313084644.277426-5-cem@kernel.org>
References: <20240313084644.277426-1-cem@kernel.org>
 <20240313084644.277426-5-cem@kernel.org>
Message-ID: <20240313-5ecfc895c3e1aed8a053c0da@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 09:46:22AM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> If the test fails because the expected value doesn't match, it's
> useful to know what value was actually printed.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
> V2:
> 	- Reduce subject to fit 70 chars
> 	- Use report_info() to output expected vs received values,
> 	  leaving only necessary information for parsers on report()
> 
>  riscv/sbi.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 76f6111d..bc0f5c68 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -25,10 +25,15 @@ static bool env_or_skip(const char *env)
>  	return true;
>  }
>  
> -static void gen_report(struct sbiret *ret, long expected)
> +static void gen_report(struct sbiret *ret,
> +		       long expected_error, long expected_value)
>  {
> -	report(!ret->error, "no sbi.error");
> -	report(ret->value == expected, "expected sbi.value");
> +	if (ret->value != expected_value)

This should be

  if (ret->error != expected_error || ret->value != expected_value)

> +		report_info("expected (error: %ld, value: %ld), received: (error: %ld, value %ld)\n",
> +			    expected_error, expected_value, ret->error, ret->value);
> +
> +	report(ret->error == expected_error, "expected sbi.error");
> +	report(ret->value == expected_value, "expected sbi.value");

nit: We can reduce some code clutter with

 bool check_error = ret->error == expected_error;
 bool check_value = ret->value == expected_value;

 if (!check_error || !check_value)
   report_info(...);

 report(check_error, ...);
 report(check_value, ...);

>  }
>  
>  static void check_base(void)
> @@ -42,14 +47,14 @@ static void check_base(void)
>  	if (env_or_skip("MVENDORID")) {
>  		expected = strtol(getenv("MVENDORID"), NULL, 0);
>  		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
> -		gen_report(&ret, expected);
> +		gen_report(&ret, 0, expected);
>  	}
>  	report_prefix_pop();
>  
>  	report_prefix_push("probe_ext");
>  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
>  	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
> -	gen_report(&ret, expected);
> +	gen_report(&ret, 0, expected);
>  	report_prefix_pop();
>  
>  	report_prefix_push("marchid");
> @@ -57,7 +62,7 @@ static void check_base(void)
>  		expected = strtol(getenv("MARCHID"), NULL, 0);
>  		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
>  				SBI_EXT_BASE_GET_MARCHID, 0, 0, 0, 0, 0);
> -		gen_report(&ret, expected);
> +		gen_report(&ret, 0, expected);
>  	}
>  	report_prefix_pop();
>  
> -- 
> 2.44.0
>

Thanks,
drew

