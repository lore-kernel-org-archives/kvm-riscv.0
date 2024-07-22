From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 22 Jul 2024 17:37:08 +0530
Subject: [PATCH 0/2] Add RISC-V ISA extensions based on Linux-6.10
Message-ID: <20240722120710.417705-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support for new ISA extensions based on Linux-6.10 namely:
Sscofpmf.

These patches can also be found in the riscv_more_exts_round3_v1 branch
at: https://github.com/avpatel/kvmtool.git

Anup Patel (1):
  Sync-up headers with Linux-6.10 kernel

Atish Patra (1):
  riscv: Add Sscofpmf extensiona support

 include/linux/kvm.h                 |   4 +-
 include/linux/virtio_net.h          | 143 ++++++++++++++++++++++++++++
 riscv/fdt.c                         |   1 +
 riscv/include/asm/kvm.h             |   1 +
 riscv/include/kvm/kvm-config-arch.h |   3 +
 x86/include/asm/kvm.h               |  22 ++++-
 6 files changed, 170 insertions(+), 4 deletions(-)

-- 
2.34.1


