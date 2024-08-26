From: Cade Richard <cade.richard@gmail.com>
Date: Sun, 25 Aug 2024 23:51:06 -0700
Subject: [kvm-unit-tests PATCH v2] riscv: sbi: add IPI extension tests.
Message-ID: <20240826065106.20281-1-cade.richard@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add tests for the RISC-V OpenSBI inter-processor interrupt extension.

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 lib/riscv/asm/sbi.h |   5 ++
 riscv/sbi.c         | 141 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg |   1 +
 3 files changed, 147 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 47e91025..dd0ce9a1 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -17,6 +17,7 @@
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_TIME = 0x54494d45,
+	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_DBCN = 0x4442434E,
@@ -32,6 +33,10 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_ipi_fid {
+	SBI_EXT_IPI_SEND = 0,
+};
+
 enum sbi_ext_hsm_fid {
 	SBI_EXT_HSM_HART_START = 0,
 	SBI_EXT_HSM_HART_STOP,
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 36ddfd48..d0c33a72 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,11 +6,15 @@
  */
 #include <libcflat.h>
 #include <alloc_page.h>
+#include <cpumask.h>
+#include <cpumask.h>
 #include <stdlib.h>
 #include <string.h>
 #include <limits.h>
 #include <vmalloc.h>
 #include <memregions.h>
+#include <on-cpus.h>
+#include <rand.h>
 #include <asm/barrier.h>
 #include <asm/csr.h>
 #include <asm/delay.h>
@@ -19,10 +23,16 @@
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
 
 #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
+static prng_state ps;
+static bool ipi_received[__riscv_xlen];
+static bool ipi_timeout[__riscv_xlen];
+static bool ipi_received[__riscv_xlen];
+static bool ipi_timeout[__riscv_xlen];
 
 static void help(void)
 {
@@ -45,6 +55,11 @@ static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long
 	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
 }
 
+static struct sbiret __ipi_sbi_ecall(unsigned long hart_mask, unsigned long hart_mask_base)
+{
+	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND, hart_mask, hart_mask_base, 0, 0, 0, 0);
+}
+
 static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
 {
 	*lo = (unsigned long)paddr;
@@ -420,6 +435,131 @@ static void check_dbcn(void)
 	report_prefix_pop();
 }
 
+static int rand_online_cpu(prng_state* ps)
+{
+	int me = smp_processor_id();
+	int num_iters = prng32(ps) % NR_CPUS;
+	int rand_cpu = cpumask_next(me, &cpu_online_mask);
+
+	/*
+	 *	TODO: Not sure if cpumask_next should wrap or not. Get this checked.
+	 */
+	for (int i = 0; i < num_iters; i++) {
+		rand_cpu = cpumask_next(rand_cpu, &cpu_online_mask);
+	}
+
+	return rand_cpu;
+}
+
+static void ipi_timeout_handler(struct pt_regs *regs)
+{
+	int me = smp_processor_id();
+	ipi_timeout[me] = true;
+}
+
+static void ipi_irq_handler(struct pt_regs *regs)
+{
+	int me = smp_processor_id();
+	ipi_received[me] = true;
+}
+
+static void ipi_hart_init(void *irq_func)
+{
+	int me = smp_processor_id();
+	install_irq_handler(IRQ_S_IPI, (void *)ipi_irq_handler);
+	install_irq_handler(IRQ_S_TIMER, (void *)ipi_timeout_handler);
+	local_irq_enable();
+	timer_irq_enable();
+
+	while (!ipi_received[me] && !ipi_timeout[me])
+		cpu_relax();
+	timer_irq_disable();
+	local_irq_disable();
+
+	if (ipi_timeout[me])
+		report_fail("ipi timed out on hart %d", me);
+	if (ipi_received[me])
+		report_pass("ipi received on hart %d", me);
+}
+
+static void check_ipi(void)
+{
+	int cpu = smp_processor_id();
+	unsigned long me = (unsigned long)cpu;
+	struct sbiret ret;
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
+	if (cpumask_weight(&cpu_online_mask) <= 1) {
+		report_skip("smp not enabled");
+		report_prefix_pop();
+		return;
+	}
+
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+		if (__riscv_xlen == 32)
+			csr_write(CSR_STIMECMPH, ULONG_MAX);
+	}
+
+	report_prefix_push("send to one random hart");
+	int rand_hartid = rand_online_cpu(&ps);
+	cpumask_t rand_mask;
+	cpumask_set_cpu(rand_hartid, &rand_mask);
+	on_cpu(rand_hartid, (void *)ipi_hart_init, NULL);
+	unsigned long ipi_rand_mask = 1 << rand_hartid;
+
+	memset(ipi_received, 0, sizeof(ipi_received));
+	memset(ipi_timeout, 0, sizeof(ipi_timeout));
+	ret = __ipi_sbi_ecall((unsigned long)cpumask_bits(&rand_mask), 0);
+	report(ret.error == SBI_SUCCESS, "send to one randomly chosen hart");
+	report_prefix_pop();
+
+	report_prefix_push("broadcast");
+	report_prefix_push("with hart_mask");
+	on_cpus((void *)ipi_hart_init, NULL);
+	unsigned long ipi_broadcast_mask;
+	memcpy(&ipi_broadcast_mask, &cpu_online_mask, sizeof(ipi_broadcast_mask));
+	
+	memset(ipi_received, 0, sizeof(ipi_received));
+	memset(ipi_timeout, 0, sizeof(ipi_timeout));
+	ret = __ipi_sbi_ecall(ipi_broadcast_mask, me);
+	report(ret.error == SBI_SUCCESS, "ipi sent");
+	report_prefix_pop();
+
+	report_prefix_push("by setting hart_mask_base to -1");
+	on_cpus((void *)ipi_hart_init, NULL);
+
+	memset(ipi_received, 0, sizeof(ipi_received));
+	memset(ipi_timeout, 0, sizeof(ipi_timeout));
+	ret = __ipi_sbi_ecall(0, -1);
+	report(ret.error == SBI_SUCCESS, "ipi sent");
+	report_prefix_pop();
+	report_prefix_pop();
+
+	report_prefix_push("invalid parameters");
+	unsigned long invalid_hart_mask_base = NR_CPUS;
+	ret = __ipi_sbi_ecall(ipi_rand_mask, invalid_hart_mask_base);
+	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base");
+
+	cpumask_t invalid_mask;
+	cpumask_set_cpu(NR_CPUS, &invalid_mask);
+	unsigned long invalid_mask_bits = (unsigned long)cpumask_bits(&invalid_mask);
+	ret = __ipi_sbi_ecall(invalid_mask_bits, me);
+	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask");
+	report_prefix_pop();
+
+	report_prefix_pop();
+	report_prefix_pop();
+}
+
 int main(int argc, char **argv)
 {
 	if (argc > 1 && !strcmp(argv[1], "-h")) {
@@ -431,6 +571,7 @@ int main(int argc, char **argv)
 	check_base();
 	check_time();
 	check_dbcn();
+	check_ipi();
 
 	return report_summary();
 }
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index cbd36bf6..2eb760ec 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -16,4 +16,5 @@ groups = selftest
 # Set $FIRMWARE_OVERRIDE to /path/to/firmware to select the SBI implementation.
 [sbi]
 file = sbi.flat
+smp = $MAX_SMP
 groups = sbi
-- 
2.43.0


