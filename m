From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 May 2024 14:41:02 +0530
Subject: [RFC PATCH v4 1/5] RISC-V: Detect and Enable Svadu Extension Support
In-Reply-To: <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-2-yongxuan.wang@sifive.com> <20240527-41b376a2bfedb3b9cf7e9c7b@orel>
 <ec110587-d557-439b-ae50-f3472535ef3a@ghiti.fr> <20240530-3e5538b8e4dea932e2d3edc4@orel>
 <3b76c46f-c502-4245-ae58-be3bd3f8a41f@ghiti.fr>
Message-ID: <CAK9=C2XzAjnHxSt7Voyz5EiM2nDFXqjkAYWyaq-prKpCsHxcPw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 30, 2024 at 2:31?PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Andrew,
>
> On 30/05/2024 10:47, Andrew Jones wrote:
> > On Thu, May 30, 2024 at 10:19:12AM GMT, Alexandre Ghiti wrote:
> >> Hi Yong-Xuan,
> >>
> >> On 27/05/2024 18:25, Andrew Jones wrote:
> >>> On Fri, May 24, 2024 at 06:33:01PM GMT, Yong-Xuan Wang wrote:
> >>>> Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
> >>>>
> >>>> In this patch we detect Svadu extension support from DTB and enable it
> >>>> with SBI FWFT extension. Also we add arch_has_hw_pte_young() to enable
> >>>> optimization in MGLRU and __wp_page_copy_user() if Svadu extension is
> >>>> available.
> >>
> >> So we talked about this yesterday during the linux-riscv patchwork meeting.
> >> We came to the conclusion that we should not wait for the SBI FWFT extension
> >> to enable Svadu but instead, it should be enabled by default by openSBI if
> >> the extension is present in the device tree. This is because we did not find
> >> any backward compatibility issues, meaning that enabling Svadu should not
> >> break any S-mode software.
> > Unfortunately I joined yesterday's patchwork call late and missed this
> > discussion. I'm still not sure how we avoid concerns with S-mode software
> > expecting exceptions by purposely not setting A/D bits, but then not
> > getting those exceptions.
>
>
> Most other architectures implement hardware A/D updates, so I don't see
> what's specific in riscv. In addition, if an OS really needs the
> exceptions, it can always play with the page table permissions to
> achieve such behaviour.
>
>
> >
> >> This is what you did in your previous versions of
> >> this patchset so the changes should be easy. This behaviour must be added to
> >> the dtbinding description of the Svadu extension.
> >>
> >> Another thing that we discussed yesterday. There exist 2 schemes to manage
> >> the A/D bits updates, Svade and Svadu. If a platform supports both
> >> extensions and both are present in the device tree, it is M-mode firmware's
> >> responsibility to provide a "sane" device tree to the S-mode software,
> >> meaning the device tree can not contain both extensions. And because on such
> >> platforms, Svadu is more performant than Svade, Svadu should be enabled by
> >> the M-mode firmware and only Svadu should be present in the device tree.
> > I'm not sure firmware will be able to choose svadu when it's available.
> > For example, platforms which want to conform to the upcoming "Server
> > Platform" specification must also conform to the RVA23 profile, which
> > mandates Svade and lists Svadu as an optional extension. This implies to
> > me that S-mode should be boot with both svade and svadu in the DT and with
> > svade being the active one. Then, S-mode can choose to request switching
> > to svadu with FWFT.
>
>
> The problem is that FWFT is not there and won't be there for ~1y
> (according to Anup). So in the meantime, we prevent all uarchs that
> support Svadu to take advantage of this.

SBI v3.0 is expected to freeze by the end of this year so I don't
think we will have to wait for ~1yr.

Plus nothing stops a company to apply patches themselves to
test on their implementations. Quite a few companies have internal
forks of Linux where they track upstream patches until they are
merged.

Regards,
Anup

>
>
> >
> > Thanks,
> > drew
> >
> >> I hope that clearly explains what we discussed yesterday, let me know if you
> >> (or anyone else) need more explanations. If no one is opposed to this
> >> solution, do you think you can implement this behaviour? If not, I can deal
> >> with it, just let me know.
> >>
> >> Thanks
> >>
> >>
> >>>> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> >>>> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> >>>> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> >>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >>> I think this patch changed too much to keep r-b's. We didn't have the
> >>> FWFT part before.
> >>>
> >>>> ---
> >>>>    arch/riscv/Kconfig               |  1 +
> >>>>    arch/riscv/include/asm/csr.h     |  1 +
> >>>>    arch/riscv/include/asm/hwcap.h   |  1 +
> >>>>    arch/riscv/include/asm/pgtable.h |  8 +++++++-
> >>>>    arch/riscv/kernel/cpufeature.c   | 11 +++++++++++
> >>>>    5 files changed, 21 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>> index be09c8836d56..30fa558ee284 100644
> >>>> --- a/arch/riscv/Kconfig
> >>>> +++ b/arch/riscv/Kconfig
> >>>> @@ -34,6 +34,7 @@ config RISCV
> >>>>            select ARCH_HAS_PMEM_API
> >>>>            select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> >>>>            select ARCH_HAS_PTE_SPECIAL
> >>>> +  select ARCH_HAS_HW_PTE_YOUNG
> >>>>            select ARCH_HAS_SET_DIRECT_MAP if MMU
> >>>>            select ARCH_HAS_SET_MEMORY if MMU
> >>>>            select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> >>>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> >>>> index 2468c55933cd..2ac270ad4acd 100644
> >>>> --- a/arch/riscv/include/asm/csr.h
> >>>> +++ b/arch/riscv/include/asm/csr.h
> >>>> @@ -194,6 +194,7 @@
> >>>>    /* xENVCFG flags */
> >>>>    #define ENVCFG_STCE                     (_AC(1, ULL) << 63)
> >>>>    #define ENVCFG_PBMTE                    (_AC(1, ULL) << 62)
> >>>> +#define ENVCFG_ADUE                       (_AC(1, ULL) << 61)
> >>>>    #define ENVCFG_CBZE                     (_AC(1, UL) << 7)
> >>>>    #define ENVCFG_CBCFE                    (_AC(1, UL) << 6)
> >>>>    #define ENVCFG_CBIE_SHIFT               4
> >>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >>>> index e17d0078a651..8d539e3f4e11 100644
> >>>> --- a/arch/riscv/include/asm/hwcap.h
> >>>> +++ b/arch/riscv/include/asm/hwcap.h
> >>>> @@ -81,6 +81,7 @@
> >>>>    #define RISCV_ISA_EXT_ZTSO              72
> >>>>    #define RISCV_ISA_EXT_ZACAS             73
> >>>>    #define RISCV_ISA_EXT_XANDESPMU         74
> >>>> +#define RISCV_ISA_EXT_SVADU               75
> >>>>    #define RISCV_ISA_EXT_XLINUXENVCFG      127
> >>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> >>>> index 9f8ea0e33eb1..1f1b326ccf63 100644
> >>>> --- a/arch/riscv/include/asm/pgtable.h
> >>>> +++ b/arch/riscv/include/asm/pgtable.h
> >>>> @@ -117,6 +117,7 @@
> >>>>    #include <asm/tlbflush.h>
> >>>>    #include <linux/mm_types.h>
> >>>>    #include <asm/compat.h>
> >>>> +#include <asm/cpufeature.h>
> >>>>    #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> >>>> @@ -285,7 +286,6 @@ static inline pte_t pud_pte(pud_t pud)
> >>>>    }
> >>>>    #ifdef CONFIG_RISCV_ISA_SVNAPOT
> >>>> -#include <asm/cpufeature.h>
> >>>>    static __always_inline bool has_svnapot(void)
> >>>>    {
> >>>> @@ -621,6 +621,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> >>>>            return __pgprot(prot);
> >>>>    }
> >>>> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> >>>> +static inline bool arch_has_hw_pte_young(void)
> >>>> +{
> >>>> +  return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> >>>> +}
> >>>> +
> >>>>    /*
> >>>>     * THP functions
> >>>>     */
> >>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >>>> index 3ed2359eae35..b023908c5932 100644
> >>>> --- a/arch/riscv/kernel/cpufeature.c
> >>>> +++ b/arch/riscv/kernel/cpufeature.c
> >>>> @@ -93,6 +93,16 @@ static bool riscv_isa_extension_check(int id)
> >>>>                            return false;
> >>>>                    }
> >>>>                    return true;
> >>>> +  case RISCV_ISA_EXT_SVADU:
> >>>> +          if (sbi_probe_extension(SBI_EXT_FWFT) > 0) {
> >>> I think we've decided the appropriate way to prove for SBI extensions is
> >>> to first ensure the SBI version and then do the probe, like we do for STA
> >>> in has_pv_steal_clock()
> >>>
> >>>> +                  struct sbiret ret;
> >>>> +
> >>>> +                  ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET, SBI_FWFT_PTE_AD_HW_UPDATING,
> >>>> +                                  1, 0, 0, 0, 0);
> >>>> +
> >>>> +                  return ret.error == SBI_SUCCESS;
> >>>> +          }
> >>>> +          return false;
> >>>>            case RISCV_ISA_EXT_INVALID:
> >>>>                    return false;
> >>>>            }
> >>>> @@ -301,6 +311,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >>>>            __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> >>>>            __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >>>>            __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >>>> +  __RISCV_ISA_EXT_SUPERSET(svadu, RISCV_ISA_EXT_SVADU, riscv_xlinuxenvcfg_exts),
> >>> We do we need XLINUXENVCFG?
> >>>
> >>> Thanks,
> >>> drew
> >>>
> >>>>            __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >>>>            __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >>>>            __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >>>> --
> >>>> 2.17.1
> >>>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv at lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

