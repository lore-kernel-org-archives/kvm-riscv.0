From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  5 Oct 2024 13:30:16 +0530
Subject: [kvmtool PATCH v2 0/8] Add RISC-V ISA extensions based on Linux-6.11
Message-ID: <20241005080024.11927-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for new ISA extensions based on Linux-6.11
namely: Zawrs, Zca, Zcb, Zcd, Zcf, Zcmop, and Zimop.

These patches can also be found in the riscv_more_exts_round4_v2 branch
at: https://github.com/avpatel/kvmtool.git

Changes since v1:
- Updated PATCH1 to sync-up header with released Linux-6.11 kernel

Anup Patel (8):
  Sync-up headers with Linux-6.11 kernel
  riscv: Add Zawrs extension support
  riscv: Add Zca extension support
  riscv: Add Zcb extension support
  riscv: Add Zcd extension support
  riscv: Add Zcf extension support
  riscv: Add Zcmop extension support
  riscv: Add Zimop extension support

 include/linux/kvm.h                 | 27 +++++++++++++++-
 powerpc/include/asm/kvm.h           |  3 ++
 riscv/fdt.c                         |  7 +++++
 riscv/include/asm/kvm.h             |  7 +++++
 riscv/include/kvm/kvm-config-arch.h | 21 +++++++++++++
 x86/include/asm/kvm.h               | 49 +++++++++++++++++++++++++++++
 6 files changed, 113 insertions(+), 1 deletion(-)

-- 
2.43.0


