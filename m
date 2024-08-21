From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Aug 2024 19:56:06 +0530
Subject: [kvmtool PATCH v3 0/4] Add RISC-V ISA extensions based on Linux-6.10
Message-ID: <20240821142610.3297483-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for new ISA extensions based on Linux-6.10 namely:
Sscofpmf.

These patches can also be found in the riscv_more_exts_round3_v3 branch
at: https://github.com/avpatel/kvmtool.git

Changes since v2:
 - Include a fix to correct number of hart bits for AIA

Changes since v1:
 - Included a fix for DBCN

Andrew Jones (2):
  riscv: Set SBI_SUCCESS on successful DBCN call
  riscv: Correct number of hart bits

Anup Patel (1):
  Sync-up headers with Linux-6.10 kernel

Atish Patra (1):
  riscv: Add Sscofpmf extensiona support

 include/linux/kvm.h                 |   4 +-
 include/linux/virtio_net.h          | 143 ++++++++++++++++++++++++++++
 riscv/aia.c                         |   2 +-
 riscv/fdt.c                         |   1 +
 riscv/include/asm/kvm.h             |   1 +
 riscv/include/kvm/kvm-config-arch.h |   3 +
 riscv/kvm-cpu.c                     |   1 +
 x86/include/asm/kvm.h               |  22 ++++-
 8 files changed, 172 insertions(+), 5 deletions(-)

-- 
2.34.1


