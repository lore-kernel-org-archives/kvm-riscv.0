From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 31 Mar 2023 17:19:51 +0200
Subject: [PATCH kernel v4] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE support
 platform dependent
In-Reply-To: <7a790aa8-c643-1098-4d28-bd3b10399fcd@ozlabs.ru>
References: <20221003235722.2085145-1-aik@ozlabs.ru> <7a790aa8-c643-1098-4d28-bd3b10399fcd@ozlabs.ru>
Message-ID: <CABgObfYGqT2V0NgTShx2=QACK5o6=TOwsMV+MeQWqQbfcNWr3g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 9:38?AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> Paolo, ping?

Queued, thanks (the automated message used the wrong reply but this is
the patch I applied).

Paolo

>
> On 04/10/2022 10:57, Alexey Kardashevskiy wrote:
> > When introduced, IRQFD resampling worked on POWER8 with XICS. However
> > KVM on POWER9 has never implemented it - the compatibility mode code
> > ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> > XIVE mode does not handle INTx in KVM at all.
> >
> > This moved the capability support advertising to platforms and stops
> > advertising it on XIVE, i.e. POWER9 and later.
> >
> > This should cause no behavioural change for other architectures.
> >
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > Acked-by: Nicholas Piggin <npiggin@gmail.com>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > ---
> > Changes:
> > v4:
> > * removed incorrect clause about changing behavoir on MIPS and RISCV
> >
> > v3:
> > * removed all ifdeferry
> > * removed the capability for MIPS and RISCV
> > * adjusted the commit log about MIPS and RISCV
> >
> > v2:
> > * removed ifdef for ARM64.
> > ---
> >   arch/arm64/kvm/arm.c       | 1 +
> >   arch/powerpc/kvm/powerpc.c | 6 ++++++
> >   arch/s390/kvm/kvm-s390.c   | 1 +
> >   arch/x86/kvm/x86.c         | 1 +
> >   virt/kvm/kvm_main.c        | 1 -
> >   5 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 2ff0ef62abad..d2daa4d375b5 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -218,6 +218,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >       case KVM_CAP_VCPU_ATTRIBUTES:
> >       case KVM_CAP_PTP_KVM:
> >       case KVM_CAP_ARM_SYSTEM_SUSPEND:
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> >               r = 1;
> >               break;
> >       case KVM_CAP_SET_GUEST_DEBUG2:
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index fb1490761c87..908ce8bd91c9 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -593,6 +593,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >               break;
> >   #endif
> >
> > +#ifdef CONFIG_HAVE_KVM_IRQFD
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> > +             r = !xive_enabled();
> > +             break;
> > +#endif
> > +
> >       case KVM_CAP_PPC_ALLOC_HTAB:
> >               r = hv_enabled;
> >               break;
> > diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> > index edfd4bbd0cba..7521adadb81b 100644
> > --- a/arch/s390/kvm/kvm-s390.c
> > +++ b/arch/s390/kvm/kvm-s390.c
> > @@ -577,6 +577,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >       case KVM_CAP_SET_GUEST_DEBUG:
> >       case KVM_CAP_S390_DIAG318:
> >       case KVM_CAP_S390_MEM_OP_EXTENSION:
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> >               r = 1;
> >               break;
> >       case KVM_CAP_SET_GUEST_DEBUG2:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 43a6a7efc6ec..2d6c5a8fdf14 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -4395,6 +4395,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >       case KVM_CAP_VAPIC:
> >       case KVM_CAP_ENABLE_CAP:
> >       case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> >               r = 1;
> >               break;
> >       case KVM_CAP_EXIT_HYPERCALL:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 584a5bab3af3..05cf94013f02 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -4447,7 +4447,6 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> >   #endif
> >   #ifdef CONFIG_HAVE_KVM_IRQFD
> >       case KVM_CAP_IRQFD:
> > -     case KVM_CAP_IRQFD_RESAMPLE:
> >   #endif
> >       case KVM_CAP_IOEVENTFD_ANY_LENGTH:
> >       case KVM_CAP_CHECK_EXTENSION_VM:
>
> --
> Alexey
>


