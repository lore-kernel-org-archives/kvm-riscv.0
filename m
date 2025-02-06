Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DF0C02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXj0vQaZ8nUTjgE+89yElraDYCdZl96kN7pHB2O9zG8=; b=ZzlxuqIHQGn30u
	5V1f1+E5GemurCBcJzio1nPKdSeTfkYwwqKMgdIIHdJ2SkMRxmlBOHwrnbrJsMt0wn5GpcGz5I4xq
	qV403APLJxV+9gvFHpbqvj51HX/C9C51VF+jCqGcNSgsQXg9q6fAlLhiOzFsi2SyJpqlvjlpVM/TW
	FVhrjPWTMoYsn10dagH9ZuLDPr8PHNXW2I7wWhFWIVRGBbS6e0OOjS04E8tT8f0vm0ZUK/Su+4AHA
	q1hanhFsQjZ75l5iS9+peyWcd129snjbi+K4yyIEHhlG54B4WFqSttgf8F3y35mjRiGYFFrPGqri3
	w5RaKbrW0unYOBl8ofog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwXH-00000005dEp-0o3s;
	Thu, 06 Feb 2025 07:42:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEe-00000005YGa-23bZ
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9e415fa42so968428a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826620; x=1739431420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ1bM+mdYO24XpbpY93Gza0u/hfSg2U52kt5rlPb2uw=;
        b=eDrumcNty6D85nHbDA2bKP3QQVTcCpLtqOg5jlx7O3MK7YBTEOlaj1/tfGvm7N3S0r
         e2Z+hftb2T1F9HE8lHICDVPD0t1vKMJ7XnHN5xOG69oZryFZhhFL/wb8zmMAyy4WUSVX
         Bu8PJQgg0w1KyApAAZKgOI4/PlFleKhUTLq/eyCwXY1tHZsYEgleUy8SdBDgaoYkHqVG
         1iG3XrKKlad7qm9DxKojHfd85d8ea2BAIVFxbT2CbvsLk8hZiIb4WFo6zVNlkBNs9FLi
         WGeYKOFjbXhsLCnP9hqquasH7a+WcQAScuCC6LKHAP1J64NQDrvIFow4cm9bSazrrL9I
         nyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826620; x=1739431420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ1bM+mdYO24XpbpY93Gza0u/hfSg2U52kt5rlPb2uw=;
        b=slxTAU+Mk3KBruU486L3APDIeN+qNlJ1tQMB/HORXYBmfypAPin2LUEATN24mqeNhY
         sVF3eaGWwcsZrXr6B4Q5LUetsp/TLGLtKLed6DtiM95yn19GNktXpaWcz84CP6YjaxnB
         z+N1Md8HOswxrnvXMvAVP9+HWE1EK+Nyu+0fu0JBSR9KtPoABd9vPf6gNbAOZsm/6e0w
         g+eE/04cfu2g9pwxU3mVQ9BqdglHHB/iqiZ/7lbMymT2D6WITTPRuXH6u9QLsY6NYuhE
         qNzT5lFBsO4Cyho+jCFuonyrbNFyn6vXv6XHZ8zr+AsA6f6E708w3Ne6sUmROjngcqEQ
         hjbg==
X-Forwarded-Encrypted: i=1; AJvYcCXLaT05Mea1RF/HPRfxDa+uzr3NXRG537CT859cnqBLbwTxY6+h+VKtTN7QvmRnqD66tGubxHsnNrQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YytHidxoi+6JOqion/3OV3O71m8PKleZjMf7ZH6sUyQjzZP5nM/
	2pr2yM2V3tcioLaE8/pfzASAe2bQiyxbeJDKSnIcfwHjMasx2E9CsuiPFRt9PUY=
X-Gm-Gg: ASbGncvrFSZRsES60bPTuO/c5ZMsyv13xMJ16NsBlAuKlLuCg/sD+ZRJg4Fk7ZD68ox
	mQFhXOlDsINEJ4auvJ5K2G1QfOizX/HRkjom6D/SWOXBY4dvkbf5WhgdURSvTb5OppMrqzCZzq7
	RxZea1+A/JGxPOVd66kurlkxH3KD2w8AOWWOUCcnS6UOwb7qov8GsDqco1xaa8MHnJ+GqAueAoY
	GYlI5ag5VmqKm97NS2F2xyMRxT3R/90e9BA/wJodMus58uXdKnqbstzezueQLkiGZ335+2SzLDg
	er/k6wLUIBI8aAfKFqSvcm7z4D5w
X-Google-Smtp-Source: AGHT+IHr3HVst/0GQEzeOnoyNAyzJUxG9J5qyTanVRpVP7lxbmu+OPESYtyRFZuabnz8KqnI9biZIQ==
X-Received: by 2002:a17:90b:4c43:b0:2ee:fdf3:390d with SMTP id 98e67ed59e1d1-2f9e084fcc0mr8578133a91.31.1738826619909;
        Wed, 05 Feb 2025 23:23:39 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:20 -0800
Subject: [PATCH v4 15/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-15-835cfa88e3b1@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232340_573508_8BBC3D64 
X-CRM114-Status: GOOD (  16.54  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

When the PMU SBI extension is not implemented, sbi_v2_available should
not be set to true. The SBI implementation for counter config matching
and firmware counter read  should also be skipped when the SBI extension
is not implemented.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 46 ++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 5112049b491c..219f65eb167c 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -410,18 +410,22 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
-
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	if (riscv_pmu_sbi_available()) {
+		for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
+			rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
+
+		for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
+			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
+				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
+					rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	} else {
+		DO_ONCE_LITE_IF(1, pr_err, "Boot time config matching not required for smcdeleg\n");
+	}
 }
 
-static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
+static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
 
 static ssize_t rvpmu_format_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -549,6 +553,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
 
+	if (!riscv_pmu_sbi_available())
+		return -ENOENT;
+
 	/*
 	 * In legacy mode, we have to force the fixed counters for those events
 	 * but not in the user access mode as we want to use the other counters
@@ -562,10 +569,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
 			ctr_mask = BIT(CSR_INSTRET - CSR_CYCLE);
 		}
-	}
-
-	if (pmu_sbi_is_fw_event(event) && cdeleg_available)
+	} else if (pmu_sbi_is_fw_event(event) && cdeleg_available) {
 		ctr_mask = firmware_cmask;
+	}
 
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
@@ -871,7 +877,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
 		return val;
 	}
 
-	if (pmu_sbi_is_fw_event(event)) {
+	if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (ret.error)
@@ -1940,14 +1946,16 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
-	    sbi_probe_extension(SBI_EXT_PMU)) {
-		static_branch_enable(&riscv_pmu_sbi_available);
-		sbi_available = true;
+	if (sbi_probe_extension(SBI_EXT_PMU)) {
+		if (sbi_spec_version >= sbi_mk_version(0, 3)) {
+			static_branch_enable(&riscv_pmu_sbi_available);
+			sbi_available = true;
+		}
+
+		if (sbi_spec_version >= sbi_mk_version(2, 0))
+			sbi_v2_available = true;
 	}
 
-	if (sbi_spec_version >= sbi_mk_version(2, 0))
-		sbi_v2_available = true;
 	/*
 	 * We need all three extensions to be present to access the counters
 	 * in S-mode via Supervisor Counter delegation.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
