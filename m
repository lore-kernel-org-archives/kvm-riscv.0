From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon,  5 Dec 2022 01:46:28 +0800
Subject: [PATCH v2 09/13] riscv: switch to relative alternative entries
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
Message-ID: <20221204174632.3677-10-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using absolute addresses for both the old instrucions and
the alternative instructions, use offsets relative to the alt_entry
values. So we can not only cut the size of the alternative entry, but
also meet the prerequisite for patching alternatives in the vDSO,
since absolute alternative entries are subject to dynamic relocation,
which is incompatible with the vDSO building.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/sifive/errata.c           |  4 +++-
 arch/riscv/errata/thead/errata.c            | 11 ++++++++---
 arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
 arch/riscv/include/asm/alternative.h        | 12 ++++++------
 arch/riscv/kernel/cpufeature.c              | 13 ++++++-------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 1031038423e7..0e537cdfd324 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
+					  (void *)&alt->alt_offset + alt->alt_offset,
+					  alt->alt_len);
 			cpu_apply_errata |= tmp;
 		}
 	}
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 21546937db39..2a6e335b5a32 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -68,6 +68,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	struct alt_entry *alt;
 	u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);
 	u32 tmp;
+	void *oldptr, *updptr;
 
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
@@ -77,12 +78,16 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
+			oldptr = (void *)&alt->old_offset + alt->old_offset;
+			updptr = (void *)&alt->alt_offset + alt->alt_offset;
+
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)__pa_symbol(alt->old_ptr),
-				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
+				memcpy((void *)__pa_symbol(oldptr),
+				       (void *)__pa_symbol(updptr),
+				       alt->alt_len);
 			else
-				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+				patch_text_nosync(oldptr, updptr, alt->alt_len);
 		}
 	}
 
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index ec2f3f1b836f..dd40727bc859 100644
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
+	.long \oldptr - .
+	.long \newptr - .
+	.short \vendor_id
+	.short \new_len
+	.long \errata_id
 .endm
 
 .macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
@@ -75,11 +75,11 @@
 #include <linux/stringify.h>
 
 #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
-	RISCV_PTR " " oldptr "\n"					\
-	RISCV_PTR " " newptr "\n"					\
-	REG_ASM " " vendor_id "\n"					\
-	REG_ASM " " newlen "\n"						\
-	".word " errata_id "\n"
+	".long	((" oldptr ") - .) \n"					\
+	".long	((" newptr ") - .) \n"					\
+	".short	" vendor_id "\n"					\
+	".short	" newlen "\n"						\
+	".long	" errata_id "\n"
 
 #define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 33eae9541684..3baf32e05b46 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -33,12 +33,12 @@ void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
 			       int patch_offset);
 
 struct alt_entry {
-	void *old_ptr;		 /* address of original instruciton or data  */
-	void *alt_ptr;		 /* address of replacement instruction or data */
-	unsigned long vendor_id; /* cpu vendor id */
-	unsigned long alt_len;   /* The replacement size */
-	unsigned int errata_id;  /* The errata id */
-} __packed;
+	s32 old_offset;		/* offset to original instruciton or data  */
+	s32 alt_offset;		/* offset to replacement instruction or data */
+	u16 vendor_id;		/* cpu vendor id */
+	u16 alt_len;		/* The replacement size */
+	u32 errata_id;		/* The errata id */
+};
 
 struct errata_checkfunc_id {
 	unsigned long vendor_id;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6244be5cd94a..adeac90b1d8e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  unsigned int stage)
 {
 	struct alt_entry *alt;
+	void *oldptr, *updptr;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -270,17 +271,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 			continue;
 		}
 
+		oldptr = (void *)&alt->old_offset + alt->old_offset;
+		updptr = (void *)&alt->alt_offset + alt->alt_offset;
 		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
 			continue;
 
 		/* do the basic patching */
-		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
-		riscv_alternative_fix_auipc_jalr(alt->old_ptr,
-						 alt->alt_len,
-						 alt->old_ptr - alt->alt_ptr);
-		riscv_alternative_fix_jal(alt->old_ptr,
-					  alt->alt_len,
-					  alt->old_ptr - alt->alt_ptr);
+		patch_text_nosync(oldptr, updptr, alt->alt_len);
+		riscv_alternative_fix_auipc_jalr(oldptr, alt->alt_len, oldptr - updptr);
+		riscv_alternative_fix_jal(oldptr, alt->alt_len,	oldptr - updptr);
 	}
 }
 #endif
-- 
2.37.2


