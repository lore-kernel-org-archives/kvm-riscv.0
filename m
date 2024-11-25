From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 17:21:51 +0100
Subject: [kvm-unit-tests PATCH v4 2/5] riscv: use asm-offsets to generate SBI_EXT_HSM values
In-Reply-To: <20241125162200.1630845-1-cleger@rivosinc.com>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
Message-ID: <20241125162200.1630845-3-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace hardcoded values with generated ones using asm-offset. This
allows to directly use ASM_SBI_EXT_HSM and ASM_SBI_EXT_HSM_START in
assembly.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 riscv/Makefile           |  2 +-
 riscv/sbi-asm.S          |  6 ++++--
 riscv/asm-offsets-test.c | 12 ++++++++++++
 riscv/.gitignore         |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 riscv/asm-offsets-test.c
 create mode 100644 riscv/.gitignore

diff --git a/riscv/Makefile b/riscv/Makefile
index 28b04156..a01ff8a3 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -86,7 +86,7 @@ CFLAGS += -ffreestanding
 CFLAGS += -O2
 CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib -I $(SRCDIR)/riscv
 
-asm-offsets = lib/riscv/asm-offsets.h
+asm-offsets = lib/riscv/asm-offsets.h riscv/asm-offsets-test.h
 include $(SRCDIR)/scripts/asm-offsets.mak
 
 %.aux.o: $(SRCDIR)/lib/auxinfo.c
diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
index 923c2cec..193d9606 100644
--- a/riscv/sbi-asm.S
+++ b/riscv/sbi-asm.S
@@ -7,6 +7,8 @@
 #define __ASSEMBLY__
 #include <asm/asm.h>
 #include <asm/csr.h>
+#include <asm/asm-offsets.h>
+#include <generated/asm-offsets-test.h>
 
 #include "sbi-tests.h"
 
@@ -58,8 +60,8 @@ sbi_hsm_check:
 7:	lb	t0, 0(t1)
 	pause
 	beqz	t0, 7b
-	li	a7, 0x48534d	/* SBI_EXT_HSM */
-	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
+	li	a7, ASM_SBI_EXT_HSM
+	li	a6, ASM_SBI_EXT_HSM_HART_STOP
 	ecall
 8:	pause
 	j	8b
diff --git a/riscv/asm-offsets-test.c b/riscv/asm-offsets-test.c
new file mode 100644
index 00000000..116fe497
--- /dev/null
+++ b/riscv/asm-offsets-test.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kbuild.h>
+#include <asm/sbi.h>
+#include "sbi-tests.h"
+
+int main(void)
+{
+	DEFINE(ASM_SBI_EXT_HSM, SBI_EXT_HSM);
+	DEFINE(ASM_SBI_EXT_HSM_HART_STOP, SBI_EXT_HSM_HART_STOP);
+
+	return 0;
+}
diff --git a/riscv/.gitignore b/riscv/.gitignore
new file mode 100644
index 00000000..91713581
--- /dev/null
+++ b/riscv/.gitignore
@@ -0,0 +1 @@
+/asm-offsets-test.[hs]
-- 
2.45.2


