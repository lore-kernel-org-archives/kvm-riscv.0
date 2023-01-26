From: David Matlack <dmatlack@google.com>
Date: Thu, 26 Jan 2023 10:40:22 -0800
Subject: [PATCH v2 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
References: <20230126184025.2294823-1-dmatlack@google.com>
Message-ID: <20230126184025.2294823-5-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename kvm_flush_remote_tlbs_with_address() to
kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
number of callsites that need to be broken up across multiple lines, and
more readable since it conveys a range of memory is being flushed rather
than a single address.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 +++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  7 +++----
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b257f937d8a4..215a8b7f5e03 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -247,8 +247,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-		u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
@@ -5826,9 +5825,8 @@ slot_handle_level_range(struct kvm *kvm, const struct kvm_memory_slot *memslot,
 
 		if (need_resched() || rwlock_needbreak(&kvm->mmu_lock)) {
 			if (flush && flush_on_yield) {
-				kvm_flush_remote_tlbs_with_address(kvm,
-						start_gfn,
-						iterator.gfn - start_gfn + 1);
+				kvm_flush_remote_tlbs_range(kvm, start_gfn,
+							    iterator.gfn - start_gfn + 1);
 				flush = false;
 			}
 			cond_resched_rwlock_write(&kvm->mmu_lock);
@@ -6183,8 +6181,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 	}
 
 	if (flush)
-		kvm_flush_remote_tlbs_with_address(kvm, gfn_start,
-						   gfn_end - gfn_start);
+		kvm_flush_remote_tlbs_range(kvm, gfn_start, gfn_end - gfn_start);
 
 	kvm_mmu_invalidate_end(kvm, 0, -1ul);
 
@@ -6573,8 +6570,7 @@ void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
 	 * is observed by any other operation on the same memslot.
 	 */
 	lockdep_assert_held(&kvm->slots_lock);
-	kvm_flush_remote_tlbs_with_address(kvm, memslot->base_gfn,
-					   memslot->npages);
+	kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
 }
 
 void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index cc58631e2336..3bb21d29d84c 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,14 +170,13 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
-					u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
 
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
-	kvm_flush_remote_tlbs_with_address(kvm, gfn_round_for_level(gfn, level),
-					   KVM_PAGES_PER_HPAGE(level));
+	kvm_flush_remote_tlbs_range(kvm, gfn_round_for_level(gfn, level),
+				    KVM_PAGES_PER_HPAGE(level));
 }
 
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
-- 
2.39.1.456.gfc5497dd1b-goog


