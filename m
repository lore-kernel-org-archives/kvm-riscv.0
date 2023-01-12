From: Conor Dooley <conor@kernel.org>
Date: Thu, 12 Jan 2023 21:28:55 +0000
Subject: [PATCH v3 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
In-Reply-To: <20230111171027.2392-5-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-5-jszhang@kernel.org>
Message-ID: <Y8B7lw0iPXJlr8mB@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Jisheng,

On Thu, Jan 12, 2023 at 01:10:18AM +0800, Jisheng Zhang wrote:
> We will make use of ISA extension in asm files, so make the multi-letter
> 
> RISC-V ISA extension IDs macros rather than enums and move them and
> those base ISA extension IDs to suitable place.

From v2:
Which base ISA extension IDs? Changelog should match the patch contents,
and it's a little unclear here since the base ISA extension IDs are
visible here but in the context not the diff.

How about something like:
"So that ISA extensions can be used in assembly files, convert the
multi-letter RISC-V ISA extension IDs enums to macros.
In order to make them visible, move the #ifndef __ASSEMBLY__ guard
to a later point in the header"

Pedantry perhaps, but referring to moving the base IDs looks odd, since
that is not what git thinks you did - even if that is the copy paste
operation you carried out.

Content itself is
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 45 ++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 86328e3acb02..09a7767723f6 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -12,20 +12,6 @@
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
>  
> -#ifndef __ASSEMBLY__
> -#include <linux/jump_label.h>
> -/*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this cpu supports.
> - */
> -#define ELF_HWCAP		(elf_hwcap)
> -
> -enum {
> -	CAP_HWCAP = 1,
> -};
> -
> -extern unsigned long elf_hwcap;
> -
>  #define RISCV_ISA_EXT_a		('a' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
> @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_BASE 26
>  
>  /*
> - * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> + * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
>   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the next
>   * available logical extension id.
>   */
> -enum riscv_isa_ext_id {
> -	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> -	RISCV_ISA_EXT_SVPBMT,
> -	RISCV_ISA_EXT_ZICBOM,
> -	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_SVINVAL,
> -	RISCV_ISA_EXT_ID_MAX
> +#define RISCV_ISA_EXT_SSCOFPMF		26
> +#define RISCV_ISA_EXT_SVPBMT		27
> +#define RISCV_ISA_EXT_ZICBOM		28
> +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> +#define RISCV_ISA_EXT_SSTC		30
> +#define RISCV_ISA_EXT_SVINVAL		31
> +
> +#ifndef __ASSEMBLY__
> +#include <linux/jump_label.h>
> +/*
> + * This yields a mask that user programs can use to figure out what
> + * instruction set this cpu supports.
> + */
> +#define ELF_HWCAP		(elf_hwcap)
> +
> +enum {
> +	CAP_HWCAP = 1,
>  };
> -static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> +
> +extern unsigned long elf_hwcap;
> +
>  
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
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
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230112/cfe063ff/attachment-0001.sig>
