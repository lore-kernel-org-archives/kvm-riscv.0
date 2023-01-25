From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 25 Jan 2023 14:20:47 +0000
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in the first-use trap
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
Message-ID: <20230125142056.18356-11-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Vector unit is disabled by default for all user processes. Thus, a
process will take a trap (illegal instruction) into kernel at the first
time when it uses Vector. Only after then, the kernel allocates V
context and starts take care of the context for that user process.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/insn.h   | 24 +++++++++
 arch/riscv/include/asm/vector.h |  2 +
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/vector.c      | 89 +++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 25ef9c0b19e7..b1ef3617881f 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -133,6 +133,24 @@
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
+#define RVG_SYSTEM_CSR_OFF	20
+#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+
+/* parts of opcode for RVV */
+#define OPCODE_VECTOR		0x57
+#define LSFP_WIDTH_RVV_8	0
+#define LSFP_WIDTH_RVV_16	5
+#define LSFP_WIDTH_RVV_32	6
+#define LSFP_WIDTH_RVV_64	7
+
+/* parts of opcode for RVF, RVD and RVQ */
+#define LSFP_WIDTH_OFF		12
+#define LSFP_WIDTH_MASK		GENMASK(3, 0)
+#define LSFP_WIDTH_FP_W		2
+#define LSFP_WIDTH_FP_D		3
+#define LSFP_WIDTH_FP_Q		4
+#define OPCODE_LOADFP		0x07
+#define OPCODE_STOREFP		0x27
 
 /* parts of opcode for RVC*/
 #define RVC_OPCODE_C0		0x0
@@ -291,6 +309,12 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
+#define EXTRACT_LOAD_STORE_FP_WIDTH(x) \
+	({typeof(x) x_ = (x); RV_X(x_, LSFP_WIDTH_OFF, LSFP_WIDTH_MASK); })
+
+#define EXTRACT_SYSTEM_CSR(x) \
+	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+
 /*
  * Get the immediate from a J-type instruction.
  *
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index f8a9e37c4374..7c77696d704a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -19,6 +19,7 @@
 #define CSR_STR(x) __ASM_STR(x)
 
 extern unsigned long riscv_vsize;
+bool rvv_first_use_handler(struct pt_regs *regs);
 
 static __always_inline bool has_vector(void)
 {
@@ -138,6 +139,7 @@ static inline void vstate_restore(struct task_struct *task,
 struct pt_regs;
 
 static __always_inline bool has_vector(void) { return false; }
+static inline bool rvv_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_vsize (0)
 #define vstate_save(task, regs)		do {} while (0)
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..48d345a5f326 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..cdd58d1c8b3c
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/sched/signal.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/uaccess.h>
+
+#include <asm/thread_info.h>
+#include <asm/processor.h>
+#include <asm/insn.h>
+#include <asm/vector.h>
+#include <asm/ptrace.h>
+#include <asm/bug.h>
+
+static bool insn_is_vector(u32 insn_buf)
+{
+	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
+	/*
+	 * All V-related instructions, including CSR operations are 4-Byte. So,
+	 * do not handle if the instruction length is not 4-Byte.
+	 */
+	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
+		return false;
+	if (opcode == OPCODE_VECTOR) {
+		return true;
+	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
+		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
+
+		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
+		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
+			return true;
+	} else if (opcode == RVG_OPCODE_SYSTEM) {
+		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
+
+		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
+		    (csr >= CSR_VL && csr <= CSR_VLENB))
+			return true;
+	}
+	return false;
+}
+
+int rvv_thread_zalloc(void)
+{
+	void *datap;
+
+	datap = kzalloc(riscv_vsize, GFP_KERNEL);
+	if (!datap)
+		return -ENOMEM;
+	current->thread.vstate.datap = datap;
+	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_state,
+						    datap));
+	return 0;
+}
+
+bool rvv_first_use_handler(struct pt_regs *regs)
+{
+	__user u32 *epc = (u32 *)regs->epc;
+	u32 tval = (u32)regs->badaddr;
+
+	/* If V has been enabled then it is not the first-use trap */
+	if (vstate_query(regs))
+		return false;
+	/* Get the instruction */
+	if (!tval) {
+		if (__get_user(tval, epc))
+			return false;
+	}
+	/* Filter out non-V instructions */
+	if (!insn_is_vector(tval))
+		return false;
+	/* Sanity check. datap should be null by the time of the first-use trap */
+	WARN_ON(current->thread.vstate.datap);
+	/*
+	 * Now we sure that this is a V instruction. And it executes in the
+	 * context where VS has been off. So, try to allocate the user's V
+	 * context and resume execution.
+	 */
+	if (rvv_thread_zalloc()) {
+		force_sig(SIGKILL);
+		return true;
+	}
+	vstate_on(regs);
+	return true;
+}
+
-- 
2.17.1


