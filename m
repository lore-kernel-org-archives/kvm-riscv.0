From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 27 Sep 2021 17:12:19 +0530
Subject: [PATCH v9 0/8] KVMTOOL RISC-V Support
Message-ID: <20210927114227.1089403-1-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds RISC-V support for KVMTOOL and it is based on the
v20 KVM RISC-V series. The KVM RISC-V patches are ready to be merged
in Linux kernel.

The KVMTOOL RISC-V patches can be found in riscv_master branch at:
https//github.com/kvm-riscv/kvmtool.git

The KVM RISC-V patches can be found in riscv_kvm_master branch at:
https//github.com/kvm-riscv/linux.git

Changes since v8:
 - Rebased on recent commit 2e7380db438defbc5aa24652fe10b7bf99822355
 - Sync-up headers with latest KVM RISC-V v20 series which is based
   on Linux-5.15-rc3
 - Fixed PLIC context CLAIM register emulation in PATCH5

Changes since v7:
 - Rebased on recent commit 25c1dc6c4942ff0949c08780fcad6b324fec6bf7
 - Sync-up headers with latest KVM RISC-V v19 series which is based
   on Linux-5.14-rc3

Changes since v6:
 - Rebased on recent commit 117d64953228afa90b52f6e1b4873770643ffdc9
 - Sync-up headers with latest KVM RISC-V v17 series which is based
   on Linux-5.12-rc5

Changes since v5:
 - Sync-up headers with latest KVM RISC-V v16 series which is based
   on Linux-5.11-rc3

Changes since v4:
 - Rebased on recent commit 90b2d3adadf218dfc6bdfdfcefe269843360223c
 - Sync-up headers with latest KVM RISC-V v15 series which is based
   on Linux-5.10-rc3

Changes since v3:
 - Rebased on recent commit 351d931f496aeb2e97b8daa44c943d8b59351d07
 - Improved kvm_cpu__show_registers() implementation

Changes since v2:
 - Support compiling KVMTOOL for both RV32 and RV64 systems using
   a multilib toolchain
 - Fix kvm_cpu__arch_init() for RV32 system

Changes since v1:
 - Use linux/sizes.h in kvm/kvm-arch.h
 - Added comment in kvm/kvm-arch.h about why PCI config space is 256M
 - Remove forward declaration of "struct kvm" from kvm/kvm-cpu-arch.h
 - Fixed placement of DTB and INITRD in guest RAM
 - Use __riscv_xlen instead of sizeof(unsigned long) in __kvm_reg_id()

Anup Patel (8):
  update_headers: Sync-up ABI headers with Linux-5.15-rc2
  riscv: Initial skeletal support
  riscv: Implement Guest/VM arch functions
  riscv: Implement Guest/VM VCPU arch functions
  riscv: Add PLIC device emulation
  riscv: Generate FDT at runtime for Guest/VM
  riscv: Handle SBI calls forwarded to user space
  riscv: Generate PCI host DT node

 INSTALL                             |   7 +-
 Makefile                            |  24 +-
 arm/aarch64/include/asm/kvm.h       |  56 ++-
 include/linux/kvm.h                 | 423 ++++++++++++++++++++-
 powerpc/include/asm/kvm.h           |  10 +
 riscv/fdt.c                         | 195 ++++++++++
 riscv/include/asm/kvm.h             | 128 +++++++
 riscv/include/kvm/barrier.h         |  14 +
 riscv/include/kvm/fdt-arch.h        |   8 +
 riscv/include/kvm/kvm-arch.h        |  87 +++++
 riscv/include/kvm/kvm-config-arch.h |  15 +
 riscv/include/kvm/kvm-cpu-arch.h    |  51 +++
 riscv/include/kvm/sbi.h             |  48 +++
 riscv/ioport.c                      |   7 +
 riscv/irq.c                         |  13 +
 riscv/kvm-cpu.c                     | 490 ++++++++++++++++++++++++
 riscv/kvm.c                         | 174 +++++++++
 riscv/pci.c                         | 109 ++++++
 riscv/plic.c                        | 568 ++++++++++++++++++++++++++++
 util/update_headers.sh              |   2 +-
 x86/include/asm/kvm.h               |  60 ++-
 21 files changed, 2471 insertions(+), 18 deletions(-)
 create mode 100644 riscv/fdt.c
 create mode 100644 riscv/include/asm/kvm.h
 create mode 100644 riscv/include/kvm/barrier.h
 create mode 100644 riscv/include/kvm/fdt-arch.h
 create mode 100644 riscv/include/kvm/kvm-arch.h
 create mode 100644 riscv/include/kvm/kvm-config-arch.h
 create mode 100644 riscv/include/kvm/kvm-cpu-arch.h
 create mode 100644 riscv/include/kvm/sbi.h
 create mode 100644 riscv/ioport.c
 create mode 100644 riscv/irq.c
 create mode 100644 riscv/kvm-cpu.c
 create mode 100644 riscv/kvm.c
 create mode 100644 riscv/pci.c
 create mode 100644 riscv/plic.c

-- 
2.25.1


