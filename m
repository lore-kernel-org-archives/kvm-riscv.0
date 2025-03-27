Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01881C36014
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vwu7N9PS6+mWcAahKD3j6p2mfxkEUrUxtH5khPA3SYo=; b=cGlw3eXcgnVg76
	zU44GBjTO97j58+nw7JXpOZ3YOaAf9JvJZaP+axB+Ew0+xYf7iwsCV4h618X808yj8xSEnR9kesSt
	pSBi3pcRseHAdnQH2Vm9eUcpPFkAC5bzqOuUSQ2nUJrcUy/9GizIafs9sfGaL4pTab8vs89xee6u4
	S0SdGtCnb9bwOwRIWkG8XKnFf/ujwyEAd6Vf/PAIhudWyXRzZHdOATIbXT4Idk3LfWRNxaswKtnaB
	sUNTmqR+pSBO/nZQ9Yf1XQYuU/bGl6rcAATP/T+tpVyqV7gRKVfoxkqxR1OSrjo2cHeeItUVP8S4X
	sRcDFPPQF0XLvq8BGCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtMO-0000000BuIH-2VJ4;
	Thu, 27 Mar 2025 19:57:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1l-0000000Bpjd-2pnm
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30332dfc821so2018025a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104193; x=1743708993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uGGyRkYKjdJ+vw9b2EYMQ7VNOlGqoQjZ03lOaE3eUo=;
        b=DLOAhRga55uX4gCqLWIVPqZRVpfaxK+XClj1hdSQLbhDEHu0/T5CJ2q7AW2kT82Kx0
         eYRRde/GJ8Iu29varc+T11VMbOqDuShpCfWMHae3aUJ4bm6HTLfZPYoIa3YqoisIdhKH
         gSn13fJ+L4TC68TiS4aGQ2r+ZZdBul4UTudM1ZIla7ScCCWELsHvCX6gzJvOyWSD1xpI
         n8imme3tzDaweu1HCx81B5YyZeUklTdH1F/6C6Db4nBMZOoINYEBn7WGGohaSUkTzDu7
         vH8V/q7xMaaxDni2wP7ZeQUvziPQxXPxNrZSfkx+VTntvW5wDZ8KOPNhMLvnDEUYkmRB
         hL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104193; x=1743708993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uGGyRkYKjdJ+vw9b2EYMQ7VNOlGqoQjZ03lOaE3eUo=;
        b=khGRZ6CInTLkdTS6KbcYdQxve1o7Ml6XTT9hVwUcA5qggvy17iE501LnJVbJb4YuKQ
         gXR40luQK4S0SLaDz9rth53YEW4fK490mnRST+kdVCVAnzI4twzW+fz2+QPf5pyTHQFK
         41VpeTGsp9m6H+JL4hC4g0tkAthunShibIWDQosndykyQnvB5bY6bkqt27So4d073G2g
         JuFQbi0dLV1cyqZuq1Nsf0JFKkZzhsZsSSR1CqhCI/QUB/azfkh+D9S7E6wT3Zdj3tBJ
         t/6Lun77VK7VbLIVFTkm3yuZEnIwrGN1hNl/Ok+MFp+6wXeWK8l+zg1rC5w+Rgp+3kMy
         TRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz140v9XSatrkqx0kOjQL8CAsp/Af3R6zoP+E8L5Is7NK9hd/6fJ83CynRDGfp0E0rSROucmyMGNI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkjrfvnNOmLlMjCI60FqGG8IpUzq/U05NiTOw78X4cd7915fy+
	/WG5IakCJdW6noGQJk5qbzEN9nNw7n8h4WMV6eQucQy8rbORCF9B8GnIfSRDss4=
X-Gm-Gg: ASbGncsVYs+hKAaEbE5swAsa7ob6MhvKrsC9qYXG+P6nqU4f8AEKYU9gGkIUsTKC1Il
	u3UqlROvpqyyiVAGYwD5/hjUEkTkusk6BhrIg/AKRz0Me3nJC37es5xsFlI+oxn+UfZZZy9uDc+
	u+cM3TJ4Pi3ANxCWIvCkG0jCpX1wDVs9tRg87CSMwcyvfu8vXwUpGv7sg+N9fN17GQMhSDd0TII
	GPK3KlysOf38UVD2nsqHzr1azke9DFvrWav2RBXq3iPkYNv9etakJid24OMoqX9at0wrfIkymKl
	wy/oSHWFUa/qoZ7UXglg8mm4PRDN+VQvWHABJqgHu81P6j7dAbyxjFLq5A==
X-Google-Smtp-Source: AGHT+IENDTi2wmd5guSAtbCl7ZVpJGH3loOpoV0kcjkWU+S0QZ+aC84U+Dd29pEp73mrXKIMPYoAPg==
X-Received: by 2002:a17:90b:2d46:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-303a6c35c4dmr8832996a91.0.1743104193005;
        Thu, 27 Mar 2025 12:36:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:54 -0700
Subject: [PATCH v5 13/21] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-13-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123633_762665_B5643719 
X-CRM114-Status: GOOD (  17.34  )
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

RISC-V ISA doesn't define any standard event encodings or specify
any event to counter mapping. Thus, event encoding information
and corresponding counter mapping fot those events needs to be
provided in the driver for each vendor.

Add a framework to support that. The individual platform events
will be added later.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c   | 54 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/perf/riscv_pmu.h | 13 ++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index c0397bd68b91..6f64404a6e3d 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -317,6 +317,56 @@ static struct sbi_pmu_event_data pmu_cache_event_sbi_map[PERF_COUNT_HW_CACHE_MAX
 	},
 };
 
+/*
+ * Vendor specific PMU events.
+ */
+struct riscv_pmu_event {
+	u64 event_id;
+	u32 counter_mask;
+};
+
+struct riscv_vendor_pmu_events {
+	unsigned long vendorid;
+	unsigned long archid;
+	unsigned long implid;
+	const struct riscv_pmu_event *hw_event_map;
+	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
+						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+};
+
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+
+static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
+};
+
+const struct riscv_pmu_event *current_pmu_hw_event_map;
+const struct riscv_pmu_event (*current_pmu_cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
+							   [PERF_COUNT_HW_CACHE_RESULT_MAX];
+
+static void rvpmu_vendor_register_events(void)
+{
+	int cpu = raw_smp_processor_id();
+	unsigned long vendor_id = riscv_cached_mvendorid(cpu);
+	unsigned long impl_id = riscv_cached_mimpid(cpu);
+	unsigned long arch_id = riscv_cached_marchid(cpu);
+
+	for (int i = 0; i < ARRAY_SIZE(pmu_vendor_events_table); i++) {
+		if (pmu_vendor_events_table[i].vendorid == vendor_id &&
+		    pmu_vendor_events_table[i].implid == impl_id &&
+		    pmu_vendor_events_table[i].archid == arch_id) {
+			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
+			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			break;
+		}
+	}
+
+	if (!current_pmu_hw_event_map || !current_pmu_cache_event_map) {
+		pr_info("No default PMU events found\n");
+	}
+}
+
 static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 {
 	struct sbiret ret;
@@ -1552,8 +1602,10 @@ static int __init rvpmu_devinit(void)
 	 */
 	if (riscv_isa_extension_available(NULL, SSCCFG) &&
 	    riscv_isa_extension_available(NULL, SMCDELEG) &&
-	    riscv_isa_extension_available(NULL, SSCSRIND))
+	    riscv_isa_extension_available(NULL, SSCSRIND)) {
 		static_branch_enable(&riscv_pmu_cdeleg_available);
+		rvpmu_vendor_register_events();
+	}
 
 	if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_available_boot()))
 		return 0;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 525acd6d96d0..a3e1fdd5084a 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -28,6 +28,19 @@
 
 #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
 
+#define HW_OP_UNSUPPORTED		0xFFFF
+#define CACHE_OP_UNSUPPORTED		0xFFFF
+
+#define PERF_MAP_ALL_UNSUPPORTED					\
+	[0 ... PERF_COUNT_HW_MAX - 1] = {HW_OP_UNSUPPORTED, 0x0}
+
+#define PERF_CACHE_MAP_ALL_UNSUPPORTED					\
+[0 ... C(MAX) - 1] = {							\
+	[0 ... C(OP_MAX) - 1] = {					\
+		[0 ... C(RESULT_MAX) - 1] = {CACHE_OP_UNSUPPORTED, 0x0}	\
+	},								\
+}
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
