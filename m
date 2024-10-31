From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 31 Oct 2024 13:39:50 +0100
Subject: [kvm-unit-tests PATCH v2 1/3] lib/on-cpus: Correct and simplify synchronization
In-Reply-To: <20241031123948.320652-5-andrew.jones@linux.dev>
References: <20241031123948.320652-5-andrew.jones@linux.dev>
Message-ID: <20241031123948.320652-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

get/put_on_cpu_info() were providing per-cpu locking for the per-cpu
on_cpu info, but it's difficult to reason that they're correct since
they use test_and_set/clear rather than a typical lock. Just revert
to a typical spinlock to simplify it. Also simplify the break case
for on_cpu_async() - we don't care if func is NULL, we only care
that the cpu is idle. And, finally, add a missing barrier to
on_cpu_async(). Before commit 018550041b38 ("arm/arm64: Remove
spinlocks from on_cpu_async") the spin_unlock() provided an implicit
barrier at the correct location, but moving the release to the more
logical location, below the setting of idle, lost it.

Fixes: 018550041b38 ("arm/arm64: Remove spinlocks from on_cpu_async")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/on-cpus.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/lib/on-cpus.c b/lib/on-cpus.c
index 892149338419..f6072117fa1b 100644
--- a/lib/on-cpus.c
+++ b/lib/on-cpus.c
@@ -9,6 +9,7 @@
 #include <on-cpus.h>
 #include <asm/barrier.h>
 #include <asm/smp.h>
+#include <asm/spinlock.h>
 
 bool cpu0_calls_idle;
 
@@ -18,18 +19,7 @@ struct on_cpu_info {
 	cpumask_t waiters;
 };
 static struct on_cpu_info on_cpu_info[NR_CPUS];
-static cpumask_t on_cpu_info_lock;
-
-static bool get_on_cpu_info(int cpu)
-{
-	return !cpumask_test_and_set_cpu(cpu, &on_cpu_info_lock);
-}
-
-static void put_on_cpu_info(int cpu)
-{
-	int ret = cpumask_test_and_clear_cpu(cpu, &on_cpu_info_lock);
-	assert(ret);
-}
+static struct spinlock lock;
 
 static void __deadlock_check(int cpu, const cpumask_t *waiters, bool *found)
 {
@@ -81,18 +71,14 @@ void do_idle(void)
 	if (cpu == 0)
 		cpu0_calls_idle = true;
 
-	set_cpu_idle(cpu, true);
-	smp_send_event();
-
 	for (;;) {
+		set_cpu_idle(cpu, true);
+		smp_send_event();
+
 		while (cpu_idle(cpu))
 			smp_wait_for_event();
 		smp_rmb();
 		on_cpu_info[cpu].func(on_cpu_info[cpu].data);
-		on_cpu_info[cpu].func = NULL;
-		smp_wmb();
-		set_cpu_idle(cpu, true);
-		smp_send_event();
 	}
 }
 
@@ -110,17 +96,17 @@ void on_cpu_async(int cpu, void (*func)(void *data), void *data)
 
 	for (;;) {
 		cpu_wait(cpu);
-		if (get_on_cpu_info(cpu)) {
-			if ((volatile void *)on_cpu_info[cpu].func == NULL)
-				break;
-			put_on_cpu_info(cpu);
-		}
+		spin_lock(&lock);
+		if (cpu_idle(cpu))
+			break;
+		spin_unlock(&lock);
 	}
 
 	on_cpu_info[cpu].func = func;
 	on_cpu_info[cpu].data = data;
+	smp_wmb();
 	set_cpu_idle(cpu, false);
-	put_on_cpu_info(cpu);
+	spin_unlock(&lock);
 	smp_send_event();
 }
 
-- 
2.47.0


