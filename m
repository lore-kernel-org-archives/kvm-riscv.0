From: mchitale@ventanamicro.com <mchitale@ventanamicro.com>
Date: Fri, 21 Jul 2023 13:19:50 +0530
Subject: [PATCH v1 1/6] RISC-V: Detect Smstateen extension
In-Reply-To: <20230719-egomaniac-precook-adf506f2a141@spud>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
	 <20230719160316.4048022-2-mchitale@ventanamicro.com>
	 <20230719-egomaniac-precook-adf506f2a141@spud>
Message-ID: <5972345a0a5780234bcc9b2d88e97e7eaa839c68.camel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Conor,
On Wed, 2023-07-19 at 17:27 +0100, Conor Dooley wrote:
> Hey,
> 
> On Wed, Jul 19, 2023 at 09:33:11PM +0530, Mayuresh Chitale wrote:
> > Extend the ISA string parsing to detect the Smstateen extension
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > diff --git a/arch/riscv/kernel/cpufeature.c
> > b/arch/riscv/kernel/cpufeature.c
> > index bdcf460ea53d..41c3aefcc53f 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -301,6 +301,8 @@ void __init riscv_fill_hwcap(void)
> >  			} else {
> >  				/* sorted alphabetically */
> >  				SET_ISA_EXT_MAP("smaia",
> > RISCV_ISA_EXT_SMAIA);
> > +				SET_ISA_EXT_MAP("smstateen",
> > +						RISCV_ISA_EXT_SMSTATEEN
> > );
> 
> This easily fits on one line & "smstateen" needs to be documented in
> riscv/extensions.yaml.
Ok.
> 
> Thanks,
> Conor.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


