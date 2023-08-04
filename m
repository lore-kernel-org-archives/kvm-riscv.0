From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:28 -0700
Subject: [PATCH 03/10] RISC-V: Refactor jump label instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-3-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use shared instruction definitions in insn.h instead of manually
constructing them.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/insn.h  |  2 +-
 arch/riscv/kernel/jump_label.c | 13 ++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 04f7649e1add..124ab02973a7 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -1984,7 +1984,7 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 		<< RVC_J_IMM_10_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
 
-#define RVC_EXTRACT_BTYPE_IMM(x) \
+#define RVC_EXTRACT_BZ_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RVC_X(x_, RVC_BZ_IMM_2_1_OPOFF, RVC_BZ_IMM_2_1_MASK) \
 		<< RVC_BZ_IMM_2_1_OFF) | \
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index e6694759dbd0..fdaac2a13eac 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,11 +9,9 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
-#define RISCV_INSN_NOP 0x00000013U
-#define RISCV_INSN_JAL 0x0000006fU
-
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
@@ -26,13 +24,10 @@ void arch_jump_label_transform(struct jump_entry *entry,
 		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
 			return;
 
-		insn = RISCV_INSN_JAL |
-			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
-			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
-			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
-			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+		insn = RVG_OPCODE_JAL;
+		riscv_insn_insert_jtype_imm(&insn, (s32)offset);
 	} else {
-		insn = RISCV_INSN_NOP;
+		insn = RVG_OPCODE_NOP;
 	}
 
 	mutex_lock(&text_mutex);

-- 
2.34.1


