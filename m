From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 18 Jul 2022 10:01:58 -0700
Subject: [RFC  2/9] RISC-V: Define a helper function to return counter width
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
Message-ID: <20220718170205.2972215-3-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The virtual hardware counters need to have the same width as the
logical hardware counters for simplicity.  However, there shouldn't
be mapping between virtual hardware counters and logical hardware
counters. As we don't support hetergeneous harts or counters with
different width as of now, the implementation relies on the counter
width of the first available programmable counter.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 25 +++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 1723af68ffa1..5d0eef3ef136 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -250,6 +250,31 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+/*
+ * Returns the counter width of a programmable counter
+ * As we don't support heterneous CPUs yet, it is okay to just
+ * return the counter width of the first programmable counter.
+ */
+int riscv_pmu_sbi_hpmc_width(void)
+{
+	int i;
+	union sbi_pmu_ctr_info *info;
+
+	if (!rvpmu)
+		return -EINVAL;
+
+	for (i = 0; i < rvpmu->num_counters; i++) {
+		info = &pmu_ctr_list[i];
+		if (!info)
+			continue;
+		if (info->type == SBI_PMU_CTR_TYPE_HW)
+			return info->width;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(riscv_pmu_sbi_hpmc_width);
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index fc47167e000c..6fee211c27b5 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -72,6 +72,7 @@ static inline void riscv_pmu_legacy_skip_init(void) {};
 struct riscv_pmu *riscv_pmu_alloc(void);
 #ifdef CONFIG_RISCV_PMU_SBI
 int riscv_pmu_sbi_get_num_hw_ctrs(void);
+int riscv_pmu_sbi_hpmc_width(void);
 #endif
 
 #endif /* CONFIG_RISCV_PMU */
-- 
2.25.1


