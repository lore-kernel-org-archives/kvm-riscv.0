From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 16:50:33 -0800
Subject: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
In-Reply-To: <20220210054947.170134-2-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKyzY_DNWqm32so0MOBcii1QCfF4KTq35Y06erALNx8Ug@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 9, 2022 at 9:50 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@vetanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                |  7 +++++++
>  arch/riscv/configs/defconfig      |  1 +
>  arch/riscv/configs/rv32_defconfig |  1 +
>  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/process.c       |  3 ++-
>  5 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..76976d12b463 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>         select CLONE_BACKWARDS
>         select CLINT_TIMER if !MMU
>         select COMMON_CLK
> +       select CPU_PM if CPU_IDLE
>         select EDAC_SUPPORT
>         select GENERIC_ARCH_TOPOLOGY if SMP
>         select GENERIC_ATOMIC64 if !64BIT
> @@ -547,4 +548,10 @@ source "kernel/power/Kconfig"
>
>  endmenu
>
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  source "arch/riscv/kvm/Kconfig"
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..a5e0482a4969 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..d1b87db54d68 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> new file mode 100644
> index 000000000000..71fdc607d4bc
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 Allwinner Ltd
> + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef _ASM_RISCV_CPUIDLE_H
> +#define _ASM_RISCV_CPUIDLE_H
> +
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +
> +static inline void cpu_do_idle(void)
> +{
> +       /*
> +        * Add mb() here to ensure that all
> +        * IO/MEM accesses are completed prior
> +        * to entering WFI.
> +        */
> +       mb();
> +       wait_for_interrupt();
> +}
> +
> +#endif
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..504b496787aa 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -23,6 +23,7 @@
>  #include <asm/string.h>
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
> +#include <asm/cpuidle.h>
>
>  register unsigned long gp_in_global __asm__("gp");
>
> @@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
>
>  void arch_cpu_idle(void)
>  {
> -       wait_for_interrupt();
> +       cpu_do_idle();
>         raw_local_irq_enable();
>  }
>
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

