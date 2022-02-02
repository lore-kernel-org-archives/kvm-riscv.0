From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 20:25:44 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.17, take #1
Message-ID: <CAAhSdy0C_RMVShk=vv7FRgmVRspBkVQfiCLx-4B6pYtLU10vZA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

This is the first set of fixes for 5.17. We have three fixes namely
guest entry rework, sbi implementation version fix and counter
access fix.

Please pull.

Regards,
Anup

The following changes since commit b2d2af7e5df37ee3a9ba6b405bdbb7691a5c2dfc:

  kvm/x86: rework guest entry logic (2022-02-01 08:51:54 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.17-1

for you to fetch changes up to 403271548a840dd4f884088d6333e09f899be5ff:

  RISC-V: KVM: Fix SBI implementation version (2022-02-02 18:58:06 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.17, take #1

- Rework guest entry logic

- Make CY, TM, and IR counters accessible in VU mode

- Fix SBI implementation version

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Fix SBI implementation version

Mark Rutland (1):
      kvm/riscv: rework guest entry logic

Mayuresh Chitale (1):
      RISC-V: KVM: make CY, TM, and IR counters accessible in VU mode

 arch/riscv/kvm/vcpu.c          | 48 +++++++++++++++++++++++++++---------------
 arch/riscv/kvm/vcpu_sbi_base.c |  3 ++-
 2 files changed, 33 insertions(+), 18 deletions(-)

