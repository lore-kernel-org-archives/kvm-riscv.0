From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 May 2024 22:21:52 +0530
Subject: [GIT PULL] KVM/riscv fixes for 6.10 take #1
Message-ID: <CAAhSdy1mug8sUpNc=RaXYQWJoHNBQahAv5_rLRp0vOdT=xrHNg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have two minor fixes for 6.10. One is a special case
handling for hart-index-bits = 0 in IMSIC virtualization and
another one is a typo fix in kvm_riscv_vcpu_set_reg_isa_ext().

Please pull.

Regards,
Anup

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.10-1

for you to fetch changes up to c66f3b40b17d3dfc4b6abb5efde8e71c46971821:

  RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function (2024-05-31 10:40:39 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.10, take #1

- No need to use mask when hart-index-bits is 0
- Fix incorrect reg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext()

----------------------------------------------------------------
Quan Zhou (1):
      RISC-V: KVM: Fix incorrect reg_subtype labels in
kvm_riscv_vcpu_set_reg_isa_ext function

Yong-Xuan Wang (1):
      RISC-V: KVM: No need to use mask when hart-index-bit is 0

 arch/riscv/kvm/aia_device.c  | 7 ++++---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

