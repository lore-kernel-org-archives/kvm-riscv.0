From: Conor Dooley <conor@kernel.org>
Date: Thu, 22 Dec 2022 22:58:46 +0000
Subject: [PATCH v2 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
In-Reply-To: <Y44+QWJfaa7haS/5@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-5-jszhang@kernel.org>
 <Y44+QWJfaa7haS/5@spud>
Message-ID: <Y6ThJkjhdee2uNfS@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 05, 2022 at 06:53:53PM +0000, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Mon, Dec 05, 2022 at 01:46:23AM +0800, Jisheng Zhang wrote:
> > We will make use of ISA extension in asm files, so make the multi-letter
> > RISC-V ISA extension IDs macros rather than enums and move them and
> > those base ISA extension IDs to suitable place.
> 
> Which base ISA extension IDs? Changelog should match the patch contents,
> and it's a little unclear here since the base ISA extension IDs are
> visible here but in the context not the diff.
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 43 ++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 23 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..996884986fea 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -12,20 +12,6 @@
> >  #include <linux/bits.h>
> >  #include <uapi/asm/hwcap.h>
> >  
> > -#ifndef __ASSEMBLY__
> > -#include <linux/jump_label.h>
> > -/*
> > - * This yields a mask that user programs can use to figure out what
> > - * instruction set this cpu supports.
> > - */
> > -#define ELF_HWCAP		(elf_hwcap)
> > -
> > -enum {
> > -	CAP_HWCAP = 1,
> > -};
> > -
> > -extern unsigned long elf_hwcap;
> > -
> >  #define RISCV_ISA_EXT_a		('a' - 'a')
> >  #define RISCV_ISA_EXT_c		('c' - 'a')
> >  #define RISCV_ISA_EXT_d		('d' - 'a')
> > @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
> >  #define RISCV_ISA_EXT_BASE 26
> >  
> >  /*
> > - * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> > + * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
> >   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
> >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> >   * extensions while all the multi-letter extensions should define the next
> >   * available logical extension id.
> >   */
> > -enum riscv_isa_ext_id {
> > -	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > -	RISCV_ISA_EXT_SVPBMT,
> > -	RISCV_ISA_EXT_ZICBOM,
> > -	RISCV_ISA_EXT_ZIHINTPAUSE,
> > -	RISCV_ISA_EXT_SSTC,
> > -	RISCV_ISA_EXT_SVINVAL,
> > -	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> > +#define RISCV_ISA_EXT_SSCOFPMF		26
> > +#define RISCV_ISA_EXT_SVPBMT		27
> > +#define RISCV_ISA_EXT_ZICBOM		28
> > +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> > +#define RISCV_ISA_EXT_SSTC		30
> > +#define RISCV_ISA_EXT_SVINVAL		31
> 
> Could you re-order these alphabetically when you move them please?

On reflection, this is a horrific idea - don't bother. It'd only be
temporary anyway as it'd need massaging when the next extension comes
along.

Either people will have a slightly harder seeing if something is added,
or a "slightly" harder time finding which is the next free number or
have to reshuffle the whole thing.
The latter sounds like a prime bug breeding ground, while the former is
just a search away.
So yeah, don't bother & apologies for the noise!

> > +
> > +#ifndef __ASSEMBLY__
> > +#include <linux/jump_label.h>
> > +/*
> > + * This yields a mask that user programs can use to figure out what
> > + * instruction set this cpu supports.
> > + */
> > +#define ELF_HWCAP		(elf_hwcap)
> > +
> > +enum {
> > +	CAP_HWCAP = 1,
> >  };
> >  
> > +extern unsigned long elf_hwcap;
> > +
> >  /*
> >   * This enum represents the logical ID for each RISC-V ISA extension static
> >   * keys. We can use static key to optimize code path if some ISA extensions
> > -- 
> > 2.37.2
> > 


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20221222/57b9f567/attachment.sig>
