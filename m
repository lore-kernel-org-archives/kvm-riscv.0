From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Wed, 19 Jun 2024 01:30:51 +0800
Subject: [kvm-unit-tests PATCH 2/4] riscv: Update exception cause list
In-Reply-To: <20240618173053.364776-1-jamestiotio@gmail.com>
References: <20240618173053.364776-1-jamestiotio@gmail.com>
Message-ID: <20240618173053.364776-3-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update the list of exception and interrupt causes to follow the latest
RISC-V privileged ISA specification (version 20240411).

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/csr.h       | 15 +++++++++------
 lib/riscv/asm/processor.h |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index d5879d2a..c1777744 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -26,15 +26,18 @@
 #define EXC_STORE_MISALIGNED	6
 #define EXC_STORE_ACCESS	7
 #define EXC_SYSCALL		8
-#define EXC_HYPERVISOR_SYSCALL	9
-#define EXC_SUPERVISOR_SYSCALL	10
+#define EXC_SUPERVISOR_SYSCALL	9
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
-#define EXC_INST_GUEST_PAGE_FAULT	20
-#define EXC_LOAD_GUEST_PAGE_FAULT	21
-#define EXC_VIRTUAL_INST_FAULT		22
-#define EXC_STORE_GUEST_PAGE_FAULT	23
+#define EXC_SOFTWARE_CHECK	18
+#define EXC_HARDWARE_ERROR	19
+
+/* Interrupt causes */
+#define IRQ_SUPERVISOR_SOFTWARE	1
+#define IRQ_SUPERVISOR_TIMER	5
+#define IRQ_SUPERVISOR_EXTERNAL	9
+#define IRQ_COUNTER_OVERFLOW	13
 
 #ifndef __ASSEMBLY__
 
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index 767b1caa..5942ed2e 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -4,7 +4,7 @@
 #include <asm/csr.h>
 #include <asm/ptrace.h>
 
-#define EXCEPTION_CAUSE_MAX	16
+#define EXCEPTION_CAUSE_MAX	64
 #define INTERRUPT_CAUSE_MAX	16
 
 typedef void (*exception_fn)(struct pt_regs *);
-- 
2.43.0


