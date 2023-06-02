From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:08:58 -0700
Subject: [PATCH v2 00/16] Use MMU read lock for clear-dirty-log
Message-ID: <20230602160914.4011728-1-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This series is on top of kvmarm/next as I needed to also modify Eager
page splitting logic in clear-dirty-log API. Eager page splitting is not
present in Linux 6.4-rc4.

Also, I had to change selftests patches (1 to 5) as some commits were
removed from kvm/queue remote. This caused issue due to different APIs
being present in dirty_log_perf_test when I was rebasing v2. Those
removed commits are now back in kvm-x86 branch of Sean [1] but not in
kvmarm/next or kvm/queue. I didn't want to wait for review of v2, so I
changed dirty_log_perf_test to work with kvmarm/next branch. When Sean's
kvm-x86 branch is merged, sleftests in this patch series need to be
modified to use new APIs or whoever merges last need to take care of
that.

This patch series modifies clear-dirty-log operation to run under MMU
read lock. It write protects SPTEs and split huge pages using MMU read
lock instead of MMU write lock.

Use of MMU read lock is made possible by using shared page table
walkers. Currently only page fault handlers use shared page table
walkers, with this series, clear-dirty-log operation will also use
shared page table walkers.

Patches 1 to 5:
These patches are modifying dirty_log_perf_test. Intent is to mimic
production scenarios where guest keeps on executing while userspace
thread collects and clears dirty logs independently.

Three new command line options are added:
1. j: Allows to run guest vCPUs and main thread collecting dirty logs
      independently of each other after initialization is complete.
2. k: Allows to clear dirty logs in smaller chunks compared to existing
      whole memslot clear in one call.
3. l: Allows to add customizable wait time between consecutive clear
      dirty log calls to mimic sending dirty memory to destination.

Patch 7-16:
These patches refactor code to move MMU lock operations to arch specific
code, refactor Arm's page table walker APIs, and change MMU write lock
for clearing dirty logs to read lock. Patch 16 has results showing
improvements based on dirty_log_perf_test.


1. https://lore.kernel.org/lkml/168565341087.666819.6731422637224460050.b4-ty at google.com/

v2:
- Fix compile warning for mips and riscv.
- Added logic to continue or retry shared page walk which are not fault
  handler.
- Huge page split also changed to run under MMU read lock.
- Added more explanations in commit logs.
- Selftests is modified because a commit series was reverted back in
  dirty_log_perf_test on kvm/queue.

v1: https://lore.kernel.org/lkml/20230421165305.804301-1-vipinsh at google.com/

Vipin Sharma (16):
  KVM: selftests: Clear dirty logs in user defined chunks sizes in
    dirty_log_perf_test
  KVM: selftests: Add optional delay between consecutive clear-dirty-log
    calls
  KVM: selftests: Pass the count of read and write accesses from guest
    to host
  KVM: selftests: Print read-write progress by vCPUs in
    dirty_log_perf_test
  KVM: selftests: Allow independent execution of vCPUs in
    dirty_log_perf_test
  KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
  KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
  KMV: arm64: Pass page table walker flags to stage2_apply_range_*()
  KVM: arm64: Document the page table walker actions based on the
    callback's return value
  KVM: arm64: Return -ENOENT if PTE is not valid in stage2_attr_walker
  KVM: arm64: Use KVM_PGTABLE_WALK_SHARED flag instead of
    KVM_PGTABLE_WALK_HANDLE_FAULT
  KVM: arm64: Retry shared page table walks outside of fault handler
  KVM: arm64: Run clear-dirty-log under MMU read lock
  KVM: arm64: Pass page walker flags from callers of stage 2 split
    walker
  KVM: arm64: Provide option to pass page walker flag for huge page
    splits
  KVM: arm64: Split huge pages during clear-dirty-log under MMU read
    lock

 arch/arm64/include/asm/kvm_pgtable.h          |  42 +++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |   4 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  68 ++++++--
 arch/arm64/kvm/mmu.c                          |  65 +++++---
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   3 +
 .../selftests/kvm/dirty_log_perf_test.c       | 147 ++++++++++++++----
 tools/testing/selftests/kvm/lib/memstress.c   |  13 +-
 virt/kvm/dirty_ring.c                         |   2 -
 virt/kvm/kvm_main.c                           |   4 -
 11 files changed, 265 insertions(+), 87 deletions(-)


base-commit: 532b2ecfa547f02b1825108711565eff026bce5a
-- 
2.41.0.rc0.172.g3f132b7071-goog


