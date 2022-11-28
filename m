From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Nov 2022 21:44:15 +0530
Subject: [PATCH 0/9] RISC-V KVM ONE_REG interface for SBI
Message-ID: <20221128161424.608889-1-apatel@ventanamicro.com>
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

These patches can also be found in the riscv_kvm_sbi_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (9):
  RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
  RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
  RISC-V: KVM: Remove redundant includes of asm/csr.h
  RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
  RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
  RISC-V: Export sbi_get_mvendorid() and friends
  RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
  RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_host.h     |  16 ++-
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  14 ++-
 arch/riscv/include/uapi/asm/kvm.h     |  22 ++++
 arch/riscv/kernel/sbi.c               |   3 +
 arch/riscv/kvm/vcpu.c                 |  82 +++++++++++----
 arch/riscv/kvm/vcpu_sbi.c             | 145 +++++++++++++++++++++++---
 arch/riscv/kvm/vcpu_sbi_base.c        |  15 ++-
 arch/riscv/kvm/vcpu_sbi_hsm.c         |   1 -
 arch/riscv/kvm/vcpu_sbi_replace.c     |   1 -
 arch/riscv/kvm/vcpu_sbi_v01.c         |   1 -
 10 files changed, 244 insertions(+), 56 deletions(-)

-- 
2.34.1


