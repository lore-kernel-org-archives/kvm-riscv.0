From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 22:04:52 +0530
Subject: [kvmtool PATCH v4 0/9] RISC-V SBI enable/disable, Zbb, Zicboz, and Ssaia support
Message-ID: <20230712163501.1769737-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The latest KVM in Linux-6.4 has support for:
1) Enabling/disabling SBI extensions from KVM user-space
2) Zbb ISA extension support
3) Zicboz ISA extension support
4) Ssaia ISA extension support

This series adds corresponding changes in KVMTOOL to use the above
mentioned features for Guest/VM.

These patches can also be found in the riscv_sbi_zbb_zicboz_ssaia_v4
branch at: https://github.com/avpatel/kvmtool.git

Changes since v3:
 - Add the __DECLARE_FLEX_ARRAY() compiler error fix as a separate
   patch.

Changes since v2:
 - Rebased on commit 0b5e55fc032d1c6394b8ec7fe02d842813c903df
 - Updated PATCH1 to sync-up header with released Linux-6.4

Changes since v1:
 - Rebased on commit b17552ee6c9728c20c9d0bd037ef134277daaa40
 - Fixed compile error for KVMTOOL x86 by adding __DECLARE_FLEX_ARRAY()
   in include/linux/stddef.h

Andrew Jones (1):
  riscv: Add Zicboz extension support

Anup Patel (8):
  kvm tools: Add __DECLARE_FLEX_ARRAY() in include/linux/stddef.h
  Sync-up headers with Linux-6.4
  riscv: Allow setting custom mvendorid, marchid, and mimpid
  riscv: Allow disabling SBI extensions for Guest
  riscv: Sort the ISA extension array alphabetically
  riscv: Add zbb extension support
  riscv: Add Ssaia extension support
  riscv: Fix guest RAM alloc size computation for RV32

 arm/aarch64/include/asm/kvm.h       |  38 ++++++++++
 include/linux/kvm.h                 |  57 +++++++++------
 include/linux/stddef.h              |  16 +++++
 include/linux/virtio_blk.h          | 105 ++++++++++++++++++++++++++++
 include/linux/virtio_config.h       |   6 ++
 include/linux/virtio_net.h          |   5 ++
 riscv/fdt.c                         |  19 ++++-
 riscv/include/asm/kvm.h             |  56 ++++++++++++++-
 riscv/include/kvm/kvm-config-arch.h |  51 +++++++++++++-
 riscv/include/kvm/kvm-cpu-arch.h    |  19 +++--
 riscv/kvm-cpu.c                     |  45 +++++++++++-
 riscv/kvm.c                         |  15 +++-
 x86/include/asm/kvm.h               |  50 ++++++++++---
 13 files changed, 435 insertions(+), 47 deletions(-)

-- 
2.34.1


