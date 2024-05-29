From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 May 2024 23:41:32 +0800
Subject: [RFC PATCH v4 4/5] RISC-V: KVM: add support for SBI_FWFT_PTE_AD_HW_UPDATING
In-Reply-To: <40da6797-faab-41f3-b4bd-766e6a117468@rivosinc.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-5-yongxuan.wang@sifive.com> <40da6797-faab-41f3-b4bd-766e6a117468@rivosinc.com>
Message-ID: <CAMWQL2g6sjWPghTSqyPj0HS3cS79=uMX1YnCkmwow7gqyVZ1nA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 28, 2024 at 6:15?PM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
>
>
> On 24/05/2024 12:33, Yong-Xuan Wang wrote:
> > Add support for SBI_FWFT_PTE_AD_HW_UPDATING to set the PTE A/D bits
> > updating behavior for Guest/VM.
> >
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +-
> >  arch/riscv/kvm/vcpu_sbi_fwft.c             | 38 +++++++++++++++++++++-
> >  2 files changed, 38 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> > index 7b7bcc5c8fee..3614a44e0a4a 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> > @@ -11,7 +11,7 @@
> >
> >  #include <asm/sbi.h>
> >
> > -#define KVM_SBI_FWFT_FEATURE_COUNT   1
> > +#define KVM_SBI_FWFT_FEATURE_COUNT   2
> >
> >  struct kvm_sbi_fwft_config;
> >  struct kvm_vcpu;
> > diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> > index 89ec263c250d..14ef74023340 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> > @@ -71,6 +71,36 @@ static int kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
> >       return SBI_SUCCESS;
> >  }
> >
> > +static int kvm_sbi_fwft_adue_supported(struct kvm_vcpu *vcpu)
> > +{
> > +     if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
> > +             return SBI_ERR_NOT_SUPPORTED;
> > +
> > +     return 0;
> > +}
> > +
> > +static int kvm_sbi_fwft_set_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
> > +                              unsigned long value)
> > +{
> > +     if (value)
> > +             vcpu->arch.cfg.henvcfg |= ENVCFG_ADUE;
> > +     else
> > +             vcpu->arch.cfg.henvcfg &= ~ENVCFG_ADUE;
> > +
> > +     return SBI_SUCCESS;
> > +}
> > +
> > +static int kvm_sbi_fwft_get_adue(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf,
> > +                              unsigned long *value)
> > +{
> > +     if (!riscv_isa_extension_available(vcpu->arch.isa, SVADU))
> > +             return SBI_ERR_NOT_SUPPORTED;
> > +
> > +     *value = !!(vcpu->arch.cfg.henvcfg & ENVCFG_ADUE);
> > +
> > +     return SBI_SUCCESS;
> > +}
>
> Hi Yong-Xuan,
>
> vcpu->arch.cfg.henvcfg seems to be used to update the HENVCFG CSR  only
> during vcpu_load()/vcpu_put(). So if this extension updates it there and
> stays in the execution loop (kvm_arch_vcpu_ioctl_run()) then, it seems
> like the HENVCFG CSR won't be updated immediately but on the next
> vcpu_load(). Is there something I'm missing ?
>
> Thanks,
>
> Cl?ment L?ger
>

Hi Cl?ment,

That's right. I will fix it in the next version. Thank you!

Regards,
Yong-Xuan

> > +
> >  static struct kvm_sbi_fwft_config *
> >  kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
> >  {
> > @@ -177,7 +207,13 @@ static const struct kvm_sbi_fwft_feature features[] = {
> >               .supported = kvm_sbi_fwft_misaligned_delegation_supported,
> >               .set = kvm_sbi_fwft_set_misaligned_delegation,
> >               .get = kvm_sbi_fwft_get_misaligned_delegation,
> > -     }
> > +     },
> > +     {
> > +             .id = SBI_FWFT_PTE_AD_HW_UPDATING,
> > +             .supported = kvm_sbi_fwft_adue_supported,
> > +             .set = kvm_sbi_fwft_set_adue,
> > +             .get = kvm_sbi_fwft_get_adue,
> > +     },
> >  };
> >
> >  static_assert(ARRAY_SIZE(features) == KVM_SBI_FWFT_FEATURE_COUNT);

