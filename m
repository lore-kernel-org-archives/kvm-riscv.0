Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC56BC0218D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHySwpIvXDkdehHUWXIzMM0V0GiuznGTzKsl1Zsn+Qg=; b=uJvTGedaKglVv6
	2EhGHvSN9sRBpOdhgwC6hp4t6Lzyr7Yal1lIc8PJJRn3qj+FGUIhQbuTmxd5Flvls+qFS1Ob2fgAU
	cNRCtFv+ffpiNenHKgccwIRB90Blu3TRf08AH3DX2Pvn6kim9rW6yjAFpxQ5KpARvW2ezQEtakNJF
	162wFncBArdhcy0Qp2OX6xh0b79jcDm5OfUrtfdxGdqVyKmIz9vHxxxwRhdLr8yOwx6juF5HtcjPe
	1XO4jY32FlbIen3rtlew/J195Tv5RhGPIHrDikpnJ+DdI1yzPpMdaLZ8MhdboFFU1qHqcxbTv6pq7
	oSWYBQKW8UAeeeada6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdzu-000000048xk-203h;
	Tue, 28 Jan 2025 05:18:50 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhv-000000044jZ-3XC0
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so6862156a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040415; x=1738645215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwSJXYJYJ2QsfeksDYzOVoprLyqehfXihnOY7v/vL40=;
        b=zHatAQhiYzC/piD6tddm/wByHDVVGxYyNlhHz85Ku4gyY3wgmWwRSNkXX6ybRZtaqg
         Mp6xcsj+OIqiZxlT3nYG5QPFGHVbPci2Tjjt+Yz695JkxaaqphRZViByTRbqKfUA6hUB
         mu3Ldps8Yq9ZpIVmv/511rVFU60v7xddG+uD/IyeBQ0U4nSSaExgjO6x/iSUvEgCK1wQ
         agR7Fu5ojiOPxQ2lrOFWxoQ1oivDc/wyYr2Lb+fvmvYkk0HjqKoXguPEBqWhT7u5p3VG
         M0lSG8F+pxR49owMdusY0pkU7uZOZt851cvwOGjyVLKM1YyHcBb4VZu+R7wR4cVm87DC
         Go6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040415; x=1738645215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwSJXYJYJ2QsfeksDYzOVoprLyqehfXihnOY7v/vL40=;
        b=fmg/tvHmt0X9W4nC6NqzsLDLDtEjOYE/+099arHNrs/GO0YXqTWsK6ir3wJ2ZaIybi
         PmEN/0wmbm3aQlfxNzmb/+I1F2UKqcAQN9n37i0zijX1T8nJ4P+UPZilUjqN3vEHsMgr
         QGiY79VZL25SjcljMMHlKgKuPGzjzDTf6T9eDRpY1KqO8tbjQW0hVP62N1EnnI2HMCoV
         dP78r8ibYw55T5lDkjA0O7Vkgzbb2KixJCzeFloUsEMrVITlhFT+G3DPWlaTCOK7Jwqa
         Bqd0rlSaOO2K6Sai3e/NWpPVcV5jbx69BF7WFwbs4+E33E+W9aZbUE9sKF+bYdCgCn6h
         qdtw==
X-Forwarded-Encrypted: i=1; AJvYcCVk+sM5YEtVZWJ4hvp3iKO6Xzh+pTnWEUTEj0GfPZ0ZFY8e1ej2rfE9vthFM6uTxpspFK8rLxe3g5w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQU8LAaJBYR8CJwV2TBKFkpzU+Li8hJEi+6GzlcddsBrw9xm0B
	/eQFaESFb88cv6WXYXB5zdlbZoNTNbubAXKCNQmgyblW+AP94B443Z7LfLrUlFo=
X-Gm-Gg: ASbGncvO81AmRwOZTToti28pS5cAawBGUgFEZ7AD+04w8oRPn/eQ26EtI6Ct3DulW0Z
	J1lULB8XyVr4cZk5UQ9c9f7B5AchCZ9+Z2tnc0z/JFpQ7FZXwFC1nWEga/xeMQP+N/QOqr6IBeC
	teYU4A8mbD+FB86vxcq64fBe2xvoay2SsBUzB3Ni+FukUAQGF3iAC0yFZEBd9TfQygD6gI4hnhT
	+bBXYqKj3g4Q/THuMbLUkYyCUeQi/O+9nubsqdPQw9EUMDuf/0X9SVKhq0GZqJKjvEs2aFtpSHL
	qS6+zOc3aajxnD9hxmANiFYBuEVo
X-Google-Smtp-Source: AGHT+IEKLNFZOaVvDJ2grs7h9hb4mxjnaquPb5u1sc5MAJh5NiIGfsglFThj6u7Oc3KeiatM4ZLmwA==
X-Received: by 2002:a17:90b:2d48:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2f782d4f152mr64397362a91.24.1738040415260;
        Mon, 27 Jan 2025 21:00:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:15 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:57 -0800
Subject: [PATCH v3 16/21] RISC-V: perf: Use config2/vendor table for event
 to counter mapping
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-16-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210016_009088_8D2B71B9 
X-CRM114-Status: GOOD (  27.60  )
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
 drivers/perf/riscv_pmu_dev.c   | 78 ++++++++++++++++++++++++++++++++++--------
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 52d927576c9b..ab84f83df5e1 100644
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
 
@@ -1383,24 +1385,76 @@ static int rvpmu_deleg_find_ctrs(void)
 	return num_hw_ctr;
 }
 
+/* The json file must correctly specify counter 0 or counter 2 is available
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
 
@@ -1429,10 +1483,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
