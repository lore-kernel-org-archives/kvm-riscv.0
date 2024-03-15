From: Carlos Maiolino <cmaiolino@redhat.com>
Date: Fri, 15 Mar 2024 17:20:01 +0100
Subject: [kvm-unit-tests PATCH 2/2] riscv: sbi: Test remaining base
 functions
In-Reply-To: <20240315133244.579425-6-ajones@ventanamicro.com>
References: <20240315133244.579425-4-ajones@ventanamicro.com>
 <20240315133244.579425-6-ajones@ventanamicro.com>
Message-ID: <l7pu3pof2momotehm5374y633sezqoctmbxknpwpxsjqro5pgj@myqw7l4kif3f>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 15, 2024 at 02:32:47PM +0100, Andrew Jones wrote:
> Add the two remaining base extension functions to the base test.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  riscv/sbi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 707ce8dd1c57..762e9711c35a 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -71,6 +71,14 @@ static void check_base(void)
>  	}
>  	report_prefix_pop();

Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>

>  
> +	report_prefix_push("impl_version");
> +	if (env_or_skip("IMPL_VERSION")) {
> +		expected = strtol(getenv("IMPL_VERSION"), NULL, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_VERSION, 0);
> +		gen_report(&ret, 0, expected);
> +	}
> +	report_prefix_pop();
> +
>  	report_prefix_push("probe_ext");
>  	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
>  	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
> @@ -93,6 +101,14 @@ static void check_base(void)
>  	}
>  	report_prefix_pop();
>  
> +	report_prefix_push("mimpid");
> +	if (env_or_skip("MIMPID")) {
> +		expected = strtol(getenv("MIMPID"), NULL, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MIMPID, 0);
> +		gen_report(&ret, 0, expected);
> +	}
> +	report_prefix_pop();
> +
>  	report_prefix_pop();
>  }
>  
> -- 
> 2.44.0
> 


