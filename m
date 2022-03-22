From: Reiji Watanabe <reijiw@google.com>
Date: Mon, 21 Mar 2022 23:19:33 -0700
Subject: [PATCH v4 09/15] KVM: arm64: Add support for userspace to suspend
 a vCPU
In-Reply-To: <20220311174001.605719-10-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
 <20220311174001.605719-10-oupton@google.com>
Message-ID: <CAAeT=FyGUZMy-TUZuHu+bZtUY9NfjBQ79JKBX0xK4kEqFTO1OQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oliver,

On Fri, Mar 11, 2022 at 9:41 AM Oliver Upton <oupton@google.com> wrote:
>
> Introduce a new MP state, KVM_MP_STATE_SUSPENDED, which indicates a vCPU
> is in a suspended state. In the suspended state the vCPU will block
> until a wakeup event (pending interrupt) is recognized.
>
> Add a new system event type, KVM_SYSTEM_EVENT_WAKEUP, to indicate to
> userspace that KVM has recognized one such wakeup event. It is the
> responsibility of userspace to then make the vCPU runnable, or leave it
> suspended until the next wakeup event.
>
> Signed-off-by: Oliver Upton <oupton@google.com>
> ---
>  Documentation/virt/kvm/api.rst    | 37 +++++++++++++++++++++++++++++--
>  arch/arm64/include/asm/kvm_host.h |  1 +
>  arch/arm64/kvm/arm.c              | 35 +++++++++++++++++++++++++++++
>  include/uapi/linux/kvm.h          |  2 ++
>  4 files changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 5625c08b4a0e..426bcdc1216d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1482,14 +1482,43 @@ Possible values are:
>                                   [s390]
>     KVM_MP_STATE_LOAD             the vcpu is in a special load/startup state
>                                   [s390]
> +   KVM_MP_STATE_SUSPENDED        the vcpu is in a suspend state and is waiting
> +                                 for a wakeup event [arm64]
>     ==========================    ===============================================
>
>  On x86, this ioctl is only useful after KVM_CREATE_IRQCHIP. Without an
>  in-kernel irqchip, the multiprocessing state must be maintained by userspace on
>  these architectures.
>
> -For arm64/riscv:
> -^^^^^^^^^^^^^^^^
> +For arm64:
> +^^^^^^^^^^
> +
> +If a vCPU is in the KVM_MP_STATE_SUSPENDED state, KVM will emulate the
> +architectural execution of a WFI instruction.
> +
> +If a wakeup event is recognized, KVM will exit to userspace with a
> +KVM_SYSTEM_EVENT exit, where the event type is KVM_SYSTEM_EVENT_WAKEUP. If
> +userspace wants to honor the wakeup, it must set the vCPU's MP state to
> +KVM_MP_STATE_RUNNABLE. If it does not, KVM will continue to await a wakeup
> +event in subsequent calls to KVM_RUN.
> +
> +.. warning::
> +
> +     If userspace intends to keep the vCPU in a SUSPENDED state, it is
> +     strongly recommended that userspace take action to suppress the
> +     wakeup event (such as masking an interrupt). Otherwise, subsequent
> +     calls to KVM_RUN will immediately exit with a KVM_SYSTEM_EVENT_WAKEUP
> +     event and inadvertently waste CPU cycles.
> +
> +     Additionally, if userspace takes action to suppress a wakeup event,
> +     it is strongly recommended that it also restore the vCPU to its

Nit: s/restore/restores/ ?


> +     original state when the vCPU is made RUNNABLE again. For example,
> +     if userspace masked a pending interrupt to suppress the wakeup,
> +     the interrupt should be unmasked before returning control to the
> +     guest.
> +
> +For riscv:
> +^^^^^^^^^^
>
>  The only states that are valid are KVM_MP_STATE_STOPPED and
>  KVM_MP_STATE_RUNNABLE which reflect if the vcpu is paused or not.
> @@ -5914,6 +5943,7 @@ should put the acknowledged interrupt vector into the 'epr' field.
>    #define KVM_SYSTEM_EVENT_SHUTDOWN       1
>    #define KVM_SYSTEM_EVENT_RESET          2
>    #define KVM_SYSTEM_EVENT_CRASH          3
> +  #define KVM_SYSTEM_EVENT_WAKEUP         4
>                         __u32 type;
>                         __u64 flags;
>                 } system_event;
> @@ -5938,6 +5968,9 @@ Valid values for 'type' are:
>     has requested a crash condition maintenance. Userspace can choose
>     to ignore the request, or to gather VM memory core dump and/or
>     reset/shutdown of the VM.
> + - KVM_SYSTEM_EVENT_WAKEUP -- the guest is in a suspended state and KVM

Nit: Shouldn't 'the guest' be 'the vcpu' ?

> +   has recognized a wakeup event. Userspace may honor this event by marking
> +   the exiting vCPU as runnable, or deny it and call KVM_RUN again.
>
>  Valid flags are:
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index da58eb96d2a8..899f2c0b4c7b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -46,6 +46,7 @@
>  #define KVM_REQ_RECORD_STEAL   KVM_ARCH_REQ(3)
>  #define KVM_REQ_RELOAD_GICv4   KVM_ARCH_REQ(4)
>  #define KVM_REQ_RELOAD_PMU     KVM_ARCH_REQ(5)
> +#define KVM_REQ_SUSPEND                KVM_ARCH_REQ(6)
>
>  #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
>                                      KVM_DIRTY_LOG_INITIALLY_SET)
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8eed0556ccaa..b94efa05d869 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -444,6 +444,18 @@ bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu)
>         return vcpu->arch.mp_state.mp_state == KVM_MP_STATE_STOPPED;
>  }
>
> +static void kvm_arm_vcpu_suspend(struct kvm_vcpu *vcpu)
> +{
> +       vcpu->arch.mp_state.mp_state = KVM_MP_STATE_SUSPENDED;
> +       kvm_make_request(KVM_REQ_SUSPEND, vcpu);
> +       kvm_vcpu_kick(vcpu);
> +}
> +
> +static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
> +{
> +       return vcpu->arch.mp_state.mp_state == KVM_MP_STATE_SUSPENDED;
> +}
> +
>  int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
>                                     struct kvm_mp_state *mp_state)
>  {
> @@ -464,6 +476,9 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>         case KVM_MP_STATE_STOPPED:
>                 kvm_arm_vcpu_power_off(vcpu);
>                 break;
> +       case KVM_MP_STATE_SUSPENDED:
> +               kvm_arm_vcpu_suspend(vcpu);
> +               break;
>         default:
>                 ret = -EINVAL;
>         }
> @@ -648,6 +663,23 @@ void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
>         preempt_enable();
>  }
>
> +static int kvm_vcpu_suspend(struct kvm_vcpu *vcpu)
> +{
> +       if (!kvm_arm_vcpu_suspended(vcpu))
> +               return 1;
> +
> +       kvm_vcpu_wfi(vcpu);
> +
> +       /*
> +        * The suspend state is sticky; we do not leave it until userspace
> +        * explicitly marks the vCPU as runnable. Request that we suspend again
> +        * later.
> +        */
> +       kvm_make_request(KVM_REQ_SUSPEND, vcpu);
> +       kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_WAKEUP, 0);
> +       return 0;
> +}
> +
>  /**
>   * check_vcpu_requests - check and handle pending vCPU requests
>   * @vcpu:      the VCPU pointer
> @@ -686,6 +718,9 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
>                 if (kvm_check_request(KVM_REQ_RELOAD_PMU, vcpu))
>                         kvm_pmu_handle_pmcr(vcpu,
>                                             __vcpu_sys_reg(vcpu, PMCR_EL0));
> +
> +               if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
> +                       return kvm_vcpu_suspend(vcpu);

It appears that one of the cases that kvm_vcpu_suspend() returns
is when a pending signal is detected, and the exit reason will be
KVM_EXIT_SYSTEM_EVENT in this case.  On the other hand, when a
pending signal is detected earlier in xfer_to_guest_mode_handle_work(),
KVM_RUN returns -EINTR even if the vCPU is in KVM_MP_STATE_SUSPENDED
state. Shouldn't those behaviors be consistent ? (Perhaps -EINTR?)

Thanks,
Reiji

>         }
>
>         return 1;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 5191b57e1562..babb16c2abe5 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -444,6 +444,7 @@ struct kvm_run {
>  #define KVM_SYSTEM_EVENT_SHUTDOWN       1
>  #define KVM_SYSTEM_EVENT_RESET          2
>  #define KVM_SYSTEM_EVENT_CRASH          3
> +#define KVM_SYSTEM_EVENT_WAKEUP         4
>                         __u32 type;
>                         __u64 flags;
>                 } system_event;
> @@ -634,6 +635,7 @@ struct kvm_vapic_addr {
>  #define KVM_MP_STATE_OPERATING         7
>  #define KVM_MP_STATE_LOAD              8
>  #define KVM_MP_STATE_AP_RESET_HOLD     9
> +#define KVM_MP_STATE_SUSPENDED         10
>
>  struct kvm_mp_state {
>         __u32 mp_state;
> --
> 2.35.1.723.g4982287a31-goog
>

