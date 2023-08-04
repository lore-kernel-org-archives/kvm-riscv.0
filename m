From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 03 Aug 2023 19:10:35 -0700
Subject: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
Message-ID: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use shared instruction definitions in insn.h instead of manually
constructing them.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/bug.h | 18 +++++-------------
 arch/riscv/kernel/traps.c    |  9 +++++----
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6d9002d93f85 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -11,21 +11,13 @@
 #include <linux/types.h>
 
 #include <asm/asm.h>
+#include <asm/insn.h>
 
-#define __INSN_LENGTH_MASK  _UL(0x3)
-#define __INSN_LENGTH_32    _UL(0x3)
-#define __COMPRESSED_INSN_MASK	_UL(0xffff)
+#define __IS_BUG_INSN_32(insn) riscv_insn_is_c_ebreak(insn)
+#define __IS_BUG_INSN_16(insn) riscv_insn_is_ebreak(insn)
 
-#define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
-#define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
-
-#define GET_INSN_LENGTH(insn)						\
-({									\
-	unsigned long __len;						\
-	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
-		4UL : 2UL;						\
-	__len;								\
-})
+#define __BUG_INSN_32	RVG_MATCH_EBREAK
+#define __BUG_INSN_16	RVC_MATCH_C_EBREAK
 
 typedef u32 bug_insn_t;
 
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d..970b118d36b5 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -22,6 +22,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/bug.h>
 #include <asm/csr.h>
+#include <asm/insn.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
@@ -243,7 +244,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
 
-	return GET_INSN_LENGTH(insn);
+	return INSN_LEN(insn);
 }
 
 void handle_break(struct pt_regs *regs)
@@ -389,10 +390,10 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
-	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
-		return (insn == __BUG_INSN_32);
+	if (INSN_IS_C(insn))
+		return __IS_BUG_INSN_16(insn);
 	else
-		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
+		return __IS_BUG_INSN_32(insn);
 }
 #endif /* CONFIG_GENERIC_BUG */
 

-- 
2.34.1


