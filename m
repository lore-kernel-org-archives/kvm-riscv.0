From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Nov 2021 10:59:05 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.16, take #1
Message-ID: <CAAhSdy0CZiBSdGaVrDWEeWe7PUXKpE4RLiYeCaEO2QTN3mT83g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

This is the first set of fixes for 5.16. We only have two fixes
where first one adds missing kvm_arch_flush_shadow_memslot()
implementation whereas the second one fixes KVM_MAX_VCPUS
value.

Please pull.

Regards,
Anup

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.16-1

for you to fetch changes up to 74c2e97b01846eb237b7819a3e2944455cfdb26a:

  RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value (2021-11-22 10:36:19 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.16, take #1

- Fix incorrect KVM_MAX_VCPUS value

- Unmap stage2 mapping when deleting/moving a memslot
  (This was due to empty kvm_arch_flush_shadow_memslot())

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value

Sean Christopherson (1):
      KVM: RISC-V: Unmap stage2 mapping when deleting/moving a memslot

 arch/riscv/include/asm/kvm_host.h | 8 +++-----
 arch/riscv/kvm/mmu.c              | 6 ++++++
 2 files changed, 9 insertions(+), 5 deletions(-)

