From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:27 +0100
Subject: [kvm-unit-tests PATCH 11/24] arm/arm64: Generalize wfe/sev names in smp.c
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-37-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Most of Arm's on_cpus() implementation can be shared by any
architecture which has the possible, present, and idle cpumasks,
like riscv does. Rename the exceptions (wfe/sve) to something
more generic in order to prepare to share the functions.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm/asm/smp.h |  4 ++++
 lib/arm/smp.c     | 16 ++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/lib/arm/asm/smp.h b/lib/arm/asm/smp.h
index b89a68dd344f..9f6d839ab568 100644
--- a/lib/arm/asm/smp.h
+++ b/lib/arm/asm/smp.h
@@ -6,6 +6,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 #include <cpumask.h>
+#include <asm/barrier.h>
 #include <asm/thread_info.h>
 
 #define smp_processor_id()		(current_thread_info()->cpu)
@@ -18,6 +19,9 @@ struct secondary_data {
 };
 extern struct secondary_data secondary_data;
 
+#define smp_wait_for_event()	wfe()
+#define smp_send_event()	sev()
+
 extern bool cpu0_calls_idle;
 
 extern void halt(void);
diff --git a/lib/arm/smp.c b/lib/arm/smp.c
index 78fc1656cefa..c00fda2efb03 100644
--- a/lib/arm/smp.c
+++ b/lib/arm/smp.c
@@ -45,7 +45,7 @@ secondary_entry_fn secondary_cinit(void)
 	 */
 	entry = secondary_data.entry;
 	set_cpu_online(ti->cpu, true);
-	sev();
+	smp_send_event();
 
 	/*
 	 * Return to the assembly stub, allowing entry to be called
@@ -65,7 +65,7 @@ static void __smp_boot_secondary(int cpu, secondary_entry_fn entry)
 	assert(ret == 0);
 
 	while (!cpu_online(cpu))
-		wfe();
+		smp_wait_for_event();
 }
 
 void smp_boot_secondary(int cpu, secondary_entry_fn entry)
@@ -122,7 +122,7 @@ static void cpu_wait(int cpu)
 	cpumask_set_cpu(me, &on_cpu_info[cpu].waiters);
 	deadlock_check(me, cpu);
 	while (!cpu_idle(cpu))
-		wfe();
+		smp_wait_for_event();
 	cpumask_clear_cpu(me, &on_cpu_info[cpu].waiters);
 }
 
@@ -134,17 +134,17 @@ void do_idle(void)
 		cpu0_calls_idle = true;
 
 	set_cpu_idle(cpu, true);
-	sev();
+	smp_send_event();
 
 	for (;;) {
 		while (cpu_idle(cpu))
-			wfe();
+			smp_wait_for_event();
 		smp_rmb();
 		on_cpu_info[cpu].func(on_cpu_info[cpu].data);
 		on_cpu_info[cpu].func = NULL;
 		smp_wmb();
 		set_cpu_idle(cpu, true);
-		sev();
+		smp_send_event();
 	}
 }
 
@@ -174,7 +174,7 @@ void on_cpu_async(int cpu, void (*func)(void *data), void *data)
 	on_cpu_info[cpu].data = data;
 	spin_unlock(&lock);
 	set_cpu_idle(cpu, false);
-	sev();
+	smp_send_event();
 }
 
 void on_cpu(int cpu, void (*func)(void *data), void *data)
@@ -201,7 +201,7 @@ void on_cpus(void (*func)(void *data), void *data)
 		deadlock_check(me, cpu);
 	}
 	while (cpumask_weight(&cpu_idle_mask) < nr_cpus - 1)
-		wfe();
+		smp_wait_for_event();
 	for_each_present_cpu(cpu)
 		cpumask_clear_cpu(me, &on_cpu_info[cpu].waiters);
 }
-- 
2.43.0


