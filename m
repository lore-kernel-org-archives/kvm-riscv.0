From: Chao Du <duchao@eswincomputing.com>
Date: Fri, 1 Mar 2024 14:35:22 +0800 (GMT+08:00)
Subject: [PATCH v2 1/3] RISC-V: KVM: Implement
 kvm_arch_vcpu_ioctl_set_guest_debug()
In-Reply-To: <CAAhSdy2+_+t4L8LHmYcJQZBGJHj6pyFm26_KwFBahFxz7eV1fQ@mail.gmail.com>
References: <20240301013545.10403-1-duchao@eswincomputing.com>
 <20240301013545.10403-2-duchao@eswincomputing.com>
 <CAAhSdy2+_+t4L8LHmYcJQZBGJHj6pyFm26_KwFBahFxz7eV1fQ@mail.gmail.com>
Message-ID: <1f31ec16.1447.18df8b97f73.Coremail.duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-03-01 13:00, Anup Patel <anup@brainfault.org> wrote:
> 
> On Fri, Mar 1, 2024 at 7:08?AM Chao Du <duchao@eswincomputing.com> wrote:
> >
> > kvm_vm_ioctl_check_extension(): Return 1 if KVM_CAP_SET_GUEST_DEBUG is
> > been checked.
> >
> > kvm_arch_vcpu_ioctl_set_guest_debug(): Update the guest_debug flags
> > from userspace accordingly. Route the breakpoint exceptions to HS mode
> > if the VCPU is being debugged by userspace, by clearing the
> > corresponding bit in hedeleg. Write the actual CSR in
> > kvm_arch_vcpu_load().
> >
> > Signed-off-by: Chao Du <duchao@eswincomputing.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 17 +++++++++++++++++
> >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> >  arch/riscv/kvm/main.c             | 18 ++----------------
> >  arch/riscv/kvm/vcpu.c             | 15 +++++++++++++--
> >  arch/riscv/kvm/vm.c               |  1 +
> >  5 files changed, 34 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 484d04a92fa6..9ee3f03ba5d1 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -43,6 +43,22 @@
> >         KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
> >  #define KVM_REQ_STEAL_UPDATE           KVM_ARCH_REQ(6)
> >
> > +#define KVM_HEDELEG_DEFAULT            ((_AC(1, UL) << EXC_INST_MISALIGNED) | \
> > +                                        (_AC(1, UL) << EXC_BREAKPOINT) | \
> > +                                        (_AC(1, UL) << EXC_SYSCALL) | \
> > +                                        (_AC(1, UL) << EXC_INST_PAGE_FAULT) | \
> > +                                        (_AC(1, UL) << EXC_LOAD_PAGE_FAULT) | \
> > +                                        (_AC(1, UL) << EXC_STORE_PAGE_FAULT))
> 
> Use BIT(xyz) here. For example: BIT(EXC_INST_MISALIGNED)

Thanks, I will use BIT() instead in next revision.

> 

> Also, BIT(EXC_BREAKPOINT) should not be part of KVM_HEDELEG_DEFAULT.

I think the bit EXC_BREAKPOINT should be set by default, like what you
already did in kvm_arch_hardware_enable(). Then the VS could get the ebreak
and handle it accordingly.

If the guest_debug is enabled, ebreak instructions are inserted by the
userspace(QEMU). So KVM should 'intercept' the ebreak and exit to QEMU.
Bit EXC_BREAKPOINT should be cleared in this case.

> 
> > +#define KVM_HEDELEG_GUEST_DEBUG                ((_AC(1, UL) << EXC_INST_MISALIGNED) | \
> > +                                        (_AC(1, UL) << EXC_SYSCALL) | \
> > +                                        (_AC(1, UL) << EXC_INST_PAGE_FAULT) | \
> > +                                        (_AC(1, UL) << EXC_LOAD_PAGE_FAULT) | \
> > +                                        (_AC(1, UL) << EXC_STORE_PAGE_FAULT))
> 
> No need for KVM_HEDELEG_GUEST_DEBUG, see below.
> 
> > +
> > +#define KVM_HIDELEG_DEFAULT            ((_AC(1, UL) << IRQ_VS_SOFT) | \
> > +                                        (_AC(1, UL) << IRQ_VS_TIMER) | \
> > +                                        (_AC(1, UL) << IRQ_VS_EXT))
> > +
> 
> Same as above, use BIT(xyz) here.
> 
> >  enum kvm_riscv_hfence_type {
> >         KVM_RISCV_HFENCE_UNKNOWN = 0,
> >         KVM_RISCV_HFENCE_GVMA_VMID_GPA,
> > @@ -169,6 +185,7 @@ struct kvm_vcpu_csr {
> >  struct kvm_vcpu_config {
> >         u64 henvcfg;
> >         u64 hstateen0;
> > +       unsigned long hedeleg;
> >  };
> >
> >  struct kvm_vcpu_smstateen_csr {
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 7499e88a947c..39f4f4b9dede 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -17,6 +17,7 @@
> >
> >  #define __KVM_HAVE_IRQ_LINE
> >  #define __KVM_HAVE_READONLY_MEM
> > +#define __KVM_HAVE_GUEST_DEBUG
> >
> >  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
> >
> > diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> > index 225a435d9c9a..bab2ec34cd87 100644
> > --- a/arch/riscv/kvm/main.c
> > +++ b/arch/riscv/kvm/main.c
> > @@ -22,22 +22,8 @@ long kvm_arch_dev_ioctl(struct file *filp,
> >
> >  int kvm_arch_hardware_enable(void)
> >  {
> > -       unsigned long hideleg, hedeleg;
> > -
> > -       hedeleg = 0;
> > -       hedeleg |= (1UL << EXC_INST_MISALIGNED);
> > -       hedeleg |= (1UL << EXC_BREAKPOINT);
> > -       hedeleg |= (1UL << EXC_SYSCALL);
> > -       hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
> > -       hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
> > -       hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
> > -       csr_write(CSR_HEDELEG, hedeleg);
> > -
> > -       hideleg = 0;
> > -       hideleg |= (1UL << IRQ_VS_SOFT);
> > -       hideleg |= (1UL << IRQ_VS_TIMER);
> > -       hideleg |= (1UL << IRQ_VS_EXT);
> > -       csr_write(CSR_HIDELEG, hideleg);
> > +       csr_write(CSR_HEDELEG, KVM_HEDELEG_DEFAULT);
> > +       csr_write(CSR_HIDELEG, KVM_HIDELEG_DEFAULT);
> >
> >         /* VS should access only the time counter directly. Everything else should trap */
> >         csr_write(CSR_HCOUNTEREN, 0x02);
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index b5ca9f2e98ac..242076c2227f 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -475,8 +475,15 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
> >  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
> >                                         struct kvm_guest_debug *dbg)
> >  {
> > -       /* TODO; To be implemented later. */
> > -       return -EINVAL;
> 
> if (vcpu->arch.ran_atleast_once)
>         return -EBUSY;

If we enabled the guest_debug in QEMU side, then the KVM_SET_GUEST_DEBUG ioctl
will come before the first KVM_RUN. This will always cause an ERROR.

> 
> 
> > +       if (dbg->control & KVM_GUESTDBG_ENABLE) {
> > +               vcpu->guest_debug = dbg->control;
> > +               vcpu->arch.cfg.hedeleg = KVM_HEDELEG_GUEST_DEBUG;
> > +       } else {
> > +               vcpu->guest_debug = 0;
> > +               vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
> > +       }
> 
> Don't update vcpu->arch.cfg.hedeleg here since it should be only done
> in kvm_riscv_vcpu_setup_config().
> 
> > +
> > +       return 0;
> >  }
> >
> >  static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> > @@ -505,6 +512,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> >                 if (riscv_isa_extension_available(isa, SMSTATEEN))
> >                         cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
> >         }
> > +
> > +       if (!vcpu->guest_debug)
> > +               cfg->hedeleg = KVM_HEDELEG_DEFAULT;
> 
> This should be:
> 
> cfg->hedeleg = KVM_HEDELEG_DEFAULT;
> if (vcpu->guest_debug)
>         cfg->hedeleg |= BIT(EXC_BREAKPOINT);

Like above, here the logic should be:

cfg->hedeleg = KVM_HEDELEG_DEFAULT; // with BIT(EXC_BREAKPOINT)
if (vcpu->guest_debug)
        cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);

Another approach is:
initialize the cfg->hedeleg as KVM_HEDELEG_DEFAULT during kvm_arch_vcpu_create().
Besides that, only update the cfg->hedeleg in kvm_arch_vcpu_ioctl_set_guest_debug().

> 
> >  }
> >
> >  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> > @@ -519,6 +529,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> >         csr_write(CSR_VSEPC, csr->vsepc);
> >         csr_write(CSR_VSCAUSE, csr->vscause);
> >         csr_write(CSR_VSTVAL, csr->vstval);
> > +       csr_write(CSR_HEDELEG, cfg->hedeleg);
> >         csr_write(CSR_HVIP, csr->hvip);
> >         csr_write(CSR_VSATP, csr->vsatp);
> >         csr_write(CSR_HENVCFG, cfg->henvcfg);
> > diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index ce58bc48e5b8..7396b8654f45 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -186,6 +186,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >         case KVM_CAP_READONLY_MEM:
> >         case KVM_CAP_MP_STATE:
> >         case KVM_CAP_IMMEDIATE_EXIT:
> > +       case KVM_CAP_SET_GUEST_DEBUG:
> >                 r = 1;
> >                 break;
> >         case KVM_CAP_NR_VCPUS:
> > --
> > 2.17.1
> >
> 
> Regards,
> Anup

Thanks,
Chao
