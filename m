From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sat, 21 Sep 2024 18:08:21 +0800
Subject: [kvm-unit-tests PATCH v5 3/5] lib/on-cpus: Add helper method to clear the function from on_cpu_info
In-Reply-To: <20240921100824.151761-1-jamestiotio@gmail.com>
References: <20240921100824.151761-1-jamestiotio@gmail.com>
Message-ID: <20240921100824.151761-4-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a CPU abruptly stops during some test, the CPU will not have the
chance to go back to the do_idle() loop and set the
on_cpu_info[cpu].func variable to NULL. Add a helper method for some
test manager CPU to clear this function. This would re-enable
on_cpu_async and allow future tests to use the on-cpus API again.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/on-cpus.h |  1 +
 lib/on-cpus.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/lib/on-cpus.h b/lib/on-cpus.h
index 4bc6236d..497ff9d1 100644
--- a/lib/on-cpus.h
+++ b/lib/on-cpus.h
@@ -13,5 +13,6 @@ void on_cpu(int cpu, void (*func)(void *data), void *data);
 void on_cpus(void (*func)(void *data), void *data);
 void on_cpumask_async(const cpumask_t *mask, void (*func)(void *data), void *data);
 void on_cpumask(const cpumask_t *mask, void (*func)(void *data), void *data);
+void on_cpu_clear_func(int cpu);
 
 #endif /* _ON_CPUS_H_ */
diff --git a/lib/on-cpus.c b/lib/on-cpus.c
index 89214933..cc73690a 100644
--- a/lib/on-cpus.c
+++ b/lib/on-cpus.c
@@ -171,3 +171,14 @@ void on_cpus(void (*func)(void *data), void *data)
 {
 	on_cpumask(&cpu_present_mask, func, data);
 }
+
+void on_cpu_clear_func(int cpu)
+{
+	for (;;) {
+		if (get_on_cpu_info(cpu))
+			break;
+	}
+
+	on_cpu_info[cpu].func = NULL;
+	put_on_cpu_info(cpu);
+}
-- 
2.43.0


