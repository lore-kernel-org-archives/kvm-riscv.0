From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 19 Jul 2023 21:33:10 +0530
Subject: [PATCH v1 0/6] Risc-V Kvm Smstateen
Message-ID: <20230719160316.4048022-1-mchitale@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support to detect the Smstateen extension for both, the
host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
interface and the vcpu context save/restore.

Mayuresh Chitale (6):
  RISC-V: Detect Smstateen extension
  RISC-V: KVM: Add kvm_vcpu_config
  RISC-V: KVM: Enable Smstateen accesses
  RISCV: KVM: Add senvcfg context save/restore
  RISCV: KVM: Add sstateen0 context save/restore
  RISCV: KVM: Add sstateen0 to ONE_REG

 arch/riscv/include/asm/csr.h      | 18 ++++++
 arch/riscv/include/asm/hwcap.h    |  1 +
 arch/riscv/include/asm/kvm_host.h | 18 ++++++
 arch/riscv/include/uapi/asm/kvm.h | 11 ++++
 arch/riscv/kernel/cpu.c           |  1 +
 arch/riscv/kernel/cpufeature.c    |  2 +
 arch/riscv/kvm/vcpu.c             | 97 ++++++++++++++++++++++++++-----
 7 files changed, 135 insertions(+), 13 deletions(-)

-- 
2.34.1


