From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 May 2024 23:37:43 +0800
Subject: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension Support
In-Reply-To: <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com> <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
Message-ID: <CAMWQL2iwH_hiwXD7QtzvioQsjfrU=o7jd0hWF6K-Kd=XM3w7Ng@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andrew,

On Tue, May 28, 2024 at 12:25?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, May 24, 2024 at 06:33:01PM GMT, Yong-Xuan Wang wrote:
> > Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
> >
> > In this patch we detect Svadu extension support from DTB and enable it
> > with SBI FWFT extension. Also we add arch_has_hw_pte_young() to enable
> > optimization in MGLRU and __wp_page_copy_user() if Svadu extension is
> > available.
> >
> > Co-developed-by: Jinyu Tang <tjytimi@163.com>
> > Signed-off-by: Jinyu Tang <tjytimi@163.com>
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> I think this patch changed too much to keep r-b's. We didn't have the
> FWFT part before.
>

ok, I will remove them.

> > ---
> >  arch/riscv/Kconfig               |  1 +
> >  arch/riscv/include/asm/csr.h     |  1 +
> >  arch/riscv/include/asm/hwcap.h   |  1 +
> >  arch/riscv/include/asm/pgtable.h |  8 +++++++-
> >  arch/riscv/kernel/cpufeature.c   | 11 +++++++++++
> >  5 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index be09c8836d56..30fa558ee284 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -34,6 +34,7 @@ config RISCV
> >       select ARCH_HAS_PMEM_API
> >       select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> >       select ARCH_HAS_PTE_SPECIAL
> > +     select ARCH_HAS_HW_PTE_YOUNG
> >       select ARCH_HAS_SET_DIRECT_MAP if MMU
> >       select ARCH_HAS_SET_MEMORY if MMU
> >       select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 2468c55933cd..2ac270ad4acd 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -194,6 +194,7 @@
> >  /* xENVCFG flags */
> >  #define ENVCFG_STCE                  (_AC(1, ULL) << 63)
> >  #define ENVCFG_PBMTE                 (_AC(1, ULL) << 62)
> > +#define ENVCFG_ADUE                  (_AC(1, ULL) << 61)
> >  #define ENVCFG_CBZE                  (_AC(1, UL) << 7)
> >  #define ENVCFG_CBCFE                 (_AC(1, UL) << 6)
> >  #define ENVCFG_CBIE_SHIFT            4
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index e17d0078a651..8d539e3f4e11 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -81,6 +81,7 @@
> >  #define RISCV_ISA_EXT_ZTSO           72
> >  #define RISCV_ISA_EXT_ZACAS          73
> >  #define RISCV_ISA_EXT_XANDESPMU              74
> > +#define RISCV_ISA_EXT_SVADU          75
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG   127
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 9f8ea0e33eb1..1f1b326ccf63 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -117,6 +117,7 @@
> >  #include <asm/tlbflush.h>
> >  #include <linux/mm_types.h>
> >  #include <asm/compat.h>
> > +#include <asm/cpufeature.h>
> >
> >  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> >
> > @@ -285,7 +286,6 @@ static inline pte_t pud_pte(pud_t pud)
> >  }
> >
> >  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > -#include <asm/cpufeature.h>
> >
> >  static __always_inline bool has_svnapot(void)
> >  {
> > @@ -621,6 +621,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> >       return __pgprot(prot);
> >  }
> >
> > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > +static inline bool arch_has_hw_pte_young(void)
> > +{
> > +     return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> > +}
> > +
> >  /*
> >   * THP functions
> >   */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3ed2359eae35..b023908c5932 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -93,6 +93,16 @@ static bool riscv_isa_extension_check(int id)
> >                       return false;
> >               }
> >               return true;
> > +     case RISCV_ISA_EXT_SVADU:
> > +             if (sbi_probe_extension(SBI_EXT_FWFT) > 0) {
>
> I think we've decided the appropriate way to prove for SBI extensions is
> to first ensure the SBI version and then do the probe, like we do for STA
> in has_pv_steal_clock()
>

ok, I will add the SBI version check.

> > +                     struct sbiret ret;
> > +
> > +                     ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, SBI_FWFT_PTE_AD_HW_UPDATING,
> > +                                     1, 0, 0, 0, 0);
> > +
> > +                     return ret.error == SBI_SUCCESS;
> > +             }
> > +             return false;
> >       case RISCV_ISA_EXT_INVALID:
> >               return false;
> >       }
> > @@ -301,6 +311,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >       __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > +     __RISCV_ISA_EXT_SUPERSET(svadu, RISCV_ISA_EXT_SVADU, riscv_xlinuxenvcfg_exts),
>
> We do we need XLINUXENVCFG?
>

Sorry, I misunderstood the comments of riscv_xlinuxenvcfg_exts, I will
remove it in the next version.

Regards,
Yong-Xuan


> Thanks,
> drew
>
> >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >       __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > --
> > 2.17.1
> >

