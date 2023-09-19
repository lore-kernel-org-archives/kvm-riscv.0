From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Sep 2023 09:23:36 +0530
Subject: [PATCH 0/7] KVM RISC-V Conditional Operations
Message-ID: <20230919035343.1399389-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series extends KVM RISC-V to allow Guest/VM discover and use
conditional operations related ISA extensions (namely XVentanaCondOps
and Zicond).

To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches are based upon the latest riscv_kvm_queue and can also be
found in the riscv_kvm_condops_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (7):
  RISC-V: Detect XVentanaCondOps from ISA string
  RISC-V: Detect Zicond from ISA string
  RISC-V: KVM: Allow XVentanaCondOps extension for Guest/VM
  RISC-V: KVM: Allow Zicond extension for Guest/VM
  KVM: riscv: selftests: Add senvcfg register to get-reg-list test
  KVM: riscv: selftests: Add smstateen registers to get-reg-list test
  KVM: riscv: selftests: Add condops extensions to get-reg-list test

 .../devicetree/bindings/riscv/extensions.yaml | 13 ++++++
 arch/riscv/include/asm/hwcap.h                |  2 +
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpufeature.c                |  2 +
 arch/riscv/kvm/vcpu_onereg.c                  |  4 ++
 .../selftests/kvm/riscv/get-reg-list.c        | 41 +++++++++++++++++++
 6 files changed, 64 insertions(+)

-- 
2.34.1


