Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E16C02192
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOWkvHHoW4pLbIXNjfQPE8E+O2ji3BVrbgKxOVCav/E=; b=ftaJ6h9ql/hFZh
	rW852/OmiZrmz08IdeUXer0UnxCCcaCSNT0odWeEgztHRGZgcAowyZbBCCes1X3pHIJRO0D8p78Cd
	ds1F1IHRWoBHfrxkQuSuHvvhlPB/VglsQN8PuHNkaH33Uo6isziQbhfWUea08iXUahejtVz83Z943
	i6j2J0wtUcXZmRC6HTqnm0BAJcS7m4pHjo9Qd7080hULUm5SD8pmkG0MvLU3lA0NuI4G+6DUtdHRC
	Gkit8722ZvdM6lJQ6cE6Cqrsx+61KY3ipo2BaG2fxtfjcbHjLCJXb8OfWh/tWixv3mrVRwnz7tKlq
	r5Uf+qieC22wufC5gaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdyg-000000048jD-135Y;
	Tue, 28 Jan 2025 05:17:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhu-000000044hr-0wXs
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2efb17478adso8844180a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040414; x=1738645214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6U8xZqyjao8QAwlfpahdSahI9u3EBcxYiljZLY35B4=;
        b=wZ7uzwmGevafDIU+wKAf9+g8q6nbgZ+x7p8G0Zspro4KD8se8PPqZayXqy9Ybibg0R
         vSKgmKmmbT+yt3uJNIxGj14VE0le/Y8D4qo1FVotL9ZzJJh0BXErXIQWP9LJCEDg1Nzo
         5azGrmY+OVoEMkEX9MxRsDyMVtxWsm2oEVtutS+drgNs+SZ0C+HpI13vkChGLp1GEaYe
         NBtWr7mMLQpKb3xHsb9pwADRrYRa0UvEEq/nVrVX8sJDABqksSdCf7qdjOm6X+IRPH2a
         ruC7QU4dOdup66zofBmPyu91cKSG/fx1NplxRbKKUgQ42ULy0BBW/2RtUy9yhNi1ewB5
         bT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040414; x=1738645214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6U8xZqyjao8QAwlfpahdSahI9u3EBcxYiljZLY35B4=;
        b=WSnkcafdXLf9gIsl3nY3Ili1ZxDG5WTbrh58ybFPTJpZbkT8YSwJXbXj4KIWhtW+8X
         jmUGMsSrmO5yFQal3xj9RVf0Y13jM9MvrgfJQAk6ddRItbRdvz+7eppZMojTb5u2EdrH
         c8qJ0cx7bN/7Fqwn5xHnMQRa72anPu7iN9/VDPA7uoAppdNdwG2iGWwK8RBKmT9fCkD4
         /BPNz8pdewD1V1yxKQOU+Q2eTX6oQa0ElDJ8nbv/w9Ystxp6/9pJYH8BAvou/qpPut2w
         mp+hm+dgZKilXC63RC3NwUIR+DaJx30tU0lxWF13RIDUA7YcxRjmkDgNwk5dBWq2MTnN
         rMWg==
X-Forwarded-Encrypted: i=1; AJvYcCWooIvRFqWK2kdtMPDL+D4ZkE+eikf4a7ImQMXNZ53UWOQPu5t0W65WRvRhIOGmuG5/hx60SSn00nw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV1TOsrxYw2Spp5NPbc7xAPlZ0zT/I6pDWnbPcCWdyBqpDQhvP
	BNGuHFGe0pbxi06g7eD1rCssuQCzrK4puYvMdx4z6dHBk8FG7ZlXNRg7qpufAHv14P+xy4foW9F
	jfcQ=
X-Gm-Gg: ASbGnctWCb+RMHQUAjppJlkEjN3+qRWx2OVujlj7/i1Y+kuBXqOnZBMIICVlRpI23SZ
	/47HRTYQONS0YnjN3NCCWJ4ofTUR6npODVidHRpr3bFdvLbTHPRIW70oOw6fqi/OX/Sde3UoREy
	eglfQc3G5C40/nzMxPcNb+NqdJO8I5h9yGzHHrvrOpGNXXT03WFBwnFB6ieiotk6kmQswTpcPiN
	DDmDgnygjCS4nilc244UeU9DvrDFgIFJtXJ1b65Bojv1J+Cgw7ZiCnOaVeHvbnLglQgE+c4j2Ff
	lWRsnurK1nUxQGgZgbJ0XmCXLjr8
X-Google-Smtp-Source: AGHT+IFgdohYqccPp8BM6+1NKCY6Ks2M+aFjD71kBC5/Uka5+FjgMiLBaROCKnbBuozTYd+KOO+EXw==
X-Received: by 2002:a17:90b:524b:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f782c9846fmr65179131a91.15.1738040413684;
        Mon, 27 Jan 2025 21:00:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:56 -0800
Subject: [PATCH v3 15/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-15-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210014_390065_0CD6F8DF 
X-CRM114-Status: GOOD (  17.62  )
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
 drivers/perf/riscv_pmu_dev.c | 49 +++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index e075d0d15221..52d927576c9b 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -410,18 +410,22 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_map[i]);
-
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_map[i][j][k]);
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
@@ -1524,9 +1530,8 @@ static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
 	config1 = event->attr.config1;
 	if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
 		return rvpmu_cdeleg_event_map(event, econfig);
-	} else {
+	else
 		return rvpmu_sbi_event_map(event, econfig);
-	}
 }
 
 static int rvpmu_ctr_get_idx(struct perf_event *event)
@@ -1944,14 +1949,16 @@ static int __init rvpmu_devinit(void)
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
