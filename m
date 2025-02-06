Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3A4C0219B
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANDSTOn0bZy7yxym2zdJUODCUtJTn5GPK6mgf1g6PEQ=; b=olKzdhpNzJB812
	d/cgcs4IkqLs6Nq5Oec4+PiG1kVvbCG/5hLjHjt3F+E/nTHXWn9pGWLeQSEN1L7DAZIL1l+0Xq/l7
	TtA0Qft03X4C3WEksmT/oLtqqKRXLpdN/0PR/mIXWCGfmPn6GpXhnUtgbPc4ZccQGbSixcfwlT0L6
	vX9HTD8oLCWe1VBl/Js15G8NTkCQlCbgrJyOpxb7C/pLLYw1akhuathUuLLwdVRDt/KHVirbczXXL
	1k9t5H3cOnv6qjYGQwgOEHTtNt2Ri3KIQk+nfw91PxXwCIQgBOb/PXWSyQclmsY1ZTqfLON1gNBgj
	Poi6sO3AUdDcfk6/VXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwVv-00000005crV-2xrt;
	Thu, 06 Feb 2025 07:41:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEd-00000005YF7-09Ac
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9da2a7004so817088a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826618; x=1739431418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YMJZgVY1otqFkvY1S6X1nasUdQkp1/Rdt1qQGVI5D4=;
        b=dqS4W2EVudOY8sLtkD3WyVY9mDf2g9VINAW1iHSHVia92pYKlzrp8W1kg66VqserfT
         BszQPZB4JXa+/ed4LIX/aHd9xOHy74qAyJfPb2Qm771MxtjPvn2jrFxt5XGgSHIFRs6U
         kUCYES69dlHO1B6d15ZumcIrYixW4UqzAwpWtQTqqA3YCr/OBiqpi9fRfnlDeElxMKQB
         hVmSlUd/LFj01zi7FARsw3AdB3jdY7HgYAyUFLh8Ekhgk2oJq0Jn6ebw3cPb+L2KK63C
         JVvK2ZgWFiqIJEwoQqkA+P+ZwgxZ6vlWCFMFMY4dCpjEz91VApsNaYtlKicbxUE/Xj1o
         O3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826618; x=1739431418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YMJZgVY1otqFkvY1S6X1nasUdQkp1/Rdt1qQGVI5D4=;
        b=b9sLtweD/cFfTSv1R0wn9ToAWTl++y+pOcCYBQ6S1nH5teYosUL0+2hYytkodyGVJ4
         ts7abaXDfePa0ne5wUyMN9S8oMIeeCgIvSH8HC5fOL9cp1iVDEyoZhRu0TmDkBhP1eAg
         AF7z0N0OEZjXnezr89KrhlPuSOrb+dmMpSQzuI8Ybw+Eu9rN7GkNv3pFN3yrmLun5IwN
         g+ueZ7bddhkfMT4gyT3/BW+xx0Vj0Jk2asLUrqs6F3OxOnV8hSO8W4T2b0N9CtiC1wDv
         4feOb0lceSoF0LXaqRL7KUIyadzTLCKNHQdUbLWhPLMRY8mdnk+Gc9DRmmZw6CehPzzz
         iWkg==
X-Forwarded-Encrypted: i=1; AJvYcCXVwOlb15a6gQf0VCGpqaI2jebUE5R9s84tHEpjwScAXf0A4RlGSWesHe9Mpkj5ioxIaEnkojQNWnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAXCseXGE/dPSivCaqZ7cACAbqippoHY4aJpQXnxjrqqCHFerd
	ZOHfZbOiCL3Tz1PKAODpztugq3iqIygNlyned/fSohfAx2YgcnZD/42EII0cKOg=
X-Gm-Gg: ASbGncsbf2haHSmZNM4gUMtHctZzEuTNxHcO7C9P17Xa89MNrCyy6U539aEWqZ2u1qh
	LeY9S8DVDRvTj1KyfrFH+q+arywSWlExI4ZZialBgLU/uZwhQbN4Vf/imKFHSb1Vcq94FUuN6Pr
	ugT81KCfX78Z7+gPXE5WKr0RW4nCUNCFS/sk/fz4Qdi+uglT5ZCrxgNPVkL4mr4w+ednIPxN8/N
	S9Elp7BZ0EzO+SkqPKMmDWtDJYN/7KLRBq49CghM77UHq3HcriwL1/FZXOb3TYYg1UG6sByUD+M
	C+RvOXS2T1fzXvtJG0FLhPmtzMYo
X-Google-Smtp-Source: AGHT+IGwieIUw3OD2xuFePKXWdPQZa0PbeVamSKcJqy8fo6Kk++WSJlvSU1k3/yLYbkFJ7iAJww3kA==
X-Received: by 2002:a17:90b:3810:b0:2ee:5691:774e with SMTP id 98e67ed59e1d1-2f9e074fa58mr9546573a91.2.1738826618250;
        Wed, 05 Feb 2025 23:23:38 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:19 -0800
Subject: [PATCH v4 14/21] RISC-V: perf: Implement supervisor counter
 delegation support
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-14-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232339_147135_D11591DA 
X-CRM114-Status: GOOD (  30.38  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

There are few new RISC-V ISA exensions (ssccfg, sscsrind, smcntrpmf) which
allows the hpmcounter/hpmevents to be programmed directly from S-mode. The
implementation detects the ISA extension at runtime and uses them if
available instead of SBI PMU extension. SBI PMU extension will still be
used for firmware counters if the user requests it.

The current linux driver relies on event encoding defined by SBI PMU
specification for standard perf events. However, there are no standard
event encoding available in the ISA. In the future, we may want to
decouple the counter delegation and SBI PMU completely. In that case,
counter delegation supported platforms must rely on the event encoding
defined in the perf json file or in the pmu driver.

For firmware events, it will continue to use the SBI PMU encoding as
one can not support firmware event without SBI PMU.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h   |   1 +
 arch/riscv/include/asm/sbi.h   |   2 +-
 arch/riscv/kvm/vcpu_pmu.c      |   2 +-
 drivers/perf/riscv_pmu_dev.c   | 564 +++++++++++++++++++++++++++++++++--------
 include/linux/perf/riscv_pmu.h |   3 +
 5 files changed, 468 insertions(+), 104 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 42b7f4f7ec0f..a06d5fec6e6d 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -249,6 +249,7 @@
 #endif
 
 #define SISELECT_SSCCFG_BASE		0x40
+#define HPMEVENT_MASK			GENMASK_ULL(63, 56)
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6c82318065cf..1107795cc3cf 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -158,7 +158,7 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
-#define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
+#define RISCV_PMU_SBI_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..0f4ecb6010d6 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -126,7 +126,7 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 		config = kvm_pmu_get_perf_event_cache_config(ecode);
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
-		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
+		config = evt_data & RISCV_PMU_SBI_RAW_EVENT_MASK;
 		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 2eb58b248c88..5112049b491c 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -27,6 +27,8 @@
 #include <asm/cpufeature.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/hwcap.h>
+#include <asm/csr_ind.h>
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE_2(						\
@@ -59,31 +61,67 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+#define RVPMU_SBI_PMU_FORMAT_ATTR	"config:0-47"
+#define RVPMU_CDELEG_PMU_FORMAT_ATTR	"config:0-55"
+
+static ssize_t __maybe_unused rvpmu_format_show(struct device *dev, struct device_attribute *attr,
+						char *buf);
+
+#define RVPMU_ATTR_ENTRY(_name, _func, _config)	(			\
+	&((struct dev_ext_attribute[]) {				\
+		{ __ATTR(_name, 0444, _func, NULL), (void *)_config }	\
+	})[0].attr.attr)
+
+#define RVPMU_FORMAT_ATTR_ENTRY(_name, _config) \
+	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
+
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
+
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
+#define riscv_pmu_sbi_available() \
+		static_branch_likely(&riscv_pmu_sbi_available)
+
 static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
+#define riscv_pmu_cdeleg_available() \
+		static_branch_unlikely(&riscv_pmu_cdeleg_available)
+
 static bool cdeleg_available;
 static bool sbi_available;
 
-static struct attribute *riscv_arch_formats_attr[] = {
-	&format_attr_event.attr,
+static struct attribute *riscv_sbi_pmu_formats_attr[] = {
+	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_SBI_PMU_FORMAT_ATTR),
+	&format_attr_firmware.attr,
+	NULL,
+};
+
+static struct attribute_group riscv_sbi_pmu_format_group = {
+	.name = "format",
+	.attrs = riscv_sbi_pmu_formats_attr,
+};
+
+static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
+	&riscv_sbi_pmu_format_group,
+	NULL,
+};
+
+static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
+	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
 	NULL,
 };
 
-static struct attribute_group riscv_pmu_format_group = {
+static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.name = "format",
-	.attrs = riscv_arch_formats_attr,
+	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
-static const struct attribute_group *riscv_pmu_attr_groups[] = {
-	&riscv_pmu_format_group,
+static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
 
@@ -385,6 +423,14 @@ static void rvpmu_sbi_check_std_events(struct work_struct *work)
 
 static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
 
+static ssize_t rvpmu_format_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct dev_ext_attribute *eattr = container_of(attr,
+				struct dev_ext_attribute, attr);
+	return sysfs_emit(buf, "%s\n", (char *)eattr->var);
+}
+
 static int rvpmu_ctr_get_width(int idx)
 {
 	return pmu_ctr_list[idx].width;
@@ -437,6 +483,38 @@ static uint8_t rvpmu_csr_index(struct perf_event *event)
 	return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
 }
 
+static uint64_t get_deleg_priv_filter_bits(struct perf_event *event)
+{
+	u64 priv_filter_bits = 0;
+	bool guest_events = false;
+
+	if (event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS)
+		guest_events = true;
+	if (event->attr.exclude_kernel)
+		priv_filter_bits |= guest_events ? HPMEVENT_VSINH : HPMEVENT_SINH;
+	if (event->attr.exclude_user)
+		priv_filter_bits |= guest_events ? HPMEVENT_VUINH : HPMEVENT_UINH;
+	if (guest_events && event->attr.exclude_hv)
+		priv_filter_bits |= HPMEVENT_SINH;
+	if (event->attr.exclude_host)
+		priv_filter_bits |= HPMEVENT_UINH | HPMEVENT_SINH;
+	if (event->attr.exclude_guest)
+		priv_filter_bits |= HPMEVENT_VSINH | HPMEVENT_VUINH;
+
+	return priv_filter_bits;
+}
+
+static bool pmu_sbi_is_fw_event(struct perf_event *event)
+{
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+
+	if (type == PERF_TYPE_RAW && ((config >> 63) == 1))
+		return true;
+	else
+		return false;
+}
+
 static unsigned long rvpmu_sbi_get_filter_flags(struct perf_event *event)
 {
 	unsigned long cflags = 0;
@@ -465,7 +543,8 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0, cmask = rvpmu->cmask;
+	u64 cbase = 0;
+	unsigned long ctr_mask = rvpmu->cmask;
 	unsigned long cflags = 0;
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
@@ -478,21 +557,24 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	if ((hwc->flags & PERF_EVENT_FLAG_LEGACY) && (event->attr.type == PERF_TYPE_HARDWARE)) {
 		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
-			cmask = 1;
+			ctr_mask = 1;
 		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
-			cmask = BIT(CSR_INSTRET - CSR_CYCLE);
+			ctr_mask = BIT(CSR_INSTRET - CSR_CYCLE);
 		}
 	}
 
+	if (pmu_sbi_is_fw_event(event) && cdeleg_available)
+		ctr_mask = firmware_cmask;
+
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			cmask, cflags, hwc->event_base, hwc->config,
+			ctr_mask, cflags, hwc->event_base, hwc->config,
 			hwc->config >> 32);
 #else
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
-			cmask, cflags, hwc->event_base, hwc->config, 0);
+			ctr_mask, cflags, hwc->event_base, hwc->config, 0);
 #endif
 	if (ret.error) {
 		pr_debug("Not able to find a counter for event %lx config %llx\n",
@@ -501,7 +583,7 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (!test_bit(idx, &rvpmu->cmask) || !pmu_ctr_list[idx].value)
+	if (!test_bit(idx, &ctr_mask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -551,17 +633,6 @@ static int sbi_pmu_event_find_cache(u64 config)
 	return ret;
 }
 
-static bool pmu_sbi_is_fw_event(struct perf_event *event)
-{
-	u32 type = event->attr.type;
-	u64 config = event->attr.config;
-
-	if ((type == PERF_TYPE_RAW) && ((config >> 63) == 1))
-		return true;
-	else
-		return false;
-}
-
 static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
@@ -593,7 +664,7 @@ static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		 * 10 - SBI firmware events
 		 * 11 - Risc-V platform specific firmware event
 		 */
-		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
+		raw_config_val = config & RISCV_PMU_SBI_RAW_EVENT_MASK;
 		switch (config >> 62) {
 		case 0:
 			ret = RISCV_PMU_RAW_EVENT_IDX;
@@ -622,6 +693,84 @@ static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	return ret;
 }
 
+static int cdeleg_pmu_event_find_cache(u64 config, u64 *eventid, uint32_t *counter_mask)
+{
+	unsigned int cache_type, cache_op, cache_result;
+
+	if (!current_pmu_cache_event_map)
+		return -ENOENT;
+
+	cache_type = (config >>  0) & 0xff;
+	if (cache_type >= PERF_COUNT_HW_CACHE_MAX)
+		return -EINVAL;
+
+	cache_op = (config >>  8) & 0xff;
+	if (cache_op >= PERF_COUNT_HW_CACHE_OP_MAX)
+		return -EINVAL;
+
+	cache_result = (config >> 16) & 0xff;
+	if (cache_result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
+		return -EINVAL;
+
+	if (eventid)
+		*eventid = current_pmu_cache_event_map[cache_type][cache_op]
+						      [cache_result].event_id;
+	if (counter_mask)
+		*counter_mask = current_pmu_cache_event_map[cache_type][cache_op]
+							   [cache_result].counter_mask;
+
+	return 0;
+}
+
+static int rvpmu_cdeleg_event_map(struct perf_event *event, u64 *econfig)
+{
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+	int ret = 0;
+
+	/*
+	 * There are two ways standard perf events can be mapped to platform specific
+	 * encoding.
+	 * 1. The vendor may specify the encodings in the driver.
+	 * 2. The Perf tool for RISC-V may remap the standard perf event to platform
+	 * specific encoding.
+	 *
+	 * As RISC-V ISA doesn't define any standard event encoding. Thus, perf tool allows
+	 * vendor to define it via json file. The encoding defined in the json will override
+	 * the perf legacy encoding. However, some user may want to run performance
+	 * monitoring without perf tool as well. That's why, vendors may specify the event
+	 * encoding in the driver as well if they want to support that use case too.
+	 * If an encoding is defined in the json, it will be encoded as a raw event.
+	 */
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		if (!current_pmu_hw_event_map)
+			return -ENOENT;
+
+		*econfig = current_pmu_hw_event_map[config].event_id;
+		if (*econfig == HW_OP_UNSUPPORTED)
+			ret = -ENOENT;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = cdeleg_pmu_event_find_cache(config, econfig, NULL);
+		if (*econfig == HW_OP_UNSUPPORTED)
+			ret = -ENOENT;
+		break;
+	case PERF_TYPE_RAW:
+		*econfig = config & RISCV_PMU_DELEG_RAW_EVENT_MASK;
+		break;
+	default:
+		ret = -ENOENT;
+		break;
+	}
+
+	/* event_base is not used for counter delegation */
+	return ret;
+}
+
 static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
 {
 	int cpu;
@@ -705,7 +854,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
 	return 0;
 }
 
-static u64 rvpmu_sbi_ctr_read(struct perf_event *event)
+static u64 rvpmu_ctr_read(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
@@ -782,10 +931,6 @@ static void rvpmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STARTED))
 		pr_err("Starting counter idx %d failed with error %d\n",
 			hwc->idx, sbi_err_map_linux_errno(ret.error));
-
-	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
-	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		rvpmu_set_scounteren((void *)event);
 }
 
 static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -796,10 +941,6 @@ static void rvpmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
 
-	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
-	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		rvpmu_reset_scounteren((void *)event);
-
 	if (sbi_pmu_snapshot_available())
 		flag |= SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
 
@@ -835,12 +976,6 @@ static int rvpmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int rvpmu_deleg_find_ctrs(void)
-{
-	/* TODO */
-	return -1;
-}
-
 static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)
 {
 	struct sbiret ret;
@@ -928,53 +1063,75 @@ static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
 	}
 }
 
-/*
- * This function starts all the used counters in two step approach.
- * Any counter that did not overflow can be start in a single step
- * while the overflowed counters need to be started with updated initialization
- * value.
- */
-static inline void rvpmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
-						u64 ctr_ovf_mask)
+static void rvpmu_deleg_ctr_start_mask(unsigned long mask)
 {
-	int idx = 0, i;
-	struct perf_event *event;
-	unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
-	unsigned long ctr_start_mask = 0;
-	uint64_t max_period;
-	struct hw_perf_event *hwc;
-	u64 init_val = 0;
+	unsigned long scountinhibit_val = 0;
 
-	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
-		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
-		/* Start all the counters that did not overflow in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
-			0, 0, 0, 0);
-	}
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val &= ~mask;
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
+static void rvpmu_deleg_ctr_enable_irq(struct perf_event *event)
+{
+	unsigned long hpmevent_curr;
+	unsigned long of_mask;
+	struct hw_perf_event *hwc = &event->hw;
+	int counter_idx = hwc->idx;
+	unsigned long sip_val = csr_read(CSR_SIP);
+
+	if (!is_sampling_event(event) || (sip_val & SIP_LCOFIP))
+		return;
 
-	/* Reinitialize and start all the counter that overflowed */
-	while (ctr_ovf_mask) {
-		if (ctr_ovf_mask & 0x01) {
-			event = cpu_hw_evt->events[idx];
-			hwc = &event->hw;
-			max_period = riscv_pmu_ctr_get_width_mask(event);
-			init_val = local64_read(&hwc->prev_count) & max_period;
 #if defined(CONFIG_32BIT)
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, init_val >> 32, 0);
+	hpmevent_curr = csr_ind_read(CSR_SIREG5, SISELECT_SSCCFG_BASE, counter_idx);
+	of_mask = (u32)~HPMEVENTH_OF;
 #else
-			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
-				  flag, init_val, 0, 0);
+	hpmevent_curr = csr_ind_read(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx);
+	of_mask = ~HPMEVENT_OF;
+#endif
+
+	hpmevent_curr &= of_mask;
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG4, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_curr);
+#else
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_curr);
 #endif
-			perf_event_update_userpage(event);
-		}
-		ctr_ovf_mask = ctr_ovf_mask >> 1;
-		idx++;
-	}
 }
 
-static inline void rvpmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
-						     u64 ctr_ovf_mask)
+static void rvpmu_deleg_ctr_start(struct perf_event *event, u64 ival)
+{
+	unsigned long scountinhibit_val = 0;
+	struct hw_perf_event *hwc = &event->hw;
+
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG, SISELECT_SSCCFG_BASE, hwc->idx, ival & 0xFFFFFFFF);
+	csr_ind_write(CSR_SIREG4, SISELECT_SSCCFG_BASE, hwc->idx, ival >> BITS_PER_LONG);
+#else
+	csr_ind_write(CSR_SIREG, SISELECT_SSCCFG_BASE, hwc->idx, ival);
+#endif
+
+	rvpmu_deleg_ctr_enable_irq(event);
+
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val &= ~(1 << hwc->idx);
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
+static void rvpmu_deleg_ctr_stop_mask(unsigned long mask)
+{
+	unsigned long scountinhibit_val = 0;
+
+	scountinhibit_val = csr_read(CSR_SCOUNTINHIBIT);
+	scountinhibit_val |= mask;
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_val);
+}
+
+static void rvpmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
+					      u64 ctr_ovf_mask)
 {
 	int i, idx = 0;
 	struct perf_event *event;
@@ -1008,15 +1165,53 @@ static inline void rvpmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_h
 	}
 }
 
-static void rvpmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
-					  u64 ctr_ovf_mask)
+/*
+ * This function starts all the used counters in two step approach.
+ * Any counter that did not overflow can be start in a single step
+ * while the overflowed counters need to be started with updated initialization
+ * value.
+ */
+static void rvpmu_start_overflow_mask(struct riscv_pmu *pmu, u64 ctr_ovf_mask)
 {
+	int idx = 0, i;
+	struct perf_event *event;
+	unsigned long ctr_start_mask = 0;
+	u64 max_period, init_val = 0;
+	struct hw_perf_event *hwc;
 	struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
 
 	if (sbi_pmu_snapshot_available())
-		rvpmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
-	else
-		rvpmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
+		return rvpmu_sbi_start_ovf_ctrs_snapshot(cpu_hw_evt, ctr_ovf_mask);
+
+	/* Start all the counters that did not overflow */
+	if (riscv_pmu_cdeleg_available()) {
+		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
+		rvpmu_deleg_ctr_start_mask(ctr_start_mask);
+	} else {
+		for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+			ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
+			/* Start all the counters that did not overflow in a single shot */
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
+				  ctr_start_mask, 0, 0, 0, 0);
+		}
+	}
+
+	/* Reinitialize and start all the counter that overflowed */
+	while (ctr_ovf_mask) {
+		if (ctr_ovf_mask & 0x01) {
+			event = cpu_hw_evt->events[idx];
+			hwc = &event->hw;
+			max_period = riscv_pmu_ctr_get_width_mask(event);
+			init_val = local64_read(&hwc->prev_count) & max_period;
+			if (riscv_pmu_cdeleg_available())
+				rvpmu_deleg_ctr_start(event, init_val);
+			else
+				rvpmu_sbi_ctr_start(event, init_val);
+			perf_event_update_userpage(event);
+		}
+		ctr_ovf_mask = ctr_ovf_mask >> 1;
+		idx++;
+	}
 }
 
 static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
@@ -1051,7 +1246,10 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
 	}
 
 	pmu = to_riscv_pmu(event->pmu);
-	rvpmu_sbi_stop_hw_ctrs(pmu);
+	if (riscv_pmu_cdeleg_available())
+		rvpmu_deleg_ctr_stop_mask(cpu_hw_evt->used_hw_ctrs[0]);
+	else
+		rvpmu_sbi_stop_hw_ctrs(pmu);
 
 	/* Overflow status register should only be read after counter are stopped */
 	if (sbi_pmu_snapshot_available())
@@ -1120,22 +1318,174 @@ static irqreturn_t rvpmu_ovf_handler(int irq, void *dev)
 		hw_evt->state = 0;
 	}
 
-	rvpmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+	rvpmu_start_overflow_mask(pmu, overflowed_ctrs);
 	perf_sample_event_took(sched_clock() - start_clock);
 
 	return IRQ_HANDLED;
 }
 
+static int get_deleg_hw_ctr_width(int counter_offset)
+{
+	unsigned long hpm_warl;
+	int num_bits;
+
+	if (counter_offset < 3 || counter_offset > 31)
+		return 0;
+
+	hpm_warl = csr_ind_warl(CSR_SIREG, SISELECT_SSCCFG_BASE, counter_offset, -1);
+	num_bits = __fls(hpm_warl);
+
+#if defined(CONFIG_32BIT)
+	hpm_warl = csr_ind_warl(CSR_SIREG4, SISELECT_SSCCFG_BASE, counter_offset, -1);
+	num_bits += __fls(hpm_warl);
+#endif
+	return num_bits;
+}
+
+static int rvpmu_deleg_find_ctrs(void)
+{
+	int i, num_hw_ctr = 0;
+	union sbi_pmu_ctr_info cinfo;
+	unsigned long scountinhibit_old = 0;
+
+	/* Do a WARL write/read to detect which hpmcounters have been delegated */
+	scountinhibit_old = csr_read(CSR_SCOUNTINHIBIT);
+	csr_write(CSR_SCOUNTINHIBIT, -1);
+	cmask = csr_read(CSR_SCOUNTINHIBIT);
+
+	csr_write(CSR_SCOUNTINHIBIT, scountinhibit_old);
+
+	for_each_set_bit(i, &cmask, RISCV_MAX_HW_COUNTERS) {
+		if (unlikely(i == 1))
+			continue; /* This should never happen as TM is read only */
+		cinfo.value = 0;
+		cinfo.type = SBI_PMU_CTR_TYPE_HW;
+		/*
+		 * If counter delegation is enabled, the csr stored to the cinfo will
+		 * be a virtual counter that the delegation attempts to read.
+		 */
+		cinfo.csr = CSR_CYCLE + i;
+		if (i == 0 || i == 2)
+			cinfo.width = 63;
+		else
+			cinfo.width = get_deleg_hw_ctr_width(i);
+
+		num_hw_ctr++;
+		pmu_ctr_list[i].value = cinfo.value;
+	}
+
+	return num_hw_ctr;
+}
+
+static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
+{
+	return -EINVAL;
+}
+
+static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
+{
+	unsigned long hw_ctr_mask = 0;
+
+	/*
+	 * TODO: Treat every hpmcounter can monitor every event for now.
+	 * The event to counter mapping should come from the json file.
+	 * The mapping should also tell if sampling is supported or not.
+	 */
+
+	/* Select only hpmcounters */
+	hw_ctr_mask = cmask & (~0x7);
+	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
+	return __ffs(hw_ctr_mask);
+}
+
+static void update_deleg_hpmevent(int counter_idx, uint64_t event_value, uint64_t filter_bits)
+{
+	u64 hpmevent_value = 0;
+
+	/* OF bit should be enable during the start if sampling is requested */
+	hpmevent_value = (event_value & ~HPMEVENT_MASK) | filter_bits | HPMEVENT_OF;
+#if defined(CONFIG_32BIT)
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_value & 0xFFFFFFFF);
+	if (riscv_isa_extension_available(NULL, SSCOFPMF))
+		csr_ind_write(CSR_SIREG5, SISELECT_SSCCFG_BASE, counter_idx,
+			      hpmevent_value >> BITS_PER_LONG);
+#else
+	csr_ind_write(CSR_SIREG2, SISELECT_SSCCFG_BASE, counter_idx, hpmevent_value);
+#endif
+}
+
+static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
+	struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
+	unsigned long hw_ctr_max_id;
+	u64 priv_filter;
+	int idx;
+
+	/*
+	 * TODO: We should not rely on SBI Perf encoding to check if the event
+	 * is a fixed one or not.
+	 */
+	if (!is_sampling_event(event)) {
+		idx = get_deleg_fixed_hw_idx(cpuc, event);
+		if (idx == 0 || idx == 2) {
+			/* Priv mode filter bits are only available if smcntrpmf is present */
+			if (riscv_isa_extension_available(NULL, SMCNTRPMF))
+				goto found_idx;
+			else
+				goto skip_update;
+		}
+	}
+
+	hw_ctr_max_id = __fls(cmask);
+	idx = get_deleg_next_hpm_hw_idx(cpuc, event);
+	if (idx < 3 || idx > hw_ctr_max_id)
+		goto out_err;
+found_idx:
+	priv_filter = get_deleg_priv_filter_bits(event);
+	update_deleg_hpmevent(idx, hwc->config, priv_filter);
+skip_update:
+	if (!test_and_set_bit(idx, cpuc->used_hw_ctrs))
+		return idx;
+out_err:
+	return -ENOENT;
+}
+
 static void rvpmu_ctr_start(struct perf_event *event, u64 ival)
 {
-	rvpmu_sbi_ctr_start(event, ival);
-	/* TODO: Counter delegation implementation */
+	struct hw_perf_event *hwc = &event->hw;
+
+	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
+		rvpmu_deleg_ctr_start(event, ival);
+	else
+		rvpmu_sbi_ctr_start(event, ival);
+
+	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
+	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		rvpmu_set_scounteren((void *)event);
 }
 
 static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
 {
-	rvpmu_sbi_ctr_stop(event, flag);
-	/* TODO: Counter delegation implementation */
+	struct hw_perf_event *hwc = &event->hw;
+
+	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
+	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
+		rvpmu_reset_scounteren((void *)event);
+
+	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event)) {
+		/*
+		 * The counter is already stopped. No need to stop again. Counter
+		 * mapping will be reset in clear_idx function.
+		 */
+		if (flag != RISCV_PMU_STOP_FLAG_RESET)
+			rvpmu_deleg_ctr_stop_mask((1 << hwc->idx));
+		else
+			update_deleg_hpmevent(hwc->idx, 0, 0);
+	} else {
+		rvpmu_sbi_ctr_stop(event, flag);
+	}
 }
 
 static int rvpmu_find_ctrs(void)
@@ -1169,20 +1519,18 @@ static int rvpmu_find_ctrs(void)
 
 static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
 {
-	return rvpmu_sbi_event_map(event, econfig);
-	/* TODO: Counter delegation implementation */
+	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
+		return rvpmu_cdeleg_event_map(event, econfig);
+	else
+		return rvpmu_sbi_event_map(event, econfig);
 }
 
 static int rvpmu_ctr_get_idx(struct perf_event *event)
 {
-	return rvpmu_sbi_ctr_get_idx(event);
-	/* TODO: Counter delegation implementation */
-}
-
-static u64 rvpmu_ctr_read(struct perf_event *event)
-{
-	return rvpmu_sbi_ctr_read(event);
-	/* TODO: Counter delegation implementation */
+	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
+		return rvpmu_deleg_ctr_get_idx(event);
+	else
+		return rvpmu_sbi_ctr_get_idx(event);
 }
 
 static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
@@ -1200,7 +1548,16 @@ static int rvpmu_starting_cpu(unsigned int cpu, struct hlist_node *node)
 		csr_write(CSR_SCOUNTEREN, 0x2);
 
 	/* Stop all the counters so that they can be enabled from perf */
-	rvpmu_sbi_stop_all(pmu);
+	if (riscv_pmu_cdeleg_available()) {
+		rvpmu_deleg_ctr_stop_mask(cmask);
+		if (riscv_pmu_sbi_available()) {
+			/* Stop the firmware counters as well */
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, firmware_cmask,
+				  0, 0, 0, 0);
+		}
+	} else {
+		rvpmu_sbi_stop_all(pmu);
+	}
 
 	if (riscv_pmu_use_irq) {
 		cpu_hw_evt->irq = riscv_pmu_irq;
@@ -1499,8 +1856,11 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
 	}
 
-	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
+	if (cdeleg_available)
+		pmu->pmu.attr_groups = riscv_cdeleg_pmu_attr_groups;
+	else
+		pmu->pmu.attr_groups = riscv_sbi_pmu_attr_groups;
 	pmu->cmask = cmask;
 	pmu->ctr_start = rvpmu_ctr_start;
 	pmu->ctr_stop = rvpmu_ctr_stop;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index a3e1fdd5084a..9e2758c32e8b 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -20,6 +20,7 @@
  */
 
 #define RISCV_MAX_COUNTERS	64
+#define RISCV_MAX_HW_COUNTERS	32
 #define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
 #define RISCV_PMU_PDEV_NAME	"riscv-pmu"
 #define RISCV_PMU_LEGACY_PDEV_NAME	"riscv-pmu-legacy"
@@ -28,6 +29,8 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+#define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+
 #define HW_OP_UNSUPPORTED		0xFFFF
 #define CACHE_OP_UNSUPPORTED		0xFFFF
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
