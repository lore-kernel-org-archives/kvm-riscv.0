From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  6 Nov 2024 12:38:17 +0100
Subject: [kvm-unit-tests PATCH v2 2/3] riscv: sbi: Add IPI extension tests
In-Reply-To: <20241106113814.42992-5-andrew.jones@linux.dev>
References: <20241106113814.42992-5-andrew.jones@linux.dev>
Message-ID: <20241106113814.42992-7-andrew.jones@linux.dev>
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
Co-developed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/cpumask.h       |  13 ++++
 riscv/sbi.c         | 147 +++++++++++++++++++++++++++++++++++++++++++-
 riscv/unittests.cfg |   1 +
 3 files changed, 159 insertions(+), 2 deletions(-)

diff --git a/lib/cpumask.h b/lib/cpumask.h
index 37d360786573..b4cd83a66a56 100644
--- a/lib/cpumask.h
+++ b/lib/cpumask.h
@@ -72,6 +72,19 @@ static inline bool cpumask_subset(const struct cpumask *src1, const struct cpuma
 	return !lastmask || !((cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i]) & lastmask);
 }
 
+static inline bool cpumask_equal(const struct cpumask *src1, const struct cpumask *src2)
+{
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+	int i;
+
+	for (i = 0; i < BIT_WORD(nr_cpus); ++i) {
+		if (cpumask_bits(src1)[i] != cpumask_bits(src2)[i])
+			return false;
+	}
+
+	return !lastmask || (cpumask_bits(src1)[i] & lastmask) == (cpumask_bits(src2)[i] & lastmask);
+}
+
 static inline bool cpumask_empty(const cpumask_t *mask)
 {
 	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
diff --git a/riscv/sbi.c b/riscv/sbi.c
index c081953c877c..cdf8d13cc9cf 100644
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
@@ -46,6 +50,20 @@ static struct sbiret sbi_dbcn_write_byte(uint8_t byte)
 	return sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, byte, 0, 0, 0, 0, 0);
 }
 
+static int rand_online_cpu(prng_state *ps)
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
@@ -286,6 +304,130 @@ static void check_time(void)
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
+	cpumask_t ipi_receivers;
+	static prng_state ps;
+	struct sbiret ret;
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
+	cpumask_clear(&ipi_done);
+	cpumask_clear(&ipi_receivers);
+	cpu = rand_online_cpu(&ps);
+	cpumask_set_cpu(cpu, &ipi_receivers);
+	on_cpu_async(cpu, ipi_hart_wait, (void *)d);
+	ret = sbi_send_ipi_cpu(cpu);
+	report(ret.error == SBI_SUCCESS, "ipi returned success");
+	while (!cpumask_equal(&ipi_done, &ipi_receivers))
+		cpu_relax();
+	ipi_hart_check(&ipi_receivers);
+	report_prefix_pop();
+
+	report_prefix_push("broadcast");
+	cpumask_clear(&ipi_done);
+	cpumask_copy(&ipi_receivers, &cpu_present_mask);
+	cpumask_clear_cpu(me, &ipi_receivers);
+	on_cpumask_async(&ipi_receivers, ipi_hart_wait, (void *)d);
+	ret = sbi_send_ipi_broadcast();
+	report(ret.error == SBI_SUCCESS, "ipi returned success");
+	while (!cpumask_equal(&ipi_done, &ipi_receivers))
+		cpu_relax();
+	ipi_hart_check(&ipi_receivers);
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
+	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.error);
+	ret = sbi_send_ipi(1, max_hartid + 1);
+	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base got expected error (%ld)", ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_pop();
+}
+
 #define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
 #define DBCN_WRITE_BYTE_TEST_BYTE	((u8)'a')
 
@@ -437,6 +579,7 @@ int main(int argc, char **argv)
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


