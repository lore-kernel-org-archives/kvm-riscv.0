Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FEFCAC589
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1FRqDCFcF6PoTtiO7MJJOSEKoGkSOoA8LizwCXGKwI=; b=vzjzmSZFAzdOrP
	nCnFIRt+oG7HQMPYpvT1BYKyic1Mzn0DeKkewD8+j5qkervIPrdySAIcMlvJCK1o9nykFqmbq5EAJ
	LTeFt8AiwGq16Rm6lVl3U3Zqw1VGW7tZrlkYANBcvIaJA/0TIEPvz81xHBaR3Wm62FSvHGGNJHeLx
	Q7Q3R9FjNIfvgvsAA1ZInVx8JHooFtRx1zu7Iq4awV2JjglD6Pxq60cRjJPJ5hdNRD3MmtqoUYPuK
	I0CNqe6cKlPGZtQlT10aiOs+8HNFlcnFoZrPskuk6LEIVPL1/4MnYE9NMCVo5uMyHPRx4lwJoawuf
	X6KUXOBmrKKxpS1UOBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt7S-00000005L76-20h6;
	Tue, 09 Sep 2025 07:50:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO1-000000051jC-1bZt
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7728815e639so2852336b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401408; x=1758006208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dRa5PaUBeFzVfA0hx3uwaou6s1gEdQIGt2dK1PIyuI=;
        b=cYRJ/4ou9nRNEmKaMZlz5ESk5zM++JLXv6CpfB9cdMyEjAukDtgXZb2BsiV4Y+0dsh
         jdtCBRP1TjS6lcs+p2KyYFyLJL/V0LWMfqlTFWBmjuwZlqhu0gchlxDCOIQhVFMiChed
         MS00Yg1p1ggNzkg7gi3hrneKDxqelcbMcanbbNq8xBHY6+Ushxd+yYZu6ezCeSx7UQGB
         l4qtlgarY04iqwy/u8di7e9lo9GcEkiAKrLRl6/Id8FpARXVhKxEdO/3gq4bI7JTQTEv
         9eNCXb9LeJYkPHWdAGb6lkzr8SRe5URdekZxXV+sy3cxuTePeKH4z4dyNsViGha9SqST
         n0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401408; x=1758006208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dRa5PaUBeFzVfA0hx3uwaou6s1gEdQIGt2dK1PIyuI=;
        b=GCu9oHNJmYIUD4HNRtzkPpIXL6k1+2UR1n59rMRCqF1NVm9Lq7wS/qyxytaLZWmLE9
         ViXBTydvqCTxNlZqjUvKFBMurC8cIUpfg7obshaQ8q/HIFk+hcumRwHJiphOCSPEHUHB
         YyBixEvS43hffXlLxNLyOcwn7qvJTwhhlv1Gw22ypD/EnTWlsPc2S3vMS0RK84E69QKp
         0aMxkTIonaqbGNEVSxmInaI2XHzwagxuLXG6pQNl+1/QSI/AOPs26Hb0chBMqKHC5p1w
         HGOd3h+EyrCqizKrfdpVfA2o0caOsfFhk89HjmyS3qLLRryJS84mrdEhoLV1qKDszC4Y
         74Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVq7I8JdbPLT5DYo7QYWETzpFyT10MorJuGFZRJs8ft3O7AZ/tDTs/zkgAZeA/MyhsB//7bPI0KRfo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi8kIK6JKPWv29kJMxDKtVLH6/VEyr4akIIc7kxO4gXebNPsTn
	kLveVeplSQ+5bGT5oqGk0JOhC7ZcbNOmSBD9OxHalUFXlkki5LKED4mHHqunvvspiHs=
X-Gm-Gg: ASbGncucGRT69PW3GgDwX8IB6CkfF7x2YdOGmev6IIgXshWJvzdfiE5GHIu2vz6Rxe9
	mXWbfY2lBKtAbb5KExzHpsSd6ZIBEEYgb/24V/dVWbqEjkAt6HBrGxLxORfD2uzqZ46UAcHShgP
	vGs6J6+pwseQ9iddFrr0znqK0GILX6NzwkyAHYtpescMABbGNzD8TsKW4aoluAhiedxIbaHiniN
	8tVPooEPta1bx6i0i96h9ISZvYVxw7n2zSCIbuKt5MFRiYPrtR5jw451QRWkLG1Km8YNvUkaJCJ
	uuS8K+EJRwhDkhEfA0IvdlA+kbAZ6L9eHdqPcjjEU3BnIHIEvs3L3wsWdtQOYi4hl2qm+I2VZQv
	1CsFYhIU+Mj4VKSfJYom6zo9l7fzS1ebxDoU=
X-Google-Smtp-Source: AGHT+IHQ7m+RNx+VZbx6+x5n6qPiRRjPXoeUDxkNH4USJJaxaAIcWa8rdFoCF9FteEtF09OaqEBqIw==
X-Received: by 2002:a05:6a00:23d3:b0:772:7ddd:3fe0 with SMTP id d2e1a72fcca58-7742dca7ec3mr13266216b3a.2.1757401408326;
        Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:23 -0700
Subject: [PATCH v6 4/8] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-4-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_000329_486283_31029504 
X-CRM114-Status: GOOD (  16.35  )
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
index 3644bed4c8ab..a6c479f853e1 100644
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
