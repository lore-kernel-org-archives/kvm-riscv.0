From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 11:43:50 +0530
Subject: [PATCH 22/26] entry/kvm: KVM: Move KVM details related to
 signal/-EINTR into KVM proper
In-Reply-To: <20230916003118.2540661-23-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-23-seanjc@google.com>
Message-ID: <CAAhSdy2N8PmP2+-8sFVpgduED0HU9D3dqg7sk3+R9f2wRgZ7KA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 16, 2023 at 6:02?AM Sean Christopherson <seanjc@google.com> wrote:
>
> Move KVM's morphing of pending signals into exits to userspace into KVM
> proper, and drop the @vcpu param from xfer_to_guest_mode_handle_work().
> How KVM responds to -EINTR is a detail that really belongs in KVM itself,
> and removing the non-KVM call to kvm_handle_signal_exit() will allow
> hiding said API and the definition of "struct kvm_vcpu" from the kernel.
>
> Alternatively, entry/kvm.c could be treated as part of KVM, i.e. be given
> access to KVM internals, but that's not obviously better than having KVM
> react to -EINTR (though it's not obviously worse either).
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/arm64/kvm/arm.c      |  3 +--
>  arch/riscv/kvm/vcpu.c     |  2 +-
>  arch/x86/kvm/vmx/vmx.c    |  1 -
>  arch/x86/kvm/x86.c        |  3 +--
>  include/linux/entry-kvm.h |  3 +--
>  include/linux/kvm_host.h  | 13 ++++++++++++-
>  kernel/entry/kvm.c        | 11 ++++-------
>  7 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6480628197b4..641df091e46b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -6,7 +6,6 @@
>
>  #include <linux/bug.h>
>  #include <linux/cpu_pm.h>
> -#include <linux/entry-kvm.h>
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> @@ -929,7 +928,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 /*
>                  * Check conditions before entering the guest
>                  */
> -               ret = xfer_to_guest_mode_handle_work(vcpu);
> +               ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
>                 if (!ret)
>                         ret = 1;
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 82229db1ce73..c313f4e90e70 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -667,7 +667,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>         run->exit_reason = KVM_EXIT_UNKNOWN;
>         while (ret > 0) {
>                 /* Check conditions before entering the guest */
> -               ret = xfer_to_guest_mode_handle_work(vcpu);
> +               ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
>                 if (ret)
>                         continue;
>                 ret = 1;
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index faf0071566ef..43b87ad5fde8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -28,7 +28,6 @@
>  #include <linux/slab.h>
>  #include <linux/tboot.h>
>  #include <linux/trace_events.h>
> -#include <linux/entry-kvm.h>
>
>  #include <asm/apic.h>
>  #include <asm/asm.h>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 6c9c81e82e65..aab095f89d9e 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -59,7 +59,6 @@
>  #include <linux/sched/stat.h>
>  #include <linux/sched/isolation.h>
>  #include <linux/mem_encrypt.h>
> -#include <linux/entry-kvm.h>
>  #include <linux/suspend.h>
>  #include <linux/smp.h>
>
> @@ -10987,7 +10986,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>
>                 if (__xfer_to_guest_mode_work_pending()) {
>                         kvm_vcpu_srcu_read_unlock(vcpu);
> -                       r = xfer_to_guest_mode_handle_work(vcpu);
> +                       r = kvm_xfer_to_guest_mode_handle_work(vcpu);
>                         kvm_vcpu_srcu_read_lock(vcpu);
>                         if (r)
>                                 return r;
> diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
> index e7d90d06e566..e235a91d28fc 100644
> --- a/include/linux/entry-kvm.h
> +++ b/include/linux/entry-kvm.h
> @@ -42,11 +42,10 @@ static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work)
>  /**
>   * xfer_to_guest_mode_handle_work - Check and handle pending work which needs
>   *                                 to be handled before going to guest mode
> - * @vcpu:      Pointer to current's VCPU data
>   *
>   * Returns: 0 or an error code
>   */
> -int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu);
> +int xfer_to_guest_mode_handle_work(void);
>
>  /**
>   * xfer_to_guest_mode_prepare - Perform last minute preparation work that
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index fb6c6109fdca..d520d6801070 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2,7 +2,7 @@
>  #ifndef __KVM_HOST_H
>  #define __KVM_HOST_H
>
> -
> +#include <linux/entry-kvm.h>
>  #include <linux/types.h>
>  #include <linux/hardirq.h>
>  #include <linux/list.h>
> @@ -2293,6 +2293,17 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
>         vcpu->run->exit_reason = KVM_EXIT_INTR;
>         vcpu->stat.signal_exits++;
>  }
> +
> +static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> +{
> +       int r = xfer_to_guest_mode_handle_work();
> +
> +       if (r) {
> +               WARN_ON_ONCE(r != -EINTR);
> +               kvm_handle_signal_exit(vcpu);
> +       }
> +       return r;
> +}
>  #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
>
>  /*
> diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
> index c2fc39824157..872617468b4a 100644
> --- a/kernel/entry/kvm.c
> +++ b/kernel/entry/kvm.c
> @@ -1,17 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/entry-kvm.h>
> -#include <linux/kvm_host.h>
>
> -static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
> +static int xfer_to_guest_mode_work(unsigned long ti_work)
>  {
>         do {
>                 int ret;
>
> -               if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
> -                       kvm_handle_signal_exit(vcpu);
> +               if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>                         return -EINTR;
> -               }
>
>                 if (ti_work & _TIF_NEED_RESCHED)
>                         schedule();
> @@ -28,7 +25,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
>         return 0;
>  }
>
> -int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> +int xfer_to_guest_mode_handle_work(void)
>  {
>         unsigned long ti_work;
>
> @@ -44,6 +41,6 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
>         if (!(ti_work & XFER_TO_GUEST_MODE_WORK))
>                 return 0;
>
> -       return xfer_to_guest_mode_work(vcpu, ti_work);
> +       return xfer_to_guest_mode_work(ti_work);
>  }
>  EXPORT_SYMBOL_GPL(xfer_to_guest_mode_handle_work);
> --
> 2.42.0.459.ge4e396fd5e-goog
>

