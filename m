From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:30 +0200
Subject: [PATCH 11/12] mm, riscv, arm64: Use common ptep_set_wrprotect()/wrprotect_ptes() functions
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-12-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_set_wrprotect()/wrprotect_ptes()
function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 56 ++++++------------------
 arch/arm64/mm/contpte.c          | 18 --------
 arch/riscv/include/asm/pgtable.h | 25 +++++++++--
 include/linux/contpte.h          |  2 +
 mm/contpte.c                     | 75 +++++++++++++++++++++++++++++++-
 5 files changed, 110 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6591aab11c67..162efd9647dd 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1208,7 +1208,11 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
+/*
+ * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
+ * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
+ */
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
 					unsigned long address, pte_t *ptep,
 					pte_t pte)
 {
@@ -1222,23 +1226,13 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
-/*
- * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
- * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
- */
-static inline void __ptep_set_wrprotect(struct mm_struct *mm,
-					unsigned long address, pte_t *ptep)
-{
-	___ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
-}
-
 static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
 				pte_t *ptep, unsigned int nr)
 {
 	unsigned int i;
 
 	for (i = 0; i < nr; i++, address += PAGE_SIZE, ptep++)
-		__ptep_set_wrprotect(mm, address, ptep);
+		__ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -1246,7 +1240,7 @@ static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
 static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pmd_t *pmdp)
 {
-	__ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
+	__ptep_set_wrprotect(mm, address, (pte_t *)pmdp, __ptep_get((pte_t *)pmdp));
 }
 
 #define pmdp_establish pmdp_establish
@@ -1389,8 +1383,6 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
-				pte_t *ptep, unsigned int nr);
 
 #define pte_batch_hint pte_batch_hint
 static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
@@ -1478,35 +1470,12 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep);
 
 #define wrprotect_ptes wrprotect_ptes
-static __always_inline void wrprotect_ptes(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep, unsigned int nr)
-{
-	if (likely(nr == 1)) {
-		/*
-		 * Optimization: wrprotect_ptes() can only be called for present
-		 * ptes so we only need to check contig bit as condition for
-		 * unfold, and we can remove the contig bit from the pte we read
-		 * to avoid re-reading. This speeds up fork() which is sensitive
-		 * for order-0 folios. Equivalent to contpte_try_unfold().
-		 */
-		pte_t orig_pte = __ptep_get(ptep);
-
-		if (unlikely(pte_cont(orig_pte))) {
-			__contpte_try_unfold(mm, addr, ptep, orig_pte);
-			orig_pte = pte_mknoncont(orig_pte);
-		}
-		___ptep_set_wrprotect(mm, addr, ptep, orig_pte);
-	} else {
-		contpte_wrprotect_ptes(mm, addr, ptep, nr);
-	}
-}
+extern void wrprotect_ptes(struct mm_struct *mm,
+			   unsigned long addr, pte_t *ptep, unsigned int nr);
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	wrprotect_ptes(mm, addr, ptep, 1);
-}
+extern void ptep_set_wrprotect(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
@@ -1528,7 +1497,8 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young			__ptep_clear_flush_young
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-#define ptep_set_wrprotect			__ptep_set_wrprotect
+#define ptep_set_wrprotect(mm, addr, ptep)					\
+			__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep))
 #define wrprotect_ptes				__wrprotect_ptes
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags			__ptep_set_access_flags
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 5675a61452ac..1cef93b15d6e 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -44,21 +44,3 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 	return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
-
-void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
-					pte_t *ptep, unsigned int nr)
-{
-	/*
-	 * If wrprotecting an entire contig range, we can avoid unfolding. Just
-	 * set wrprotect and wait for the later mmu_gather flush to invalidate
-	 * the tlb. Until the flush, the page may or may not be wrprotected.
-	 * After the flush, it is guaranteed wrprotected. If it's a partial
-	 * range though, we must unfold, because we can't have a case where
-	 * CONT_PTE is set but wrprotect applies to a subset of the PTEs; this
-	 * would cause it to continue to be unpredictable after the flush.
-	 */
-
-	contpte_try_unfold_partial(mm, addr, ptep, nr);
-	__wrprotect_ptes(mm, addr, ptep, nr);
-}
-EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b151a5aa4de8..728f31da5e6a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -755,11 +755,21 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 }
 
 static inline void __ptep_set_wrprotect(struct mm_struct *mm,
-					unsigned long address, pte_t *ptep)
+					unsigned long address, pte_t *ptep,
+					pte_t pte)
 {
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
 
+static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
+				    pte_t *ptep, unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++, address += PAGE_SIZE, ptep++)
+		__ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
+}
+
 static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
 					   unsigned long address, pte_t *ptep)
 {
@@ -807,6 +817,12 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
 				 pte_t entry, int dirty);
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+extern void ptep_set_wrprotect(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep);
+extern void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			   pte_t *ptep, unsigned int nr);
+#define wrprotect_ptes	wrprotect_ptes
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -822,12 +838,13 @@ extern int ptep_set_access_flags(struct vm_area_struct *vma,
 #define ptep_clear_flush_young	__ptep_clear_flush_young
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+#define ptep_set_wrprotect(mm, addr, ptep)					\
+			__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep))
+#define wrprotect_ptes		__wrprotect_ptes
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-#define ptep_set_wrprotect	__ptep_set_wrprotect
-
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 76244b0c678a..d1439db1706c 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -26,5 +26,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep,
 				  pte_t entry, int dirty);
+void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 9cbbff1f67ad..fe36b6b1d20a 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -49,6 +49,8 @@
  *   - ptep_get_and_clear()
  *   - ptep_test_and_clear_young()
  *   - ptep_clear_flush_young()
+ *   - wrprotect_ptes()
+ *   - ptep_set_wrprotect()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -266,7 +268,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	pte_t pte;
 
 	if (!pte_cont(__ptep_get(ptep))) {
-		__ptep_set_wrprotect(mm, addr, ptep);
+		__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep));
 		return;
 	}
 
@@ -832,4 +834,75 @@ __always_inline int ptep_set_access_flags(struct vm_area_struct *vma,
 
 	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
 }
+
+static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
+				       pte_t *ptep, unsigned int nr)
+{
+	/*
+	 * Unfold any partially covered contpte block@the beginning and end
+	 * of the range.
+	 */
+	size_t pgsize;
+	int ncontig;
+
+	ncontig = arch_contpte_get_num_contig(mm, addr, ptep, 0, &pgsize);
+
+	if (ptep != arch_contpte_align_down(ptep) || nr < ncontig)
+		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+
+	if (ptep + nr != arch_contpte_align_down(ptep + nr)) {
+		unsigned long last_addr = addr + pgsize * (nr - 1);
+		pte_t *last_ptep = ptep + nr - 1;
+
+		contpte_try_unfold(mm, last_addr, last_ptep,
+				   __ptep_get(last_ptep));
+	}
+}
+
+void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr)
+{
+	/*
+	 * If wrprotecting an entire contig range, we can avoid unfolding. Just
+	 * set wrprotect and wait for the later mmu_gather flush to invalidate
+	 * the tlb. Until the flush, the page may or may not be wrprotected.
+	 * After the flush, it is guaranteed wrprotected. If it's a partial
+	 * range though, we must unfold, because we can't have a case where
+	 * CONT_PTE is set but wrprotect applies to a subset of the PTEs; this
+	 * would cause it to continue to be unpredictable after the flush.
+	 */
+
+	contpte_try_unfold_partial(mm, addr, ptep, nr);
+	__wrprotect_ptes(mm, addr, ptep, nr);
+}
+EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
+
+__always_inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, unsigned int nr)
+{
+	if (likely(nr == 1)) {
+		/*
+		 * Optimization: wrprotect_ptes() can only be called for present
+		 * ptes so we only need to check contig bit as condition for
+		 * unfold, and we can remove the contig bit from the pte we read
+		 * to avoid re-reading. This speeds up fork() which is sensitive
+		 * for order-0 folios. Equivalent to contpte_try_unfold().
+		 */
+		pte_t orig_pte = __ptep_get(ptep);
+
+		if (unlikely(pte_cont(orig_pte))) {
+			__contpte_try_unfold(mm, addr, ptep, orig_pte);
+			orig_pte = pte_mknoncont(orig_pte);
+		}
+		__ptep_set_wrprotect(mm, addr, ptep, orig_pte);
+	} else {
+		contpte_wrprotect_ptes(mm, addr, ptep, nr);
+	}
+}
+
+__always_inline void ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long addr, pte_t *ptep)
+{
+	wrprotect_ptes(mm, addr, ptep, 1);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


