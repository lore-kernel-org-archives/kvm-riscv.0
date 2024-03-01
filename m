From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 1 Mar 2024 09:43:08 +0100
Subject: [PATCH 4/6] riscv: Enable gen_report() to print the wrong value
 in case of test failure
In-Reply-To: <20240229124246.309304-5-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-5-cem@kernel.org>
Message-ID: <20240301-6bcfc030d90fa055b8192386@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:42:10PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> If the test fails because the expected value doesn't match, it's useful to know
> what value was actually printed.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
>  riscv/sbi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index fa28d7c8..8ad8f375 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -28,7 +28,12 @@ static bool env_is_defined(const char *env)
>  static void gen_report(struct sbiret *ret, long expected)
>  {
>  	report(!ret->error, "no sbi.error");
> -	report(ret->value == expected, "expected sbi.value");
> +
> +	if (ret->value == expected)
> +		report(true, "expected sbi.value");
> +	else
> +		report(false, "expected sbi.value: %ld - Got: %ld",
> +		       expected, ret->value);

We want to keep the output line consistent for both pass and fail
in order to simplify parsing. But, since the expected value is
variable, depending on the SBI implementation under test, it's
probably best not to put the numbers in the pass/fail line, but as
info. So how about

 static void gen_report(struct sbiret *ret,
                        long expected_error, long expected_value)
 {
     report_info("expected (error: %ld, value: %ld), received: (error: %ld, value: %ld)",
                 expected_error, expected_value, ret->error, ret->value);
     report(ret->error == expected_error, "expected sbi.error");
     report(ret->value == expected_value, "expected sbi.value");
 }

I've changed this function to take the error as input because negative
tests (which we should also have) will be looking for specific errors.

Thanks,
drew


>  }
>  
>  static void check_base(void)
> -- 
> 2.43.2
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

