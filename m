From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:25 +0000
Subject: [PATCH v3 00/19] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
Message-ID: <20220223041844.3984439-1-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The PSCI v1.0 specification describes a call, SYSTEM_SUSPEND, which
allows software to request that the system be placed into the lowest
possible power state and await an IMPLEMENTATION DEFINED wakeup event.
This call is optional in v1.0 and v1.1. KVM does not currently support
it in the v1.0 implementation.

This series adds support for the PSCI SYSTEM_SUSPEND call to KVM/arm64.
By default, KVM will treat the call as equivalent to CPU_SUSPEND,
wherein KVM handles the call as a guest WFI. However, this series also
introduces an opt-in for the SYSTEM_SUSPEND call to exit to userspace.
VMMs may use the event as a hint to save the VM to resume at a later
time, freeing up system resources. Userspace can decide at the time of
the exit whether or not to honor the SYSTEM_SUSPEND call.

Patch 1 is a small cleanup already present in kvmarm/next, but the
series depends on it so it has been included to guarantee the series
builds.

Patches 2-3 adds an additional check to the CPU_ON PSCI call. As Reiji
noted, PSCI implementations can return INVALID_ADDRESS if it is
determined that the provided entry address does not exist in the guest
address space.

Patch 4 is another small cleanup to generically filter SMC64 calls when
running an AArch32 EL1, avoiding the need to add a special case for the
new PSCI call introduced in this series.

Patches 5-6 add support for tracking a vCPU's power state using
KVM_MP_STATE_* values. This is significant as the series introduces an
additional power state, which cannot be represented by the
`vcpu->arch.power_off` boolean.

Patch 7 is a nitpick regarding the naming of a KVM_REQ_ handler.

Patches 8-9 provide the default implementation of PSCI SYSTEM_SUSPEND by
synchronously resetting the calling vCPU and entering WFI.

Patches 10-12 introduce a new MP state, KVM_MP_STATE_SUSPENDED, which
implements 'sticky' suspension. If userspace puts a vCPU in this state,
it will exit to userspace for every recognized wakeup event (pending
interrupt). When userspace is satisfied that a VM should resume, it must
explicitly unpark the vCPU by marking it runnable again. This is useful
for userspace to implement PSCI SYSTEM_SUSPEND if it decides to trap the
call.

Patch 13 extends upon the implementation of PSCI SYSTEM_SUSPEND,
granting userspace the opt-in capability of exiting to userspace on such
a call. *NOTE* KVM_SYSTEM_EVENT_SUSPEND breaks away from the semantics
of other system events. Userspace is required to manipulate the vCPU to
either reset it or reject the call. Other PSCI calls that exit set an
SMCCC return value before exiting, but doing so would clobber all of the
pending reset state. I wanted to avoid adding additional API to convey
the reset context to userspace so it may simply be expressed in the
architected state.

Patch 14 increments the reported PSCI version to 1.1, as KVM already
meets the requirements.

Patches 15-18 rework the PSCI selftest to make it amenable to additional
test cases

Lastly, patch 19 tests that the KVM_SYSTEM_EVENT_SUSPEND exits are
working as intended, and that KVM rejects invalid calls to PSCI
SYSTEM_SUSPEND.

This series applies cleanly to v5.17-rc5. Testing was performed with the
included selftest and suspending a QEMU guest (i.e. no system event
exits) on an Ampere Altra machine.

v2: https://patchwork.kernel.org/project/kvm/cover/20210923191610.3814698-1-oupton at google.com/

v2 -> v3:
 - rebase to 5.17-rc5
 - Reject CPU_ON and SYSTEM_SUSPEND calls that provide an invalid IPA
   (Reiji)
 - do *not* defer WFI as a requested event (Marc)
 - Add support for userspace filtering of wakeup events if SUSPEND exits
   are enabled (Marc)
 - Bump the reported PSCI verision to v1.1 (Marc)

Oliver Upton (19):
  KVM: arm64: Drop unused param from kvm_psci_version()
  KVM: arm64: Create a helper to check if IPA is valid
  KVM: arm64: Reject invalid addresses for CPU_ON PSCI call
  KVM: arm64: Clean up SMC64 PSCI filtering for AArch32 guests
  KVM: arm64: Dedupe vCPU power off helpers
  KVM: arm64: Track vCPU power state using MP state values
  KVM: arm64: Rename the KVM_REQ_SLEEP handler
  KVM: arm64: Add reset helper that accepts caller-provided reset state
  KVM: arm64: Implement PSCI SYSTEM_SUSPEND
  KVM: Create helper for setting a system event exit
  KVM: arm64: Return a value from check_vcpu_requests()
  KVM: arm64: Add support for userspace to suspend a vCPU
  KVM: arm64: Add support KVM_SYSTEM_EVENT_SUSPEND to PSCI
    SYSTEM_SUSPEND
  KVM: arm64: Raise default PSCI version to v1.1
  selftests: KVM: Rename psci_cpu_on_test to psci_test
  selftests: KVM: Create helper for making SMCCC calls
  selftests: KVM: Use KVM_SET_MP_STATE to power off vCPU in psci_test
  selftests: KVM: Refactor psci_test to make it amenable to new tests
  selftests: KVM: Test SYSTEM_SUSPEND PSCI call

 Documentation/virt/kvm/api.rst                |  62 ++++-
 arch/arm64/include/asm/kvm_host.h             |  27 ++-
 arch/arm64/include/asm/kvm_mmu.h              |   9 +
 arch/arm64/kvm/arm.c                          |  88 +++++--
 arch/arm64/kvm/psci.c                         | 129 ++++++++---
 arch/arm64/kvm/reset.c                        |  45 ++--
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |   2 +-
 arch/riscv/kvm/vcpu_sbi_v01.c                 |   4 +-
 arch/x86/kvm/x86.c                            |   6 +-
 include/kvm/arm_psci.h                        |   9 +-
 include/linux/kvm_host.h                      |   7 +
 include/uapi/linux/kvm.h                      |   4 +
 tools/testing/selftests/kvm/.gitignore        |   2 +-
 tools/testing/selftests/kvm/Makefile          |   2 +-
 .../selftests/kvm/aarch64/psci_cpu_on_test.c  | 121 ----------
 .../testing/selftests/kvm/aarch64/psci_test.c | 218 ++++++++++++++++++
 .../selftests/kvm/include/aarch64/processor.h |  22 ++
 .../selftests/kvm/lib/aarch64/processor.c     |  25 ++
 tools/testing/selftests/kvm/steal_time.c      |  13 +-
 19 files changed, 571 insertions(+), 224 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/aarch64/psci_cpu_on_test.c
 create mode 100644 tools/testing/selftests/kvm/aarch64/psci_test.c

-- 
2.35.1.473.g83b2b277ed-goog


