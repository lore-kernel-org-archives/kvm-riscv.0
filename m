From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:29 -0700
Subject: [PATCH 04/10] RISC-V: KGDB: Refactor instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-4-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use shared instruction definitions in insn.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/kgdb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2393342ab362..e1305706120e 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -5,7 +5,6 @@
 
 #include <linux/ptrace.h>
 #include <linux/kdebug.h>
-#include <linux/bug.h>
 #include <linux/kgdb.h>
 #include <linux/irqflags.h>
 #include <linux/string.h>
@@ -25,12 +24,12 @@ static unsigned int stepped_opcode;
 
 static int decode_register_index(unsigned long opcode, int offset)
 {
-	return (opcode >> offset) & 0x1F;
+	return (opcode >> offset) & RV_STANDARD_REG_MASK;
 }
 
 static int decode_register_index_short(unsigned long opcode, int offset)
 {
-	return ((opcode >> offset) & 0x7) + 8;
+	return ((opcode >> offset) & RV_COMPRESSED_REG_MASK) + 8;
 }
 
 /* Calculate the new address for after a step */
@@ -43,7 +42,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 
 	if (get_kernel_nofault(op_code, (void *)pc))
 		return -EINVAL;
-	if ((op_code & __INSN_LENGTH_MASK) != INSN_C_MASK) {
+	if (INSN_IS_C(op_code)) {
 		if (riscv_insn_is_c_jalr(op_code) ||
 		    riscv_insn_is_c_jr(op_code)) {
 			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
@@ -55,14 +54,14 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 			rs1_num = decode_register_index_short(op_code,
 							      RVC_C1_RS1_OPOFF);
 			if (!rs1_num || regs_ptr[rs1_num] == 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+				*next_addr = RVC_EXTRACT_BZ_IMM(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else if (riscv_insn_is_c_bnez(op_code)) {
 			rs1_num =
 			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
 			if (rs1_num && regs_ptr[rs1_num] != 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+				*next_addr = RVC_EXTRACT_BZ_IMM(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else {

-- 
2.34.1


