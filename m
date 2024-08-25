From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 26 Aug 2024 01:08:24 +0800
Subject: [kvm-unit-tests PATCH v2 4/4] riscv: sbi: Add tests for HSM extension
In-Reply-To: <20240825170824.107467-1-jamestiotio@gmail.com>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
Message-ID: <20240825170824.107467-5-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add some tests for all of the HSM extension functions. These tests
ensure that the HSM extension functions follow the behavior as described
in the SBI specification.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 riscv/Makefile  |   7 +-
 riscv/sbi-asm.S |  79 ++++++++++
 riscv/sbi.c     | 382 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 riscv/sbi-asm.S

diff --git a/riscv/Makefile b/riscv/Makefile
index 179a373d..548041ad 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -43,6 +43,7 @@ cflatobjs += lib/riscv/timer.o
 ifeq ($(ARCH),riscv32)
 cflatobjs += lib/ldiv32.o
 endif
+cflatobjs += riscv/sbi-asm.o
 
 ########################################
 
@@ -99,7 +100,7 @@ cflatobjs += lib/efi.o
 .PRECIOUS: %.so
 
 %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
-%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o
+%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) $(sbi-asm.o) %.aux.o
 	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
 		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
 
@@ -115,7 +116,7 @@ cflatobjs += lib/efi.o
 		-O binary $^ $@
 else
 %.elf: LDFLAGS += -pie -n -z notext
-%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o
+%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) $(sbi-asm.o) %.aux.o
 	$(LD) $(LDFLAGS) -o $@ -T $(SRCDIR)/riscv/flat.lds \
 		$(filter %.o, $^) $(FLATLIBS)
 	@chmod a-x $@
@@ -127,7 +128,7 @@ else
 endif
 
 generated-files = $(asm-offsets)
-$(tests:.$(exe)=.o) $(cstart.o) $(cflatobjs): $(generated-files)
+$(tests:.$(exe)=.o) $(cstart.o) $(sbi-asm.o) $(cflatobjs): $(generated-files)
 
 arch_clean: asm_offsets_clean
 	$(RM) $(TEST_DIR)/*.{o,flat,elf,so,efi,debug} \
diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
new file mode 100644
index 00000000..f31bc096
--- /dev/null
+++ b/riscv/sbi-asm.S
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Helper assembly code routines for RISC-V SBI extension tests.
+ *
+ * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#define __ASSEMBLY__
+#include <config.h>
+#include <asm/csr.h>
+#include <asm/page.h>
+
+#define SBI_HSM_TEST_DONE       (1 << 0)
+#define SBI_HSM_TEST_SATP       (1 << 1)
+#define SBI_HSM_TEST_SIE        (1 << 2)
+#define SBI_HSM_TEST_HARTID_A1  (1 << 3)
+
+.section .text
+.balign 4
+.global sbi_hsm_check_hart_start
+sbi_hsm_check_hart_start:
+	li	t0, 0
+	csrr	t1, CSR_SATP
+	bnez	t1, 1f
+	li	t0, SBI_HSM_TEST_SATP
+1:	csrr	t1, CSR_SSTATUS
+	andi	t1, t1, SR_SIE
+	bnez	t1, 2f
+	ori	t0, t0, SBI_HSM_TEST_SIE
+2:	bne	a0, a1, 3f
+	ori	t0, t0, SBI_HSM_TEST_HARTID_A1
+3:	ori	t0, t0, SBI_HSM_TEST_DONE
+	la	t1, sbi_hsm_hart_start_checks
+	add	t1, t1, a0
+	sb	t0, 0(t1)
+4:	la	t0, sbi_hsm_stop_hart
+	add	t0, t0, a0
+	lb	t0, 0(t0)
+	pause
+	beqz	t0, 4b
+	li	a7, 0x48534d	/* SBI_EXT_HSM */
+	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
+	ecall
+	j	halt
+
+.balign 4
+.global sbi_hsm_check_non_retentive_suspend
+sbi_hsm_check_non_retentive_suspend:
+	li	t0, 0
+	csrr	t1, CSR_SATP
+	bnez	t1, 1f
+	li	t0, SBI_HSM_TEST_SATP
+1:	csrr	t1, CSR_SSTATUS
+	andi	t1, t1, SR_SIE
+	bnez	t1, 2f
+	ori	t0, t0, SBI_HSM_TEST_SIE
+2:	bne	a0, a1, 3f
+	ori	t0, t0, SBI_HSM_TEST_HARTID_A1
+3:	ori	t0, t0, SBI_HSM_TEST_DONE
+	la	t1, sbi_hsm_non_retentive_hart_suspend_checks
+	add	t1, t1, a0
+	sb	t0, 0(t1)
+4:	la	t0, sbi_hsm_stop_hart
+	add	t0, t0, a0
+	lb	t0, 0(t0)
+	pause
+	beqz	t0, 4b
+	li	a7, 0x48534d	/* SBI_EXT_HSM */
+	li	a6, 1		/* SBI_EXT_HSM_HART_STOP */
+	ecall
+	j	halt
+
+.section .data
+.balign PAGE_SIZE
+.global sbi_hsm_hart_start_checks
+sbi_hsm_hart_start_checks:			.space CONFIG_NR_CPUS
+.global sbi_hsm_non_retentive_hart_suspend_checks
+sbi_hsm_non_retentive_hart_suspend_checks:	.space CONFIG_NR_CPUS
+.global sbi_hsm_stop_hart
+sbi_hsm_stop_hart:				.space CONFIG_NR_CPUS
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 6469304b..25fc2e81 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,6 +6,8 @@
  */
 #include <libcflat.h>
 #include <alloc_page.h>
+#include <cpumask.h>
+#include <on-cpus.h>
 #include <stdlib.h>
 #include <string.h>
 #include <limits.h>
@@ -17,8 +19,10 @@
 #include <asm/io.h>
 #include <asm/isa.h>
 #include <asm/mmu.h>
+#include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
 
@@ -425,6 +429,383 @@ static void check_dbcn(void)
 	report_prefix_pop();
 }
 
+#define SBI_HSM_TEST_DONE       (1 << 0)
+#define SBI_HSM_TEST_SATP       (1 << 1)
+#define SBI_HSM_TEST_SIE        (1 << 2)
+#define SBI_HSM_TEST_HARTID_A1  (1 << 3)
+
+static cpumask_t cpus_alive_after_start;
+static cpumask_t cpus_alive_after_retentive_suspend;
+extern void sbi_hsm_check_hart_start(void);
+extern void sbi_hsm_check_non_retentive_suspend(void);
+extern unsigned char sbi_hsm_stop_hart[NR_CPUS];
+extern unsigned char sbi_hsm_hart_start_checks[NR_CPUS];
+extern unsigned char sbi_hsm_non_retentive_hart_suspend_checks[NR_CPUS];
+static void on_secondary_cpus_async(void (*func)(void *data), void *data)
+{
+	int cpu, me = smp_processor_id();
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+		on_cpu_async(cpu, func, data);
+	}
+}
+
+static bool cpumask_test_secondary_cpus(cpumask_t *mask)
+{
+	int cpu, me = smp_processor_id();
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		if (!cpumask_test_cpu(cpu, mask))
+			return false;
+	}
+
+	return true;
+}
+
+static void hart_execute(void *data)
+{
+	int me = smp_processor_id();
+
+	cpumask_set_cpu(me, &cpus_alive_after_start);
+}
+
+static void hart_retentive_suspend(void *data)
+{
+	int me = smp_processor_id();
+	unsigned long hartid = current_thread_info()->hartid;
+	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_RETENTIVE, __pa(NULL), __pa(NULL));
+
+	if (ret.error)
+		report_fail("failed to retentive suspend hart %ld", hartid);
+	else
+		cpumask_set_cpu(me, &cpus_alive_after_retentive_suspend);
+}
+
+static void hart_non_retentive_suspend(void *data)
+{
+	unsigned long hartid = current_thread_info()->hartid;
+
+	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE,
+					     virt_to_phys(&sbi_hsm_check_non_retentive_suspend), hartid);
+
+	if (ret.error)
+		report_fail("failed to non-retentive suspend hart %ld", hartid);
+}
+
+static void hart_wait_on_status(unsigned long hartid, enum sbi_ext_hsm_sid status)
+{
+	struct sbiret ret = sbi_hart_get_status(hartid);
+
+	while (!ret.error && ret.value == status)
+		ret = sbi_hart_get_status(hartid);
+
+	if (ret.error)
+		report_fail("got %ld while waiting on status %u for hart %lx\n", ret.error, status, hartid);
+}
+
+static void check_hsm(void)
+{
+	struct sbiret ret;
+	unsigned long hartid;
+	unsigned char per_hart_start_checks, per_hart_non_retentive_suspend_checks;
+	unsigned long hart_mask[NR_CPUS / BITS_PER_LONG] = {0};
+	bool ipi_failed = false;
+	int cpu, me = smp_processor_id();
+
+	report_prefix_push("hsm");
+
+	if (!sbi_probe(SBI_EXT_HSM)) {
+		report_skip("hsm extension not available");
+		report_prefix_pop();
+		return;
+	}
+
+	report_prefix_push("hart_get_status");
+
+	hartid = current_thread_info()->hartid;
+	ret = sbi_hart_get_status(hartid);
+
+	if (ret.error == SBI_ERR_INVALID_PARAM) {
+		report_fail("current hartid is invalid");
+		report_prefix_popn(2);
+		return;
+	} else if (ret.value != SBI_EXT_HSM_STARTED) {
+		report_fail("current hart is not started");
+		report_prefix_popn(2);
+		return;
+	}
+
+	report_pass("status of current hart is started");
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_start");
+
+	ret = sbi_hart_start(hartid, virt_to_phys(&hart_execute), __pa(NULL));
+	report(ret.error == SBI_ERR_ALREADY_AVAILABLE, "boot hart is already started");
+
+	ret = sbi_hart_start(ULONG_MAX, virt_to_phys(&hart_execute), __pa(NULL));
+	report(ret.error == SBI_ERR_INVALID_PARAM, "invalid hartid check");
+
+	if (nr_cpus < 2) {
+		report_skip("no other cpus to run the remaining hsm tests on");
+		report_prefix_popn(2);
+		return;
+	}
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+		ret = sbi_hart_start(hartid, virt_to_phys(&sbi_hsm_check_hart_start), hartid);
+
+		if (ret.error) {
+			report_fail("failed to start test hart %ld", hartid);
+			report_prefix_popn(2);
+			return;
+		}
+	}
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOPPED);
+		hart_wait_on_status(hartid, SBI_EXT_HSM_START_PENDING);
+		ret = sbi_hart_get_status(hartid);
+		report(!ret.error && ret.value == SBI_EXT_HSM_STARTED,
+		       "test hart with hartid %ld successfully started", hartid);
+	}
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+
+		while (!((per_hart_start_checks = READ_ONCE(sbi_hsm_hart_start_checks[hartid]))
+			 & SBI_HSM_TEST_DONE))
+			cpu_relax();
+
+		report(per_hart_start_checks & SBI_HSM_TEST_SATP,
+		       "satp is zero for test hart %ld", hartid);
+		report(per_hart_start_checks & SBI_HSM_TEST_SIE,
+		       "sstatus.SIE is zero for test hart %ld", hartid);
+		report(per_hart_start_checks & SBI_HSM_TEST_HARTID_A1,
+		       "a0 and a1 are hartid for test hart %ld", hartid);
+	}
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_stop");
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+		WRITE_ONCE(sbi_hsm_stop_hart[hartid], true);
+	}
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOP_PENDING);
+		ret = sbi_hart_get_status(hartid);
+		report(!ret.error && (ret.value == SBI_EXT_HSM_STOPPED),
+		       "test hart %ld successfully stopped", hartid);
+	}
+
+	/* Reset the stop flags so that we can reuse them after suspension tests */
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+		WRITE_ONCE(sbi_hsm_stop_hart[hartid], false);
+	}
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_start");
+
+	on_secondary_cpus_async(hart_execute, NULL);
+
+	for_each_present_cpu(cpu) {
+		if (cpu == me)
+			continue;
+
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOPPED);
+		hart_wait_on_status(hartid, SBI_EXT_HSM_START_PENDING);
+		ret = sbi_hart_get_status(hartid);
+		report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
+		       "new hart with hartid %ld successfully started", hartid);
+	}
+
+	while (!cpumask_test_secondary_cpus(&cpu_idle_mask))
+		cpu_relax();
+
+	report(cpumask_full(&cpu_online_mask), "all cpus online");
+	report(cpumask_test_secondary_cpus(&cpus_alive_after_start),
+	       "all secondary harts successfully executed code after start");
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_suspend");
+
+	if (sbi_probe(SBI_EXT_IPI)) {
+		on_secondary_cpus_async(hart_retentive_suspend, NULL);
+
+		for_each_present_cpu(cpu) {
+			if (cpu == me)
+				continue;
+
+			hartid = cpus[cpu].hartid;
+			hart_mask[hartid / BITS_PER_LONG] |= 1UL << hartid;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+			hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPEND_PENDING);
+			ret = sbi_hart_get_status(hartid);
+			report(!ret.error && (ret.value == SBI_EXT_HSM_SUSPENDED),
+			       "hart %ld successfully retentive suspended", hartid);
+		}
+
+		for (int i = 0; i < NR_CPUS / BITS_PER_LONG; ++i) {
+			if (hart_mask[i]) {
+				ret = sbi_send_ipi(hart_mask[i], i * BITS_PER_LONG);
+				if (ret.error) {
+					ipi_failed = true;
+					report_fail("got %ld when sending ipi to retentive suspended harts",
+						    ret.error);
+					break;
+				}
+			}
+		}
+
+		if (!ipi_failed) {
+			for_each_present_cpu(cpu) {
+				if (cpu == me)
+					continue;
+
+				hartid = cpus[cpu].hartid;
+				hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPENDED);
+				hart_wait_on_status(hartid, SBI_EXT_HSM_RESUME_PENDING);
+				ret = sbi_hart_get_status(hartid);
+				report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
+				       "hart %ld successfully retentive resumed", hartid);
+			}
+
+			while (!cpumask_test_secondary_cpus(&cpu_idle_mask))
+				cpu_relax();
+
+			report(cpumask_full(&cpu_online_mask), "all cpus online");
+			report(cpumask_test_secondary_cpus(&cpus_alive_after_retentive_suspend),
+			       "all secondary harts successfully executed code after retentive suspend");
+		}
+
+		/* Reset the ipi_failed flag so that we can reuse it for non-retentive suspension tests */
+		ipi_failed = false;
+
+		on_secondary_cpus_async(hart_non_retentive_suspend, NULL);
+
+		for_each_present_cpu(cpu) {
+			if (cpu == me)
+				continue;
+
+			hartid = cpus[cpu].hartid;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+			hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPEND_PENDING);
+			ret = sbi_hart_get_status(hartid);
+			report(!ret.error && (ret.value == SBI_EXT_HSM_SUSPENDED),
+			       "hart %ld successfully non-retentive suspended", hartid);
+		}
+
+		for (int i = 0; i < NR_CPUS / BITS_PER_LONG; ++i) {
+			if (hart_mask[i]) {
+				ret = sbi_send_ipi(hart_mask[i], i * BITS_PER_LONG);
+				if (ret.error) {
+					ipi_failed = true;
+					report_fail("got %ld when sending ipi to non-retentive suspended harts",
+						    ret.error);
+					break;
+				}
+			}
+		}
+
+		if (!ipi_failed) {
+			for_each_present_cpu(cpu) {
+				if (cpu == me)
+					continue;
+
+				hartid = cpus[cpu].hartid;
+				hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPENDED);
+				hart_wait_on_status(hartid, SBI_EXT_HSM_RESUME_PENDING);
+				ret = sbi_hart_get_status(hartid);
+				report(!ret.error && (ret.value == SBI_EXT_HSM_STARTED),
+				       "hart %ld successfully non-retentive resumed", hartid);
+			}
+
+			for_each_present_cpu(cpu) {
+				if (cpu == me)
+					continue;
+
+				hartid = cpus[cpu].hartid;
+
+				while (!((per_hart_non_retentive_suspend_checks =
+					 READ_ONCE(sbi_hsm_non_retentive_hart_suspend_checks[hartid]))
+					 & SBI_HSM_TEST_DONE))
+					cpu_relax();
+
+				report(per_hart_non_retentive_suspend_checks & SBI_HSM_TEST_SATP,
+				       "satp is zero for test hart %ld", hartid);
+				report(per_hart_non_retentive_suspend_checks & SBI_HSM_TEST_SIE,
+				       "sstatus.SIE is zero for test hart %ld", hartid);
+				report(per_hart_non_retentive_suspend_checks & SBI_HSM_TEST_HARTID_A1,
+				       "a0 and a1 are hartid for test hart %ld", hartid);
+			}
+
+			report_prefix_pop();
+
+			report_prefix_push("hart_stop");
+
+			for_each_present_cpu(cpu) {
+				if (cpu == me)
+					continue;
+
+				hartid = cpus[cpu].hartid;
+				WRITE_ONCE(sbi_hsm_stop_hart[hartid], true);
+			}
+
+			for_each_present_cpu(cpu) {
+				if (cpu == me)
+					continue;
+
+				hartid = cpus[cpu].hartid;
+				hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+				hart_wait_on_status(hartid, SBI_EXT_HSM_STOP_PENDING);
+				ret = sbi_hart_get_status(hartid);
+				report(!ret.error && (ret.value == SBI_EXT_HSM_STOPPED),
+				       "test hart %ld successfully stopped", hartid);
+			}
+		}
+	} else {
+		report_skip("skipping suspension tests since ipi extension is unavailable");
+	}
+
+	report_prefix_popn(2);
+}
+
 int main(int argc, char **argv)
 {
 	if (argc > 1 && !strcmp(argv[1], "-h")) {
@@ -435,6 +816,7 @@ int main(int argc, char **argv)
 	report_prefix_push("sbi");
 	check_base();
 	check_time();
+	check_hsm();
 	check_dbcn();
 
 	return report_summary();
-- 
2.43.0


