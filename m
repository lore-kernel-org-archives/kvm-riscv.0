From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 May 2024 09:06:27 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.10
Message-ID: <CAAhSdy3C7N11wV8U7qMWsKtT2U+_G_FsW8EVMER8fkKHPgy8rg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.10:
1) Support guest breakpoints using ebreak
2) Introduce per-VCPU mp_state_lock and reset_cntx_lock
3) Virtualize SBI PMU snapshot and counter overflow interrupts
4) New selftests for SBI PMU and Guest ebreak

Please pull.

Regards,
Anup

The following changes since commit fec50db7033ea478773b159e0e2efb135270e3b7:

  Linux 6.9-rc3 (2024-04-07 13:22:46 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.10-1

for you to fetch changes up to 5ef2f3d4e747c7851678ad2b70e37be886a8c9eb:

  KVM: riscv: selftests: Add commandline option for SBI PMU test
(2024-04-26 13:14:15 +0530)

----------------------------------------------------------------
 KVM/riscv changes for 6.10

- Support guest breakpoints using ebreak
- Introduce per-VCPU mp_state_lock and reset_cntx_lock
- Virtualize SBI PMU snapshot and counter overflow interrupts

----------------------------------------------------------------
Atish Patra (24):
      RISC-V: Fix the typo in Scountovf CSR name
      RISC-V: Add FIRMWARE_READ_HI definition
      drivers/perf: riscv: Read upper bits of a firmware counter
      drivers/perf: riscv: Use BIT macro for shifting operations
      RISC-V: Add SBI PMU snapshot definitions
      RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
      RISC-V: Use the minor version mask while computing sbi version
      drivers/perf: riscv: Fix counter mask iteration for RV32
      drivers/perf: riscv: Implement SBI PMU snapshot function
      RISC-V: KVM: Fix the initial sample period value
      RISC-V: KVM: No need to update the counter value during reset
      RISC-V: KVM: No need to exit to the user space if perf event failed
      RISC-V: KVM: Implement SBI PMU Snapshot feature
      RISC-V: KVM: Add perf sampling support for guests
      RISC-V: KVM: Support 64 bit firmware counters on RV32
      RISC-V: KVM: Improve firmware counter read function
      KVM: riscv: selftests: Move sbi definitions to its own header file
      KVM: riscv: selftests: Add helper functions for extension checks
      KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
      KVM: riscv: selftests: Add SBI PMU extension definitions
      KVM: riscv: selftests: Add SBI PMU selftest
      KVM: riscv: selftests: Add a test for PMU snapshot functionality
      KVM: riscv: selftests: Add a test for counter overflow
      KVM: riscv: selftests: Add commandline option for SBI PMU test

Chao Du (3):
      RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
      RISC-V: KVM: Handle breakpoint exits for VCPU
      RISC-V: KVM: selftests: Add ebreak test support

Yong-Xuan Wang (2):
      RISCV: KVM: Introduce mp_state_lock to avoid lock inversion
      RISCV: KVM: Introduce vcpu->reset_cntx_lock

 arch/riscv/include/asm/csr.h                       |   5 +-
 arch/riscv/include/asm/kvm_host.h                  |  21 +-
 arch/riscv/include/asm/kvm_vcpu_pmu.h              |  16 +-
 arch/riscv/include/asm/sbi.h                       |  38 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   1 +
 arch/riscv/kernel/paravirt.c                       |   6 +-
 arch/riscv/kvm/aia.c                               |   5 +
 arch/riscv/kvm/main.c                              |  18 +-
 arch/riscv/kvm/vcpu.c                              |  85 ++-
 arch/riscv/kvm/vcpu_exit.c                         |   4 +
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +
 arch/riscv/kvm/vcpu_pmu.c                          | 260 +++++++-
 arch/riscv/kvm/vcpu_sbi.c                          |   7 +-
 arch/riscv/kvm/vcpu_sbi_hsm.c                      |  42 +-
 arch/riscv/kvm/vcpu_sbi_pmu.c                      |  17 +-
 arch/riscv/kvm/vcpu_sbi_sta.c                      |   4 +-
 arch/riscv/kvm/vm.c                                |   1 +
 drivers/perf/riscv_pmu.c                           |   3 +-
 drivers/perf/riscv_pmu_sbi.c                       | 316 +++++++++-
 include/linux/perf/riscv_pmu.h                     |   8 +
 tools/testing/selftests/kvm/Makefile               |   2 +
 .../selftests/kvm/include/riscv/processor.h        |  49 +-
 tools/testing/selftests/kvm/include/riscv/sbi.h    | 141 +++++
 tools/testing/selftests/kvm/include/riscv/ucall.h  |   1 +
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  12 +
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |  82 +++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |   4 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   | 681 +++++++++++++++++++++
 tools/testing/selftests/kvm/steal_time.c           |   4 +-
 30 files changed, 1674 insertions(+), 167 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h
 create mode 100644 tools/testing/selftests/kvm/riscv/ebreak_test.c
 create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c

