From: Conor Dooley <conor@kernel.org>
Date: Wed, 22 Feb 2023 17:28:04 -0000
Subject: [PATCH v5 5/8] riscv: cpufeatures: Put the upper 16 bits of
 patch ID to work
In-Reply-To: <20230221190916.572454-6-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-6-ajones@ventanamicro.com>
Message-ID: <Y/ZQk0ifXPEnenoe@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 21, 2023 at 08:09:13PM +0100, Andrew Jones wrote:
> cpufeature IDs are consecutive integers starting at 26, so a 32-bit
> patch ID allows an aircraft carrier load of feature IDs. Repurposing
> the upper 16 bits still leaves a boat load of feature IDs and gains
> 16 bits which may be used to control patching on a per patch-site
> basis.
> 
> This will be initially used in Zicboz's application to clear_page(),
> as Zicboz's block size must also be considered. In that case, the
> upper 16-bit value's role will be to convey the maximum block size
> which the Zicboz clear_page() implementation supports.
> 
> cpufeature patch sites which need to check for the existence or
> absence of other cpufeatures may also be able to make use of this.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative.h |  3 +++
>  arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
>  2 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 8f39d4e8598d..f2cb543b0bd2 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -17,6 +17,9 @@
>  #include <linux/stddef.h>
>  #include <asm/hwcap.h>
>  
> +#define PATCH_ID_CPUFEATURE_ID(p)		((u16)((u32)(p) & 0xffff))
> +#define PATCH_ID_CPUFEATURE_VALUE(p)		((u16)(((u32)(p) >> 16) & 0xffff))

I was just fiddling around a bit with macros, I think these do the same
thing:
#define PATCH_ID_CPUFEATURE_ID(p)		((p) & GENMASK(15, 0))
#define PATCH_ID_CPUFEATURE_VALUE(p)		FIELD_GET(GENMASK(31, 16), (p))
Although without the same care about types - is there a specific reason
you were casting like that?

Either way, I think I prefer this approach to the vendor_id stuffing!
If we do end up needing to fit an aircraft carrier, we can come back and
revisit another parameter in the alternatives I suppose...

I don't really know if the macros do anything to help with
understandability, so with or without trying to use macros:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
>  #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
>  #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 6102b6bb5db3..0594989ead63 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -273,12 +273,35 @@ void __init riscv_fill_hwcap(void)
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> +/*
> + * Alternative patch sites consider 48 bits when determining when to patch
> + * the old instruction sequence with the new. These bits are broken into a
> + * 16-bit vendor ID and a 32-bit patch ID. A non-zero vendor ID means the
> + * patch site is for an erratum, identified by the 32-bit patch ID. When
> + * the vendor ID is zero, the patch site is for a cpufeature. cpufeatures
> + * further break down patch ID into two 16-bit numbers. The lower 16 bits
> + * are the cpufeature ID and the upper 16 bits are used for a value specific
> + * to the cpufeature and patch site. If the upper 16 bits are zero, then it
> + * implies no specific value is specified. cpufeatures that want to control
> + * patching on a per-site basis will provide non-zero values and implement
> + * checks here. The checks return true when patching should be done, and
> + * false otherwise.
> + */
> +static bool riscv_cpufeature_patch_check(u16 id, u16 value)
> +{
> +	if (!value)
> +		return true;
> +
> +	return false;
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
>  {
>  	struct alt_entry *alt;
>  	void *oldptr, *altptr;
> +	u16 id, value;
>  
>  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>  		return;
> @@ -286,13 +309,19 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> -		if (alt->patch_id >= RISCV_ISA_EXT_MAX) {
> -			WARN(1, "This extension id:%d is not in ISA extension list",
> -				alt->patch_id);
> +
> +		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> +
> +		if (id >= RISCV_ISA_EXT_MAX) {
> +			WARN(1, "This extension id:%d is not in ISA extension list", id);
>  			continue;
>  		}
>  
> -		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
> +		if (!__riscv_isa_extension_available(NULL, id))
> +			continue;
> +
> +		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> +		if (!riscv_cpufeature_patch_check(id, value))
>  			continue;
>  
>  		oldptr = ALT_OLD_PTR(alt);
> -- 
> 2.39.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230222/e2efc39e/attachment-0001.sig>
