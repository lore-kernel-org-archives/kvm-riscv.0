From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 11:07:24 +0530
Subject: [PATCH v2 01/13] RISC-V: paravirt: Add skeleton for pv-time support
In-Reply-To: <20231214101552.100721-16-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-16-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0JgONbwAc_oaT6e7WAv9PjjmC-_zHGbHqpQ=BoZJQBEQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 14, 2023 at 3:45?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Add the files and functions needed to support paravirt time on
> RISC-V. Also include the common code needed for the first
> application of pv-time, which is steal-time. In the next
> patches we'll complete the functions to fully enable steal-time
> support.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +-
>  arch/riscv/include/asm/paravirt.h             | 28 +++++++
>  arch/riscv/include/asm/paravirt_api_clock.h   |  1 +
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/paravirt.c                  | 77 +++++++++++++++++++
>  arch/riscv/kernel/time.c                      |  3 +
>  6 files changed, 113 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/paravirt.h
>  create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
>  create mode 100644 arch/riscv/kernel/paravirt.c
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 65731b060e3f..a0d9259e4857 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3985,9 +3985,9 @@
>                         vulnerability. System may allow data leaks with this
>                         option.
>
> -       no-steal-acc    [X86,PV_OPS,ARM64,PPC/PSERIES] Disable paravirtualized
> -                       steal time accounting. steal time is computed, but
> -                       won't influence scheduler behaviour
> +       no-steal-acc    [X86,PV_OPS,ARM64,PPC/PSERIES,RISCV] Disable
> +                       paravirtualized steal time accounting. steal time is
> +                       computed, but won't influence scheduler behaviour
>
>         nosync          [HW,M68K] Disables sync negotiation for all devices.
>
> diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
> new file mode 100644
> index 000000000000..c0abde70fc2c
> --- /dev/null
> +++ b/arch/riscv/include/asm/paravirt.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_PARAVIRT_H
> +#define _ASM_RISCV_PARAVIRT_H
> +
> +#ifdef CONFIG_PARAVIRT
> +#include <linux/static_call_types.h>
> +
> +struct static_key;
> +extern struct static_key paravirt_steal_enabled;
> +extern struct static_key paravirt_steal_rq_enabled;
> +
> +u64 dummy_steal_clock(int cpu);
> +
> +DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> +
> +static inline u64 paravirt_steal_clock(int cpu)
> +{
> +       return static_call(pv_steal_clock)(cpu);
> +}
> +
> +int __init pv_time_init(void);
> +
> +#else
> +
> +#define pv_time_init() do {} while (0)
> +
> +#endif /* CONFIG_PARAVIRT */
> +#endif /* _ASM_RISCV_PARAVIRT_H */
> diff --git a/arch/riscv/include/asm/paravirt_api_clock.h b/arch/riscv/include/asm/paravirt_api_clock.h
> new file mode 100644
> index 000000000000..65ac7cee0dad
> --- /dev/null
> +++ b/arch/riscv/include/asm/paravirt_api_clock.h
> @@ -0,0 +1 @@
> +#include <asm/paravirt.h>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..807c2bde1f83 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -85,6 +85,7 @@ obj-$(CONFIG_SMP)             += sbi-ipi.o
>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)      += cpu-hotplug.o
> +obj-$(CONFIG_PARAVIRT)         += paravirt.o
>  obj-$(CONFIG_KGDB)             += kgdb.o
>  obj-$(CONFIG_KEXEC_CORE)       += kexec_relocate.o crash_save_regs.o machine_kexec.o
>  obj-$(CONFIG_KEXEC_FILE)       += elf_kexec.o machine_kexec_file.o
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> new file mode 100644
> index 000000000000..141dbcc36fa2
> --- /dev/null
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + */
> +
> +#define pr_fmt(fmt) "riscv-pv: " fmt
> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/printk.h>
> +#include <linux/static_call.h>
> +#include <linux/types.h>
> +
> +struct static_key paravirt_steal_enabled;
> +struct static_key paravirt_steal_rq_enabled;
> +
> +static u64 native_steal_clock(int cpu)
> +{
> +       return 0;
> +}
> +
> +DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +
> +static bool steal_acc = true;
> +static int __init parse_no_stealacc(char *arg)
> +{
> +       steal_acc = false;
> +       return 0;
> +}
> +
> +early_param("no-steal-acc", parse_no_stealacc);
> +
> +static bool __init has_pv_steal_clock(void)
> +{
> +       return false;
> +}
> +
> +static int pv_time_cpu_online(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +static int pv_time_cpu_down_prepare(unsigned int cpu)
> +{
> +       return 0;
> +}
> +
> +static u64 pv_time_steal_clock(int cpu)
> +{
> +       return 0;
> +}
> +
> +int __init pv_time_init(void)
> +{
> +       int ret;
> +
> +       if (!has_pv_steal_clock())
> +               return 0;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +                               "riscv/pv_time:online",
> +                               pv_time_cpu_online,
> +                               pv_time_cpu_down_prepare);
> +       if (ret < 0)
> +               return ret;
> +
> +       static_call_update(pv_steal_clock, pv_time_steal_clock);
> +
> +       static_key_slow_inc(&paravirt_steal_enabled);
> +       if (steal_acc)
> +               static_key_slow_inc(&paravirt_steal_rq_enabled);
> +
> +       pr_info("using paravirt steal-time\n");
> +
> +       return 0;
> +}
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 23641e82a9df..ba3477197789 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -12,6 +12,7 @@
>  #include <asm/sbi.h>
>  #include <asm/processor.h>
>  #include <asm/timex.h>
> +#include <asm/paravirt.h>
>
>  unsigned long riscv_timebase __ro_after_init;
>  EXPORT_SYMBOL_GPL(riscv_timebase);
> @@ -45,4 +46,6 @@ void __init time_init(void)
>         timer_probe();
>
>         tick_setup_hrtimer_broadcast();
> +
> +       pv_time_init();
>  }
> --
> 2.43.0
>

