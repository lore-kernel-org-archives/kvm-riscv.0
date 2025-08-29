Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A5CA0FFD
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SN4d3gQdewaoA2KXRlT++v4GOD1yeqmPXsNvq4iXb0=; b=rr/NiO6FaXetNP
	xiXJp/kFvHxUr3VCDvH4cvVL4V5/0m3dZh+Q21vTmz3LdjNNRo95ICEkVzRQJCTjpTOfLYUjz3kan
	GpEIm0tPvve/CIlOmuZQPpiTUrT2b1bUOMb2AgpZYCQ/3AkrjF8SN6R2+UhZSAr9OMCKxvbrgAklH
	L2sy2XimyteUf3/w5Dy3IBC2aV0yK11RNawSEiQN8KIwvEOXKxdR50DGKTbj6BZGP2Lh2hI8ULjQl
	N25KzgJhtYRKsJxRcrbqO1/Z61Ve/ejbDcVTGJuoNxyy6r1q2qHEdKW+gzAf1v4koCclhs2RmGFjg
	8k7O+Unn11pNdXawtq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ae-00000006fee-0Igf;
	Fri, 29 Aug 2025 18:49:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hu-0000000640n-47bR
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7704f3c4708so2608086b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478470; x=1757083270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI741R36HWDh2RhVHZyQphWWAJjaxVoQsq24GTtFdYc=;
        b=LFhPt44Jz7OUp7R4MoSZpNqqvg8P9j3l7C2ZZWaysrv1LuJfkaue7rW+zmkDXgMzst
         0KEv8uAJJ8YAIyyGvTi5NHhvJHwk0L3xUtfokeLAjKBBKjds8RtJadaKA0+mw6dSnKzR
         v1uUjnqp+fvuKuJ86CwT0jj5kkRop/3jPsF05IFZ7qDMEe5JfqMlZreplztHhEwwvlJz
         I1+Sub14ai9JnBfcF76Na5oexBZ/457sMZutTCchn4QFS37JpBesRe0tWm0sgwqRgPED
         cA4lGtDVJmv0j1zlGts3TsM5Ybs2GToteR4I32bVOmvOAUu+IP2h/XKQvVNjMgmVzr8l
         ESAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478470; x=1757083270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI741R36HWDh2RhVHZyQphWWAJjaxVoQsq24GTtFdYc=;
        b=OetgAJGZuwfB5bKY4Bwl0T6mnT5uV/k+yLV7M6tPTsnydA4xiQsYKTIwqMEcs/zaBs
         g7KjTiTC1x1yDrzZMcNakpWnUpLcpjm0mUuQ96mAM9ghbwk7mywoz6LeoQsVM7wrBpJd
         uhhpAqPynYprUycFqIijKKXzIDq0yT/jaiNPxghetoUeJ1j+GXKxASx2BbE/NO5jzHU/
         OkAo9qhKhfeoMn7uZ0g/WnpS+49u4lPHcc/uUp/a/ozpN/3owosjWvwLbog6ssffOHbG
         Z7XL8oLxKfH+3gVfn7L8qbNbB5+zkCBYgdGKsHZtnGLEOgoYRAd/u/S0v5T1QlpcKy50
         762Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqyP23hHcv5BstW4jHZIXz/iBD1ifQjtvP9QXruTER5pw0i3b/2RNkpwRQ1ASVKt+plk643odZldM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8h3xHqH4opixs4KIsmlbwRUJtbfV34ZDYfmPsdcxhlRWAsdpw
	4aWfbyWYTw0MbS3+yCHIb2d7QL3qAt1mDfhDCf0rb1XLe5OMQbZLZcXuvwGYC3ed3UQE0g0YJyz
	nlGsN
X-Gm-Gg: ASbGncsfh42pVt2dimBNvkZEKFltECFsNMxHOI6SQcK5kiyqLzB52s3kis9BLEbcND/
	Sry3bCpCP23rcgjJEi0zzOMWd5/VAWPj7dsZKb59FUtBf/oK3DCUM12V4FX+k0QLppcx9muzgLZ
	6mtHtIBQwYvgzWLvL5u9782AFyN9ElmgYIyHuMr1pf9UwVeZHqZaxAQYnuuNa7AUbrhTemmYYb3
	AABz7aDz652MY2XvVMaXnS3g3vnxKw8oQOY41z5PEm8S48uk8Tr4HFR2IXDBzlaweP1l3HxGd0Q
	b/fF/OSuLL195NPc4g7h20B3XnTlFU7KtFM+RqfD8UF7G2Xx+TVKdyFeB7aAXHLHixSzC+dPFCl
	WOZ0xsZvdOFBV28qz6jeFdMJlVGFOSjL+exgevtyMJRjfHQ==
X-Google-Smtp-Source: AGHT+IFF8VEo1uPvNaAIFv8C/+fiPXouMqAeY9Jx+FQMbKLtAKcRvd4Ch7pGF/LiqKMh1EOfkolHEw==
X-Received: by 2002:a05:6a00:148e:b0:771:f4d4:24fa with SMTP id d2e1a72fcca58-771f4d4290bmr21272864b3a.18.1756478470351;
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:03 -0700
Subject: [PATCH v5 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-2-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074111_082903_F9A5A9D8 
X-CRM114-Status: GOOD (  16.01  )
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
 drivers/perf/riscv_pmu_sbi.c | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

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
index cfd6946fca42..7e984ab717c6 100644
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
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			if (sbi_v3_available) {
+			/* Return error if any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
+			/* Return error if any bits [48-63] is set  as it is not allowed by the spec */
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
