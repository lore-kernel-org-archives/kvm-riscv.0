From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 12:12:24 +0200
Subject: [kvm-unit-tests PATCH 2/3] lib/on-cpus: Introduce on_cpumask and on_cpumask_async
In-Reply-To: <20240830101221.2202707-5-andrew.jones@linux.dev>
References: <20240830101221.2202707-5-andrew.jones@linux.dev>
Message-ID: <20240830101221.2202707-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide functions to launch tasks on a selection of cpus identified
by a cpumask.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/on-cpus.c | 35 +++++++++++++++++++++++++++--------
 lib/on-cpus.h |  3 +++
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/lib/on-cpus.c b/lib/on-cpus.c
index aed70f7b27b2..892149338419 100644
--- a/lib/on-cpus.c
+++ b/lib/on-cpus.c
@@ -124,24 +124,32 @@ void on_cpu_async(int cpu, void (*func)(void *data), void *data)
 	smp_send_event();
 }
 
-void on_cpu(int cpu, void (*func)(void *data), void *data)
+void on_cpumask_async(const cpumask_t *mask, void (*func)(void *data), void *data)
 {
-	on_cpu_async(cpu, func, data);
-	cpu_wait(cpu);
+	int cpu, me = smp_processor_id();
+
+	for_each_cpu(cpu, mask) {
+		if (cpu == me)
+			continue;
+		on_cpu_async(cpu, func, data);
+	}
+	if (cpumask_test_cpu(me, mask))
+		func(data);
 }
 
-void on_cpus(void (*func)(void *data), void *data)
+void on_cpumask(const cpumask_t *mask, void (*func)(void *data), void *data)
 {
 	int cpu, me = smp_processor_id();
 
-	for_each_present_cpu(cpu) {
+	for_each_cpu(cpu, mask) {
 		if (cpu == me)
 			continue;
 		on_cpu_async(cpu, func, data);
 	}
-	func(data);
+	if (cpumask_test_cpu(me, mask))
+		func(data);
 
-	for_each_present_cpu(cpu) {
+	for_each_cpu(cpu, mask) {
 		if (cpu == me)
 			continue;
 		cpumask_set_cpu(me, &on_cpu_info[cpu].waiters);
@@ -149,6 +157,17 @@ void on_cpus(void (*func)(void *data), void *data)
 	}
 	while (cpumask_weight(&cpu_idle_mask) < nr_cpus - 1)
 		smp_wait_for_event();
-	for_each_present_cpu(cpu)
+	for_each_cpu(cpu, mask)
 		cpumask_clear_cpu(me, &on_cpu_info[cpu].waiters);
 }
+
+void on_cpu(int cpu, void (*func)(void *data), void *data)
+{
+	on_cpu_async(cpu, func, data);
+	cpu_wait(cpu);
+}
+
+void on_cpus(void (*func)(void *data), void *data)
+{
+	on_cpumask(&cpu_present_mask, func, data);
+}
diff --git a/lib/on-cpus.h b/lib/on-cpus.h
index 41103b0245c7..4bc6236d6b58 100644
--- a/lib/on-cpus.h
+++ b/lib/on-cpus.h
@@ -2,6 +2,7 @@
 #ifndef _ON_CPUS_H_
 #define _ON_CPUS_H_
 #include <stdbool.h>
+#include <cpumask.h>
 
 extern bool cpu0_calls_idle;
 
@@ -10,5 +11,7 @@ void do_idle(void);
 void on_cpu_async(int cpu, void (*func)(void *data), void *data);
 void on_cpu(int cpu, void (*func)(void *data), void *data);
 void on_cpus(void (*func)(void *data), void *data);
+void on_cpumask_async(const cpumask_t *mask, void (*func)(void *data), void *data);
+void on_cpumask(const cpumask_t *mask, void (*func)(void *data), void *data);
 
 #endif /* _ON_CPUS_H_ */
-- 
2.45.2


