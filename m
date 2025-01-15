Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9591DC02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcG47If59PEZ7J7klGLVpkm44dye4MxRhWdVz+tr2m4=; b=CounMHr68WZCjg
	9HeVpZPTVx/Ecse/UcdAJMydwQJdkUcGFPmSyVopMAonKhgOJfKGlcZHHDzhmEWVsn/6cKilDvi39
	oCUD0r949Lggn70zM9qqZH5jOOkY+f7BatwrIFh+ZGtrosUw7ocJEVdBxnMgMie29BWWpiOUhSpyp
	9IM9QZxm/fcFHM0V2I6NtAsGpCzmvDvXDNSK6hZ+0+0CynacuEnRHLJe9GSdkgq6CYJHBudSjhS/s
	WgbOqwUOXWuxeuvY6+G4fVwHdYEPnxXgtl4zwGaLAtPtCwJTL4PUpOxLgZrP2sbb6wX/6X9b+jE6G
	7h7QSaQQ9OSGzoXJd6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8FS-0000000CmmN-1UuS;
	Wed, 15 Jan 2025 18:36:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AO-0000000ClBl-2iEn
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2167141dfa1so1962485ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965860; x=1737570660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC3EeyOvWf7FtpVzWoJ1Ny8l+dOUVPRncQAFsx1SwlE=;
        b=g+mU5jfYneyFqx/lBedl8NIrj0TlhFUVzlitcr1TTnDyTVwIsnioCKwwXcpB5rpTpz
         JJQ5r6PbTNYEvMYGr3DvW20F2ixOW2UydTS6RU6lWSf2B5268pB4FE47zcWMix1XnCkb
         pC0trr8tVobtIOTCSleayj2VR/QYa4ldcDCl2KEVfUje16JsDOfIxxLqio9rDCIQoeXy
         9ebiF1oQkjrrSqckffOOzj3ODH9FVgoASlIcLTOzpm5VWWXfPnlyS2aJkrGPveSvlmDQ
         TtX1SKu21baKL6vhkpTgKwEEQrqltchef/dan1s+kAb7ypT/R4j9Ve7NJPTFNoM7xLos
         E15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965860; x=1737570660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC3EeyOvWf7FtpVzWoJ1Ny8l+dOUVPRncQAFsx1SwlE=;
        b=sLrm4MQC0xqlaPodDB4qTRte7Z2jA+mbrqfDopQUZqcb26BR9mwMd1en0zHGm4X9Q9
         kmKNTku1iadtCuqo9tdpjCO1t7TbE60IOOZYINq18s1c0+01LYXuq90PL/Kq0sjBtLPp
         jH6bbSYcunCzovwoO00wqjphXawkOkcXrfUAk9iFfuZYgbOERGxD8M9L+NGeCjSs+82g
         mhHX+uNKFfH2MlA5QsshlgaUJ0zXplABRed23C16TqTfYSp1492PfwcBIjST7G/mWnDa
         hkgPnkrakuOPxAFTd2BXdecK86GWzVE6CO3xqr6XsMSAhEJKtc+Y0rIblSLT9VVM9dfa
         jKew==
X-Forwarded-Encrypted: i=1; AJvYcCXwz/Lmn8XsX42Zh8gbK0Kek3w7YntlfAHofmdS7zkXQJdCx1zm7HYiofXax1+psKCoTuJcOdsSf9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCCR2gE9RXvCF3BB6PIRTjpXCPQ3zoR3FRUkmj515NT0GD87yh
	U+gezMPwIBJctRKgfF/pqRiw6HsU3pNrJNfxDftcH8bQTV08njkYYjewYyMkDuQ=
X-Gm-Gg: ASbGncsp5Uzt5/PJc0ddwF7EYxOwP/OAVyfiw9KNVXEsgeoItiwQthHC2Bbbm8KhcHt
	h30ctBUIcNxwtJ1sMfveveyB+wgjJ0nCSoXFsP9LLC50c4W0oAbWKXRfag+FTmphwYBCpKFZoj1
	k+Dz4RldDjRgcBt5sX/z4dn/iiT37GqUvr1N67KWivre90J7f1dUb4IjBCll4yAwtqQuyYxmg4k
	gWNwDaUioTgwRRM42lP2Gx2DMl/TglFZO4mgVoj0ZAOPgAh6+hwv/HcRSX9p18zDiuNEg==
X-Google-Smtp-Source: AGHT+IH3olozIYSo4r3r15dhiFKl3/3XHwJwjdJ6AtULTMFFycwztXRXf6ddeRVzYwbOviD3YM/ZOQ==
X-Received: by 2002:a17:903:1107:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-21bf0b76a05mr61009835ad.1.1736965859902;
        Wed, 15 Jan 2025 10:30:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:44 -0800
Subject: [PATCH v2 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-4-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103100_687185_1097E2BD 
X-CRM114-Status: GOOD (  16.03  )
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
index 5d5b399b3e77..7db78c7a1524 100644
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
+		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
