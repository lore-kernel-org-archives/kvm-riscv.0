From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 2 Feb 2023 08:41:20 +0100
Subject: [PATCH v3 4/6] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <mhng-39982208-6bbb-4be7-83c6-5c05da8bebc1@palmer-ri-x1c9>
References: <20230130120128.1349464-5-ajones@ventanamicro.com>
 <mhng-39982208-6bbb-4be7-83c6-5c05da8bebc1@palmer-ri-x1c9>
Message-ID: <20230202074120.ogqowzpzcopwpb5z@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 01, 2023 at 08:35:54PM -0800, Palmer Dabbelt wrote:
> On Mon, 30 Jan 2023 04:01:26 PST (-0800), ajones at ventanamicro.com wrote:
> > Using memset() to zero a 4K page takes 563 total instructions
> > where 20 are branches. clear_page() with Zicboz takes 150 total
> > instructions where 16 are branches. We could reduce the numbers
> > by further unrolling, but, since the cboz block size isn't fixed,
> > we'd need a Duff device to ensure we don't execute too many
> > unrolled steps. Also, cbo.zero doesn't take an offset, so each
> > unrolled step requires it and an add instruction. This increases
> > the chance for icache misses if we unroll many times. For these
> > reasons we only unroll four times. Unrolling four times should be
> > safe as it supports cboz block sizes up to 1K when used with 4K
> > pages and it's only 24 to 32 bytes of unrolled instructions.
> > 
> > Another note about the Duff device idea is that it would probably
> > be best to store the number of steps needed at boot time and then
> > load the value in clear_page(). Calculating it in clear_page(),
> > particularly without the Zbb extension, would not be efficient.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/Kconfig                | 13 +++++++++++
> >  arch/riscv/include/asm/insn-def.h |  4 ++++
> >  arch/riscv/include/asm/page.h     |  6 +++++-
> >  arch/riscv/lib/Makefile           |  1 +
> >  arch/riscv/lib/clear_page.S       | 36 +++++++++++++++++++++++++++++++
> >  5 files changed, 59 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/lib/clear_page.S
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 33bbdc33cef8..3759a2f6edd5 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -432,6 +432,19 @@ config RISCV_ISA_ZICBOM
> > 
> >  	   If you don't know what to do here, say Y.
> > 
> > +config RISCV_ISA_ZICBOZ
> > +	bool "Zicboz extension support for faster zeroing of memory"
> > +	depends on !XIP_KERNEL && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> > +	   when available.
> > +
> > +	   The Zicboz extension is used for faster zeroing of memory.
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZIHINTPAUSE
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index e01ab51f50d2..6960beb75f32 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -192,4 +192,8 @@
> >  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> >  	       RS1(base), SIMM12(2))
> > 
> > +#define CBO_zero(base)						\
> > +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> > +	       RS1(base), SIMM12(4))
> > +
> >  #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 9f432c1b5289..ccd168fe29d2 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -49,10 +49,14 @@
> > 
> >  #ifndef __ASSEMBLY__
> > 
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +void clear_page(void *page);
> > +#else
> >  #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
> > +#endif
> >  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
> > 
> > -#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
> > +#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
> >  #define copy_user_page(vto, vfrom, vaddr, topg) \
> >  			memcpy((vto), (vfrom), PAGE_SIZE)
> > 
> > diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> > index 25d5c9664e57..9ee5e2ab5143 100644
> > --- a/arch/riscv/lib/Makefile
> > +++ b/arch/riscv/lib/Makefile
> > @@ -5,5 +5,6 @@ lib-y			+= memset.o
> >  lib-y			+= memmove.o
> >  lib-$(CONFIG_MMU)	+= uaccess.o
> >  lib-$(CONFIG_64BIT)	+= tishift.o
> > +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> > 
> >  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > new file mode 100644
> > index 000000000000..49f29139a5b6
> > --- /dev/null
> > +++ b/arch/riscv/lib/clear_page.S
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/hwcap.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/page.h>
> > +
> > +/* void clear_page(void *page) */
> > +ENTRY(__clear_page)
> > +WEAK(clear_page)
> > +	li	a2, PAGE_SIZE
> > +	ALTERNATIVE("j .Lno_zicboz", "nop",
> > +		    0, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
> > +	la	a1, riscv_cboz_block_size
> > +	lw	a1, 0(a1)
> 
> You should be able to just "lw a1, riscv_cboz_block_size", which can
> sometimes generate better code.
> 
> > +	add	a2, a0, a2
> > +.Lzero_loop:
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> 
> We were talking about this in the patchwork call: this risks overflow if the
> block size is bigger than a quarter of a page.  That's probably pretty rare,
> but given that there's already an alternative for the jump it's easy to
> check.

I'll pull v4 together with your fixes.

Thanks!

drew

> 
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	bltu	a0, a2, .Lzero_loop
> > +	ret
> > +.Lno_zicboz:
> > +	li	a1, 0
> > +	tail	__memset
> > +END(__clear_page)

