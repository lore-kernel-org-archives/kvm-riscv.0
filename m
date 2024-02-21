From: Chao Du <duchao@eswincomputing.com>
Date: Wed, 21 Feb 2024 09:54:59 +0800 (GMT+08:00)
Subject: [PATCH v1 1/3] RISC-V: KVM: Implement
 kvm_arch_vcpu_ioctl_set_guest_debug()
In-Reply-To: <CAK9=C2XAEDfac+GQTD3jE2RLR+5ngNPedEE_G6tL4e2KByUZ1w@mail.gmail.com>
References: <20240206074931.22930-1-duchao@eswincomputing.com>
 <20240206074931.22930-2-duchao@eswincomputing.com>
 <CAK9=C2VZ1t3ctTWKiqeKOALjLh0kJgzVEsZvM=xfc2j7yQOEcQ@mail.gmail.com>
 <4a5a30cd.18c.18dc4734699.Coremail.duchao@eswincomputing.com>
 <CAK9=C2XAEDfac+GQTD3jE2RLR+5ngNPedEE_G6tL4e2KByUZ1w@mail.gmail.com>
Message-ID: <61f5b01b.323.18dc95f8d58.Coremail.duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-02-20 12:54, Anup Patel <apatel@ventanamicro.com> wrote:
> 
> On Tue, Feb 20, 2024 at 8:31?AM Chao Du <duchao@eswincomputing.com> wrote:
> >
> > On 2024-02-14 21:19, Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > On Tue, Feb 6, 2024 at 1:22?PM Chao Du <duchao@eswincomputing.com> wrote:
> > > >
> > > > kvm_vm_ioctl_check_extension(): Return 1 if KVM_CAP_SET_GUEST_DEBUG is
> > > > being checked.
> > > >
> > > > kvm_arch_vcpu_ioctl_set_guest_debug(): Update the guest_debug flags
> > > > from userspace accordingly. Route the breakpoint exceptions to HS mode
> > > > if the VM is being debugged by userspace, by clearing the corresponding
> > > > bit in hedeleg CSR.
> > > >
> > > > Signed-off-by: Chao Du <duchao@eswincomputing.com>
> > > > ---
> > > >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> > > >  arch/riscv/kvm/vcpu.c             | 15 +++++++++++++--
> > > >  arch/riscv/kvm/vm.c               |  1 +
> > > >  3 files changed, 15 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > > index d6b7a5b95874..8890977836f0 100644
> > > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > > @@ -17,6 +17,7 @@
> > > >
> > > >  #define __KVM_HAVE_IRQ_LINE
> > > >  #define __KVM_HAVE_READONLY_MEM
> > > > +#define __KVM_HAVE_GUEST_DEBUG
> > > >
> > > >  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
> > > >
> > > > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > > > index b5ca9f2e98ac..6cee974592ac 100644
> > > > --- a/arch/riscv/kvm/vcpu.c
> > > > +++ b/arch/riscv/kvm/vcpu.c
> > > > @@ -475,8 +475,19 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
> > > >  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
> > > >                                         struct kvm_guest_debug *dbg)
> > > >  {
> > > > -       /* TODO; To be implemented later. */
> > > > -       return -EINVAL;
> > > > +       if (dbg->control & KVM_GUESTDBG_ENABLE) {
> > > > +               if (vcpu->guest_debug != dbg->control) {
> > > > +                       vcpu->guest_debug = dbg->control;
> > > > +                       csr_clear(CSR_HEDELEG, BIT(EXC_BREAKPOINT));
> > > > +               }
> > > > +       } else {
> > > > +               if (vcpu->guest_debug != 0) {
> > > > +                       vcpu->guest_debug = 0;
> > > > +                       csr_set(CSR_HEDELEG, BIT(EXC_BREAKPOINT));
> > > > +               }
> > > > +       }
> > >
> > > This is broken because directly setting breakpoint exception delegation
> > > in CSR also affects other VCPUs running on the same host CPU.
> > >
> > > To address the above, we should do the following:
> > > 1) Add "unsigned long hedeleg" in "struct kvm_vcpu_config" which
> > >    is pre-initialized in kvm_riscv_vcpu_setup_config() without setting
> > >    EXC_BREAKPOINT bit.
> > > 2) The kvm_arch_vcpu_ioctl_set_guest_debug() should only set/clear
> > >     EXC_BREAKPOINT bit in "hedeleg" of "struct kvm_vcpu_config".
> > > 3) The kvm_riscv_vcpu_swap_in_guest_state() must write the
> > >      HEDELEG csr before entering the Guest/VM.
> > >
> > > Regards,
> > > Anup
> > >
> >
> > Thanks for the review and detailed suggestion.
> > Maybe we could make it a bit easier:
> > 1) The kvm_arch_vcpu_ioctl_set_guest_debug() only update vcpu->guest_debug
> >    accordingly.
> > 2) The kvm_riscv_vcpu_swap_in_guest_state() check vcpu->guest_debug and
> >    set/clear the HEDELEG csr accordingly.
> >
> > Could you confirm if this is OK?
> 
> Your suggestion will work but it adds an additional "if ()" check in
> kvm_riscv_vcpu_swap_in_guest_state() which is in the hot path.
> 

Yes, it makes sense.
I will prepare a V2 patch.

Thanks,
Chao

> I am still leaning towards what I suggested.
> 
> Regards,
> Anup
> 
> > If yes, I will post another revision.
> >
> > Regards,
> > Chao
> >
> > > > +
> > > > +       return 0;
> > > >  }
> > > >
> > > >  static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> > > > diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > > > index ce58bc48e5b8..7396b8654f45 100644
> > > > --- a/arch/riscv/kvm/vm.c
> > > > +++ b/arch/riscv/kvm/vm.c
> > > > @@ -186,6 +186,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> > > >         case KVM_CAP_READONLY_MEM:
> > > >         case KVM_CAP_MP_STATE:
> > > >         case KVM_CAP_IMMEDIATE_EXIT:
> > > > +       case KVM_CAP_SET_GUEST_DEBUG:
> > > >                 r = 1;
> > > >                 break;
> > > >         case KVM_CAP_NR_VCPUS:
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > > --
> > > > kvm-riscv mailing list
> > > > kvm-riscv at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
