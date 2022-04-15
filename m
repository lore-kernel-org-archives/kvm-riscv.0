From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Apr 2022 00:43:40 +0000
Subject: [PATCH 0/3] KVM: x86 SRCU bug fix and SRCU hardening
Message-ID: <20220415004343.2203171-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix an x86 bug where KVM overwrites vcpu->srcu_idx and can leak an SRCU
lock due to unlocking the wrong index, ultimately causing a hang if/when
KVM attempts to synchronize.

Switch RISC-V to the generic vcpu->srcu_idx, for reasons unknown it has
its own copy and ignores the generic one.

Add helpers with rudimentary detection of illegal vcpu->srcu_idx usage,
the x86 bug would have been incredibly painful to debug had I not known
what to look for (found by a selftest with very specific behavior...
that we recently modified with respect to SRCU).

Non-x86 changes are compile tested only.

Sean Christopherson (3):
  KVM: x86: Don't re-acquire SRCU lock in complete_emulated_io()
  KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's unnecessary copy
  KVM: Add helpers to wrap vcpu->srcu_idx and yell if it's abused

 arch/powerpc/kvm/book3s_64_mmu_radix.c |  9 ++++---
 arch/powerpc/kvm/book3s_hv_nested.c    | 16 ++++++------
 arch/powerpc/kvm/book3s_rtas.c         |  4 +--
 arch/powerpc/kvm/powerpc.c             |  4 +--
 arch/riscv/include/asm/kvm_host.h      |  3 ---
 arch/riscv/kvm/vcpu.c                  | 16 ++++++------
 arch/riscv/kvm/vcpu_exit.c             |  4 +--
 arch/s390/kvm/interrupt.c              |  4 +--
 arch/s390/kvm/kvm-s390.c               |  8 +++---
 arch/s390/kvm/vsie.c                   |  4 +--
 arch/x86/kvm/x86.c                     | 35 +++++++++++---------------
 include/linux/kvm_host.h               | 24 +++++++++++++++++-
 12 files changed, 72 insertions(+), 59 deletions(-)


base-commit: 150866cd0ec871c765181d145aa0912628289c8a
-- 
2.36.0.rc0.470.gd361397f0d-goog


