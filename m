From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:27 +0200
Subject: [PATCH 08/12] mm, riscv, arm64: Use common ptep_test_and_clear_young() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-9-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_test_and_clear_young() function from
arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++----------
 arch/arm64/mm/contpte.c          | 25 --------------------
 arch/riscv/include/asm/pgtable.h | 12 ++++++----
 arch/riscv/kvm/mmu.c             |  2 +-
 arch/riscv/mm/pgtable.c          |  2 +-
 include/linux/contpte.h          |  2 ++
 mm/contpte.c                     | 39 ++++++++++++++++++++++++++++++++
 7 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ff7fe1d9cabe..9a8702d1ad00 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1389,8 +1389,6 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
 extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
@@ -1477,16 +1475,8 @@ extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
-static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_test_and_clear_young(vma, addr, ptep);
-
-	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
-}
+extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 5e9e40145085..9bf471633ca4 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -45,31 +45,6 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
 
-int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep)
-{
-	/*
-	 * ptep_clear_flush_young() technically requires us to clear the access
-	 * flag for a _single_ pte. However, the core-mm code actually tracks
-	 * access/dirty per folio, not per page. And since we only create a
-	 * contig range when the range is covered by a single folio, we can get
-	 * away with clearing young for the whole contig range here, so we avoid
-	 * having to unfold.
-	 */
-
-	int young = 0;
-	int i;
-
-	ptep = arch_contpte_align_down(ptep);
-	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-
-	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
-		young |= __ptep_test_and_clear_young(vma, addr, ptep);
-
-	return young;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
-
 int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 					unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 03cd640137ed..d39cb24c6c4a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -739,8 +739,7 @@ static inline void __pte_clear(struct mm_struct *mm,
 
 extern int __ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				   pte_t *ptep, pte_t entry, int dirty);
-#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
-extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
+extern int __ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long address,
 				     pte_t *ptep);
 
 static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
@@ -778,7 +777,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	 * shouldn't really matter because there's no real memory
 	 * pressure for swapout to react to. ]
 	 */
-	return ptep_test_and_clear_young(vma, address, ptep);
+	return __ptep_test_and_clear_young(vma, address, ptep);
 }
 
 #ifdef CONFIG_THP_CONTPTE
@@ -797,6 +796,9 @@ extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
+extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
+				     unsigned long addr, pte_t *ptep);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -806,6 +808,8 @@ extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 #define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
+#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
+#define ptep_test_and_clear_young	__ptep_test_and_clear_young
 
 #endif /* CONFIG_THP_CONTPTE */
 
@@ -987,7 +991,7 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
-	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
+	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1ee6139d495f..554926e33760 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				   &ptep, &ptep_level))
 		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return __ptep_test_and_clear_young(NULL, 0, ptep);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 5756bde9eb42..5f31d0594109 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -18,7 +18,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
 	return true;
 }
 
-int ptep_test_and_clear_young(struct vm_area_struct *vma,
+int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long address,
 			      pte_t *ptep)
 {
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 01da4bfc3af6..38092adbe0d4 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -19,5 +19,7 @@ void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			pte_t *ptep, pte_t pte);
 void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		      pte_t *ptep, pte_t pte, unsigned int nr);
+int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 5bf939639233..220e9d81f401 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -47,6 +47,7 @@
  *   - set_pte()
  *   - pte_clear()
  *   - ptep_get_and_clear()
+ *   - ptep_test_and_clear_young()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -690,4 +691,42 @@ pte_t ptep_get_and_clear(struct mm_struct *mm,
 	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
+
+int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
+				      unsigned long addr, pte_t *ptep)
+{
+	/*
+	 * ptep_clear_flush_young() technically requires us to clear the access
+	 * flag for a _single_ pte. However, the core-mm code actually tracks
+	 * access/dirty per folio, not per page. And since we only create a
+	 * contig range when the range is covered by a single folio, we can get
+	 * away with clearing young for the whole contig range here, so we avoid
+	 * having to unfold.
+	 */
+
+	size_t pgsize;
+	int young = 0;
+	int i, ncontig;
+
+	ptep = arch_contpte_align_down(ptep);
+	ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+	addr = ALIGN_DOWN(addr, ncontig * pgsize);
+
+	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+		young |= __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return young;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_test_and_clear_young);
+
+__always_inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
+					      unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


