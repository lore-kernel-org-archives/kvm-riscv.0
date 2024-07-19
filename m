From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 19 Jul 2024 14:51:46 +0800
Subject: [PATCH v7 3/4] RISC-V: KVM: Add Svade and Svadu Extensions
 Support for Guest/VM
In-Reply-To: <60555952-7307-41ed-bd6f-17a179089596@sifive.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-4-yongxuan.wang@sifive.com> <60555952-7307-41ed-bd6f-17a179089596@sifive.com>
Message-ID: <CAMWQL2hCkEeTOqk5tHhhmsxKNknzGfLq=UOQ3Xx94L59YyA_WQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel,

On Fri, Jul 19, 2024 at 8:22?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Yong-Xuan,
>
> On 2024-07-12 3:38 AM, Yong-Xuan Wang wrote:
> > We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
> > detect and enable Svade and Svadu extensions for Guest/VM. Since the
> > henvcfg.ADUE is read-only zero if the menvcfg.ADUE is zero, the Svadu
> > extension is available for Guest/VM and the Svade extension is allowed
> > to disabledonly when arch_has_hw_pte_young() is true.
> >
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/uapi/asm/kvm.h |  2 ++
> >  arch/riscv/kvm/vcpu.c             |  3 +++
> >  arch/riscv/kvm/vcpu_onereg.c      | 15 +++++++++++++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index e878e7cc3978..a5e0c35d7e9a 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
> >       KVM_RISCV_ISA_EXT_ZTSO,
> >       KVM_RISCV_ISA_EXT_ZACAS,
> >       KVM_RISCV_ISA_EXT_SSCOFPMF,
> > +     KVM_RISCV_ISA_EXT_SVADE,
> > +     KVM_RISCV_ISA_EXT_SVADU,
> >       KVM_RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 17e21df36cc1..64a15af459e0 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -540,6 +540,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> >       if (riscv_isa_extension_available(isa, ZICBOZ))
> >               cfg->henvcfg |= ENVCFG_CBZE;
> >
> > +     if (riscv_isa_extension_available(isa, SVADU))
> > +             cfg->henvcfg |= ENVCFG_ADUE;
>
> This is correct for now because patch 1 ensures the host (and therefore also the
> guest) never has both Svade and Svadu available. When that changes, this check
> will need to add an "&& !riscv_isa_extension_available(isa, SVADE)" condition so
> it matches the behavior described in the DT binding. There's no need to resend
> to make this addition, but if you do, it wouldn't hurt to include it so it's not
> forgotten later. (It looks maybe like v6 only partially implemented Andrew's
> suggestion?)
>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>

Yeah, since the PATCH1 can ensure that only Svade or Svadu will be used, so I
removed the Svade checking there. I will add it back in the next version. Thank
you!

Regards,
Yong-Xuan

> > +
> >       if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
> >               cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
> >               if (riscv_isa_extension_available(isa, SSAIA))
> > diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> > index 62874fbca29f..474fdeafe9fe 100644
> > --- a/arch/riscv/kvm/vcpu_onereg.c
> > +++ b/arch/riscv/kvm/vcpu_onereg.c
> > @@ -15,6 +15,7 @@
> >  #include <asm/cacheflush.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/kvm_vcpu_vector.h>
> > +#include <asm/pgtable.h>
> >  #include <asm/vector.h>
> >
> >  #define KVM_RISCV_BASE_ISA_MASK              GENMASK(25, 0)
> > @@ -38,6 +39,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >       KVM_ISA_EXT_ARR(SSAIA),
> >       KVM_ISA_EXT_ARR(SSCOFPMF),
> >       KVM_ISA_EXT_ARR(SSTC),
> > +     KVM_ISA_EXT_ARR(SVADE),
> > +     KVM_ISA_EXT_ARR(SVADU),
> >       KVM_ISA_EXT_ARR(SVINVAL),
> >       KVM_ISA_EXT_ARR(SVNAPOT),
> >       KVM_ISA_EXT_ARR(SVPBMT),
> > @@ -105,6 +108,12 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
> >               return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
> >       case KVM_RISCV_ISA_EXT_V:
> >               return riscv_v_vstate_ctrl_user_allowed();
> > +     case KVM_RISCV_ISA_EXT_SVADU:
> > +             /*
> > +              * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> > +              * Guest OS can use Svadu only when host os enable Svadu.
> > +              */
> > +             return arch_has_hw_pte_young();
> >       default:
> >               break;
> >       }
> > @@ -167,6 +176,12 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
> >       /* Extensions which can be disabled using Smstateen */
> >       case KVM_RISCV_ISA_EXT_SSAIA:
> >               return riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN);
> > +     case KVM_RISCV_ISA_EXT_SVADE:
> > +             /*
> > +              * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> > +              * Svade is not allowed to disable when the platform use Svade.
> > +              */
> > +             return arch_has_hw_pte_young();
> >       default:
> >               break;
> >       }
>

