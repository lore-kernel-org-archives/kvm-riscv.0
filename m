Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF6C02198
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKec6nmhgkr/RSoQt92rYPyx7H8Z/jk1j5cTuYB6F50=; b=UnIdhXBFVZ3DUX
	VU5Iwq7m3yxXGRv8K5NKOaShgxd//Mvp/UUjr8FeF/fYSxtBiDyfYlzagrL3MlKdlOtSG4rEciMW3
	QT5FCb5mx2V0GsAWefLxxcLB2ac1gEXSYjIWSLHNQrHTQqCrGrLAh0Pl+doW9/pxh+FOLNscj0T7p
	rifcpYwI7GTVyHiluEa4spEPiCKkN9zr84ffW077bTYRv+AOrzxH4s+3Q3RJgaDZroOnNyfpBE9Qu
	lJZT0SDn5aSCY3cM1ijEcbq1VdSvnpntqmBgqKNEjNaq6Ixqc4EgRyUmHD5BwyFpLJU3pUIbD0FI7
	6lN85kOcEXZmrzM/4QiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwUZ-00000005cU8-2lER;
	Thu, 06 Feb 2025 07:40:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEZ-00000005YBJ-2bD8
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so788283a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826615; x=1739431415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEmj8DVMBSDONaOAMSnkme1snOH35jPSjqon+nV/oLM=;
        b=2ijaDfv/WF0sQCKf9sSVPFsXc+aisRp7bdO4hkP1UK77c540yVF4/mCh5v3+4uEfJq
         jPov6JROy1Tvu+mDgJlDRRgHRdIjACNTXwJqS57Q1f08xIv7RyWXdWdFRPKBoI8s5qAw
         MHbxW1PRsoin2tvQIJjeOWgB0oTq5vfsTfehJJpTg8fLMmBoIbHb1OS5W8eaVxjJ7gdF
         luzL/CQzoxNntGnL+S8/2yNz4z+/ihQXNdtdymd/LWGGJGtH+G54VyTNl+Si9Fskjo6/
         6k6qGOJeNVCVaMEzkyI5FV3W/RFm+HK9EWFjbG7DGcfXs3TGe9B2kNPuV04RJbHUdVvA
         Rokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826615; x=1739431415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEmj8DVMBSDONaOAMSnkme1snOH35jPSjqon+nV/oLM=;
        b=SRcJURO4MzSqehdtA7GDZ7jRXJBiPgrfeuYCiP4DKv1bDsLcuROajB2rEKq40gtBky
         eZ1cYB2rFQtrX/tyEsVXlZxlYLqSPQXSUEBCY+96Z2S7Fz0Tj8z5KHUyqkTMk9T89Bmi
         YjhSVyWB7abgUDi930m6Rk666yAIkBr5raLtIDA4wmpyY3BOfU3apikrz3f8XCuS6Ru2
         5xQuh7jpRV0yopi2lQ8j6uIdDc3EwIIbsyqguN13ZsTBAhGKuppGI0P9p5gLJIC1q8aH
         sYnGK4zQLYweC7lghMvrtHnTdMDwI7j3QsSAmC7aLarsfTgEpso37ubUwiBJtjzkDvnH
         5L/A==
X-Forwarded-Encrypted: i=1; AJvYcCVNo92JtsajWJybbX87ixCQWJKaecAnFkvHFjun3QLQklKWhAVKzIIbisORffHZWBJaCITr4AGHUdI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9a6YRNVs8UyuFxe+vjc5KrKBhjs1dGhjueBRFbno3kUtFGh1H
	znkYj3OcfmcjDePv9q/dc1LVA//eQb2O3+AN3wsClXosemwzSZxy5fvStqYmg2I=
X-Gm-Gg: ASbGncuJt4UpqvSAnQ52SqSDWc2uNWm+QQX38x4fKEguoJzdM3igUk2tFg/rpYcsKF4
	8My9OZ8/w/tbcLm+AxLdaeu+u+yEf1AKJXPYjKDphShuYOsVO8Gn58wBcuwehlib1co+1wAVUZ9
	jlQzvVJn4qDAS3rGRXD5ukN5G+n7WLooIt85nLrx9zT++g/Paf47gjZG0xv4uh0FXnt+qDR6QbH
	bk/oE8Cf2eJKZ0KhXN6L+v0djokq0bafq4W8Yww2vtNlXaLAPJ2prLLh72JEaKWsOSeXlqu1Iv1
	3reDwHH3CbJ/5C3Ed0Hbludupu5G
X-Google-Smtp-Source: AGHT+IGj8B7K0A3SeZQU+rxnVnMyUu5PFTc58BZIXIzUWOA7tBSdLa1HA/cppXNHnn2s7VfTdqOU4Q==
X-Received: by 2002:a17:90b:1d44:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f9e0785075mr9990255a91.15.1738826615039;
        Wed, 05 Feb 2025 23:23:35 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:17 -0800
Subject: [PATCH v4 12/21] RISC-V: perf: Modify the counter discovery
 mechanism
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-12-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232335_709037_2F103EC0 
X-CRM114-Status: GOOD (  26.64  )
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

If both counter delegation and SBI PMU is present, the counter
delegation will be used for hardware pmu counters while the SBI PMU
will be used for firmware counters. Thus, the driver has to probe
the counters info via SBI PMU to distinguish the firmware counters.

The hybrid scheme also requires improvements of the informational
logging messages to indicate the user about underlying interface
used for each use case.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 118 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 30 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 6b43d844eaea..5ddf4924c5b3 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -66,6 +66,10 @@ static bool sbi_v2_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
+static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
+static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
+static bool cdeleg_available;
+static bool sbi_available;
 
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
@@ -88,7 +92,8 @@ static int sysctl_perf_user_access __read_mostly = SYSCTL_USER_ACCESS;
 
 /*
  * This structure is SBI specific but counter delegation also require counter
- * width, csr mapping. Reuse it for now.
+ * width, csr mapping. Reuse it for now we can have firmware counters for
+ * platfroms with counter delegation support.
  * RISC-V doesn't have heterogeneous harts yet. This need to be part of
  * per_cpu in case of harts with different pmu counters
  */
@@ -100,6 +105,8 @@ static unsigned int riscv_pmu_irq;
 
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
+/* Cache the available firmware counters in another bitmask */
+static unsigned long firmware_cmask;
 
 struct sbi_pmu_event_data {
 	union {
@@ -778,35 +785,49 @@ static int rvpmu_sbi_find_num_ctrs(void)
 		return sbi_err_map_linux_errno(ret.error);
 }
 
-static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
+static int rvpmu_deleg_find_ctrs(void)
+{
+	/* TODO */
+	return -1;
+}
+
+static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)
 {
 	struct sbiret ret;
-	int i, num_hw_ctr = 0, num_fw_ctr = 0;
+	int i, num_hw_ctr = 0, num_fw_ctr = 0, num_ctr = 0;
 	union sbi_pmu_ctr_info cinfo;
 
-	pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
-	if (!pmu_ctr_list)
-		return -ENOMEM;
-
-	for (i = 0; i < nctr; i++) {
+	for (i = 0; i < nsbi_ctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
 
-		*mask |= BIT(i);
-
 		cinfo.value = ret.value;
 		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
 			num_fw_ctr++;
-		else
+
+		if (!cdeleg_available) {
 			num_hw_ctr++;
-		pmu_ctr_list[i].value = cinfo.value;
+			cmask |= BIT(i);
+			pmu_ctr_list[i].value = cinfo.value;
+		} else if (cinfo.type == SBI_PMU_CTR_TYPE_FW) {
+			/* Track firmware counters in a different mask */
+			firmware_cmask |= BIT(i);
+			pmu_ctr_list[i].value = cinfo.value;
+		}
+
 	}
 
-	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
+	if (cdeleg_available) {
+		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, ndeleg_ctr);
+		num_ctr = num_fw_ctr + ndeleg_ctr;
+	} else {
+		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
+		num_ctr = nsbi_ctr;
+	}
 
-	return 0;
+	return num_ctr;
 }
 
 static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
@@ -1067,16 +1088,33 @@ static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
 	/* TODO: Counter delegation implementation */
 }
 
-static int rvpmu_find_num_ctrs(void)
+static int rvpmu_find_ctrs(void)
 {
-	return rvpmu_sbi_find_num_ctrs();
-	/* TODO: Counter delegation implementation */
-}
+	int num_sbi_counters = 0, num_deleg_counters = 0, num_counters = 0;
 
-static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
-{
-	return rvpmu_sbi_get_ctrinfo(nctr, mask);
-	/* TODO: Counter delegation implementation */
+	/*
+	 * We don't know how many firmware counters available. Just allocate
+	 * for maximum counters driver can support. The default is 64 anyways.
+	 */
+	pmu_ctr_list = kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list),
+			       GFP_KERNEL);
+	if (!pmu_ctr_list)
+		return -ENOMEM;
+
+	if (cdeleg_available)
+		num_deleg_counters = rvpmu_deleg_find_ctrs();
+
+	/* This is required for firmware counters even if the above is true */
+	if (sbi_available)
+		num_sbi_counters = rvpmu_sbi_find_num_ctrs();
+
+	if (num_sbi_counters >= RISCV_MAX_COUNTERS || num_deleg_counters >= RISCV_MAX_COUNTERS)
+		return -ENOSPC;
+
+	/* cache all the information about counters now */
+	num_counters = rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_deleg_counters);
+
+	return num_counters;
 }
 
 static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
@@ -1377,12 +1415,21 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	int num_counters;
 
-	pr_info("SBI PMU extension is available\n");
+	if (cdeleg_available) {
+		pr_info("hpmcounters will use the counter delegation ISA extension\n");
+		if (sbi_available)
+			pr_info("Firmware counters will be use SBI PMU extension\n");
+		else
+			pr_info("Firmware counters will be not available as SBI PMU extension is not present\n");
+	} else if (sbi_available) {
+		pr_info("Both hpmcounters and firmware counters will use SBI PMU extension\n");
+	}
+
 	pmu = riscv_pmu_alloc();
 	if (!pmu)
 		return -ENOMEM;
 
-	num_counters = rvpmu_find_num_ctrs();
+	num_counters = rvpmu_find_ctrs();
 	if (num_counters < 0) {
 		pr_err("SBI PMU extension doesn't provide any counters\n");
 		goto out_free;
@@ -1394,9 +1441,6 @@ static int rvpmu_device_probe(struct platform_device *pdev)
 		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
 	}
 
-	/* cache all the information about counters now */
-	if (rvpmu_get_ctrinfo(num_counters, &cmask))
-		goto out_free;
 
 	ret = rvpmu_setup_irqs(pmu, pdev);
 	if (ret < 0) {
@@ -1486,13 +1530,27 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version < sbi_mk_version(0, 3) ||
-	    !sbi_probe_extension(SBI_EXT_PMU)) {
-		return 0;
+	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
+	    sbi_probe_extension(SBI_EXT_PMU)) {
+		static_branch_enable(&riscv_pmu_sbi_available);
+		sbi_available = true;
 	}
 
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
+	/*
+	 * We need all three extensions to be present to access the counters
+	 * in S-mode via Supervisor Counter delegation.
+	 */
+	if (riscv_isa_extension_available(NULL, SSCCFG) &&
+	    riscv_isa_extension_available(NULL, SMCDELEG) &&
+	    riscv_isa_extension_available(NULL, SSCSRIND)) {
+		static_branch_enable(&riscv_pmu_cdeleg_available);
+		cdeleg_available = true;
+	}
+
+	if (!(sbi_available || cdeleg_available))
+		return 0;
 
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
