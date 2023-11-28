From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:18 +0530
Subject: [kvmtool PATCH 00/10] SBI debug console and few ISA extensions
Message-ID: <20231128145628.413414-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for:
1) ISA extensions: Zba, Zbs, Zicntr, Zihpm, Zicsr, Zifencei, Zicond,
   and Smstateen
2) SBI debug console (DBCN) extension

These patches can also be found in the riscv_zbx_zicntr_smstateen_condops_v1
branch at: https://github.com/avpatel/kvmtool.git

Anup Patel (10):
  Sync-up header with Linux-6.7-rc3 for KVM RISC-V
  riscv: Improve warning in generate_cpu_nodes()
  riscv: Make CPU_ISA_MAX_LEN depend upon isa_info_arr array size
  riscv: Add Zba and Zbs extension support
  riscv: Add Zicntr and Zihpm extension support
  riscv: Add Zicsr and Zifencei extension support
  riscv: Add Smstateen extension support
  riscv: Add Zicond extension support
  riscv: Set mmu-type DT property based on satp_mode ONE_REG interface
  riscv: Handle SBI DBCN calls from Guest/VM

 arm/aarch64/include/asm/kvm.h       | 32 ++++++++++++++++
 include/linux/kvm.h                 | 11 ++++++
 include/linux/virtio_config.h       |  5 +++
 include/linux/virtio_pci.h          | 11 ++++++
 riscv/fdt.c                         | 57 ++++++++++++++++++++++++-----
 riscv/include/asm/kvm.h             | 12 ++++++
 riscv/include/kvm/kvm-config-arch.h | 29 ++++++++++++++-
 riscv/include/kvm/sbi.h             | 14 ++++++-
 riscv/kvm-cpu.c                     | 57 +++++++++++++++++++++++++++++
 9 files changed, 216 insertions(+), 12 deletions(-)

-- 
2.34.1


