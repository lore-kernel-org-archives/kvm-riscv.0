From: Chao Du <duchao@eswincomputing.com>
Date: Tue,  6 Feb 2024 07:49:28 +0000
Subject: [PATCH v1 0/3] RISC-V: KVM: Guest Debug Support - Software Breakpoint Part
Message-ID: <20240206074931.22930-1-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements the ?KVM Guset Debug? feature on RISC-V. This is
an existing feature which is already supported by some other arches.
It allows us to debug a RISC-V KVM guest from GDB in host side.

As the first stage, the software breakpoints (ebreak instruction) is
implemented. HW breakpoints support will come later after a synthetically
consideration with the SBI debug trigger extension.

A selftest case was added in this series. Manual test was done on QEMU
RISC-V hypervisor emulator. (add '-s' to enable the gdbserver in QEMU)

This series is based on Linux 6.8-rc2 and also available at:
https://github.com/Du-Chao/kvm-riscv/tree/guest_debug_sw

The matched QEMU is available at:
https://github.com/Du-Chao/qemu/tree/riscv_gd_sw

Changes from RFC->v1:
- Rebased on Linux 6.8-rc2.
- Merge PATCH1 and PATCH2 into one patch. (If Paolo's change
  https://lore.kernel.org/kvm/20240131233056.10845-8-pbonzini at redhat.com/
  is adopted, then we can keep 'arch/riscv/include/uapi/asm/kvm.h'
  untouched)
- kselftest case added.

RFC link:
https://lore.kernel.org/kvm/20231221095002.7404-1-duchao at eswincomputing.com

Chao Du (3):
  RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
  RISC-V: KVM: Handle breakpoint exits for VCPU
  RISC-V: KVM: selftests: Add breakpoints test support

 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/vcpu.c                         | 15 +++++-
 arch/riscv/kvm/vcpu_exit.c                    |  4 ++
 arch/riscv/kvm/vm.c                           |  1 +
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../testing/selftests/kvm/riscv/breakpoints.c | 49 +++++++++++++++++++
 6 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/breakpoints.c

--
2.17.1


