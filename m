From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 26 Nov 2021 21:10:16 +0530
Subject: [PATCH 0/4] KVM RISC-V 64-bit selftests support
Message-ID: <20211126154020.342924-1-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds initial support for testing KVM RISC-V 64-bit using
kernel selftests framework. The PATCH1 & PATCH2 of this series does
some ground work in KVM RISC-V to implement RISC-V support in the KVM
selftests whereas remaining patches does required changes in the KVM
selftests.

These patches can be found in riscv_kvm_selftests_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: KVM: Forward SBI experimental and vendor extensions
  RISC-V: KVM: Add VM capability to allow userspace get GPA size
  KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
  KVM: selftests: Add initial support for RISC-V 64-bit

 arch/riscv/include/asm/kvm_host.h             |   1 +
 arch/riscv/kvm/mmu.c                          |   5 +
 arch/riscv/kvm/vcpu_sbi.c                     |   4 +
 arch/riscv/kvm/vcpu_sbi_base.c                |  27 ++
 arch/riscv/kvm/vm.c                           |   3 +
 include/uapi/linux/kvm.h                      |   1 +
 tools/testing/selftests/kvm/Makefile          |  14 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  10 +
 .../selftests/kvm/include/riscv/processor.h   | 135 +++++++
 tools/testing/selftests/kvm/lib/guest_modes.c |  10 +
 .../selftests/kvm/lib/riscv/processor.c       | 362 ++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  87 +++++
 12 files changed, 658 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c

-- 
2.25.1


