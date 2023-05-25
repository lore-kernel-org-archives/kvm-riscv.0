From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 25 May 2023 15:38:24 +0800
Subject: [PATCH v2 00/11] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <cover.1684999824.git.haibo1.xu@intel.com>
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

Patch 8 enabled the KVM_GET_REG_LIST API in riscv and patch 9-11 added
the corresponding kselftest for checking possible register regressions.

The get-reg-list kvm selftest was ported from aarch64 and tested with
Linux 6.4-rc1 on a Qemu riscv virt machine.

---
Changed since v1:
  * rebase to Andrew's changes
  * fix coding style

Andrew Jones (7):
  KVM: arm64: selftests: Replace str_with_index with strdup_printf
  KVM: arm64: selftests: Drop SVE cap check in print_reg
  KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
  KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
  KVM: arm64: selftests: Delete core_reg_fixup
  KVM: arm64: selftests: Split get-reg-list test code
  KVM: arm64: selftests: Finish generalizing get-reg-list

Haibo Xu (4):
  KVM: riscv: Add KVM_GET_REG_LIST API support
  KVM: riscv: selftests: Make check_supported arch specific
  KVM: riscv: selftests: Skip some registers set operation
  KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 372 ++++++++++++
 tools/testing/selftests/kvm/Makefile          |  13 +-
 .../selftests/kvm/aarch64/get-reg-list.c      | 540 ++----------------
 tools/testing/selftests/kvm/get-reg-list.c    | 426 ++++++++++++++
 .../selftests/kvm/include/kvm_util_base.h     |  16 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../testing/selftests/kvm/include/test_util.h |   2 +
 tools/testing/selftests/kvm/lib/test_util.c   |  15 +
 .../selftests/kvm/riscv/get-reg-list.c        | 539 +++++++++++++++++
 10 files changed, 1428 insertions(+), 500 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


