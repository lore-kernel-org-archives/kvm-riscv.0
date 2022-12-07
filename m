From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Dec 2022 16:03:28 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.2
Message-ID: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.2:
1) Allow unloading KVM module
2) Allow KVM user-space to set mvendorid, marchid, and mimpid
3) Several fixes and cleanups

Please pull.

Regards,
Anup

The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:

  Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.2-1

for you to fetch changes up to 6ebbdecff6ae00557a52539287b681641f4f0d33:

  RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and
mimpid (2022-12-07 09:17:49 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.2

- Allow unloading KVM module
- Allow KVM user-space to set mvendorid, marchid, and mimpid
- Several fixes and cleanups

----------------------------------------------------------------
Anup Patel (9):
      RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
      RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
      RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
      RISC-V: KVM: Remove redundant includes of asm/csr.h
      RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
      RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
      RISC-V: Export sbi_get_mvendorid() and friends
      RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
      RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid

Bo Liu (1):
      RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()

Christophe JAILLET (1):
      RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()

XiakaiPan (1):
      RISC-V: KVM: Add exit logic to main.c

 arch/riscv/include/asm/kvm_host.h     | 16 +++----
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 +++
 arch/riscv/include/uapi/asm/kvm.h     |  3 ++
 arch/riscv/kernel/sbi.c               |  3 ++
 arch/riscv/kvm/main.c                 |  6 +++
 arch/riscv/kvm/mmu.c                  |  6 +--
 arch/riscv/kvm/vcpu.c                 | 85 ++++++++++++++++++++++++++---------
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++---
 arch/riscv/kvm/vcpu_sbi_hsm.c         |  1 -
 arch/riscv/kvm/vcpu_sbi_replace.c     |  1 -
 arch/riscv/kvm/vcpu_sbi_v01.c         |  1 -
 11 files changed, 97 insertions(+), 44 deletions(-)

