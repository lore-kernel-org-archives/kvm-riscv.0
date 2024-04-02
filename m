From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2024 21:18:03 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.9, take #1
Message-ID: <CAAhSdy2e237A_vA022kh3cmy-YJ_t=0iXyRkbQS3NSR=_Z+6HA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have four fixes for 6.9. Out of these, two fixes are
related to in-kernel APLIC emulation and remaining
are cosmetic fixes.

Please pull.

Regards,
Anup

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.9-1

for you to fetch changes up to 8e936e98718f005c986be0bfa1ee6b355acf96be:

  RISC-V: KVM: Fix APLIC in_clrip[x] read emulation (2024-03-26 09:40:55 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.9, take #1

- Fix spelling mistake in arch_timer selftest
- Remove redundant semicolon in num_isa_ext_regs()
- Fix APLIC setipnum_le/be write emulation
- Fix APLIC in_clrip[x] read emulation

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
      RISC-V: KVM: Fix APLIC in_clrip[x] read emulation

Colin Ian King (2):
      KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
      RISC-V: KVM: Remove second semicolon

 arch/riscv/kvm/aia_aplic.c                       | 37 ++++++++++++++++++++----
 arch/riscv/kvm/vcpu_onereg.c                     |  2 +-
 tools/testing/selftests/kvm/aarch64/arch_timer.c |  2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c   |  2 +-
 4 files changed, 34 insertions(+), 9 deletions(-)

