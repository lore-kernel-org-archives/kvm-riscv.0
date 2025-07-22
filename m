Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3495C83F1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeFQOjgXF5XnuI1Hs8povTLUHlSkx1tqVfNLchkaEeg=; b=zXdNdZb+O65u9x
	meKFJRldW/bxiQ2ytO+jHVQiCwysEdz2HfytbJnmmVmKpnE3nRtSWRmKFpG/NTQS63ZRtcEJxhGwx
	xkj31rJz6Tg8YWJI/ZYGz9/jxs3LVEJF0iIFsw8Kih8sUUJsD7DBSkMBUIwViLA95grdXp+bpqovV
	OSUp9bJ1cg9jdRuKBC0q2PQ6T3BcJSFZ59GuoJ/5+JpJkwFDarKVU7Z1NuQ8UB3A8UZkVCv6mHVIG
	KMv6yfXidTCyZe6pworaxV+KwFcqYCgbtKa5PI2mACQHftmCVyhR7iUhZ9Clo/+Txeayx0VPzJerJ
	RG1VSmkyamDi3xqTXfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3dg-00000001Ah1-1rEx;
	Tue, 22 Jul 2025 03:26:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TV-0000000196N-3pUL
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:32 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so3241372b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154129; x=1753758929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOiuLvmg0zyyTxkdzmKKTYBl9SQzDB7q/BZgYmb7rvg=;
        b=J/9fRkYMHl5hkSEl4WNEr12REk2wwSPmTx1B/gyRie8UIV28dIMQBuJMlkBcqZvUTs
         HPEngrSlz5C/pgTUN5Te9LFXDjGtQMEVo7a2Cib33xI0kzdY9QFSGPUNJ5CjPGhx1nL8
         ZnwY9Vr7Q4UbXp32MjidH9QoUgMgOhW1j6du9yW4LXpSottC1bf5QSyXo10UJqIwtPvo
         FxI/hM2KPYONzQOLXpcny6MTzKdg5f+mRf7GstrMMLqed/cYFLZuQ9zxxbAweunIiIyX
         2oBdEnY/tvp5DuUfxE1ccUTas4uYIaL+9dnOFX1P4DwH/3sV3XMokjc4dsV5GxOn1VTg
         pKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154129; x=1753758929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOiuLvmg0zyyTxkdzmKKTYBl9SQzDB7q/BZgYmb7rvg=;
        b=vQqoS673oQR8L+4iIya6RTcPeP7+0OaYG5Z5z4n5AMkKOt3Z5WGZLUDNLT7p+qFSCc
         0XqvG0mJ8aAn5EtI/jsjaB6v6ExRcGJ0tEwMz9oVueHbbvuwc+zIPf686Sbz9mITdbYp
         g+2VxpcLhK5tNPL2ASA8jp09dWqXKAdXmv0m99fZRZ/9RbX8sDD9xrlwRJwCTfqbHIjE
         f/9ngOSNVXjsbwJwsKFD1D8nv2bmTlShRmeBeInYxUL9jXapugc9UdV2Tg155tp7tS/Q
         dLcI2tv18cMaDztCsfCo0klfnLGn3YYskVXB7QliJM8+R+XrvXQp1YKOrQvaGdaKyEhc
         P2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWzEwFLpiAOg2+4Wk1WWoEanK3jlDr1gee9Kqgr/h0UKHdmjlLEO8WctmBBZYidMvU//arYjfAwAQA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3QUbi1xe4o9oFCNyqTBq1C+US+H031dZG2uzscPfc/PDlYCNZ
	qmzTWBrl0cNTLHwc6pjEWqkmJ2cvo6QQzXNnoeJoi1GebJCq+7Ier4XwzFMN/EbG4vw=
X-Gm-Gg: ASbGncszXap3tHgzprc6BfSAiUtqehfrla/ltR4LCiqSXXnI21P/BFZtXc9b9xZ6p33
	S2WLsDa8q3P9WxPit4F9G9U3BEo/ZCi//V5+BylAbeX1ROp8XNvaP9m3XXmMZe1H+yzefYXVlt5
	QhquRNEfyFtCP8Uy03mZXyaXim46pwjQ4P+MABgjPzFne2d2uucbZNuuAq4sjzRh127R90dgk6U
	f3YvP6JTFOiNp+1TYT/BUTlBXjTqttw/w64gOKhdwcNi/pBC4HCTuRciTgLQxcsqBPt3JHvHV0C
	ffBR1MJsmRsq9ekzrcIw8F1POVIepEztcNSY0v4O5mI9pgua0rLK2NNdb1bolorUt2GY1Tpk5Uy
	TfObFG5w+9ozK1x/93oMvDdctzolOkwVD3uA=
X-Google-Smtp-Source: AGHT+IE4m/tGD4iWa8+mTThA0s1cqsabkUVocojZBeVv2a32z+xQKzcohOpb05G+cpoLAKrGJbuRZA==
X-Received: by 2002:a05:6a21:99a1:b0:233:aec3:ce69 with SMTP id adf61e73a8af0-23d37ccbf52mr3181460637.3.1753154129335;
        Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:20 -0700
Subject: [PATCH v4 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201530_114787_2C65E3FA 
X-CRM114-Status: GOOD (  16.19  )
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
 drivers/perf/riscv_pmu_sbi.c | 69 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b0c41ef56968..5ca7cebc13cc 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -136,6 +136,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -159,6 +160,14 @@ struct riscv_pmu_snapshot_data {
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
index 7331808b1192..433d122f1f41 100644
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
@@ -316,6 +376,15 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
 static void pmu_sbi_check_std_events(struct work_struct *work)
 {
+	int ret;
+
+	if (sbi_v3_available) {
+		ret = pmu_sbi_check_event_info();
+		if (ret)
+			pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
+		return;
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
