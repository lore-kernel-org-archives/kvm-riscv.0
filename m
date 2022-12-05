From: Conor Dooley <conor@kernel.org>
Date: Mon, 5 Dec 2022 19:09:29 +0000
Subject: [PATCH v2 03/13] riscv: cpufeature: detect
 RISCV_ALTERNATIVES_EARLY_BOOT earlier
In-Reply-To: <20221204174632.3677-4-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-4-jszhang@kernel.org>
Message-ID: <Y45B6eB0BQTSZMEa@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 01:46:22AM +0800, Jisheng Zhang wrote:
> Now, the riscv_cpufeature_patch_func() do nothing in the stage of
> RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
> boot" stage earlier.
> 
> In following patch, we will make riscv_cpufeature_patch_func() scans
> all ISA extensions.

I'm not 100% on the motivation here. Let me try and regurgitate the
changelog in a way that makes more sense to me and maybe you can confirm
it.

Currently riscv_cpufeature_patch_func() does nothing at the
RISCV_ALTERNATIVES_EARLY_BOOT stage.
Add a check to detect whether we are in this stage and exit early.
This will allow us to use riscv_cpufeature_patch_func() for scanning of
all ISA extensions.

Would that be a correct summary?

Thanks,
Conor.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 364d1fe86bea..a4d2af67e05c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -305,6 +305,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
> 2.37.2
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221205/6cba4cad/attachment.sig>
