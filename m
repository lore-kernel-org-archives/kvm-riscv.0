From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 21 Apr 2023 09:52:56 -0700
Subject: [PATCH 0/9] KVM: arm64: Use MMU read lock for clearing dirty logs
Message-ID: <20230421165305.804301-1-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series improves guest vCPUs performances on Arm during clearing
dirty log operations by taking MMU read lock instead of MMU write lock.

vCPUs write protection faults are fixed in Arm using MMU read locks.
However, when userspace is clearing dirty logs via KVM_CLEAR_DIRTY_LOG
ioctl, then kernel code takes MMU write lock. This will block vCPUs
write protection faults and degrade guest performance.  This
degradation gets worse as guest VM size increases in terms of memory and
vCPU count.

In this series, MMU read lock adoption is made possible by using
KVM_PGTABLE_WALK_SHARED flag in page walker.

Patches 1 to 5:
These patches are modifying dirty_log_perf_test. Intent is to mimic
production scenarios where guest keeps on executing while userspace
threads collect and clear dirty logs independently.

Three new command line options are added:
1. j: Allows to run guest vCPUs and main thread collecting dirty logs
      independently of each other after initialization is complete.
2. k: Allows to clear dirty logs in smaller chunks compared to existing
      whole memslot clear in one call.
3. l: Allows to add customizable wait time between consecutive clear
      dirty log calls to mimic sending dirty memory to destination.

Patch 7-8:
These patches refactor code to move MMU lock operations to arch specific
code, refactor Arm's page table walker APIs, and change MMU write lock
for clearing dirty logs to read lock. Patch 8 has results showing
improvements based on dirty_log_perf_test.

Vipin Sharma (9):
  KVM: selftests: Allow dirty_log_perf_test to clear dirty memory in
    chunks
  KVM: selftests: Add optional delay between consecutive Clear-Dirty-Log
    calls
  KVM: selftests: Pass count of read and write accesses from guest to
    host
  KVM: selftests: Print read and write accesses of pages by vCPUs in
    dirty_log_perf_test
  KVM: selftests: Allow independent execution of vCPUs in
    dirty_log_perf_test
  KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
  KVM: mmu: Move mmu lock/unlock to arch code for clear dirty log
  KMV: arm64: Allow stage2_apply_range_sched() to pass page table walker
    flags
  KVM: arm64: Run clear-dirty-log under MMU read lock

 arch/arm64/include/asm/kvm_pgtable.h          |  17 ++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |   4 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  16 ++-
 arch/arm64/kvm/mmu.c                          |  36 ++++--
 arch/mips/kvm/mmu.c                           |   2 +
 arch/riscv/kvm/mmu.c                          |   2 +
 arch/x86/kvm/mmu/mmu.c                        |   3 +
 .../selftests/kvm/dirty_log_perf_test.c       | 108 ++++++++++++++----
 .../testing/selftests/kvm/include/memstress.h |  13 ++-
 tools/testing/selftests/kvm/lib/memstress.c   |  43 +++++--
 virt/kvm/dirty_ring.c                         |   2 -
 virt/kvm/kvm_main.c                           |   4 -
 12 files changed, 185 insertions(+), 65 deletions(-)


base-commit: 95b9779c1758f03cf494e8550d6249a40089ed1c
-- 
2.40.0.634.g4ca3ef3211-goog


