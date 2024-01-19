From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Jan 2024 11:03:37 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #2
Message-ID: <CAAhSdy2rbMeTwwHU_dHwUQi3AQB1qGNf=ByvzG11D99ZOJ3djA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

We have the following additional KVM RISC-V changes for 6.8:
1) Zbc extension support for Guest/VM
2) Scalar crypto extensions support for Guest/VM
3) Vector crypto extensions support for Guest/VM
4) Zfh[min] extensions support for Guest/VM
5) Zihintntl extension support for Guest/VM
6) Zvfh[min] extensions support for Guest/VM
7) Zfa extension support for Guest/VM

Please pull.

Regards,
Anup

The following changes since commit 9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847:

  Merge tag 'for-6.8/block-2024-01-18' of git://git.kernel.dk/linux
(2024-01-18 18:22:40 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.8-2

for you to fetch changes up to 4d0e8f9a361b3a1f7b67418c536b258323de734f:

  KVM: riscv: selftests: Add Zfa extension to get-reg-list test
(2024-01-19 09:20:19 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.8 part #2

- Zbc extension support for Guest/VM
- Scalar crypto extensions support for Guest/VM
- Vector crypto extensions support for Guest/VM
- Zfh[min] extensions support for Guest/VM
- Zihintntl extension support for Guest/VM
- Zvfh[min] extensions support for Guest/VM
- Zfa extension support for Guest/VM

----------------------------------------------------------------
Anup Patel (14):
      RISC-V: KVM: Allow Zbc extension for Guest/VM
      KVM: riscv: selftests: Add Zbc extension to get-reg-list test
      RISC-V: KVM: Allow scalar crypto extensions for Guest/VM
      KVM: riscv: selftests: Add scaler crypto extensions to get-reg-list test
      RISC-V: KVM: Allow vector crypto extensions for Guest/VM
      KVM: riscv: selftests: Add vector crypto extensions to get-reg-list test
      RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
      KVM: riscv: selftests: Add Zfh[min] extensions to get-reg-list test
      RISC-V: KVM: Allow Zihintntl extension for Guest/VM
      KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
      RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
      KVM: riscv: selftests: Add Zvfh[min] extensions to get-reg-list test
      RISC-V: KVM: Allow Zfa extension for Guest/VM
      KVM: riscv: selftests: Add Zfa extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h                |  27 ++++++
 arch/riscv/kvm/vcpu_onereg.c                     |  54 ++++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 108 +++++++++++++++++++++++
 3 files changed, 189 insertions(+)

