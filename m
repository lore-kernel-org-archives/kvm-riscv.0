From: Haibo Xu <haibo1.xu@intel.com>
Date: Sat,  1 Jul 2023 21:42:48 +0800
Subject: [PATCH v5 00/13] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <cover.1688010022.git.haibo1.xu@intel.com>
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
Patch 9 move finalize_vcpu back to run_test so that riscv can implement
its specific operation.
Patch 10 change to do the get/set operation only on present-blessed list.
Patch 11 add the skip_set facilities so that riscv can skip set operation
on some registers.
Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
patch 13 added the corresponding kselftest for checking possible
register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux v6.4 on a Qemu riscv64 virt machine.

---
Changed since v4:
  * Rebase to v6.4
  * Address Andrew's suggestions and comments:
      Added skip_set concept
      Updated errno check logic
      Modified finalize_vcpu as weak function

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (6):
  KVM: arm64: selftests: Move reject_set check logic to a function
  KVM: arm64: selftests: Move finalize_vcpu back to run_test
  KVM: selftests: Only do get/set tests on present blessed list
  KVM: selftests: Add skip_set facility to get_reg_list test
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 375 +++++++++
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 544 ++----------
 tools/testing/selftests/kvm/get-reg-list.c    | 395 +++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  21 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 780 ++++++++++++++++++
 10 files changed, 1655 insertions(+), 493 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


