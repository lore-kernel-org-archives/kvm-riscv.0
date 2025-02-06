Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F19C02198
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjh2YovvNzZwXcUOF7qeG42Z1eXT6HUMej2rpef6UtU=; b=yc7+yk6z3kkBXq
	8MnEaQF3lPDkueoNipw+AFoduWHvgH01Nl3QQiX5kbWg+4AEqmQ1S8PUQ0AigeZXoTfdTSazxJWVr
	6rrxakkShjqgR6xfrSx3zmXJ3b6ivfMuADJ9RnSKqQ7tX1Qa41/aBDY1+nDR03QMnZfMtE2xwgLkI
	h50wxS5+zBtilELSYUcZ3Vbj6NgzG1dkRWCJEsAXndC9nMsH8mrfJZfOZ22eJ5M+vRRg2WZh+Njan
	7IJQ8fxUD9lC0Elzv2ggJs3nOuTbzz+RsnNs5ow/Tsiu0aYje53QvmdkjqkkumwVUzV8AMEb4QJXZ
	AMWdQ8K/emj/cKF7MLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwbG-00000005dmf-29aU;
	Thu, 06 Feb 2025 07:47:02 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEh-00000005YJs-2szk
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso879860a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826623; x=1739431423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLt3uQ+5mVFCD4CpzivJzFeQzs8sYQp9bQK+aL0eLxQ=;
        b=JkUd2FdA3e9SzRPPqk/w7/7jTtDFwUqlM/ITm6MoJqu9onSIOxn9FhjA4d/AO0XfMc
         AegqM7zrKkkXHoO6CElsFLypPkOZsFczSRvdDu5QfGRn+o4NrtplqlxnZq2WY2zxdWi4
         pHm+rY55dUJt8SLuPKQ26lT5BwAyo8eMkEhWmHdEG4SpNV4vvGlTbiTV1yCzKc3KDQR5
         ILyoygiso7wd6U08YofzYWdzwejJO3MSbEzK7C2aIHdrEsSXRw/4jD81d2kk/XdhKI2B
         RdOUao3LI3vO/0yXqtQ8CCbYKhhj1NFA27mpocp4C3BYgvKz9uiXh7fDRHpT2GrCL5Kk
         7LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826623; x=1739431423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLt3uQ+5mVFCD4CpzivJzFeQzs8sYQp9bQK+aL0eLxQ=;
        b=v+EXbZUNqbDoq8uJ8qZs3bPdIl7ESGlJBoRn+BR5VsP6aBqE9dK8cRpP20wgRQAwBn
         vIOmio91zQDxYXXCGA2uHjqCFOR4sozMcEAnKMGImnvvT3TwtvMeko5RUFgGW2QXRsT7
         ZVweKXzFPjbeT6KJk8187YS7+cEHfyUwullJjsEX1TSHYM0D0r2Wz7M4KqJpsSvDzlU8
         b341SSi37C7X/cyrnxYaAMRc1uaS7j3uZp9/V/f3Q9MkWEYKXiR5qiEMSEMZp4MOuN81
         rsdIu371aQW8ruVK40ukKpeDZd3LvSrWMVxHAznmXgGZRqSIjCjU1uMAdsd/gfpYvpt8
         8Ang==
X-Forwarded-Encrypted: i=1; AJvYcCWPqOpvjgIujC0MbalTUMe4GL7HN4K+k1khs/p+yke/DSEMjS7LP665oeeFV41fSrfcdKsi1hXGbhs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCFB23j2UjLPWit1QzpqX5EMe3czIzEogNZ1GMSTeoJuZ7Rh5K
	P7iLrW2VyRuztwxkv3xuRPFAdC1zC0dQbmOhDV0vRrYZxu1UbGKsiS9T9PRBapM=
X-Gm-Gg: ASbGncuYQFAgiuPMVKGIVW1oJ3Zio7CyF/rc5EysaQioJ8f6UHbPRBH5qD2XTkK33Vs
	feDJToZj2NwoTkTBspJfeDNlxoTwv3f075m3jr0TjAO8G1BEBmdZlgZiaybXuHwtQF0hcqA/YRw
	bOQlfPB21PnuVznoH02x2qjZwC1McsGhfSsgVpYMuB4eBEHj7ArTPWjydSQ3pZcQKbGc77HqMNO
	LB0RNXFoNEkGj/oVw1CqhmLOVEeWKiotuO7eSwXur9320yOjMxKrOgs7n2rms68KDaHPOsekLH3
	wVxtgQwWF4lwU0JAnp2GklRMAI5n
X-Google-Smtp-Source: AGHT+IE+zm5bTYTXugTwpHU711moyOZkgKemcMPApk5i6Nyzgk504/702jQ6OsU4eVbUvVfR2YHglw==
X-Received: by 2002:a17:90b:4fd1:b0:2f9:e730:1601 with SMTP id 98e67ed59e1d1-2f9ff8a1befmr4045975a91.7.1738826623101;
        Wed, 05 Feb 2025 23:23:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:42 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:22 -0800
Subject: [PATCH v4 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-17-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232343_805744_BB89B311 
X-CRM114-Status: GOOD (  14.98  )
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

Define sysfs details for the legacy events so that any tool can
parse these to understand the minimum set of legacy events
supported by the platform. The sysfs entry will describe both event
encoding and corresponding counter map so that an perf event can be
programmed accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index bbf5bcff51fc..dd4627055e7a 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -122,7 +122,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
+#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
+#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
+	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
+			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
+			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask) "\n")
+
+#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
+
+static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
+	.name = "events",
+};
+
 static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_event_group,
 	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
@@ -362,11 +375,14 @@ struct riscv_vendor_pmu_events {
 	const struct riscv_pmu_event *hw_event_map;
 	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
 						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+	struct attribute **attrs_events;
 };
 
-#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
+				_cache_event_map, _attrs) \
 	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
-	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
+	  .attrs_events = _attrs },
 
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
 };
@@ -388,6 +404,8 @@ static void rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
