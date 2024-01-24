From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:26 +0100
Subject: [kvm-unit-tests PATCH 10/24] riscv: Add backtrace support
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-36-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable stack unwinding, even when going through an exception, by
implementing backtrace() and pushing a frame pointer on the stack
in exception_vectors.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/stack.h |  3 +++
 lib/riscv/stack.c     | 32 ++++++++++++++++++++++++++++++++
 riscv/Makefile        |  1 +
 riscv/cstart.S        | 28 ++++++++++++++++++++++++++--
 4 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 lib/riscv/stack.c

diff --git a/lib/riscv/asm/stack.h b/lib/riscv/asm/stack.h
index d081d0716d7b..f003ca37c913 100644
--- a/lib/riscv/asm/stack.h
+++ b/lib/riscv/asm/stack.h
@@ -6,4 +6,7 @@
 #error Do not directly include <asm/stack.h>. Just use <stack.h>.
 #endif
 
+#define HAVE_ARCH_BACKTRACE_FRAME
+#define HAVE_ARCH_BACKTRACE
+
 #endif
diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
new file mode 100644
index 000000000000..712a5478d547
--- /dev/null
+++ b/lib/riscv/stack.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <libcflat.h>
+#include <stack.h>
+
+int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+{
+	static bool walking;
+	const unsigned long *fp = (unsigned long *)frame;
+	int depth;
+
+	if (walking) {
+		printf("RECURSIVE STACK WALK!!!\n");
+		return 0;
+	}
+	walking = true;
+
+	for (depth = 0; fp && depth < max_depth; ++depth) {
+		return_addrs[depth] = (void *)fp[-1];
+		if (return_addrs[depth] == 0)
+			break;
+		fp = (unsigned long *)fp[-2];
+	}
+
+	walking = false;
+	return depth;
+}
+
+int backtrace(const void **return_addrs, int max_depth)
+{
+	return backtrace_frame(__builtin_frame_address(0),
+			       return_addrs, max_depth);
+}
diff --git a/riscv/Makefile b/riscv/Makefile
index 1243be125c00..4a83f27f7df2 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -30,6 +30,7 @@ cflatobjs += lib/riscv/processor.o
 cflatobjs += lib/riscv/sbi.o
 cflatobjs += lib/riscv/setup.o
 cflatobjs += lib/riscv/smp.o
+cflatobjs += lib/riscv/stack.o
 ifeq ($(ARCH),riscv32)
 cflatobjs += lib/ldiv32.o
 endif
diff --git a/riscv/cstart.S b/riscv/cstart.S
index ac7858ef398f..9bdf2e3b17dd 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -17,6 +17,22 @@
 
 #define REG_L	__REG_SEL(ld, lw)
 #define REG_S	__REG_SEL(sd, sw)
+#define SZREG	__REG_SEL(8, 4)
+
+#define FP_SIZE 16
+
+.macro push_fp, ra=ra
+	addi	sp, sp, -FP_SIZE
+	REG_S	\ra, (FP_SIZE - SZREG)(sp)
+	REG_S	fp, (FP_SIZE - 2*SZREG)(sp)
+	addi	fp, sp, FP_SIZE
+.endm
+
+.macro pop_fp
+	REG_L	ra, (FP_SIZE - SZREG)(sp)
+	REG_L	fp, (FP_SIZE - 2*SZREG)(sp)
+	addi	sp, sp, FP_SIZE
+.endm
 
 .macro zero_range, tmp1, tmp2
 9998:	beq	\tmp1, \tmp2, 9997f
@@ -73,6 +89,7 @@ start:
 	li	a1, -8192
 	add	a1, sp, a1
 	zero_range a1, sp
+	mv	fp, zero			// Ensure fp starts out as zero
 
 	/* set up exception handling */
 	la	a1, exception_vectors
@@ -200,9 +217,16 @@ halt:
 .balign 4
 .global exception_vectors
 exception_vectors:
-	REG_S	a0, (-PT_SIZE + PT_ORIG_A0)(sp)
-	addi	a0, sp, -PT_SIZE
+	REG_S	a0, (-PT_SIZE - FP_SIZE + PT_ORIG_A0)(sp)
+	addi	a0, sp, -PT_SIZE - FP_SIZE
 	save_context
+	/*
+	 * Set a frame pointer "ra" which points to the last instruction.
+	 * Add 1 to it, because pretty_print_stacks.py subtracts 1.
+	 */
+	REG_L	a1, PT_EPC(a0)
+	addi	a1, a1, 1
+	push_fp	a1
 	mv	sp, a0
 	call	do_handle_exception
 	restore_context
-- 
2.43.0


