Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D890E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvBjFU4NNyObKwYWquRsuFrNvg5I2nFUnufpm/vNPcM=; b=GGKRiJhJrGL5m5
	w3+6bRgFjOG/IKnY1A5XvoLSqap5GbpMckMSt1wQc9h3VIzvD/F7pEAKXco2tc6QtDmn3uRG2GsZ5
	EZXWaajk073UBOum2+9rld6bcrcfZs2ZS1Vfwp6fwlilnEK6C8P6nQNvGzbXJ53bzFQ30a4yVJ0Tc
	9BLZRQ2IcZlRI4lR84HV/N/owUZ99cOrZt1t3k2XoslEOW6602om+UTLHGAXpiopd3WQfCUjVOz6z
	anTn+C+TrIBRgSZoZ87Gc9s9CWNr3rEj4W+DBCGHlMheUm/DhXL7MPspK/cEanz2TDJlgD0cV9Zgw
	FprOT7nNVxKMwPqrNTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqB8-0000000A54q-3mQv;
	Tue, 14 Jan 2025 23:18:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprz-0000000A07z-2lTa
	for kvm-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=; b=PR2pPn71kZkqJWtGlq+zAwaG1X
	ajS9yT/C3+gCFZdie9x885CrTP/yh8GgeV9RzlxX6HWx/BACCkeG4CP54EvqVJR2tb0zKgq28HsIB
	uA543L9SrzgoBu3lFDqFSIuIMCTUlnyYoh8X8157X0SYCHEVaISpB4e7x7lM9FxBX93ET3QaqALAf
	MLO24Wty5W0txKCIlWFZnlYxFCBPeOBEn8cPldbbtqM7CHe5wLfzOUl1XT2kseXab5cz28Rptx7fx
	SbnDlRflRjtHsXMugBovj0wz1707lRrkHhXZQA4cTFAuvMf8KUj4vGBmMEYn9g7Eo8Qv2q7fsbP02
	ttjO2QXA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprv-0000000AfqQ-1Gw9
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2156e078563so90291125ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895521; x=1737500321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=UfNp1seRDFAQ53i0PvaetrZhVSrc5JEWnP+Kil0PVGc8EeGGjxYHnggbERuuyMkCCF
         QvJgRUS3CjSrK4QfnqdOTjXGK8UhIHJqyNU0aVAD6/K+Ifw3/dyBm2NEiOYAj6y+d6XD
         08DNKBLAvTfe9sDxP4DOOpyap6+rJnxN1d9jn7b6ME/DLtSIJMUYkNU2FCJV9YxRorG/
         rK2xAfBvEyj6hJrqfVml9Gx5uCLwkxXWcCMK+VaA1J5gQlj28Hm57cnxm2rZlYGq8ZsY
         PLPJoqV+ePZc/WcVvOj3Tl6Lksf4fwgBHB80s81wEudTSdfsKLrccwT2mu010ysRWe3Q
         nLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895521; x=1737500321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSrHfq1ODaepQOo+hHypeE7yxwo5oeqvpXeWUiwKXOQ=;
        b=iahvbbL97at2U1JkZqmwdyIjAvhl3mHdc/MuZavfD3gpEH9upyEbZVshalTykSWvES
         RZmWWpQcdK35PV13Epk/HKC011Ll7BRf+PHhmsRRGE60MSTJHr0r6V6GLoeFXCF9tZwG
         BVEqKaqTA+22S2HscctTCVCOXW3I/0e9rvIm6oGC6anRBpFkGVi7rnsfcAFWrti9YPra
         EElLAOLVPFDodtatvwLA/bwngz0cCy0SMbg2Kava+LUwYuz5ika8k75MpMrqORxzoDfB
         pN9AJZZPi0l4F7EAalaXkDiLEDFRL/4pCI5CdOZJOAvaEOTf/kRYPpaTBQ0H6qfs0WwA
         nBIw==
X-Forwarded-Encrypted: i=1; AJvYcCXc0soq21IG2/Y1zidjfymhB2LQpvkyvlvIdbeLFiPIn8MR2+mYhGrCeyMuKG0sXyNxRsiedlJOMPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbntVNXp6+nCv0uckmt8uvBZSvR0+21DMU78YKwWOMwWE375jT
	0OzycAtQ7tv4fSWeLLArdnRebIkdc0Vq8WL+qhJnNi/+luNH22C7GRvSUM2m4q83yjdHsZTyJG7
	3
X-Gm-Gg: ASbGncuLZuGhQVoLZ7+RW6ZHFmvELmuY26SkgHI3J61z2yXNmsbaFCojE/mm526fv4o
	isjMAavAb9V1pPSzBrtoxuwPK3CXajdbKRFYcU+xBD23rjQ6vOQOfGrqPqh2VJx9RN73mv5E8VN
	X8sZlszow0QtmJ2KrIg0cS/E8R1qfIa3m5HZGZIuhgG/sGCD8npcuL/tBLsVwUKgf6CqbTHX4f/
	M1IjxSGQOmuGd5de9EifLHcUl/ba/B2BrZO8jSV/YTTI5KyQxIWtE9BHjof5NJQEiFzWw==
X-Google-Smtp-Source: AGHT+IGRbE9PP4sSJth3Mz+63UAwD8egHvRzP0t3VjOdXACcY1KJUtRtoWF3ulON7ndSDCLW6GT5WA==
X-Received: by 2002:a17:902:ec82:b0:216:2dc5:2310 with SMTP id d9443c01a7336-21a83fcf8bcmr435627195ad.48.1736895520852;
        Tue, 14 Jan 2025 14:58:40 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:40 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:38 -0800
Subject: [PATCH v2 13/21] RISC-V: perf: Add a mechanism to defined legacy
 event encoding
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-13-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_225844_726180_A1BD71EA 
X-CRM114-Status: GOOD (  16.21  )
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
index c7adda948b5d..7742eb6d1ed2 100644
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
