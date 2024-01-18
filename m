From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Jan 2024 18:29:16 +0530
Subject: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
In-Reply-To: <20240104123727.76987-2-ajones@ventanamicro.com>
References: <20240104123727.76987-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 4, 2024 at 6:07?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
>
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8 at infradead.org/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Queued this patch for Linux-6.8

Regards,
Anup

> ---
>
> v2:
>  - Added Fixes tag and -fixes prefix [Alexandre/Anup]
>
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>         select HAVE_KPROBES if !XIP_KERNEL
>         select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>         select HAVE_KRETPROBES if !XIP_KERNEL
> +       select HAVE_KVM
>         # https://github.com/ClangBuiltLinux/linux/issues/1881
>         select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>         select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>
>  config KVM
>         tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -       depends on RISCV_SBI && MMU
> +       depends on HAVE_KVM && RISCV_SBI && MMU
>         select HAVE_KVM_IRQCHIP
>         select HAVE_KVM_IRQ_ROUTING
>         select HAVE_KVM_MSI
> --
> 2.43.0
>

