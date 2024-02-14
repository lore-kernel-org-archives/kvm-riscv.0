From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:31 +0530
Subject: [kvmtool PATCH 00/10] More ISA extensions
Message-ID: <20240214122141.305126-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support more ISA extensions namely: Zbc, scalar crypto,
vector crypto, Zfh[min], Zihintntl, Zvfh[min], and Zfa. The series also
adds a command-line option to disable SBI STA extension for Guest/VM.

These patches can also be found in the riscv_more_exts_v1 branch at:
https://github.com/avpatel/kvmtool.git

Anup Patel (10):
  Sync-up header with Linux-6.8-rc4 for KVM RISC-V
  kvmtool: Fix absence of __packed definition
  riscv: Add Zbc extension support
  riscv: Add scalar crypto extensions support
  riscv: Add vector crypto extensions support
  riscv: Add Zfh[min] extensions support
  riscv: Add Zihintntl extension support
  riscv: Add Zvfh[min] extensions support
  riscv: Add Zfa extensiona support
  riscv: Allow disabling SBI STA extension for Guest

 include/kvm/compiler.h              |   2 +
 include/linux/kvm.h                 | 140 ++++++++++------------------
 include/linux/virtio_config.h       |   8 +-
 include/linux/virtio_pci.h          |  68 ++++++++++++++
 riscv/fdt.c                         |  27 ++++++
 riscv/include/asm/kvm.h             |  40 ++++++++
 riscv/include/kvm/csr.h             |  15 +++
 riscv/include/kvm/kvm-config-arch.h |  86 ++++++++++++++++-
 riscv/kvm-cpu.c                     |  31 ++++++
 x86/include/asm/kvm.h               |   3 +
 10 files changed, 328 insertions(+), 92 deletions(-)
 create mode 100644 riscv/include/kvm/csr.h

-- 
2.34.1


