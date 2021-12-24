From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 24 Dec 2021 13:06:00 +0530
Subject: [PATCH v4 0/4] KVM RISC-V 64-bit selftests support
Message-ID: <20211224073604.1085464-1-anup.patel@wdc.com>
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

These patches can be found in riscv_kvm_selftests_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased series on Linux-5.16-rc6
 - Renamed kvm_riscv_stage2_gpa_size() to kvm_riscv_stage2_gpa_bits()
   in PATCH2

Changes since v1:
 - Renamed kvm_sbi_ext_expevend_handler() to kvm_sbi_ext_forward_handler()
   in PATCH1
 - Renamed KVM_CAP_RISCV_VM_GPA_SIZE to KVM_CAP_VM_GPA_BITS in PATCH2
   and PATCH4

Anup Patel (4):
  RISC-V: KVM: Forward SBI experimental and vendor extensions
  RISC-V: KVM: Add VM capability to allow userspace get GPA bits
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


