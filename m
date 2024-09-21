From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sat, 21 Sep 2024 18:08:20 +0800
Subject: [kvm-unit-tests PATCH v5 2/5] riscv: sbi: Provide entry point for HSM tests
In-Reply-To: <20240921100824.151761-1-jamestiotio@gmail.com>
References: <20240921100824.151761-1-jamestiotio@gmail.com>
Message-ID: <20240921100824.151761-3-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The HSM tests will need to test HSM start and resumption from HSM
suspend. Provide an entry point written in assembly that doesn't
use a stack for this. Results of the test are written to global
per-hart arrays to be checked by the main SBI HSM test function. The
started/resumed hart does its checks and then just loops until it
gets a signal from the main SBI HSM test function to invoke HSM stop.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
Co-developed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/Makefile    |  3 +-
 riscv/sbi-tests.h | 10 +++++++
 riscv/sbi-asm.S   | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c       |  5 ++++
 4 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 riscv/sbi-tests.h
 create mode 100644 riscv/sbi-asm.S

diff --git a/riscv/Makefile b/riscv/Makefile
index 2ee7c5bb..4676d262 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -43,6 +43,7 @@ cflatobjs += lib/riscv/timer.o
 ifeq ($(ARCH),riscv32)
 cflatobjs += lib/ldiv32.o
 endif
+cflatobjs += riscv/sbi-asm.o
 
 ########################################
 
@@ -80,7 +81,7 @@ CFLAGS += -mcmodel=medany
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
+CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)/riscv
 
 asm-offsets = lib/riscv/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
new file mode 100644
index 00000000..f5cc8635
--- /dev/null
+++ b/riscv/sbi-tests.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _RISCV_SBI_TESTS_H_
+#define _RISCV_SBI_TESTS_H_
+
+#define SBI_HSM_TEST_DONE	(1 << 0)
+#define SBI_HSM_TEST_HARTID_A1	(1 << 1)
+#define SBI_HSM_TEST_SATP	(1 << 2)
+#define SBI_HSM_TEST_SIE	(1 << 3)
+
+#endif /* _RISCV_SBI_TESTS_H_ */
diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
new file mode 100644
index 00000000..f165f9da
--- /dev/null
+++ b/riscv/sbi-asm.S
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Helper assembly code routines for RISC-V SBI extension tests.
+ *
+ * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#define __ASSEMBLY__
+#include <asm/csr.h>
+
+#include "sbi-tests.h"
+
+.section .text
+
+/*
+ * sbi_hsm_check
+ *   a0 and a1 are set by SBI HSM start/suspend
+ *   s1 is the address of the results array
+ * Doesn't return.
+ *
+ * This function is only called from HSM start and on resumption
+ * from HSM suspend which means we can do whatever we like with
+ * all registers. So, to avoid complicated register agreements with
+ * other assembly functions called, we just always use the saved
+ * registers for anything that should be maintained across calls.
+ */
+#define RESULTS_ARRAY	s1
+#define RESULTS_MAP	s2
+#define CPU_INDEX	s3
+.balign 4
+sbi_hsm_check:
+	li	RESULTS_MAP, 0
+	bne	a0, a1, 1f
+	ori	RESULTS_MAP, RESULTS_MAP, SBI_HSM_TEST_HARTID_A1
+1:	csrr	t0, CSR_SATP
+	bnez	t0, 2f
+	ori	RESULTS_MAP, RESULTS_MAP, SBI_HSM_TEST_SATP
+2:	csrr	t0, CSR_SSTATUS
+	andi	t0, t0, SR_SIE
+	bnez	t0, 3f
+	ori	RESULTS_MAP, RESULTS_MAP, SBI_HSM_TEST_SIE
+3:	call	hartid_to_cpu
+	mv	CPU_INDEX, a0
+	li	t0, -1
+	bne	CPU_INDEX, t0, 5f
+4:	pause
+	j	4b
+5:	ori	RESULTS_MAP, RESULTS_MAP, SBI_HSM_TEST_DONE
+	add	t0, RESULTS_ARRAY, CPU_INDEX
+	sb	RESULTS_MAP, 0(t0)
+	la	t1, sbi_hsm_stop_hart
+	add	t1, t1, CPU_INDEX
+6:	lb	t0, 0(t1)
+	pause
+	beqz	t0, 6b
+	li	a7, 0x48534d	/* SBI_EXT_HSM */
+	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
+	ecall
+7:	pause
+	j	7b
+
+.balign 4
+.global sbi_hsm_check_hart_start
+sbi_hsm_check_hart_start:
+	la	RESULTS_ARRAY, sbi_hsm_hart_start_checks
+	j	sbi_hsm_check
+
+.balign 4
+.global sbi_hsm_check_non_retentive_suspend
+sbi_hsm_check_non_retentive_suspend:
+	la	RESULTS_ARRAY, sbi_hsm_non_retentive_hart_suspend_checks
+	j	sbi_hsm_check
diff --git a/riscv/sbi.c b/riscv/sbi.c
index a7abc08c..b5147dee 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -18,6 +18,7 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
 
@@ -429,6 +430,10 @@ static void check_dbcn(void)
 	report_prefix_popn(2);
 }
 
+unsigned char sbi_hsm_stop_hart[NR_CPUS];
+unsigned char sbi_hsm_hart_start_checks[NR_CPUS];
+unsigned char sbi_hsm_non_retentive_hart_suspend_checks[NR_CPUS];
+
 int main(int argc, char **argv)
 {
 	if (argc > 1 && !strcmp(argv[1], "-h")) {
-- 
2.43.0


