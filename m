From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Aug 2023 22:55:28 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.6
Message-ID: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.6:
1) Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
2) Added ONE_REG interface for SATP mode
3) Added ONE_REG interface to enable/disable multiple ISA extensions
4) Improved error codes returned by ONE_REG interfaces
5) Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
6) Added get-reg-list selftest for KVM RISC-V

Please pull.

Regards,
Anup

The following changes since commit 52a93d39b17dc7eb98b6aa3edb93943248e03b2f:

  Linux 6.5-rc5 (2023-08-06 15:07:51 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.6-1

for you to fetch changes up to 477069398ed6e0498ee243e799cb6c68baf6ccb8:

  KVM: riscv: selftests: Add get-reg-list test (2023-08-09 12:15:27 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.6

- Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
- Added ONE_REG interface for SATP mode
- Added ONE_REG interface to enable/disable multiple ISA extensions
- Improved error codes returned by ONE_REG interfaces
- Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
- Added get-reg-list selftest for KVM RISC-V

----------------------------------------------------------------
Andrew Jones (9):
      RISC-V: KVM: Improve vector save/restore errors
      RISC-V: KVM: Improve vector save/restore functions
      KVM: arm64: selftests: Replace str_with_index with strdup_printf
      KVM: arm64: selftests: Drop SVE cap check in print_reg
      KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
      KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
      KVM: arm64: selftests: Delete core_reg_fixup
      KVM: arm64: selftests: Split get-reg-list test code
      KVM: arm64: selftests: Finish generalizing get-reg-list

Anup Patel (5):
      RISC-V: KVM: Factor-out ONE_REG related code to its own source file
      RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
      RISC-V: KVM: Allow Zba and Zbs extensions for Guest/VM
      RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
      RISC-V: KVM: Sort ISA extensions alphabetically in ONE_REG interface

Daniel Henrique Barboza (10):
      RISC-V: KVM: provide UAPI for host SATP mode
      RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
      RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
      RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
      RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
      RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
      RISC-V: KVM: avoid EBUSY when writing same ISA val
      RISC-V: KVM: avoid EBUSY when writing the same machine ID val
      RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
      docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

Haibo Xu (6):
      KVM: arm64: selftests: Move reject_set check logic to a function
      KVM: arm64: selftests: Move finalize_vcpu back to run_test
      KVM: selftests: Only do get/set tests on present blessed list
      KVM: selftests: Add skip_set facility to get_reg_list test
      KVM: riscv: Add KVM_GET_REG_LIST API support
      KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                     |    4 +-
 arch/riscv/include/asm/csr.h                       |    2 +
 arch/riscv/include/asm/kvm_host.h                  |    9 +
 arch/riscv/include/asm/kvm_vcpu_vector.h           |    6 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   16 +
 arch/riscv/kvm/Makefile                            |    1 +
 arch/riscv/kvm/aia.c                               |    4 +-
 arch/riscv/kvm/vcpu.c                              |  547 +---------
 arch/riscv/kvm/vcpu_fp.c                           |   12 +-
 arch/riscv/kvm/vcpu_onereg.c                       | 1051 ++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c                          |   16 +-
 arch/riscv/kvm/vcpu_timer.c                        |   11 +-
 arch/riscv/kvm/vcpu_vector.c                       |   72 +-
 tools/testing/selftests/kvm/Makefile               |   13 +-
 tools/testing/selftests/kvm/aarch64/get-reg-list.c |  554 ++---------
 tools/testing/selftests/kvm/get-reg-list.c         |  401 ++++++++
 .../testing/selftests/kvm/include/kvm_util_base.h  |   21 +
 .../selftests/kvm/include/riscv/processor.h        |    3 +
 tools/testing/selftests/kvm/include/test_util.h    |    2 +
 tools/testing/selftests/kvm/lib/test_util.c        |   15 +
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  872 ++++++++++++++++
 21 files changed, 2547 insertions(+), 1085 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_onereg.c
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

