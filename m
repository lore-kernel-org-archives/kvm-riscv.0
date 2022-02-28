From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 01:42:27 -0800
Subject: [RFC PATCH 0/6] Add Sstc extension support 
Message-ID: <20220228094234.3773153-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements Sstc extension support which was ratified recently.
Before the Sstc extension, an SBI call is necessary to generate timer
interrupts as only M-mode have access to the timecompare registers. Thus,
there is significant latency to generate timer interrupts at kernel.
For virtualized enviornments, its even worse as the KVM handles the SBI call
and uses a software timer to emulate the timecomapre register. 

Sstc extension solves both these problems by defining a stimecmp/vstimecmp
at supervisor (host/guest) level. It allows kernel to program a timer and
recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
intervention.

To maintain backward compatibility, KVM directly updates the vstimecmp
if older kernel without sstc support is running in guest. Similary, the
M-mode firmware(OpenSBI) uses stimecmp for older kernel without sstc support. 

The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
PATCH 4 & 5 adds the infrastructure for KVM to use sstc while PATCH 6 actually
uses the Sstc extension if available. 

This series has been tested on Qemu(RV32 & RV64) with additional patches in
OpenSBI[2] and Qemu[3]. This series can also be found at [4].

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/opensbi/tree/sstc_v1
[3] https://github.com/atishp04/qemu/tree/sstc_v1
[3] https://github.com/atishp04/linux/tree/sstc_v1

Atish Patra (6):
RISC-V: Add SSTC extension CSR details
RISC-V: Enable sstc extension parsing from DT
RISC-V: Prefer sstc extension if available
RISC-V: Restrict the isa field in config register to base extensions
RISC-V: KVM: Introduce ISA extension register
RISC-V: KVM: Support sstc extension

arch/riscv/include/asm/csr.h            |  11 ++
arch/riscv/include/asm/hwcap.h          |   1 +
arch/riscv/include/asm/kvm_host.h       |   4 +
arch/riscv/include/asm/kvm_vcpu_timer.h |   3 +-
arch/riscv/include/asm/timex.h          |   2 +
arch/riscv/include/uapi/asm/kvm.h       |  22 ++++
arch/riscv/kernel/cpu.c                 |   1 +
arch/riscv/kernel/cpufeature.c          |   4 +-
arch/riscv/kvm/main.c                   |   8 ++
arch/riscv/kvm/vcpu.c                   | 111 ++++++++++++++++++-
arch/riscv/kvm/vcpu_sbi_replace.c       |  10 +-
arch/riscv/kvm/vcpu_timer.c             | 136 +++++++++++++++++++++++-
drivers/clocksource/timer-riscv.c       |  22 +++-
13 files changed, 323 insertions(+), 12 deletions(-)

--
2.30.2


