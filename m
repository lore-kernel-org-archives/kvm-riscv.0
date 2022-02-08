From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Feb 2022 14:46:13 +0800
Subject: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
In-Reply-To: <20220126114452.692512-9-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
Message-ID: <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Another question:

Have you put "idle-states {" in qemu's DTS? or how do you test your patches?

On Wed, Jan 26, 2022 at 7:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
> SBI HSM Supend on QEMU.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/Kconfig.socs           | 3 +++
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  3 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6ec44a22278a..f4097a815201 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -36,6 +36,9 @@ config SOC_VIRT
>         select GOLDFISH
>         select RTC_DRV_GOLDFISH if RTC_CLASS
>         select SIFIVE_PLIC
> +       select PM_GENERIC_DOMAINS if PM
> +       select PM_GENERIC_DOMAINS_OF if PM && OF
> +       select RISCV_SBI_CPUIDLE if CPU_IDLE
>         help
>           This enables support for QEMU Virt Machine.
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index a5e0482a4969..b8c882b70b02 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_PM=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index d1b87db54d68..6f9a7c89bff9 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_PM=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
> --
> 2.25.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

