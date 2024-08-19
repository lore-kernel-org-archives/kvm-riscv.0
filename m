From: Cade Richard <cade.richard@gmail.com>
Date: Sun, 18 Aug 2024 19:01:29 -0700
Subject: [kvm-unit-tests PATCH] riscv: sbi: Add IPI extension tests.
Message-ID: <20240819020129.26095-1-cade.richard@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add tests for the RISC-V OpenSBI inter-processor interrupt extension.

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 lib/riscv/asm/sbi.h |   5 ++
 riscv/sbi.c         | 138 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 47e91025..d0abeefc 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -20,6 +20,7 @@ enum sbi_ext_id {
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_DBCN = 0x4442434E,
+	SBI_EXT_IPI = 0x735049,
 };
 
 enum sbi_ext_base_fid {
@@ -49,6 +50,10 @@ enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
 };
 
+enum sbi_ext_ipi_fid {
+	SBI_EXT_IPI_SEND = 0,
+};
+
 struct sbiret {
 	long error;
 	long value;
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 36ddfd48..c339b330 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,11 +6,14 @@
  */
 #include <libcflat.h>
 #include <alloc_page.h>
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
@@ -23,6 +26,9 @@
 #include <asm/timer.h>
 
 #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
+static prng_state ps;
+static bool ipi_received[__riscv_xlen];
+static bool ipi_timeout[__riscv_xlen];
 
 static void help(void)
 {
@@ -45,6 +51,11 @@ static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long
 	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
 }
 
+static struct sbiret __ipi_sbi_ecall(unsigned long arg0, unsigned long arg1)
+{
+	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND, arg0, arg1, 0, 0, 0, 0);
+}
+
 static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
 {
 	*lo = (unsigned long)paddr;
@@ -420,6 +431,132 @@ static void check_dbcn(void)
 	report_prefix_pop();
 }
 
+static int rand_online_cpu(prng_state* ps) {
+	int me = smp_processor_id();
+	int num_iters = prng32(ps);
+	int rand_cpu = cpumask_next(me, &cpu_online_mask);
+
+	for (int i = 0; i < num_iters; i++) {
+		rand_cpu = cpumask_next(me, &cpu_online_mask);
+	}
+
+	return rand_cpu;
+}
+
+static void ipi_timeout_handler(struct pt_regs *regs) {
+	int me = smp_processor_id();
+	ipi_timeout[me] = true;
+	report_fail("ipi timed out on hart %d", me);
+}
+
+static void ipi_irq_handler(struct pt_regs *regs) {
+	int me = smp_processor_id();
+	ipi_received[me] = true;
+	report_pass("ipi received on hart %d", me);
+	
+}
+
+static void ipi_hart_init(void *irq_func) {
+	int me = smp_processor_id();
+	printf("Installing IPI IRQ handler on hart %d", me);
+	install_irq_handler(IRQ_S_IPI, (void *)ipi_irq_handler);
+	install_irq_handler(IRQ_S_TIMER, (void *)ipi_timeout_handler);
+	timer_irq_enable();
+	while (!ipi_received[me] && !ipi_timeout[me]) {
+		cpu_relax();
+	}
+}
+
+static int offline_cpu(void) {
+	for (int i = 0; i < __riscv_xlen; i++) {
+		if (!cpumask_test_cpu(i, &cpu_online_mask)) {
+			return i;
+		}
+	}
+	return -1;
+}
+
+static void print_bits(size_t const size, void const * const ptr)
+{
+    unsigned char *b = (unsigned char*) ptr;
+    unsigned char byte;
+    int i, j;
+    
+    for (i = size-1; i >= 0; i--) {
+        for (j = 7; j >= 0; j--) {
+            byte = (b[i] >> j) & 1;
+            printf("%u", byte);
+        }
+    }
+    puts("");
+}
+
+static void set_flags_false(bool arr[])
+{
+	for (int i = 0; i < __riscv_xlen; i++) {
+		arr[i] = 0;
+	}
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
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+		if (__riscv_xlen == 32)
+			csr_write(CSR_STIMECMPH, ULONG_MAX);
+	}
+
+	report_prefix_push("send to one random hart");
+	set_flags_false(ipi_received);
+	set_flags_false(ipi_timeout);
+	int rand_hartid = rand_online_cpu(&ps);
+	on_cpu(rand_hartid, (void *)ipi_hart_init, NULL);
+	unsigned long ipi_rand_mask = 1 << rand_hartid;
+
+	ret = __ipi_sbi_ecall(ipi_rand_mask, me);
+	report(ret.error == SBI_SUCCESS, "send to one randomly chosen hart");
+	report_prefix_pop();
+
+	report_prefix_push("broadcast");
+	set_flags_false(ipi_received);
+	set_flags_false(ipi_timeout);
+	on_cpus((void *)ipi_hart_init, NULL);
+	unsigned long ipi_broadcast_mask = (unsigned long)(cpumask_bits(&cpu_online_mask)[me]);
+	puts("online cpu mask: ");
+	print_bits(CPUMASK_NR_LONGS*sizeof(long), &ipi_broadcast_mask);
+	puts("\n");
+
+	ret = __ipi_sbi_ecall(ipi_broadcast_mask, me);
+	report(ret.error == SBI_SUCCESS, "send to all available harts");
+	report_prefix_pop();
+
+	report_prefix_push("invalid parameters");
+	unsigned long invalid_hart_mask_base = offline_cpu();
+	ret = __ipi_sbi_ecall(ipi_rand_mask, invalid_hart_mask_base);
+	report(ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base");
+
+	unsigned long invalid_cpu_mask = 1 << invalid_hart_mask_base;
+	ret = __ipi_sbi_ecall(invalid_cpu_mask, me);
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
@@ -431,6 +568,7 @@ int main(int argc, char **argv)
 	check_base();
 	check_time();
 	check_dbcn();
+	check_ipi();
 
 	return report_summary();
 }
-- 
2.43.0


