From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:23 +0800
Subject: [PATCH RFC 07/11] riscv: Add task switch support for scontext CSR
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-7-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Write the next task PID to the scontext CSR if the use_scontext
static branch is enabled by the detection of the cpufeature.c

The scontext CSR needs to be saved and restored when entering
a non-retentive idle state so that when resuming the CPU,
the task's PID on the scontext CSR will be correct.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/suspend.h   | 1 +
 arch/riscv/include/asm/switch_to.h | 9 +++++++++
 arch/riscv/kernel/suspend.c        | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 2ecace073869..5021cad7e815 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -13,6 +13,7 @@ struct suspend_context {
 	/* Saved and restored by low-level functions */
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
+	unsigned long scontext;
 	unsigned long scratch;
 	unsigned long envcfg;
 	unsigned long tvec;
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 07432550ed54..289cd6b60978 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <linux/pid.h>
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
@@ -75,6 +76,12 @@ static __always_inline bool has_scontext(void)
 	return static_branch_likely(&use_scontext);
 }
 
+static __always_inline void __switch_to_scontext(struct task_struct *__prev,
+						 struct task_struct *__next)
+{
+	csr_write(CSR_SCONTEXT, task_pid_nr(__next));
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -86,6 +93,8 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	if (has_scontext())				\
+		__switch_to_scontext(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index a086da222872..6b403a1f75c3 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -11,9 +11,13 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/suspend.h>
+#include <asm/switch_to.h>
 
 void suspend_save_csrs(struct suspend_context *context)
 {
+	if (has_scontext())
+		context->scontext = csr_read(CSR_SCONTEXT);
+
 	context->scratch = csr_read(CSR_SCRATCH);
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
@@ -46,6 +50,9 @@ void suspend_save_csrs(struct suspend_context *context)
 
 void suspend_restore_csrs(struct suspend_context *context)
 {
+	if (has_scontext())
+		csr_write(CSR_SCONTEXT, context->scontext);
+
 	csr_write(CSR_SCRATCH, context->scratch);
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);

-- 
2.43.2


