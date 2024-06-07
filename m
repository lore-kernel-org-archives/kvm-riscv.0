From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jun 2024 12:19:55 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.10 take #2
Message-ID: <CAAhSdy0wc=e5LW92Y7YdK6Bi0cxk6C1EhSyv5vMo1FxKMu_CpA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have one additional fix for 6.10 to take care of
the compilation issue in KVM selftests.

Please pull.

Regards,
Anup

The following changes since commit c66f3b40b17d3dfc4b6abb5efde8e71c46971821:

  RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function (2024-05-31 10:40:39 +0530)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.10-2

for you to fetch changes up to 0fc670d07d5de36a54f061f457743c9cde1d8b46:

  KVM: selftests: Fix RISC-V compilation (2024-06-06 15:53:16 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.10, take #2

- Fix compilation for KVM selftests

----------------------------------------------------------------
Andrew Jones (1):
      KVM: selftests: Fix RISC-V compilation

 tools/testing/selftests/kvm/lib/riscv/ucall.c    | 1 +
 tools/testing/selftests/kvm/riscv/ebreak_test.c  | 1 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 1 +
 3 files changed, 3 insertions(+)

