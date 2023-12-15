From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 22:44:02 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.7, take #1
Message-ID: <CAAhSdy3Rc+vub65qJ4JNngp5qTgm7YpsJCHZy+ff0=TN_ir03g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have two fixes for 6.7. Out of these, one fix is related to
race condition in updating IMSIC swfile and second fix is
for default prints in get-reg-list sefltest.

Please pull.

Regards,
Anup

The following changes since commit a39b6ac3781d46ba18193c9dbb2110f31e9bffe9:

  Linux 6.7-rc5 (2023-12-10 14:33:40 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.7-1

for you to fetch changes up to 4ad9843e1ea088bd2529290234c6c4c6374836a7:

  RISCV: KVM: update external interrupt atomically for IMSIC swfile
(2023-12-13 11:59:52 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.7, take #1

- Fix a race condition in updating external interrupt for
  trap-n-emulated IMSIC swfile
- Fix print_reg defaults in get-reg-list selftest

----------------------------------------------------------------
Andrew Jones (1):
      KVM: riscv: selftests: Fix get-reg-list print_reg defaults

Yong-Xuan Wang (1):
      RISCV: KVM: update external interrupt atomically for IMSIC swfile

 arch/riscv/kvm/aia_imsic.c                       | 13 +++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 10 ++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

