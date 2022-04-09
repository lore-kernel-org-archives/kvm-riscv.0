From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Apr 2022 10:00:29 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.18, take #1
Message-ID: <CAAhSdy3RJpcYNS9NN=hNw=14O9e6=hqoF10fi1vT=No2cT0jWQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

This is the first set of fixes for 5.18. There are four fixes:
a) One fix related to hgatp in kvm_arch_vcpu_put()
b) Two KVM selftests fixes
c) Missing #include in vcpu_fp.c

Please pull.

Regards,
Anup

The following changes since commit a44e2c207c30a5780c4ad0cc3579b8715cebf52e:

  Merge tag 'kvmarm-fixes-5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
(2022-04-08 12:30:04 -0400)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.18-1

for you to fetch changes up to 4054eee9290248bf66c5eacb58879c9aaad37f71:

  RISC-V: KVM: include missing hwcap.h into vcpu_fp (2022-04-09 09:16:00 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.18, take #1

- Remove hgatp zeroing in kvm_arch_vcpu_put()

- Fix alignment of the guest_hang() in KVM selftest

- Fix PTE A and D bits in KVM selftest

- Missing #include in vcpu_fp.c

----------------------------------------------------------------
Anup Patel (3):
      RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()
      KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table
      KVM: selftests: riscv: Fix alignment of the guest_hang() function

Heiko Stuebner (1):
      RISC-V: KVM: include missing hwcap.h into vcpu_fp

 arch/riscv/kvm/vcpu.c                                 | 2 --
 arch/riscv/kvm/vcpu_fp.c                              | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h | 4 +++-
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

