From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:11:22 +0000
Subject: [PATCH v3 03/13] riscv: cpufeature: detect
 RISCV_ALTERNATIVES_EARLY_BOOT earlier
In-Reply-To: <20230111171027.2392-4-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-4-jszhang@kernel.org>
Message-ID: <Y8B3ekXED+xY82w4@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 01:10:17AM +0800, Jisheng Zhang wrote:
> Currently riscv_cpufeature_patch_func() does nothing at the
> RISCV_ALTERNATIVES_EARLY_BOOT stage. Add a check to detect whether we
> are in this stage and exit early. This will allow us to use
> riscv_cpufeature_patch_func() for scanning of all ISA extensions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Probably overkill at this stage, but:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

BTW, would you mind CCing me on all patches in a series if I have
previously reviewed the series? Makes life easier :)

> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 421b3d9578cc..37e8c5e69754 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -328,6 +328,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	struct alt_entry *alt;
>  	u32 tmp;
>  
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/2dfb9941/attachment-0001.sig>
