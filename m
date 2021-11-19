From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 18 Nov 2021 23:10:58 -0800 (PST)
Subject: [PATCH v2] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
In-Reply-To: <CAOnJCULQJj0ZyyF+Q1cogXsC9GDQKLTms8vHvNNpj4aHntmx6w@mail.gmail.com>
Message-ID: <mhng-d3ecff31-cbc9-414f-b235-faaac49224f9@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 17 Nov 2021 23:53:59 PST (-0800), atishp at atishpatra.org wrote:
> On Wed, Nov 17, 2021 at 12:47 AM Anup Patel <anup.patel@wdc.com> wrote:
>>
>> Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
>> so that it always built along with the default kernel image.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> ---
>> Changes since v1:
>>  - Rebased on Linux-5.16-rc1
>>  - Removed unwanted stuff from defconfig PATCH1
>>  - Dropped PATCH2 and PATCH3 since these are already merged via KVM tree
>> ---
>>  arch/riscv/configs/defconfig      | 2 ++
>>  arch/riscv/configs/rv32_defconfig | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index c252fd5706d2..ef473e2f503b 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>>  CONFIG_SMP=y
>>  CONFIG_HOTPLUG_CPU=y
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=m
>>  CONFIG_JUMP_LABEL=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
>> index 434ef5b64599..6e9f12ff968a 100644
>> --- a/arch/riscv/configs/rv32_defconfig
>> +++ b/arch/riscv/configs/rv32_defconfig
>> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>>  CONFIG_ARCH_RV32I=y
>>  CONFIG_SMP=y
>>  CONFIG_HOTPLUG_CPU=y
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=m
>>  CONFIG_JUMP_LABEL=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> --
>> 2.25.1
>>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I was actually just about to send a defconfig cleanup patch set.  My 
tests are all still a bit broken, so I'm going to hold off on sending 
the defconfig cleanups until I can get them back together.  This is so 
simple that anything it could break would already be broken, so I'm just 
going to take it now.

This is on fixes.

Thanks!

