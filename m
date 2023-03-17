From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Mar 2023 17:02:57 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.3, take #1
Message-ID: <CAAhSdy320bsv7=EBLcdiXyJcO6NWUFK9_XUvwF_KvFF8v91RpA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have one KVM RISC-V fix for 6.3:
1) Fix VM hang in case of timer delta being zero

Please pull.

Regards,
Anup

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.3-1

for you to fetch changes up to 6eff38048944cadc3cddcf117acfa5199ec32490:

  riscv/kvm: Fix VM hang in case of timer delta being zero.
(2023-03-17 13:32:54 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.3, take #1

- Fix VM hang in case of timer delta being zero

----------------------------------------------------------------
Rajnesh Kanwal (1):
      riscv/kvm: Fix VM hang in case of timer delta being zero.

 arch/riscv/kvm/vcpu_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

