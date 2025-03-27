Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D3C3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtfHM0kb0jzPdZho0Kg14T19VrZMO91FonkiWTe36rQ=; b=U9xCa80NQ4cpIC
	teESzC85XRcN5e8BgKZNasaDJJ3N8Xf1Fr7OE/nhy9eqGt5oJ8f80u8Lz0F/vRHxiOG+aOZNMfljm
	/QbALzhXJK+UWc1pzJUBHjzZCvPJ7UMB+43rfpu5uNj82oMO40Ih+W1RbfYpm7n85Q6uRaSdjBhyv
	jGkISXR/lTB7iux3tCXQIlNAaulmTQ2YdABmZFTjaGxBCbZNWoQsqPzb+OkHobNRJpLdYK7cIaEYT
	TM9JNr8A7RSjazCPoiLdqS9JUbJqY/djIa+td8kBLbV6hhGwIAVA/opRdaLO/b2lry1WURH8Vc+ZE
	Zk4XntK+WIGf+culWfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtTE-0000000BvUv-2D9R;
	Thu, 27 Mar 2025 20:04:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1q-0000000BpoV-315s
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fd89d036so33783675ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104198; x=1743708998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wclv7KMD22xenv1AEZe/Nvx9kd+X7FLj+t/yhjxf7eI=;
        b=o66mNkVBTHBcuGbTtL0sPx4RGH+LQ1ELkyhQ/hWupQe5YNU2b+ppTiMgZRbWnR6VZZ
         qNh8mTPNWvvhfDxRv0NKXbjvWn+S+fzuEPsn3hI/TwMq0grAC1IneqnWCMy8jA+n9a01
         F/2Ag1QuFreYYd61/i6cZ4tiPmelw5JtYbzBLaUYbst33waYHZLMnYR3+4vyQrqQo2kr
         py2TCure186onv0wRFOtW5g8fXoENyrccera3W/9XmFBDUpchAAOmrfVe0eSaMDM+fqY
         csv4ro7au2kFkoUI/8z8BuH54s9/ANBnItxatMVou1V4pw9BoFUpQLS+lvaLOfhCPGwE
         mx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104198; x=1743708998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wclv7KMD22xenv1AEZe/Nvx9kd+X7FLj+t/yhjxf7eI=;
        b=Rt5X5xPAV5uInQQ3Mypdcsz6yl3pmjtcfLJo5AHgJ47oJ3An0NbkmfODpsk0JKhdaZ
         SCqqb48Xyued/VeI0NtMnNiKzp6AJ/9aO52MsjM9c/5/5roEG+EULCQHQTgDmGuQ+5FT
         sBDgp/HXkgoGJQVTJ9mqIHc3kNRh2+WErctJqgoE21rBGZxwl6okuoiYvZRRjgYcECjP
         IA1ck24GD+AVtWZsBPyl+jNMWjrwzKBQlaWh2K/3EGUDwRpfuikxMF+17hFHNVTHxB3M
         DH7cknR3CDZ3FnOTvIEDU5PXy6ALH2zUzu1x8DmCWZDwdUoBdkk5RPWRPpBTq9tD2lAm
         oLfA==
X-Forwarded-Encrypted: i=1; AJvYcCUctBcbxjUBXhixAE4NDiOwKzeoJttgkTAJu0OWJjyyacQdCu3ERrfXkZAGI3u/aw9r07cHEa2uOCY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtkh7LdwbVO/6NeRKXTdgyscbN6G3LFEZDrjlb1HuvDrFHDBPz
	azCFAHHwS4SDJ05uvQ+bfb/0CLk0vPkAfzzHc/KUvV/65j2FRreaLeKuDB905yM=
X-Gm-Gg: ASbGncvLq24uiZesmE1xk/mXN4EnwiQzmKJmtOS7THpYxZyGRuYs4P680VqEWWzuuS4
	A8vVEN7Ekpg3ereU3YVw8MFzrd4RbmPvXS7IIx0edHSZJd4S9/+NlJfVjZ4+aXMaDmWUsIfJsYD
	K5xKAdERl7qxMx1R9+wZSomIxkNjHx7xSij51LjQ45Y+wwkXffIKDgTX//lCNIYe0TGaBTXMWL4
	UCyEFZa72Pcj9Jh675B87KTod1xlx/ALG7i6XOGWrCN0ZtAC8ofysWA7AJNoQGqeOTvs1JZjaId
	yAgv2EhH/LiVNM+3UW0dXUxuEJIVTSsN4KYMw2ePF3pUI+PDZKqdc9g8iQ==
X-Google-Smtp-Source: AGHT+IGpvZ7sDwmBS5g3c0uLQouPDbWUaAld2oD0Poj2rMITq9x7PtP4FskafBH9EZEyuKfMYJGq4w==
X-Received: by 2002:a17:90b:2e8d:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-303a7c5b918mr6255676a91.6.1743104197980;
        Thu, 27 Mar 2025 12:36:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:57 -0700
Subject: [PATCH v5 16/21] RISC-V: perf: Use config2/vendor table for event
 to counter mapping
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-16-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123638_839725_2B7E179B 
X-CRM114-Status: GOOD (  27.00  )
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
index d1cc8310423f..92ff42aca44b 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -76,6 +76,7 @@ static ssize_t __maybe_unused rvpmu_format_show(struct device *dev, struct devic
 	RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
 
 PMU_FORMAT_ATTR(firmware, "config:62-63");
+PMU_FORMAT_ATTR(counterid_mask, "config2:0-31");
 
 static bool sbi_v2_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
@@ -119,6 +120,7 @@ static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
 static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
 	RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
 	&format_attr_firmware.attr,
+	&format_attr_counterid_mask.attr,
 	NULL,
 };
 
@@ -1381,24 +1383,77 @@ static int rvpmu_deleg_find_ctrs(void)
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
 
@@ -1427,10 +1482,6 @@ static int rvpmu_deleg_ctr_get_idx(struct perf_event *event)
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
