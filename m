From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 31 Oct 2022 09:30:59 +0100
Subject: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
In-Reply-To: <Y178Q/szFZNlaFej@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-10-ajones@ventanamicro.com>
 <Y178Q/szFZNlaFej@spud>
Message-ID: <20221031083059.u6m4n73edx4ap2t5@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 30, 2022 at 10:35:47PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:47PM +0200, Andrew Jones wrote:
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
> > +	/*
> > +	 * t1 will be the Zicboz block size.
> > +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> I find this second half a little hard to parse. Do you mean "we don't
> use zicboz when a1 != 0"? IOW, is my rewording of this comment accurate?
> "A block size of zero means we're not using Zicboz. We also do not use
> Zicboz when a1 is non zero".

Yup. I'll use your words in v2.

> 
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
> 
> This one is a little hard too, I think it's because you're switching
> from "did" to "have". Maybe this is only an issue for me because this
> stuff is beyond me in terms of reviewing, so I relying on the comments a
> lot - although I suppose that makes me the target audience in a way.
> 
> I think it'd make more sense to me as "Did we go too far, or did we not
> find any blocks".

OK, I'll also take those words for v2.

Thanks,
drew

