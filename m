Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FE7CA0FF0
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBvmTKOLdGv9yFteprvvL+NTZinN39JRFarS6UkpKEY=; b=iFsjaOwslHqLvg
	cEgCXhm4XI55P+7N2/18TOZqd9NFx4iSUyMQsMag/FviCsFFczRitENIRBGFu5Uc68J7gdDkU7PjJ
	bW2fS3LLEklrDf5ejYm6rLGXM8PuxVIg9fBZ+rKUl0cXPchn5lnf6aK7OMS8Ho/5VurRV5DtiKH+W
	Z6H7txItjmpH84NCyI2T75OoBCdo4lfgYJNwlswCywv3kznVRmgUkaC4DjKlwN21pkOYVZfjhYG7R
	TXxbu4JV7En8EV5bv64wPwP58Mg+MK+PajbWKJSKLb2iCPWT3mcPSFbiIxB+JaGtzBQ2hDSY3mH2R
	b4v8fDMvudQ8mgDQwBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ag-00000006fho-3FPJ;
	Fri, 29 Aug 2025 18:49:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hx-0000000642u-0Gg5
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:14 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-770530175a6so1439334b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478472; x=1757083272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxbAHn2gu8hPzgAv8AKJJWeRS0gDiHkMgaOyBvCoSlM=;
        b=d2KMV8sdHhXY14CG5eEjrz40D985eO5IG389bQ1I6df4yEXFX0/0mrzbejrkyKBZpz
         K+yBFoFNrIApckaiWJt9E7nnv2EzBbpCTnfw8XijJ4sKtrlvGuZ6zuB6DOVLestZ0e4D
         5Q8IdDDMcaLS1LwFxjLHNn7eTHmw343yvAXTAotcEmjD7Qis/hTIJ7gD6YzRs10aCuuc
         z3kuzMxVhDvS+Arf0to0ivvnbonmlidT+FJTJAV5hzk3hTOIoymXeEq/DfKyy5AS012N
         OHz1OQqXoNwvMH9qiAUPA/PIlBtUSD1I5Lkd7090lVxNrfkjWQFEx811hhMY7cqJCLRu
         jYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478472; x=1757083272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxbAHn2gu8hPzgAv8AKJJWeRS0gDiHkMgaOyBvCoSlM=;
        b=TjHKdwmFVrLYrqdA+oXmn/EcuWaUbpsXPxsnkLQjdZk2pK4aOfUFwAEbLIXvOcgWvX
         X+fiLXXoSxxr+V/q9F4lgyhk0yMK2LyYXxr4d7T8mOih1tB1GNPyS6c0Pjym8+7aYw50
         G2ILnHJj3/52JBZdGKA3qU3GX6/7TdlPtT/0e5LjnVl56ClQ/WNNE7qfgpNl38OFBdK+
         4cbi8eaIVwpvpgyKjSgZ/cqrqgZPXSyhbY0mdiOAiS5KQ6/13tYzJ60RyRCISUSdDurk
         h1/6iUZ0ZOWap+1orik98APICaDBkxRdF1cmBjpAOmGA1aiaKfm1euK6t/GwxLFGZYz7
         uDKw==
X-Forwarded-Encrypted: i=1; AJvYcCVakeRU9k7INyVpXh3CoF06l8aKvlU+Fum2Qjtbsmp+SkDQGhlsjCPh36D4LlaN7l7frVBYyFlItrE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpngA/ndpuAOfSh8AcImTc2YHSVVSMBT+l+URW6wclfEkHHYeE
	j4vau7FYK8t55s6qj5zw9TjkpILEs7m1W7K92Di21GcuPPH44C9L36a8NAETRCYxjgw=
X-Gm-Gg: ASbGnct4N/uYn5KHwfIVwUeX5Y8KDnZ1hziMyrCb7FuSVmFOITzRC+jzfUR1VI+3m3H
	Axj0zKA4RFrvuME+BBZocf6ilRUCeTHF+TXnG0AYUDzXSErG89xsvWmaH93VQVbR085ZF5BXSdT
	xPBws6poWuIMMYFHb6AUuKOhzf4WFliWQtBOUG5QcExXFdPyEMDq2hXqmkA5fcYLrLEDSTeSJY0
	vc9ool9bRzaeWElu/hKrvC2lzRTpWIm+ui+1MqwXdABtwgvHxfLDD6yLzhaqUw4TKBsls1ZVlcQ
	/MwooPOGZRZMuy+3zD23hiKXnEKS63tym+I9JG+kY93yQJrjkL7vrKURaGd5kVKS4TRUrz6Wz8+
	KfJ7ky1GvqDmL1fexKU/oq+7buID4PbCUVN3WOy+8BM4evg==
X-Google-Smtp-Source: AGHT+IEcRaNRwLVZvQ0+PFDpEZBl5TqywmCgn+6HMV79ElMQ8KBIAJHpCBhlQym1EiHDUaUbZ/iP1A==
X-Received: by 2002:a05:6a20:6a26:b0:243:c36f:6a7c with SMTP id adf61e73a8af0-243c36f6f4dmr3879485637.18.1756478472441;
        Fri, 29 Aug 2025 07:41:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:05 -0700
Subject: [PATCH v5 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-4-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074113_171181_9D19EFF7 
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
index 7e984ab717c6..0800ade1d0d5 100644
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
