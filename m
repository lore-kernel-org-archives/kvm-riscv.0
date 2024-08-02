From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 17:12:07 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.11 take #1
Message-ID: <CAAhSdy3ZhXmbDFrWneA9aA8ALYy+SgMpyopd_9MPzYgWksMLBQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have one compilation fix for get-reg-list selftests
in the 6.11 kernel.

Please pull.

Regards,
Anup

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.11-1

for you to fetch changes up to dd4a799bcc13992dd8be9708e5c585f55226b567:

  KVM: riscv: selftests: Fix compile error (2024-07-29 10:10:56 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.11, take #1

- Fix compile error in get-reg-list selftests

----------------------------------------------------------------
Yong-Xuan Wang (1):
      KVM: riscv: selftests: Fix compile error

 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

