From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:55 -0800
Subject: [RFC PATCH 35/37] KVM: x86/mmu: Move tdp_mmu_max_gfn_exclusive() to tdp_pgtable.c
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-36-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move tdp_mmu_max_gfn_exclusive() to tdp_pgtable.c since it currently
relies on the x86-specific kvm_mmu_max_gfn() function. This can be
improved in the future by implementing a common API for calculating the
max GFN.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm/tdp_pgtable.h |  3 +++
 arch/x86/kvm/mmu/tdp_mmu.c             | 11 -----------
 arch/x86/kvm/mmu/tdp_pgtable.c         | 11 +++++++++++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm/tdp_pgtable.h b/arch/x86/include/asm/kvm/tdp_pgtable.h
index ff2691ced38b..c1047fcf1a91 100644
--- a/arch/x86/include/asm/kvm/tdp_pgtable.h
+++ b/arch/x86/include/asm/kvm/tdp_pgtable.h
@@ -67,4 +67,7 @@ u64 tdp_mmu_make_changed_pte_notifier_pte(struct tdp_iter *iter,
 					  struct kvm_gfn_range *range);
 u64 tdp_mmu_make_huge_page_split_pte(struct kvm *kvm, u64 huge_spte,
 				     struct kvm_mmu_page *sp, int index);
+
+gfn_t tdp_mmu_max_gfn_exclusive(void);
+
 #endif /* !__ASM_KVM_TDP_PGTABLE_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c035c051161c..c950d688afea 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -828,17 +828,6 @@ static inline bool __must_check tdp_mmu_iter_cond_resched(struct kvm *kvm,
 	return iter->yielded;
 }
 
-static inline gfn_t tdp_mmu_max_gfn_exclusive(void)
-{
-	/*
-	 * Bound TDP MMU walks at host.MAXPHYADDR.  KVM disallows memslots with
-	 * a gpa range that would exceed the max gfn, and KVM does not create
-	 * MMIO SPTEs for "impossible" gfns, instead sending such accesses down
-	 * the slow emulation path every time.
-	 */
-	return kvm_mmu_max_gfn() + 1;
-}
-
 static void __tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
 			       bool shared, int zap_level)
 {
diff --git a/arch/x86/kvm/mmu/tdp_pgtable.c b/arch/x86/kvm/mmu/tdp_pgtable.c
index fb40abdb9234..4e747956d6ee 100644
--- a/arch/x86/kvm/mmu/tdp_pgtable.c
+++ b/arch/x86/kvm/mmu/tdp_pgtable.c
@@ -170,3 +170,14 @@ int tdp_mmu_max_mapping_level(struct kvm *kvm,
 {
 	return kvm_mmu_max_mapping_level(kvm, slot, iter->gfn, PG_LEVEL_NUM);
 }
+
+gfn_t tdp_mmu_max_gfn_exclusive(void)
+{
+	/*
+	 * Bound TDP MMU walks at host.MAXPHYADDR.  KVM disallows memslots with
+	 * a gpa range that would exceed the max gfn, and KVM does not create
+	 * MMIO SPTEs for "impossible" gfns, instead sending such accesses down
+	 * the slow emulation path every time.
+	 */
+	return kvm_mmu_max_gfn() + 1;
+}
-- 
2.39.0.rc1.256.g54fd8350bd-goog


