From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:36 -0800
Subject: [RFC PATCH 16/37] KVM: x86/mmu: Abstract away TDP MMU root lookup
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-17-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Abstract the code that looks up the TDP MMU root from vcpu->arch.mmu
behind a function, tdp_mmu_root(). This will be used in a future commit
to allow the TDP MMU to be moved to common code, where vcpu->arch.mmu
cannot be accessed directly.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm/tdp_pgtable.h |  2 ++
 arch/x86/kvm/mmu/tdp_mmu.c             | 17 +++++++----------
 arch/x86/kvm/mmu/tdp_pgtable.c         |  5 +++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm/tdp_pgtable.h b/arch/x86/include/asm/kvm/tdp_pgtable.h
index cebc4bc44b49..c5c4e4cab24a 100644
--- a/arch/x86/include/asm/kvm/tdp_pgtable.h
+++ b/arch/x86/include/asm/kvm/tdp_pgtable.h
@@ -5,6 +5,8 @@
 #include <linux/types.h>
 #include <linux/kvm_types.h>
 
+struct kvm_mmu_page *tdp_mmu_root(struct kvm_vcpu *vcpu);
+
 /*
  * Use a semi-arbitrary value that doesn't set RWX bits, i.e. is not-present on
  * both AMD and Intel CPUs, and doesn't set PFN bits, i.e. doesn't create a L1TF
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index fea42bbac984..8155a9e79203 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -788,9 +788,6 @@ static inline void tdp_mmu_set_spte_no_dirty_log(struct kvm *kvm,
 			continue;					\
 		else
 
-#define tdp_mmu_for_each_pte(_iter, _mmu, _start, _end)		\
-	for_each_tdp_pte(_iter, to_shadow_page(_mmu->root.hpa), _start, _end)
-
 /*
  * Yield if the MMU lock is contended or this thread needs to return control
  * to the scheduler.
@@ -1145,7 +1142,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
  */
 int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct kvm *kvm = vcpu->kvm;
 	struct tdp_iter iter;
 	struct kvm_mmu_page *sp;
@@ -1157,7 +1154,7 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 
 	rcu_read_lock();
 
-	tdp_mmu_for_each_pte(iter, mmu, fault->gfn, fault->gfn + 1) {
+	for_each_tdp_pte(iter, root, fault->gfn, fault->gfn + 1) {
 		int r;
 
 		if (fault->arch.nx_huge_page_workaround_enabled)
@@ -1826,14 +1823,14 @@ bool kvm_tdp_mmu_write_protect_gfn(struct kvm *kvm,
 int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 			 int *root_level)
 {
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct tdp_iter iter;
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	gfn_t gfn = addr >> PAGE_SHIFT;
 	int leaf = -1;
 
-	*root_level = vcpu->arch.mmu->root_role.level;
+	*root_level = root->role.level;
 
-	tdp_mmu_for_each_pte(iter, mmu, gfn, gfn + 1) {
+	for_each_tdp_pte(iter, root, gfn, gfn + 1) {
 		leaf = iter.level;
 		sptes[leaf] = iter.old_spte;
 	}
@@ -1855,12 +1852,12 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte)
 {
+	struct kvm_mmu_page *root = tdp_mmu_root(vcpu);
 	struct tdp_iter iter;
-	struct kvm_mmu *mmu = vcpu->arch.mmu;
 	gfn_t gfn = addr >> PAGE_SHIFT;
 	tdp_ptep_t sptep = NULL;
 
-	tdp_mmu_for_each_pte(iter, mmu, gfn, gfn + 1) {
+	for_each_tdp_pte(iter, root, gfn, gfn + 1) {
 		*spte = iter.old_spte;
 		sptep = iter.sptep;
 	}
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index cf3b692d8e21..97cc900e8818 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -13,6 +13,11 @@ static_assert(TDP_PTE_WRITABLE_MASK == PT_WRITABLE_MASK);
 static_assert(TDP_PTE_HUGE_PAGE_MASK == PT_PAGE_SIZE_MASK);
 static_assert(TDP_PTE_PRESENT_MASK == SPTE_MMU_PRESENT_MASK);
 
+struct kvm_mmu_page *tdp_mmu_root(struct kvm_vcpu *vcpu)
+{
+	return to_shadow_page(vcpu->arch.mmu->root.hpa);
+}
+
 bool tdp_pte_is_accessed(u64 pte)
 {
 	return is_accessed_spte(pte);
-- 
2.39.0.rc1.256.g54fd8350bd-goog


