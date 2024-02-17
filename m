From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:18 -0800
Subject: [PATCH RFC 00/20] Add Counter delegation ISA extension support 
Message-ID: <20240217005738.3744121-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds the counter delegation extension support. It is based on
very early PoC work done by Kevin Xue and mostly rewritten after that.
The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
on multiple ISA extensions.

1. S[m|s]csrind : The indirect CSR extension[1] which defines additional
   5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space.
2. Smstateen: The stateen bit[60] controls the access to the registers
   indirectly via the above indirect registers.
3. Smcdeleg/Ssccfg: The counter delegation extensions[2]

The counter delegation extension allows Supervisor mode to program the
hpmevent and hpmcounters directly without needing the assistance from the
M-mode via SBI calls. This results in a faster perf profiling and very
few traps. This extension also introduces a scountinhibit CSR which allows
to stop/start any counter directly from the S-mode. As the counter
delegation extension potentially can have more than 100 CSRs, the specification
leverages the indirect CSR extension to save the precious CSR address range.

Due to the dependency of these extensions, the following extensions must be
enabled in qemu to use the counter delegation feature in S-mode.

"smstateen=true,sscofpmf=true,ssccfg=true,smcdeleg=true,smcsrind=true,sscsrind=true"

When we access the counters directly in S-mode, we also need to solve the
following problems.

1. Event to counter mapping
2. Event encoding discovery

The RISC-V ISA doesn't define any standard either for event encoding or the
event to counter mapping rules.

Until now, the SBI PMU implementation relies on device tree binding[3] to
discover the event to counter mapping in RISC-V platform in the firmware. The
SBI PMU specification[4] defines event encoding for standard perf events as well.
Thus, the kernel can query the appropriate counter for an given event from the
firmware.

However, the kernel doesn't need any firmware interaction for hardware
counters if counter delegation is available in the hardware. Thus, the driver
needs to discover the above mappings/encodings by itself without any assistance
from firmware. One of the options considered was to extend the PMU DT parsing
support to kernel as well. However, that requires additional support in ACPI
based system. It also needs more infrastructure in the virtualization as well.

This patch series solves the above problem #1 by extending the perf tool in a
way so that event json file can specify the counter constraints of each event
and that can be passed to the driver to choose the best counter for a given
event. The perf stat metric series[5] from Weilin already extend the perf tool
to parse "Counter" property to specify the hardware counter restriction.
I have included the patch from Weilin in this series for verification purposes
only. I will rebase as that series evolves.

This series extends that support by converting comma separated string to a
bitmap. The counter constraint bitmap is passed to the perf driver via
newly introduced "counterid_mask" property set in "config2". Even though, this
is a generic perf tool change, this should not affect any other architecture
if "counterid_mask" is not mapped. 

@Weilin: Please let me know if there is a better way to solve the problem I
described. 

The problem #2 is solved by defining a architecture specific override function
that will replace the perf standard event encoding with an encoding specified
in the json file with the same event name. The alternate solution considered
was to specify the encodings in the driver. However, these encodings are vendor
specific in absence of an ISA guidelines and will become unmanageable with
so many RISC-V vendors touching the driver for their encoding. 

The override is only required when counter delegation is available in the
platform which is detected at the runtime. The SBI PMU (current implementation)
doesn't require any override as it defines the standard event encoding. The
hwprobe syscall defined for RISC-V is used for this detection in this series.
A sysfs based property can be explored to do the same but we may require
hwprobe in future given the churn of extensions in RISC-V. That's why, I went
with hwprobe. Let me know if anybody thinks that's a bad idea. 

The perf tool also hook allows RISC-V ISA platform vendors to define their
encoding for any standard perf or ISA event. I have tried to cover all the use
cases that I am aware of (stat, record, top). Please let me know if I have
missed any particular use case where architecture hook must be invoked. I am
also open to any other idea to solve the above said problem.

PATCH organization:
PATCH 1 is from the perf metric series[5]
PATCH 2-5 defines and implements the indirect CSR extension.
PATCH 6-10 defines the other required ISA extensions.
PATCH 11 just an overall restructure of the RISC-V PMU driver.
PATCH 12-14 implements the counter delegation extension and new perf tool
plumbings to solve #1 and #2.
PATCH 15-16 improves the perf tool support to solve #1 and #2.
PATCH 17 adds a perf json file for qemu virt machine.
PATCH 18-20 adds hwprobe mechanism to enable perf to detect if platform supports
delegation extensions.

There is no change in process to run perf stat/record and will continue to work
as it is as long as the relevant extensions have been enabled in Qemu.

However, the perf tool needs to be recompiled with as it requires new kenrel
headers.

The Qemu patches can be found here:
https://github.com/atishp04/qemu/tree/counter_delegation_rfc

The opensbi patch can be found here:
https://github.com/atishp04/opensbi/tree/counter_delegation_v1

The Linux kernel patches can be found here:
https://github.com/atishp04/linux/tree/counter_delegation_rfc

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/perf/riscv%2Cpmu.yaml
[4] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc
[5] https://lore.kernel.org/all/20240209031441.943012-4-weilin.wang at intel.com/

Atish Patra (17):
RISC-V: Add Sxcsrind ISA extension definition and parsing
dt-bindings: riscv: add Sxcsrind ISA extension description
RISC-V: Define indirect CSR access helpers
RISC-V: Add Ssccfg ISA extension definition and parsing
dt-bindings: riscv: add Ssccfg ISA extension description
RISC-V: Add Smcntrpmf extension parsing
dt-bindings: riscv: add Smcntrpmf ISA extension description
RISC-V: perf: Restructure the SBI PMU code
RISC-V: perf: Modify the counter discovery mechanism
RISC-V: perf: Implement supervisor counter delegation support
RISC-V: perf: Use config2 for event to counter mapping
tools/perf: Add arch hooks to override perf standard events
tools/perf: Pass the Counter constraint values in the pmu events
perf: Add json file for virt machine supported events
tools arch uapi: Sync the uinstd.h header file for RISC-V
RISC-V: Add hwprobe support for Counter delegation extensions
tools/perf: Detect if platform supports counter delegation

Kaiwen Xue (2):
RISC-V: Add Sxcsrind ISA extension CSR definitions
RISC-V: Add Sscfg extension CSR definition

Weilin Wang (1):
perf pmu-events: Add functions in jevent.py to parse counter and event
info for hardware aware grouping

Documentation/arch/riscv/hwprobe.rst          |  10 +
.../devicetree/bindings/riscv/extensions.yaml |  34 +
MAINTAINERS                                   |   4 +-
arch/riscv/include/asm/csr.h                  |  47 ++
arch/riscv/include/asm/csr_ind.h              |  42 ++
arch/riscv/include/asm/hwcap.h                |   5 +
arch/riscv/include/asm/sbi.h                  |   2 +-
arch/riscv/include/uapi/asm/hwprobe.h         |   4 +
arch/riscv/kernel/cpufeature.c                |   5 +
arch/riscv/kernel/sys_hwprobe.c               |   3 +
arch/riscv/kvm/vcpu_pmu.c                     |   2 +-
drivers/perf/Kconfig                          |  16 +-
drivers/perf/Makefile                         |   4 +-
.../perf/{riscv_pmu.c => riscv_pmu_common.c}  |   0
.../perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c} | 654 ++++++++++++++----
include/linux/perf/riscv_pmu.h                |  13 +-
tools/arch/riscv/include/uapi/asm/unistd.h    |  14 +-
tools/perf/arch/riscv/util/Build              |   2 +
tools/perf/arch/riscv/util/evlist.c           |  60 ++
tools/perf/arch/riscv/util/pmu.c              |  41 ++
tools/perf/arch/riscv/util/pmu.h              |  11 +
tools/perf/builtin-record.c                   |   3 +
tools/perf/builtin-stat.c                     |   2 +
tools/perf/builtin-top.c                      |   3 +
.../pmu-events/arch/riscv/arch-standard.json  |  10 +
tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
.../pmu-events/arch/riscv/qemu/virt/cpu.json  |  30 +
.../arch/riscv/qemu/virt/firmware.json        |  68 ++
tools/perf/pmu-events/jevents.py              | 186 ++++-
tools/perf/pmu-events/pmu-events.h            |  25 +-
tools/perf/util/evlist.c                      |   6 +
tools/perf/util/evlist.h                      |   6 +
32 files changed, 1167 insertions(+), 146 deletions(-)
create mode 100644 arch/riscv/include/asm/csr_ind.h
rename drivers/perf/{riscv_pmu.c => riscv_pmu_common.c} (100%)
rename drivers/perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c} (61%)
create mode 100644 tools/perf/arch/riscv/util/evlist.c
create mode 100644 tools/perf/arch/riscv/util/pmu.c
create mode 100644 tools/perf/arch/riscv/util/pmu.h
create mode 100644 tools/perf/pmu-events/arch/riscv/arch-standard.json
create mode 100644 tools/perf/pmu-events/arch/riscv/qemu/virt/cpu.json
create mode 100644 tools/perf/pmu-events/arch/riscv/qemu/virt/firmware.json

--
2.34.1


