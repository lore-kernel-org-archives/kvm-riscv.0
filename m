From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 14 Nov 2022 09:29:53 +0100
Subject: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
In-Reply-To: <Y3FuniwXbN/hRNJj@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <Y17i8sRf4KXLFkrK@spud>
 <Y3FuniwXbN/hRNJj@spud>
Message-ID: <20221114082953.pidqz5icx2vqkku3@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 13, 2022 at 10:24:30PM +0000, Conor Dooley wrote:
> On Sun, Oct 30, 2022 at 08:47:46PM +0000, Conor Dooley wrote:
> > On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:
> 
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index fa427bdcf773..bf969218f609 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> 
> Forgot to mention it at the time, but given Palmer submitted a resort of
> this in canonical order recently - seems like zicboz should sort before
> zihintpause?

Will do for v2. Sorry for the delay on v2. I need to finish some other
stuff before I can get back to this.

Thanks,
drew

> 
> > >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> 

