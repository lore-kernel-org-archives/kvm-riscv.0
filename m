From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Apr 2022 21:02:03 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.18, take #2
Message-ID: <CAAhSdy3io3CdxTDGRVCijO-R2V=GBOukOEs+BH6wYnkT2_iPMw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

This is the second set of fixes for 5.18. We only have two fixes related to
extensions that can be enabled/disabled in the isa ONE_REG register.

Please pull.

Regards,
Anup

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.18-2

for you to fetch changes up to 38d9a4ac65f204f264b33b966f0af4366f5518a8:

  RISC-V: KVM: Restrict the extensions that can be disabled
(2022-04-20 14:24:32 +0530)

----------------------------------------------------------------
 KVM/riscv fixes for 5.18, take #2

 - Remove 's' & 'u' as valid ISA extension

 - Restrict the extensions that can be disabled

----------------------------------------------------------------
Atish Patra (2):
      RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
      RISC-V: KVM: Restrict the extensions that can be disabled

 arch/riscv/kvm/vcpu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

