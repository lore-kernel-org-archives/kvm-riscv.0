Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC79BC02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcPptY5DgXareEpSiOt14Fcs9JjUBjMvYdTljv7ZiOM=; b=HNOS3PNrYWj2IQ
	Txu8YBJjsat3RMX5Fmbq+jBOcbY2C4ACV0qT60s1yPtKeErcC/qY/CsNezxph7/fb3oMsor1Yzapd
	FGVn0MddL2NiuYJ5hu+Ne/jh9N84DO4l74E70yP+W2ZIMovCE5CHnGAw55wpVShlLfoGbPQyuOrPI
	k+XuY0LY1zSvWLDmOa/Wgypv4adAXkjPKTReKbvJU3gMMI1fi53tV7RmPAREjgEts9mBA+CK/u9ro
	FBoWJcEQbl6yrQI1BcKLd/pmA97Z6Jm2GaWsor0IfO6Q59Vums9qnhOESPeSzuNt5kkmO9o/YIBY0
	gXd4B3xNB+vf6av/g1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwVv-00000005crK-1e9J;
	Thu, 06 Feb 2025 07:41:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEb-00000005YCo-0RmQ
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so773109a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826616; x=1739431416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgFNQleQh/rKyQJtr5gK6tFb1jww+ogex5C6sOF/Bv0=;
        b=nfwTultbl9Fw6Qpp+/I4SQ886j8tT+lzG2z2E+3Bzg5yVQdxeBy8Y0UvUzMBEhnv/h
         qri5x+EcKE8X6YDsLyh1q6enVSA6PQLbByAe6FhGW+gdWNrS8+lX5dssbpEh6D+13wFW
         vz2mUlBaNrI5S7fiVxaasoWVSbJtI5Qi2+ypBEQAMUuuQ9X4F7o1TMIZofKzJb7dFPjh
         ERDxceKjE8YnVjclNXWRHjWP7NFBWuc9h1S5W1kBbkIlaTelBvpgiee6Pyvd76IMMps/
         DVXTixEde6JfWl67lJsCCnMOT5NAcTZ4hijF/wxtl9rT/2dfgQPE1T78xXAlADSykDeU
         +GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826616; x=1739431416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgFNQleQh/rKyQJtr5gK6tFb1jww+ogex5C6sOF/Bv0=;
        b=Y836phrS1DpFG1WOyfaqoRqupkeW89VZI7lMyGshIfzZ6SO7DdDXRHm9B5Bz3zuNhp
         g8RV8/VNWrcGlfhGshvJfe3Kv2uUCe8KeXTjUibDsOEg6Rj+jo8lgZfoktllnQ6NmBRL
         ZO48sPsslwRcUCrJkAwYcaUUO5pU+wkz6sEplSny8VL8TBBsWVS6I/JKzLtXd7/oux+b
         2jvfhWvvUlHkCHDWi4g5/UKJB9YHBjkMj3gsvU08EmbJAPQttoYO0rXmUEvnSFKi5wSP
         GqMF/0CfwBVCDC1tDNPhpLmukVNfJ3DWroOhDKCtNykUkn9YwpjErplz+sJeQK57Ympk
         x/wA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ANzo9xtQQC9rvs9eW97W8LvsL2XubK2BVl/c5qjRybIeD3Lilqui4Vs9ZlHR89jRFIfQHSoAqa8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNTQUm1ZIQR8cMCKIt6BgJgHs0ZiZ8iRlF4F1Ez5S5o+qxIe0e
	Sbn9hhEz6iEG4K9LHbhIannYr2SWPOQw5/9BoqjXLhobkvvKT1WDMLuveQEZCPs=
X-Gm-Gg: ASbGnctCE6PNhwTtWOzpdPgtLkvomF3aBU553uK7gVAddQhMhCfxoSWNZJr9Qwi2ad3
	qJJ5cOyCMDMEcsE4RQvbEEx4xj62zDoWdO5bQ2PrCNwvhgXCZtA0081wa9xTyog2RhX46ZBaZCJ
	Te8iBsLuV7pmLo8ZteKHY/1ajRoLaRfG3GPjqkBG6kiAuxp1V5i9Ai/2xDR7yPsXJp8Sn7qvckl
	GKiOD5eLNXy9DraVERVII2PUPQb/cW137Q3bj43Zt/HX9XZa+c+OXi4kMhqmyYaIQfQ1kizhBev
	w06Hk8wuBbz6V2Gybu6DmAJWdGqR
X-Google-Smtp-Source: AGHT+IHC0uM6MKO6WJlQMIOHrq37adlEkVa8Q/0ld10wE8fTHq/Aau2QSOpqmWEdj7z9+naSpofcKQ==
X-Received: by 2002:a17:90b:2f85:b0:2ee:ab29:1a65 with SMTP id 98e67ed59e1d1-2f9e0753e18mr9830024a91.4.1738826616579;
        Wed, 05 Feb 2025 23:23:36 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:36 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:18 -0800
Subject: [PATCH v4 13/21] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-13-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232337_198058_2D2FCA47 
X-CRM114-Status: GOOD (  15.87  )
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
 drivers/perf/riscv_pmu_dev.c   | 51 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/perf/riscv_pmu.h | 13 +++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 5ddf4924c5b3..2eb58b248c88 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -307,6 +307,56 @@ static struct sbi_pmu_event_data pmu_cache_event_sbi_map[PERF_COUNT_HW_CACHE_MAX
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
@@ -1547,6 +1597,7 @@ static int __init rvpmu_devinit(void)
 	    riscv_isa_extension_available(NULL, SSCSRIND)) {
 		static_branch_enable(&riscv_pmu_cdeleg_available);
 		cdeleg_available = true;
+		rvpmu_vendor_register_events();
 	}
 
 	if (!(sbi_available || cdeleg_available))
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
