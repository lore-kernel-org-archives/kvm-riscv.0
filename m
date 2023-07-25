From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 20:54:24 +0530
Subject: [kvmtool PATCH 0/6] RISC-V AIA irqchip and Svnapot support
Message-ID: <20230725152430.3351564-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest KVM in Linux-6.5 has support for:
1) Svnapot ISA extension support
2) AIA in-kernel irqchip support

This series adds corresponding changes in KVMTOOL to use the above
mentioned features for Guest/VM.

These patches can also be found in the riscv_aia_v1 branch at:
https://github.com/avpatel/kvmtool.git

Anup Patel (6):
  Sync-up header with Linux-6.5-rc3 for KVM RISC-V
  riscv: Add Svnapot extension support
  riscv: Make irqchip support pluggable
  riscv: Add IRQFD support for in-kernel AIA irqchip
  riscv: Use AIA in-kernel irqchip whenever KVM RISC-V supports
  riscv: Fix guest/init linkage for multilib toolchain

 Makefile                            |   3 +
 include/linux/kvm.h                 |   6 +-
 riscv/aia.c                         | 227 ++++++++++++++++++++++++++++
 riscv/fdt.c                         |  15 +-
 riscv/include/asm/kvm.h             |  81 ++++++++++
 riscv/include/kvm/fdt-arch.h        |   8 +-
 riscv/include/kvm/kvm-arch.h        |  38 ++++-
 riscv/include/kvm/kvm-config-arch.h |   3 +
 riscv/irq.c                         | 138 ++++++++++++++++-
 riscv/kvm.c                         |   2 +
 riscv/pci.c                         |  32 ++--
 riscv/plic.c                        |  61 ++++----
 12 files changed, 563 insertions(+), 51 deletions(-)
 create mode 100644 riscv/aia.c

-- 
2.34.1


