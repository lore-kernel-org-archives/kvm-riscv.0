Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC56DC02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDsrIFwvsYhy0abDv0hCZ7xylQ+rjbWPW4fpF+MB394=; b=fNOfWpb2e+44fO
	1270hnyHNJ8h20Uj2E1iWTuDNAGNUt1WXS8LKhn3hMu4idNLz3fDjrcvW5B1oenZw+iPLszEco73q
	QP03FtRCQ/E8tUFT8OE5SA5i0+ZFfU5eINokXTrat1nxfjt2r3ml/QTFn4/fzkHrB7709jPx0ctGO
	A7/R3hxo934x0VZ54AVUHE5CpQtVL4i/mcaCgadq2E6tNgpcsFV07CzKTx0GQEX2s4qNUrWXU+E4v
	+7qIf3MGyJ+PcnKxtitJsjOI6k90Lkan1AqslfPNeqYw4Y3i19FkmsqoV3wLvXdi90Ai1jrKCsvHr
	i73+4mVaxuUJq04tgsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxWe-00000005k8K-0hVN;
	Thu, 06 Feb 2025 08:46:20 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEg-00000005YI1-0arj
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f9e415fa42so968454a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826621; x=1739431421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I88Es5nW96kSoOcv6Dbr94uSnbNRzJurf3m4q8mKZlI=;
        b=a1aduA+zQqFCWxcAUl/VsUEjZf801HcGxqpYvFlvv5kBN0aYTybOLh/mZ2tRJEk+jT
         b0buqoZvFwFsKfnae4FAz+qac71xgx+I/cpWC1r+RoDOsKlK6sJ+EK2Fn1dJvrMMBcXk
         pZY17kw8Gd8juCYJtGeSaufL6vpzLr1DvzT+PRXLxlnWVsgPpXh83BwoCeMroqtAOGZq
         msQogjCzpLv0aYlAFNUVYFLJtNH+2PCQm7Ppf0rqLR4ia1wTkoqGYzmXhDbl4/DBA7jC
         lqyIsf3BOguAXeyleOTcG5OInISY4Yu+AhbPofss72hJmVqgWX+8DjRu/X85R5SzaNPk
         CJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826621; x=1739431421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I88Es5nW96kSoOcv6Dbr94uSnbNRzJurf3m4q8mKZlI=;
        b=v+8xpea2T5bIvNHJgQzq49Ad1Sk8jikXY5I44pWLR8DGGOLlXXUXl712Vu4KSJZ9hs
         eAP+mAr5IwmTSVIv5+Yrpu0H3Y/YArbyrKA6mVp6MHjhop6VbI6jcHT3nF9SS93LJYbP
         T5lm93HMQZ9iLvMmUfLsi+MoNU7n5mZt0+ad7C1ze4sa9qriMLzHFYsdncXLRrr9bDMv
         MC520Sc6dxlcZL1mvzQd6mDC1zSOBRSDEeqCjiN1iCepga0DyUKHADwTYF/HTJz0Jhav
         MJWc3x0wDECYtQQeg12Nil6WUyNKoWxOrpx9S7kFhhFy5Tx3p7mI48tgpyJ0qRqdgl7E
         CtBg==
X-Forwarded-Encrypted: i=1; AJvYcCUGrpOYDC00TCPot+xodQMDUqoek6Q44oPnEoo7Y+MrAKAdqh480WKMjUaa0qJjJrrKyqd3Zy6NotA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhoN3yeOmAbSiXmn/FDf54H/obTtFmhISLea3JvEH+UkvKzjRk
	9DjcnudlvnCgfryT7tH/1IEomO4GoZF6gfGC1Rg+n+KYB0sR9LDRbBC9PVoFsPw=
X-Gm-Gg: ASbGncuhFo5AWrDRyponOQJfZ5HNUvILGNbBXEE3qzsP3Dp5edcCpPwWr5iqdn/SNxc
	YBNXHv299DJLpWdUHLuUAxc7xQQAbpZNs46T9LcFU5ohBDCX6aJxk5FT/RG377cgHAd6wnLWr2U
	eFd/sGPTLZguNg7hVkP6vnHzcyplrVaVqL8JxX3HxjriRuWr8E9atsVixXvxY+xDQSYCvyHkrYm
	keyGPr7qdI8/+Ls5/9ipDori6f5/A2vU2HDBDZ9zU64huxY1CAfcTF9N/2JRLVUY/B2gi5llHaz
	NbXBek75E0/mm8tIgf/ntggsxdnh
X-Google-Smtp-Source: AGHT+IHw8z00oYKwQWOlOfDB9fO1eIwPs/hkvMz9GejIoBfl+7Quq44eHbwbfyI2Rhdhk6N6OB3X8w==
X-Received: by 2002:a17:90a:12c8:b0:2fa:b84:b31f with SMTP id 98e67ed59e1d1-2fa0b84b6ffmr1530733a91.25.1738826621487;
        Wed, 05 Feb 2025 23:23:41 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:21 -0800
Subject: [PATCH v4 16/21] RISC-V: perf: Use config2/vendor table for event
 to counter mapping
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-16-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232342_244896_EED8433A 
X-CRM114-Status: GOOD (  26.87  )
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

The counter restriction specified in the json file is passed to
the drivers via config2 paarameter in perf attributes. This allows
any platform vendor to define their custom mapping between event and
hpmcounters without any rules defined in the ISA.

For legacy events, the platform vendor may define the mapping in
the driver in the vendor event table.
The fixed cycle and instruction counters are fixed (0 and 2
respectively) by the ISA and maps to the legacy events. The platform
vendor must specify this in the driver if intended to be used while
profiling. Otherwise, they can just specify the alternate hpmcounters
that may monitor and/or sample the cycle/instruction counts.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c   | 79 ++++++++++++++++++++++++++++++++++--------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 219f65eb167c..bbf5bcff51fc 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -76,6 +76,7 @@ static ssize_t __maybe_unused rvpmu_format_show(struct device *dev, struct devic
 	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
 
 PMU_FORMAT_ATTR(firmware, "config:62-63");
+PMU_FORMAT_ATTR(counterid_mask, "config2:0-31");
 
 static bool sbi_v2_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
@@ -112,6 +113,7 @@ static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
 static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
 	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
+	&format_attr_counterid_mask.attr,
 	NULL,
 };
 
@@ -1383,24 +1385,77 @@ static int rvpmu_deleg_find_ctrs(void)
 	return num_hw_ctr;
 }
 
+/*
+ * The json file must correctly specify counter 0 or counter 2 is available
+ * in the counter lists for cycle/instret events. Otherwise, the drivers have
+ * no way to figure out if a fixed counter must be used and pick a programmable
+ * counter if available.
+ */
 static int get_deleg_fixed_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	return -EINVAL;
+	struct hw_perf_event *hwc = &event->hw;
+	bool guest_events = event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS;
+
+	if (guest_events) {
+		if (hwc->event_base == SBI_PMU_HW_CPU_CYCLES)
+			return 0;
+		if (hwc->event_base == SBI_PMU_HW_INSTRUCTIONS)
+			return 2;
+		else
+			return -EINVAL;
+	}
+
+	if (!event->attr.config2)
+		return -EINVAL;
+
+	if (event->attr.config2 & RISCV_PMU_CYCLE_FIXED_CTR_MASK)
+		return 0; /* CY counter */
+	else if (event->attr.config2 & RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK)
+		return 2; /* IR counter */
+	else
+		return -EINVAL;
 }
 
 static int get_deleg_next_hpm_hw_idx(struct cpu_hw_events *cpuc, struct perf_event *event)
 {
-	unsigned long hw_ctr_mask = 0;
+	u32 hw_ctr_mask = 0, temp_mask = 0;
+	u32 type = event->attr.type;
+	u64 config = event->attr.config;
+	int ret;
 
-	/*
-	 * TODO: Treat every hpmcounter can monitor every event for now.
-	 * The event to counter mapping should come from the json file.
-	 * The mapping should also tell if sampling is supported or not.
-	 */
+	/* Select only available hpmcounters */
+	hw_ctr_mask = cmask & (~0x7) & ~(cpuc->used_hw_ctrs[0]);
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		temp_mask = current_pmu_hw_event_map[config].counter_mask;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = cdeleg_pmu_event_find_cache(config, NULL, &temp_mask);
+		if (ret)
+			return ret;
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * Mask off the counters that can't monitor this event (specified via json)
+		 * The counter mask for this event is set in config2 via the property 'Counter'
+		 * in the json file or manual configuration of config2. If the config2 is not set,
+		 * it is assumed all the available hpmcounters can monitor this event.
+		 * Note: This assumption may fail for virtualization use case where they hypervisor
+		 * (e.g. KVM) virtualizes the counter. Any event to counter mapping provided by the
+		 * guest is meaningless from a hypervisor perspective. Thus, the hypervisor doesn't
+		 * set config2 when creating kernel counter and relies default host mapping.
+		 */
+		if (event->attr.config2)
+			temp_mask = event->attr.config2;
+		break;
+	default:
+		break;
+	}
+
+	if (temp_mask)
+		hw_ctr_mask &= temp_mask;
 
-	/* Select only hpmcounters */
-	hw_ctr_mask = cmask & (~0x7);
-	hw_ctr_mask &= ~(cpuc->used_hw_ctrs[0]);
 	return __ffs(hw_ctr_mask);
 }
 
@@ -1429,10 +1484,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
 	u64 priv_filter;
 	int idx;
 
-	/*
-	 * TODO: We should not rely on SBI Perf encoding to check if the event
-	 * is a fixed one or not.
-	 */
 	if (!is_sampling_event(event)) {
 		idx = get_deleg_fixed_hw_idx(cpuc, event);
 		if (idx == 0 || idx == 2) {
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 9e2758c32e8b..e58f83811988 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -30,6 +30,8 @@
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
 #define RISCV_PMU_DELEG_RAW_EVENT_MASK GENMASK_ULL(55, 0)
+#define RISCV_PMU_CYCLE_FIXED_CTR_MASK 0x01
+#define RISCV_PMU_INSTRUCTION_FIXED_CTR_MASK 0x04
 
 #define HW_OP_UNSUPPORTED		0xFFFF
 #define CACHE_OP_UNSUPPORTED		0xFFFF

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
