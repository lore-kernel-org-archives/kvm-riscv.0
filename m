From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 27 Jul 2023 15:20:04 +0800
Subject: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
Message-ID: <cover.1690364259.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sstc_timer selftest is used to validate Sstc timer functionality
in a guest, which sets up periodic timer interrupts and check the
basic interrupt status upon its receipt.

This KVM selftest was ported from aarch64 arch_timer and tested
with Linux v6.5-rc3 on a Qemu riscv64 virt machine.

Haibo Xu (4):
  tools: riscv: Add header file csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Add sstc_timer test

 tools/arch/riscv/include/asm/csr.h            | 127 ++++++
 tools/testing/selftests/kvm/Makefile          |   2 +
 .../selftests/kvm/include/riscv/processor.h   |  76 ++++
 .../selftests/kvm/include/riscv/sstc_timer.h  |  70 ++++
 .../selftests/kvm/lib/riscv/handlers.S        | 101 +++++
 .../selftests/kvm/lib/riscv/processor.c       |  74 ++++
 .../testing/selftests/kvm/riscv/sstc_timer.c  | 382 ++++++++++++++++++
 7 files changed, 832 insertions(+)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/sstc_timer.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/sstc_timer.c

-- 
2.34.1


