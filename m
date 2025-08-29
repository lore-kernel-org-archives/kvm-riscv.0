Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF80ECA1001
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEPdPb2ERS+iWIpVdKkoX2G8ukmRYJ2LCl0kvrtOOEo=; b=I3pz/drcYBh5Ec
	DSwxgQ0DeROgx88ZCZhH5oB2WZv4kWzEPHATaMV6WtLz8t2kSlqY5RajEX2u9lJaG6ef77Ks9hfVT
	mJ7h4HGpn/Y833rYMhqTyzq/+CQ7rvBvE5bwoU1mLQpeA4aWCC+jliOyVI1j9dGwiFzdx656onGvB
	aUTYK6C24FbOwZmcvUna569GHAqN/taemkLf8+4ygQaX8nb1SRfNyc00F4mdrgDyF9wYBDSItml4b
	OeMyOyLpK6gSHc3H0j+PUR7v7qNZcHe4OirUcYyrEjLDX14NlynrevUBfzl664azdO4NQt1WTWhPw
	jv9FZofnBlC9mNmA5Q8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ai-00000006fjh-1Xlz;
	Fri, 29 Aug 2025 18:50:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hy-0000000644D-0kEf
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-770593ba164so1760361b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478473; x=1757083273; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuhopmvMJD6AmI9ErsWAbRzYROuI1OFJgLKz4muMCjk=;
        b=eDMYssm4O9uy3M0YrIUjnDFETX9A1uBupHaKBkITKmumZhBBBymT4y357P94xO5OHZ
         N9GOxH895qtBentxnCJpY71DxmaATAhmr/xXhTRwmHwIj8IH2Cyh7OJYFcEIMeiqOI1A
         D3mEhUqfqzQE7whQW55dAvmXILMgh2yy0Qz0VP0fQgAlYGrS0yzXIZao566hlXD2EsxU
         RTRAQM2Un8EFsv4TVA0tcZBff3ykhTl7dc5tjUYSDjo/9SgkVY8jCi+t9P1uLYXa9xbF
         vxlQ+js1svx2SKQGVIbZFWXhFytRf3iz0g6lYNpvdvlETjKnTkerpEieraxCkHRByFbx
         2KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478473; x=1757083273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuhopmvMJD6AmI9ErsWAbRzYROuI1OFJgLKz4muMCjk=;
        b=iB6ZE878KCDs+he+tsBiO1iNjDoHm0UJWPxpM0vmKr83b7pSrikhDZ51EknBwj9YHO
         jHl63rnXjyIv8JD/bQeaW5cxxvJEpTf/HvtVSkqMoPHTQ/zyJUFcFTh5J6t8Q9K1LZ9S
         Tbbxn+iRIIsTwj77oskRrb9AXBbFhGrH5pVZfFSDO2OOfMjA8eFOwavGLhxICZ9brKkp
         XglyLgetwdz/Vt1DiEJk7T5HLfK2gIK/Y033LUw32nI7TA3IIyvggIttGdKpgBvLnV35
         3aY3sgHIM6gaFigloGK/lcpt5HlmVAzWSYYLWdiENOAPHhR7ta6/ICrRp14CTBtAdkzf
         zLbg==
X-Forwarded-Encrypted: i=1; AJvYcCUJMbJRTfb58a1A7A7+1AT8cdQ2T8KFsHubb0dLviaD98zqNil60zYE+wqQa6l8xV6PsLe8eqJRLUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWNvavg1qt2QreWVaahsZMVfxFobG8D4E7Xah+IXDnY91qQTH/
	IVfJ9Egcardp+ghd7AC59TYHkFx1FIoItIOqpSguTeTAcsBTUc1V24CoOaSFxH2sng4=
X-Gm-Gg: ASbGncvTp/d5AFr0ZLOOYtpirxRxBxnSemwSY9hbCzBUnXM3XvTfOVqskn82rYysPBE
	D4SlZmMZsffu7/d5biNigvoWcEDZyDBXmjI3knvXADVtoZzdXKV30em/rbFg+XlJuPj8tIiFf4P
	EobTPGFqfY5CmgA4RqbFMqQKIfZUocxmYGCQjg9fnImOnEtWN52cJ7GUC6RvymAmiXpfGwAX/Gl
	6Yv3OEAQoS/YGQOtGVHFs4nCMLG1TI2SU7O7hlOHUAwVqZwEEoCgoktSlElJLIB6yHT02IFiFZJ
	ydANTWqLvSxfgrnxeaYtvTvB+5aOxuZQDbzxlwm0mfdvZX5xFNmuR2jxetQLAToFBoVHfGhIjku
	oJ802HdJ036GmN5hKqtuCEahGjzo81GvSFD8FpAkQ/0ABRA==
X-Google-Smtp-Source: AGHT+IFKu+50yqqSOgpeLJyOFV4rCaLFVpp2RVi5iZb8Nuz83CnzQCACwKb8OL/eXwNpYfHYvSwbXg==
X-Received: by 2002:a05:6a00:4611:b0:772:3676:64d with SMTP id d2e1a72fcca58-77236761dcemr1223973b3a.27.1756478473332;
        Fri, 29 Aug 2025 07:41:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:12 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:06 -0700
Subject: [PATCH v5 5/9] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-5-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074114_281858_4AF8EABB 
X-CRM114-Status: GOOD (  20.86  )
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

The event mapping function can be used in event info function to find out
the corresponding SBI PMU event encoding during the get_event_info function
as well. Refactor and export it so that it can be invoked from kvm and
internal driver.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/perf/riscv_pmu_sbi.c   | 124 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   1 +
 2 files changed, 68 insertions(+), 57 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 0800ade1d0d5..0392900d828e 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -412,6 +413,71 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
 	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
 }
 
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
+{
+	int ret = -ENOENT;
+
+	switch (type) {
+	case PERF_TYPE_HARDWARE:
+		if (config >= PERF_COUNT_HW_MAX)
+			return -EINVAL;
+		ret = pmu_hw_event_map[config].event_idx;
+		break;
+	case PERF_TYPE_HW_CACHE:
+		ret = pmu_event_find_cache(config);
+		break;
+	case PERF_TYPE_RAW:
+		/*
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v2.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
+		 * Bits 63:62 are used to distinguish between raw events
+		 * 00 - Hardware raw event
+		 * 10 - SBI firmware events
+		 * 11 - Risc-V platform specific firmware event
+		 */
+		switch (config >> 62) {
+		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					if (econfig)
+						*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+				if (econfig)
+					*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
+				ret = RISCV_PMU_RAW_EVENT_IDX;
+			}
+			break;
+		case 2:
+			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
+			break;
+		case 3:
+			/*
+			 * For Risc-V platform specific firmware events
+			 * Event code - 0xFFFF
+			 * Event data - raw event encoding
+			 */
+			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
+			if (econfig)
+				*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(riscv_pmu_get_event_info);
+
 /*
  * Returns the counter width of a programmable counter and number of hardware
  * counters. As we don't support heterogeneous CPUs yet, it is okay to just
@@ -577,7 +643,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
 	u64 config = event->attr.config;
-	int ret = -ENOENT;
 
 	/*
 	 * Ensure we are finished checking standard hardware events for
@@ -585,62 +650,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
-	switch (type) {
-	case PERF_TYPE_HARDWARE:
-		if (config >= PERF_COUNT_HW_MAX)
-			return -EINVAL;
-		ret = pmu_hw_event_map[event->attr.config].event_idx;
-		break;
-	case PERF_TYPE_HW_CACHE:
-		ret = pmu_event_find_cache(config);
-		break;
-	case PERF_TYPE_RAW:
-		/*
-		 * As per SBI v0.3 specification,
-		 *  -- the upper 16 bits must be unused for a hardware raw event.
-		 * As per SBI v2.0 specification,
-		 *  -- the upper 8 bits must be unused for a hardware raw event.
-		 * Bits 63:62 are used to distinguish between raw events
-		 * 00 - Hardware raw event
-		 * 10 - SBI firmware events
-		 * 11 - Risc-V platform specific firmware event
-		 */
-
-		switch (config >> 62) {
-		case 0:
-			if (sbi_v3_available) {
-			/* Return error if any bits [56-63] is set  as it is not allowed by the spec */
-				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
-					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-				}
-			/* Return error if any bits [48-63] is set  as it is not allowed by the spec */
-			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
-				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
-				ret = RISCV_PMU_RAW_EVENT_IDX;
-			}
-			break;
-		case 2:
-			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
-			break;
-		case 3:
-			/*
-			 * For Risc-V platform specific firmware events
-			 * Event code - 0xFFFF
-			 * Event data - raw event encoding
-			 */
-			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
-			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
-			break;
-		default:
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-
-	return ret;
+	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
 static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 701974639ff2..f82a28040594 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -89,6 +89,7 @@ static inline void riscv_pmu_legacy_skip_init(void) {};
 struct riscv_pmu *riscv_pmu_alloc(void);
 #ifdef CONFIG_RISCV_PMU_SBI
 int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
+int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
 #endif
 
 #endif /* CONFIG_RISCV_PMU */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
