From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Feb 2024 17:27:15 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.8, take #1
Message-ID: <CAAhSdy3TXDCnA+hqJyNq3CiJD9LTtL_OOqX0N=GqScL1VU8FeQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have three fixes for 6.8 which address steal-time
related sparse warnings.

Please pull.

Regards,
Anup

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.8-1

for you to fetch changes up to f072b272aa27d57cf7fe6fdedb30fb50f391974e:

  RISC-V: KVM: Use correct restricted types (2024-02-09 11:53:13 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.8, take #1

- Fix steal-time related sparse warnings

----------------------------------------------------------------
Andrew Jones (3):
      RISC-V: paravirt: steal_time should be static
      RISC-V: paravirt: Use correct restricted types
      RISC-V: KVM: Use correct restricted types

 arch/riscv/kernel/paravirt.c  |  6 +++---
 arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

