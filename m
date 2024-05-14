From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 14 May 2024 10:06:31 +0200
Subject: [RFC PATCH 5/7] riscv: add double trap driver
In-Reply-To: <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
 <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
Message-ID: <e33b8eba-85f0-44b7-8a6f-802a6979f6c8@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 27/04/2024 01:59, Deepak Gupta wrote:
> On Thu, Apr 18, 2024 at 04:26:44PM +0200, Cl?ment L?ger wrote:
>> Add a small driver to request double trap enabling as well as
>> registering a SSE handler for double trap. This will also be used by KVM
>> SBI FWFT extension support to detect if it is possible to enable double
>> trap in VS-mode.
>>
>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>> ---
>> arch/riscv/include/asm/sbi.h??? |? 1 +
>> drivers/firmware/Kconfig??????? |? 7 +++
>> drivers/firmware/Makefile?????? |? 1 +
>> drivers/firmware/riscv_dbltrp.c | 95 +++++++++++++++++++++++++++++++++
>> include/linux/riscv_dbltrp.h??? | 19 +++++++
>> 5 files changed, 123 insertions(+)
>> create mode 100644 drivers/firmware/riscv_dbltrp.c
>> create mode 100644 include/linux/riscv_dbltrp.h
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 744aa1796c92..9cd4ca66487c 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -314,6 +314,7 @@ enum sbi_sse_attr_id {
>> #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SPIE??? (1 << 2)
>>
>> #define SBI_SSE_EVENT_LOCAL_RAS??????? 0x00000000
>> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP??? 0x00000001
>> #define SBI_SSE_EVENT_GLOBAL_RAS??? 0x00008000
>> #define SBI_SSE_EVENT_LOCAL_PMU??????? 0x00010000
>> #define SBI_SSE_EVENT_LOCAL_SOFTWARE??? 0xffff0000
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index 59f611288807..a037f6e89942 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -197,6 +197,13 @@ config RISCV_SSE_TEST
>> ????? Select if you want to enable SSE extension testing at boot time.
>> ????? This will run a series of test which verifies SSE sanity.
>>
>> +config RISCV_DBLTRP
>> +??? bool "Enable Double trap handling"
>> +??? depends on RISCV_SSE && RISCV_SBI
>> +??? default n
>> +??? help
>> +????? Select if you want to enable SSE double trap handler.
>> +
>> config SYSFB
>> ????bool
>> ????select BOOT_VESA_SUPPORT
>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>> index fb7b0c08c56d..ad67a1738c0f 100644
>> --- a/drivers/firmware/Makefile
>> +++ b/drivers/firmware/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
>> obj-$(CONFIG_FW_CFG_SYSFS)??? += qemu_fw_cfg.o
>> obj-$(CONFIG_RISCV_SSE)??????? += riscv_sse.o
>> obj-$(CONFIG_RISCV_SSE_TEST)??? += riscv_sse_test.o
>> +obj-$(CONFIG_RISCV_DBLTRP)??? += riscv_dbltrp.o
>> obj-$(CONFIG_SYSFB)??????? += sysfb.o
>> obj-$(CONFIG_SYSFB_SIMPLEFB)??? += sysfb_simplefb.o
>> obj-$(CONFIG_TI_SCI_PROTOCOL)??? += ti_sci.o
>> diff --git a/drivers/firmware/riscv_dbltrp.c
>> b/drivers/firmware/riscv_dbltrp.c
>> new file mode 100644
>> index 000000000000..72f9a067e87a
>> --- /dev/null
>> +++ b/drivers/firmware/riscv_dbltrp.c
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2023 Rivos Inc.
>> + */
> 
> nit: fix copyright year
>> +
>> +#define pr_fmt(fmt) "riscv-dbltrp: " fmt
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/init.h>
>> +#include <linux/riscv_dbltrp.h>
>> +#include <linux/riscv_sse.h>
>> +
>> +#include <asm/sbi.h>
>> +
>> +static bool double_trap_enabled;
>> +
>> +static int riscv_sse_dbltrp_handle(uint32_t evt, void *arg,
>> +?????????????????? struct pt_regs *regs)
>> +{
>> +??? __show_regs(regs);
>> +??? panic("Double trap !\n");
>> +
>> +??? return 0;
> Curious:
> Does panic return?
> What's the point of returning from here?

Hi Deepak,

No, panic() does not return and indeed, the "return 0" is useless. It's
a leftover of a previous implementation without panic in order to keep
GCC mouth shut ;).

> 
>> +}
>> +
>> +struct cpu_dbltrp_data {
>> +??? int error;
>> +};
>> +
>> +static void
>> +sbi_cpu_enable_double_trap(void *data)
>> +{
>> +??? struct sbiret ret;
>> +??? struct cpu_dbltrp_data *cdd = data;
>> +
>> +??? ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
>> +??????????? SBI_FWFT_DOUBLE_TRAP_ENABLE, 1, 0, 0, 0, 0);
>> +
>> +??? if (ret.error) {
>> +??????? cdd->error = 1;
>> +??????? pr_err("Failed to enable double trap on cpu %d\n",
>> smp_processor_id());
>> +??? }
>> +}
>> +
>> +static int sbi_enable_double_trap(void)
>> +{
>> +??? struct cpu_dbltrp_data cdd = {0};
>> +
>> +??? on_each_cpu(sbi_cpu_enable_double_trap, &cdd, 1);
>> +??? if (cdd.error)
>> +??????? return -1;
> 
> There is a bug here. If `sbi_cpu_enable_double_trap` failed on all cpus
> but last cpu.
> Then cdd.error would not record error and will be reflect as if double
> trap was enabled.

cdd.error is only written in case of error by the per-cpu callbacks, so
it is only set if enabled failed. Is there something I'm missing ?

Thanks,

Cl?ment

> 
> Its less likely to happen that FW would return success for one cpu and
> fail for others.
> But there is non-zero probablity here.
> 


