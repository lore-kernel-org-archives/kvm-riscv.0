Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F9C83F1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4B6LLtMeDTFQbh7rt2msWl132gX0RYV366I7GvO6tQ=; b=t1p4BA/gv6ZYOY
	vsGolzFMiQxqU/1JnSaLaRYJ/1xMuVZHRJCZeOPMCdML1nc7vXTAvVHlksvfhEM7s30mgg1xvV5qP
	SYuXyiu/zlqncthFQqDlSXBy6IRgTKvOGCAT+yY8bbYDK2/hp1Rty90JPkoxKGTnw4bDLSR1AVK20
	HD0zGpiGdxrSze//Iwj/dtQLPAlobiEnzrUNw9i+yaBvoHL+c6yPVbO7dvzxqj0AHVM2JfYaDz1Pn
	ImfNc0iB+np7M8l/A33xIxZG/OVn7+FoA3u9DmoNfIzLuaEeVPn9rtGf4c7tz0uf6Bs+uFmbWnJpS
	2bEp++yHfQ/Ho+KhIDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3az-00000001AKJ-2Jxl;
	Tue, 22 Jul 2025 03:23:13 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TT-0000000194T-41Rl
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:31 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b34ab678931so3592661a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154127; x=1753758927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaJ9aiB4PvqQF4lL2czHSQpu5RmdGPHGPdEr5UPHKqo=;
        b=amcQa53eCjygstr5Ccd2On9XKEqGrf30MWmpThIEiiPwNMu2lpXXiL0f2+FAJhySx0
         3PZ/AGgZari06a6Z9j5qnFUmDcrjmYwy7lsPpklm4Qv8jH6IcTZG2WvLCJOo6n0vAhS3
         K5/70ToMVZSIMrKeCW4So6WKglAcvZdIO+xQuvkQQSpLh3fAy/f389g+d7X7/mMIJ+yf
         B5VmZ+2KxibOzk2S7m041LU5rU8i1ZViNu/ap6HrYDiw/ZaYPrlwYToggGEOBivWJ4cV
         ciZimXP+H8VvFJatlBGsTdoxl25+zqUKczxNw+6yMgZZJTwzrEttJeCrhC+uGDNuTMTf
         iQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154127; x=1753758927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaJ9aiB4PvqQF4lL2czHSQpu5RmdGPHGPdEr5UPHKqo=;
        b=qD1jBaQafmdJ4XhwnH/7D/kAfEgYPMHpCriPX8bedwGRr7+8WUOdYx/vXISk4ZQjbF
         +nfrk395REd09RIbwihIfqxDbLqjE9acZiBkaxfVO8bl5G778Hb1eVxQrqYET1f5aSOt
         dFptgpWp2nKqi5OPbm7ByDMAF6XAWRHkgzVxDKTmFpKPyyBQJGnyYDetPTarcLWNAtwr
         RBjiuWEoaN9qyfn3AaCbATaCz7iTOi0Cbox2WsqGhH3XlRXXQ9i7f9ehUv7//iJqt5X+
         BsZ035Zrv0ArMyE4H04BpqqklIg8L1bblTezrZEKLrFQg/UVt2PS573MqAPISHFicOEN
         Obow==
X-Forwarded-Encrypted: i=1; AJvYcCV1YsrwgdhtIG0kPldQDpsqj/CKFFfH0mHBZZtrj10vgJC7ECXG6QLyX7xYJpBKUx4N49e0qDhaGhc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk250f77czIhXyn5JnxbbiZXoIWV2Wy2w8wcbfY2QyxWXLfabG
	it4cdik1yfrkCdAe8eheVlRkb66f/tBXvcAHtbDDz1TduC68F+G8vgYDzwdPogOf9Rw=
X-Gm-Gg: ASbGncux30AXm7B8eJoP40A3V1h+lOv0/FssqFH/Y20tMIx1wGTBKHwXY1d+HWT0SvB
	JAw4eUq0CfjwCn3zajipEcEpL2dD4cZcM67rTVCYA85cQuu67PVL54FNpNbEdO2LyfmwwzViW6r
	Rlg126y+ZWmYcKliWL/tXU5cX8zngJhi7sKI7P9F/q/ddhStN2yV0cQJ47wta6+wwbGJHROTKUD
	0cgeg2eOIL7XCeBr26feul6ByMVhAmF4oobuDQakjAHrz2BrC0IfX4SGHEYC42GmW5ZlUpRpBF2
	qPCN2TH/fjoJ+XEvAZVq7y6NASmCMJ4TAXr+Otwm+dS63RoBSGVRzdeF4AfHt+gG2CbTJWskhQ2
	FCH8Ln8goLWh9+SapkEK9aCRsTs5dz4iFCew=
X-Google-Smtp-Source: AGHT+IGF6Po1DKvJeXFzJdS6UmW3bPEOUN9x/0ZpQhlGwgu/vmfAIzOtjATRI7XYcQq7ZH2Dfk1C/g==
X-Received: by 2002:a05:6a21:a81:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-2391c92a648mr23761386637.9.1753154127264;
        Mon, 21 Jul 2025 20:15:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:18 -0700
Subject: [PATCH v4 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-2-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201528_062672_A6155EEF 
X-CRM114-Status: GOOD (  15.93  )
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

SBI v3.0 introduced a new raw event type that allows wider
mhpmeventX width to be programmed via CFG_MATCH.

Use the raw event v2 if SBI v3.0 is available.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..b0c41ef56968 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -161,7 +161,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -219,6 +222,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index cfd6946fca42..7331808b1192 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,8 +527,10 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a hardware raw event.
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v2.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
@@ -537,8 +539,14 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
 			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
