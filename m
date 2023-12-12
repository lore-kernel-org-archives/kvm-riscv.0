From: Haibo Xu <haibo1.xu@intel.com>
Date: Tue, 12 Dec 2023 17:31:09 +0800
Subject: [PATCH v4 00/11] RISCV: Add kvm Sstc timer selftests
Message-ID: <cover.1702371136.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RISC-V arch_timer selftests is used to validate Sstc timer
functionality in a guest, which sets up periodic timer interrupts
and check the basic interrupt status upon its receipt.

This KVM selftests was ported from aarch64 arch_timer and tested
with Linux v6.7-rc4 on a Qemu riscv64 virt machine.

---
Changed since v4:
  * Rebased to Linux 6.7-rc4
  * Included Paolo's patch(01/11) to fix issues with SPLIT_TESTS
  * Droped the patch(KVM: selftests: Unify the makefile rule for split targets) 
    since Paolo's patch had included the fix
  * Added new patch(05/11) to include header file vdso/processor.h from linux
    source tree to leverage the cpu_relax() definition - Conor/Andrew
  * Added new patch(11/11) to enable user configuration of timer error margin
    parameter which alleviate the intermitent failure in stress test - Andrew
  * Other minor fixes per Andrew's comments

Haibo Xu (10):
  KVM: arm64: selftests: Split arch_timer test code
  KVM: selftests: Add CONFIG_64BIT definition for the build
  tools: riscv: Add header file csr.h
  tools: riscv: Add header file vdso/processor.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test
  KVM: selftests: Enable tunning of err_margin_us in arch timer test

Paolo Bonzini (1):
  selftests/kvm: Fix issues with $(SPLIT_TESTS)

 tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
 tools/arch/riscv/include/asm/vdso/processor.h |  32 ++
 tools/testing/selftests/kvm/Makefile          |  27 +-
 .../selftests/kvm/aarch64/arch_timer.c        | 295 +---------
 tools/testing/selftests/kvm/arch_timer.c      | 259 +++++++++
 .../selftests/kvm/include/aarch64/processor.h |   4 -
 .../selftests/kvm/include/kvm_util_base.h     |   9 +
 .../selftests/kvm/include/riscv/arch_timer.h  |  71 +++
 .../selftests/kvm/include/riscv/processor.h   |  65 ++-
 .../testing/selftests/kvm/include/test_util.h |   2 +
 .../selftests/kvm/include/timer_test.h        |  45 ++
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  87 +++
 .../testing/selftests/kvm/riscv/arch_timer.c  | 111 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  11 +-
 15 files changed, 1333 insertions(+), 307 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

-- 
2.34.1


