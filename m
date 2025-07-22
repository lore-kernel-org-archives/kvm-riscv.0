Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E11C83F1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONVJZYYnl1jC7927hRkKLBLkA8bAAqR3KAzBIeDSW28=; b=xt7gvwYlwcfoV8
	LqIarnAE7lpwhHAGeEDk/6CGX/YxD6cfUQv2SiNR2tS597jm7UTTgHZ5ydYLsyq6QArPDDYdhLuxB
	n/I+fciSFvCzem3FbMOfSS5aqIBiZUTLhFb/edNJoOY6sb11YNKjblxvrivKpyzpWelG59+MDuTwJ
	vQfTNbO9CzNGj8g0cIEN48+5CiFTSPpIY4cljY43RCEsw7hPGdl5V4qM8+hdeq1cekKBo8JmJAOh9
	83e3GMFdFBTpjzfptJsjk8tjZFfX7WdSyraxscqNgq1332Cl4gOZaLMmLAqwxQ/EWtVAP0rIB540l
	g75sZi7WAap/PKEjC51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3gC-00000001Ayg-1epe;
	Tue, 22 Jul 2025 03:28:36 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TW-0000000197M-3zVp
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:33 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so4810739a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154130; x=1753758930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nz8h60LGers/LCMxx/FZVBLZipiol25W5EeTvz9jgI=;
        b=Bms+Dr350v8heraGpBvbF5UNrzxy+sPD6U7qqGINToGPIs68nS5+cf8ZCXL35Qr60C
         HtvGGQCLK6Z3XxqUwwiW/IPvJgqZQvYJkDqwhDHyAXk5RsoRIv/PW43qaYjCfi1bjBgR
         6IYCTkpNvYnLGvhct1HDQtYj0Ka+NTqU8NFTgwSr5wbVEnOiNtmQbVN0VMiI9bQDBlR9
         qq4uzBGvjXYk0KIWk5W5YK1SNgFteW4vRUiRVuyjxbwvOLCOUumW7ggZg7EKNkvoK42W
         lQbcO+4nzB7rGJnz8wI/RRvzH8hChfDrPJrOyxz7GemJdBilmzkX4aYCjTu0JSRRFQvA
         gDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154130; x=1753758930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nz8h60LGers/LCMxx/FZVBLZipiol25W5EeTvz9jgI=;
        b=KRrN9wIgo5zE9K08NTUAttMqwv8e8emj5cMIiUyUxrLgnXU9NjZsC9s3s6/dQUlU7b
         B01xXtF6agrogQ42V6Wamrexa3vb4uSjtHWnQSCnOQS+J6SBYHMO71eEPPe6JzeikbE5
         myZ17IiPBZPNF4LKwRWBFTX5sKqwxPiIzhV/ycmjQJ2gQcEjd3clRB5Ced7wwi7NldbX
         O4FdJPwXTi/wfc2V2gwyU45qDLWpk1dUW1fNGUTBGOjg+O0tz4Kc6SZcXbAn7DQIwLqY
         S15J4VKcpT7ulqANyIDnWeo/UorODR3xZ8LLUM4dreiiBr7VWjwOmiB9zY5CvpTk5Nvw
         BzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlnMqPoCiG/X7BTw+1j8UGM9T1h5k2sT79W8F+4KtJoVDn1DCDhx2c7ZMSIGVxi01hYz67LBp+sdU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPr0uQFuQP0OWm447txFK04LjuOVjgMpxsspwVMaAgKL3P63qh
	AFE6tlmzvpwYQYNBtfymhjzuiQotNmlTKMC1IDq1DNzKn7ylB/SlNDV9/q8sObvY5kpStSwkywA
	chbc9
X-Gm-Gg: ASbGnctv1ZPoiqQFvKWhkLdyn3vQ9tguvKMGp+KNhvKJevsySZRe4Fg/u8B6O4XdxBF
	U6kxn03imZWGnIAaNMOsqpFMmk1QWiIAdM8F9GPgZb7gi7l9n0d4e1rDq839uIQQUtnbMsDtf5/
	U5ABc3uabL++gAZw0PxrK6y8n4bb5goGqq2H+JYkyu0GcRMnNJ42ikkk2TS5jaXUjJnSB4LIKiT
	2Zl1TT3Ae86LxairZYGByDwglJaC4fjpL3EV3KDWzxwfBRAi5Fyjz3qe2ivg4cy8Qw+buhjnJdj
	5ijSPdOj3aj219fk3+kK9E3AtfN2rbScSSuap3wEcYdthXS5rh6JEz/GyiNLWcaA7KHLBKk7GWg
	refr8Cs1Wp0AKNF75fEarYcjmdA+SfQbddYE=
X-Google-Smtp-Source: AGHT+IHeCYnECMIvVJTGoFI3WdlJXM5+Krq/lzUsH6dPnZ6JduY2zNSHMUmatJU7FYEFS6JUREJreQ==
X-Received: by 2002:a05:6a20:3d8a:b0:21f:5324:340 with SMTP id adf61e73a8af0-2381366444amr37445192637.41.1753154130401;
        Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:21 -0700
Subject: [PATCH v4 5/9] drivers/perf: riscv: Export PMU event info function
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-5-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201532_566364_C56FCEFA 
X-CRM114-Status: GOOD (  20.95  )
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
---
 drivers/perf/riscv_pmu_sbi.c   | 124 ++++++++++++++++++++++-------------------
 include/linux/perf/riscv_pmu.h |   1 +
 2 files changed, 68 insertions(+), 57 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 433d122f1f41..0392900d828e 100644
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
-			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
-				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
-					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
-					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
-				}
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
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
