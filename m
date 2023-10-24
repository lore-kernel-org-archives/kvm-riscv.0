From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Oct 2023 13:25:10 +0530
Subject: KVM/riscv changes for 6.7
Message-ID: <CAAhSdy2p0h8i=GPBx+=ZJVr_PSwOHhTqanJQmOc0O0bw1ffrmw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.7:
1) Smstateen and Zicond support for Guest/VM
2) Virtualized senvcfg CSR for Guest/VM
3) Added Smstateen registers to the get-reg-list selftests
4) Added Zicond to the get-reg-list selftests
5) Virtualized SBI debug console (DBCN) for Guest/VM
6) Added SBI debug console (DBCN) to the get-reg-list selftests

Please pull.

Please note that the following four patches are part of the
shared tag kvm-riscv-shared-tag-6.7 provided to Palmer:
 - dt-bindings: riscv: Add Zicond extension entry
 - RISC-V: Detect Zicond from ISA string
 - dt-bindings: riscv: Add smstateen entry
 - RISC-V: Detect Smstateen extension

Regards,
Anup

The following changes since commit 94f6f0550c625fab1f373bb86a6669b45e9748b3:

  Linux 6.6-rc5 (2023-10-08 13:49:43 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.7-1

for you to fetch changes up to d9c00f44e5de542340cce1d09e2c990e16c0ed3a:

  KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
(2023-10-20 16:50:39 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.7

- Smstateen and Zicond support for Guest/VM
- Virtualized senvcfg CSR for Guest/VM
- Added Smstateen registers to the get-reg-list selftests
- Added Zicond to the get-reg-list selftests
- Virtualized SBI debug console (DBCN) for Guest/VM
- Added SBI debug console (DBCN) to the get-reg-list selftests

----------------------------------------------------------------
Andrew Jones (3):
      MAINTAINERS: RISC-V: KVM: Add another kselftests path
      KVM: selftests: Add array order helpers to riscv get-reg-list
      KVM: riscv: selftests: get-reg-list print_reg should never fail

Anup Patel (11):
      RISC-V: Detect Zicond from ISA string
      dt-bindings: riscv: Add Zicond extension entry
      RISC-V: KVM: Allow Zicond extension for Guest/VM
      KVM: riscv: selftests: Add senvcfg register to get-reg-list test
      KVM: riscv: selftests: Add smstateen registers to get-reg-list test
      KVM: riscv: selftests: Add condops extensions to get-reg-list test
      RISC-V: Add defines for SBI debug console extension
      RISC-V: KVM: Change the SBI specification version to v2.0
      RISC-V: KVM: Allow some SBI extensions to be disabled by default
      RISC-V: KVM: Forward SBI DBCN extension to user-space
      KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test

Mayuresh Chitale (7):
      RISC-V: Detect Smstateen extension
      dt-bindings: riscv: Add smstateen entry
      RISC-V: KVM: Add kvm_vcpu_config
      RISC-V: KVM: Enable Smstateen accesses
      RISCV: KVM: Add senvcfg context save/restore
      RISCV: KVM: Add sstateen0 context save/restore
      RISCV: KVM: Add sstateen0 to ONE_REG

 .../devicetree/bindings/riscv/extensions.yaml      |  12 ++
 MAINTAINERS                                        |   1 +
 arch/riscv/include/asm/csr.h                       |  18 ++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/kvm_host.h                  |  18 ++
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |   7 +-
 arch/riscv/include/asm/sbi.h                       |   7 +
 arch/riscv/include/uapi/asm/kvm.h                  |  12 ++
 arch/riscv/kernel/cpufeature.c                     |   2 +
 arch/riscv/kvm/vcpu.c                              |  76 +++++--
 arch/riscv/kvm/vcpu_onereg.c                       |  72 ++++++-
 arch/riscv/kvm/vcpu_sbi.c                          |  61 +++---
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  32 +++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 233 +++++++++++++--------
 14 files changed, 418 insertions(+), 135 deletions(-)

