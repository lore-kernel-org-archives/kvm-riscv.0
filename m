From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:29 +0200
Subject: [PATCH 10/12] mm, riscv, arm64: Use common ptep_set_access_flags() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-11-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_set_access_flags() function from
arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 19 ++--------
 arch/arm64/mm/contpte.c          | 46 -----------------------
 arch/riscv/include/asm/pgtable.h | 10 +++--
 include/linux/contpte.h          |  3 ++
 mm/contpte.c                     | 63 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 65 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 92c12fb85cb4..6591aab11c67 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1391,9 +1391,6 @@ extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
 				unsigned int nr, int full);
 extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr);
-extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep,
-				pte_t entry, int dirty);
 
 #define pte_batch_hint pte_batch_hint
 static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
@@ -1512,19 +1509,9 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-static inline int ptep_set_access_flags(struct vm_area_struct *vma,
-				unsigned long addr, pte_t *ptep,
-				pte_t entry, int dirty)
-{
-	pte_t orig_pte = __ptep_get(ptep);
-
-	entry = pte_mknoncont(entry);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-
-	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-}
+extern int ptep_set_access_flags(struct vm_area_struct *vma,
+				 unsigned long addr, pte_t *ptep,
+				 pte_t entry, int dirty);
 
 #else /* CONFIG_THP_CONTPTE */
 
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 16940511943c..5675a61452ac 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -62,49 +62,3 @@ void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 	__wrprotect_ptes(mm, addr, ptep, nr);
 }
 EXPORT_SYMBOL_GPL(contpte_wrprotect_ptes);
-
-int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
-					unsigned long addr, pte_t *ptep,
-					pte_t entry, int dirty)
-{
-	unsigned long start_addr;
-	pte_t orig_pte;
-	int i;
-
-	/*
-	 * Gather the access/dirty bits for the contiguous range. If nothing has
-	 * changed, its a noop.
-	 */
-	orig_pte = pte_mknoncont(ptep_get(ptep));
-	if (pte_val(orig_pte) == pte_val(entry))
-		return 0;
-
-	/*
-	 * We can fix up access/dirty bits without having to unfold the contig
-	 * range. But if the write bit is changing, we must unfold.
-	 */
-	if (pte_write(orig_pte) == pte_write(entry)) {
-		/*
-		 * For HW access management, we technically only need to update
-		 * the flag on a single pte in the range. But for SW access
-		 * management, we need to update all the ptes to prevent extra
-		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
-		 * and instead flush the whole range at the end.
-		 */
-		ptep = arch_contpte_align_down(ptep);
-		start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-
-		for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
-			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
-
-		if (dirty)
-			__flush_tlb_range(vma, start_addr, addr,
-							PAGE_SIZE, true, 3);
-	} else {
-		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
-		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
-	}
-
-	return 1;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_set_access_flags);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 42c7884b8d2e..b151a5aa4de8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -803,6 +803,10 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 				  unsigned long addr, pte_t *ptep);
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+extern int ptep_set_access_flags(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep,
+				 pte_t entry, int dirty);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -816,11 +820,11 @@ extern int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define ptep_test_and_clear_young	__ptep_test_and_clear_young
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young	__ptep_clear_flush_young
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+#define ptep_set_access_flags	__ptep_set_access_flags
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
-#define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 #define ptep_set_wrprotect	__ptep_set_wrprotect
 
@@ -990,7 +994,7 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp,
 					pmd_t entry, int dirty)
 {
-	return ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
+	return __ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 76a49ac8b6f5..76244b0c678a 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -23,5 +23,8 @@ int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 				      unsigned long addr, pte_t *ptep);
 int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 				   unsigned long addr, pte_t *ptep);
+int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep,
+				  pte_t entry, int dirty);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index 600277b1196c..9cbbff1f67ad 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -769,4 +769,67 @@ __always_inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 
 	return contpte_ptep_clear_flush_young(vma, addr, ptep);
 }
+
+int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
+				  unsigned long addr, pte_t *ptep,
+				  pte_t entry, int dirty)
+{
+	unsigned long start_addr;
+	pte_t orig_pte;
+	int i;
+
+	/*
+	 * Gather the access/dirty bits for the contiguous range. If nothing has
+	 * changed, its a noop.
+	 */
+	orig_pte = pte_mknoncont(ptep_get(ptep));
+	if (pte_val(orig_pte) == pte_val(entry))
+		return 0;
+
+	/*
+	 * We can fix up access/dirty bits without having to unfold the contig
+	 * range. But if the write bit is changing, we must unfold.
+	 */
+	if (pte_write(orig_pte) == pte_write(entry)) {
+		/*
+		 * For HW access management, we technically only need to update
+		 * the flag on a single pte in the range. But for SW access
+		 * management, we need to update all the ptes to prevent extra
+		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
+		 * and instead flush the whole range at the end.
+		 */
+		size_t pgsize;
+		int ncontig;
+
+		ptep = arch_contpte_align_down(ptep);
+		ncontig = arch_contpte_get_num_contig(vma->vm_mm, addr, ptep, 0, &pgsize);
+		start_addr = addr = ALIGN_DOWN(addr, ncontig * pgsize);
+
+		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
+			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
+
+		if (dirty)
+			arch_contpte_flush_tlb_range(vma, start_addr, addr, pgsize);
+	} else {
+		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
+		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_set_access_flags);
+
+__always_inline int ptep_set_access_flags(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep,
+					  pte_t entry, int dirty)
+{
+	pte_t orig_pte = __ptep_get(ptep);
+
+	entry = pte_mknoncont(entry);
+
+	if (likely(!pte_valid_cont(orig_pte)))
+		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+
+	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


