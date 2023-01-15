From: Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 15 Jan 2023 23:49:49 +0800
Subject: [PATCH v4 09/13] riscv: switch to relative alternative entries
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
Message-ID: <20230115154953.831-10-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using absolute addresses for both the old instrucions and
the alternative instructions, use offsets relative to the alt_entry
values. So this not only cuts the size of the alternative entry, but
also meets the prerequisite for patching alternatives in the vDSO,
since absolute alternative entries are subject to dynamic relocation,
which is incompatible with the vDSO building.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/errata/sifive/errata.c           |  3 ++-
 arch/riscv/errata/thead/errata.c            | 11 ++++++++---
 arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
 arch/riscv/include/asm/alternative.h        | 17 +++++++++++------
 arch/riscv/kernel/cpufeature.c              |  8 +++++---
 5 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 1031038423e7..ef9a4eec0dba 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -107,7 +107,8 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
+					  alt->alt_len);
 			cpu_apply_errata |= tmp;
 		}
 	}
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index fac5742d1c1e..c0bea5c94128 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -87,6 +87,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	struct alt_entry *alt;
 	u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);
 	u32 tmp;
+	void *oldptr, *altptr;
 
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
@@ -96,12 +97,16 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
+			oldptr = ALT_OLD_PTR(alt);
+			altptr = ALT_ALT_PTR(alt);
+
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)__pa_symbol(alt->old_ptr),
-				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
+				memcpy((void *)__pa_symbol(oldptr),
+				       (void *)__pa_symbol(altptr),
+				       alt->alt_len);
 			else
-				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+				patch_text_nosync(oldptr, altptr, alt->alt_len);
 		}
 	}
 
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 7226e2462584..cc6a81c00f2f 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -7,11 +7,11 @@
 #ifdef __ASSEMBLY__
 
 .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
-	RISCV_PTR \oldptr
-	RISCV_PTR \newptr
-	REG_ASM \vendor_id
-	REG_ASM \new_len
-	.word	\errata_id
+	.4byte \oldptr - .
+	.4byte \newptr - .
+	.2byte \vendor_id
+	.2byte \new_len
+	.4byte \errata_id
 .endm
 
 .macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
@@ -59,11 +59,11 @@
 #include <linux/stringify.h>
 
 #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
-	RISCV_PTR " " oldptr "\n"					\
-	RISCV_PTR " " newptr "\n"					\
-	REG_ASM " " vendor_id "\n"					\
-	REG_ASM " " newlen "\n"						\
-	".word " errata_id "\n"
+	".4byte	((" oldptr ") - .) \n"					\
+	".4byte	((" newptr ") - .) \n"					\
+	".2byte	" vendor_id "\n"					\
+	".2byte " newlen "\n"						\
+	".4byte	" errata_id "\n"
 
 #define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 1bd4027d34ca..b8648d4f2ac1 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -23,6 +23,11 @@
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
 
+/* add the relative offset to the address of the offset to get the absolute address */
+#define __ALT_PTR(a, f)			((void *)&(a)->f + (a)->f)
+#define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
+#define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
+
 void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
@@ -31,12 +36,12 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 				   int patch_offset);
 
 struct alt_entry {
-	void *old_ptr;		 /* address of original instruciton or data  */
-	void *alt_ptr;		 /* address of replacement instruction or data */
-	unsigned long vendor_id; /* cpu vendor id */
-	unsigned long alt_len;   /* The replacement size */
-	unsigned int errata_id;  /* The errata id */
-} __packed;
+	s32 old_offset;		/* offset relative to original instruction or data  */
+	s32 alt_offset;		/* offset relative to replacement instruction or data */
+	u16 vendor_id;		/* cpu vendor id */
+	u16 alt_len;		/* The replacement size */
+	u32 errata_id;		/* The errata id */
+};
 
 struct errata_checkfunc_id {
 	unsigned long vendor_id;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6db8b31d9149..50cfbbbecaa7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -280,6 +280,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  unsigned int stage)
 {
 	struct alt_entry *alt;
+	void *oldptr, *altptr;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -293,12 +294,13 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 			continue;
 		}
 
+		oldptr = ALT_OLD_PTR(alt);
+		altptr = ALT_ALT_PTR(alt);
 		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
 			continue;
 
-		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
-		riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
-					      alt->old_ptr - alt->alt_ptr);
+		patch_text_nosync(oldptr, altptr, alt->alt_len);
+		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
 	}
 }
 #endif
-- 
2.38.1


