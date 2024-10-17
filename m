From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 17 Oct 2024 09:45:39 +0200
Subject: [PATCH 0/2] RISC-V: KVM: SBI system suspend support
Message-ID: <20241017074538.18867-4-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI spec provides a specification for system suspend to RAM and Linux
already supports invoking the SBI call for suspend to RAM when
CONFIG_SUSPEND is selected. Implement support for the SBI call in KVM
so guests may initiate a system suspend. However, since what a "system
suspend" means for a VM may differ between VM providers, leave it up
to the VMM to decide what to do. KVM only needs to ensure the entry
criteria for system suspend (per the spec) is met and prepare things for
the resume for when the VMM triggers it.

Tested with this kvmtool branch [1]

[1] https://github.com/jones-drew/kvmtool/commits/riscv/sbi-sys-susp/


Andrew Jones (2):
  RISC-V: KVM: Add SBI system suspend support
  KVM: riscv: selftests: Add SBI SUSP to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  1 +
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     |  4 +
 arch/riscv/kvm/vcpu_sbi_system.c              | 73 +++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  6 +-
 6 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_system.c

-- 
2.46.2


