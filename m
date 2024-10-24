From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:28:42 +0200
Subject: [kvm-unit-tests PATCH 2/2] riscv: sbi: Add IPI extension tests
In-Reply-To: <20241024122839.71753-4-andrew.jones@linux.dev>
References: <20241024122839.71753-4-andrew.jones@linux.dev>
Message-ID: <20241024122839.71753-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Cade Richard <cade.richard@gmail.com>

Ensure IPIs directed at single harts are received and also that all
harts receive IPIs on broadcast. Also check for invalid param errors
when the params result in hartids greater than the max.

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
[Made all changes for the review comments from the last review,
 also additional fixes and cleanups, and rewrote the commit message.]
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c         | 149 +++++++++++++++++++++++++++++++++++++++++++-
 riscv/unittests.cfg |   1 +
 2 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index d46befa1c6c1..82a116ff1b40 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,11 +6,15 @@
  */
 #include <libcflat.h>
 #include <alloc_page.h>
+#include <cpumask.h>
+#include <limits.h>
+#include <memregions.h>
+#include <on-cpus.h>
+#include <rand.h>
 #include <stdlib.h>
 #include <string.h>
-#include <limits.h>
 #include <vmalloc.h>
-#include <memregions.h>
+
 #include <asm/barrier.h>
 #include <asm/csr.h>
 #include <asm/delay.h>
@@ -47,6 +51,20 @@ static struct sbiret sbi_dbcn_write_byte(uint8_t byte)
 	return sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, byte, 0, 0, 0, 0, 0);
 }
 
+static int rand_online_cpu(prng_state* ps)
+{
+	int cpu, me = smp_processor_id();
+
+	for (;;) {
+		cpu = prng32(ps) % nr_cpus;
+		cpu = cpumask_next(cpu - 1, &cpu_present_mask);
+		if (cpu != nr_cpus && cpu != me && cpu_present(cpu))
+			break;
+	}
+
+	return cpu;
+}
+
 static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
 {
 	*lo = (unsigned long)paddr;
@@ -287,6 +305,132 @@ static void check_time(void)
 	report_prefix_popn(2);
 }
 
+static bool ipi_received[NR_CPUS];
+static bool ipi_timeout[NR_CPUS];
+static cpumask_t ipi_done;
+
+static void ipi_timeout_handler(struct pt_regs *regs)
+{
+	timer_stop();
+	ipi_timeout[smp_processor_id()] = true;
+}
+
+static void ipi_irq_handler(struct pt_regs *regs)
+{
+	ipi_ack();
+	ipi_received[smp_processor_id()] = true;
+}
+
+static void ipi_hart_wait(void *data)
+{
+	unsigned long timeout = (unsigned long)data;
+	int me = smp_processor_id();
+
+	install_irq_handler(IRQ_S_SOFT, ipi_irq_handler);
+	install_irq_handler(IRQ_S_TIMER, ipi_timeout_handler);
+	local_ipi_enable();
+	timer_irq_enable();
+	local_irq_enable();
+
+	timer_start(timeout);
+	while (!READ_ONCE(ipi_received[me]) && !READ_ONCE(ipi_timeout[me]))
+		cpu_relax();
+	local_irq_disable();
+	timer_stop();
+	local_ipi_disable();
+	timer_irq_disable();
+
+	cpumask_set_cpu(me, &ipi_done);
+}
+
+static void ipi_hart_check(cpumask_t *mask)
+{
+	int cpu;
+
+	for_each_cpu(cpu, mask) {
+		if (ipi_timeout[cpu]) {
+			const char *rec = ipi_received[cpu] ? "but was still received"
+							    : "and has still not been received";
+			report_fail("ipi timed out on cpu%d %s", cpu, rec);
+		}
+
+		ipi_timeout[cpu] = false;
+		ipi_received[cpu] = false;
+	}
+}
+
+static void check_ipi(void)
+{
+	unsigned long d = getenv("SBI_IPI_TIMEOUT") ? strtol(getenv("SBI_IPI_TIMEOUT"), NULL, 0) : 200000;
+	int nr_cpus_present = cpumask_weight(&cpu_present_mask);
+	int me = smp_processor_id();
+	unsigned long max_hartid = 0;
+	static prng_state ps;
+	struct sbiret ret;
+	cpumask_t tmp;
+	int cpu;
+
+	ps = prng_init(0xDEADBEEF);
+
+	report_prefix_push("ipi");
+
+	if (!sbi_probe(SBI_EXT_IPI)) {
+		report_skip("ipi extension not available");
+		report_prefix_pop();
+		return;
+	}
+
+	if (nr_cpus_present < 2) {
+		report_skip("At least 2 cpus required");
+		report_prefix_pop();
+		return;
+	}
+
+	report_prefix_push("random hart");
+	cpu = rand_online_cpu(&ps);
+	cpumask_copy(&ipi_done, &cpu_present_mask);
+	cpumask_clear_cpu(cpu, &ipi_done);
+	on_cpu_async(cpu, ipi_hart_wait, (void *)d);
+	ret = sbi_send_ipi_cpu(cpu);
+	report(ret.error == SBI_SUCCESS, "ipi returned success");
+	while (cpumask_weight(&ipi_done) != nr_cpus_present)
+		cpu_relax();
+	cpumask_clear(&ipi_done);
+	cpumask_clear(&tmp);
+	cpumask_set_cpu(cpu, &tmp);
+	ipi_hart_check(&tmp);
+	report_prefix_pop();
+
+	report_prefix_push("broadcast");
+	cpumask_copy(&tmp, &cpu_present_mask);
+	cpumask_clear_cpu(me, &tmp);
+	on_cpumask_async(&tmp, ipi_hart_wait, (void *)d);
+	ret = sbi_send_ipi_broadcast();
+	report(ret.error == SBI_SUCCESS, "ipi returned success");
+	while (cpumask_weight(&ipi_done) != nr_cpus_present - 1)
+		cpu_relax();
+	cpumask_clear(&ipi_done);
+	ipi_hart_check(&tmp);
+	report_prefix_pop();
+
+	report_prefix_push("invalid parameters");
+
+	for_each_present_cpu(cpu) {
+		if (cpus[cpu].hartid > max_hartid)
+			max_hartid = cpus[cpu].hartid;
+	}
+
+	/* Try the next higher hartid than the max */
+	ret = sbi_send_ipi(2, max_hartid);
+	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.error);
+	ret = sbi_send_ipi(1, max_hartid + 1);
+	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base got expected error (%ld)", ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_pop();
+}
+
 unsigned char sbi_hsm_stop_hart[NR_CPUS];
 unsigned char sbi_hsm_hart_start_checks[NR_CPUS];
 unsigned char sbi_hsm_non_retentive_hart_suspend_checks[NR_CPUS];
@@ -442,6 +586,7 @@ int main(int argc, char **argv)
 	report_prefix_push("sbi");
 	check_base();
 	check_time();
+	check_ipi();
 	check_dbcn();
 
 	return report_summary();
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index cbd36bf63e14..2eb760eca24e 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -16,4 +16,5 @@ groups = selftest
 # Set $FIRMWARE_OVERRIDE to /path/to/firmware to select the SBI implementation.
 [sbi]
 file = sbi.flat
+smp = $MAX_SMP
 groups = sbi
-- 
2.47.0


