From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 18 Aug 2023 09:36:07 +0200
Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
In-Reply-To: <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
 <20230817162344.17076-5-ajones@ventanamicro.com>
 <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
Message-ID: <20230818-adff57b7c6360126eb16e888@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 18, 2023 at 01:29:25AM +0000, Xu, Haibo1 wrote:
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Friday, August 18, 2023 12:24 AM
> > To: kvm-riscv at lists.infradead.org; linux-riscv at lists.infradead.org
> > Cc: anup at brainfault.org; atishp at atishpatra.org; Xu, Haibo1
> > <haibo1.xu@intel.com>; paul.walmsley at sifive.com; palmer at dabbelt.com;
> > aou at eecs.berkeley.edu
> > Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
> > 
> > With the introduction of the get-reg-list test for riscv, another directory has
> > been added that should be tracked by riscv kvm maintainers.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0f966f05fb0d..8fc9e6e7f207 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
> >  F:	arch/riscv/include/uapi/asm/kvm*
> >  F:	arch/riscv/kvm/
> >  F:	tools/testing/selftests/kvm/*/riscv/
> > +F:	tools/testing/selftests/kvm/riscv/
> > 
> LGTM!

Hi Haibo,

Please reply with a Reviewed-by tag, assuming your LGTM held the same
meaning as an r-b. See [1] to ensure it does.

[1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Thanks,
drew

