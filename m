From: Conor Dooley <conor@kernel.org>
Date: Sun, 13 Nov 2022 22:24:30 +0000
Subject: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
In-Reply-To: <Y17i8sRf4KXLFkrK@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <Y17i8sRf4KXLFkrK@spud>
Message-ID: <Y3FuniwXbN/hRNJj@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 30, 2022 at 08:47:46PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index fa427bdcf773..bf969218f609 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),

Forgot to mention it at the time, but given Palmer submitted a resort of
this in canonical order recently - seems like zicboz should sort before
zihintpause?

> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),


