From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Nov 2021 18:04:19 +0530
Subject: [GIT PULL] KVM/riscv for 5.16 take #2
Message-ID: <CAAhSdy0TUZAgb5Wyp4Lnv30A1sJ009ATr9VTq49ow_C9-YVeBg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

I had two warning fixes in the KVM RISC-V repo which I am
sending as part of this PR. Also, sorry if I sent the PR too late.

Please pull.

Best Regards,
Anup

The following changes since commit 9c6eb531e7606dc957bf0ef7f3eed8a5c5cb774d:

  Merge tag 'kvm-s390-next-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD
(2021-10-31 09:01:25 -0400)

are available in the Git repository at:

  git://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.16-2

for you to fetch changes up to bbd5ba8db7662dbfcc15204eb105cd0c2971a47c:

  RISC-V: KVM: fix boolreturn.cocci warnings (2021-11-01 17:35:17 +0530)

----------------------------------------------------------------
Minor cocci warning fixes:
1) Bool return warning fix
2) Unneeded semicolon warning fix

----------------------------------------------------------------
Bixuan Cui (1):
      RISC-V: KVM: fix boolreturn.cocci warnings

ran jianping (1):
      RISC-V: KVM: remove unneeded semicolon

 arch/riscv/kvm/mmu.c        | 18 +++++++++---------
 arch/riscv/kvm/vcpu.c       |  4 ++--
 arch/riscv/kvm/vcpu_exit.c  |  6 +++---
 arch/riscv/kvm/vcpu_sbi.c   |  2 +-
 arch/riscv/kvm/vcpu_timer.c |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

