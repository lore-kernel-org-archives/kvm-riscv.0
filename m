From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 16:54:43 +0530
Subject: [PATCH v2 0/7] KVM RISC-V Sv57x4 support and HFENCE improvements
Message-ID: <20220420112450.155624-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds Sv57x4 support for KVM RISC-V G-stage and various
HFENCE related improvements.

These patches can also be found in riscv_kvm_sv57_plus_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased on Linux-5.18-rc3
 - Drop gstage_tlb_pgsize_bitmap and hfence_update_order() from PATCH4
   because software is not required to know to page sizes supported by
   TLB. In fact, it is responsibility of hardware implementation to
   ensure that S/HFENCE on an address X invalidates all TLB entries
   created for PTE covering address X.
 - Added PATCH7 to cleanup stale TLB entries when VCPU is moved another
   host CPU

Anup Patel (7):
  RISC-V: KVM: Use G-stage name for hypervisor page table
  RISC-V: KVM: Add Sv57x4 mode support for G-stage
  RISC-V: KVM: Treat SBI HFENCE calls as NOPs
  RISC-V: KVM: Introduce range based local HFENCE functions
  RISC-V: KVM: Reduce KVM_MAX_VCPUS value
  RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
  RISC-V: KVM: Cleanup stale TLB entries when host CPU changes

 arch/riscv/include/asm/csr.h      |   1 +
 arch/riscv/include/asm/kvm_host.h | 124 ++++++--
 arch/riscv/kvm/main.c             |  11 +-
 arch/riscv/kvm/mmu.c              | 264 +++++++++--------
 arch/riscv/kvm/tlb.S              |  74 -----
 arch/riscv/kvm/tlb.c              | 461 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             |  45 ++-
 arch/riscv/kvm/vcpu_exit.c        |   6 +-
 arch/riscv/kvm/vcpu_sbi_replace.c |  40 ++-
 arch/riscv/kvm/vcpu_sbi_v01.c     |  35 ++-
 arch/riscv/kvm/vm.c               |   8 +-
 arch/riscv/kvm/vmid.c             |  30 +-
 12 files changed, 812 insertions(+), 287 deletions(-)
 delete mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/tlb.c

-- 
2.25.1


