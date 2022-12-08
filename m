From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:32 -0800
Subject: [RFC PATCH 12/37] KVM: x86/mmu: Use PG_LEVEL_{PTE,PMD,PUD} in the TDP MMU
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-13-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use PG_LEVEL_{PTE,PMD,PUD} in the TDP MMU instead of the x86-specific
PG_LEVEL_{4K,2M,1G} aliases. This prepares for moving the TDP MMU to
common code, where not all architectures will have 4K PAGE_SIZE.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/tdp_iter.h |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c  | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/arch/x86/kvm/mmu/tdp_iter.h
index f0af385c56e0..892c078aab58 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/arch/x86/kvm/mmu/tdp_iter.h
@@ -106,7 +106,7 @@ struct tdp_iter {
 	     tdp_iter_next(&iter))
 
 #define for_each_tdp_pte(iter, root, start, end) \
-	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_4K, start, end)
+	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_PTE, start, end)
 
 tdp_ptep_t spte_to_child_pt(u64 pte, int level);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 4940413d3767..bce0566f2d94 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -347,7 +347,7 @@ static void handle_changed_spte_dirty_log(struct kvm *kvm, int as_id, gfn_t gfn,
 	bool pfn_changed;
 	struct kvm_memory_slot *slot;
 
-	if (level > PG_LEVEL_4K)
+	if (level > PG_LEVEL_PTE)
 		return;
 
 	pfn_changed = spte_to_pfn(old_spte) != spte_to_pfn(new_spte);
@@ -526,7 +526,7 @@ static void __handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
 	bool pfn_changed = spte_to_pfn(old_spte) != spte_to_pfn(new_spte);
 
 	WARN_ON(level > PT64_ROOT_MAX_LEVEL);
-	WARN_ON(level < PG_LEVEL_4K);
+	WARN_ON(level < PG_LEVEL_PTE);
 	WARN_ON(gfn & (KVM_PAGES_PER_HPAGE(level) - 1));
 
 	/*
@@ -897,9 +897,9 @@ static void tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	 * inducing a stall to allow in-place replacement with a 1gb hugepage.
 	 *
 	 * Because zapping a SP recurses on its children, stepping down to
-	 * PG_LEVEL_4K in the iterator itself is unnecessary.
+	 * PG_LEVEL_PTE in the iterator itself is unnecessary.
 	 */
-	__tdp_mmu_zap_root(kvm, root, shared, PG_LEVEL_1G);
+	__tdp_mmu_zap_root(kvm, root, shared, PG_LEVEL_PUD);
 	__tdp_mmu_zap_root(kvm, root, shared, root->role.level);
 
 	rcu_read_unlock();
@@ -944,7 +944,7 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 	rcu_read_lock();
 
-	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_4K, start, end) {
+	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_PTE, start, end) {
 		if (can_yield &&
 		    tdp_mmu_iter_cond_resched(kvm, &iter, flush, false)) {
 			flush = false;
@@ -1303,7 +1303,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	/* Huge pages aren't expected to be modified without first being zapped. */
 	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
 
-	if (iter->level != PG_LEVEL_4K ||
+	if (iter->level != PG_LEVEL_PTE ||
 	    !is_shadow_present_pte(iter->old_spte))
 		return false;
 
@@ -1672,7 +1672,7 @@ static void clear_dirty_pt_masked(struct kvm *kvm, struct kvm_mmu_page *root,
 		if (!mask)
 			break;
 
-		if (iter.level > PG_LEVEL_4K ||
+		if (iter.level > PG_LEVEL_PTE ||
 		    !(mask & (1UL << (iter.gfn - gfn))))
 			continue;
 
@@ -1726,7 +1726,7 @@ static void zap_collapsible_spte_range(struct kvm *kvm,
 
 	rcu_read_lock();
 
-	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_2M, start, end) {
+	for_each_tdp_pte_min_level(iter, root, PG_LEVEL_PMD, start, end) {
 retry:
 		if (tdp_mmu_iter_cond_resched(kvm, &iter, false, true))
 			continue;
-- 
2.39.0.rc1.256.g54fd8350bd-goog


