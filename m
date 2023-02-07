From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Feb 2023 23:05:48 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.3
Message-ID: <CAAhSdy25NgCY23u=icRgcZpEZzNgJkyEN92KEVL8D-SvUwTBXg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following KVM RISC-V changes for 6.3:
1) Fix wrong usage of PGDIR_SIZE to check page sizes
2) Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
3) Redirect illegal instruction traps to guest
4) SBI PMU support for guest

Please pull.

I will send another PR for 6.3 containing AIA CSR
virtualization after Palmer has sent his first PR for 6.3
so that I can resolve conflicts with arch/riscv changes.
I hope you are okay with this ??

Regards,
Anup

The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3:

  Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.3-1

for you to fetch changes up to c39cea6f38eefe356d64d0bc1e1f2267e282cdd3:

  RISC-V: KVM: Increment firmware pmu events (2023-02-07 20:36:08 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.3

- Fix wrong usage of PGDIR_SIZE to check page sizes
- Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
- Redirect illegal instruction traps to guest
- SBI PMU support for guest

----------------------------------------------------------------
Alexandre Ghiti (1):
      KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes

Andy Chiu (1):
      RISC-V: KVM: Redirect illegal instruction traps to guest

Anup Patel (1):
      RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()

Atish Patra (14):
      perf: RISC-V: Define helper functions expose hpm counter width and count
      perf: RISC-V: Improve privilege mode filtering for perf
      RISC-V: Improve SBI PMU extension related definitions
      RISC-V: KVM: Define a probe function for SBI extension data structures
      RISC-V: KVM: Return correct code for hsm stop function
      RISC-V: KVM: Modify SBI extension handler to return SBI error code
      RISC-V: KVM: Add skeleton support for perf
      RISC-V: KVM: Add SBI PMU extension support
      RISC-V: KVM: Make PMU functionality depend on Sscofpmf
      RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
      RISC-V: KVM: Implement trap & emulate for hpmcounters
      RISC-V: KVM: Implement perf support without sampling
      RISC-V: KVM: Support firmware events
      RISC-V: KVM: Increment firmware pmu events

 arch/riscv/include/asm/kvm_host.h     |   4 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 107 ++++++
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
 arch/riscv/include/asm/sbi.h          |   7 +-
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/main.c                 |   3 +-
 arch/riscv/kvm/mmu.c                  |   8 +-
 arch/riscv/kvm/tlb.c                  |   4 +
 arch/riscv/kvm/vcpu.c                 |   7 +
 arch/riscv/kvm/vcpu_exit.c            |   9 +
 arch/riscv/kvm/vcpu_insn.c            |   4 +-
 arch/riscv/kvm/vcpu_pmu.c             | 633 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             |  72 ++--
 arch/riscv/kvm/vcpu_sbi_base.c        |  27 +-
 arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 +++++
 arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +--
 arch/riscv/kvm/vcpu_sbi_v01.c         |  17 +-
 drivers/perf/riscv_pmu_sbi.c          |  64 +++-
 include/linux/perf/riscv_pmu.h        |   5 +
 20 files changed, 1035 insertions(+), 114 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
 create mode 100644 arch/riscv/kvm/vcpu_pmu.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

