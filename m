Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55508D59F76
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MISKiSXZYmpeXdNQSZWilsncdNI7O9ilb3MPTH4W5A0=; b=vbwAMu3mOKmrSS
	tCgZywjsIGA40nQfqipO3Ct8pnwjzIa3CL2EBNJyneoox92uf8U4BIQQxq0d6uRGGqB8XeiLDPnXS
	da3QfZMAkSGkd/Vb1hB4NYkvpg4doeh75Cs5r3oo+I0VhAYXUujI18+CCaAWKrc0ZFGAyqssKp05o
	QkBa6lNFJNMkOU/9Ek1NMQHFBCA30XE245mdYs/4Ixyk5qTXUfmd4Cmix8QaGC/5pGdbsBqevXhkd
	zxm0ATcWeLfxqsO+g3WV14dcjleVLhlAvQ6NsmfTLfFz2p0s0eDhPjN6ztVMToTYqsbhfGUAXW866
	dJhO7Nrvjx3fZFlHXJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFB-00000001idv-1qkz;
	Sat, 13 Dec 2025 15:09:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURF8-00000001id0-1TYC
	for kvm-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 15:09:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f30233d8aso16368175ad.0
        for <kvm-riscv@lists.infradead.org>; Sat, 13 Dec 2025 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765638549; x=1766243349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DV+YsCSpJyz8LU2DSgDk8rLLAaInxe4ioSw123lddU8=;
        b=HmaiN+AkciKaa3KeyA7r0kgxABpjL9TdJ0qhrjm+1Rskovt3F4ZfdD8sbzCTaaQZON
         1xBrBKSMvdjmuqu++FwJUxH0KU7BQrT3H6ZTkAeS1ZVuokxR2oI/Qy6rAveyQ3EgVOWb
         L/kfBVt/tF3OIhmGuphsKGMLV1nKAwYlz0ojOGKsFAQuepv1ErLlaRp9K0TOjvWwt8Xd
         HobhS1QEnUSO4Shk52KSwq7PZPKLLf9Jysz+wvhkkoPoiQz0V/X8M4jIdwAtup0WYI1E
         Zqkbo4iehdZS8nb788s/vt+rxoHGvlUKNE3Ibwdjz11LKN8F1dp1yAmlSBmj59Q0BSuP
         inxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765638549; x=1766243349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DV+YsCSpJyz8LU2DSgDk8rLLAaInxe4ioSw123lddU8=;
        b=k+3T9vC+C3AT6brNGGYo5wvDTm6PU6EtGfXgpYRYKNytbNcvl3X7jY3vLu4Sp9T7q/
         toSzu7fFs6RX61ETtkLdPCzflMs4khfY49vGV5jY3AWdLwVLzQv3iJallhdi6mE00zPt
         YjQiU8Cwc0uzwAkGgW8MbUFKTFmW3bXygbD8mqeLBcfuD4JSpxEJAPUbou6T6B3r3ev7
         2z9ZnzuG8rSjCnd8nkQ+BqoXjya1ExnbOyCvv4oCbbyPCFmVzVmsi+F3BbYhJEk+24lz
         HKztJejXttxkUlRId0Bqx22P5ky6Bm0cg+Tw9rz6ZCNCPA/dLwhbT1M0jGwiXk7HppcC
         heTg==
X-Forwarded-Encrypted: i=1; AJvYcCVxPkhjxtBnQiWAaTH+yN6FQpU7UKdP368BINpr1l3umHoztFLDhHi/9XLP2MJbyaEgkA0zaiaqlK4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeRRgpQ+mS5EIuD0I/EBB8hP6/mBRDG5l2wWwSsPOM2p49Yn3g
	SzORiSYrEkXhiwCOc58Y5faGnOJpQ7jc2+RFAOblPd7kLCGQQGw6XUOL
X-Gm-Gg: AY/fxX4bgU1+EokdmGPiHxOUIcC+7nHh+WNlG3nPUpsjqnWNP409E3bOm3pFBo7KDZl
	MHtrSzDQJjbhnEo7PsMoeHG96ROFx59c3rZ63xQ+CrCHUphmE/pe22acrVV81GblB8NzocPNL1z
	xpNcuF+c6JCNnSksXMk5gMivGg7J2RDyc7mU75ObgMaqjIuSeRp+4P/jfCrLMn8p9jdFThjNjgz
	Te1ZPxtFHg2be25WAWv9h7oelnnScCzv+/KLjCxToriktnsApDJWVwHhHIgIH4ATGOuqU9Eu1Sa
	ZYdqM9TwvKeUmWElnb0RtQF4WGH51YxEOrhoTLQXgnFSoOxNl1hkCIWHGH7bn4up2NU3Yd5ipS2
	ihou7tk4JoSgIQhy3jVH2DNqORFteQkAJ1UPed5B4jOjpjGgMaWMA7mm9c7g0py55pZHev5urXZ
	j7qRS8c4zLClyKx4Qb
X-Google-Smtp-Source: AGHT+IF5tvERXCT4zL1GzpqSj7FJysIN0r9EWu8eFo/hMMsmKS1TDjFNfsRwtI3jsiOKYfKWOYjI0A==
X-Received: by 2002:a17:903:2ece:b0:295:4936:d1e9 with SMTP id d9443c01a7336-29f23c7b7e3mr49941505ad.36.1765638549520;
        Sat, 13 Dec 2025 07:09:09 -0800 (PST)
Received: from JRT-PC.. ([111.94.32.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm85494715ad.59.2025.12.13.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 07:09:09 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [kvm-unit-tests PATCH 1/4] lib: riscv: Add SBI PMU CSRs and enums
Date: Sat, 13 Dec 2025 23:08:45 +0800
Message-ID: <20251213150848.149729-2-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213150848.149729-1-jamestiotio@gmail.com>
References: <20251213150848.149729-1-jamestiotio@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_070910_760915_32A2A8F5 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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

Add the CSRs and enum values used by the RISC-V SBI PMU extension.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/csr.h | 31 +++++++++++++++++
 lib/riscv/asm/sbi.h | 82 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index 6a8e0578..d5b1c7cc 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -14,7 +14,38 @@
 #define CSR_STIMECMP		0x14d
 #define CSR_STIMECMPH		0x15d
 #define CSR_SATP		0x180
+#define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
+#define CSR_INSTRET		0xc02
+#define CSR_HPMCOUNTER3		0xc03
+#define CSR_HPMCOUNTER4		0xc04
+#define CSR_HPMCOUNTER5		0xc05
+#define CSR_HPMCOUNTER6		0xc06
+#define CSR_HPMCOUNTER7		0xc07
+#define CSR_HPMCOUNTER8		0xc08
+#define CSR_HPMCOUNTER9		0xc09
+#define CSR_HPMCOUNTER10	0xc0a
+#define CSR_HPMCOUNTER11	0xc0b
+#define CSR_HPMCOUNTER12	0xc0c
+#define CSR_HPMCOUNTER13	0xc0d
+#define CSR_HPMCOUNTER14	0xc0e
+#define CSR_HPMCOUNTER15	0xc0f
+#define CSR_HPMCOUNTER16	0xc10
+#define CSR_HPMCOUNTER17	0xc11
+#define CSR_HPMCOUNTER18	0xc12
+#define CSR_HPMCOUNTER19	0xc13
+#define CSR_HPMCOUNTER20	0xc14
+#define CSR_HPMCOUNTER21	0xc15
+#define CSR_HPMCOUNTER22	0xc16
+#define CSR_HPMCOUNTER23	0xc17
+#define CSR_HPMCOUNTER24	0xc18
+#define CSR_HPMCOUNTER25	0xc19
+#define CSR_HPMCOUNTER26	0xc1a
+#define CSR_HPMCOUNTER27	0xc1b
+#define CSR_HPMCOUNTER28	0xc1c
+#define CSR_HPMCOUNTER29	0xc1d
+#define CSR_HPMCOUNTER30	0xc1e
+#define CSR_HPMCOUNTER31	0xc1f
 
 #define SR_SIE			_AC(0x00000002, UL)
 #define SR_SPP			_AC(0x00000100, UL)
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 289a6a24..35dbf508 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -47,6 +47,7 @@ enum sbi_ext_id {
 	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_PMU = 0x504d55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_FWFT = 0x46574654,
@@ -94,6 +95,87 @@ enum sbi_ext_hsm_hart_suspend_type {
 	SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE = 0x80000000,
 };
 
+enum sbi_ext_pmu_fid {
+	SBI_EXT_PMU_NUM_COUNTERS = 0,
+	SBI_EXT_PMU_COUNTER_GET_INFO,
+	SBI_EXT_PMU_COUNTER_CONFIG_MATCHING,
+	SBI_EXT_PMU_COUNTER_START,
+	SBI_EXT_PMU_COUNTER_STOP,
+	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
+};
+
+enum sbi_ext_pmu_eid_type {
+	SBI_EXT_PMU_EVENT_HW_GENERAL = 0,
+	SBI_EXT_PMU_EVENT_HW_CACHE,
+	SBI_EXT_PMU_EVENT_HW_RAW,
+	SBI_EXT_PMU_EVENT_HW_RAW_V2,
+	SBI_EXT_PMU_EVENT_FW = 15,
+};
+
+enum sbi_ext_pmu_hw_generic_event_code_id {
+	SBI_EXT_PMU_HW_NO_EVENT = 0,
+	SBI_EXT_PMU_HW_CPU_CYCLES,
+	SBI_EXT_PMU_HW_INSTRUCTIONS,
+	SBI_EXT_PMU_HW_CACHE_REFERENCES,
+	SBI_EXT_PMU_HW_CACHE_MISSES,
+	SBI_EXT_PMU_HW_BRANCH_INSTRUCTIONS,
+	SBI_EXT_PMU_HW_BRANCH_MISSES,
+	SBI_EXT_PMU_HW_BUS_CYCLES,
+	SBI_EXT_PMU_HW_STALLED_CYCLES_FRONTEND,
+	SBI_EXT_PMU_HW_STALLED_CYCLES_BACKEND,
+	SBI_EXT_PMU_HW_REF_CPU_CYCLES,
+};
+
+enum sbi_ext_pmu_hw_cache_id {
+	SBI_EXT_PMU_HW_CACHE_L1D = 0,
+	SBI_EXT_PMU_HW_CACHE_L1I,
+	SBI_EXT_PMU_HW_CACHE_LL,
+	SBI_EXT_PMU_HW_CACHE_DTLB,
+	SBI_EXT_PMU_HW_CACHE_ITLB,
+	SBI_EXT_PMU_HW_CACHE_BPU,
+	SBI_EXT_PMU_HW_CACHE_NODE,
+};
+
+enum sbi_ext_pmu_hw_cache_op_id {
+	SBI_EXT_PMU_HW_CACHE_OP_READ = 0,
+	SBI_EXT_PMU_HW_CACHE_OP_WRITE,
+	SBI_EXT_PMU_HW_CACHE_OP_PREFETCH
+};
+
+enum sbi_ext_pmu_hw_cache_op_result_id {
+	SBI_EXT_PMU_HW_CACHE_RESULT_ACCESS = 0,
+	SBI_EXT_PMU_HW_CACHE_RESULT_MISS,
+};
+
+enum sbi_ext_pmu_fw_event_code_id {
+	SBI_EXT_PMU_FW_MISALIGNED_LOAD = 0,
+	SBI_EXT_PMU_FW_MISALIGNED_STORE,
+	SBI_EXT_PMU_FW_ACCESS_LOAD,
+	SBI_EXT_PMU_FW_ACCESS_STORE,
+	SBI_EXT_PMU_FW_ILLEGAL_INSN,
+	SBI_EXT_PMU_FW_SET_TIMER,
+	SBI_EXT_PMU_FW_IPI_SENT,
+	SBI_EXT_PMU_FW_IPI_RECEIVED,
+	SBI_EXT_PMU_FW_FENCE_I_SENT,
+	SBI_EXT_PMU_FW_FENCE_I_RECEIVED,
+	SBI_EXT_PMU_FW_SFENCE_VMA_SENT,
+	SBI_EXT_PMU_FW_SFENCE_VMA_RECEIVED,
+	SBI_EXT_PMU_FW_SFENCE_VMA_ASID_SENT,
+	SBI_EXT_PMU_FW_SFENCE_VMA_ASID_RECEIVED,
+	SBI_EXT_PMU_FW_HFENCE_GVMA_SENT,
+	SBI_EXT_PMU_FW_HFENCE_GVMA_RECEIVED,
+	SBI_EXT_PMU_FW_HFENCE_GVMA_VMID_SENT,
+	SBI_EXT_PMU_FW_HFENCE_GVMA_VMID_RECEIVED,
+	SBI_EXT_PMU_FW_HFENCE_VVMA_SENT,
+	SBI_EXT_PMU_FW_HFENCE_VVMA_RECEIVED,
+	SBI_EXT_PMU_FW_HFENCE_VVMA_ASID_SENT,
+	SBI_EXT_PMU_FW_HFENCE_VVMA_ASID_RECEIVED,
+	SBI_EXT_PMU_FW_PLATFORM = 65535,
+};
+
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
 	SBI_EXT_DBCN_CONSOLE_READ,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
