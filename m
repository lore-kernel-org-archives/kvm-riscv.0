From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 21 Jun 2024 12:00:32 +0100
Subject: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
In-Reply-To: <20240621-b22a7c677a8d61c26feaa75b@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy>
 <20240621-b22a7c677a8d61c26feaa75b@orel>
Message-ID: <20240621-pushpin-exclude-1b4f38ae7e8d@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 12:42:32PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 11:24:19AM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 10:43:58AM +0200, Andrew Jones wrote:
> > > On Wed, Jun 05, 2024 at 08:15:07PM GMT, Yong-Xuan Wang wrote:
> > > > Svade and Svadu extensions represent two schemes for managing the PTE A/D
> > > > bits. When the PTE A/D bits need to be set, Svade extension intdicates
> > > > that a related page fault will be raised. In contrast, the Svadu extension
> > > > supports hardware updating of PTE A/D bits. Since the Svade extension is
> > > > mandatory and the Svadu extension is optional in RVA23 profile, by default
> > > > the M-mode firmware will enable the Svadu extension in the menvcfg CSR
> > > > when only Svadu is present in DT.
> > > > 
> > > > This patch detects Svade and Svadu extensions from DT and adds
> > > > arch_has_hw_pte_young() to enable optimization in MGLRU and
> > > > __wp_page_copy_user() when we have the PTE A/D bits hardware updating
> > > > support.
> > > > 
> > > > Co-developed-by: Jinyu Tang <tjytimi@163.com>
> > > > Signed-off-by: Jinyu Tang <tjytimi@163.com>
> > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > ---
> > > >  arch/riscv/Kconfig               |  1 +
> > > >  arch/riscv/include/asm/csr.h     |  1 +
> > > >  arch/riscv/include/asm/hwcap.h   |  2 ++
> > > >  arch/riscv/include/asm/pgtable.h | 14 +++++++++++++-
> > > >  arch/riscv/kernel/cpufeature.c   |  2 ++
> > > >  5 files changed, 19 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index b94176e25be1..dbfe2be99bf9 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -36,6 +36,7 @@ config RISCV
> > > >  	select ARCH_HAS_PMEM_API
> > > >  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> > > >  	select ARCH_HAS_PTE_SPECIAL
> > > > +	select ARCH_HAS_HW_PTE_YOUNG
> > > >  	select ARCH_HAS_SET_DIRECT_MAP if MMU
> > > >  	select ARCH_HAS_SET_MEMORY if MMU
> > > >  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> > > > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > > > index 25966995da04..524cd4131c71 100644
> > > > --- a/arch/riscv/include/asm/csr.h
> > > > +++ b/arch/riscv/include/asm/csr.h
> > > > @@ -195,6 +195,7 @@
> > > >  /* xENVCFG flags */
> > > >  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
> > > >  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> > > > +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
> > > >  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
> > > >  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> > > >  #define ENVCFG_CBIE_SHIFT		4
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > > index e17d0078a651..35d7aa49785d 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -81,6 +81,8 @@
> > > >  #define RISCV_ISA_EXT_ZTSO		72
> > > >  #define RISCV_ISA_EXT_ZACAS		73
> > > >  #define RISCV_ISA_EXT_XANDESPMU		74
> > > > +#define RISCV_ISA_EXT_SVADE             75
> > > > +#define RISCV_ISA_EXT_SVADU		76
> > > >  
> > > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > >  
> > > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > > index aad8b8ca51f1..7287ea4a6160 100644
> > > > --- a/arch/riscv/include/asm/pgtable.h
> > > > +++ b/arch/riscv/include/asm/pgtable.h
> > > > @@ -120,6 +120,7 @@
> > > >  #include <asm/tlbflush.h>
> > > >  #include <linux/mm_types.h>
> > > >  #include <asm/compat.h>
> > > > +#include <asm/cpufeature.h>
> > > >  
> > > >  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> > > >  
> > > > @@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
> > > >  }
> > > >  
> > > >  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > > -#include <asm/cpufeature.h>
> > > >  
> > > >  static __always_inline bool has_svnapot(void)
> > > >  {
> > > > @@ -624,6 +624,18 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> > > >  	return __pgprot(prot);
> > > >  }
> > > >  
> > > > +/*
> > > > + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> > > > + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> > > > + * DT.
> > > > + */
> > > > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > > > +static inline bool arch_has_hw_pte_young(void)
> > > > +{
> > > > +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> > > > +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
> > > 
> > > It's hard to guess what is, or will be, more likely to be the correct
> > > choice of call between the _unlikely and _likely variants. But, while we
> > > assume svade is most prevalent right now, it's actually quite unlikely
> > > that 'svade' will be in the DT, since DTs haven't been putting it there
> > > yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
> > > _likely variants are better for documenting expectations than for
> > > performance.
> > 
> > binding hat off, and kernel hat on, what do we actually do if there's
> > neither Svadu or Svade in the firmware's description of the hardware?
> > Do we just arbitrarily turn on Svade, like we already do for some
> > extensions:
> > 	/*
> > 	 * These ones were as they were part of the base ISA when the
> > 	 * port & dt-bindings were upstreamed, and so can be set
> > 	 * unconditionally where `i` is in riscv,isa on DT systems.
> > 	 */
> > 	if (acpi_disabled) {
> > 		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > 	}
> >
> 
> Yes, I think that's reasonable, assuming we do it in the final "pass",
> where we're sure svadu isn't present.

I haven't thought about specifically when to do it, but does it need to
be in the final pass? If we were to, on each CPU, enable it if Svadu
isn't there, we'd either end up with a system that I suspect we're not
going to be supporting or the correct result. Or am I misunderstanding,
and it will be valid to have a subset of CPUs that have Svadu enabled
from the bootloader?

Note that it would not be problematic to have 3 CPUs with Svade + Svadu
and a 4th with only Svade in the DT because we would just not use the
FWFT mechanism to enable Svadu. It's just the Svadu in isolation case
that I'm asking about.

> Doing this is a good idea since
> we'll be able to simplify conditions, as we can just use 'if (svade)'
> since !svade would imply svadu. With FWFT and both, we'll want to remove
> svade from the isa bitmap when enabling svadu.

Right I would like to move the various extension stuff in this
direction, where they have a bit more intelligence to them, and don't
just reflect the state in DT/ACPI directly.
I've got some patches in mind once Clement's Zca etc patchset
is merged, think I posted one or two as replies to conversations on
the list already. An example would be disabling the vector crypto
extensions if we've had to disable vector, or as you suggest here,
dropping Svade if we have turned on Svadu using FWFT. I think that makes
the APIs more understandable to developers and more useful than they are
at the moment, where to use vector crypto you also need to check vector
itself for the code to be correct. If I call
riscv_isa_extension_available(), and it returns true, the extension
should be usable IMO.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240621/f26e10c3/attachment.sig>
