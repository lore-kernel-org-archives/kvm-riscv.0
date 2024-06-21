From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 21 Jun 2024 17:32:22 +0800
Subject: [RFC v2 1/2] riscv: process: Introduce idle thread using Zawrs extension
In-Reply-To: <20240621093223.37893-1-luxu.kernel@bytedance.com>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
Message-ID: <20240621093223.37893-2-luxu.kernel@bytedance.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Zawrs extension introduces a new instruction WRS.NTO, which will
register a reservation set and causes the hart to temporarily stall
execution in a low-power state until a store occurs to the reservation
set or an interrupt is observed.

This commit implements new version of idle thread for RISC-V via Zawrs
extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
---
 arch/riscv/Kconfig                 | 10 ++++++++
 arch/riscv/include/asm/cpuidle.h   | 11 +-------
 arch/riscv/include/asm/processor.h | 18 +++++++++++++
 arch/riscv/kernel/cpu.c            |  5 ++++
 arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
 5 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 34bbe6b70546..898e61bbb328 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -19,6 +19,7 @@ config RISCV
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -1081,6 +1082,15 @@ endmenu # "Power management options"
 
 menu "CPU Power Management"
 
+config RISCV_ZAWRS_IDLE
+	bool "Idle thread using ZAWRS extensions"
+	depends on RISCV_ISA_ZAWRS
+	default y
+	help
+		Adds support to implement idle thread using ZAWRS extension.
+
+		If you don't know what to do here, say Y.
+
 source "drivers/cpuidle/Kconfig"
 
 source "drivers/cpufreq/Kconfig"
diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
index 71fdc607d4bc..94c9ecb46571 100644
--- a/arch/riscv/include/asm/cpuidle.h
+++ b/arch/riscv/include/asm/cpuidle.h
@@ -10,15 +10,6 @@
 #include <asm/barrier.h>
 #include <asm/processor.h>
 
-static inline void cpu_do_idle(void)
-{
-	/*
-	 * Add mb() here to ensure that all
-	 * IO/MEM accesses are completed prior
-	 * to entering WFI.
-	 */
-	mb();
-	wait_for_interrupt();
-}
+void cpu_do_idle(void);
 
 #endif
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0faf5f161f1e..5ad572645bee 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -12,6 +12,7 @@
 
 #include <vdso/processor.h>
 
+#include <asm/insn-def.h>
 #include <asm/ptrace.h>
 
 /*
@@ -157,6 +158,21 @@ static inline void wait_for_interrupt(void)
 	__asm__ __volatile__ ("wfi");
 }
 
+static inline void wrs_nto(unsigned long *addr)
+{
+	int val;
+
+	__asm__ __volatile__(
+#ifdef CONFIG_64BIT
+			"lr.d %[p], %[v]\n\t"
+#else
+			"lr.w %[p], %[v]\n\t"
+#endif
+			ZAWRS_WRS_NTO "\n\t"
+			: [p] "=&r" (val), [v] "+A" (*addr)
+			: : "memory");
+}
+
 extern phys_addr_t dma32_phys_limit;
 
 struct device_node;
@@ -183,6 +199,8 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+extern void select_idle_routine(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..69cebd41f5f3 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -22,6 +22,11 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 	return phys_id == cpuid_to_hartid_map(cpu);
 }
 
+void __init arch_cpu_finalize_init(void)
+{
+	select_idle_routine();
+}
+
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
  * isn't an enabled and valid RISC-V hart node.
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..9f0f7b888bc1 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/static_call.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -37,11 +38,49 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
-void arch_cpu_idle(void)
+static __cpuidle void default_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WFI.
+	 */
+	mb();
+	wait_for_interrupt();
+}
+
+static __cpuidle void wrs_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WRS.NTO.
+	 */
+	mb();
+	wrs_nto(&current_thread_info()->flags);
+}
+
+DEFINE_STATIC_CALL_NULL(riscv_idle, default_idle);
+
+void __cpuidle cpu_do_idle(void)
+{
+	static_call(riscv_idle)();
+}
+
+void __cpuidle arch_cpu_idle(void)
 {
 	cpu_do_idle();
 }
 
+void __init select_idle_routine(void)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ZAWRS_IDLE) &&
+			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS))
+		static_call_update(riscv_idle, wrs_idle);
+	else
+		static_call_update(riscv_idle, default_idle);
+}
+
 int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
 {
 	if (!unaligned_ctl_available())
-- 
2.20.1


