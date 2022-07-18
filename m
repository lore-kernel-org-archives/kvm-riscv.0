From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 18 Jul 2022 10:01:57 -0700
Subject: [RFC  1/9] RISC-V: Define a helper function to probe number of hardware counters
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
Message-ID: <20220718170205.2972215-2-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM module needs to know how many hardware counters the platform supports.
Otherwise, it will not be able to show optimal value of virtual
counters to the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 23 +++++++++++++++++------
 include/linux/perf/riscv_pmu.h |  4 ++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 24124546844c..1723af68ffa1 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -27,6 +27,7 @@
  */
 static union sbi_pmu_ctr_info *pmu_ctr_list;
 static unsigned int riscv_pmu_irq;
+static struct riscv_pmu *rvpmu;
 
 struct sbi_pmu_event_data {
 	union {
@@ -227,6 +228,12 @@ static const struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_M
 	},
 };
 
+int riscv_pmu_sbi_get_num_hw_ctrs(void)
+{
+	return rvpmu ? rvpmu->num_hw_counters : 0;
+}
+EXPORT_SYMBOL(riscv_pmu_sbi_get_num_hw_ctrs);
+
 static int pmu_sbi_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -443,7 +450,7 @@ static int pmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int pmu_sbi_get_ctrinfo(int nctr)
+static int pmu_sbi_get_ctrinfo(int nctr, int *num_hw_ctrs)
 {
 	struct sbiret ret;
 	int i, num_hw_ctr = 0, num_fw_ctr = 0;
@@ -453,7 +460,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < nctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
@@ -466,6 +473,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 		pmu_ctr_list[i].value = cinfo.value;
 	}
 
+	*num_hw_ctrs = num_hw_ctr;
 	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
 
 	return 0;
@@ -698,7 +706,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 static int pmu_sbi_device_probe(struct platform_device *pdev)
 {
 	struct riscv_pmu *pmu = NULL;
-	int num_counters;
+	int num_counters, num_hw_ctrs = 0;
 	int ret = -ENODEV;
 
 	pr_info("SBI PMU extension is available\n");
@@ -713,7 +721,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters))
+	if (pmu_sbi_get_ctrinfo(num_counters, &num_hw_ctrs))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -723,6 +731,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
 	pmu->num_counters = num_counters;
+	pmu->num_hw_counters = num_hw_ctrs;
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
@@ -733,14 +742,16 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 	if (ret) {
 		cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
-		return ret;
+		goto out_free;
 	}
 
+	rvpmu = pmu;
+
 	return 0;
 
 out_free:
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 46f9b6fe306e..fc47167e000c 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -46,6 +46,7 @@ struct riscv_pmu {
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
 
 	int		num_counters;
+	int		num_hw_counters;
 	u64		(*ctr_read)(struct perf_event *event);
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);
@@ -69,6 +70,9 @@ void riscv_pmu_legacy_skip_init(void);
 static inline void riscv_pmu_legacy_skip_init(void) {};
 #endif
 struct riscv_pmu *riscv_pmu_alloc(void);
+#ifdef CONFIG_RISCV_PMU_SBI
+int riscv_pmu_sbi_get_num_hw_ctrs(void);
+#endif
 
 #endif /* CONFIG_RISCV_PMU */
 
-- 
2.25.1


