From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 21 Jun 2024 17:32:23 +0800
Subject: [RFC v2 2/2] riscv: Use Zawrs to accelerate IPI to idle cpu
In-Reply-To: <20240621093223.37893-1-luxu.kernel@bytedance.com>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
Message-ID: <20240621093223.37893-3-luxu.kernel@bytedance.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When sending IPI to a cpu which has entered idle state using Zawrs
extension, there is no need to send a physical software interrupt.
Instead, we can write the IPI information to the address reserved by
target cpu, which will wake it from WRS.NTO. Then the target cpu can
handle the IPI directly without falling into traditional interrupt
handling routine.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/processor.h | 14 +++++++
 arch/riscv/include/asm/smp.h       | 14 +++++++
 arch/riscv/kernel/process.c        | 65 +++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            | 39 ++++++++++++------
 4 files changed, 118 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5ad572645bee..45e060831313 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -173,6 +173,20 @@ static inline void wrs_nto(unsigned long *addr)
 			: : "memory");
 }
 
+static inline void wrs_nto_if(int *addr, int val)
+{
+	int prev;
+
+	__asm__ __volatile__(
+			"lr.w %[p], %[a]\n\t"
+			"bne %[p], %[v], 1f\n\t"
+			ZAWRS_WRS_NTO "\n\t"
+			"1:\n\t"
+			: [p] "=&r" (prev), [a] "+A" (*addr)
+			: [v] "r" (val)
+			: "memory");
+}
+
 extern phys_addr_t dma32_phys_limit;
 
 struct device_node;
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0d555847cde6..2f27fd743092 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -19,6 +19,20 @@ extern unsigned long boot_cpu_hartid;
 
 #include <linux/jump_label.h>
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_MAX
+};
+
+int ipi_virq_base_get(void);
+
+irqreturn_t handle_IPI(int irq, void *data);
+
 /*
  * Mapping between linux logical cpu index and hartid.
  */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 9f0f7b888bc1..7d6bf780d334 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -16,6 +16,7 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/static_call.h>
+#include <linux/hardirq.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -27,6 +28,7 @@
 #include <asm/cpuidle.h>
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
+#include <asm/smp.h>
 
 register unsigned long gp_in_global __asm__("gp");
 
@@ -38,6 +40,8 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
+DEFINE_PER_CPU(atomic_t, idle_ipi_mask);
+
 static __cpuidle void default_idle(void)
 {
 	/*
@@ -49,6 +53,16 @@ static __cpuidle void default_idle(void)
 	wait_for_interrupt();
 }
 
+static __cpuidle void default_idle_enter(void)
+{
+	/* Do nothing */
+}
+
+static __cpuidle void default_idle_exit(void)
+{
+	/* Do nothing */
+}
+
 static __cpuidle void wrs_idle(void)
 {
 	/*
@@ -57,10 +71,42 @@ static __cpuidle void wrs_idle(void)
 	 * to entering WRS.NTO.
 	 */
 	mb();
+#ifdef CONFIG_SMP
+	wrs_nto_if(&this_cpu_ptr(&idle_ipi_mask)->counter, BIT(IPI_MAX));
+#else
 	wrs_nto(&current_thread_info()->flags);
+#endif
+}
+
+static __cpuidle void wrs_idle_enter(void)
+{
+#ifdef CONFIG_SMP
+	atomic_set(this_cpu_ptr(&idle_ipi_mask), BIT(IPI_MAX));
+#endif
+}
+
+static __cpuidle void wrs_idle_exit(void)
+{
+#ifdef CONFIG_SMP
+	int pending;
+	unsigned long flags;
+	enum ipi_message_type ipi;
+
+	local_irq_save(flags);
+	pending = atomic_xchg_relaxed(this_cpu_ptr(&idle_ipi_mask), 0);
+	for (ipi = IPI_RESCHEDULE; ipi < IPI_MAX; ipi++)
+		if (pending & BIT(ipi)) {
+			irq_enter();
+			handle_IPI(ipi_virq_base_get() + ipi, NULL);
+			irq_exit();
+		}
+	local_irq_restore(flags);
+#endif
 }
 
 DEFINE_STATIC_CALL_NULL(riscv_idle, default_idle);
+DEFINE_STATIC_CALL_NULL(riscv_idle_enter, default_idle_enter);
+DEFINE_STATIC_CALL_NULL(riscv_idle_exit, default_idle_exit);
 
 void __cpuidle cpu_do_idle(void)
 {
@@ -72,13 +118,28 @@ void __cpuidle arch_cpu_idle(void)
 	cpu_do_idle();
 }
 
+void __cpuidle arch_cpu_idle_enter(void)
+{
+	static_call(riscv_idle_enter)();
+}
+
+void __cpuidle arch_cpu_idle_exit(void)
+{
+	static_call(riscv_idle_exit)();
+}
+
 void __init select_idle_routine(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ZAWRS_IDLE) &&
-			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS))
+			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS)) {
 		static_call_update(riscv_idle, wrs_idle);
-	else
+		static_call_update(riscv_idle_enter, wrs_idle_enter);
+		static_call_update(riscv_idle_exit, wrs_idle_exit);
+	} else {
 		static_call_update(riscv_idle, default_idle);
+		static_call_update(riscv_idle_enter, default_idle_enter);
+		static_call_update(riscv_idle_exit, default_idle_exit);
+	}
 }
 
 int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 45dd4035416e..b5416ee41967 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -26,16 +26,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_MAX
-};
-
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -94,14 +84,34 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 }
 #endif
 
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+DECLARE_PER_CPU(atomic_t, idle_ipi_mask);
+#endif
+
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+	int cpu, val;
+
+	for_each_cpu(cpu, mask) {
+		val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+		if (likely(!(val & BIT(IPI_MAX))))
+			__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+	}
+#else
 	__ipi_send_mask(ipi_desc[op], mask);
+#endif
 }
 
 static void send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
+#if defined(CONFIG_RISCV_ZAWRS_IDLE) && defined(CONFIG_SMP)
+	int val;
+
+	val = atomic_fetch_or_relaxed(BIT(op), per_cpu_ptr(&idle_ipi_mask, cpu));
+	if (likely(!(val & BIT(IPI_MAX))))
+#endif
+		__ipi_send_mask(ipi_desc[op], cpumask_of(cpu));
 }
 
 #ifdef CONFIG_IRQ_WORK
@@ -111,7 +121,7 @@ void arch_irq_work_raise(void)
 }
 #endif
 
-static irqreturn_t handle_IPI(int irq, void *data)
+irqreturn_t handle_IPI(int irq, void *data)
 {
 	int ipi = irq - ipi_virq_base;
 
@@ -332,3 +342,8 @@ void arch_smp_send_reschedule(int cpu)
 	send_ipi_single(cpu, IPI_RESCHEDULE);
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
+
+int ipi_virq_base_get(void)
+{
+	return ipi_virq_base;
+}
-- 
2.20.1


