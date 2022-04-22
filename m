From: Reiji Watanabe <reijiw@google.com>
Date: Thu, 21 Apr 2022 23:28:42 -0700
Subject: [PATCH v5 07/13] KVM: arm64: Add support for userspace to suspend
 a vCPU
In-Reply-To: <CAOQ_Qsg2oNx8Ke7wGy1sU-5Ruq8uCWMKU5VkvTn=co6oRhhXww@mail.gmail.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-8-oupton@google.com>
 <CAAeT=FzURZmYfsLJnWMXufBiaZ6Wypan+xK4WxOSM=p=kEnYxA@mail.gmail.com>
 <CAOQ_Qsg2oNx8Ke7wGy1sU-5Ruq8uCWMKU5VkvTn=co6oRhhXww@mail.gmail.com>
Message-ID: <CAAeT=Fx5Nb0EJ+6825fYxAxF9bK5DHOXNmJiSVGP=JVSbWuCrQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oliver,

On Wed, Apr 20, 2022 at 8:24 PM Oliver Upton <oupton@google.com> wrote:
>
> Hi Reiji,
>
> On Wed, Apr 20, 2022 at 8:13 PM Reiji Watanabe <reijiw@google.com> wrote:
> >
> > Hi Oliver,
> >
> > On Sat, Apr 9, 2022 at 11:46 AM Oliver Upton <oupton@google.com> wrote:
> > >
> > > Introduce a new MP state, KVM_MP_STATE_SUSPENDED, which indicates a vCPU
> > > is in a suspended state. In the suspended state the vCPU will block
> > > until a wakeup event (pending interrupt) is recognized.
> > >
> > > Add a new system event type, KVM_SYSTEM_EVENT_WAKEUP, to indicate to
> > > userspace that KVM has recognized one such wakeup event. It is the
> > > responsibility of userspace to then make the vCPU runnable, or leave it
> > > suspended until the next wakeup event.
> > >
> > > Signed-off-by: Oliver Upton <oupton@google.com>
> > > ---
> > >  Documentation/virt/kvm/api.rst    | 37 +++++++++++++++++++++--
> > >  arch/arm64/include/asm/kvm_host.h |  1 +
> > >  arch/arm64/kvm/arm.c              | 49 +++++++++++++++++++++++++++++++
> > >  include/uapi/linux/kvm.h          |  2 ++
> > >  4 files changed, 87 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index d13fa6600467..d104e34ad703 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -1476,14 +1476,43 @@ Possible values are:
> > >                                   [s390]
> > >     KVM_MP_STATE_LOAD             the vcpu is in a special load/startup state
> > >                                   [s390]
> > > +   KVM_MP_STATE_SUSPENDED        the vcpu is in a suspend state and is waiting
> > > +                                 for a wakeup event [arm64]
> > >     ==========================    ===============================================
> > >
> > >  On x86, this ioctl is only useful after KVM_CREATE_IRQCHIP. Without an
> > >  in-kernel irqchip, the multiprocessing state must be maintained by userspace on
> > >  these architectures.
> > >
> > > -For arm64/riscv:
> > > -^^^^^^^^^^^^^^^^
> > > +For arm64:
> > > +^^^^^^^^^^
> > > +
> > > +If a vCPU is in the KVM_MP_STATE_SUSPENDED state, KVM will emulate the
> > > +architectural execution of a WFI instruction.
> > > +
> > > +If a wakeup event is recognized, KVM will exit to userspace with a
> > > +KVM_SYSTEM_EVENT exit, where the event type is KVM_SYSTEM_EVENT_WAKEUP. If
> > > +userspace wants to honor the wakeup, it must set the vCPU's MP state to
> > > +KVM_MP_STATE_RUNNABLE. If it does not, KVM will continue to await a wakeup
> > > +event in subsequent calls to KVM_RUN.
> > > +
> > > +.. warning::
> > > +
> > > +     If userspace intends to keep the vCPU in a SUSPENDED state, it is
> > > +     strongly recommended that userspace take action to suppress the
> > > +     wakeup event (such as masking an interrupt). Otherwise, subsequent
> > > +     calls to KVM_RUN will immediately exit with a KVM_SYSTEM_EVENT_WAKEUP
> > > +     event and inadvertently waste CPU cycles.
> > > +
> > > +     Additionally, if userspace takes action to suppress a wakeup event,
> > > +     it is strongly recommended that it also restores the vCPU to its
> > > +     original state when the vCPU is made RUNNABLE again. For example,
> > > +     if userspace masked a pending interrupt to suppress the wakeup,
> > > +     the interrupt should be unmasked before returning control to the
> > > +     guest.
> > > +
> > > +For riscv:
> > > +^^^^^^^^^^
> > >
> > >  The only states that are valid are KVM_MP_STATE_STOPPED and
> > >  KVM_MP_STATE_RUNNABLE which reflect if the vcpu is paused or not.
> > > @@ -5985,6 +6014,7 @@ should put the acknowledged interrupt vector into the 'epr' field.
> > >    #define KVM_SYSTEM_EVENT_SHUTDOWN       1
> > >    #define KVM_SYSTEM_EVENT_RESET          2
> > >    #define KVM_SYSTEM_EVENT_CRASH          3
> > > +  #define KVM_SYSTEM_EVENT_WAKEUP         4
> > >                         __u32 type;
> > >                         __u64 flags;
> > >                 } system_event;
> > > @@ -6009,6 +6039,9 @@ Valid values for 'type' are:
> > >     has requested a crash condition maintenance. Userspace can choose
> > >     to ignore the request, or to gather VM memory core dump and/or
> > >     reset/shutdown of the VM.
> > > + - KVM_SYSTEM_EVENT_WAKEUP -- the exiting vCPU is in a suspended state and
> > > +   KVM has recognized a wakeup event. Userspace may honor this event by
> > > +   marking the exiting vCPU as runnable, or deny it and call KVM_RUN again.
> > >
> > >  Valid flags are:
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index f3f93d48e21a..46027b9b80ca 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -46,6 +46,7 @@
> > >  #define KVM_REQ_RECORD_STEAL   KVM_ARCH_REQ(3)
> > >  #define KVM_REQ_RELOAD_GICv4   KVM_ARCH_REQ(4)
> > >  #define KVM_REQ_RELOAD_PMU     KVM_ARCH_REQ(5)
> > > +#define KVM_REQ_SUSPEND                KVM_ARCH_REQ(6)
> > >
> > >  #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
> > >                                      KVM_DIRTY_LOG_INITIALLY_SET)
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index efe54aba5cce..e9641b86d375 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -444,6 +444,18 @@ bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu)
> > >         return vcpu->arch.mp_state.mp_state == KVM_MP_STATE_STOPPED;
> > >  }
> > >
> > > +static void kvm_arm_vcpu_suspend(struct kvm_vcpu *vcpu)
> > > +{
> > > +       vcpu->arch.mp_state.mp_state = KVM_MP_STATE_SUSPENDED;
> > > +       kvm_make_request(KVM_REQ_SUSPEND, vcpu);
> > > +       kvm_vcpu_kick(vcpu);
> >
> > > +static void kvm_arm_vcpu_suspend(struct kvm_vcpu *vcpu)
> > > +{
> > > +       vcpu->arch.mp_state.mp_state = KVM_MP_STATE_SUSPENDED;
> > > +       kvm_make_request(KVM_REQ_SUSPEND, vcpu);
> > > +       kvm_vcpu_kick(vcpu);
> >
> > Considering the patch 8 will remove the call to kvm_vcpu_kick()
> > (BTW, I wonder why you wanted to make that change in the patch-8
> > instead of the patch-7),
>
> Squashed the diff into the wrong patch! Marc pointed out this is of
> course cargo-culted as I was following the pattern laid down by
> KVM_REQ_SLEEP :)

I see. Thanks for the clarification !

> > it looks like we could use the mp_state
> > KVM_MP_STATE_SUSPENDED instead of using KVM_REQ_SUSPEND.
> > What is the reason why you prefer to introduce KVM_REQ_SUSPEND
> > rather than simply using KVM_MP_STATE_SUSPENDED ?
>
> I was trying to avoid any heavy refactoring in adding new
> functionality here, as we handle KVM_MP_STATE_STOPPED similarly (make
> a request). ARM is definitely a bit different than x86 in the way that
> we handle the MP states, as x86 doesn't bounce through vCPU requests
> to do it and instead directly checks the mp_state value.

The difference from KVM_MP_STATE_STOPPED is that kvm_arm_vcpu_power_off()
calls kvm_vcpu_kick(), which made me think having KVM_REQ_SLEEP was
reasonable (it appears kvm_vcpu_kick() won't be needed there due to
the same reason as kvm_arm_vcpu_suspend).

> Do you think it's fair to defer on repainting to a later series? We
> probably will need to touch up the main run loop quite a lot along the
> way.

Yes, I'm fine with that :-)

Thanks,
Reiji

