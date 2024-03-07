From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Mar 2024 12:15:21 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.9
Message-ID: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.9:
1) Exception and interrupt handling for selftests
2) Sstc (aka arch_timer) selftest
3) Forward seed CSR access to KVM user space
4) Ztso extension support for Guest/VM
5) Zacas extension support for Guest/VM

Please pull.

Regards,
Anup

The following changes since commit d206a76d7d2726f3b096037f2079ce0bd3ba329b:

  Linux 6.8-rc6 (2024-02-25 15:46:06 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.9-1

for you to fetch changes up to d8c0831348e78fdaf67aa95070bae2ef8e819b05:

  KVM: riscv: selftests: Add Zacas extension to get-reg-list test
(2024-03-06 20:53:44 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.9

- Exception and interrupt handling for selftests
- Sstc (aka arch_timer) selftest
- Forward seed CSR access to KVM userspace
- Ztso extension support for Guest/VM
- Zacas extension support for Guest/VM

----------------------------------------------------------------
Anup Patel (5):
      RISC-V: KVM: Forward SEED CSR access to user space
      RISC-V: KVM: Allow Ztso extension for Guest/VM
      KVM: riscv: selftests: Add Ztso extension to get-reg-list test
      RISC-V: KVM: Allow Zacas extension for Guest/VM
      KVM: riscv: selftests: Add Zacas extension to get-reg-list test

Haibo Xu (11):
      KVM: arm64: selftests: Data type cleanup for arch_timer test
      KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
      KVM: arm64: selftests: Split arch_timer test code
      KVM: selftests: Add CONFIG_64BIT definition for the build
      tools: riscv: Add header file csr.h
      tools: riscv: Add header file vdso/processor.h
      KVM: riscv: selftests: Switch to use macro from csr.h
      KVM: riscv: selftests: Add exception handling support
      KVM: riscv: selftests: Add guest helper to get vcpu id
      KVM: riscv: selftests: Change vcpu_has_ext to a common function
      KVM: riscv: selftests: Add sstc timer test

Paolo Bonzini (1):
      selftests/kvm: Fix issues with $(SPLIT_TESTS)

 arch/riscv/include/uapi/asm/kvm.h                  |   2 +
 arch/riscv/kvm/vcpu_insn.c                         |  13 +
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 tools/arch/riscv/include/asm/csr.h                 | 541 +++++++++++++++++++++
 tools/arch/riscv/include/asm/vdso/processor.h      |  32 ++
 tools/testing/selftests/kvm/Makefile               |  27 +-
 tools/testing/selftests/kvm/aarch64/arch_timer.c   | 295 +----------
 tools/testing/selftests/kvm/arch_timer.c           | 259 ++++++++++
 .../selftests/kvm/include/aarch64/processor.h      |   4 -
 .../testing/selftests/kvm/include/kvm_util_base.h  |   2 +
 .../selftests/kvm/include/riscv/arch_timer.h       |  71 +++
 .../selftests/kvm/include/riscv/processor.h        |  72 ++-
 tools/testing/selftests/kvm/include/test_util.h    |   2 +
 tools/testing/selftests/kvm/include/timer_test.h   |  45 ++
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 101 ++++
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  87 ++++
 tools/testing/selftests/kvm/riscv/arch_timer.c     | 111 +++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  19 +-
 18 files changed, 1380 insertions(+), 307 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/arch/riscv/include/asm/vdso/processor.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

