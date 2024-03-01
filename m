From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 1 Mar 2024 09:31:30 +0100
Subject: [PATCH 3/6] riscv: Implement test for architecture ID register
In-Reply-To: <20240229124246.309304-4-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-4-cem@kernel.org>
Message-ID: <20240301-cbf4c2670c3672af28883744@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:42:09PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Probe the MARCHID register and compare it to the specified MARCHID environment
> variable

Please keep commit message lines to around 70 chars long (same comment
applies to other patches as well)

> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
>  riscv/sbi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 636f907a..fa28d7c8 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -60,6 +60,17 @@ static void check_base(void)
>  	}
>  	report_prefix_pop();
>  
> +	report_prefix_push("marchid");
> +	if (env_is_defined("MARCHID")) {
> +		expected = strtol(getenv("MARCHID"), NULL, 0);
> +
> +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
> +				SBI_EXT_BASE_GET_MARCHID, 0, 0, 0, 0, 0);
> +
> +		gen_report(&ret, expected);

nit: no need for the two blank lines

> +	}
> +	report_prefix_pop();
> +
>  	report_prefix_pop();
>  }

With the rename of env_is_defined to include 'skip' somehow, then I like
the looks of this pattern.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

