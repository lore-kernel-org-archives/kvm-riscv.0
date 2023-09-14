From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 14 Sep 2023 09:36:54 +0800
Subject: [PATCH v3 0/9] RISCV: Add kvm Sstc timer selftests
Message-ID: <cover.1694421911.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RISC-V arch_timer selftests is used to validate Sstc timer
functionality in a guest, which sets up periodic timer interrupts
and check the basic interrupt status upon its receipt.

This KVM selftests was ported from aarch64 arch_timer and tested
with Linux v6.6-rc1 on a Qemu riscv64 virt machine.

---
Changed since v2:
  * Rebase to Linux 6.6-rc1
  * Add separate patch for kvm/Makefile improvement
  * Move aarch64 specific macros to aarch64/arch_timer.c
  * Add -DCONFIG_64BIT to kvm/Makefile CFLAGS to ensure
    only 64bit registers were available in csr.h
  * Avoid some #ifdef in kvm/arch_timer.c by setting some
    aarch64 specific variable to 0 on risc-v

Haibo Xu (9):
  KVM: selftests: Unify the codes for guest exception handling
  KVM: selftests: Unify the makefile rule for split targets
  KVM: arm64: selftests: Split arch_timer test code
  tools: riscv: Add header file csr.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test

 tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |  14 +-
 .../selftests/kvm/aarch64/arch_timer.c        | 291 +---------
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/page_fault_test.c   |   4 +-
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   4 +-
 tools/testing/selftests/kvm/arch_timer.c      | 250 +++++++++
 .../selftests/kvm/include/aarch64/processor.h |  12 +-
 .../selftests/kvm/include/kvm_util_base.h     |   9 +
 .../selftests/kvm/include/riscv/arch_timer.h  |  80 +++
 .../selftests/kvm/include/riscv/processor.h   |  63 ++-
 .../testing/selftests/kvm/include/test_util.h |   2 +
 .../selftests/kvm/include/timer_test.h        |  43 ++
 .../selftests/kvm/include/x86_64/processor.h  |   5 -
 .../selftests/kvm/lib/aarch64/processor.c     |   6 +-
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  86 +++
 .../selftests/kvm/lib/x86_64/processor.c      |   4 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  | 107 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  16 +-
 tools/testing/selftests/kvm/x86_64/amx_test.c |   4 +-
 .../selftests/kvm/x86_64/fix_hypercall_test.c |   4 +-
 .../selftests/kvm/x86_64/hyperv_evmcs.c       |   4 +-
 .../selftests/kvm/x86_64/hyperv_features.c    |   8 +-
 .../testing/selftests/kvm/x86_64/hyperv_ipi.c |   6 +-
 .../selftests/kvm/x86_64/kvm_pv_test.c        |   4 +-
 .../selftests/kvm/x86_64/monitor_mwait_test.c |   4 +-
 .../kvm/x86_64/pmu_event_filter_test.c        |   8 +-
 .../smaller_maxphyaddr_emulation_test.c       |   4 +-
 .../selftests/kvm/x86_64/svm_int_ctl_test.c   |   4 +-
 .../kvm/x86_64/svm_nested_shutdown_test.c     |   4 +-
 .../kvm/x86_64/svm_nested_soft_inject_test.c  |   4 +-
 .../kvm/x86_64/ucna_injection_test.c          |   8 +-
 .../kvm/x86_64/userspace_msr_exit_test.c      |   4 +-
 .../vmx_exception_with_invalid_guest_state.c  |   4 +-
 .../selftests/kvm/x86_64/vmx_pmu_caps_test.c  |   4 +-
 .../selftests/kvm/x86_64/xapic_ipi_test.c     |   4 +-
 .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |   4 +-
 .../selftests/kvm/x86_64/xen_shinfo_test.c    |   4 +-
 39 files changed, 1338 insertions(+), 374 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

-- 
2.34.1


