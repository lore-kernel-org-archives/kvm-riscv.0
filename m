From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 16 Sep 2024 02:34:59 +0800
Subject: [kvm-unit-tests PATCH v4 3/3] riscv: sbi: Add tests for HSM extension
In-Reply-To: <20240915183459.52476-1-jamestiotio@gmail.com>
References: <20240915183459.52476-1-jamestiotio@gmail.com>
Message-ID: <20240915183459.52476-4-jamestiotio@gmail.com>
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
 riscv/sbi.h |  10 +
 riscv/sbi.c | 561 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 571 insertions(+)
 create mode 100644 riscv/sbi.h

diff --git a/riscv/sbi.h b/riscv/sbi.h
new file mode 100644
index 00000000..e8625cb1
--- /dev/null
+++ b/riscv/sbi.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _RISCV_SBI_H_
+#define _RISCV_SBI_H_
+
+#define SBI_HSM_TEST_DONE	(1 << 0)
+#define SBI_HSM_TEST_SATP	(1 << 1)
+#define SBI_HSM_TEST_SIE	(1 << 2)
+#define SBI_HSM_TEST_HARTID_A1	(1 << 3)
+
+#endif /* _RISCV_SBI_H_ */
diff --git a/riscv/sbi.c b/riscv/sbi.c
index d4dfd48e..fab0091b 100644
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
@@ -16,11 +18,13 @@
 #include <asm/delay.h>
 #include <asm/io.h>
 #include <asm/mmu.h>
+#include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
+#include <sbi.h>
 
 #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
 
@@ -47,6 +51,11 @@ static struct sbiret sbi_dbcn_write_byte(uint8_t byte)
 	return sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, byte, 0, 0, 0, 0, 0);
 }
 
+static struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque)
+{
+	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
+}
+
 static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo)
 {
 	*lo = (unsigned long)paddr;
@@ -434,6 +443,557 @@ static void check_dbcn(void)
 	report_prefix_popn(2);
 }
 
+unsigned char sbi_hsm_stop_hart[NR_CPUS];
+unsigned char sbi_hsm_hart_start_checks[NR_CPUS];
+unsigned char sbi_hsm_non_retentive_hart_suspend_checks[NR_CPUS];
+cpumask_t sbi_hsm_started_hart_checks;
+cpumask_t sbi_hsm_invalid_hartid_checks;
+static bool hsm_timer_fired;
+extern void sbi_hsm_check_hart_start(void);
+extern void sbi_hsm_check_non_retentive_suspend(void);
+
+static void hsm_timer_irq_handler(struct pt_regs *regs)
+{
+	hsm_timer_fired = true;
+	timer_stop();
+}
+
+static void hsm_timer_setup(void)
+{
+	install_irq_handler(IRQ_S_TIMER, hsm_timer_irq_handler);
+	local_irq_enable();
+	timer_irq_enable();
+}
+
+static void hsm_timer_teardown(void)
+{
+	timer_irq_disable();
+	local_irq_disable();
+	install_irq_handler(IRQ_S_TIMER, NULL);
+}
+
+static void hart_empty_fn(void *data) {}
+
+static void hart_execute(void *data)
+{
+	struct sbiret ret;
+	unsigned long hartid = current_thread_info()->hartid;
+	int me = smp_processor_id();
+
+	ret = sbi_hart_start(hartid, virt_to_phys(&hart_empty_fn), 0);
+
+	if (ret.error == SBI_ERR_ALREADY_AVAILABLE)
+		cpumask_set_cpu(me, &sbi_hsm_started_hart_checks);
+
+	ret = sbi_hart_start(ULONG_MAX, virt_to_phys(&hart_empty_fn), 0);
+
+	if (ret.error == SBI_ERR_INVALID_PARAM)
+		cpumask_set_cpu(me, &sbi_hsm_invalid_hartid_checks);
+}
+
+static void hart_retentive_suspend(void *data)
+{
+	unsigned long hartid = current_thread_info()->hartid;
+	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_RETENTIVE, 0, 0);
+
+	if (ret.error)
+		report_fail("failed to retentive suspend hart %ld (error=%ld)", hartid, ret.error);
+}
+
+static void hart_non_retentive_suspend(void *data)
+{
+	unsigned long hartid = current_thread_info()->hartid;
+
+	/* Set opaque as hartid so that we can check a0 == a1, ensuring that a0 is hartid and a1 is opaque */
+	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE,
+					     virt_to_phys(&sbi_hsm_check_non_retentive_suspend), hartid);
+
+	report_fail("failed to non-retentive suspend hart %ld (error=%ld)", hartid, ret.error);
+}
+
+static void hart_wait_on_status(unsigned long hartid, enum sbi_ext_hsm_sid status)
+{
+	struct sbiret ret = sbi_hart_get_status(hartid);
+
+	while (!ret.error && ret.value == status && !hsm_timer_fired) {
+		cpu_relax();
+		ret = sbi_hart_get_status(hartid);
+	}
+
+	if (hsm_timer_fired)
+		report_info("timer fired while waiting on status %u for hart %ld", status, hartid);
+	else if (ret.error)
+		report_fail("got %ld while waiting on status %u for hart %ld\n", ret.error, status, hartid);
+}
+
+static void check_hsm(void)
+{
+	struct sbiret ret;
+	unsigned long hartid;
+	cpumask_t secondary_cpus_mask, hsm_start, hsm_stop, hsm_suspend, hsm_resume, hsm_check;
+	int cpu, me = smp_processor_id();
+	int max_cpu = getenv("SBI_HSM_MAX_CPU") ? strtol(getenv("SBI_HSM_MAX_CPU"), NULL, 0) : INT_MAX;
+	unsigned long hsm_timer_duration = getenv("SBI_HSM_TIMER_DURATION")
+					 ? strtol(getenv("SBI_HSM_TIMER_DURATION"), NULL, 0) : 200000;
+
+	max_cpu = MIN(max_cpu, nr_cpus - 1);
+
+	cpumask_copy(&secondary_cpus_mask, &cpu_present_mask);
+	cpumask_clear_cpu(me, &secondary_cpus_mask);
+	for_each_cpu(cpu, &secondary_cpus_mask)
+		if (cpu > max_cpu)
+			cpumask_clear_cpu(cpu, &secondary_cpus_mask);
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
+	if (ret.error) {
+		report_fail("failed to get status of current hart (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	} else if (ret.value != SBI_EXT_HSM_STARTED) {
+		report_fail("current hart is not started (ret.value=%ld)", ret.value);
+		report_prefix_popn(2);
+		return;
+	}
+
+	report_pass("status of current hart is started");
+
+	report_prefix_pop();
+
+	if (max_cpu + 1 < 2) {
+		report_skip("no other cpus to run the remaining hsm tests on");
+		report_prefix_pop();
+		return;
+	}
+
+	/* This is necessary since we do not choose which cpu the boot hart will run on */
+	if (me > max_cpu)
+		max_cpu++;
+
+	report_prefix_push("hart_start");
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		/* Set opaque as hartid so that we can check a0 == a1, ensuring that a0 is hartid and a1 is opaque */
+		ret = sbi_hart_start(hartid, virt_to_phys(&sbi_hsm_check_hart_start), hartid);
+		if (ret.error) {
+			report_fail("failed to start test hart %ld (error=%ld)", hartid, ret.error);
+			report_prefix_popn(2);
+			return;
+		}
+	}
+
+	cpumask_clear(&hsm_start);
+	hsm_timer_setup();
+	timer_start(hsm_timer_duration);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOPPED);
+		if (hsm_timer_fired)
+			break;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_START_PENDING);
+		if (hsm_timer_fired)
+			break;
+		ret = sbi_hart_get_status(hartid);
+		if (ret.error)
+			report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+		else if (ret.value != SBI_EXT_HSM_STARTED)
+			report_info("hart %ld status is not 'started' (ret.value=%ld)", hartid, ret.value);
+		else
+			cpumask_set_cpu(cpu, &hsm_start);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts started");
+		report_prefix_popn(2);
+		return;
+	}
+
+	report(cpumask_weight(&hsm_start) == max_cpu, "all secondary harts started");
+
+	cpumask_clear(&hsm_check);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+
+		while (!(READ_ONCE(sbi_hsm_hart_start_checks[cpu]) & SBI_HSM_TEST_DONE) && !hsm_timer_fired)
+			cpu_relax();
+
+		if (hsm_timer_fired)
+			break;
+
+		if (!(sbi_hsm_hart_start_checks[cpu] & SBI_HSM_TEST_SATP))
+			report_info("satp is not zero for test hart %ld", hartid);
+		else if (!(sbi_hsm_hart_start_checks[cpu] & SBI_HSM_TEST_SIE))
+			report_info("sstatus.SIE is not zero for test hart %ld", hartid);
+		else if (!(sbi_hsm_hart_start_checks[cpu] & SBI_HSM_TEST_HARTID_A1))
+			report_info("either a0 or a1 is not hartid for test hart %ld", hartid);
+		else
+			cpumask_set_cpu(cpu, &hsm_check);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts are done with checks");
+		report_prefix_popn(2);
+		return;
+	}
+
+	timer_stop();
+
+	report(cpumask_weight(&hsm_check) == max_cpu,
+	       "all secondary harts have expected register values after hart start");
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_stop");
+
+	memset(sbi_hsm_stop_hart, 1, sizeof(sbi_hsm_stop_hart));
+
+	cpumask_clear(&hsm_stop);
+	hsm_timer_fired = false;
+	timer_start(hsm_timer_duration);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+		if (hsm_timer_fired)
+			break;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOP_PENDING);
+		if (hsm_timer_fired)
+			break;
+		ret = sbi_hart_get_status(hartid);
+		if (ret.error)
+			report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+		else if (ret.value != SBI_EXT_HSM_STOPPED)
+			report_info("hart %ld status is not 'stopped' (ret.value=%ld)", hartid, ret.value);
+		else
+			cpumask_set_cpu(cpu, &hsm_stop);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts stopped");
+		report_prefix_popn(2);
+		return;
+	}
+
+	timer_stop();
+
+	report(cpumask_weight(&hsm_stop) == max_cpu, "all secondary harts stopped");
+
+	/* Reset the stop flags so that we can reuse them after suspension tests */
+	memset(sbi_hsm_stop_hart, 0, sizeof(sbi_hsm_stop_hart));
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_start");
+
+	on_cpumask_async(&secondary_cpus_mask, hart_execute, NULL);
+
+	cpumask_clear(&hsm_start);
+	hsm_timer_fired = false;
+	timer_start(hsm_timer_duration);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STOPPED);
+		if (hsm_timer_fired)
+			break;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_START_PENDING);
+		if (hsm_timer_fired)
+			break;
+		ret = sbi_hart_get_status(hartid);
+		if (ret.error)
+			report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+		else if (ret.value != SBI_EXT_HSM_STARTED)
+			report_info("hart %ld status is not 'started' (ret.value=%ld)", hartid, ret.value);
+		else
+			cpumask_set_cpu(cpu, &hsm_start);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts started");
+		report_prefix_popn(2);
+		return;
+	}
+
+	report(cpumask_weight(&hsm_start) == max_cpu, "all secondary harts started");
+
+	while (cpumask_weight(&cpu_idle_mask) != max_cpu && !hsm_timer_fired)
+		cpu_relax();
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts started");
+		report_prefix_popn(2);
+		return;
+	}
+
+	timer_stop();
+
+	report(cpumask_weight(&cpu_idle_mask) == max_cpu,
+	       "all secondary harts successfully executed code after start");
+	report(cpumask_weight(&cpu_online_mask) == max_cpu + 1, "all secondary harts online");
+	report(cpumask_weight(&sbi_hsm_started_hart_checks) == max_cpu,
+	       "all secondary harts are already started");
+	report(cpumask_weight(&sbi_hsm_invalid_hartid_checks) == max_cpu,
+	       "all secondary harts refuse to start with invalid hartid");
+
+	report_prefix_pop();
+
+	report_prefix_push("hart_suspend");
+
+	if (!sbi_probe(SBI_EXT_IPI)) {
+		hsm_timer_teardown();
+		report_skip("skipping suspension tests since ipi extension is unavailable");
+		report_prefix_popn(2);
+		return;
+	}
+
+	on_cpumask_async(&secondary_cpus_mask, hart_retentive_suspend, NULL);
+
+	cpumask_clear(&hsm_suspend);
+	hsm_timer_fired = false;
+	timer_start(hsm_timer_duration);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+		if (hsm_timer_fired)
+			break;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPEND_PENDING);
+		if (hsm_timer_fired)
+			break;
+		ret = sbi_hart_get_status(hartid);
+		if (ret.error)
+			report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+		else if (ret.value != SBI_EXT_HSM_SUSPENDED)
+			report_info("hart %ld status is not 'suspended' (ret.value=%ld)", hartid, ret.value);
+		else
+			cpumask_set_cpu(cpu, &hsm_suspend);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts retentive suspended");
+		report_prefix_popn(2);
+		return;
+	}
+
+	timer_stop();
+
+	report(cpumask_weight(&hsm_suspend) == max_cpu, "all secondary harts retentive suspended");
+
+	ret = sbi_send_ipi_cpumask(&secondary_cpus_mask);
+
+	if (!ret.error) {
+		cpumask_clear(&hsm_resume);
+		hsm_timer_fired = false;
+		timer_start(hsm_timer_duration);
+
+		for_each_cpu(cpu, &secondary_cpus_mask) {
+			hartid = cpus[cpu].hartid;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPENDED);
+			if (hsm_timer_fired)
+				break;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_RESUME_PENDING);
+			if (hsm_timer_fired)
+				break;
+			ret = sbi_hart_get_status(hartid);
+			if (ret.error)
+				report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+			else if (ret.value != SBI_EXT_HSM_STARTED)
+				report_info("hart %ld status is not 'started' (ret.value=%ld)", hartid, ret.value);
+			else
+				cpumask_set_cpu(cpu, &hsm_resume);
+		}
+
+		if (hsm_timer_fired) {
+			hsm_timer_teardown();
+			report_fail("hsm timer fired before all secondary harts retentive resumed");
+			report_prefix_popn(2);
+			return;
+		}
+
+		report(cpumask_weight(&hsm_resume) == max_cpu, "all secondary harts retentive resumed");
+
+		while (cpumask_weight(&cpu_idle_mask) != max_cpu && !hsm_timer_fired)
+			cpu_relax();
+
+		if (hsm_timer_fired) {
+			hsm_timer_teardown();
+			report_fail("hsm timer fired before all secondary harts retentive resumed");
+			report_prefix_popn(2);
+			return;
+		}
+
+		timer_stop();
+
+		report(cpumask_weight(&cpu_idle_mask) == max_cpu,
+		       "all secondary harts successfully executed code after retentive suspend");
+		report(cpumask_weight(&cpu_online_mask) == max_cpu + 1,
+		       "all secondary harts online");
+	}
+
+	on_cpumask_async(&secondary_cpus_mask, hart_non_retentive_suspend, NULL);
+
+	cpumask_clear(&hsm_suspend);
+	hsm_timer_fired = false;
+	timer_start(hsm_timer_duration);
+
+	for_each_cpu(cpu, &secondary_cpus_mask) {
+		hartid = cpus[cpu].hartid;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+		if (hsm_timer_fired)
+			break;
+		hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPEND_PENDING);
+		if (hsm_timer_fired)
+			break;
+		ret = sbi_hart_get_status(hartid);
+		if (ret.error)
+			report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+		else if (ret.value != SBI_EXT_HSM_SUSPENDED)
+			report_info("hart %ld status is not 'suspended' (ret.value=%ld)", hartid, ret.value);
+		else
+			cpumask_set_cpu(cpu, &hsm_suspend);
+	}
+
+	if (hsm_timer_fired) {
+		hsm_timer_teardown();
+		report_fail("hsm timer fired before all secondary harts non-retentive suspended");
+		report_prefix_popn(2);
+		return;
+	}
+
+	timer_stop();
+
+	report(cpumask_weight(&hsm_suspend) == max_cpu, "all secondary harts non-retentive suspended");
+
+	ret = sbi_send_ipi_cpumask(&secondary_cpus_mask);
+
+	if (!ret.error) {
+		cpumask_clear(&hsm_resume);
+		hsm_timer_fired = false;
+		timer_start(hsm_timer_duration);
+
+		for_each_cpu(cpu, &secondary_cpus_mask) {
+			hartid = cpus[cpu].hartid;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_SUSPENDED);
+			if (hsm_timer_fired)
+				break;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_RESUME_PENDING);
+			if (hsm_timer_fired)
+				break;
+			ret = sbi_hart_get_status(hartid);
+			if (ret.error)
+				report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+			else if (ret.value != SBI_EXT_HSM_STARTED)
+				report_info("hart %ld status is not 'started' (ret.value=%ld)", hartid, ret.value);
+			else
+				cpumask_set_cpu(cpu, &hsm_resume);
+		}
+
+		if (hsm_timer_fired) {
+			hsm_timer_teardown();
+			report_fail("hsm timer fired before all secondary harts non-retentive resumed");
+			report_prefix_popn(2);
+			return;
+		}
+
+		report(cpumask_weight(&hsm_resume) == max_cpu, "all secondary harts non-retentive resumed");
+
+		cpumask_clear(&hsm_check);
+
+		for_each_cpu(cpu, &secondary_cpus_mask) {
+			hartid = cpus[cpu].hartid;
+
+			while (!((READ_ONCE(sbi_hsm_non_retentive_hart_suspend_checks[cpu])) & SBI_HSM_TEST_DONE)
+			       && !hsm_timer_fired)
+				cpu_relax();
+
+			if (hsm_timer_fired)
+				break;
+
+			if (!(sbi_hsm_non_retentive_hart_suspend_checks[cpu] & SBI_HSM_TEST_SATP))
+				report_info("satp is not zero for test hart %ld", hartid);
+			else if (!(sbi_hsm_non_retentive_hart_suspend_checks[cpu] & SBI_HSM_TEST_SIE))
+				report_info("sstatus.SIE is not zero for test hart %ld", hartid);
+			else if (!(sbi_hsm_non_retentive_hart_suspend_checks[cpu] & SBI_HSM_TEST_HARTID_A1))
+				report_info("either a0 or a1 is not hartid for test hart %ld", hartid);
+			else
+				cpumask_set_cpu(cpu, &hsm_check);
+		}
+
+		if (hsm_timer_fired) {
+			hsm_timer_teardown();
+			report_fail("hsm timer fired before all secondary harts are done with checks");
+			report_prefix_popn(2);
+			return;
+		}
+
+		timer_stop();
+
+		report(cpumask_weight(&hsm_check) == max_cpu,
+		       "all secondary harts have expected register values after non-retentive resume");
+
+		report_prefix_pop();
+
+		report_prefix_push("hart_stop");
+
+		memset(sbi_hsm_stop_hart, 1, sizeof(sbi_hsm_stop_hart));
+
+		cpumask_clear(&hsm_stop);
+		hsm_timer_fired = false;
+		timer_start(hsm_timer_duration);
+
+		for_each_cpu(cpu, &secondary_cpus_mask) {
+			hartid = cpus[cpu].hartid;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_STARTED);
+			if (hsm_timer_fired)
+				break;
+			hart_wait_on_status(hartid, SBI_EXT_HSM_STOP_PENDING);
+			if (hsm_timer_fired)
+				break;
+			ret = sbi_hart_get_status(hartid);
+			if (ret.error)
+				report_info("hart %ld get status failed (error=%ld)", hartid, ret.error);
+			else if (ret.value != SBI_EXT_HSM_STOPPED)
+				report_info("hart %ld status is not 'stopped' (ret.value=%ld)", hartid, ret.value);
+			else
+				cpumask_set_cpu(cpu, &hsm_stop);
+		}
+
+		if (hsm_timer_fired) {
+			hsm_timer_teardown();
+			report_fail("hsm timer fired before all secondary harts stopped after resumption");
+			report_prefix_popn(2);
+			return;
+		}
+
+		timer_stop();
+
+		report(cpumask_weight(&hsm_stop) == max_cpu, "all secondary harts stopped after resumption");
+	}
+
+	hsm_timer_teardown();
+	report_prefix_popn(2);
+}
+
 int main(int argc, char **argv)
 {
 	if (argc > 1 && !strcmp(argv[1], "-h")) {
@@ -444,6 +1004,7 @@ int main(int argc, char **argv)
 	report_prefix_push("sbi");
 	check_base();
 	check_time();
+	check_hsm();
 	check_dbcn();
 
 	return report_summary();
-- 
2.43.0


