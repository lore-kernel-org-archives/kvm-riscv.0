From: David Matlack <dmatlack@google.com>
Date: Fri,  1 Apr 2022 17:55:40 +0000
Subject: [PATCH v3 09/23] KVM: x86/mmu: Move huge page split sp allocation
 code to mmu.c
In-Reply-To: <20220401175554.1931568-1-dmatlack@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
Message-ID: <20220401175554.1931568-10-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the code that allocates a new shadow page for splitting huge pages
into mmu.c. Currently this code is only used by the TDP MMU but it will
be reused in subsequent commits to also split huge pages mapped by the
shadow MMU. Move the GFP flags calculation down into the allocation code
so that it does not have to be duplicated when the shadow MMU needs to
start allocating SPs for splitting.

Preemptively split out the gfp flags calculation to a separate helpers
for use in a subsequent commit that adds support for eager page
splitting to the shadow MMU.

No functional change intended.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 37 +++++++++++++++++++++++++++++++++
 arch/x86/kvm/mmu/mmu_internal.h |  2 ++
 arch/x86/kvm/mmu/tdp_mmu.c      | 34 ++----------------------------
 3 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 421fcbc97f9e..657c2a906c12 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1722,6 +1722,43 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
 	return sp;
 }
 
+static inline gfp_t gfp_flags_for_split(bool locked)
+{
+	/*
+	 * If under the MMU lock, use GFP_NOWAIT to avoid direct reclaim (which
+	 * is slow) and to avoid making any filesystem callbacks (which can end
+	 * up invoking KVM MMU notifiers, resulting in a deadlock).
+	 */
+	return (locked ? GFP_NOWAIT : GFP_KERNEL) | __GFP_ACCOUNT;
+}
+
+/*
+ * Allocate a new shadow page, potentially while holding the MMU lock.
+ *
+ * Huge page splitting always uses direct shadow pages since the huge page is
+ * being mapped directly with a lower level page table. Thus there's no need to
+ * allocate the gfns array.
+ */
+struct kvm_mmu_page *kvm_mmu_alloc_direct_sp_for_split(bool locked)
+{
+	gfp_t gfp = gfp_flags_for_split(locked) | __GFP_ZERO;
+	struct kvm_mmu_page *sp;
+
+	sp = kmem_cache_alloc(mmu_page_header_cache, gfp);
+	if (!sp)
+		return NULL;
+
+	sp->spt = (void *)__get_free_page(gfp);
+	if (!sp->spt) {
+		kmem_cache_free(mmu_page_header_cache, sp);
+		return NULL;
+	}
+
+	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
+
+	return sp;
+}
+
 static void mark_unsync(u64 *spte);
 static void kvm_mmu_mark_parents_unsync(struct kvm_mmu_page *sp)
 {
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 1bff453f7cbe..a0648e7ddd33 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -171,4 +171,6 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 void unaccount_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
+struct kvm_mmu_page *kvm_mmu_alloc_direct_sp_for_split(bool locked);
+
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 17354e55735f..34e581bcaaf6 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1418,43 +1418,13 @@ bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 	return spte_set;
 }
 
-static struct kvm_mmu_page *__tdp_mmu_alloc_sp_for_split(gfp_t gfp)
-{
-	struct kvm_mmu_page *sp;
-
-	gfp |= __GFP_ZERO;
-
-	sp = kmem_cache_alloc(mmu_page_header_cache, gfp);
-	if (!sp)
-		return NULL;
-
-	sp->spt = (void *)__get_free_page(gfp);
-	if (!sp->spt) {
-		kmem_cache_free(mmu_page_header_cache, sp);
-		return NULL;
-	}
-
-	set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
-
-	return sp;
-}
-
 static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct kvm *kvm,
 						       struct tdp_iter *iter,
 						       bool shared)
 {
 	struct kvm_mmu_page *sp;
 
-	/*
-	 * Since we are allocating while under the MMU lock we have to be
-	 * careful about GFP flags. Use GFP_NOWAIT to avoid blocking on direct
-	 * reclaim and to avoid making any filesystem callbacks (which can end
-	 * up invoking KVM MMU notifiers, resulting in a deadlock).
-	 *
-	 * If this allocation fails we drop the lock and retry with reclaim
-	 * allowed.
-	 */
-	sp = __tdp_mmu_alloc_sp_for_split(GFP_NOWAIT | __GFP_ACCOUNT);
+	sp = kvm_mmu_alloc_direct_sp_for_split(true);
 	if (sp)
 		return sp;
 
@@ -1466,7 +1436,7 @@ static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct kvm *kvm,
 		write_unlock(&kvm->mmu_lock);
 
 	iter->yielded = true;
-	sp = __tdp_mmu_alloc_sp_for_split(GFP_KERNEL_ACCOUNT);
+	sp = kvm_mmu_alloc_direct_sp_for_split(false);
 
 	if (shared)
 		read_lock(&kvm->mmu_lock);
-- 
2.35.1.1094.g7c7d902a7c-goog


