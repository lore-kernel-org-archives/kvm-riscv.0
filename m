From: Haibo Xu <haibo1.xu@intel.com>
Date: Fri, 23 Jun 2023 18:40:02 +0800
Subject: [PATCH v4 00/12] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <cover.1687515463.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM_GET_REG_LIST will dump all register IDs that are available to
KVM_GET/SET_ONE_REG and It's very useful to identify some platform
regression issue during VM migration.

Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
of the code as common test framework that can be shared by riscv.

Patch 8 move reject_set check logic to a function so as to check for
different errno for different registers.
Patch 9 change to do the get/set operation only on present-blessed list.
Patch 10 enabled the KVM_GET_REG_LIST API in riscv.
patch 11-12 added the corresponding kselftest for checking possible
register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux 6.4-rc6 on a Qemu riscv64 virt machine.

---
Changed since v3:
  * Rebase to Linux 6.4-rc6
  * Address Andrew's suggestions and comments:
  *   Move reject_set check logic to a function 
  *   Only do get/set tests on present blessed list 
  *   Only enable ISA extension for the specified config
  *   For disable-not-allowed registers, move them to the filter-reg-list 

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (5):
  KVM: arm64: selftests: Move reject_set check logic to a function
  KVM: selftests: Only do get/set tests on present blessed list
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Add finalize_vcpu check in run_test
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 375 +++++++++
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 538 ++-----------
 tools/testing/selftests/kvm/get-reg-list.c    | 439 ++++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  16 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 752 ++++++++++++++++++
 10 files changed, 1658 insertions(+), 495 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


