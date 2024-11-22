From: Clément Léger <cleger@rivosinc.com>
Date: Fri, 22 Nov 2024 15:04:56 +0100
Subject: [kvm-unit-tests PATCH v2 2/3] riscv: lib: Add SSE assembly entry handling
In-Reply-To: <20241122140459.566306-1-cleger@rivosinc.com>
References: <20241122140459.566306-1-cleger@rivosinc.com>
Message-ID: <20241122140459.566306-3-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a SSE entry assembly code to handle SSE events. Events should be
registered with a struct sse_handler_arg containing a correct stack and
handler function.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 riscv/Makefile          |   1 +
 lib/riscv/asm/sse.h     |  16 +++++++
 lib/riscv/sse-entry.S   | 100 ++++++++++++++++++++++++++++++++++++++++
 lib/riscv/asm-offsets.c |   9 ++++
 4 files changed, 126 insertions(+)
 create mode 100644 lib/riscv/asm/sse.h
 create mode 100644 lib/riscv/sse-entry.S

diff --git a/riscv/Makefile b/riscv/Makefile
index 28b04156..e50621ad 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -39,6 +39,7 @@ cflatobjs += lib/riscv/sbi.o
 cflatobjs += lib/riscv/setjmp.o
 cflatobjs += lib/riscv/setup.o
 cflatobjs += lib/riscv/smp.o
+cflatobjs += lib/riscv/sse-entry.o
 cflatobjs += lib/riscv/stack.o
 cflatobjs += lib/riscv/timer.o
 ifeq ($(ARCH),riscv32)
diff --git a/lib/riscv/asm/sse.h b/lib/riscv/asm/sse.h
new file mode 100644
index 00000000..557f6680
--- /dev/null
+++ b/lib/riscv/asm/sse.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_SSE_H_
+#define _ASMRISCV_SSE_H_
+
+typedef void (*sse_handler_fn)(void *data, struct pt_regs *regs, unsigned int hartid);
+
+struct sse_handler_arg {
+	unsigned long reg_tmp;
+	sse_handler_fn handler;
+	void *handler_data;
+	void *stack;
+};
+
+extern void sse_entry(void);
+
+#endif /* _ASMRISCV_SSE_H_ */
diff --git a/lib/riscv/sse-entry.S b/lib/riscv/sse-entry.S
new file mode 100644
index 00000000..bedc47e9
--- /dev/null
+++ b/lib/riscv/sse-entry.S
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SBI SSE entry code
+ *
+ * Copyright (C) 2024, Rivos Inc., Cl?ment L?ger <cleger@rivosinc.com>
+ */
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/csr.h>
+
+.global sse_entry
+sse_entry:
+	/* Save stack temporarily */
+	REG_S sp, SSE_REG_TMP(a6)
+	/* Set entry stack */
+	REG_L sp, SSE_HANDLER_STACK(a6)
+
+	addi sp, sp, -(PT_SIZE)
+	REG_S ra, PT_RA(sp)
+	REG_S s0, PT_S0(sp)
+	REG_S s1, PT_S1(sp)
+	REG_S s2, PT_S2(sp)
+	REG_S s3, PT_S3(sp)
+	REG_S s4, PT_S4(sp)
+	REG_S s5, PT_S5(sp)
+	REG_S s6, PT_S6(sp)
+	REG_S s7, PT_S7(sp)
+	REG_S s8, PT_S8(sp)
+	REG_S s9, PT_S9(sp)
+	REG_S s10, PT_S10(sp)
+	REG_S s11, PT_S11(sp)
+	REG_S tp, PT_TP(sp)
+	REG_S t0, PT_T0(sp)
+	REG_S t1, PT_T1(sp)
+	REG_S t2, PT_T2(sp)
+	REG_S t3, PT_T3(sp)
+	REG_S t4, PT_T4(sp)
+	REG_S t5, PT_T5(sp)
+	REG_S t6, PT_T6(sp)
+	REG_S gp, PT_GP(sp)
+	REG_S a0, PT_A0(sp)
+	REG_S a1, PT_A1(sp)
+	REG_S a2, PT_A2(sp)
+	REG_S a3, PT_A3(sp)
+	REG_S a4, PT_A4(sp)
+	REG_S a5, PT_A5(sp)
+	csrr a1, CSR_SEPC
+	REG_S a1, PT_EPC(sp)
+	csrr a2, CSR_SSTATUS
+	REG_S a2, PT_STATUS(sp)
+
+	REG_L a0, SSE_REG_TMP(a6)
+	REG_S a0, PT_SP(sp)
+
+	REG_L t0, SSE_HANDLER(a6)
+	REG_L a0, SSE_HANDLER_DATA(a6)
+	move a1, sp
+	move a2, a7
+	jalr t0
+
+
+	REG_L a1, PT_EPC(sp)
+	REG_L a2, PT_STATUS(sp)
+	csrw CSR_SEPC, a1
+	csrw CSR_SSTATUS, a2
+
+	REG_L ra, PT_RA(sp)
+	REG_L s0, PT_S0(sp)
+	REG_L s1, PT_S1(sp)
+	REG_L s2, PT_S2(sp)
+	REG_L s3, PT_S3(sp)
+	REG_L s4, PT_S4(sp)
+	REG_L s5, PT_S5(sp)
+	REG_L s6, PT_S6(sp)
+	REG_L s7, PT_S7(sp)
+	REG_L s8, PT_S8(sp)
+	REG_L s9, PT_S9(sp)
+	REG_L s10, PT_S10(sp)
+	REG_L s11, PT_S11(sp)
+	REG_L tp, PT_TP(sp)
+	REG_L t0, PT_T0(sp)
+	REG_L t1, PT_T1(sp)
+	REG_L t2, PT_T2(sp)
+	REG_L t3, PT_T3(sp)
+	REG_L t4, PT_T4(sp)
+	REG_L t5, PT_T5(sp)
+	REG_L t6, PT_T6(sp)
+	REG_L gp, PT_GP(sp)
+	REG_L a0, PT_A0(sp)
+	REG_L a1, PT_A1(sp)
+	REG_L a2, PT_A2(sp)
+	REG_L a3, PT_A3(sp)
+	REG_L a4, PT_A4(sp)
+	REG_L a5, PT_A5(sp)
+
+	REG_L sp, PT_SP(sp)
+
+	li a7, ASM_SBI_EXT_SSE
+	li a6, ASM_SBI_EXT_SSE_COMPLETE
+	ecall
diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
index 6c511c14..b3465eeb 100644
--- a/lib/riscv/asm-offsets.c
+++ b/lib/riscv/asm-offsets.c
@@ -3,7 +3,9 @@
 #include <elf.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
+#include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/sse.h>
 
 int main(void)
 {
@@ -63,5 +65,12 @@ int main(void)
 	OFFSET(THREAD_INFO_HARTID, thread_info, hartid);
 	DEFINE(THREAD_INFO_SIZE, sizeof(struct thread_info));
 
+	OFFSET(SSE_REG_TMP, sse_handler_arg, reg_tmp);
+	OFFSET(SSE_HANDLER, sse_handler_arg, handler);
+	OFFSET(SSE_HANDLER_DATA, sse_handler_arg, handler_data);
+	OFFSET(SSE_HANDLER_STACK, sse_handler_arg, stack);
+	DEFINE(ASM_SBI_EXT_SSE, SBI_EXT_SSE);
+	DEFINE(ASM_SBI_EXT_SSE_COMPLETE, SBI_EXT_SSE_COMPLETE);
+
 	return 0;
 }
-- 
2.45.2


