From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 23 Oct 2024 15:21:35 +0200
Subject: [kvm-unit-tests PATCH 4/4] riscv: Rework smp_boot_secondary
In-Reply-To: <20241023132130.118073-6-andrew.jones@linux.dev>
References: <20241023132130.118073-6-andrew.jones@linux.dev>
Message-ID: <20241023132130.118073-10-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use HSM status to determine when a secondary should be started.
Also save the stack pointer so a secondary may be stopped and
started again without leaking old stacks.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/processor.h |  1 +
 lib/riscv/smp.c           | 49 +++++++++++++++++++++++++++------------
 riscv/cstart.S            |  1 +
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index 4063255a3475..401042724cee 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -13,6 +13,7 @@ struct thread_info {
 	int cpu;
 	unsigned long hartid;
 	unsigned long isa[1];
+	unsigned long sp;
 	exception_fn exception_handlers[EXCEPTION_CAUSE_MAX];
 	exception_fn interrupt_handlers[INTERRUPT_CAUSE_MAX];
 };
diff --git a/lib/riscv/smp.c b/lib/riscv/smp.c
index eb7061abfe7f..e92f83e1310d 100644
--- a/lib/riscv/smp.c
+++ b/lib/riscv/smp.c
@@ -19,8 +19,6 @@ cpumask_t cpu_present_mask;
 cpumask_t cpu_online_mask;
 cpumask_t cpu_idle_mask;
 
-static cpumask_t cpu_started;
-
 secondary_func_t secondary_cinit(struct secondary_data *data)
 {
 	struct thread_info *info;
@@ -37,27 +35,40 @@ secondary_func_t secondary_cinit(struct secondary_data *data)
 
 static void __smp_boot_secondary(int cpu, secondary_func_t func)
 {
-	struct secondary_data *sp = alloc_pages(1) + SZ_8K - 16;
-	phys_addr_t sp_phys;
+	void *sp_mem = (void *)cpus[cpu].sp;
+	struct secondary_data *data;
 	struct sbiret ret;
 
-	sp -= sizeof(struct secondary_data);
-	sp->satp = csr_read(CSR_SATP);
-	sp->stvec = csr_read(CSR_STVEC);
-	sp->func = func;
+	if (!sp_mem) {
+		phys_addr_t sp_phys;
+
+		sp_mem = alloc_pages(1) + SZ_8K - 16;
+		sp_phys = virt_to_phys(sp_mem);
+		cpus[cpu].sp = __pa(sp_phys);
 
-	sp_phys = virt_to_phys(sp);
-	assert(sp_phys == __pa(sp_phys));
+		assert(sp_phys == cpus[cpu].sp);
+	}
 
-	ret = sbi_hart_start(cpus[cpu].hartid, (unsigned long)&secondary_entry, __pa(sp_phys));
+	sp_mem -= sizeof(struct secondary_data);
+	data = (struct secondary_data *)sp_mem;
+	data->satp = csr_read(CSR_SATP);
+	data->stvec = csr_read(CSR_STVEC);
+	data->func = func;
+
+	ret = sbi_hart_start(cpus[cpu].hartid, (unsigned long)&secondary_entry, cpus[cpu].sp);
 	assert(ret.error == SBI_SUCCESS);
 }
 
 void smp_boot_secondary(int cpu, void (*func)(void))
 {
-	int ret = cpumask_test_and_set_cpu(cpu, &cpu_started);
+	struct sbiret ret;
 
-	assert_msg(!ret, "CPU%d already boot once", cpu);
+	do {
+		ret = sbi_hart_get_status(cpus[cpu].hartid);
+		assert(!ret.error);
+	} while (ret.value == SBI_EXT_HSM_STOP_PENDING);
+
+	assert_msg(ret.value == SBI_EXT_HSM_STOPPED, "CPU%d is not stopped", cpu);
 	__smp_boot_secondary(cpu, func);
 
 	while (!cpu_online(cpu))
@@ -66,10 +77,18 @@ void smp_boot_secondary(int cpu, void (*func)(void))
 
 void smp_boot_secondary_nofail(int cpu, void (*func)(void))
 {
-	int ret = cpumask_test_and_set_cpu(cpu, &cpu_started);
+	struct sbiret ret;
+
+	do {
+		ret = sbi_hart_get_status(cpus[cpu].hartid);
+		assert(!ret.error);
+	} while (ret.value == SBI_EXT_HSM_STOP_PENDING);
 
-	if (!ret)
+	if (ret.value == SBI_EXT_HSM_STOPPED)
 		__smp_boot_secondary(cpu, func);
+	else
+		assert_msg(ret.value == SBI_EXT_HSM_START_PENDING || ret.value == SBI_EXT_HSM_STARTED,
+			   "CPU%d is in an unexpected state %ld", cpu, ret.value);
 
 	while (!cpu_online(cpu))
 		smp_wait_for_event();
diff --git a/riscv/cstart.S b/riscv/cstart.S
index 687173706d83..b7ee9b9c96b3 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -149,6 +149,7 @@ secondary_entry:
 	csrw	CSR_SSCRATCH, a0
 	mv	sp, a1
 	mv	fp, zero
+	addi	sp, sp, -SECONDARY_DATA_SIZE
 	REG_L	a0, SECONDARY_STVEC(sp)
 	csrw	CSR_STVEC, a0
 	mv	a0, sp
-- 
2.47.0


