From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed,  8 May 2024 21:19:26 +0200
Subject: [PATCH 07/12] mm, riscv, arm64: Use common ptep_get_and_clear() function
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
Message-ID: <20240508191931.46060-8-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make riscv use the contpte aware ptep_get_and_clear() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 8 ++------
 arch/riscv/include/asm/pgtable.h | 7 +++++--
 mm/contpte.c                     | 8 ++++++++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 74e582f2884f..ff7fe1d9cabe 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1473,12 +1473,8 @@ static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-	return __ptep_get_and_clear(mm, addr, ptep);
-}
+extern pte_t ptep_get_and_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 41534f4b8a6d..03cd640137ed 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -794,6 +794,9 @@ extern void set_pte(pte_t *ptep, pte_t pte);
 #define set_pte set_pte
 extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define pte_clear pte_clear
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+extern pte_t ptep_get_and_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -801,11 +804,11 @@ extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define set_ptes		__set_ptes
 #define set_pte			__set_pte
 #define pte_clear		__pte_clear
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define ptep_get_and_clear	__ptep_get_and_clear
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-#define ptep_get_and_clear	__ptep_get_and_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/mm/contpte.c b/mm/contpte.c
index c9eff6426ca0..5bf939639233 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -46,6 +46,7 @@
  *   - ptep_get_lockless()
  *   - set_pte()
  *   - pte_clear()
+ *   - ptep_get_and_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -682,4 +683,11 @@ void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
 	__pte_clear(mm, addr, ptep);
 }
+
+pte_t ptep_get_and_clear(struct mm_struct *mm,
+			 unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	return __ptep_get_and_clear(mm, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


