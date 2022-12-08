From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:25 -0800
Subject: [RFC PATCH 05/37] KVM: x86/mmu: Unify TDP MMU and Shadow MMU root refcounts
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-6-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the same field for refcounting roots in the TDP MMU and Shadow MMU.
The atomicity provided by refcount_t is overkill for the Shadow MMU,
since it holds the write-lock. But converging this field will enable a
future commit to more easily move struct kvm_mmu_page to common code.

Note, refcount_dec_and_test() returns true if the resulting refcount is
0. Hence the check in mmu_free_root_page() is inverted to check if
shadow root refcount is 0.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 +++++++-------
 arch/x86/kvm/mmu/mmu_internal.h |  6 ++----
 arch/x86/kvm/mmu/mmutrace.h     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  8 ++++----
 arch/x86/kvm/mmu/tdp_mmu.h      |  2 +-
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f7668a32721d..11cef930d5ed 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2498,14 +2498,14 @@ static bool __kvm_mmu_prepare_zap_page(struct kvm *kvm,
 
 	if (sp->unsync)
 		kvm_unlink_unsync_page(kvm, sp);
-	if (!sp->root_count) {
+	if (!refcount_read(&sp->root_refcount)) {
 		/* Count self */
 		(*nr_zapped)++;
 
 		/*
 		 * Already invalid pages (previously active roots) are not on
 		 * the active page list.  See list_del() in the "else" case of
-		 * !sp->root_count.
+		 * !sp->root_refcount.
 		 */
 		if (sp->role.invalid)
 			list_add(&sp->link, invalid_list);
@@ -2515,7 +2515,7 @@ static bool __kvm_mmu_prepare_zap_page(struct kvm *kvm,
 	} else {
 		/*
 		 * Remove the active root from the active page list, the root
-		 * will be explicitly freed when the root_count hits zero.
+		 * will be explicitly freed when the root_refcount hits zero.
 		 */
 		list_del(&sp->link);
 
@@ -2570,7 +2570,7 @@ static void kvm_mmu_commit_zap_page(struct kvm *kvm,
 	kvm_flush_remote_tlbs(kvm);
 
 	list_for_each_entry_safe(sp, nsp, invalid_list, link) {
-		WARN_ON(!sp->role.invalid || sp->root_count);
+		WARN_ON(!sp->role.invalid || refcount_read(&sp->root_refcount));
 		kvm_mmu_free_shadow_page(sp);
 	}
 }
@@ -2593,7 +2593,7 @@ static unsigned long kvm_mmu_zap_oldest_mmu_pages(struct kvm *kvm,
 		 * Don't zap active root pages, the page itself can't be freed
 		 * and zapping it will just force vCPUs to realloc and reload.
 		 */
-		if (sp->root_count)
+		if (refcount_read(&sp->root_refcount))
 			continue;
 
 		unstable = __kvm_mmu_prepare_zap_page(kvm, sp, &invalid_list,
@@ -3481,7 +3481,7 @@ static void mmu_free_root_page(struct kvm *kvm, hpa_t *root_hpa,
 
 	if (is_tdp_mmu_page(sp))
 		kvm_tdp_mmu_put_root(kvm, sp, false);
-	else if (!--sp->root_count && sp->role.invalid)
+	else if (refcount_dec_and_test(&sp->root_refcount) && sp->role.invalid)
 		kvm_mmu_prepare_zap_page(kvm, sp, invalid_list);
 
 	*root_hpa = INVALID_PAGE;
@@ -3592,7 +3592,7 @@ static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
 	WARN_ON_ONCE(role.arch.direct && role.arch.has_4_byte_gpte);
 
 	sp = kvm_mmu_get_shadow_page(vcpu, gfn, role);
-	++sp->root_count;
+	refcount_inc(&sp->root_refcount);
 
 	return __pa(sp->spt);
 }
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c1a379fba24d..fd4990c8b0e9 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -87,10 +87,8 @@ struct kvm_mmu_page {
 	u64 *shadowed_translation;
 
 	/* Currently serving as active root */
-	union {
-		int root_count;
-		refcount_t tdp_mmu_root_count;
-	};
+	refcount_t root_refcount;
+
 	unsigned int unsync_children;
 	union {
 		struct kvm_rmap_head parent_ptes; /* rmap pointers to parent sptes */
diff --git a/arch/x86/kvm/mmu/mmutrace.h b/arch/x86/kvm/mmu/mmutrace.h
index 6a4a43b90780..ffd10ce3eae3 100644
--- a/arch/x86/kvm/mmu/mmutrace.h
+++ b/arch/x86/kvm/mmu/mmutrace.h
@@ -19,7 +19,7 @@
 	__entry->mmu_valid_gen = sp->mmu_valid_gen;	\
 	__entry->gfn = sp->gfn;				\
 	__entry->role = sp->role.word;			\
-	__entry->root_count = sp->root_count;		\
+	__entry->root_count = refcount_read(&sp->root_refcount);	\
 	__entry->unsync = sp->unsync;
 
 #define KVM_MMU_PAGE_PRINTK() ({				        \
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index fc0b87ceb1ea..34d674080170 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -130,7 +130,7 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
 {
 	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
 
-	if (!refcount_dec_and_test(&root->tdp_mmu_root_count))
+	if (!refcount_dec_and_test(&root->root_refcount))
 		return;
 
 	/*
@@ -158,7 +158,7 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	 * zap the root because a root cannot go from invalid to valid.
 	 */
 	if (!kvm_tdp_root_mark_invalid(root)) {
-		refcount_set(&root->tdp_mmu_root_count, 1);
+		refcount_set(&root->root_refcount, 1);
 
 		/*
 		 * Zapping the root in a worker is not just "nice to have";
@@ -316,7 +316,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
 	root = tdp_mmu_alloc_sp(vcpu);
 	tdp_mmu_init_sp(root, NULL, 0, role);
 
-	refcount_set(&root->tdp_mmu_root_count, 1);
+	refcount_set(&root->root_refcount, 1);
 
 	spin_lock(&kvm->arch.tdp_mmu_pages_lock);
 	list_add_rcu(&root->link, &kvm->arch.tdp_mmu_roots);
@@ -883,7 +883,7 @@ static void tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	 * and lead to use-after-free as zapping a SPTE triggers "writeback" of
 	 * dirty accessed bits to the SPTE's associated struct page.
 	 */
-	WARN_ON_ONCE(!refcount_read(&root->tdp_mmu_root_count));
+	WARN_ON_ONCE(!refcount_read(&root->root_refcount));
 
 	kvm_lockdep_assert_mmu_lock_held(kvm, shared);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 18d3719f14ea..19d3153051a3 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -14,7 +14,7 @@ hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu);
 
 __must_check static inline bool kvm_tdp_mmu_get_root(struct kvm_mmu_page *root)
 {
-	return refcount_inc_not_zero(&root->tdp_mmu_root_count);
+	return refcount_inc_not_zero(&root->root_refcount);
 }
 
 void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
-- 
2.39.0.rc1.256.g54fd8350bd-goog


