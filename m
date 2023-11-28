From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:23:42 +0530
Subject: [PATCH 00/15] KVM RISC-V report more ISA extensions through ONE_REG
Message-ID: <20231128145357.413321-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This extends the KVM RISC-V ONE_REG interface to report more ISA extensions
namely: Zbz, scalar crypto, vector crypto, Zfh[min], Zihintntl, Zvfh[min],
and Zfa.

This series depends upon the "riscv: report more ISA extensions through
hwprobe" series.from Clement.
(Link: https://lore.kernel.org/lkml/20231114141256.126749-1-cleger at rivosinc.com/)

To test these patches, use KVMTOOL from the riscv_more_exts_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_more_exts_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (15):
  KVM: riscv: selftests: Generate ISA extension reg_list using macros
  RISC-V: KVM: Allow Zbc extension for Guest/VM
  KVM: riscv: selftests: Add Zbc extension to get-reg-list test
  RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
  KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list
    test
  RISC-V: KVM: Allow vector crypto extensions for Guest/VM
  KVM: riscv: selftests: Add vector crypto extensions to get-reg-list
    test
  RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
  KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
  RISC-V: KVM: Allow Zihintntl extension for Guest/VM
  KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
  RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
  KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
  RISC-V: KVM: Allow Zfa extension for Guest/VM
  KVM: riscv: selftests: Add Zfa extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h             |  27 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  54 +++
 .../selftests/kvm/riscv/get-reg-list.c        | 439 ++++++++----------
 3 files changed, 265 insertions(+), 255 deletions(-)

-- 
2.34.1


