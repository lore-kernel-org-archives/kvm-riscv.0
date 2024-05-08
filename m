From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:25 +0200
Subject: [PATCH 06/12] mm, riscv, arm64: Use common pte_clear() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-7-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware pte_clear() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 9 +++------
 arch/riscv/include/asm/pgtable.h | 4 +++-
 arch/riscv/mm/init.c             | 2 +-
 mm/contpte.c                     | 6 ++++++
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index bb6210fb72c8..74e582f2884f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1439,12 +1439,9 @@ extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte, unsigned int nr);
 #define set_ptes set_ptes
 
-static inline void pte_clear(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-	__pte_clear(mm, addr, ptep);
-}
+extern void pte_clear(struct mm_struct *mm,
+		      unsigned long addr, pte_t *ptep);
+#define pte_clear pte_clear
 
 #define clear_full_ptes clear_full_ptes
 static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4f8f673787e7..41534f4b8a6d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -792,18 +792,20 @@ extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 #define set_ptes set_ptes
 extern void set_pte(pte_t *ptep, pte_t pte);
 #define set_pte set_pte
+extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
+#define pte_clear pte_clear
 
 #else /* CONFIG_THP_CONTPTE */
 
 #define ptep_get		__ptep_get
 #define set_ptes		__set_ptes
 #define set_pte			__set_pte
+#define pte_clear		__pte_clear
 
 #endif /* CONFIG_THP_CONTPTE */
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
-#define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bb5c6578204c..c82f17b3060b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -327,7 +327,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	if (pgprot_val(prot))
 		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
 	else
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 	local_flush_tlb_page(addr);
 }
 
diff --git a/mm/contpte.c b/mm/contpte.c
index 543ae5b5a863..c9eff6426ca0 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -45,6 +45,7 @@
  *   - set_ptes()
  *   - ptep_get_lockless()
  *   - set_pte()
+ *   - pte_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -676,4 +677,9 @@ void set_pte(pte_t *ptep, pte_t pte)
 	__set_pte(ptep, pte_mknoncont(pte));
 }
 
+void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	__pte_clear(mm, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


