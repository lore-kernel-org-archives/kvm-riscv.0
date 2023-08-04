From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:30 -0700
Subject: [PATCH 05/10] RISC-V: module: Refactor instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-5-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use shared instruction definitions in insn.h instead of manually
constructing them.

Additionally, extra work was being done in apply_r_riscv_lo12_s_rela
to ensure that the bits were set up properly for the lo12, but because
-(a-b)=b-a it wasn't actually doing anything.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/module.c | 80 +++++++++++-----------------------------------
 1 file changed, 18 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..950783e5b5ae 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -12,8 +12,11 @@
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
 #include <asm/alternative.h>
+#include <asm/insn.h>
 #include <asm/sections.h>
 
+#define HI20_OFFSET 0x800
+
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
  * in the range [-2^31 - 2^11, 2^31 - 2^11)
@@ -48,12 +51,8 @@ static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
 				     Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u32 imm12 = (offset & 0x1000) << (31 - 12);
-	u32 imm11 = (offset & 0x800) >> (11 - 7);
-	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
-	u32 imm4_1 = (offset & 0x1e) << (11 - 4);
 
-	*location = (*location & 0x1fff07f) | imm12 | imm11 | imm10_5 | imm4_1;
+	riscv_insn_insert_btype_imm(location, ((s32)offset));
 	return 0;
 }
 
@@ -61,12 +60,8 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 				  Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u32 imm20 = (offset & 0x100000) << (31 - 20);
-	u32 imm19_12 = (offset & 0xff000);
-	u32 imm11 = (offset & 0x800) << (20 - 11);
-	u32 imm10_1 = (offset & 0x7fe) << (30 - 10);
 
-	*location = (*location & 0xfff) | imm20 | imm19_12 | imm11 | imm10_1;
+	riscv_insn_insert_jtype_imm(location, ((s32)offset));
 	return 0;
 }
 
@@ -74,14 +69,8 @@ static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u16 imm8 = (offset & 0x100) << (12 - 8);
-	u16 imm7_6 = (offset & 0xc0) >> (6 - 5);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4_3 = (offset & 0x18) << (12 - 5);
-	u16 imm2_1 = (offset & 0x6) << (12 - 10);
-
-	*(u16 *)location = (*(u16 *)location & 0xe383) |
-		    imm8 | imm7_6 | imm5 | imm4_3 | imm2_1;
+
+	riscv_insn_insert_cbztype_imm(location, (s32)offset);
 	return 0;
 }
 
@@ -89,17 +78,8 @@ static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u16 imm11 = (offset & 0x800) << (12 - 11);
-	u16 imm10 = (offset & 0x400) >> (10 - 8);
-	u16 imm9_8 = (offset & 0x300) << (12 - 11);
-	u16 imm7 = (offset & 0x80) >> (7 - 6);
-	u16 imm6 = (offset & 0x40) << (12 - 11);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4 = (offset & 0x10) << (12 - 5);
-	u16 imm3_1 = (offset & 0xe) << (12 - 10);
-
-	*(u16 *)location = (*(u16 *)location & 0xe003) |
-		    imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1;
+
+	riscv_insn_insert_cjtype_imm(location, (s32)offset);
 	return 0;
 }
 
@@ -107,7 +87,6 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
@@ -116,8 +95,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
+	riscv_insn_insert_utype_imm(location, (offset + HI20_OFFSET));
 	return 0;
 }
 
@@ -128,7 +106,7 @@ static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, u32 *location,
 	 * v is the lo12 value to fill. It is calculated before calling this
 	 * handler.
 	 */
-	*location = (*location & 0xfffff) | ((v & 0xfff) << 20);
+	riscv_insn_insert_itype_imm(location, ((s32)v));
 	return 0;
 }
 
@@ -139,18 +117,13 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
 	 * v is the lo12 value to fill. It is calculated before calling this
 	 * handler.
 	 */
-	u32 imm11_5 = (v & 0xfe0) << (31 - 11);
-	u32 imm4_0 = (v & 0x1f) << (11 - 4);
-
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
+	riscv_insn_insert_stype_imm(location, ((s32)v));
 	return 0;
 }
 
 static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 				   Elf_Addr v)
 {
-	s32 hi20;
-
 	if (IS_ENABLED(CONFIG_CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
@@ -158,8 +131,7 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = ((s32)v + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
+	riscv_insn_insert_utype_imm(location, ((s32)v + HI20_OFFSET));
 	return 0;
 }
 
@@ -167,9 +139,7 @@ static int apply_r_riscv_lo12_i_rela(struct module *me, u32 *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
-	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
-	s32 lo12 = ((s32)v - hi20);
-	*location = (*location & 0xfffff) | ((lo12 & 0xfff) << 20);
+	riscv_insn_insert_itype_imm(location, (s32)v);
 	return 0;
 }
 
@@ -177,11 +147,7 @@ static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
-	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
-	s32 lo12 = ((s32)v - hi20);
-	u32 imm11_5 = (lo12 & 0xfe0) << (31 - 11);
-	u32 imm4_0 = (lo12 & 0x1f) << (11 - 4);
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
+	riscv_insn_insert_stype_imm(location, (s32)v);
 	return 0;
 }
 
@@ -189,7 +155,6 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
 
 	/* Always emit the got entry */
 	if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
@@ -202,8 +167,7 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
+	riscv_insn_insert_utype_imm(location, (s32)(offset + HI20_OFFSET));
 	return 0;
 }
 
@@ -211,7 +175,6 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		/* Only emit the plt entry if offset over 32-bit range */
@@ -226,10 +189,7 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 		}
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
+	riscv_insn_insert_utype_itype_imm(location, location + 1, (s32)offset);
 	return 0;
 }
 
@@ -237,7 +197,6 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 				   Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
-	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
@@ -246,10 +205,7 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
+	riscv_insn_insert_utype_itype_imm(location, location + 1, (s32)offset);
 	return 0;
 }
 

-- 
2.34.1


