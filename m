From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Oct 2021 13:25:07 +0530
Subject: [GIT PULL] KVM/riscv for 5.16
Message-ID: <CAAhSdy37xNOs3udMe4GuLJ3=huKD1bsHEO_RfUPvuMiVw56GCQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

As discussed on the KVM RISC-V v20 series thread, here's the first
KVM/riscv pull request for 5.16. This pull request has all patches of
the KVM RISC-V v20 series except PATCH1 which is available in the
shared tag "for-riscv" of the KVM tree.

Please pull.

Best Regards,
Anup

The following changes since commit 3f2401f47d29d669e2cb137709d10dd4c156a02f:

  RISC-V: Add hypervisor extension related CSR defines (2021-10-04
04:54:55 -0400)

are available in the Git repository at:

  git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-1

for you to fetch changes up to 24b699d12c34cfc907de9fe3989a122b7b13391c:

  RISC-V: KVM: Add MAINTAINERS entry (2021-10-04 16:14:10 +0530)

----------------------------------------------------------------
Initial KVM RISC-V support

Following features are supported by the initial KVM RISC-V support:
1. No RISC-V specific KVM IOCTL
2. Loadable KVM RISC-V module
3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
4. Works on both RV64 and RV32 host
5. Full Guest/VM switch via vcpu_get/vcpu_put infrastructure
6. KVM ONE_REG interface for VCPU register access from KVM user-space
7. Interrupt controller emulation in KVM user-space
8. Timer and IPI emuation in kernel
9. Both Sv39x4 and Sv48x4 supported for RV64 host
10. MMU notifiers supported
11. Generic dirty log supported
12. FP lazy save/restore supported
13. SBI v0.1 emulation for Guest/VM
14. Forward unhandled SBI calls to KVM user-space
15. Hugepage support for Guest/VM
16. IOEVENTFD support for Vhost

----------------------------------------------------------------
Anup Patel (12):
      RISC-V: Add initial skeletal KVM support
      RISC-V: KVM: Implement VCPU create, init and destroy functions
      RISC-V: KVM: Implement VCPU interrupts and requests handling
      RISC-V: KVM: Implement KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
      RISC-V: KVM: Implement VCPU world-switch
      RISC-V: KVM: Handle MMIO exits for VCPU
      RISC-V: KVM: Handle WFI exits for VCPU
      RISC-V: KVM: Implement VMID allocator
      RISC-V: KVM: Implement stage2 page table programming
      RISC-V: KVM: Implement MMU notifiers
      RISC-V: KVM: Document RISC-V specific parts of KVM API
      RISC-V: KVM: Add MAINTAINERS entry

Atish Patra (4):
      RISC-V: KVM: Add timer functionality
      RISC-V: KVM: FP lazy save/restore
      RISC-V: KVM: Implement ONE REG interface for FP registers
      RISC-V: KVM: Add SBI v0.1 support

 Documentation/virt/kvm/api.rst          | 193 ++++++++++++++++++++++++++--
 MAINTAINERS                             |  12 ++
 arch/riscv/Kconfig                      |   1 +
 arch/riscv/Makefile                     |   1 +
 arch/riscv/include/asm/kvm_host.h       | 266
++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kvm_types.h      |   7 +
 arch/riscv/include/asm/kvm_vcpu_timer.h |  44 +++++++
 arch/riscv/include/uapi/asm/kvm.h       | 128 ++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c         | 156 ++++++++++++++++++++++
 arch/riscv/kvm/Kconfig                  |  36 ++++++
 arch/riscv/kvm/Makefile                 |  25 ++++
 arch/riscv/kvm/main.c                   | 118 +++++++++++++++++
 arch/riscv/kvm/mmu.c                    | 802
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/tlb.S                    |  74 +++++++++++
 arch/riscv/kvm/vcpu.c                   | 997
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c              | 701
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c               | 185 ++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_switch.S            | 400
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 225 ++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c                     |  97 ++++++++++++++
 arch/riscv/kvm/vmid.c                   | 120 +++++++++++++++++
 drivers/clocksource/timer-riscv.c       |   9 ++
 include/clocksource/timer-riscv.h       |  16 +++
 include/uapi/linux/kvm.h                |   8 ++
 24 files changed, 4612 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_host.h
 create mode 100644 arch/riscv/include/asm/kvm_types.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_timer.h
 create mode 100644 arch/riscv/include/uapi/asm/kvm.h
 create mode 100644 arch/riscv/kvm/Kconfig
 create mode 100644 arch/riscv/kvm/Makefile
 create mode 100644 arch/riscv/kvm/main.c
 create mode 100644 arch/riscv/kvm/mmu.c
 create mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/vcpu.c
 create mode 100644 arch/riscv/kvm/vcpu_exit.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi.c
 create mode 100644 arch/riscv/kvm/vcpu_switch.S
 create mode 100644 arch/riscv/kvm/vcpu_timer.c
 create mode 100644 arch/riscv/kvm/vm.c
 create mode 100644 arch/riscv/kvm/vmid.c
 create mode 100644 include/clocksource/timer-riscv.h

