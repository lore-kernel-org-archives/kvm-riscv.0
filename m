From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon,  4 Apr 2022 23:41:49 +0000
Subject: [PATCH v2 0/5] KVM: mm: count KVM page table pages in pagetable stats
Message-ID: <20220404234154.1251388-1-yosryahmed@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We keep track of several kernel memory stats (total kernel memory, page
tables, stack, vmalloc, etc) on multiple levels (global, per-node,
per-memcg, etc). These stats give insights to users to how much memory
is used by the kernel and for what purposes.

Currently, memory used by kvm for its page tables is not accounted in
the pagetable stats. This patch series accounts the memory pages used by
KVM for page tables in those stats.

The riscv and mips patches are not tested properly due to lack of
resources. Feel free to test or drop them.

Yosry Ahmed (5):
  KVM: mm: add a helper to account page table pages used by KVM.
  KVM: x86: mm: count KVM page table pages in pagetable stats
  KVM: arm64: mm: count KVM page table pages in pagetable stats
  KVM: riscv: mm: count KVM page table pages in pagetable stats
  KVM: mips: mm: count KVM page table pages in pagetable stats

 arch/arm64/kernel/image-vars.h |  3 ++
 arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
 arch/mips/kvm/mips.c           |  1 +
 arch/mips/kvm/mmu.c            |  9 +++++-
 arch/riscv/kvm/mmu.c           | 26 +++++++++++++-----
 arch/x86/kvm/mmu/mmu.c         | 16 +++++++++--
 arch/x86/kvm/mmu/tdp_mmu.c     | 16 +++++++++--
 include/linux/kvm_host.h       |  9 ++++++
 8 files changed, 99 insertions(+), 31 deletions(-)

-- 
2.35.1.1094.g7c7d902a7c-goog


