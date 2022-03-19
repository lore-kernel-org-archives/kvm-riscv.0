From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Mar 2022 12:58:28 +0530
Subject: [PATCH v4 07/15] KVM: Create helper for setting a system event
 exit
In-Reply-To: <20220311174001.605719-8-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
 <20220311174001.605719-8-oupton@google.com>
Message-ID: <CAAhSdy3mH5JQ9N9JzbUpBw3ZdqKtLretsUKL3WAdMhpEXVmJRg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 11, 2022 at 11:11 PM Oliver Upton <oupton@google.com> wrote:
>
> Create a helper that appropriately configures kvm_run for a system event
> exit.
>
> No functional change intended.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Oliver Upton <oupton@google.com>
> Acked-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/arm64/kvm/psci.c         | 5 +----
>  arch/riscv/kvm/vcpu_sbi_v01.c | 4 +---
>  arch/x86/kvm/x86.c            | 6 ++----
>  include/linux/kvm_host.h      | 2 ++
>  virt/kvm/kvm_main.c           | 8 ++++++++
>  5 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> index efd4428fda1c..78266716165e 100644
> --- a/arch/arm64/kvm/psci.c
> +++ b/arch/arm64/kvm/psci.c
> @@ -173,10 +173,7 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
>                 tmp->arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
>         kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
>
> -       memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
> -       vcpu->run->system_event.type = type;
> -       vcpu->run->system_event.flags = flags;
> -       vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> +       kvm_vcpu_set_system_event_exit(vcpu, type, flags);
>  }
>
>  static void kvm_psci_system_off(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 07e2de14433a..c5581008dd88 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -24,9 +24,7 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
>                 tmp->arch.power_off = true;
>         kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
>
> -       memset(&run->system_event, 0, sizeof(run->system_event));
> -       run->system_event.type = type;
> -       run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> +       kvm_vcpu_set_system_event_exit(vcpu, type, 0);

This patch needs to be rebased on the latest kvm/next because we have
done some refactoring to support SBI v0.3 SRST extension.

Thanks,
Anup

>  }
>
>  static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 7131d735b1ef..b3b94408cc61 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9903,14 +9903,12 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>                 if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
>                         kvm_vcpu_reload_apic_access_page(vcpu);
>                 if (kvm_check_request(KVM_REQ_HV_CRASH, vcpu)) {
> -                       vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> -                       vcpu->run->system_event.type = KVM_SYSTEM_EVENT_CRASH;
> +                       kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_CRASH, 0);
>                         r = 0;
>                         goto out;
>                 }
>                 if (kvm_check_request(KVM_REQ_HV_RESET, vcpu)) {
> -                       vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> -                       vcpu->run->system_event.type = KVM_SYSTEM_EVENT_RESET;
> +                       kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_RESET, 0);
>                         r = 0;
>                         goto out;
>                 }
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..c2a4fd2382e2 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2202,6 +2202,8 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
>  }
>  #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
>
> +void kvm_vcpu_set_system_event_exit(struct kvm_vcpu *vcpu, u32 type, u64 flags);
> +
>  /*
>   * This defines how many reserved entries we want to keep before we
>   * kick the vcpu to the userspace to avoid dirty ring full.  This
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 58d31da8a2f7..197bae04ca34 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3194,6 +3194,14 @@ void kvm_vcpu_mark_page_dirty(struct kvm_vcpu *vcpu, gfn_t gfn)
>  }
>  EXPORT_SYMBOL_GPL(kvm_vcpu_mark_page_dirty);
>
> +void kvm_vcpu_set_system_event_exit(struct kvm_vcpu *vcpu, u32 type, u64 flags)
> +{
> +       memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
> +       vcpu->run->system_event.type = type;
> +       vcpu->run->system_event.flags = flags;
> +       vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> +}
> +
>  void kvm_sigset_activate(struct kvm_vcpu *vcpu)
>  {
>         if (!vcpu->sigset_active)
> --
> 2.35.1.723.g4982287a31-goog
>

