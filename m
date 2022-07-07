From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  7 Jul 2022 20:22:43 +0530
Subject: [PATCH 0/5] KVM RISC-V Svpbmt support
Message-ID: <20220707145248.458771-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends KVM RISC-V to detect and use Svpbmt for both
G-stage (hypervisor) and VS-stage (guest) page table.

The corresponding KVMTOOL patches used for testing this series
can be found in riscv_svpbmt_sstc_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in riscv_kvm_svpbmt_v1 branch at:
https://github.com/avpatel/linux.git

Alexandre Ghiti (1):
  riscv: Fix missing PAGE_PFN_MASK

Anup Patel (4):
  KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
  RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
  RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
  RISC-V: KVM: Add support for Svpbmt inside Guest/VM

 arch/riscv/include/asm/csr.h        | 16 ++++++++++++++++
 arch/riscv/include/asm/kvm_host.h   |  5 +++++
 arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
 arch/riscv/include/asm/pgtable.h    |  6 +++---
 arch/riscv/include/uapi/asm/kvm.h   |  1 +
 arch/riscv/kvm/mmu.c                | 22 ++++++++++++++++------
 arch/riscv/kvm/vcpu.c               | 16 ++++++++++++++++
 include/linux/kvm_types.h           |  1 +
 virt/kvm/kvm_main.c                 |  4 +++-
 9 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.34.1


