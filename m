From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 3 Nov 2022 11:21:54 +0100
Subject: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
In-Reply-To: <mhng-4fd71e9d-58b8-4e65-812f-bf0624628de7@palmer-ri-x1c9a>
References: <20221027130247.31634-10-ajones@ventanamicro.com>
 <mhng-4fd71e9d-58b8-4e65-812f-bf0624628de7@palmer-ri-x1c9a>
Message-ID: <20221103102154.stqsqswonhchrdof@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 02, 2022 at 07:43:03PM -0700, Palmer Dabbelt wrote:
> On Thu, 27 Oct 2022 06:02:47 PDT (-0700), ajones at ventanamicro.com wrote:
> > RISC-V has an optimized memset() which does byte by byte writes up to
> > the first sizeof(long) aligned address, then uses Duff's device until
> > the last sizeof(long) aligned address, and finally byte by byte to
> > the end. When memset is used to zero memory and the Zicboz extension
> > is available, then we can extend that by doing the optimized memset
> > up to the first Zicboz block size aligned address, then use the
> > Zicboz zero instruction for each block to the last block size aligned
> > address, and finally the optimized memset to the end.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/lib/memset.S | 81 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index 74e4c7feec00..786b85b5e9cc 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -5,6 +5,12 @@
> > 
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/hwcap.h>
> > +
> > +#define ALT_ZICBOZ(old, new)	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZICBOZ, \
> > +					    CONFIG_RISCV_ISA_ZICBOZ)
> > 
> >  /* void *memset(void *, int, size_t) */
> >  ENTRY(__memset)
> > @@ -15,6 +21,58 @@ WEAK(memset)
> >  	sltiu	a3, a2, 16
> >  	bnez	a3, .Lfinish
> > 
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Ldo_memset", "nop")
> 
> This at least deserves a comment: the jump is PC-relative, so it'll only
> work if alternative processing happens in a way that ensures these PC
> offsets don't change.  I think this might actually work if all that section
> stuff avoids touching the PC, but that'd need to be written down if we're
> going to depend on it.

I believe the "old" instructions can be anything, so PC-relative jumps
should always work. The "new" instructions cannot contain any branch
targets outside its content though. I agree we should better document
the constraints in arch/riscv/include/asm/alternative-macros.h as
my beliefs come from some trial-and-error and also from reading the
constraints in arm64's implementation, as it appears riscv's
implementation was derived from there. I can try to do an ALTERNATIVE
documenting patch independently of this series.

> 
> That said, this is really just a static_branch implemented differently.  Can
> we just use one?

I don't think we can use static branches in assembly.

Thanks,
drew

> 
> > +	/*
> > +	 * t1 will be the Zicboz block size.
> > +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
> > +	 */
> > +	li	t1, 0
> > +	bnez	a1, .Ldo_memset
> > +	la	a3, riscv_cboz_block_size
> > +	lw	t1, 0(a3)
> > +
> > +	/*
> > +	 * Round to nearest Zicboz block-aligned address
> > +	 * greater than or equal to the start address.
> > +	 */
> > +	addi	a3, t1, -1
> > +	not	t2, a3			/* t2 is Zicboz block size mask */
> > +	add	a3, t0, a3
> > +	and	t3, a3, t2		/* t3 is Zicboz block aligned start */
> > +
> > +	/* Did we go too far or not have at least one block? */
> > +	add	a3, a0, a2
> > +	and	a3, a3, t2
> > +	bgtu	a3, t3, .Ldo_zero
> > +	li	t1, 0
> > +	j	.Ldo_memset
> > +
> > +.Ldo_zero:
> > +	/* Use Duff for initial bytes if there are any */
> > +	bne	t3, t0, .Ldo_memset
> > +
> > +.Ldo_zero2:
> > +	/* Calculate end address */
> > +	and	a3, a2, t2
> > +	add	a3, t0, a3
> > +	sub	a4, a3, t0
> > +
> > +.Lzero_loop:
> > +	CBO_ZERO(t0)
> > +	add	t0, t0, t1
> > +	bltu	t0, a3, .Lzero_loop
> > +	li	t1, 0			/* We're done with Zicboz */
> > +
> > +	sub	a2, a2, a4		/* Update count */
> > +	sltiu	a3, a2, 16
> > +	bnez	a3, .Lfinish
> > +
> > +	/* t0 is Zicboz block size aligned, so it must be SZREG aligned */
> > +	j	.Ldo_duff3
> > +#endif
> > +
> > +.Ldo_memset:
> >  	/*
> >  	 * Round to nearest XLEN-aligned address
> >  	 * greater than or equal to the start address.
> > @@ -33,6 +91,18 @@ WEAK(memset)
> > 
> >  .Ldo_duff:
> >  	/* Duff's device with 32 XLEN stores per iteration */
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Ldo_duff2", "nop")
> > +	beqz	t1, .Ldo_duff2
> > +	/* a3, "end", is start of block aligned start. a1 is 0 */
> > +	move    a3, t3
> > +	sub	a4, a3, t0		/* a4 is SZREG aligned count */
> > +	move	t4, a4			/* Save count for later, see below. */
> > +	j	.Ldo_duff4
> > +#endif
> > +
> > +.Ldo_duff2:
> >  	/* Broadcast value into all bytes */
> >  	andi	a1, a1, 0xff
> >  	slli	a3, a1, 8
> > @@ -44,10 +114,12 @@ WEAK(memset)
> >  	or	a1, a3, a1
> >  #endif
> > 
> > +.Ldo_duff3:
> >  	/* Calculate end address */
> >  	andi	a4, a2, ~(SZREG-1)
> >  	add	a3, t0, a4
> > 
> > +.Ldo_duff4:
> >  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> >  	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
> >  	neg	a4, a4
> > @@ -100,6 +172,15 @@ WEAK(memset)
> > 
> >  	addi	t0, t0, 32*SZREG
> >  	bltu	t0, a3, .Lduff_loop
> > +
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Lcount_update", "nop")
> > +	beqz	t1, .Lcount_update
> > +	sub	a2, a2, t4		/* Difference was saved above */
> > +	j	.Ldo_zero2
> > +#endif
> > +
> > +.Lcount_update:
> >  	andi	a2, a2, SZREG-1		/* Update count */
> > 
> >  .Lfinish:

