From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Aug 2022 13:31:55 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.0, take #1
Message-ID: <CAAhSdy2oDoytypnjNFodEY7q_E0OVmrh=GkihQE_K5MnPcK_Sg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have two minor fixes for 6.0:
1) Fix unused variable warnings in vcpu_timer.c
2) Move extern sbi_ext declarations to a header

Please pull.

Regards,
Anup

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.0-1

for you to fetch changes up to 3e5e56c60a14776e2a49837b55b03bc193fd91f7:

  riscv: kvm: move extern sbi_ext declarations to a header (2022-08-19
23:22:47 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.0, take #1

- Fix unused variable warnings in vcpu_timer.c
- Move extern sbi_ext declarations to a header

----------------------------------------------------------------
Conor Dooley (2):
      riscv: kvm: vcpu_timer: fix unused variable warnings
      riscv: kvm: move extern sbi_ext declarations to a header

 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 arch/riscv/kvm/vcpu_timer.c           |  4 ----
 3 files changed, 13 insertions(+), 15 deletions(-)

