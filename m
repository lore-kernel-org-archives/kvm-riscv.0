From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:31 -0700
Subject: [PATCH 06/10] RISC-V: Refactor patch instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-6-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use shared instruction definitions in insn.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/patch.c                |  3 +-
 arch/riscv/kernel/probes/kprobes.c       | 13 +++----
 arch/riscv/kernel/probes/simulate-insn.c | 61 +++++++-------------------------
 arch/riscv/kernel/probes/uprobes.c       |  5 +--
 4 files changed, 25 insertions(+), 57 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 575e71d6c8ae..df51f5155673 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -12,6 +12,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 #include <asm/ftrace.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
 struct patch_insn {
@@ -118,7 +119,7 @@ static int patch_text_cb(void *data)
 
 	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
 		for (i = 0; ret == 0 && i < patch->ninsns; i++) {
-			len = GET_INSN_LENGTH(patch->insns[i]);
+			len = INSN_LEN(patch->insns[i]);
 			ret = patch_text_nosync(patch->addr + i * len,
 						&patch->insns[i], len);
 		}
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 2f08c14a933d..501c6ae4d803 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -12,6 +12,7 @@
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/patch.h>
+#include <asm/insn.h>
 
 #include "decode-insn.h"
 
@@ -24,7 +25,7 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
 static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
 {
 	u32 insn = __BUG_INSN_32;
-	unsigned long offset = GET_INSN_LENGTH(p->opcode);
+	unsigned long offset = INSN_LEN(p->opcode);
 
 	p->ainsn.api.restore = (unsigned long)p->addr + offset;
 
@@ -58,7 +59,7 @@ static bool __kprobes arch_check_kprobe(struct kprobe *p)
 		if (tmp == addr)
 			return true;
 
-		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+		tmp += INSN_LEN(*(u16 *)tmp);
 	}
 
 	return false;
@@ -76,7 +77,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 
 	/* copy instruction */
 	p->opcode = (kprobe_opcode_t)(*insn++);
-	if (GET_INSN_LENGTH(p->opcode) == 4)
+	if (INSN_LEN(p->opcode) == 4)
 		p->opcode |= (kprobe_opcode_t)(*insn) << 16;
 
 	/* decode instruction */
@@ -117,8 +118,8 @@ void *alloc_insn_page(void)
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
-	u32 insn = (p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32 ?
-		   __BUG_INSN_32 : __BUG_INSN_16;
+	u32 insn = INSN_IS_C(p->opcode) ?
+		   __BUG_INSN_16 : __BUG_INSN_32;
 
 	patch_text(p->addr, &insn, 1);
 }
@@ -344,7 +345,7 @@ kprobe_single_step_handler(struct pt_regs *regs)
 	struct kprobe *cur = kprobe_running();
 
 	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
-	    ((unsigned long)&cur->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode) == addr)) {
+	    ((unsigned long)&cur->ainsn.api.insn[0] + INSN_LEN(cur->opcode) == addr)) {
 		kprobes_restore_local_irqflag(kcb, regs);
 		post_kprobe_handler(cur, kcb, regs);
 		return true;
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 994edb4bd16a..f9671bb864a3 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <asm/insn.h>
 #include <asm/reg.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
@@ -16,19 +17,16 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs
 	 *     1         10          1           8       5    JAL/J
 	 */
 	bool ret;
-	u32 imm;
-	u32 index = (opcode >> 7) & 0x1f;
+	s32 imm;
+	u32 index = riscv_insn_extract_rd(opcode);
 
 	ret = rv_insn_reg_set_val((unsigned long *)regs, index, addr + 4);
 	if (!ret)
 		return ret;
 
-	imm  = ((opcode >> 21) & 0x3ff) << 1;
-	imm |= ((opcode >> 20) & 0x1)   << 11;
-	imm |= ((opcode >> 12) & 0xff)  << 12;
-	imm |= ((opcode >> 31) & 0x1)   << 20;
+	imm = riscv_insn_extract_jtype_imm(opcode);
 
-	instruction_pointer_set(regs, addr + sign_extend32((imm), 20));
+	instruction_pointer_set(regs, addr + imm);
 
 	return ret;
 }
@@ -42,9 +40,9 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	 */
 	bool ret;
 	unsigned long base_addr;
-	u32 imm = (opcode >> 20) & 0xfff;
-	u32 rd_index = (opcode >> 7) & 0x1f;
-	u32 rs1_index = (opcode >> 15) & 0x1f;
+	s32 imm = riscv_insn_extract_itype_imm(opcode);
+	u32 rd_index = riscv_insn_extract_rd(opcode);
+	u32 rs1_index = riscv_insn_extract_rs1(opcode);
 
 	ret = rv_insn_reg_get_val((unsigned long *)regs, rs1_index, &base_addr);
 	if (!ret)
@@ -54,25 +52,11 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	if (!ret)
 		return ret;
 
-	instruction_pointer_set(regs, (base_addr + sign_extend32((imm), 11))&~1);
+	instruction_pointer_set(regs, (base_addr + imm) & ~1);
 
 	return ret;
 }
 
-#define auipc_rd_idx(opcode) \
-	((opcode >> 7) & 0x1f)
-
-#define auipc_imm(opcode) \
-	((((opcode) >> 12) & 0xfffff) << 12)
-
-#if __riscv_xlen == 64
-#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
-#elif __riscv_xlen == 32
-#define auipc_offset(opcode)	auipc_imm(opcode)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
-
 bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
 	/*
@@ -82,35 +66,16 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 	 *        20       5     7
 	 */
 
-	u32 rd_idx = auipc_rd_idx(opcode);
-	unsigned long rd_val = addr + auipc_offset(opcode);
+	u32 rd_idx = riscv_insn_extract_rd(opcode);
+	unsigned long rd_val = addr + riscv_insn_extract_utype_imm(opcode);
 
 	if (!rv_insn_reg_set_val((unsigned long *)regs, rd_idx, rd_val))
 		return false;
 
 	instruction_pointer_set(regs, addr + 4);
-
 	return true;
 }
 
-#define branch_rs1_idx(opcode) \
-	(((opcode) >> 15) & 0x1f)
-
-#define branch_rs2_idx(opcode) \
-	(((opcode) >> 20) & 0x1f)
-
-#define branch_funct3(opcode) \
-	(((opcode) >> 12) & 0x7)
-
-#define branch_imm(opcode) \
-	(((((opcode) >>  8) & 0xf ) <<  1) | \
-	 ((((opcode) >> 25) & 0x3f) <<  5) | \
-	 ((((opcode) >>  7) & 0x1 ) << 11) | \
-	 ((((opcode) >> 31) & 0x1 ) << 12))
-
-#define branch_offset(opcode) \
-	sign_extend32((branch_imm(opcode)), 12)
-
 bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
 	/*
@@ -135,8 +100,8 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 	    !rv_insn_reg_get_val((unsigned long *)regs, riscv_insn_extract_rs2(opcode), &rs2_val))
 		return false;
 
-	offset_tmp = branch_offset(opcode);
-	switch (branch_funct3(opcode)) {
+	offset_tmp = riscv_insn_extract_btype_imm(opcode);
+	switch (riscv_insn_extract_funct3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
 		break;
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index 194f166b2cc4..f2511cbaf931 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/insn.h>
 #include <linux/highmem.h>
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
@@ -29,7 +30,7 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe, struct mm_struct *mm,
 
 	opcode = *(probe_opcode_t *)(&auprobe->insn[0]);
 
-	auprobe->insn_size = GET_INSN_LENGTH(opcode);
+	auprobe->insn_size = INSN_LEN(opcode);
 
 	switch (riscv_probe_decode_insn(&opcode, &auprobe->api)) {
 	case INSN_REJECTED:
@@ -166,7 +167,7 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 
 	/* Add ebreak behind opcode to simulate singlestep */
 	if (vaddr) {
-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
+		dst += INSN_LEN(*(probe_opcode_t *)src);
 		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
 	}
 

-- 
2.34.1


