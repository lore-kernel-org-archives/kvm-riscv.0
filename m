From: Oliver Upton <oupton@google.com>
Date: Fri, 11 Mar 2022 17:39:46 +0000
Subject: [PATCH v4 00/15] KVM: arm64: PSCI SYSTEM_SUSPEND + SYSTEM_RESET2
 bugfix
Message-ID: <20220311174001.605719-1-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

**NOTE** Patch 2 is a bugfix for commit d43583b890e7 ("KVM: arm64:
Expose PSCI SYSTEM_RESET2 call to the guest") on kvmarm/next. Without
this patch, it is possible for the guest to call
PSCI_1_1_FN64_SYSTEM_RESET2 from AArch32.

The PSCI v1.0 specification describes a call, SYSTEM_SUSPEND, which
allows software to request that the system be placed into the lowest
possible power state and await an IMPLEMENTATION DEFINED wakeup event.
This call is optional in v1.0 and v1.1. KVM does not currently support
this optional call.

This series adds support for the PSCI SYSTEM_SUSPEND call to KVM/arm64.
For reasons best explained in PATCH 09/15, it is infeasible to correctly
implement PSCI SYSTEM_SUSPEND like the other system-wide PSCI calls,
wherein part of the implementation exists in the kernel and the rest in
userspace. To that end, this series affords userspace the ability to
trap SYSTEM_SUSPEND calls (with opt-in) and to optionally leverage
in-kernel emulation of a suspension by way of a new MP_STATE.

Patch 1 snags a useful change from Marc to use bits in an unsigned long
to indicate boolean properties of a VM instead of boolean fields. This
patch was lifted from [1] and modified to eliminate kvm_arch::ran_once.

Patches 2-3 rework some of the PSCI switch statements to make them a bit
more futureproof for later extension. Namely, eliminate dependence on
falling through to the default case. Additionally, reject any and all
SMC64 calls made from AArch32 instead of checking on a case-by-case
basis.

Patch 4 starts tracking the MP state of vCPUs explicitly, as subsequent
changes add additional states that cannot be otherwise represented.

Patch 5 is a renaming nit to clarify the KVM_REQ_SLEEP handler processes
(instead of makes) requests.

Patch 6 creates a helper for preparing kvm_run to do a system event
exit.

Patch 7 prepares for the case where a vCPU request could result in an
exit to userspace.

Patch 8 adds support for userspace to request in-kernel emulation of a
suspended vCPU as the architectural execution of a WFI instruction.
Userspace gets to decide when to resume the vCPU, so KVM will just exit
every time a wakeup event is recognized (unmasked pending interrupt).

Patch 9 adds a capability that allows userspace to trap the
SYSTEM_SUSPEND PSCI call. KVM does absolutely nothing besides exit to
avoid possible races when exiting to userspace.

Patches 10-14 rework some SMCCC handling in KVM selftests as well as
prepare the PSCI test for more test cases.

Lastly, patch 15 adds test cases for SYSTEM_SUSPEND, verifying that it
is discoverable with the PSCI_FEATURES call and results in exits to
userspace when directly called.

Given the conflicts/fixes for SYSTEM_RESET2 and conflicts with
Documentation changes, this series is based on kvmarm/next at commit:

  9872e6bc08d6 ("Merge branch kvm-arm64/psci-1.1 into kvmarm-master/next")

This series was tested with the included selftest as well as a kvmtool
series that instruments the userspace portion of SYSTEM_SUSPEND that
will be sent out soon.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/mmu/guest-MMIO-guard&id=7dd0a13a4217b870f2e83cdc6045e5ce482a5340

v3: https://patchwork.kernel.org/project/kvm/cover/20220223041844.3984439-1-oupton at google.com/

v3 -> v4:
 - Rebase to kvmarm/next
 - Grab Marc's VM feature patch
 - Drop filtering for an invalid IPA. It is no longer directly relevant
   to this series and can be sent out separately.
 - Use the kvm_mp_state structure to store a vCPU's MP state (Marc)
 - Rename helper to better fit MP state mnemonic (Marc)
 - Don't even bother with an in-kernel implementation of the
   SYSTEM_SUSPEND call (Marc)
 - Add discoverability tests for SYSTEM_SUSPEND
 - Ack from Anup for RISC-V change.

Marc Zyngier (1):
  KVM: arm64: Generalise VM features into a set of flags

Oliver Upton (14):
  KVM: arm64: Generally disallow SMC64 for AArch32 guests
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
 arch/arm64/include/asm/kvm_host.h             |  25 +-
 arch/arm64/kvm/arm.c                          | 100 ++++++--
 arch/arm64/kvm/mmio.c                         |   3 +-
 arch/arm64/kvm/pmu-emul.c                     |   4 +-
 arch/arm64/kvm/psci.c                         |  80 ++++---
 arch/riscv/kvm/vcpu_sbi_v01.c                 |   4 +-
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
 18 files changed, 501 insertions(+), 209 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/aarch64/psci_cpu_on_test.c
 create mode 100644 tools/testing/selftests/kvm/aarch64/psci_test.c

-- 
2.35.1.723.g4982287a31-goog


