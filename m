From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:31 +0200
Subject: [PATCH 12/12] mm, riscv, arm64: Use common get_and_clear_full_ptes()/clear_full_ptes() functions
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-13-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware get_and_clear_full_ptes()/clear_full_ptes()
function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 41 ++++------------------------
 arch/arm64/mm/Makefile           |  1 -
 arch/arm64/mm/contpte.c          | 46 -------------------------------
 arch/riscv/include/asm/pgtable.h | 39 ++++++++++++++++++++++++++
 include/linux/contpte.h          |  5 ++++
 mm/contpte.c                     | 47 ++++++++++++++++++++++++++++++++
 6 files changed, 96 insertions(+), 83 deletions(-)
 delete mode 100644 arch/arm64/mm/contpte.c

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 162efd9647dd..f8a3159f9df0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1373,17 +1373,6 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 
 #ifdef CONFIG_THP_CONTPTE
 
-/*
- * The contpte APIs are used to transparently manage the contiguous bit in ptes
- * where it is possible and makes sense to do so. The PTE_CONT bit is considered
- * a private implementation detail of the public ptep API (see below).
- */
-extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
-				pte_t *ptep, unsigned int nr, int full);
-extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep,
-				unsigned int nr, int full);
-
 #define pte_batch_hint pte_batch_hint
 static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
 {
@@ -1428,34 +1417,14 @@ extern void pte_clear(struct mm_struct *mm,
 		      unsigned long addr, pte_t *ptep);
 #define pte_clear pte_clear
 
+extern void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr, int full);
 #define clear_full_ptes clear_full_ptes
-static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
-				pte_t *ptep, unsigned int nr, int full)
-{
-	if (likely(nr == 1)) {
-		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-		__clear_full_ptes(mm, addr, ptep, nr, full);
-	} else {
-		contpte_clear_full_ptes(mm, addr, ptep, nr, full);
-	}
-}
 
+extern pte_t get_and_clear_full_ptes(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep,
+				     unsigned int nr, int full);
 #define get_and_clear_full_ptes get_and_clear_full_ptes
-static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep,
-				unsigned int nr, int full)
-{
-	pte_t pte;
-
-	if (likely(nr == 1)) {
-		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-		pte = __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
-	} else {
-		pte = contpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
-	}
-
-	return pte;
-}
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 extern pte_t ptep_get_and_clear(struct mm_struct *mm,
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index 52a1b2082627..dbd1bc95967d 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -3,7 +3,6 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   cache.o copypage.o flush.o \
 				   ioremap.o mmap.o pgd.o mmu.o \
 				   context.o proc.o pageattr.o fixmap.o
-obj-$(CONFIG_THP_CONTPTE)	+= contpte.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
deleted file mode 100644
index 1cef93b15d6e..000000000000
--- a/arch/arm64/mm/contpte.c
+++ /dev/null
@@ -1,46 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2023 ARM Ltd.
- */
-
-#include <linux/mm.h>
-#include <linux/efi.h>
-#include <linux/export.h>
-#include <asm/tlbflush.h>
-
-static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
-					pte_t *ptep, unsigned int nr)
-{
-	/*
-	 * Unfold any partially covered contpte block at the beginning and end
-	 * of the range.
-	 */
-
-	if (ptep != arch_contpte_align_down(ptep) || nr < CONT_PTES)
-		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-
-	if (ptep + nr != arch_contpte_align_down(ptep + nr)) {
-		unsigned long last_addr = addr + PAGE_SIZE * (nr - 1);
-		pte_t *last_ptep = ptep + nr - 1;
-
-		contpte_try_unfold(mm, last_addr, last_ptep,
-				   __ptep_get(last_ptep));
-	}
-}
-
-void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
-				pte_t *ptep, unsigned int nr, int full)
-{
-	contpte_try_unfold_partial(mm, addr, ptep, nr);
-	__clear_full_ptes(mm, addr, ptep, nr, full);
-}
-EXPORT_SYMBOL_GPL(contpte_clear_full_ptes);
-
-pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep,
-				unsigned int nr, int full)
-{
-	contpte_try_unfold_partial(mm, addr, ptep, nr);
-	return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
-}
-EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 728f31da5e6a..a4843bdfdb37 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -754,6 +754,37 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
+static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+				     pte_t *ptep, unsigned int nr, int full)
+{
+	for (;;) {
+		__ptep_get_and_clear(mm, addr, ptep);
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
+static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
+					      unsigned long addr, pte_t *ptep,
+					      unsigned int nr, int full)
+{
+	pte_t pte, tmp_pte;
+
+	pte = __ptep_get_and_clear(mm, addr, ptep);
+	while (--nr) {
+		ptep++;
+		addr += PAGE_SIZE;
+		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
+		if (pte_dirty(tmp_pte))
+			pte = pte_mkdirty(pte);
+		if (pte_young(tmp_pte))
+			pte = pte_mkyoung(pte);
+	}
+	return pte;
+}
+
 static inline void __ptep_set_wrprotect(struct mm_struct *mm,
 					unsigned long address, pte_t *ptep,
 					pte_t pte)
@@ -823,6 +854,13 @@ extern void ptep_set_wrprotect(struct mm_struct *mm,
 extern void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned int nr);
 #define wrprotect_ptes	wrprotect_ptes
+extern void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, unsigned int nr, int full);
+#define clear_full_ptes	clear_full_ptes
+extern pte_t get_and_clear_full_ptes(struct mm_struct *mm,
+				     unsigned long addr, pte_t *ptep,
+				     unsigned int nr, int full);
+#define get_and_clear_full_ptes	get_and_clear_full_ptes
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -842,6 +880,7 @@ extern void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 #define ptep_set_wrprotect(mm, addr, ptep)					\
 			__ptep_set_wrprotect(mm, addr, ptep, __ptep_get(ptep))
 #define wrprotect_ptes		__wrprotect_ptes
+#define clear_full_ptes		__clear_full_ptes
 
 #endif /* CONFIG_THP_CONTPTE */
 
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index d1439db1706c..b24554ebca41 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -28,5 +28,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				  pte_t entry, int dirty);
 void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, unsigned int nr);
+void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			     pte_t *ptep, unsigned int nr, int full);
+pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
+				      unsigned long addr, pte_t *ptep,
+				      unsigned int nr, int full);
 
 #endif /* _LINUX_CONTPTE_H */
diff --git a/mm/contpte.c b/mm/contpte.c
index fe36b6b1d20a..677344e0e3c3 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -51,6 +51,8 @@
  *   - ptep_clear_flush_young()
  *   - wrprotect_ptes()
  *   - ptep_set_wrprotect()
+ *   - clear_full_ptes()
+ *   - get_and_clear_full_ptes()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -905,4 +907,49 @@ __always_inline void ptep_set_wrprotect(struct mm_struct *mm,
 {
 	wrprotect_ptes(mm, addr, ptep, 1);
 }
+
+void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+			     pte_t *ptep, unsigned int nr, int full)
+{
+	contpte_try_unfold_partial(mm, addr, ptep, nr);
+	__clear_full_ptes(mm, addr, ptep, nr, full);
+}
+EXPORT_SYMBOL_GPL(contpte_clear_full_ptes);
+
+pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
+				      unsigned long addr, pte_t *ptep,
+				      unsigned int nr, int full)
+{
+	contpte_try_unfold_partial(mm, addr, ptep, nr);
+	return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
+}
+EXPORT_SYMBOL_GPL(contpte_get_and_clear_full_ptes);
+
+__always_inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
+				     pte_t *ptep, unsigned int nr, int full)
+{
+	if (likely(nr == 1)) {
+		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+		__clear_full_ptes(mm, addr, ptep, nr, full);
+	} else {
+		contpte_clear_full_ptes(mm, addr, ptep, nr, full);
+	}
+}
+
+__always_inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
+					      unsigned long addr, pte_t *ptep,
+					      unsigned int nr, int full)
+{
+	pte_t pte;
+
+	if (likely(nr == 1)) {
+		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+		pte = __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
+	} else {
+		pte = contpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
+	}
+
+	return pte;
+}
+
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


