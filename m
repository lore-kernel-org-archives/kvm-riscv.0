From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Wed, 26 Jul 2023 14:13:45 +0530
Subject: [PATCH v4 0/7] Risc-V Kvm Smstateen
Message-ID: <20230726084352.2136377-1-mchitale@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series adds support to detect the Smstateen extension for both, the
host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
interface and the vcpu context save/restore.

The motivation behind Smstateen from the spec
(https://github.com/riscv/riscv-state-enable):
"The implementation of optional RISC-V extensions has the potential to open
covert channels between separate user threads, or between separate guest OSes
running under a hypervisor. The problem occurs when an extension adds processor
state---usually explicit registers, but possibly other forms of state---that
the main OS or hypervisor is unaware of (and hence won?t context-switch) but
that can be modified/written by one user thread or guest OS and perceived/
examined/read by another."

Changes in v4:
- Update commit description for patch 1
- Rebase to kvm_riscv_queue
- Add reviewed-by tag

Changes in v3:
- Move DT bindings change to a separate patch
- Move senvcfg/sstateen0 save/restore to separate function

Changes in v2:
- Add smstaeen description in riscv/extensions.yaml
- Avoid line wrap at 80 chars

Mayuresh Chitale (7):
  RISC-V: Detect Smstateen extension
  dt-bindings: riscv: Add smstateen entry
  RISC-V: KVM: Add kvm_vcpu_config
  RISC-V: KVM: Enable Smstateen accesses
  RISCV: KVM: Add senvcfg context save/restore
  RISCV: KVM: Add sstateen0 context save/restore
  RISCV: KVM: Add sstateen0 to ONE_REG

 .../devicetree/bindings/riscv/extensions.yaml |  6 ++
 arch/riscv/include/asm/csr.h                  | 18 +++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/kvm_host.h             | 18 +++++
 arch/riscv/include/uapi/asm/kvm.h             | 11 +++
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kvm/vcpu.c                         | 70 +++++++++++++++----
 arch/riscv/kvm/vcpu_onereg.c                  | 41 +++++++++++
 9 files changed, 154 insertions(+), 13 deletions(-)

-- 
2.34.1


