From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Mar 2023 11:01:34 +0530
Subject: [PATCH v2 0/1] RISC-V KVM ONE_REG interface for SBI
Message-ID: <20230330053135.1686577-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series does first does few cleanups/fixes (PATCH1 to PATCH5) and
adds ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Dropped patches 1 to 8 since these are already merged.
 - Rebased on Linux-6.3-rc4

Anup Patel (1):
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  20 ++++
 arch/riscv/kvm/vcpu.c                 |   2 +
 arch/riscv/kvm/vcpu_sbi.c             | 150 +++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 163 insertions(+), 19 deletions(-)

-- 
2.34.1


