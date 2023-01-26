From: David Matlack <dmatlack@google.com>
Date: Thu, 26 Jan 2023 10:40:18 -0800
Subject: [PATCH v2 0/7] KVM: Add a common API for range-based TLB invalidation
Message-ID: <20230126184025.2294823-1-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a common API for performing range-based TLB
invalidation. This is then used to supplant
kvm_arch_flush_remote_tlbs_memslot() and pave the way for two other
patch series:

1. https://lore.kernel.org/kvm/20230109215347.3119271-1-rananta at google.com/

  Adds ARM support for range-based TLB invalidation and needs a
  mechanism to invoke it from common code. This series provides such a
  mechanism via kvm_arch_flush_remote_tlbs_range().

2. https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack at google.com/

  Refactors the TDP MMU into common code, which requires an API for
  range-based TLB invaliation.

This series is based on patches 29-33 from (2.), but I made some further
cleanups after looking at it a second time.

Tested on x86_64 and ARM64 using KVM selftests.

Cc: Raghavendra Rao Ananta <rananta@google.com>

v2:
 - Rebased on top of kvm-x86/next to resolve conflicts in changes slated
   for 6.3 [Sean]
 - Drop CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL from virt/kvm/Kconfig
   [Oliver]

v1: https://lore.kernel.org/kvm/20230119173559.2517103-1-dmatlack at google.com/

David Matlack (7):
  KVM: Rename kvm_arch_flush_remote_tlb() to
    kvm_arch_flush_remote_tlbs()
  KVM: arm64: Use kvm_arch_flush_remote_tlbs()
  KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}()
    together
  KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
  KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
  KVM: Allow range-based TLB invalidation from common code
  KVM: Move kvm_arch_flush_remote_tlbs_memslot() to common code

 arch/arm64/include/asm/kvm_host.h |  3 ++
 arch/arm64/kvm/Kconfig            |  1 -
 arch/arm64/kvm/arm.c              |  6 ----
 arch/arm64/kvm/mmu.c              |  6 ++--
 arch/mips/include/asm/kvm_host.h  |  4 +--
 arch/mips/kvm/mips.c              | 12 ++------
 arch/riscv/kvm/mmu.c              |  6 ----
 arch/x86/include/asm/kvm_host.h   |  7 +++--
 arch/x86/kvm/mmu/mmu.c            | 46 +++++++------------------------
 arch/x86/kvm/mmu/mmu_internal.h   |  7 ++---
 arch/x86/kvm/x86.c                |  2 +-
 include/linux/kvm_host.h          | 20 ++++++++++----
 virt/kvm/Kconfig                  |  3 --
 virt/kvm/kvm_main.c               | 35 +++++++++++++++++++----
 14 files changed, 73 insertions(+), 85 deletions(-)


base-commit: 503f0315c97739d3f8e645c500d81757dfbf76be
prerequisite-patch-id: 42a76ce7cec240776c21f674e99e893a3a6bee58
prerequisite-patch-id: c5ef6bbef252706b7e65b76dc9bd92cf320828f5
prerequisite-patch-id: c6e662cb6c369a47a027c25d3ccc7138a19b17f5
prerequisite-patch-id: 15a58bec64bf1537e6c9e2f52179fac652d441f7
prerequisite-patch-id: d5b6fea4724f4f2c3408b95d7ce5acdd4b528b10
-- 
2.39.1.456.gfc5497dd1b-goog


