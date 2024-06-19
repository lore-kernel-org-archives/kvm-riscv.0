From: James R T <jamestiotio@gmail.com>
Date: Wed, 19 Jun 2024 21:40:42 +0800
Subject: [kvm-unit-tests PATCH 3/4] riscv: Add methods to toggle interrupt
 enable bits
In-Reply-To: <20240619-3ba7acf7b1504529899f6cc9@orel>
References: <20240618173053.364776-1-jamestiotio@gmail.com>
 <20240618173053.364776-4-jamestiotio@gmail.com> <20240619-3ba7acf7b1504529899f6cc9@orel>
Message-ID: <CAA_Li+uQqXxb7REhDX6pzX0-T+p-WdmBcvJk9ZLK9p7TF6MtjQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 19, 2024 at 4:39?PM Andrew Jones <andrew.jones@linux.dev> wrote:
>
> On Wed, Jun 19, 2024 at 01:30:52AM GMT, James Raphael Tiovalen wrote:
> > Add some helper methods to toggle the interrupt enable bits in the SIE
> > register.
> >
> > Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> > ---
> >  riscv/Makefile            |  1 +
> >  lib/riscv/asm/csr.h       |  7 +++++++
> >  lib/riscv/asm/interrupt.h | 12 ++++++++++++
> >  lib/riscv/interrupt.c     | 39 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 59 insertions(+)
> >  create mode 100644 lib/riscv/asm/interrupt.h
> >  create mode 100644 lib/riscv/interrupt.c
> >
> > diff --git a/riscv/Makefile b/riscv/Makefile
> > index 919a3ebb..108d4481 100644
> > --- a/riscv/Makefile
> > +++ b/riscv/Makefile
> > @@ -30,6 +30,7 @@ cflatobjs += lib/memregions.o
> >  cflatobjs += lib/on-cpus.o
> >  cflatobjs += lib/vmalloc.o
> >  cflatobjs += lib/riscv/bitops.o
> > +cflatobjs += lib/riscv/interrupt.o
> >  cflatobjs += lib/riscv/io.o
> >  cflatobjs += lib/riscv/isa.o
> >  cflatobjs += lib/riscv/mmu.o
> > diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
> > index c1777744..da58b0ce 100644
> > --- a/lib/riscv/asm/csr.h
> > +++ b/lib/riscv/asm/csr.h
> > @@ -4,15 +4,22 @@
> >  #include <linux/const.h>
> >
> >  #define CSR_SSTATUS          0x100
> > +#define CSR_SIE                      0x104
> >  #define CSR_STVEC            0x105
> >  #define CSR_SSCRATCH         0x140
> >  #define CSR_SEPC             0x141
> >  #define CSR_SCAUSE           0x142
> >  #define CSR_STVAL            0x143
> > +#define CSR_SIP                      0x144
> >  #define CSR_SATP             0x180
> >
> >  #define SSTATUS_SIE          (_AC(1, UL) << 1)
> >
> > +#define SIE_SSIE             (_AC(1, UL) << 1)
> > +#define SIE_STIE             (_AC(1, UL) << 5)
> > +#define SIE_SEIE             (_AC(1, UL) << 9)
> > +#define SIE_LCOFIE           (_AC(1, UL) << 13)
> > +
> >  /* Exception cause high bit - is an interrupt if set */
> >  #define CAUSE_IRQ_FLAG               (_AC(1, UL) << (__riscv_xlen - 1))
> >
> > diff --git a/lib/riscv/asm/interrupt.h b/lib/riscv/asm/interrupt.h
> > new file mode 100644
> > index 00000000..b760afbb
> > --- /dev/null
> > +++ b/lib/riscv/asm/interrupt.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _ASMRISCV_INTERRUPT_H_
> > +#define _ASMRISCV_INTERRUPT_H_
> > +
> > +#include <stdbool.h>
> > +
> > +void toggle_software_interrupt(bool enable);
> > +void toggle_timer_interrupt(bool enable);
> > +void toggle_external_interrupt(bool enable);
> > +void toggle_local_cof_interrupt(bool enable);
> > +
> > +#endif /* _ASMRISCV_INTERRUPT_H_ */
> > diff --git a/lib/riscv/interrupt.c b/lib/riscv/interrupt.c
> > new file mode 100644
> > index 00000000..bc0e16f1
> > --- /dev/null
> > +++ b/lib/riscv/interrupt.c
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
> > + */
> > +#include <libcflat.h>
> > +#include <asm/csr.h>
> > +#include <asm/interrupt.h>
> > +
> > +void toggle_software_interrupt(bool enable)
> > +{
> > +     if (enable)
> > +             csr_set(CSR_SIE, SIE_SSIE);
> > +     else
> > +             csr_clear(CSR_SIE, SIE_SSIE);
> > +}
> > +
> > +void toggle_timer_interrupt(bool enable)
> > +{
> > +     if (enable)
> > +             csr_set(CSR_SIE, SIE_STIE);
> > +     else
> > +             csr_clear(CSR_SIE, SIE_STIE);
> > +}
> > +
> > +void toggle_external_interrupt(bool enable)
> > +{
> > +     if (enable)
> > +             csr_set(CSR_SIE, SIE_SEIE);
> > +     else
> > +             csr_clear(CSR_SIE, SIE_SEIE);
> > +}
> > +
> > +void toggle_local_cof_interrupt(bool enable)
> > +{
> > +     if (enable)
> > +             csr_set(CSR_SIE, SIE_LCOFIE);
> > +     else
> > +             csr_clear(CSR_SIE, SIE_LCOFIE);
> > +}
> > --
> > 2.43.0
> >
>
> Most of this patch seems premature since the series only needs
> toggle_timer_interrupt(). Also, I think lib/riscv/interrupt.c
> is premature because something like toggle_timer_interrupt()
> can be a static inline in a new lib/riscv/asm/timer.h file.
>

Got it. In that case, I will combine the changes with the actual test
since we will be adding only the timer interrupt code.

> And please provide two functions rather than a toggle with
> a parameter, i.e.
>
>   timer_interrupt_enable() / timer_interrupt_disable()
>

Sure, will do that.

> Thanks,
> drew

Best regards,
James Raphael Tiovalen

