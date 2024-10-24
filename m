From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:41:03 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: Implement setjmp/longjmp
In-Reply-To: <20241024124101.73405-5-andrew.jones@linux.dev>
References: <20241024124101.73405-5-andrew.jones@linux.dev>
Message-ID: <20241024124101.73405-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Being able to do setjmp and longjmp can be quite useful for tests.
Implement the functions for riscv.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/setjmp.S | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/setjmp.h       |  4 ++++
 riscv/Makefile     |  1 +
 3 files changed, 55 insertions(+)
 create mode 100644 lib/riscv/setjmp.S

diff --git a/lib/riscv/setjmp.S b/lib/riscv/setjmp.S
new file mode 100644
index 000000000000..38b0f1cab576
--- /dev/null
+++ b/lib/riscv/setjmp.S
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#define __ASSEMBLY__
+#include <asm/asm.h>
+
+.section .text
+
+.balign 4
+.global setjmp
+setjmp:
+	REG_S	ra, (0 * SZREG)(a0)
+	REG_S	s0, (1 * SZREG)(a0)
+	REG_S	s1, (2 * SZREG)(a0)
+	REG_S	s2, (3 * SZREG)(a0)
+	REG_S	s3, (4 * SZREG)(a0)
+	REG_S	s4, (5 * SZREG)(a0)
+	REG_S	s5, (6 * SZREG)(a0)
+	REG_S	s6, (7 * SZREG)(a0)
+	REG_S	s7, (8 * SZREG)(a0)
+	REG_S	s8, (9 * SZREG)(a0)
+	REG_S	s9, (10 * SZREG)(a0)
+	REG_S	s10, (11 * SZREG)(a0)
+	REG_S	s11, (12 * SZREG)(a0)
+	REG_S	sp, (13 * SZREG)(a0)
+	REG_S	gp, (14 * SZREG)(a0)
+	REG_S	tp, (15 * SZREG)(a0)
+	li	a0, 0
+	ret
+
+.balign 4
+.global longjmp
+longjmp:
+	REG_L	ra, (0 * SZREG)(a0)
+	REG_L	s0, (1 * SZREG)(a0)
+	REG_L	s1, (2 * SZREG)(a0)
+	REG_L	s2, (3 * SZREG)(a0)
+	REG_L	s3, (4 * SZREG)(a0)
+	REG_L	s4, (5 * SZREG)(a0)
+	REG_L	s5, (6 * SZREG)(a0)
+	REG_L	s6, (7 * SZREG)(a0)
+	REG_L	s7, (8 * SZREG)(a0)
+	REG_L	s8, (9 * SZREG)(a0)
+	REG_L	s9, (10 * SZREG)(a0)
+	REG_L	s10, (11 * SZREG)(a0)
+	REG_L	s11, (12 * SZREG)(a0)
+	REG_L	sp, (13 * SZREG)(a0)
+	REG_L	gp, (14 * SZREG)(a0)
+	REG_L	tp, (15 * SZREG)(a0)
+	seqz	a0, a1
+	add	a0, a0, a1
+	ret
diff --git a/lib/setjmp.h b/lib/setjmp.h
index 6afdf665681a..f878ad81c645 100644
--- a/lib/setjmp.h
+++ b/lib/setjmp.h
@@ -8,7 +8,11 @@
 #define _LIBCFLAT_SETJMP_H_
 
 typedef struct jmp_buf_tag {
+#if defined(__i386__) || defined(__x86_64__)
 	long int regs[8];
+#elif defined(__riscv)
+	long int regs[16];
+#endif
 } jmp_buf[1];
 
 extern int setjmp (struct jmp_buf_tag env[1]);
diff --git a/riscv/Makefile b/riscv/Makefile
index 734441f94dad..28b04156bfd5 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -36,6 +36,7 @@ cflatobjs += lib/riscv/isa.o
 cflatobjs += lib/riscv/mmu.o
 cflatobjs += lib/riscv/processor.o
 cflatobjs += lib/riscv/sbi.o
+cflatobjs += lib/riscv/setjmp.o
 cflatobjs += lib/riscv/setup.o
 cflatobjs += lib/riscv/smp.o
 cflatobjs += lib/riscv/stack.o
-- 
2.47.0


