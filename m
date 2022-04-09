From: Oliver Upton <oupton@google.com>
Date: Sat,  9 Apr 2022 18:45:36 +0000
Subject: [PATCH v5 00/13] KVM: arm64: PSCI SYSTEM_SUSPEND support
Message-ID: <20220409184549.1681189-1-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The PSCI v1.0 specification describes a call, SYSTEM_SUSPEND, which
allows software to request that the system be placed into the lowest
possible power state and await a wakeup event. This call is optional
in v1.0 and v1.1. KVM does not currently support this optional call.

This series adds support for the PSCI SYSTEM_SUSPEND call to KVM/arm64.
For reasons best described in patch 8, it is infeasible to correctly
implement PSCI SYSTEM_SUSPEND (or any system-wide event for that matter)
in a split design between kernel/userspace. As such, this series cheaply
exits to userspace so it can decide what to do with the call. This
series also gives userspace some help to emulate suspension with a new
MP state that awaits an unmasked pending interrupt.

Patches 1-6 are small reworks to more easily shoehorn the new features
into the kernel.

Patch 7 stands up the new suspend MP state, allowing userspace to
emulate the PSCI call.

Patch 8 actually allows userspace to enable the PSCI call, which
requires explicit opt-in for the new KVM_EXIT_SYSTEM_EVENT type.

Patches 9-12 clean up the way PSCI is tested in selftests to more easily
add new test cases.

Finally, the last patch actually tests that PSCI SYSTEM_SUSPEND calls
within the guest result in userspace exits.

Applies cleanly to kvmarm/fixes, at the following commit:

  21db83846683 ("selftests: KVM: Free the GIC FD when cleaning up in arch_timer")

This is because there's some patches on the fixes branch that would
cause conflicts with this series otherwise.

Tested with the included selftest and a hacked up kvmtool [1] with support
for the new UAPI.

[1]: https://lore.kernel.org/all/20220311175717.616958-1-oupton at google.com/

v4: http://lore.kernel.org/r/20220311174001.605719-1-oupton at google.com

v4 -> v5:
 - Rebase to kvmarm/fixes (5.18-rc1 + a bit more)
 - Rework system event helper around RISC-V SBI changes (Anup)
 - Don't presume a vCPU has been woken up when it returns from
   kvm_vcpu_wfi(), as there are other situations where the vCPU thread
   unblocks, such as signals. (Reiji)
 - Tighten up comments/docs (Reiji)

Oliver Upton (13):
  KVM: arm64: Don't depend on fallthrough to hide SYSTEM_RESET2
  KVM: arm64: Dedupe vCPU power off helpers
  KVM: arm64: Track vCPU power state using MP state values
  KVM: arm64: Rename the KVM_REQ_SLEEP handler
  KVM: Create helper for setting a system event exit
  KVM: arm64: Return a value from check_vcpu_requests()
  KVM: arm64: Add support for userspace to suspend a vCPU
  KVM: arm64: Implement PSCI SYSTEM_SUSPEND
  selftests: KVM: Rename psci_cpu_on_test to psci_test
  selftests: KVM: Create helper for making SMCCC calls
  selftests: KVM: Use KVM_SET_MP_STATE to power off vCPU in psci_test
  selftests: KVM: Refactor psci_test to make it amenable to new tests
  selftests: KVM: Test SYSTEM_SUSPEND PSCI call

 Documentation/virt/kvm/api.rst                |  76 ++++++-
 arch/arm64/include/asm/kvm_host.h             |  11 +-
 arch/arm64/kvm/arm.c                          | 107 +++++++--
 arch/arm64/kvm/psci.c                         |  66 +++---
 arch/riscv/kvm/vcpu_sbi.c                     |   5 +-
 arch/x86/kvm/x86.c                            |   6 +-
 include/linux/kvm_host.h                      |   2 +
 include/uapi/linux/kvm.h                      |   4 +
 tools/testing/selftests/kvm/.gitignore        |   2 +-
 tools/testing/selftests/kvm/Makefile          |   2 +-
 .../selftests/kvm/aarch64/psci_cpu_on_test.c  | 121 ----------
 .../testing/selftests/kvm/aarch64/psci_test.c | 213 ++++++++++++++++++
 .../selftests/kvm/include/aarch64/processor.h |  22 ++
 .../selftests/kvm/lib/aarch64/processor.c     |  25 ++
 tools/testing/selftests/kvm/steal_time.c      |  13 +-
 virt/kvm/kvm_main.c                           |   8 +
 16 files changed, 493 insertions(+), 190 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/aarch64/psci_cpu_on_test.c
 create mode 100644 tools/testing/selftests/kvm/aarch64/psci_test.c

-- 
2.35.1.1178.g4f1659d476-goog


