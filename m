From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:14 -0700
Subject: [PATCH v2 16/16] KVM: arm64: Split huge pages during clear-dirty-log
 under MMU read lock
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-17-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split huge pages under MMU read lock instead of write when clearing
dirty log.

Running huge page split under read lock will unblock vCPUs execution and
allow whole clear-dirty-log operation run parallelly to vCPUs.

Note that splitting huge pages involves two walkers. First walker calls
stage2_split_walker() callback on each huge page. This callback will call
another walker which creates an unlinked page table. This commit makes
first walker as shared page walker which means, -EAGAIN will be retried.
Before this patch, -EAGAIN would have been ignored and walker would go
to next huge page. In practice this would not happen as the first walker
was holding MMU write lock. Inner walker is unchanged as it is working
on unlinked page table so no other thread will have access to it.

To improve confidence in correctness tested via dirty_log_test.

To measure performance improvement tested via dirty_log_perf_test.

Set up:
-------
Host: ARM Ampere Altra host (64 CPUs, 256 GB memory and single NUMA
      node)

Test VM: 48 vCPU, 192 GB total memory.

Ran dirty_log_perf_test for 400 iterations.
 ./dirty_log_perf_test -k 192G -v 48 -b 4G -m 2 -i 4000 -s anonymous_hugetlb_2mb -j

Observation:
------------

+==================+=============================+===================+
| Clear Chunk size | Clear dirty log time change | vCPUs improvement |
+==================+=============================+===================+
| 192GB            | 56%                         | 152%              |
+------------------+-----------------------------+-------------------+
| 1GB              | -81%                        | 72%               |
+------------------+-----------------------------+-------------------+

When larger chunks are used, clear dirty log time increases due to lots
of cmpxchg() but vCPUs are also able to execute parallelly causing
better performance of guest.

When chunk size is small, read lock is very fast in clearing dirty logs
as it is not waiting for MMU write lock and vCPUs are also able to run
parallelly.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6dd964e3682c..aa278f5d27a2 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -126,7 +126,10 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 	int ret, cache_capacity;
 	u64 next, chunk_size;
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
+	if (flags & KVM_PGTABLE_WALK_SHARED)
+		lockdep_assert_held_read(&kvm->mmu_lock);
+	else
+		lockdep_assert_held_write(&kvm->mmu_lock);
 
 	chunk_size = kvm->arch.mmu.split_page_chunk_size;
 	cache_capacity = kvm_mmu_split_nr_page_tables(chunk_size);
@@ -138,13 +141,19 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 
 	do {
 		if (need_split_memcache_topup_or_resched(kvm)) {
-			write_unlock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_unlock(&kvm->mmu_lock);
+			else
+				write_unlock(&kvm->mmu_lock);
 			cond_resched();
 			/* Eager page splitting is best-effort. */
 			ret = __kvm_mmu_topup_memory_cache(cache,
 							   cache_capacity,
 							   cache_capacity);
-			write_lock(&kvm->mmu_lock);
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				read_lock(&kvm->mmu_lock);
+			else
+				write_lock(&kvm->mmu_lock);
 			if (ret)
 				break;
 		}
@@ -1139,9 +1148,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 
 	read_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
-	read_unlock(&kvm->mmu_lock);
 
-	write_lock(&kvm->mmu_lock);
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
 	 * also check for initially-all-set because we can avoid
@@ -1151,8 +1158,8 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	 * again.
 	 */
 	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		kvm_mmu_split_huge_pages(kvm, start, end, 0);
-	write_unlock(&kvm->mmu_lock);
+		kvm_mmu_split_huge_pages(kvm, start, end, KVM_PGTABLE_WALK_SHARED);
+	read_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
-- 
2.41.0.rc0.172.g3f132b7071-goog


