From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon,  2 Oct 2023 17:10:28 +0200
Subject: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
Message-ID: <20231002151031.110551-3-alexghiti@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of directly dereferencing page tables entries, which can cause
issues (see commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when
accessing page tables"), let's introduce new functions to get the
pud/p4d/pgd entries (the pte and pmd versions already exist).

Those new functions will be used in subsequent commits by the riscv
architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/pgtable.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1fba072b3dac..4ce68bcc201d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -284,6 +284,27 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
 }
 #endif
 
+#ifndef pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return READ_ONCE(*pudp);
+}
+#endif
+
+#ifndef p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+#endif
+
+#ifndef pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return READ_ONCE(*pgdp);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.39.2


