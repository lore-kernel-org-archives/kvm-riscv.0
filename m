From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 11 May 2023 17:22:47 +0800
Subject: [PATCH 0/2] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <cover.1683791148.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM_GET_REG_LIST will dump all register IDs that are available to
KVM_GET/SET_ONE_REG and It's very useful to identify some platform
regression issue during VM migration.

Patch 1 enabled the KVM_GET_REG_LIST API in riscv and patch 2 added
the corresponding kselftest for checking possible register regressions.

Both patches were ported from arm64 and tested with Linux 6.4-rc1 on a
Qemu riscv virt machine.

Haibo Xu (2):
  riscv: kvm: Add KVM_GET_REG_LIST API support
  KVM: selftests: Add riscv get-reg-list test

 Documentation/virt/kvm/api.rst                |   2 +-
 arch/riscv/kvm/vcpu.c                         | 346 +++++++
 tools/testing/selftests/kvm/Makefile          |   3 +
 .../selftests/kvm/include/riscv/processor.h   |   3 +
 .../selftests/kvm/riscv/get-reg-list.c        | 869 ++++++++++++++++++
 5 files changed, 1222 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

-- 
2.34.1


