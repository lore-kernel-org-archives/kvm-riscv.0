From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Mon, 30 May 2022 11:47:01 +0200
Subject: [PATCH -for-next] riscv: Fix missing PAGE_PFN_MASK
Message-ID: <20220530094701.2891404-1-alexandre.ghiti@canonical.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are a bunch of functions that use the PFN from a page table entry
that end up with the svpbmt upper-bits because they are missing the newly
introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
then crash: fix this by adding this mask.

Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/pgtable-64.h | 4 ++--
 arch/riscv/include/asm/pgtable.h    | 4 ++--
 arch/riscv/kvm/mmu.c                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6d59e4695200..0e57bf1e25e9 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -153,7 +153,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pud_pfn(pud_t pud)
 {
-	return pud_val(pud) >> _PAGE_PFN_SHIFT;
+	return (pud_val(pud) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 static inline pmd_t *pud_pgtable(pud_t pud)
@@ -240,7 +240,7 @@ static inline void p4d_clear(p4d_t *p4d)
 static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
+		return (pud_t *)pfn_to_virt((p4d_val(p4d) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 
 	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e2658a25f06d..43064025f4b0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -255,7 +255,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 
 static inline unsigned long _pgd_pfn(pgd_t pgd)
 {
-	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
+	return (pgd_val(pgd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;
 }
 
 static inline struct page *pmd_page(pmd_t pmd)
@@ -568,7 +568,7 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
 }
 
-#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
+#define __pmd_to_phys(pmd)  ((pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
 
 static inline unsigned long pmd_pfn(pmd_t pmd)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f80a34fbf102..db03c5a29d4c 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -55,7 +55,7 @@ static inline unsigned long stage2_pte_index(gpa_t addr, u32 level)
 
 static inline unsigned long stage2_pte_page_vaddr(pte_t pte)
 {
-	return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
+	return (unsigned long)pfn_to_virt((pte_val(pte) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
 }
 
 static int stage2_page_size_to_level(unsigned long page_size, u32 *out_level)
-- 
2.34.1


