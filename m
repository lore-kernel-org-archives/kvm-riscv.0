From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:37 +0800
Subject: [PATCH 1/5] riscv: remove cpu_stop()
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <20211128160741.2122-2-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Except arch_cpu_idle_dead(), no users of this function. So remove
cpu_stop() and fold its code into arch_cpu_idle_dead().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/smp.h    | 2 --
 arch/riscv/kernel/cpu-hotplug.c | 8 +-------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index a7d2811f3536..e2b0d6c40a6c 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -63,8 +63,6 @@ asmlinkage void smp_callin(void);
 #if defined CONFIG_HOTPLUG_CPU
 int __cpu_disable(void);
 void __cpu_die(unsigned int cpu);
-void cpu_stop(void);
-#else
 #endif /* CONFIG_HOTPLUG_CPU */
 
 #else
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index df84e0c13db1..be7f05b542bb 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -14,12 +14,6 @@
 #include <asm/cpu_ops.h>
 #include <asm/sbi.h>
 
-void cpu_stop(void);
-void arch_cpu_idle_dead(void)
-{
-	cpu_stop();
-}
-
 bool cpu_has_hotplug(unsigned int cpu)
 {
 	if (cpu_ops[cpu]->cpu_stop)
@@ -75,7 +69,7 @@ void __cpu_die(unsigned int cpu)
 /*
  * Called from the idle thread for the CPU which has been shutdown.
  */
-void cpu_stop(void)
+void arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-- 
2.34.0


