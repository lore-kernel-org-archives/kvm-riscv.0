From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 27 Aug 2024 17:14:13 +0200
Subject: [kvm-unit-tests PATCH] Added prefix pop at bottom of DBCN test
 function.
In-Reply-To: <20240826053309.10802-1-cade.richard@berkeley.edu>
References: <20240826053309.10802-1-cade.richard@berkeley.edu>
Message-ID: <20240827-b1109aec9abbba8ca66e1738@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 25, 2024 at 10:33:09PM GMT, Cade Richard wrote:
> Added report prefix pop at bottom of DBCN test function.
> 
> Fixes: https://lore.kernel.org/kvm/20240812141354.119889-10-andrew.jones at linux.dev/#t

This should be

Fixes: ce58d3a45d96 ("riscv: sbi: Add dbcn write test")

and without a space before the s-o-b.

I've fixed it up while queuing.

Thanks,
drew

> 
> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  riscv/sbi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 36ddfd48..01697aed 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -418,6 +418,7 @@ static void check_dbcn(void)
>  	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
>  
>  	report_prefix_pop();
> +	report_prefix_pop();
>  }
>  
>  int main(int argc, char **argv)
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

