From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Apr 2023 17:17:37 +0530
Subject: [PATCH 1/2] RISC-V: KVM: Alphabetize selects
In-Reply-To: <20230322192858.1189272-2-ajones@ventanamicro.com>
References: <20230322192858.1189272-1-ajones@ventanamicro.com> <20230322192858.1189272-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy1f2Sa8rje5V31xdzCOfjaFHzowpmp-2bBqQ-_LFNTMcA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 12:59?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> While alphabetized lists tend to become unalphabetized almost
> as quickly as they get fixed up, it is preferred to keep select
> lists in Kconfigs in order. Let's fix KVM's up.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.4

Thanks,
Anup

> ---
>  arch/riscv/kvm/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index d5a658a047a7..5bcb2d519b95 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -20,14 +20,14 @@ if VIRTUALIZATION
>  config KVM
>         tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
>         depends on RISCV_SBI && MMU
> +       select HAVE_KVM_EVENTFD
> +       select HAVE_KVM_VCPU_ASYNC_IOCTL
> +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>         select KVM_GENERIC_HARDWARE_ENABLING
> -       select MMU_NOTIFIER
> -       select PREEMPT_NOTIFIERS
>         select KVM_MMIO
> -       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>         select KVM_XFER_TO_GUEST_WORK
> -       select HAVE_KVM_VCPU_ASYNC_IOCTL
> -       select HAVE_KVM_EVENTFD
> +       select MMU_NOTIFIER
> +       select PREEMPT_NOTIFIERS
>         select SRCU
>         help
>           Support hosting virtualized guest machines.
> --
> 2.39.2
>

