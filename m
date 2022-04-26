From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 26 Apr 2022 05:38:58 +0000
Subject: [PATCH v3 0/6] KVM: mm: count KVM page table pages in memory stats
Message-ID: <20220426053904.3684293-1-yosryahmed@google.com>
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
any of those kernel memory stats. This patch series accounts the memory
pages used by KVM for page tables in those stats in a new
NR_SECONDARY_PAGETABLE stat.

The riscv and mips patches are not tested due to lack of
resources. Feel free to test or drop them.

Changes in V3:
- Added NR_SECONDARY_PAGETABLE instead of piggybacking on NR_PAGETABLE
  stats.

Changes in V2:
- Added accounting stats for other archs than x86.
- Changed locations in the code where x86 KVM page table stats were
  accounted based on suggestions from Sean Christopherson.


Yosry Ahmed (6):
  mm: add NR_SECONDARY_PAGETABLE stat
  KVM: mmu: add a helper to account page table pages used by KVM.
  KVM: x86/mmu: count KVM page table pages in pagetable stats
  KVM: arm64/mmu: count KVM page table pages in pagetable stats
  KVM: riscv/mmu: count KVM page table pages in pagetable stats
  KVM: mips/mmu: count KVM page table pages in pagetable stats

 arch/arm64/kernel/image-vars.h |  3 ++
 arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
 arch/mips/kvm/mips.c           |  1 +
 arch/mips/kvm/mmu.c            |  9 +++++-
 arch/riscv/kvm/mmu.c           | 26 +++++++++++++-----
 arch/x86/kvm/mmu/mmu.c         | 16 +++++++++--
 arch/x86/kvm/mmu/tdp_mmu.c     | 16 +++++++++--
 drivers/base/node.c            |  2 ++
 fs/proc/meminfo.c              |  2 ++
 include/linux/kvm_host.h       |  9 ++++++
 include/linux/mmzone.h         |  1 +
 mm/memcontrol.c                |  1 +
 mm/page_alloc.c                |  6 +++-
 mm/vmstat.c                    |  1 +
 14 files changed, 111 insertions(+), 32 deletions(-)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog


