From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Fri, 01 Apr 2022 11:38:58 -0700 (PDT)
Subject: [PATCH v11 0/8] RISC-V CPU Idle Support
In-Reply-To: <CAL_JsqJm7kz1LTrTBMB3rd-K48e2584v6Nn3LwmnLzH8rk_D2w@mail.gmail.com>
Message-ID: <mhng-dda0f137-102d-480e-a67c-34eb713a24b1@palmer-mbp2014>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 01 Apr 2022 11:13:32 PDT (-0700), robh+dt at kernel.org wrote:
> On Wed, Mar 30, 2022 at 7:16 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 09 Feb 2022 21:49:39 PST (-0800), apatel at ventanamicro.com wrote:
>> > From: Anup Patel <anup.patel@wdc.com>
>> >
>> > This series adds RISC-V CPU Idle support using SBI HSM suspend function.
>> > The RISC-V SBI CPU idle driver added by this series is highly inspired
>> > from the ARM PSCI CPU idle driver.
>> >
>> > At high-level, this series includes the following changes:
>> > 1) Preparatory arch/riscv patches (Patches 1 to 3)
>> > 2) Defines for RISC-V SBI HSM suspend (Patch 4)
>> > 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
>> >    and ARM PSCI CPU idle driver (Patch 5)
>> > 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
>> >
>> > These patches can be found in riscv_sbi_hsm_suspend_v11 branch of
>> > https://github.com/avpatel/linux.git
>> >
>> > Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
>> > support in all above projects (RISC-V SBI specification, OpenSBI, and
>> > Linux RISC-V).
>> >
>> > Changes since v10:
>> >  - Rebased on Linux-5.17-rc3
>> >  - Typo fix in commit description of PATCH6
>> >
>> > Changes since v9:
>> >  - Rebased on Linux-5.17-rc1
>> >
>> > Changes since v8:
>> >  - Rebased on Linux-5.15-rc5
>> >  - Fixed DT schema check errors in PATCH7
>> >
>> > Changes since v7:
>> >  - Rebased on Linux-5.15-rc3
>> >  - Renamed cpuidle-sbi.c to cpuidle-riscv-sbi.c in PATCH6
>> >
>> > Changes since v6:
>> >  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
>> >
>> > Changes since v5:
>> >  - Rebased on Linux-5.13-rc5
>> >  - Removed unnecessary exports from PATCH5
>> >  - Removed stray ";" from PATCH5
>> >  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
>> >    in PATCH6
>> >
>> > Changes since v4:
>> >  - Rebased on Linux-5.13-rc2
>> >  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
>> >  - Added MAINTAINERS file entry for dt_idle_genpd
>> >
>> > Changes since v3:
>> >  - Rebased on Linux-5.13-rc2
>> >  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
>> >  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
>> >    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
>> >
>> > Changes since v2:
>> >  - Rebased on Linux-5.12-rc3
>> >  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
>> >    idle states
>> >  - Added "additionalProperties = false" for both idle-states node and
>> >    child nodes in PATCH7
>> >
>> > Changes since v1:
>> >  - Fixex minor typo in PATCH1
>> >  - Use just "idle-states" as DT node name for CPU idle states
>> >  - Added documentation for "cpu-idle-states" DT property in
>> >    devicetree/bindings/riscv/cpus.yaml
>> >  - Added documentation for "riscv,sbi-suspend-param" DT property in
>> >    devicetree/bindings/riscv/idle-states.yaml
>> >
>> > Anup Patel (8):
>> >   RISC-V: Enable CPU_IDLE drivers
>> >   RISC-V: Rename relocate() and make it global
>> >   RISC-V: Add arch functions for non-retentive suspend entry/exit
>> >   RISC-V: Add SBI HSM suspend related defines
>> >   cpuidle: Factor-out power domain related code from PSCI domain driver
>> >   cpuidle: Add RISC-V SBI CPU idle driver
>> >   dt-bindings: Add common bindings for ARM and RISC-V idle states
>> >   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
>> >
>> >  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>> >  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>> >  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
>> >  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>> >  MAINTAINERS                                   |  14 +
>> >  arch/riscv/Kconfig                            |   7 +
>> >  arch/riscv/Kconfig.socs                       |   3 +
>> >  arch/riscv/configs/defconfig                  |   2 +
>> >  arch/riscv/configs/rv32_defconfig             |   2 +
>> >  arch/riscv/include/asm/asm.h                  |  27 +
>> >  arch/riscv/include/asm/cpuidle.h              |  24 +
>> >  arch/riscv/include/asm/sbi.h                  |  27 +-
>> >  arch/riscv/include/asm/suspend.h              |  36 +
>> >  arch/riscv/kernel/Makefile                    |   2 +
>> >  arch/riscv/kernel/asm-offsets.c               |   3 +
>> >  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
>> >  arch/riscv/kernel/head.S                      |  28 +-
>> >  arch/riscv/kernel/process.c                   |   3 +-
>> >  arch/riscv/kernel/suspend.c                   |  87 +++
>> >  arch/riscv/kernel/suspend_entry.S             | 124 ++++
>> >  arch/riscv/kvm/vcpu_sbi_hsm.c                 |   4 +-
>> >  drivers/cpuidle/Kconfig                       |   9 +
>> >  drivers/cpuidle/Kconfig.arm                   |   1 +
>> >  drivers/cpuidle/Kconfig.riscv                 |  15 +
>> >  drivers/cpuidle/Makefile                      |   5 +
>> >  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
>> >  drivers/cpuidle/cpuidle-psci.h                |  15 +-
>> >  drivers/cpuidle/cpuidle-riscv-sbi.c           | 627 ++++++++++++++++++
>> >  drivers/cpuidle/dt_idle_genpd.c               | 178 +++++
>> >  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>> >  30 files changed, 1484 insertions(+), 187 deletions(-)
>> >  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>> >  create mode 100644 arch/riscv/include/asm/cpuidle.h
>> >  create mode 100644 arch/riscv/include/asm/suspend.h
>> >  create mode 100644 arch/riscv/kernel/suspend.c
>> >  create mode 100644 arch/riscv/kernel/suspend_entry.S
>> >  create mode 100644 drivers/cpuidle/Kconfig.riscv
>> >  create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
>> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
>>
>> Thanks, these are on for-next.
>
> For 5.18? You are not supposed to put new material into linux-next
> during the merge window.

Ya, I was aiming for these for 5.18 -- I know it's late, but I'd been 
trying to chase folks around for reviews and figured it was good enough.  
I just sent Linus a PR, it's not merged yet so if this is a problem I 
can re-spin it now.

Sorry!

>
> In any case, this now cause warnings on 'cpu-idle-states':
>
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu at 0: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu at 1: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu at 100: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu at 101: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
>
> See commit 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
> for how to fix.
>
> Rob

