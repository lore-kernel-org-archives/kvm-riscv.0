From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Jun 2022 10:35:52 +0530
Subject: [PATCH 0/3] Improve instruction and CSR emulation in KVM RISC-V
Message-ID: <20220610050555.288251-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the instruction emulation for MMIO traps and Virtual instruction
traps co-exist with general VCPU exit handling. The instruction and CSR
emulation will grow with upcoming SBI PMU, AIA, and Nested virtualization
in KVM RISC-V. In addition, we also need a mechanism to allow user-space
emulate certain CSRs under certain situation (example, host has AIA support
but user-space does not wants to use in-kernel AIA IMSIC and APLIC support).

This series improves instruction and CSR emulation in KVM RISC-V to make
it extensible based on above.

These patches can also be found in riscv_kvm_csr_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (3):
  RISC-V: KVM: Factor-out instruction emulation into separate sources
  RISC-V: KVM: Add extensible system instruction emulation framework
  RISC-V: KVM: Add extensible CSR emulation framework

 arch/riscv/include/asm/kvm_host.h           |  16 +-
 arch/riscv/include/asm/kvm_vcpu_insn.h      |  48 ++
 arch/riscv/kvm/Makefile                     |   1 +
 arch/riscv/kvm/vcpu.c                       |  11 +
 arch/riscv/kvm/vcpu_exit.c                  | 490 +----------------
 arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} | 560 +++++++++++---------
 include/uapi/linux/kvm.h                    |   8 +
 7 files changed, 382 insertions(+), 752 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
 copy arch/riscv/kvm/{vcpu_exit.c => vcpu_insn.c} (64%)

-- 
2.34.1


