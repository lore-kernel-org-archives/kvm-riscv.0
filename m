From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 5 Dec 2022 23:16:30 +0800
Subject: [PATCH v2 02/13] riscv: move riscv_noncoherent_supported() out
 of ZICBOM probe
In-Reply-To: <5629547.DvuYhMxLoT@diego>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-3-jszhang@kernel.org>
 <5629547.DvuYhMxLoT@diego>
Message-ID: <Y44LTqySUMCtKoUi@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 04, 2022 at 10:52:03PM +0100, Heiko St?bner wrote:
> Am Sonntag, 4. Dezember 2022, 18:46:21 CET schrieb Jisheng Zhang:
> > It's a bit weird to call riscv_noncoherent_supported() each time when
> > insmoding a module. Move the calling out of feature patch func.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 1 -
> >  arch/riscv/kernel/setup.c      | 2 ++
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index c743f0adc794..364d1fe86bea 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -274,7 +274,6 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
> >  	if (!riscv_isa_extension_available(NULL, ZICBOM))
> >  		return false;
> >  
> > -	riscv_noncoherent_supported();
> >  	return true;
> >  }
> >  
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 86acd690d529..6eea40bf8c6b 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -300,6 +300,8 @@ void __init setup_arch(char **cmdline_p)
> >  	riscv_init_cbom_blocksize();
> >  	riscv_fill_hwcap();
> >  	apply_boot_alternatives();
> > +	if (riscv_isa_extension_available(NULL, ZICBOM))
> > +		riscv_noncoherent_supported();
> 
> hmm, this changes the behaviour slightly. In the probe function there
> is the
> 	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> 		return false;
> at the top, so with this change the second WARN_TAINT in arch_setup_dma_ops
> will behave differently

thanks for the information. below code can keep the behavior:

	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
	    riscv_isa_extension_available(NULL, ZICBOM))
		riscv_noncoherent_supported();

will wait for one more day for more review comments, then will send out
a v3
> 
> Heiko
> 
> 
> 

