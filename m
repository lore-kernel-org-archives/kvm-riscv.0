From: Chao Du <duchao@eswincomputing.com>
Date: Thu, 21 Dec 2023 09:49:59 +0000
Subject: [RFC PATCH 0/3] RISC-V: KVM: Guest Debug Support
Message-ID: <20231221095002.7404-1-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements KVM Guest Debug on RISC-V. Currently, we can
debug RISC-V KVM guest from the host side, with software breakpoints.

A brief test was done on QEMU RISC-V hypervisor emulator.

A TODO list which will be added later:
1. HW breakpoints support
2. Test cases

This series is based on Linux 6.7-rc6 and is also available at:
https://github.com/Du-Chao/linux/tree/riscv_gd_sw

The matched QEMU is available at:
https://github.com/Du-Chao/qemu/tree/riscv_gd_sw

Chao Du (3):
  RISC-V: KVM: Enable the KVM_CAP_SET_GUEST_DEBUG capability
  RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
  RISC-V: KVM: Handle breakpoint exits for VCPU

 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 15 +++++++++++++--
 arch/riscv/kvm/vcpu_exit.c        |  4 ++++
 arch/riscv/kvm/vm.c               |  1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

--
2.17.1


