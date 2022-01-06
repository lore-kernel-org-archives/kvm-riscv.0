From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Jan 2022 18:51:01 +0530
Subject: [GIT PULL] KVM/riscv changes for 5.17, take #1
Message-ID: <CAAhSdy2iRgCBt=6t2p5AE_Rq18s2QcRoM62ZAGiAcn5A6TfB4w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Palao,

This is the first set of changes for 5.17. We have two new
features for KVM RISC-V:
1) SBI v0.2 support and
2) Initial kvm selftest support.

Please pull.

Regards,
Anup

The following changes since commit 5e4e84f1124aa02643833b7ea40abd5a8e964388:

  Merge tag 'kvm-s390-next-5.17-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
(2021-12-21 12:59:53 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.17-1

for you to fetch changes up to 497685f2c743f552ec5626d60fc12e7c00faaf06:

  MAINTAINERS: Update Anup's email address (2022-01-06 15:18:22 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.17, take #1

- Use common KVM implementation of MMU memory caches
- SBI v0.2 support for Guest
- Initial KVM selftests support
- Fix to avoid spurious virtual interrupts after clearing hideleg CSR
- Update email address for Anup and Atish

----------------------------------------------------------------
Anup Patel (5):
      RISC-V: KVM: Forward SBI experimental and vendor extensions
      RISC-V: KVM: Add VM capability to allow userspace get GPA bits
      KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
      KVM: selftests: Add initial support for RISC-V 64-bit
      MAINTAINERS: Update Anup's email address

Atish Patra (6):
      RISC-V: KVM: Mark the existing SBI implementation as v0.1
      RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file
      RISC-V: KVM: Add SBI v0.2 base extension
      RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2
      RISC-V: KVM: Add SBI HSM extension in KVM
      MAINTAINERS: Update Atish's email address

Jisheng Zhang (1):
      RISC-V: KVM: make kvm_riscv_vcpu_fp_clean() static

Sean Christopherson (1):
      KVM: RISC-V: Use common KVM implementation of MMU memory caches

Vincent Chen (1):
      KVM: RISC-V: Avoid spurious virtual interrupts after clearing hideleg CSR

 .mailmap                                           |   2 +
 MAINTAINERS                                        |   4 +-
 arch/riscv/include/asm/kvm_host.h                  |  11 +-
 arch/riscv/include/asm/kvm_types.h                 |   2 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |  33 ++
 arch/riscv/include/asm/sbi.h                       |   9 +
 arch/riscv/kvm/Makefile                            |   4 +
 arch/riscv/kvm/main.c                              |   8 +
 arch/riscv/kvm/mmu.c                               |  71 +---
 arch/riscv/kvm/vcpu.c                              |  28 +-
 arch/riscv/kvm/vcpu_fp.c                           |   2 +-
 arch/riscv/kvm/vcpu_sbi.c                          | 213 ++++++------
 arch/riscv/kvm/vcpu_sbi_base.c                     |  99 ++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c                      | 105 ++++++
 arch/riscv/kvm/vcpu_sbi_replace.c                  | 135 ++++++++
 arch/riscv/kvm/vcpu_sbi_v01.c                      | 126 +++++++
 arch/riscv/kvm/vm.c                                |   3 +
 include/uapi/linux/kvm.h                           |   1 +
 tools/testing/selftests/kvm/Makefile               |  14 +-
 tools/testing/selftests/kvm/include/kvm_util.h     |  10 +
 .../selftests/kvm/include/riscv/processor.h        | 135 ++++++++
 tools/testing/selftests/kvm/lib/guest_modes.c      |  10 +
 tools/testing/selftests/kvm/lib/riscv/processor.c  | 362 +++++++++++++++++++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c      |  87 +++++
 24 files changed, 1291 insertions(+), 183 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h
 create mode 100644 arch/riscv/kvm/vcpu_sbi_base.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_hsm.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_v01.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c

