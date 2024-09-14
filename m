From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Sep 2024 13:17:13 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.12
Message-ID: <CAAhSdy0fHNoSx9KAG9nL=sc9=L+zeComyJjctD7kYOhuMNxLdg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have only 4 KVM RISC-V fixes for 6.12. There
are quite a few in-flight patches waiting for more
reviews and these will be included in 6.13.

Please pull.

Regards,
Anup

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.12-1

for you to fetch changes up to 5aa09297a3dcc798d038bd7436f8c90f664045a6:

  RISC-V: KVM: Fix to allow hpmcounter31 from the guest (2024-08-19
08:58:21 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.12

- Fix sbiret init before forwarding to userspace
- Don't zero-out PMU snapshot area before freeing data
- Allow legacy PMU access from guest
- Fix to allow hpmcounter31 from the guest

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: KVM: Fix sbiret init before forwarding to userspace

Anup Patel (1):
      RISC-V: KVM: Don't zero-out PMU snapshot area before freeing data

Atish Patra (2):
      RISC-V: KVM: Allow legacy PMU access from guest
      RISC-V: KVM: Fix to allow hpmcounter31 from the guest

 arch/riscv/include/asm/kvm_vcpu_pmu.h | 21 +++++++++++++++++----
 arch/riscv/kvm/vcpu_pmu.c             | 14 ++------------
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++--
 3 files changed, 21 insertions(+), 18 deletions(-)

