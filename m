From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Jul 2022 09:37:25 +0530
Subject: [PATCH 5/5] RISC-V: KVM: Add support for Svpbmt inside Guest/VM
In-Reply-To: <CAOnJCU+H_inpUj1EuvqEYx41iEguCdcC4B3Lr9TWdo+aFhFNAA@mail.gmail.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
 <20220707145248.458771-6-apatel@ventanamicro.com> <CAOnJCU+H_inpUj1EuvqEYx41iEguCdcC4B3Lr9TWdo+aFhFNAA@mail.gmail.com>
Message-ID: <CAAhSdy2cWnFTRTM3B5e2Ym8=oFiq1ScZwYeDTmWGthU-hZvmWg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 13, 2022 at 6:54 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The Guest/VM can use Svpbmt in VS-stage page tables when allowed by the
> > Hypervisor using the henvcfg.PBMTE bit.
> >
> > We add Svpbmt support for the KVM Guest/VM which can be enabled/disabled
> > by the KVM user-space (QEMU/KVMTOOL) using the ISA extension ONE_REG
> > interface.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
> >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> >  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 6d85655e7edf..17516afc389a 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -156,6 +156,18 @@
> >                                  (_AC(1, UL) << IRQ_S_TIMER) | \
> >                                  (_AC(1, UL) << IRQ_S_EXT))
> >
> > +/* xENVCFG flags */
> > +#define ENVCFG_STCE                    (_AC(1, ULL) << 63)
> > +#define ENVCFG_PBMTE                   (_AC(1, ULL) << 62)
> > +#define ENVCFG_CBZE                    (_AC(1, UL) << 7)
> > +#define ENVCFG_CBCFE                   (_AC(1, UL) << 6)
> > +#define ENVCFG_CBIE_SHIFT              4
> > +#define ENVCFG_CBIE                    (_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
> > +#define ENVCFG_CBIE_ILL                        _AC(0x0, UL)
> > +#define ENVCFG_CBIE_FLUSH              _AC(0x1, UL)
> > +#define ENVCFG_CBIE_INV                        _AC(0x3, UL)
> > +#define ENVCFG_FIOM                    _AC(0x1, UL)
> > +
> >  /* symbolic CSR names: */
> >  #define CSR_CYCLE              0xc00
> >  #define CSR_TIME               0xc01
> > @@ -252,7 +264,9 @@
> >  #define CSR_HTIMEDELTA         0x605
> >  #define CSR_HCOUNTEREN         0x606
> >  #define CSR_HGEIE              0x607
> > +#define CSR_HENVCFG            0x60a
> >  #define CSR_HTIMEDELTAH                0x615
> > +#define CSR_HENVCFGH           0x61a
> >  #define CSR_HTVAL              0x643
> >  #define CSR_HIP                        0x644
> >  #define CSR_HVIP               0x645
> > @@ -264,6 +278,8 @@
> >  #define CSR_MISA               0x301
> >  #define CSR_MIE                        0x304
> >  #define CSR_MTVEC              0x305
> > +#define CSR_MENVCFG            0x30a
> > +#define CSR_MENVCFGH           0x31a
> >  #define CSR_MSCRATCH           0x340
> >  #define CSR_MEPC               0x341
> >  #define CSR_MCAUSE             0x342
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 6119368ba6d5..24b2a6e27698 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -96,6 +96,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >         KVM_RISCV_ISA_EXT_H,
> >         KVM_RISCV_ISA_EXT_I,
> >         KVM_RISCV_ISA_EXT_M,
> > +       KVM_RISCV_ISA_EXT_SVPBMT,
> >         KVM_RISCV_ISA_EXT_MAX,
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 6dd9cf729614..b7a433c54d0f 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -51,6 +51,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >         RISCV_ISA_EXT_h,
> >         RISCV_ISA_EXT_i,
> >         RISCV_ISA_EXT_m,
> > +       RISCV_ISA_EXT_SVPBMT,
> >  };
> >
> >  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> > @@ -777,6 +778,19 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
> >         return -EINVAL;
> >  }
> >
> > +static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> > +{
> > +       u64 henvcfg = 0;
> > +
> > +       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> > +               henvcfg |= ENVCFG_PBMTE;
> > +
> > +       csr_write(CSR_HENVCFG, henvcfg);
> > +#ifdef CONFIG_32BIT
> > +       csr_write(CSR_HENVCFGH, henvcfg >> 32);
> > +#endif
> > +}
> > +
> >  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >  {
> >         struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
> > @@ -791,6 +805,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >         csr_write(CSR_HVIP, csr->hvip);
> >         csr_write(CSR_VSATP, csr->vsatp);
> >
> > +       kvm_riscv_vcpu_update_config(vcpu->arch.isa);
> > +
> >         kvm_riscv_gstage_update_hgatp(vcpu);
> >
> >         kvm_riscv_vcpu_timer_restore(vcpu);
> > --
> > 2.34.1
> >
>
> LGTM.
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>

Queued this patch for 5.20.

Thanks,
Anup

