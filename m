From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Mar 2022 22:32:25 +0530
Subject: [GIT PULL] KVM/riscv changes for 5.18
Message-ID: <CAAhSdy1cBkGqBLN7iZY-FUx2BFGoXmxd4WZJemPSRKz6my8cZQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have three KVM RISC-V changes for 5.18 which are:
1) Prevent KVM_COMPAT from being selected
2) Refine __kvm_riscv_switch_to() implementation
3) RISC-V SBI v0.3 support

I don't expect any other KVM RISC-V changes for 5.18.

Please pull.

Regards,
Anup

The following changes since commit 4a204f7895878363ca8211f50ec610408c8c70aa:

  KVM: SVM: Allow AVIC support on system w/ physical APIC ID > 255
(2022-03-08 10:59:12 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.18-1

for you to fetch changes up to 763c8bed8c05ffcce8cba882e69cd6b03df07019:

  RISC-V: KVM: Implement SBI HSM suspend call (2022-03-11 19:02:39 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.18

- Prevent KVM_COMPAT from being selected
- Refine __kvm_riscv_switch_to() implementation
- RISC-V SBI v0.3 support

----------------------------------------------------------------
Anup Patel (6):
      RISC-V: KVM: Upgrade SBI spec version to v0.3
      RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
      RISC-V: KVM: Implement SBI v0.3 SRST extension
      RISC-V: Add SBI HSM suspend related defines
      RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
      RISC-V: KVM: Implement SBI HSM suspend call

Guo Ren (1):
      KVM: compat: riscv: Prevent KVM_COMPAT from being selected

Vincent Chen (1):
      RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation

Yang Li (1):
      RISC-V: KVM: remove unneeded semicolon

 arch/riscv/include/asm/kvm_host.h     |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
 arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
 arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
 arch/riscv/kvm/vcpu_exit.c            | 22 +++++++++----
 arch/riscv/kvm/vcpu_sbi.c             | 19 +++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c         | 20 ++----------
 arch/riscv/kvm/vcpu_switch.S          | 60 ++++++++++++++++++++---------------
 virt/kvm/Kconfig                      |  2 +-
 11 files changed, 161 insertions(+), 59 deletions(-)

