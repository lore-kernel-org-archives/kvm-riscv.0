From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 Dec 2023 11:03:41 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #1
Message-ID: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.8:
1) KVM_GET_REG_LIST improvement for vector registers
2) Generate ISA extension reg_list using macros in get-reg-list selftest
3) Steal time account support along with selftest

Please pull.

Please note that I will be sending another PR for 6.8 which will
include two more changes:
1) KVM RISC-V report more ISA extensions through ONE_REG
2) RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest

Two separate PRs are because #1 (above) depends on a series
merged by Palmer for 6.8 and #2 (above) requires little more testing.
I hope you are okay with two separate PRs for 6.8.

Regards,
Anup

The following changes since commit 861deac3b092f37b2c5e6871732f3e11486f7082:

  Linux 6.7-rc7 (2023-12-23 16:25:56 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.8-1

for you to fetch changes up to aad86da229bc9d0390dc2c02eb0db9ab1f50d059:

  RISC-V: KVM: selftests: Add get-reg-list test for STA registers
(2023-12-30 11:26:47 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.8 part #1

- KVM_GET_REG_LIST improvement for vector registers
- Generate ISA extension reg_list using macros in get-reg-list selftest
- Steal time account support along with selftest

----------------------------------------------------------------
Andrew Jones (19):
      RISC-V: KVM: Don't add SBI multi regs in get-reg-list
      KVM: riscv: selftests: Drop SBI multi registers
      RISC-V: KVM: Make SBI uapi consistent with ISA uapi
      KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
      KVM: riscv: selftests: Use register subtypes
      RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs
      RISC-V: paravirt: Add skeleton for pv-time support
      RISC-V: Add SBI STA extension definitions
      RISC-V: paravirt: Implement steal-time support
      RISC-V: KVM: Add SBI STA extension skeleton
      RISC-V: KVM: Add steal-update vcpu request
      RISC-V: KVM: Add SBI STA info to vcpu_arch
      RISC-V: KVM: Add support for SBI extension registers
      RISC-V: KVM: Add support for SBI STA registers
      RISC-V: KVM: Implement SBI STA extension
      RISC-V: KVM: selftests: Move sbi_ecall to processor.c
      RISC-V: KVM: selftests: Add guest_sbi_probe_extension
      RISC-V: KVM: selftests: Add steal_time test support
      RISC-V: KVM: selftests: Add get-reg-list test for STA registers

Anup Patel (2):
      KVM: riscv: selftests: Generate ISA extension reg_list using macros
      RISC-V: KVM: Fix indentation in kvm_riscv_vcpu_set_reg_csr()

Chao Du (1):
      RISC-V: KVM: remove a redundant condition in kvm_arch_vcpu_ioctl_run()

Cl?ment L?ger (2):
      riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
      riscv: kvm: use ".L" local labels in assembly when applicable

Daniel Henrique Barboza (3):
      RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
      RISC-V: KVM: add 'vlenb' Vector CSR
      RISC-V: KVM: add vector registers and CSRs in KVM_GET_REG_LIST

 Documentation/admin-guide/kernel-parameters.txt    |   6 +-
 arch/riscv/Kconfig                                 |  19 +
 arch/riscv/include/asm/kvm_host.h                  |  10 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |  20 +-
 arch/riscv/include/asm/paravirt.h                  |  28 +
 arch/riscv/include/asm/paravirt_api_clock.h        |   1 +
 arch/riscv/include/asm/sbi.h                       |  17 +
 arch/riscv/include/uapi/asm/kvm.h                  |  13 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/paravirt.c                       | 135 +++++
 arch/riscv/kernel/time.c                           |   3 +
 arch/riscv/kvm/Kconfig                             |   1 +
 arch/riscv/kvm/Makefile                            |   1 +
 arch/riscv/kvm/vcpu.c                              |  10 +-
 arch/riscv/kvm/vcpu_onereg.c                       | 135 +++--
 arch/riscv/kvm/vcpu_sbi.c                          | 142 +++--
 arch/riscv/kvm/vcpu_sbi_replace.c                  |   2 +-
 arch/riscv/kvm/vcpu_sbi_sta.c                      | 208 ++++++++
 arch/riscv/kvm/vcpu_switch.S                       |  32 +-
 arch/riscv/kvm/vcpu_vector.c                       |  16 +
 tools/testing/selftests/kvm/Makefile               |   5 +-
 .../testing/selftests/kvm/include/kvm_util_base.h  |   1 +
 .../selftests/kvm/include/riscv/processor.h        |  62 ++-
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  49 +-
 tools/testing/selftests/kvm/lib/riscv/ucall.c      |  26 -
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 588 ++++++++++-----------
 tools/testing/selftests/kvm/steal_time.c           |  99 ++++
 27 files changed, 1184 insertions(+), 446 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

