From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  9 Aug 2024 19:04:28 +0530
Subject: [kvmtool PATCH v2 0/3] Add RISC-V ISA extensions based on Linux-6.10
Message-ID: <20240809133431.2465029-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for new ISA extensions based on Linux-6.10 namely:
Sscofpmf.

These patches can also be found in the riscv_more_exts_round3_v2 branch
at: https://github.com/avpatel/kvmtool.git

Changes since v1:
 - Included a fix for DBCN

Andrew Jones (1):
  riscv: Set SBI_SUCCESS on successful DBCN call

Anup Patel (1):
  Sync-up headers with Linux-6.10 kernel

Atish Patra (1):
  riscv: Add Sscofpmf extensiona support

 include/linux/kvm.h                 |   4 +-
 include/linux/virtio_net.h          | 143 ++++++++++++++++++++++++++++
 riscv/fdt.c                         |   1 +
 riscv/include/asm/kvm.h             |   1 +
 riscv/include/kvm/kvm-config-arch.h |   3 +
 riscv/kvm-cpu.c                     |   1 +
 x86/include/asm/kvm.h               |  22 ++++-
 7 files changed, 171 insertions(+), 4 deletions(-)

-- 
2.34.1


