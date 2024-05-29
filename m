From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 18:05:08 +0000
Subject: [PATCH v4 5/7] KVM: x86: Relax locking for kvm_test_age_gfn and kvm_age_gfn
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
Message-ID: <20240529180510.2295118-6-jthoughton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Walk the TDP MMU in an RCU read-side critical section. This requires a
way to do RCU-safe walking of the tdp_mmu_roots; do this with a new
macro. The PTE modifications are now done atomically, and
kvm_tdp_mmu_spte_need_atomic_write() has been updated to account for the
fact that kvm_age_gfn can now lockless update the accessed bit and the
R/X bits).

If the cmpxchg for marking the spte for access tracking fails, we simply
retry if the spte is still a leaf PTE. If it isn't, we return false
to continue the walk.

Harvesting age information from the shadow MMU is still done while
holding the MMU write lock.

Suggested-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/mmu.c          | 18 ++++-----
 arch/x86/kvm/mmu/tdp_iter.h     | 27 +++++++------
 arch/x86/kvm/mmu/tdp_mmu.c      | 67 +++++++++++++++++++++++++--------
 4 files changed, 76 insertions(+), 37 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ece45b3f6f20..48fb29bb782f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1438,6 +1438,7 @@ struct kvm_arch {
 	 * tdp_mmu_page set.
 	 *
 	 * For reads, this list is protected by:
+	 *	RCU alone or
 	 *	the MMU lock in read mode + RCU or
 	 *	the MMU lock in write mode
 	 *
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6a2a557c2c31..956834da8a0e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1630,16 +1630,15 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
-
-	if (kvm_memslots_have_rmaps(kvm))
+	if (kvm_memslots_have_rmaps(kvm)) {
+		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
+		write_unlock(&kvm->mmu_lock);
+	}
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
 
-	write_unlock(&kvm->mmu_lock);
-
 	return young;
 }
 
@@ -1647,16 +1646,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
-
-	if (kvm_memslots_have_rmaps(kvm))
+	if (kvm_memslots_have_rmaps(kvm)) {
+		write_lock(&kvm->mmu_lock);
 		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
+		write_unlock(&kvm->mmu_lock);
+	}
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
 
-	write_unlock(&kvm->mmu_lock);
-
 	return young;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/arch/x86/kvm/mmu/tdp_iter.h
index fae559559a80..f558ae9054af 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/arch/x86/kvm/mmu/tdp_iter.h
@@ -24,16 +24,24 @@ static inline u64 kvm_tdp_mmu_write_spte_atomic(tdp_ptep_t sptep, u64 new_spte)
 	return xchg(rcu_dereference(sptep), new_spte);
 }
 
+static inline u64 tdp_mmu_clear_spte_bits_atomic(tdp_ptep_t sptep, u64 mask)
+{
+	atomic64_t *sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
+
+	return (u64)atomic64_fetch_and(~mask, sptep_atomic);
+}
+
 static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
 {
 	WRITE_ONCE(*rcu_dereference(sptep), new_spte);
 }
 
 /*
- * SPTEs must be modified atomically if they are shadow-present, leaf
- * SPTEs, and have volatile bits, i.e. has bits that can be set outside
- * of mmu_lock.  The Writable bit can be set by KVM's fast page fault
- * handler, and Accessed and Dirty bits can be set by the CPU.
+ * SPTEs must be modified atomically if they have bits that can be set outside
+ * of the mmu_lock. This can happen for any shadow-present leaf SPTEs, as the
+ * Writable bit can be set by KVM's fast page fault handler, the Accessed and
+ * Dirty bits can be set by the CPU, and the Accessed and R/X bits can be
+ * cleared by age_gfn_range.
  *
  * Note, non-leaf SPTEs do have Accessed bits and those bits are
  * technically volatile, but KVM doesn't consume the Accessed bit of
@@ -44,8 +52,7 @@ static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
 static inline bool kvm_tdp_mmu_spte_need_atomic_write(u64 old_spte, int level)
 {
 	return is_shadow_present_pte(old_spte) &&
-	       is_last_spte(old_spte, level) &&
-	       spte_has_volatile_bits(old_spte);
+	       is_last_spte(old_spte, level);
 }
 
 static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
@@ -61,12 +68,8 @@ static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
 static inline u64 tdp_mmu_clear_spte_bits(tdp_ptep_t sptep, u64 old_spte,
 					  u64 mask, int level)
 {
-	atomic64_t *sptep_atomic;
-
-	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level)) {
-		sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
-		return (u64)atomic64_fetch_and(~mask, sptep_atomic);
-	}
+	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level))
+		return tdp_mmu_clear_spte_bits_atomic(sptep, mask);
 
 	__kvm_tdp_mmu_write_spte(sptep, old_spte & ~mask);
 	return old_spte;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 1259dd63defc..c74b0221dae0 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -29,6 +29,11 @@ static __always_inline bool kvm_lockdep_assert_mmu_lock_held(struct kvm *kvm,
 
 	return true;
 }
+static __always_inline bool kvm_lockdep_assert_rcu_read_lock_held(void)
+{
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return true;
+}
 
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
 {
@@ -178,6 +183,15 @@ static struct kvm_mmu_page *tdp_mmu_next_root(struct kvm *kvm,
 		     ((_only_valid) && (_root)->role.invalid))) {		\
 		} else
 
+/*
+ * Iterate over all TDP MMU roots in an RCU read-side critical section.
+ */
+#define for_each_tdp_mmu_root_rcu(_kvm, _root, _as_id)				\
+	list_for_each_entry_rcu(_root, &_kvm->arch.tdp_mmu_roots, link)		\
+		if (kvm_lockdep_assert_rcu_read_lock_held() &&			\
+		    (_as_id >= 0 && kvm_mmu_page_as_id(_root) != _as_id)) {	\
+		} else
+
 #define for_each_tdp_mmu_root(_kvm, _root, _as_id)			\
 	__for_each_tdp_mmu_root(_kvm, _root, _as_id, false)
 
@@ -1223,6 +1237,27 @@ static __always_inline bool kvm_tdp_mmu_handle_gfn(struct kvm *kvm,
 	return ret;
 }
 
+static __always_inline bool kvm_tdp_mmu_handle_gfn_lockless(
+		struct kvm *kvm,
+		struct kvm_gfn_range *range,
+		tdp_handler_t handler)
+{
+	struct kvm_mmu_page *root;
+	struct tdp_iter iter;
+	bool ret = false;
+
+	rcu_read_lock();
+
+	for_each_tdp_mmu_root_rcu(kvm, root, range->slot->as_id) {
+		tdp_root_for_each_leaf_pte(iter, root, range->start, range->end)
+			ret |= handler(kvm, &iter, range);
+	}
+
+	rcu_read_unlock();
+
+	return ret;
+}
+
 /*
  * Mark the SPTEs range of GFNs [start, end) unaccessed and return non-zero
  * if any of the GFNs in the range have been accessed.
@@ -1236,28 +1271,30 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
 {
 	u64 new_spte;
 
+retry:
 	/* If we have a non-accessed entry we don't need to change the pte. */
 	if (!is_accessed_spte(iter->old_spte))
 		return false;
 
 	if (spte_ad_enabled(iter->old_spte)) {
-		iter->old_spte = tdp_mmu_clear_spte_bits(iter->sptep,
-							 iter->old_spte,
-							 shadow_accessed_mask,
-							 iter->level);
+		iter->old_spte = tdp_mmu_clear_spte_bits_atomic(iter->sptep,
+						shadow_accessed_mask);
 		new_spte = iter->old_spte & ~shadow_accessed_mask;
 	} else {
-		/*
-		 * Capture the dirty status of the page, so that it doesn't get
-		 * lost when the SPTE is marked for access tracking.
-		 */
+		new_spte = mark_spte_for_access_track(iter->old_spte);
+		if (__tdp_mmu_set_spte_atomic(iter, new_spte)) {
+			/*
+			 * The cmpxchg failed. If the spte is still a
+			 * last-level spte, we can safely retry.
+			 */
+			if (is_shadow_present_pte(iter->old_spte) &&
+			    is_last_spte(iter->old_spte, iter->level))
+				goto retry;
+			/* Otherwise, continue walking. */
+			return false;
+		}
 		if (is_writable_pte(iter->old_spte))
 			kvm_set_pfn_dirty(spte_to_pfn(iter->old_spte));
-
-		new_spte = mark_spte_for_access_track(iter->old_spte);
-		iter->old_spte = kvm_tdp_mmu_write_spte(iter->sptep,
-							iter->old_spte, new_spte,
-							iter->level);
 	}
 
 	trace_kvm_tdp_mmu_spte_changed(iter->as_id, iter->gfn, iter->level,
@@ -1267,7 +1304,7 @@ static bool age_gfn_range(struct kvm *kvm, struct tdp_iter *iter,
 
 bool kvm_tdp_mmu_age_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm_tdp_mmu_handle_gfn(kvm, range, age_gfn_range);
+	return kvm_tdp_mmu_handle_gfn_lockless(kvm, range, age_gfn_range);
 }
 
 static bool test_age_gfn(struct kvm *kvm, struct tdp_iter *iter,
@@ -1278,7 +1315,7 @@ static bool test_age_gfn(struct kvm *kvm, struct tdp_iter *iter,
 
 bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
+	return kvm_tdp_mmu_handle_gfn_lockless(kvm, range, test_age_gfn);
 }
 
 /*
-- 
2.45.1.288.g0e0cd299f1-goog


