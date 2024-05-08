From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:23 +0200
Subject: [PATCH 04/12] mm, riscv, arm64: Use common ptep_get_lockless() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-5-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_get_lockless() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 11 +----
 arch/arm64/mm/contpte.c          | 57 --------------------------
 arch/riscv/include/asm/pgtable.h |  2 +
 include/linux/contpte.h          |  1 +
 mm/contpte.c                     | 69 ++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e85b3a052a02..8a0603257436 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1384,7 +1384,6 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
  * where it is possible and makes sense to do so. The PTE_CONT bit is considered
  * a private implementation detail of the public ptep API (see below).
  */
-extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
 extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full);
 extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
@@ -1430,16 +1429,8 @@ static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
 extern pte_t ptep_get(pte_t *ptep);
 #define ptep_get ptep_get
 
+extern pte_t ptep_get_lockless(pte_t *ptep);
 #define ptep_get_lockless ptep_get_lockless
-static inline pte_t ptep_get_lockless(pte_t *ptep)
-{
-	pte_t pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(pte)))
-		return pte;
-
-	return contpte_ptep_get_lockless(ptep);
-}
 
 static inline void set_pte(pte_t *ptep, pte_t pte)
 {
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index e225e458856e..5e9e40145085 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -28,63 +28,6 @@ static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
 	}
 }
 
-pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
-{
-	/*
-	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
-	 * so that it is self-consistent, without the PTL held, so we may be
-	 * racing with other threads modifying the pte. Usually a READ_ONCE()
-	 * would suffice, but for the contpte case, we also need to gather the
-	 * access and dirty bits from across all ptes in the contiguous block,
-	 * and we can't read all of those neighbouring ptes atomically, so any
-	 * contiguous range may be unfolded/modified/refolded under our feet.
-	 * Therefore we ensure we read a _consistent_ contpte range by checking
-	 * that all ptes in the range are valid and have CONT_PTE set, that all
-	 * pfns are contiguous and that all pgprots are the same (ignoring
-	 * access/dirty). If we find a pte that is not consistent, then we must
-	 * be racing with an update so start again. If the target pte does not
-	 * have CONT_PTE set then that is considered consistent on its own
-	 * because it is not part of a contpte range.
-	 */
-
-	pgprot_t orig_prot;
-	unsigned long pfn;
-	pte_t orig_pte;
-	pgprot_t prot;
-	pte_t *ptep;
-	pte_t pte;
-	int i;
-
-retry:
-	orig_pte = __ptep_get(orig_ptep);
-
-	if (!pte_valid_cont(orig_pte))
-		return orig_pte;
-
-	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
-	ptep = arch_contpte_align_down(orig_ptep);
-	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
-
-	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
-		pte = __ptep_get(ptep);
-		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
-
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
-			goto retry;
-
-		if (pte_dirty(pte))
-			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
-			orig_pte = pte_mkyoung(orig_pte);
-	}
-
-	return orig_pte;
-}
-EXPORT_SYMBOL_GPL(contpte_ptep_get_lockless);
-
 void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ebfe6b16529e..62cad1b974f1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -785,6 +785,8 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 
 extern pte_t ptep_get(pte_t *ptep);
 #define ptep_get ptep_get
+extern pte_t ptep_get_lockless(pte_t *ptep);
+#define ptep_get_lockless ptep_get_lockless
 extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pteval, unsigned int nr);
 #define set_ptes set_ptes
diff --git a/include/linux/contpte.h b/include/linux/contpte.h
index 54d10204e9af..01da4bfc3af6 100644
--- a/include/linux/contpte.h
+++ b/include/linux/contpte.h
@@ -8,6 +8,7 @@
  * a private implementation detail of the public ptep API (see below).
  */
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
+pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
 void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
 			pte_t *ptep, pte_t pte);
 void contpte_try_fold(struct mm_struct *mm, unsigned long addr,
diff --git a/mm/contpte.c b/mm/contpte.c
index 566745d7842f..060e0bc1a2a3 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -42,6 +42,7 @@
  *   - huge_ptep_clear_flush()
  *   - ptep_get()
  *   - set_ptes()
+ *   - ptep_get_lockless()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -589,4 +590,72 @@ __always_inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		contpte_set_ptes(mm, addr, ptep, pte, nr);
 	}
 }
+
+pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
+{
+	/*
+	 * The ptep_get_lockless() API requires us to read and return *orig_ptep
+	 * so that it is self-consistent, without the PTL held, so we may be
+	 * racing with other threads modifying the pte. Usually a READ_ONCE()
+	 * would suffice, but for the contpte case, we also need to gather the
+	 * access and dirty bits from across all ptes in the contiguous block,
+	 * and we can't read all of those neighbouring ptes atomically, so any
+	 * contiguous range may be unfolded/modified/refolded under our feet.
+	 * Therefore we ensure we read a _consistent_ contpte range by checking
+	 * that all ptes in the range are valid and have CONT_PTE set, that all
+	 * pfns are contiguous and that all pgprots are the same (ignoring
+	 * access/dirty). If we find a pte that is not consistent, then we must
+	 * be racing with an update so start again. If the target pte does not
+	 * have CONT_PTE set then that is considered consistent on its own
+	 * because it is not part of a contpte range.
+	 */
+
+	pgprot_t orig_prot;
+	unsigned long pfn;
+	pte_t orig_pte;
+	pgprot_t prot;
+	pte_t *ptep;
+	pte_t pte;
+	int i, ncontig;
+
+retry:
+	orig_pte = __ptep_get(orig_ptep);
+
+	if (!pte_valid_cont(orig_pte))
+		return orig_pte;
+
+	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
+	ptep = arch_contpte_align_down(orig_ptep);
+	ncontig = arch_contpte_get_num_contig(NULL, 0, ptep, 0, NULL);
+	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
+
+	for (i = 0; i < ncontig; i++, ptep++, pfn++) {
+		pte = __ptep_get(ptep);
+		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+		if (!pte_valid_cont(pte) ||
+				pte_pfn(pte) != pfn ||
+				pgprot_val(prot) != pgprot_val(orig_prot))
+			goto retry;
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+EXPORT_SYMBOL_GPL(contpte_ptep_get_lockless);
+
+__always_inline pte_t ptep_get_lockless(pte_t *ptep)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	if (likely(!pte_valid_cont(pte)))
+		return pte;
+
+	return contpte_ptep_get_lockless(ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


