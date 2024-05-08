From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:28 +0200
Subject: [PATCH 09/12] mm, riscv, arm64: Use common ptep_clear_flush_young() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-10-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_clear_flush_young() function from
arm64.

Note that riscv used to not flush the tlb after clearing the accessed
bit, which it does now: this will be improved when we implement svinval
support.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 22 ++++++++----------
 arch/arm64/mm/contpte.c          | 21 -----------------
 arch/riscv/include/asm/pgtable.h | 12 +++++++---
 include/linux/contpte.h          |  2 ++
 mm/contpte.c                     | 40 ++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 9a8702d1ad00..92c12fb85cb4 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1389,8 +1389,6 @@ extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned long addr, pte_t *ptep,
 				unsigned int nr, int full);
-extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr);
 extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
@@ -1479,16 +1477,8 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_clear_flush_young(vma, addr, ptep);
-
-	return contpte_ptep_clear_flush_young(vma, addr, ptep);
-}
+extern int ptep_clear_flush_young(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep);
 
 #define wrprotect_ptes wrprotect_ptes
 static __always_inline void wrprotect_ptes(struct mm_struct *mm,
@@ -1616,6 +1606,14 @@ static inline void arch_contpte_flush_tlb_range(struct vm_area_struct *vma,
 	__flush_tlb_range(vma, start, end, stride, true, 3);
 }
 
+static inline void arch_contpte_flush_tlb_range_nosync(struct vm_area_struct *vma,
+						       unsigned long start,
+						       unsigned long end,
+						       unsigned long stride)
+{
+	__flush_tlb_range_nosync(vma, start, end, stride, true, 3);
+}
+
 static inline int arch_contpte_get_first_ncontig(size_t *pgsize)
 {
 	if (pgsize)
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 9bf471633ca4..16940511943c 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -45,27 +45,6 @@ pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 }
 EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
 
-int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep)
-{
-	int young;
-
-	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
-
-	if (young) {
-		/*
-		 * See comment in __ptep_clear_flush_young(); same rationale for
-		 * eliding the trailing DSB applies here.
-		 */
-		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
-					 PAGE_SIZE, true, 3);
-	}
-
-	return young;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_clear_flush_young);
-
 void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 					pte_t *ptep, unsigned int nr)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d39cb24c6c4a..42c7884b8d2e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -615,6 +615,8 @@ static inline void arch_contpte_flush_tlb_range(struct vm_area_struct *vma,
 	flush_tlb_mm_range(vma->vm_mm, start, end, stride);
 }
 
+#define arch_contpte_flush_tlb_range_nosync	arch_contpte_flush_tlb_range
+
 static inline int arch_contpte_get_first_ncontig(size_t *pgsize)
 {
 	if (pgsize)
@@ -758,9 +760,8 @@ static inline void __ptep_set_wrprotect(struct mm_struct *mm,
 	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
 }
 
-#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
-					 unsigned long address, pte_t *ptep)
+static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
+					   unsigned long address, pte_t *ptep)
 {
 	/*
 	 * This comment is borrowed from x86, but applies equally to RISC-V:
@@ -799,6 +800,9 @@ extern pte_t ptep_get_and_clear(struct mm_struct *mm,
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
+extern int ptep_clear_flush_young(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -810,6 +814,8 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
 #define ptep_get_and_clear	__ptep_get_and_clear
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define ptep_test_and_clear_young	__ptep_test_and_clear_young
+#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
+#define ptep_clear_flush_young	__ptep_clear_flush_young
 
 #endif /* CONFIG_THP_CONTPTE */
 
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 38092adbe0d4..76a49ac8b6f5 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -21,5 +21,7 @@ void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		      pte_t *ptep, pte_t pte, unsigned int nr);
 int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep);
+int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 220e9d81f401..600277b1196c 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -48,6 +48,7 @@
  *   - pte_clear()
  *   - ptep_get_and_clear()
  *   - ptep_test_and_clear_young()
+ *   - ptep_clear_flush_young()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -729,4 +730,43 @@ __always_inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 
 	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
 }
+
+int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep)
+{
+	int young;
+
+	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
+
+	if (young) {
+		/*
+		 * See comment in __ptep_clear_flush_young(); same rationale for
+		 * eliding the trailing DSB applies here.
+		 */
+		size_t pgsize;
+		int ncontig;
+
+		ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep,
+						      0, &pgsize);
+
+		addr = ALIGN_DOWN(addr, ncontig * pgsize);
+		arch_contpte_flush_tlb_range_nosync(vma, addr,
+						    addr + ncontig * pgsize,
+						    pgsize);
+	}
+
+	return young;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_clear_flush_young);
+
+__always_inline int ptep_clear_flush_young(struct vm_area_struct *vma,
+					   unsigned long addr, pte_t *ptep)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_clear_flush_young(vma, addr, ptep);
+
+	return contpte_ptep_clear_flush_young(vma, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


