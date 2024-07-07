From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sun,  7 Jul 2024 18:10:50 +0800
Subject: [kvm-unit-tests PATCH v2 1/3] riscv: Extend exception handling support for interrupts
In-Reply-To: <20240707101053.74386-1-jamestiotio@gmail.com>
References: <20240707101053.74386-1-jamestiotio@gmail.com>
Message-ID: <20240707101053.74386-2-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <andrew.jones@linux.dev>

Add install_irq_handler() to enable tests to install interrupt handlers.
Also add local_irq_enable() and local_irq_disable() to respectively
enable and disable IRQs via the sstatus.SIE bit.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/csr.h       |  2 ++
 lib/riscv/asm/processor.h | 13 +++++++++++++
 lib/riscv/processor.c     | 27 +++++++++++++++++++++++----
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index 52608512..d6909d93 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -11,6 +11,8 @@
 #define CSR_STVAL		0x143
 #define CSR_SATP		0x180
 
+#define SR_SIE			_AC(0x00000002, UL)
+
 /* Exception cause high bit - is an interrupt if set */
 #define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
 
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index 32c499d0..6451adb5 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -5,6 +5,7 @@
 #include <asm/ptrace.h>
 
 #define EXCEPTION_CAUSE_MAX	16
+#define INTERRUPT_CAUSE_MAX	16
 
 typedef void (*exception_fn)(struct pt_regs *);
 
@@ -13,6 +14,7 @@ struct thread_info {
 	unsigned long hartid;
 	unsigned long isa[1];
 	exception_fn exception_handlers[EXCEPTION_CAUSE_MAX];
+	exception_fn interrupt_handlers[INTERRUPT_CAUSE_MAX];
 };
 
 static inline struct thread_info *current_thread_info(void)
@@ -20,7 +22,18 @@ static inline struct thread_info *current_thread_info(void)
 	return (struct thread_info *)csr_read(CSR_SSCRATCH);
 }
 
+static inline void local_irq_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_SIE);
+}
+
+static inline void local_irq_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_SIE);
+}
+
 void install_exception_handler(unsigned long cause, void (*handler)(struct pt_regs *));
+void install_irq_handler(unsigned long cause, void (*handler)(struct pt_regs *));
 void do_handle_exception(struct pt_regs *regs);
 void thread_info_init(void);
 
diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index ece7cbff..0dffadc7 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -36,10 +36,21 @@ void do_handle_exception(struct pt_regs *regs)
 {
 	struct thread_info *info = current_thread_info();
 
-	assert(regs->cause < EXCEPTION_CAUSE_MAX);
-	if (info->exception_handlers[regs->cause]) {
-		info->exception_handlers[regs->cause](regs);
-		return;
+	if (regs->cause & CAUSE_IRQ_FLAG) {
+		unsigned long irq_cause = regs->cause & ~CAUSE_IRQ_FLAG;
+
+		assert(irq_cause < INTERRUPT_CAUSE_MAX);
+		if (info->interrupt_handlers[irq_cause]) {
+			info->interrupt_handlers[irq_cause](regs);
+			return;
+		}
+	} else {
+		assert(regs->cause < EXCEPTION_CAUSE_MAX);
+
+		if (info->exception_handlers[regs->cause]) {
+			info->exception_handlers[regs->cause](regs);
+			return;
+		}
 	}
 
 	show_regs(regs);
@@ -47,6 +58,14 @@ void do_handle_exception(struct pt_regs *regs)
 	abort();
 }
 
+void install_irq_handler(unsigned long cause, void (*handler)(struct pt_regs *))
+{
+	struct thread_info *info = current_thread_info();
+
+	assert(cause < INTERRUPT_CAUSE_MAX);
+	info->interrupt_handlers[cause] = handler;
+}
+
 void install_exception_handler(unsigned long cause, void (*handler)(struct pt_regs *))
 {
 	struct thread_info *info = current_thread_info();
-- 
2.43.0


