Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4118AC54ED0
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtJ9xXsE5n+m0zcAv96qSyHf+ac4Jhc1YPW4R2jH5fY=; b=F8FliT59hlH3ZE
	nETtHYysJjPoQMpcyumEIyix0DnIcPleiyxPXa32CHcL880KOB5vkIOPxtHewxMVk3DCRNcy8TUW1
	qx8Rr/EkxRI9ozPHC0BAbQtsa1l+zZ7vjnMLHGqhf1W4XH8DaafVCLbxYGD20CU/RPzQi44MBwRRU
	InJmDlKR7+OhFByiNMe0XOlSgdmH3j59BgSGM4gIVNV9xZxwn5ANiZc0OVgxVCeN9o29t/cWf9B3b
	tMaFzCMWAwtDCzluWSEzibMIFhZy0OnKwsmbtadXW0+9WuxdraOX6+JkZvL4GVfqzwo7Owt56rCmf
	3zlXYE2EsdKjO6OL6FvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBGs-00000001xrM-3e9w;
	Thu, 22 May 2025 19:08:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCl-00000001wLI-2HVG
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23205d55bf4so49317105ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940627; x=1748545427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=vrXAaMc+Gqpmm4vO+eEwg7hihLuRA02xTnuSSJvf5EEXT1h/Co2RGVtP2zopU3NR2T
         JQ6XaqqWOsvsVlhlCccFLjR6hFpnG+L7PJsaHtlhuZO0b8WEL4s40anzBuWV+bS+jZ/N
         Uiv8d2hhlKpA+FDqbZfsEWrAHCxURvtq75vv7ZHNTz3gJqKCVZh2tngUj3Gy6CmmUpKf
         LkJjN8CNvmKLVJ1+iiBX+CftIFraiQfU/nbQVsVeD4nXTO8xNU9dF3yXmlQWP8lhW3+d
         ACkCFe26D3dLHgIb5mP7tb/5ns2sqa83L5z9cX3LABI6aSd76QyX8YFUVOfweuJRf4Cx
         B8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=LHsdOmjvJHp1cbsQux5BNLr95dLBmS7K74hnzCsGUvJ+k/ggOJH109Xsd0x/PngaDa
         5lXE1FYV+ivHaMDF5xLR3fstzsIwg9Dwxw+NKtp0zM+OBb9UuLXbrYFcyFTHqRX+UnQr
         oGBLcMmlK/cLSyTXIVMuQWaLc9tFHoYNCvHfaTJUOx4Dzzia+xHY6klhTn66qc5QQRDm
         qm5+sXnwxt/Aoro5wvLnWIv7vcCiOn1lqgv6dDExDKNwkoB4JH2+wgHNRj0qhiA2YxdW
         H/jTXUgliUMEG0EWf7t3P+JeXMu2F+VkZLAaJlbeDio21oEJe5stcCMhgPK1+kJtJU8x
         wvUw==
X-Forwarded-Encrypted: i=1; AJvYcCVVZUN5R33AEBftvAo4wBia7Arr0IRWjZZnTZbmEwkDpSXEAKLKE7n29vo/KLpcPdpOR5S6P4mA2ms=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIn8pVGPaFR8SHABUq1j+p4eYMyHtzmAYchz5EvIqnKHR97nWq
	yAXQrUuL8kUgB9Vi2qEIOPuM/dUK57hA+CubC06Hy3R68TdVljNT4RKK22cvTbQz5G0=
X-Gm-Gg: ASbGnctsFvcM92AySZJIKV8U/96Iwh5Td3HEWlBc8D2rEfxC6xZ8rh4cVl6IJejjFNX
	lk/6HzS3BiuvGhqjpcOqwT+zoLiuUN4qPimrkDdgLBlBs9/BrYXuTrGjBcXR2qMvlCMMfGWtRA/
	2/aZKW42nIeG+U3C6Gji1LfaSzyVRUqM1qiQbqFLgQDouK1CcXU0UmoUDHulDY40o+y1cwVmHUx
	WEV+I7zxLmALjdfBHDvOkpnsYaEKR2qcpAMr0VGBaK0y65lsyDASMBcVz8TxarRqlRTcTIdIjWA
	cysn0tZwyFFj13lSBLENIh/yReWxTLLam2nJE1/BacX+EWlZ+gC9laiccSrE8p98
X-Google-Smtp-Source: AGHT+IFfCV//qxOe2okhTwLGpNoq8DsTJkacWkNUL4qxPXo2ylZ1GEBeSAkJ2y8sxhW9UlvW9cu03w==
X-Received: by 2002:a17:903:124b:b0:231:fc6a:9639 with SMTP id d9443c01a7336-233f23cbf73mr1605975ad.27.1747940626613;
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:36 -0700
Subject: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120347_609993_4DAFDD63 
X-CRM114-Status: GOOD (  15.69  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..6ce385a3a7bb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -160,7 +160,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -218,6 +221,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index cfd6946fca42..273ed70098a3 100644
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
+		 * As per SBI v3.0 specification,
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
