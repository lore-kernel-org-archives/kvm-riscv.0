From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 1 Mar 2024 09:45:44 +0100
Subject: [PATCH 5/6] riscv: Test for specific SBI implementation ID
In-Reply-To: <20240229124246.309304-6-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-6-cem@kernel.org>
Message-ID: <20240301-0f3547e2dadd07512851f808@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:42:11PM +0100, cem at kernel.org wrote:
> From: Carlos Maiolino <cem@kernel.org>
> 
> Retrieve the ID from the SBI, and test it against the SBI_IMPLID enviroment
> variable.
> 
> Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> ---
>  riscv/sbi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 8ad8f375..9daab9dc 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -54,6 +54,16 @@ static void check_base(void)
>  	}
>  	report_prefix_pop();
>  
> +	report_prefix_push("sbi_impl_id");
> +	if (env_is_defined("SBI_IMPLID")) {
> +		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID,
> +				SBI_EXT_BASE, 0, 0, 0, 0, 0);
> +		expected = strtol(getenv("SBI_IMPLID"), NULL, 0);
> +
> +		gen_report(&ret, expected);

nit: keep this sequence of lines consistent to make it easier for
readers, i.e. always use

   expected = ...
   ret = sbi_ecal(...
   gen_report(...

> +	}
> +	report_prefix_pop();
> +
>  	report_prefix_push("probe_ext");
>  	if (env_is_defined("PROBE_EXT")) {
>  		expected = strtol(getenv("PROBE_EXT"), NULL, 0);
> -- 
> 2.43.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

