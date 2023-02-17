From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 17 Feb 2023 13:29:43 +0100
Subject: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
 <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
Message-ID: <20230217122943.24caosketyvfcc4f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 17, 2023 at 10:50:07AM +0000, Ben Dooks wrote:
> On 17/02/2023 10:18, Ben Dooks wrote:
> > On 09/02/2023 15:26, Andrew Jones wrote:
> > > Using memset() to zero a 4K page takes 563 total instructions, where
> > > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > > takes 169 total instructions, where 4 are branches and 33 are nops.
> > > Even though the block size is a variable, thanks to alternatives, we
> > > can still implement a Duff device without having to do any preliminary
> > > calculations. This is achieved by taking advantage of 'vendor_id'
> > > being used as application-specific data for alternatives, enabling us
> > > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > > loop and continue after 4K if the page size would be larger)
> > > 
> > > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > > only loop a few times and larger block sizes to not loop at all. Since
> > > cbo.zero doesn't take an offset, we also need an 'add' after each
> > > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > > is small enough to not cause icache misses.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > ? arch/riscv/Kconfig??????????????? | 13 ++++++
> > > ? arch/riscv/include/asm/insn-def.h |? 4 ++
> > > ? arch/riscv/include/asm/page.h???? |? 6 ++-
> > > ? arch/riscv/kernel/cpufeature.c??? | 11 +++++
> > > ? arch/riscv/lib/Makefile?????????? |? 1 +
> > > ? arch/riscv/lib/clear_page.S?????? | 71 +++++++++++++++++++++++++++++++
> > > ? 6 files changed, 105 insertions(+), 1 deletion(-)
> > > ? create mode 100644 arch/riscv/lib/clear_page.S
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 029d1d3b40bd..9590a1661caf 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -456,6 +456,19 @@ config RISCV_ISA_ZICBOM
> > > ???????? If you don't know what to do here, say Y.
> > > +config RISCV_ISA_ZICBOZ
> > > +??? bool "Zicboz extension support for faster zeroing of memory"
> > > +??? depends on !XIP_KERNEL && MMU
> > > +??? select RISCV_ALTERNATIVE
> > > +??? default y
> > > +??? help
> > > +?????? Enable the use of the ZICBOZ extension (cbo.zero instruction)
> > > +?????? when available.
> > > +
> > > +?????? The Zicboz extension is used for faster zeroing of memory.
> > > +
> > > +?????? If you don't know what to do here, say Y.
> > > +
> > > ? config TOOLCHAIN_HAS_ZIHINTPAUSE
> > > ????? bool
> > > ????? default y
> > > diff --git a/arch/riscv/include/asm/insn-def.h
> > > b/arch/riscv/include/asm/insn-def.h
> > > index e01ab51f50d2..6960beb75f32 100644
> > > --- a/arch/riscv/include/asm/insn-def.h
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -192,4 +192,8 @@
> > > ????? INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),??????? \
> > > ???????????? RS1(base), SIMM12(2))
> > > +#define CBO_zero(base)??????????????????????? \
> > > +??? INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),??????? \
> > > +?????????? RS1(base), SIMM12(4))
> > > +
> > > ? #endif /* __ASM_INSN_DEF_H */
> > > diff --git a/arch/riscv/include/asm/page.h
> > > b/arch/riscv/include/asm/page.h
> > > index 9f432c1b5289..ccd168fe29d2 100644
> > > --- a/arch/riscv/include/asm/page.h
> > > +++ b/arch/riscv/include/asm/page.h
> > > @@ -49,10 +49,14 @@
> > > ? #ifndef __ASSEMBLY__
> > > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > > +void clear_page(void *page);
> > > +#else
> > > ? #define clear_page(pgaddr)??????????? memset((pgaddr), 0, PAGE_SIZE)
> > > +#endif
> > > ? #define copy_page(to, from)??????????? memcpy((to), (from), PAGE_SIZE)
> > > -#define clear_user_page(pgaddr, vaddr, page)??? memset((pgaddr), 0,
> > > PAGE_SIZE)
> > > +#define clear_user_page(pgaddr, vaddr, page)??? clear_page(pgaddr)
> > > ? #define copy_user_page(vto, vfrom, vaddr, topg) \
> > > ????????????? memcpy((vto), (vfrom), PAGE_SIZE)
> > > diff --git a/arch/riscv/kernel/cpufeature.c
> > > b/arch/riscv/kernel/cpufeature.c
> > > index 74736b4f0624..42246bbfa532 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> > > ? #ifdef CONFIG_RISCV_ALTERNATIVE
> > > ? static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > > ? {
> > > +??? switch (feature) {
> > > +??? case RISCV_ISA_EXT_ZICBOZ:
> > > +??????? /*
> > > +???????? * Zicboz alternative applications provide the maximum
> > > +???????? * supported block size order, or zero when it doesn't
> > > +???????? * matter. If the current block size exceeds the maximum,
> > > +???????? * then the alternative cannot be applied.
> > > +???????? */
> > > +??????? return data == 0 || riscv_cboz_block_size <= (1U << data);
> > > +??? }
> 
> 
> 
> > > +
> > > ????? return data == 0;
> > > ? }
> > > diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> > > index 6c74b0bedd60..26cb2502ecf8 100644
> > > --- a/arch/riscv/lib/Makefile
> > > +++ b/arch/riscv/lib/Makefile
> > > @@ -8,5 +8,6 @@ lib-y??????????? += strlen.o
> > > ? lib-y??????????? += strncmp.o
> > > ? lib-$(CONFIG_MMU)??? += uaccess.o
> > > ? lib-$(CONFIG_64BIT)??? += tishift.o
> > > +lib-$(CONFIG_RISCV_ISA_ZICBOZ)??? += clear_page.o
> > > ? obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> > > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > > new file mode 100644
> > > index 000000000000..5b851e727f7c
> > > --- /dev/null
> > > +++ b/arch/riscv/lib/clear_page.S
> > > @@ -0,0 +1,71 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > > + */
> > > +
> > > +#include <linux/linkage.h>
> > > +#include <asm/asm.h>
> > > +#include <asm/alternative-macros.h>
> > > +#include <asm/hwcap.h>
> > > +#include <asm/insn-def.h>
> > > +#include <asm/page.h>
> > > +
> > > +#define CBOZ_ALT(order, old, new)??? \
> > > +??? ALTERNATIVE(old, new, order, RISCV_ISA_EXT_ZICBOZ,
> > > CONFIG_RISCV_ISA_ZICBOZ)
> > 
> > I thought this was meant to be a CPUFEATURE_ZICBOZ thing for the
> > alternatives?
> > 
> > I may also be missing something, but when backporting this to 5.19
> > to test it on our system the "order" argument is in fact the vendor-id
> > so this doesn't work as the alternatives don't get patched in at-all.
> 
> So it looks like when backporting I missed the updated in
> arch/riscv/kernel/cpufeature.c for testing the block size
> which explains the issues I was seeing with the assembly
> code.
> 
> I'm not sure why it wouldn't assemble for me with the
> RISCV_ISA_EXT_ZICBOZ being undefined.
> 
> With using vendor-id with the RISCV_ISA_EXT_ZICBOZ as the
> errata-id, would the RISCV_ISA_EXT space need to be reserved
> for any vendor specific IDs?

Hi Ben,

I'll be sending a new version where I don't touch vendor-id anymore, but
rather break errata_id into two parts: id and application-data.

Thanks,
drew

