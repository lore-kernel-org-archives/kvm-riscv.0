Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6EC54E90
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdK73b2p0LaLuPMw7rSx3rOCQvNHvX5tzI/LTd/tgxs=; b=kViGVWsYdIfKYf
	hye4+cfd5PEvFUhGm1tzU5MCry4uedfKk6xkly5n3d5spK5vfRgGZ8uzaU2D7qyjyRvyhoVIPo/9O
	UXThPUmNJytaIV1AOvd0FzZDdo0q9GL1p/gCEQ9ztq+GJ9K3gNfPohIjgf9xBR09ZnGsHuf5SARwQ
	1n2BTH/FmRtTYs3Y3l4G2ExQfclc9AU0qjN+EAXYxMR4bOApjA2aZfJ0VblS4qs4k9nfbhIG/+cy1
	qsG5qCZGZ13g79jqYWHqu30gfLAjBV5+9xLSzNihIWB/2YT7psYkRjTZ+F3/vER7h0hPuol5DQ/Ae
	0+/kGN0vyJoDCMQMC4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBMt-00000001zBb-2Hsa;
	Thu, 22 May 2025 19:14:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCn-00000001wNO-316n
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b170c99aa49so5601247a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940629; x=1748545429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=15cOhUxtgr6JT1fOi2aSAGwU5Bs776F72MbszXfPb/MIbDbBP9eOsy6H6hs8qqEhNK
         j8Z7yKt/rTMXThIdTLRwQhhUwWlyULliYzkxTymS+v+5LRw8pyvBjoOz4kOxJttGHUvp
         zWZVGwVI+1ITCSzt9bahA0gPefPmid6hgEw/Mr+Sdd96yo8IbNhfojV5BjT1Gn8H/feE
         VxZv5eq+5pK92fxVIMxcfGAfqD0TBwdOdEPh3SDuyjjMoC/QYNNltrpdJ7tcgJMPQAdR
         7p3Wijstp6imAQ81H34y5rLaCpXHy105Q3A44Iq2VS91IqSI7MydvQ8I4E6JRySEGre3
         MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940629; x=1748545429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=eyV/BRTD1cLboHgYUz3z4ESF1IsKKfp5ThfZJiDj6BWRDJ+7zfT/Yiz+qR1GNZj97o
         OMj0LqocTw1akGX9baBN2fbDj2umbckQrUF/1G4xDbLfht74RXb24XQL70HntUMMlNaJ
         YWzxF9xcMIW8KJlr2sMdlMCaGbRMZeopcn/QtoqgRlwy2douzebawvSszSPEyAbZm0AZ
         1mTRVLqd+axNNByRpjES0CY6cfMZyaiJP7FWN+2a8KYxhgIEHQJLc7d96g5At5xNpU7y
         yYP76wwbR8N0SrMwWPuuedrcJeOD+7SqJjN2LIpquwIaHyeqjbaLhoIXXcEOiL2wbWYe
         ZwAg==
X-Forwarded-Encrypted: i=1; AJvYcCXqUdDo/LBK4U9waEoE6t91MG40xd8qubJGdF8x6jB28hf5LhzA0096jCd14L85yLXDa+CFM8J8GN8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAVihUmNT4YNFfzeKY+5mBRzUdRUyNRCbAmDTd7w+/IIj1tOi2
	LRtnBQjiQhGNCCYQ7/0+iB/3nnDEhAvPDcgrENoy94lrb37cd66/FuEvRMIB53pqpEM=
X-Gm-Gg: ASbGncs0RHQKHKiMw6c1uevQ8v6+smgmG+AU6kpt2ogEZDojGYJOT9Skd7jYY6PnxRE
	qK2cKApD8UaS9BGVYbOQdS2lRb2NwqMAtqpjL3if5WvW5NzGZyLJ8NcovDtxtVLDMowKbDTkJiy
	6tdvPrh7na2mWSRqLAPbpKVkJlj7aL17xPqla7Ky6buNYlyZ9YcuTFvZFV8sIcFeoDq/XubFh5w
	CFbGq05LyvgioRvO8Bx6iLmBC8mVt48M1Yp2rwyhu7ChRy9kcP7FgmufeaHukunEjNCut0OwauZ
	QJM3gHKGj6qnpXeI8jC/dcEXoE6Os+LqZ0kRe0/sqaM3PdreHU8U5niaGwKwXlLy
X-Google-Smtp-Source: AGHT+IG3oxLFDfbSNt6EH0ZdTZ5dYeLSDKnP9JAmNGN1V7oKcB4sbiLpNV8c6lgFnjfD3N9PA0Fqjg==
X-Received: by 2002:a17:902:cf09:b0:22d:b240:34fe with SMTP id d9443c01a7336-231d451b294mr410839265ad.25.1747940628742;
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:38 -0700
Subject: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_120349_808984_91A1D324 
X-CRM114-Status: GOOD (  15.85  )
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

With the new SBI PMU event info function, we can query the availability
of the all standard SBI PMU events at boot time with a single ecall.
This improves the bootime by avoiding making an SBI call for each
standard PMU event. Since this function is defined only in SBI v3.0,
invoke this only if the underlying SBI implementation is v3.0 or higher.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  9 ++++++
 drivers/perf/riscv_pmu_sbi.c | 68 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6ce385a3a7bb..77b6997eb6c5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -135,6 +135,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -158,6 +159,14 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
+struct riscv_pmu_event_info {
+	u32 event_idx;
+	u32 output;
+	u64 event_data;
+};
+
+#define RISCV_PMU_EVENT_INFO_OUTPUT_MASK 0x01
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 /* SBI v3.0 allows extended hpmeventX width value */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 273ed70098a3..33d8348bf68a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -299,6 +299,66 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
 	},
 };
 
+static int pmu_sbi_check_event_info(void)
+{
+	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
+			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
+	struct riscv_pmu_event_info *event_info_shmem;
+	phys_addr_t base_addr;
+	int i, j, k, result = 0, count = 0;
+	struct sbiret ret;
+
+	event_info_shmem = kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
+	if (!event_info_shmem)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
+				event_info_shmem[count++].event_idx =
+							pmu_cache_event_map[i][j][k].event_idx;
+		}
+	}
+
+	base_addr = __pa(event_info_shmem);
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), count, 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
+				count, 0, 0, 0);
+	if (ret.error) {
+		result = -EOPNOTSUPP;
+		goto free_mem;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+		if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+			pmu_hw_event_map[i].event_idx = -ENOENT;
+	}
+
+	count = ARRAY_SIZE(pmu_hw_event_map);
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
+				if (!(event_info_shmem[count].output &
+				      RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
+				count++;
+			}
+		}
+	}
+
+free_mem:
+	kfree(event_info_shmem);
+
+	return result;
+}
+
 static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 {
 	struct sbiret ret;
@@ -316,6 +376,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
 static void pmu_sbi_check_std_events(struct work_struct *work)
 {
+	int ret;
+
+	if (sbi_v3_available) {
+		ret = pmu_sbi_check_event_info();
+		if (!ret)
+			return;
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
 		pmu_sbi_check_event(&pmu_hw_event_map[i]);
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
