From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 17:09:20 +0800
Subject: [PATCH v2 3/8] tools: riscv: Add header file csr.h
In-Reply-To: <20230906-c35fdc0e07d2cc0f9cb93203@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
 <20230904-06f09083d5190fd50e53b1ea@orel> <CAJve8on7Yi7cDuXOVznuRdTvfUhig2hZy8g72nvnHkM7omoVAw@mail.gmail.com>
 <20230906-c35fdc0e07d2cc0f9cb93203@orel>
Message-ID: <CAJve8ok-Z6VCziFj5t0=BoouZ-VLyGaqEng-dYGTFnP-CR36kw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 6, 2023 at 3:13?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Sep 06, 2023 at 02:35:42PM +0800, Haibo Xu wrote:
> > On Mon, Sep 4, 2023 at 9:33?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Sat, Sep 02, 2023 at 08:59:25PM +0800, Haibo Xu wrote:
> > > > Borrow the csr definitions and operations from kernel's
> > > > arch/riscv/include/asm/csr.h to tools/ for riscv.
> > > >
> > > > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > > > ---
> > > >  tools/arch/riscv/include/asm/csr.h | 521 +++++++++++++++++++++++++++++
> > > >  1 file changed, 521 insertions(+)
> > > >  create mode 100644 tools/arch/riscv/include/asm/csr.h
> > > >
> > > > diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
> > > > new file mode 100644
> > > > index 000000000000..4e86c82aacbd
> > > > --- /dev/null
> > > > +++ b/tools/arch/riscv/include/asm/csr.h
> > > > @@ -0,0 +1,521 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright (C) 2015 Regents of the University of California
> > > > + */
> > > > +
> > > > +#ifndef _ASM_RISCV_CSR_H
> > > > +#define _ASM_RISCV_CSR_H
> > > > +
> > > > +#include <linux/bits.h>
> > > > +
> > > > +/* Status register flags */
> > > > +#define SR_SIE               _AC(0x00000002, UL) /* Supervisor Interrupt Enable */
> > > > +#define SR_MIE               _AC(0x00000008, UL) /* Machine Interrupt Enable */
> > > > +#define SR_SPIE              _AC(0x00000020, UL) /* Previous Supervisor IE */
> > > > +#define SR_MPIE              _AC(0x00000080, UL) /* Previous Machine IE */
> > > > +#define SR_SPP               _AC(0x00000100, UL) /* Previously Supervisor */
> > > > +#define SR_MPP               _AC(0x00001800, UL) /* Previously Machine */
> > > > +#define SR_SUM               _AC(0x00040000, UL) /* Supervisor User Memory Access */
> > > > +
> > > > +#define SR_FS                _AC(0x00006000, UL) /* Floating-point Status */
> > > > +#define SR_FS_OFF    _AC(0x00000000, UL)
> > > > +#define SR_FS_INITIAL        _AC(0x00002000, UL)
> > > > +#define SR_FS_CLEAN  _AC(0x00004000, UL)
> > > > +#define SR_FS_DIRTY  _AC(0x00006000, UL)
> > > > +
> > > > +#define SR_VS                _AC(0x00000600, UL) /* Vector Status */
> > > > +#define SR_VS_OFF    _AC(0x00000000, UL)
> > > > +#define SR_VS_INITIAL        _AC(0x00000200, UL)
> > > > +#define SR_VS_CLEAN  _AC(0x00000400, UL)
> > > > +#define SR_VS_DIRTY  _AC(0x00000600, UL)
> > > > +
> > > > +#define SR_XS                _AC(0x00018000, UL) /* Extension Status */
> > > > +#define SR_XS_OFF    _AC(0x00000000, UL)
> > > > +#define SR_XS_INITIAL        _AC(0x00008000, UL)
> > > > +#define SR_XS_CLEAN  _AC(0x00010000, UL)
> > > > +#define SR_XS_DIRTY  _AC(0x00018000, UL)
> > > > +
> > > > +#define SR_FS_VS     (SR_FS | SR_VS) /* Vector and Floating-Point Unit */
> > > > +
> > > > +#ifndef CONFIG_64BIT
> > >
> > > How do we ensure CONFIG_64BIT is set?
> > >
> >
> > Currently, no explicit checking for this.
> > Shall we add a gatekeeper in this file to ensure it is set?
>
> Not in this file, since this file is shared by all the tools and...
>
> >
> > #ifndef CONFIG_64BIT
> > #error "CONFIG_64BIT was not set"
> > #endif
>
> ...we'll surely hit this error right now since nothing is setting
> CONFIG_64BIT when compiling KVM selftests.
>
> We need to define CONFIG_64BIT in the build somewhere prior to any
> headers which depend on it being included. Maybe we can simply
> add -DCONFIG_64BIT to CFLAGS, since all KVM selftests supported
> architectures are 64-bit.
>

Make sense! Another option can be just add "#define CONFIG_64BIT" at
the begin of csr.h

> (Please trim emails, as I've been doing, when discussing specific parts.)
>

Sure, thanks for the suggestions!

> Thanks,
> drew

