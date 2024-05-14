From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 14 May 2024 11:19:25 +0530
Subject: [kvmtool PATCH 0/3] Add RISC-V ISA extensions based on Linux-6.9
Message-ID: <20240514054928.854419-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for new ISA extensions based on Linux-6.9 namely:
Ztso and Zacas.

These patches can also be found in the riscv_more_exts_round2_v1 branch
at: https://github.com/avpatel/kvmtool.git

Anup Patel (3):
  Sync-up headers with Linux-6.9 kernel
  riscv: Add Ztso extensiona support
  riscv: Add Zacas extensiona support

 arm/aarch64/include/asm/kvm.h         |  15 +-
 arm/aarch64/include/asm/sve_context.h |  11 +
 include/linux/kvm.h                   | 689 +-------------------------
 include/linux/virtio_pci.h            |  10 +-
 mips/include/asm/kvm.h                |   2 -
 powerpc/include/asm/kvm.h             |  45 +-
 riscv/fdt.c                           |   2 +
 riscv/include/asm/kvm.h               |   3 +-
 riscv/include/kvm/kvm-config-arch.h   |   6 +
 x86/include/asm/kvm.h                 | 308 +++++++++++-
 10 files changed, 384 insertions(+), 707 deletions(-)

-- 
2.34.1


