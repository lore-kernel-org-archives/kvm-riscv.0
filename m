From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:20 +0100
Subject: [kvm-unit-tests PATCH 04/24] arm/arm64: Share cpu online, present and idle masks
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-30-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V will also use Arm's three cpumasks. These were in smp.h,
but they can be in cpumask.h instead, so move them there, which
is now shared.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm/asm/smp.h | 33 ---------------------------------
 lib/cpumask.h     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/lib/arm/asm/smp.h b/lib/arm/asm/smp.h
index bb3e71a55e8c..b89a68dd344f 100644
--- a/lib/arm/asm/smp.h
+++ b/lib/arm/asm/smp.h
@@ -23,39 +23,6 @@ extern bool cpu0_calls_idle;
 extern void halt(void);
 extern void do_idle(void);
 
-extern cpumask_t cpu_present_mask;
-extern cpumask_t cpu_online_mask;
-extern cpumask_t cpu_idle_mask;
-#define cpu_present(cpu)		cpumask_test_cpu(cpu, &cpu_present_mask)
-#define cpu_online(cpu)			cpumask_test_cpu(cpu, &cpu_online_mask)
-#define cpu_idle(cpu)			cpumask_test_cpu(cpu, &cpu_idle_mask)
-#define for_each_present_cpu(cpu)	for_each_cpu(cpu, &cpu_present_mask)
-#define for_each_online_cpu(cpu)	for_each_cpu(cpu, &cpu_online_mask)
-
-static inline void set_cpu_present(int cpu, bool present)
-{
-	if (present)
-		cpumask_set_cpu(cpu, &cpu_present_mask);
-	else
-		cpumask_clear_cpu(cpu, &cpu_present_mask);
-}
-
-static inline void set_cpu_online(int cpu, bool online)
-{
-	if (online)
-		cpumask_set_cpu(cpu, &cpu_online_mask);
-	else
-		cpumask_clear_cpu(cpu, &cpu_online_mask);
-}
-
-static inline void set_cpu_idle(int cpu, bool idle)
-{
-	if (idle)
-		cpumask_set_cpu(cpu, &cpu_idle_mask);
-	else
-		cpumask_clear_cpu(cpu, &cpu_idle_mask);
-}
-
 extern void smp_boot_secondary(int cpu, secondary_entry_fn entry);
 extern void on_cpu_async(int cpu, void (*func)(void *data), void *data);
 extern void on_cpu(int cpu, void (*func)(void *data), void *data);
diff --git a/lib/cpumask.h b/lib/cpumask.h
index d30e14cda09e..be1919234d8e 100644
--- a/lib/cpumask.h
+++ b/lib/cpumask.h
@@ -119,4 +119,37 @@ static inline int cpumask_next(int cpu, const cpumask_t *mask)
 			(cpu) < nr_cpus; 			\
 			(cpu) = cpumask_next(cpu, mask))
 
+extern cpumask_t cpu_present_mask;
+extern cpumask_t cpu_online_mask;
+extern cpumask_t cpu_idle_mask;
+#define cpu_present(cpu)		cpumask_test_cpu(cpu, &cpu_present_mask)
+#define cpu_online(cpu)			cpumask_test_cpu(cpu, &cpu_online_mask)
+#define cpu_idle(cpu)			cpumask_test_cpu(cpu, &cpu_idle_mask)
+#define for_each_present_cpu(cpu)	for_each_cpu(cpu, &cpu_present_mask)
+#define for_each_online_cpu(cpu)	for_each_cpu(cpu, &cpu_online_mask)
+
+static inline void set_cpu_present(int cpu, bool present)
+{
+	if (present)
+		cpumask_set_cpu(cpu, &cpu_present_mask);
+	else
+		cpumask_clear_cpu(cpu, &cpu_present_mask);
+}
+
+static inline void set_cpu_online(int cpu, bool online)
+{
+	if (online)
+		cpumask_set_cpu(cpu, &cpu_online_mask);
+	else
+		cpumask_clear_cpu(cpu, &cpu_online_mask);
+}
+
+static inline void set_cpu_idle(int cpu, bool idle)
+{
+	if (idle)
+		cpumask_set_cpu(cpu, &cpu_idle_mask);
+	else
+		cpumask_clear_cpu(cpu, &cpu_idle_mask);
+}
+
 #endif /* _CPUMASK_H_ */
-- 
2.43.0


