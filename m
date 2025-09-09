Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF157CAC589
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3fEr3BieQxCkgyn0LIKU2H08VxFXggfAUMOQedHt5o=; b=KsqRQsdV/EhaTK
	M09M+mcS5EXg8e9vbDxBuELN7OtFekeHiXRA2u951//rgx3jeLOVZBuTTgaEQwD7uZMKAvP9w3CPU
	u1H9gBLR3+DsI8NZup75f7UtgsG54ve8jFB80ywcvsWEiTKza4VUFL7Q2BNkmyvvD8uOYOCyolxpE
	QaCOF/1/P4ru6IOVcK8OmkrRerZcHwCFCWJxKv4B36wO86ZGLnHIuo8OTNP0jmt6EliYfYdmslQgf
	0DMmT5TmeymFTpvjNc4g3qhaBXjrd9Sf9JKuanZ+5p5dE+UNkI/i3trhoBSJBVHSWr33E43giJOlJ
	e+0RM8BQqoX6kRo7Nuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuJ7-00000005no7-0NeR;
	Tue, 09 Sep 2025 09:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsOB-000000051ss-2aZ9
	for kvm-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 07:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=; b=gWNL9KCELB5h8a7/e2rnBqUSfo
	4cbYWYSuX5Kj/Y6wbD21TYtB01Mh4HIhzMY+Nsv3MN35fssSzeeMHGAx8fj8CJGpKSswCinrZiBLj
	kMhuGUyi4PMzSoCvnH+xpTDrO81L3KYjGAtpCZZ7xtzSR/rtUHaWxz7oFVYc+M5bUjjp2kT26B1sY
	ZardZRlXk2Dhh3petW1ISIjIMPJAvrXo4+/XH11mv3QltIw7QFCNryRo1DnhoSay9WPIslJxpc44d
	nRbrnkaPY8FGUEOzTlZBCk3llkbjl5dYn+x9YLHdyy1NUfcRUg9/qWKwq3HVVX3ACQ4uvFstyzCEf
	IsR+OHFw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-00000005ECP-1HPx
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77256e75eacso4732257b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401407; x=1758006207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=;
        b=KOSo9enLZTBDg7zuA2NmE73VSi7L8ySb3xwSVEZjA+qjPf0DzTgcKLUwyNdW4UbiZ4
         f+OhWPiFvxdaPqsGQpQIPjJey8imrAzHU3YyNmImb1I+o7PwoMUj2KGS7xXHYG7fVF+Y
         Oyvf0vaiAOO98+k2ITAEzOWAavqwA1pfoY1NvE5cYTOHLPRg65pimH1gR0Le4RewEvmD
         YGEGEOWWmBitza55uXl9fNAZmlA+2eUccJlcY0zniMvj079WHAjUSWf5gmP7TQbf+g1Y
         KGCXuaWlEYc/GA4DgLpNujWoDqUSPhlMJ27fNGwSbRZwqffltrzzIfZ9pd3yvUcOhxdw
         AKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401407; x=1758006207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnmZ8NkUlTZK5sUaPCJm86+BW+WwmmyvWnWnb0ftr9I=;
        b=cMi7vekLpE4EXynTIzh7VPYpUBir+RCa2je3jXVFmOLyeCYyY98L7GXLtmSF5I3ag9
         stIGNfyIGreLnPrKTFrmwUiILkHyBXC6UDYVrzwmaW4wRN3aDB2+k9Pi+hUmZHW5VRIK
         NJRjWV6SahiaAQTbxo7CgP+gevH3otnb5l5g5plD9qHb1nndZl5R+T6VKG5q+qAAN36s
         6QpcyHYzPzT0n2fV2+cbbqoUjFs3cUNDneh+J59I9cvuLksZGvlFD/++dMrc7Rh+Yx5Z
         m5vDf936Na8zmYmFV/UI2KOv3pvX2B5rEVTjLMklopzEscsmxWpruMRwOlrVRevi+tFi
         XTZw==
X-Forwarded-Encrypted: i=1; AJvYcCVSRwjx1v+XEgkpMn6JQR93Ko3w9gpgfD8YO/7cSttvQLDqUz+sMOjQCwPyH6fSCtwLiwqnEQMWN00=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoGnVuRgq7Oi3dPtw1YgAoqax2d6h4KZixxqd7qSonb87UExY7
	cyeAH4EQLDgGVz0vo62N/6uQHX4MV34vW1tsWyytwnKge8YOiJp6e8Ad5XY/HATPmPrJRmL6uDD
	CEE/B
X-Gm-Gg: ASbGncsVl8/9xiYb+Pa3v7ydHNdjC7pf891Iuf20Y8vNJZL1IY9e2DSwztYkHaEBQWX
	Tw+r7laSG9zMYrLbwSmQAeFrk+yvLOl+3woikeeEu2t4hYgMdnppsw8JT5+hvksnqDJZfZwR3wH
	Pi0DBmlwKzXQZkrx5p5/gczEXqR5qs0TcIkH35NZ0Y09uI/haR+uIZpTaLr9mIBt4ago7/9ZJZe
	iDiKpe8M6G/GOLFLIV7uqHtP4+UHxLNRd6x0CMTs2zZEeze/bhRPNEJxCW7UxYOM+xytgDDXc+I
	LpTG+/aLuV1ReBxm1UuUohhZK8Kc1Sv28RBkMWYDPjiEjR8xZmHLmuAosVYqm0NzqAGywod5AR6
	ZvbP4tlZxYahzj8Doh3pxLHVP/pIRbKzZ2BQ=
X-Google-Smtp-Source: AGHT+IFiF52xK3MSeJlrfdLEf2QXk0FrME34XTCcy1LZr3L0VGDJ3dsrdXofGTbO3mimC4eb9yJmOw==
X-Received: by 2002:a05:6a00:1793:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7742dd1252emr12562314b3a.3.1757401406596;
        Tue, 09 Sep 2025 00:03:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:21 -0700
Subject: [PATCH v6 2/8] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-2-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_080332_934142_E5B2E70E 
X-CRM114-Status: GOOD (  16.00  )
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
 drivers/perf/riscv_pmu_sbi.c | 16 +++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

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
index cfd6946fca42..3644bed4c8ab 100644
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
@@ -537,8 +539,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
-			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			if (sbi_v3_available) {
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
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
