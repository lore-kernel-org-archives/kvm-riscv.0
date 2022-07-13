From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Jul 2022 11:17:17 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #2
Message-ID: <CAAhSdy1CAtr=mAVFtduTcED_Sjp2=4duQwgL5syxZ-sYM6SoWQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have two more fixes for 5.19 which were discovered recently:
1) Fix missing PAGE_PFN_MASK
2) Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

Please pull.

Regards,
Anup

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.19-2

for you to fetch changes up to be82abe6a76ba8e76f25312566182b0f13c4fbf9:

  RISC-V: KVM: Fix SRCU deadlock caused by
kvm_riscv_check_vcpu_requests() (2022-07-11 09:36:32 +0530)

----------------------------------------------------------------
 KVM/riscv fixes for 5.19, take #2

- Fix missing PAGE_PFN_MASK

- Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix missing PAGE_PFN_MASK

Anup Patel (1):
      RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()

 arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
 arch/riscv/include/asm/pgtable.h    |  6 +++---
 arch/riscv/kvm/mmu.c                |  2 +-
 arch/riscv/kvm/vcpu.c               |  2 ++
 4 files changed, 12 insertions(+), 10 deletions(-)

