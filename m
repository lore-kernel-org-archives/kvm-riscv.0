From: Conor Dooley <conor@kernel.org>
Date: Mon, 10 Oct 2022 19:47:20 +0100
Subject: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
In-Reply-To: <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
References: <20221010094029.1579672-1-ajones@ventanamicro.com>
 <mhng-62a2d3c7-f08d-4f40-862c-4d4f09a6150a@palmer-ri-x1c9>
Message-ID: <Y0RouN2ZciAil0YO@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 10, 2022 at 11:36:24AM -0700, Palmer Dabbelt wrote:
> On Mon, 10 Oct 2022 02:40:29 PDT (-0700), ajones at ventanamicro.com wrote:
> > Fix undefined reference of riscv_cbom_block_size when compiling KVM
> > without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
> > guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
> > dma-noncoherent.c (which is the file where riscv_cbom_block_size and
> > its initializer live).
> >
> > Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a032c4f0d600..e4453caba728 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >  	case KVM_REG_RISCV_CONFIG_REG(isa):
> >  		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >  		break;
> > +#ifdef CONFIG_RISCV_ISA_ZICBOM
> >  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >  		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> >  			return -EINVAL;
> >  		reg_val = riscv_cbom_block_size;
> >  		break;
> > +#endif
> >  	default:
> >  		return -EINVAL;
> >  	}
> 
> Thanks, looks like this is tripping up the kernelci builds too: 
> https://linux.kernelci.org/build/id/6343b37c6fd2dcbb5dcab5f3/logs/ .  
> This symbol is actually a bit odd, as we don't actually just use it 
> under Zicbom because of the T-Head stuff.  Looks like that's generically 
> broken, though, so IMO we need something like this
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..fba86fa3a628 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -5,6 +5,9 @@
> 
>  #include <asm/cacheflush.h>
> 
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL(riscv_cbom_block_size);
> +
>  #ifdef CONFIG_SMP
> 
>  #include <asm/sbi.h>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index e3f9bdf47c5f..33d21ace0971 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,7 +12,6 @@
>  #include <linux/of_device.h>
>  #include <asm/cacheflush.h>
> 
> -unsigned int riscv_cbom_block_size;
>  static bool noncoherent_supported;
> 
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> 
> which should be
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing").
> 
> We might also want the ifdef for KVM, as that would allow us to build KVM that
> doesn't support these VCPU configurations, but that's sort of a different
> question.

I assume (or hope?) this approach has the advantage of also fixing:
https://lore.kernel.org/all/202210102012.iShn6U6Q-lkp at intel.com/


