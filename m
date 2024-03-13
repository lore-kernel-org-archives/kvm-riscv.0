From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Mar 2024 21:06:03 +0100
Subject: [PATCH 4/6] riscv: Implement test for architecture ID register
In-Reply-To: <20240313145336.311611-5-cem@kernel.org>
References: <20240313145336.311611-1-cem@kernel.org>
 <20240313145336.311611-5-cem@kernel.org>
Message-ID: <20240313-86cc8c945de67d8cfa0ee6cf@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 13, 2024 at 03:53:27PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Probe the MARCHID register and compare it to the specified MARCHID
> environment variable.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
> V3:
> 	- Adapt to use __base_sbi_ecall (which also fixes the wrong paramenters)
> V2:
> 	- Wrap commit message around 70 chars
> 	- Remove unneeded blank lines
> 
>  riscv/sbi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index ce0be84f..56b27765 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -57,6 +57,14 @@ static void check_base(void)
>  	gen_report(&ret, expected);
>  	report_prefix_pop();
>  
> +	report_prefix_push("marchid");
> +	if (env_or_skip("MARCHID")) {
> +		expected = strtol(getenv("MARCHID"), NULL, 0);
> +		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MARCHID, 0);
> +		gen_report(&ret, expected);
> +	}
> +	report_prefix_pop();
> +
>  	report_prefix_pop();
>  }
>  
> -- 
> 2.44.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

