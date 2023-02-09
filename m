From: Conor Dooley <conor@kernel.org>
Date: Thu, 09 Feb 2023 18:03:09 -0000
Subject: [PATCH v4 1/8] RISC-V: alternatives: Support patching multiple
 insns in assembly
In-Reply-To: <20230209152628.129914-2-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-2-ajones@ventanamicro.com>
Message-ID: <Y+U1UfV0oLOIHe63@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 09, 2023 at 04:26:21PM +0100, Andrew Jones wrote:
> As pointed out in commit d374a16539b1 ("RISC-V: fix compile error
> from deduplicated __ALTERNATIVE_CFG_2"), we need quotes around
> parameters passed to macros within macros to avoid spaces being
> interpreted as separators. ALT_NEW_CONTENT was trying to handle
> this by defining new_c has a vararg, but this isn't sufficient
> for calling ALTERNATIVE() from assembly with multiple instructions
> in the new/old sequences. Remove the vararg "hack" and use quotes.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 51c6867e02f3..7bc52f33f95f 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -14,7 +14,7 @@
>  	.4byte \errata_id
>  .endm
>  
> -.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
> +.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c
>  	.if \enable
>  	.pushsection .alternative, "a"
>  	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
> @@ -41,13 +41,13 @@
>  	\old_c
>  	.option pop
>  887 :
> -	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
> +	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, "\new_c"

The rationale above seems pretty reasonable to me.
My main thought is that vararg seems intentional, while the "s don't
really?
Given how much churn there is here at the moment, I think it's fairly
likely that the immediate blame will be lost quickly too.
Usually I'd err on the side of "try to explain the black magic parts of
the cosebase to mere mortals" (like me!), but this is going in with a
user & things will quickly blow up if it gets accidentally removed by
someone who doesn't see their value.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>  .endm
>  
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
>  	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
> -	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, "\new_c_2"
>  .endm
>  
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
> -- 
> 2.39.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230209/3c0b0f64/attachment-0001.sig>
