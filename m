From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 Dec 2022 09:00:45 -0800
Subject: [PATCH v2 10/11] RISC-V: KVM: Implement perf support without sampling
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
Message-ID: <20221215170046.2010255-11-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
the virtualization enviornment as well. KVM implementation
relies on SBI PMU extension for most the most part while trapping
& emulating the CSRs read for counter access.

This patch doesn't have the event sampling support yet.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 358 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 342 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 53c4163..21c1f0f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -12,10 +12,163 @@
 #include <linux/perf/riscv_pmu.h>
 #include <asm/csr.h>
 #include <asm/kvm_vcpu_sbi.h>
+#include <asm/bitops.h>
 #include <asm/kvm_vcpu_pmu.h>
 #include <linux/kvm_host.h>
 
 #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
+#define get_event_type(x) ((x & SBI_PMU_EVENT_IDX_TYPE_MASK) >> 16)
+#define get_event_code(x) (x & SBI_PMU_EVENT_IDX_CODE_MASK)
+
+static inline u64 pmu_get_sample_period(struct kvm_pmc *pmc)
+{
+	u64 counter_val_mask = GENMASK(pmc->cinfo.width, 0);
+	u64 sample_period;
+
+	if (!pmc->counter_val)
+		sample_period = counter_val_mask;
+	else
+		sample_period = (-pmc->counter_val) & counter_val_mask;
+
+	return sample_period;
+}
+
+static u32 pmu_get_perf_event_type(unsigned long eidx)
+{
+	enum sbi_pmu_event_type etype = get_event_type(eidx);
+	u32 type;
+
+	if (etype == SBI_PMU_EVENT_TYPE_HW)
+		type = PERF_TYPE_HARDWARE;
+	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
+		type = PERF_TYPE_HW_CACHE;
+	else if (etype == SBI_PMU_EVENT_TYPE_RAW || etype == SBI_PMU_EVENT_TYPE_FW)
+		type = PERF_TYPE_RAW;
+	else
+		type = PERF_TYPE_MAX;
+
+	return type;
+}
+
+static inline bool pmu_is_fw_event(unsigned long eidx)
+{
+
+	return get_event_type(eidx) == SBI_PMU_EVENT_TYPE_FW;
+}
+
+static void pmu_release_perf_event(struct kvm_pmc *pmc)
+{
+	if (pmc->perf_event) {
+		perf_event_disable(pmc->perf_event);
+		perf_event_release_kernel(pmc->perf_event);
+		pmc->perf_event = NULL;
+	}
+}
+
+static u64 pmu_get_perf_event_hw_config(u32 sbi_event_code)
+{
+	/* SBI PMU HW event code is offset by 1 from perf hw event codes */
+	return (u64)sbi_event_code - 1;
+}
+
+static u64 pmu_get_perf_event_cache_config(u32 sbi_event_code)
+{
+	u64 config = U64_MAX;
+	unsigned int cache_type, cache_op, cache_result;
+
+	/* All the cache event masks lie within 0xFF. No separate masking is necesssary */
+	cache_type = (sbi_event_code & SBI_PMU_EVENT_CACHE_ID_CODE_MASK) >> 3;
+	cache_op = (sbi_event_code & SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK) >> 1;
+	cache_result = sbi_event_code & SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK;
+
+	if (cache_type >= PERF_COUNT_HW_CACHE_MAX ||
+	    cache_op >= PERF_COUNT_HW_CACHE_OP_MAX ||
+	    cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
+		return config;
+
+	config = cache_type | (cache_op << 8) | (cache_result << 16);
+
+	return config;
+}
+
+static u64 pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
+{
+	enum sbi_pmu_event_type etype = get_event_type(eidx);
+	u32 ecode = get_event_code(eidx);
+	u64 config = U64_MAX;
+
+	if (etype == SBI_PMU_EVENT_TYPE_HW)
+		config = pmu_get_perf_event_hw_config(ecode);
+	else if (etype == SBI_PMU_EVENT_TYPE_CACHE)
+		config = pmu_get_perf_event_cache_config(ecode);
+	else if (etype == SBI_PMU_EVENT_TYPE_RAW)
+		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
+	else if ((etype == SBI_PMU_EVENT_TYPE_FW) && (ecode < SBI_PMU_FW_MAX))
+		config = (1ULL << 63) | ecode;
+
+	return config;
+}
+
+static int pmu_get_fixed_pmc_index(unsigned long eidx)
+{
+	u32 etype = pmu_get_perf_event_type(eidx);
+	u32 ecode = get_event_code(eidx);
+	int ctr_idx;
+
+	if (etype != SBI_PMU_EVENT_TYPE_HW)
+		return -EINVAL;
+
+	if (ecode == SBI_PMU_HW_CPU_CYCLES)
+		ctr_idx = 0;
+	else if (ecode == SBI_PMU_HW_INSTRUCTIONS)
+		ctr_idx = 2;
+	else
+		return -EINVAL;
+
+	return ctr_idx;
+}
+
+static int pmu_get_programmable_pmc_index(struct kvm_pmu *kvpmu, unsigned long eidx,
+					  unsigned long cbase, unsigned long cmask)
+{
+	int ctr_idx = -1;
+	int i, pmc_idx;
+	int min, max;
+
+	if (pmu_is_fw_event(eidx)) {
+		/* Firmware counters are mapped 1:1 starting from num_hw_ctrs for simplicity */
+		min = kvpmu->num_hw_ctrs;
+		max = min + kvpmu->num_fw_ctrs;
+	} else {
+		/* First 3 counters are reserved for fixed counters */
+		min = 3;
+		max = kvpmu->num_hw_ctrs;
+	}
+
+	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
+		pmc_idx = i + cbase;
+		if ((pmc_idx >= min && pmc_idx < max) &&
+		    !test_bit(pmc_idx, kvpmu->pmc_in_use)) {
+			ctr_idx = pmc_idx;
+			break;
+		}
+	}
+
+	return ctr_idx;
+}
+
+static int pmu_get_pmc_index(struct kvm_pmu *pmu, unsigned long eidx,
+			     unsigned long cbase, unsigned long cmask)
+{
+	int ret;
+
+	/* Fixed counters need to be have fixed mapping as they have different width */
+	ret = pmu_get_fixed_pmc_index(eidx);
+	if (ret >= 0)
+		return ret;
+
+	return pmu_get_programmable_pmc_index(pmu, eidx, cbase, cmask);
+}
 
 static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			unsigned long *out_val)
@@ -82,7 +235,41 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				 unsigned long ctr_mask, unsigned long flag, uint64_t ival,
 				 struct kvm_vcpu_sbi_ext_data *edata)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index, sbiret = 0;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if (ctr_base + __fls(ctr_mask) >= num_ctrs) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	/* Start the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
+			pmc->counter_val = ival;
+		if (pmc->perf_event) {
+			if (unlikely(pmc->started)) {
+				sbiret = SBI_ERR_ALREADY_STARTED;
+				continue;
+			}
+			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
+			perf_event_enable(pmc->perf_event);
+			pmc->started = true;
+		} else {
+			kvm_debug("Can not start counter due to invalid confiugartion\n");
+			sbiret = SBI_ERR_INVALID_PARAM;
+		}
+	}
+
+out:
+	edata->err_val = sbiret;
+
 	return 0;
 }
 
@@ -90,16 +277,142 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				unsigned long ctr_mask, unsigned long flag,
 				struct kvm_vcpu_sbi_ext_data *edata)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	int i, num_ctrs, pmc_index, sbiret = 0;
+	u64 enabled, running;
+	struct kvm_pmc *pmc;
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if ((ctr_base + __fls(ctr_mask)) >= num_ctrs) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	/* Stop the counters that have been configured and requested by the guest */
+	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+		pmc_index = i + ctr_base;
+		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
+			continue;
+		pmc = &kvpmu->pmc[pmc_index];
+		if (pmc->perf_event) {
+			if (pmc->started) {
+				/* Stop counting the counter */
+				perf_event_disable(pmc->perf_event);
+				pmc->started = false;
+			} else
+				sbiret = SBI_ERR_ALREADY_STOPPED;
+
+			if (flag & SBI_PMU_STOP_FLAG_RESET) {
+				/* Relase the counter if this is a reset request */
+				pmc->counter_val += perf_event_read_value(pmc->perf_event,
+									  &enabled, &running);
+				pmu_release_perf_event(pmc);
+				clear_bit(pmc_index, kvpmu->pmc_in_use);
+			}
+		} else {
+			kvm_debug("Can not stop counter due to invalid confiugartion\n");
+			sbiret = SBI_ERR_INVALID_PARAM;
+		}
+	}
+
+out:
+	edata->err_val = sbiret;
+
 	return 0;
 }
 
 int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				     unsigned long ctr_mask, unsigned long flag,
-				     unsigned long eidx, uint64_t edata,
-				     struct kvm_vcpu_sbi_ext_data *extdata)
+				     unsigned long eidx, uint64_t evt_data,
+				     struct kvm_vcpu_sbi_ext_data *ext_data)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct perf_event *event;
+	struct perf_event_attr attr;
+	int num_ctrs, ctr_idx;
+	u32 etype = pmu_get_perf_event_type(eidx);
+	u64 config;
+	struct kvm_pmc *pmc;
+	int sbiret = 0;
+
+
+	num_ctrs = kvpmu->num_fw_ctrs + kvpmu->num_hw_ctrs;
+	if (etype == PERF_TYPE_MAX || (ctr_base + __fls(ctr_mask) >= num_ctrs)) {
+		sbiret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	if (pmu_is_fw_event(eidx)) {
+		sbiret = SBI_ERR_NOT_SUPPORTED;
+		goto out;
+	}
+
+	/*
+	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
+	 * for this event. Just do a sanity check if it already marked used.
+	 */
+	if (flag & SBI_PMU_CFG_FLAG_SKIP_MATCH) {
+		if (!test_bit(ctr_base, kvpmu->pmc_in_use)) {
+			sbiret = SBI_ERR_FAILURE;
+			goto out;
+		}
+		ctr_idx = ctr_base;
+		goto match_done;
+	}
+
+	ctr_idx = pmu_get_pmc_index(kvpmu, eidx, ctr_base, ctr_mask);
+	if (ctr_idx < 0) {
+		sbiret = SBI_ERR_NOT_SUPPORTED;
+		goto out;
+	}
+
+match_done:
+	pmc = &kvpmu->pmc[ctr_idx];
+	pmu_release_perf_event(pmc);
+	pmc->idx = ctr_idx;
+
+	config = pmu_get_perf_event_config(eidx, evt_data);
+	memset(&attr, 0, sizeof(struct perf_event_attr));
+	attr.type = etype;
+	attr.size = sizeof(attr);
+	attr.pinned = true;
+
+	/*
+	 * It should never reach here if the platform doesn't support sscofpmf extensio
+	 * as mode filtering won't work without it.
+	 */
+	attr.exclude_host = true;
+	attr.exclude_hv = true;
+	attr.exclude_user = !!(flag & SBI_PMU_CFG_FLAG_SET_UINH);
+	attr.exclude_kernel = !!(flag & SBI_PMU_CFG_FLAG_SET_SINH);
+	attr.config = config;
+	attr.config1 = RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS;
+	if (flag & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
+		//TODO: Do we really want to clear the value in hardware counter
+		pmc->counter_val = 0;
+	}
+
+	/*
+	 * Set the default sample_period for now. The guest specified value
+	 * will be updated in the start call.
+	 */
+	attr.sample_period = pmu_get_sample_period(pmc);
+
+	event = perf_event_create_kernel_counter(&attr, -1, current, NULL, pmc);
+	if (IS_ERR(event)) {
+		pr_err("kvm pmu event creation failed event %pe for eidx %lx\n", event, eidx);
+		return -EOPNOTSUPP;
+	}
+
+	set_bit(ctr_idx, kvpmu->pmc_in_use);
+	pmc->perf_event = event;
+	if (flag & SBI_PMU_CFG_FLAG_AUTO_START)
+		perf_event_enable(pmc->perf_event);
+
+	ext_data->out_val = ctr_idx;
+out:
+	ext_data->err_val = sbiret;
+
 	return 0;
 }
 
@@ -119,6 +432,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 {
 	int i = 0, num_fw_ctrs, ret, num_hw_ctrs = 0, hpm_width = 0;
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
 
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
 	if (ret < 0)
@@ -134,6 +448,7 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	else
 		num_fw_ctrs = RISCV_KVM_MAX_FW_CTRS;
 
+	bitmap_zero(kvpmu->pmc_in_use, RISCV_MAX_COUNTERS);
 	kvpmu->num_hw_ctrs = num_hw_ctrs;
 	kvpmu->num_fw_ctrs = num_fw_ctrs;
 	/*
@@ -146,24 +461,26 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 		/* TIME CSR shouldn't be read from perf interface */
 		if (i == 1)
 			continue;
-		kvpmu->pmc[i].idx = i;
+		pmc = &kvpmu->pmc[i];
+		pmc->idx = i;
+		pmc->counter_val = 0;
 		if (i < kvpmu->num_hw_ctrs) {
 			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_HW;
 			if (i < 3)
 				/* CY, IR counters */
-				kvpmu->pmc[i].cinfo.width = 63;
+				pmc->cinfo.width = 63;
 			else
-				kvpmu->pmc[i].cinfo.width = hpm_width;
+				pmc->cinfo.width = hpm_width;
 			/*
 			 * The CSR number doesn't have any relation with the logical
 			 * hardware counters. The CSR numbers are encoded sequentially
 			 * to avoid maintaining a map between the virtual counter
 			 * and CSR number.
 			 */
-			kvpmu->pmc[i].cinfo.csr = CSR_CYCLE + i;
+			pmc->cinfo.csr = CSR_CYCLE + i;
 		} else {
-			kvpmu->pmc[i].cinfo.type = SBI_PMU_CTR_TYPE_FW;
-			kvpmu->pmc[i].cinfo.width = BITS_PER_LONG - 1;
+			pmc->cinfo.type = SBI_PMU_CTR_TYPE_FW;
+			pmc->cinfo.width = BITS_PER_LONG - 1;
 		}
 	}
 
@@ -172,13 +489,22 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	int i;
+
+	if (!kvpmu)
+		return;
+
+	for_each_set_bit(i, kvpmu->pmc_in_use, RISCV_MAX_COUNTERS) {
+		pmc = &kvpmu->pmc[i];
+		pmu_release_perf_event(pmc);
+	}
 }
 
-void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	kvm_riscv_vcpu_pmu_deinit(vcpu);
 }
-
-- 
2.25.1


