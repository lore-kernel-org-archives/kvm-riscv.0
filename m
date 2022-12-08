From: David Matlack <dmatlack@google.com>
Date: Thu,  8 Dec 2022 11:38:27 -0800
Subject: [RFC PATCH 07/37] mm: Introduce architecture-neutral PG_LEVEL macros
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <20221208193857.4090582-8-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce architecture-neutral versions of the x86 macros PG_LEVEL_4K,
PG_LEVEL_2M, etc. The x86 macros are used extensively by KVM/x86's page
table management code. Introducing architecture-neutral version of these
macros paves the way for porting KVM/x86's page table management code to
architecture-neutral code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/pgtable_types.h | 12 ++++--------
 include/linux/mm_types.h             |  9 +++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index aa174fed3a71..bdf41325f089 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -518,14 +518,10 @@ extern void native_pagetable_init(void);
 struct seq_file;
 extern void arch_report_meminfo(struct seq_file *m);
 
-enum pg_level {
-	PG_LEVEL_NONE,
-	PG_LEVEL_4K,
-	PG_LEVEL_2M,
-	PG_LEVEL_1G,
-	PG_LEVEL_512G,
-	PG_LEVEL_NUM
-};
+#define PG_LEVEL_4K	PG_LEVEL_PTE
+#define PG_LEVEL_2M	PG_LEVEL_PMD
+#define PG_LEVEL_1G	PG_LEVEL_PUD
+#define PG_LEVEL_512G	PG_LEVEL_P4D
 
 #ifdef CONFIG_PROC_FS
 extern void update_page_count(int level, unsigned long pages);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 500e536796ca..0445d0673afe 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1003,4 +1003,13 @@ enum fault_flag {
 
 typedef unsigned int __bitwise zap_flags_t;
 
+enum pg_level {
+	PG_LEVEL_NONE,
+	PG_LEVEL_PTE,
+	PG_LEVEL_PMD,
+	PG_LEVEL_PUD,
+	PG_LEVEL_P4D,
+	PG_LEVEL_NUM
+};
+
 #endif /* _LINUX_MM_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


