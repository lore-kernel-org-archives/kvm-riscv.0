From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 25 Apr 2024 20:16:37 -0700
Subject: [PATCH v2 kvm-riscv/for-next 2/2] drivers/perf: riscv: Fix RV32 snapshot overflow use case
In-Reply-To: <20240426031637.4135544-1-atishp@rivosinc.com>
References: <20240426031637.4135544-1-atishp@rivosinc.com>
Message-ID: <20240426031637.4135544-3-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The shadow copy alogirthm is implemented incorrectly. This patch fixes
the behavior by keeping a per cpu shadow copy of the counter values to
avoid clobbering for the cases where system more than XLEN counters and
the overflown counter index are beyond XLEN. This issue can only be
observed only in RV32 if an SBI implementation assigns logical counters
ids greater than XLEN or firmware counter overflow is supported in the
future.

Fixes: 22f5dac41004 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 45 +++++++++++++++++++---------------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2694110f1cff..5d699b06dcb6 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -588,6 +588,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
 		return sbi_err_map_linux_errno(ret.error);
 	}
 
+	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
 	cpu_hw_evt->snapshot_set_done = true;
 
 	return 0;
@@ -605,7 +606,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	/* Read the value from the shared memory directly only if counter is stopped */
-	if (sbi_pmu_snapshot_available() & (hwc->state & PERF_HES_STOPPED)) {
+	if (sbi_pmu_snapshot_available() && (hwc->state & PERF_HES_STOPPED)) {
 		val = sdata->ctr_values[idx];
 		return val;
 	}
@@ -769,36 +770,36 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 	unsigned long flag = 0;
-	int i;
+	int i, idx;
 	struct sbiret ret;
-	unsigned long temp_ctr_values[64] = {0};
-	unsigned long ctr_val, temp_ctr_overflow_mask = 0;
+	u64 temp_ctr_overflow_mask = 0;
 
 	if (sbi_pmu_snapshot_available())
 		flag = SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
+	/* Reset the shadow copy to avoid save/restore any value from previous overflow */
+	memset(cpu_hw_evt->snapshot_cval_shcopy, 0, sizeof(u64) * RISCV_MAX_COUNTERS);
+
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		/* No need to check the error here as we can't do anything about the error */
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, i * BITS_PER_LONG,
 				cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 		if (!ret.error && sbi_pmu_snapshot_available()) {
 			/* Save the counter values to avoid clobbering */
-			temp_ctr_values[i * BITS_PER_LONG + i] = sdata->ctr_values[i];
+			for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
+				cpu_hw_evt->snapshot_cval_shcopy[i * BITS_PER_LONG + idx] =
+							sdata->ctr_values[idx];
 			/* Save the overflow mask to avoid clobbering */
-			if (BIT(i) & sdata->ctr_overflow_mask)
-				temp_ctr_overflow_mask |= BIT(i + i * BITS_PER_LONG);
+			temp_ctr_overflow_mask |= sdata->ctr_overflow_mask << (i * BITS_PER_LONG);
 		}
 	}
 
-	/* Restore the counter values to the shared memory */
+	/* Restore the counter values to the shared memory for used hw counters */
 	if (sbi_pmu_snapshot_available()) {
-		for (i = 0; i < 64; i++) {
-			ctr_val = temp_ctr_values[i];
-			if (ctr_val)
-				sdata->ctr_values[i] = ctr_val;
-			if (temp_ctr_overflow_mask)
-				sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
-		}
+		for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS)
+			sdata->ctr_values[idx] = cpu_hw_evt->snapshot_cval_shcopy[idx];
+		if (temp_ctr_overflow_mask)
+			sdata->ctr_overflow_mask = temp_ctr_overflow_mask;
 	}
 }
 
@@ -850,7 +851,7 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
 						   u64 ctr_ovf_mask)
 {
-	int idx = 0;
+	int i, idx = 0;
 	struct perf_event *event;
 	unsigned long flag = SBI_PMU_START_FLAG_INIT_SNAPSHOT;
 	u64 max_period, init_val = 0;
@@ -863,7 +864,7 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 			hwc = &event->hw;
 			max_period = riscv_pmu_ctr_get_width_mask(event);
 			init_val = local64_read(&hwc->prev_count) & max_period;
-			sdata->ctr_values[idx] = init_val;
+			cpu_hw_evt->snapshot_cval_shcopy[idx] = init_val;
 		}
 		/*
 		 * We do not need to update the non-overflow counters the previous
@@ -871,10 +872,14 @@ static inline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_
 		 */
 	}
 
-	for (idx = 0; idx < BITS_TO_LONGS(RISCV_MAX_COUNTERS); idx++) {
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		/* Restore the counter values to relative indices for used hw counters */
+		for_each_set_bit(idx, &cpu_hw_evt->used_hw_ctrs[i], BITS_PER_LONG)
+			sdata->ctr_values[idx] =
+					cpu_hw_evt->snapshot_cval_shcopy[idx + i * BITS_PER_LONG];
 		/* Start all the counters in a single shot */
 		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx * BITS_PER_LONG,
-			  cpu_hw_evt->used_hw_ctrs[idx], flag, 0, 0, 0);
+			  cpu_hw_evt->used_hw_ctrs[i], flag, 0, 0, 0);
 	}
 }
 
@@ -898,7 +903,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	int lidx, hidx, fidx;
 	struct riscv_pmu *pmu;
 	struct perf_event *event;
-	unsigned long overflow;
+	u64 overflow;
 	u64 overflowed_ctrs = 0;
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index c3fa90970042..701974639ff2 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -45,6 +45,8 @@ struct cpu_hw_events {
 	phys_addr_t snapshot_addr_phys;
 	/* Boolean flag to indicate setup is already done */
 	bool snapshot_set_done;
+	/* A shadow copy of the counter values to avoid clobbering during multiple SBI calls */
+	u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
 };
 
 struct riscv_pmu {
-- 
2.34.1


