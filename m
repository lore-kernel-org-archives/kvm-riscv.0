Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA86BCAC5A5
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pp9ZQbycSslSQPLRREBYBJycMD2Kg8UlD0CGbGB8aME=; b=29A8Uha06enm4N
	vShEMxequNSs05t1vmi8Yk/spzR3ST/tHDHnhxvfxvOStKQT2dL5pKbHT4KdHJY0M+/dV3B+IkGfK
	hDP44M1mvWRsBOP1hg1W3/zcyryR3D5dh3IN/nFw+hA2dhq4J5T1yNOefjQ4qrddmTtvJaTJKKMCv
	2L+G1lUObZjFYleN92Bpj45KosZBO399oyPeMRU86TiiaHX5nckShye+08wftLFO3UcHvyVwjAbIc
	YSrWTyna+THO/ohJhPhqW8NkrYVSHFbWfYuGh+Wp4EPtPORGNazg8RzRf27JCTtp8p8EWIfJxd5Mt
	FV0l+DoeSwvEja9KC6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MM-00000005tSc-1pfi;
	Sat, 20 Sep 2025 20:39:06 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MI-00000005tMB-3dTz
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:04 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-425635acc4dso6653255ab.1
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400742; x=1759005542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6f7KZQEISNEv2FyFAI35jNTdGKnVk6r1+8ZxOPZeRc=;
        b=U8/S5QXPcrsBAbEN0ylxqvP9510KUqL2w12HA/RQcvgzdTMvpyFBL1ytpjHZLQUTSx
         nBoOJAutwzuOjqYaBHRJb+T/5sM7frejPdJ9KW/ekRlVUeucgR4gVa/FjnJUh/OX1/k6
         XrIDegnJhgy6iHEajCzZ54U3mfK+BYg2dpvYtwbu6S8PZlCIend/SGPxrvgHKgM0YqUA
         0QQpV/+wfzhPnVzBfImJNHNY98+5XpNLkY/C2jANYdyMnj+BoYCB220VChcf0Lnuxfn9
         kdQITQgqVzJWQOz5HfL7R+d6DDQH4LMiWRfvykmjI+agpG+C0rCG6FAmPY/WPSmnpmgl
         HwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400742; x=1759005542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6f7KZQEISNEv2FyFAI35jNTdGKnVk6r1+8ZxOPZeRc=;
        b=qAORKtLbD52pXUjeI2b3cTJkxhRySYUNlN9riaE6Hns0ksWVBsvJ9nJ3y9CXrOlve+
         qxMa+tiwFTE9vmoyO+Hn7AwKPCxtKJeNnfzaC7Oj1jL9jTxQnynSIfPJ8RVej7MdkWDm
         HJ7arvYx4VkRMJETiarVKSFCk/k1ajEbCxckzqLlEH8LHym5ux1+XCeciCQKwOIEdZvw
         jjLBJQSTGVCDTI+qDb7xwoyjUe8Mj4I2Aeb7noT84LEVx8HV14vAfTzKAPhGEecftk35
         A50diUYa70KcCeKQquk5bqYZsUOOh13ungepoQU+EAWFcqXG2RIpCuNE2f7a65TNvuv7
         YJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSDwqIz9WQ2L0mrhaMAmEXsAvsArJfG0ww8Ngq9iqRLI/6Js7469MdDmyDNVloE5IaOIP2D9Tu/6s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUjY2uPLsMIw/QBQKcwBlB2Wu5ro3Njt/YGge/DTf0AOaXm9cy
	zb5O/VcRLvSJLz392sN/8YIUmuBCiHwztkoztPj+PZUgGu0Ujd5LFbzNHo+kWH1Up2exIDsl9cD
	9Vp7wjvo=
X-Gm-Gg: ASbGncuH0QbDJyV8E0qaFfo53hwPBbrjx0+7pO5DvOsIO4a4dHHvnWaVrabfqQVjXLW
	Iqe4Hn6PY4lflk2r6o56GPOtMY1A7BmR9pi97fl2bBy82wc2z3V3GHVJOFPnjUXPVfSOjgY1BPY
	DcFGZquG+4Gi5tLr/crNQhCDtTvuksQ2WwkWzHGQ5H8QrZfGO8OyI1/l1bbkXg9yTKwvOYSJIKa
	4c1g4cqEV7c7/VzubVUTn6oJD+jTRNdf6Es0FJd9G9Dboe9rJ2g15A/wR5SRTut5wMbZzlozskw
	Pjo6ZNPbX/G9E70YMngepmYZGqlulDpiKmQAzxEUEje2u5GuxHYbvEhCxlJbhP5gDbs7c1glFpw
	T6aL4HpEQ8CA1oU31U5eqeOsH
X-Google-Smtp-Source: AGHT+IG6qvYE0BGeOGDeP/XzQJiC5ybLNPiJhBG7MlSgnnXrk46BBkVe1V+3lVgHEoHjnN1GIShpVQ==
X-Received: by 2002:a05:6e02:2188:b0:424:8c2d:ca3b with SMTP id e9e14a558f8ab-4248c2dcd57mr47940475ab.28.1758400741904;
        Sat, 20 Sep 2025 13:39:01 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5505433c271sm1648409173.78.2025.09.20.13.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:01 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 07/18] iommu/riscv: Export phys_to_ppn and ppn_to_phys
Date: Sat, 20 Sep 2025 15:38:57 -0500
Message-ID: <20250920203851.2205115-27-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133902_949528_7F2F6581 
X-CRM114-Status: GOOD (  12.47  )
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

The riscv iommu uses a specific set of bits for PPNs (53:10). Export
the translation functions so iommu-ir can use them as well.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-bits.h |  4 ++++
 drivers/iommu/riscv/iommu.c      | 14 +++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index d72b982cf9bf..d3d98dbed709 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -36,6 +36,10 @@
 #define RISCV_IOMMU_ATP_PPN_FIELD	GENMASK_ULL(43, 0)
 #define RISCV_IOMMU_ATP_MODE_FIELD	GENMASK_ULL(63, 60)
 
+/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
+#define riscv_iommu_phys_to_ppn(pa)	(((pa) >> 2) & (((1ULL << 44) - 1) << 10))
+#define riscv_iommu_ppn_to_phys(pn)	(((pn) << 2) & (((1ULL << 44) - 1) << 12))
+
 /* 5.3 IOMMU Capabilities (64bits) */
 #define RISCV_IOMMU_REG_CAPABILITIES		0x0000
 #define RISCV_IOMMU_CAPABILITIES_VERSION	GENMASK_ULL(7, 0)
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 7418e91d8edd..440c3eb6f15a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -30,10 +30,6 @@
 #define RISCV_IOMMU_DEF_CQ_COUNT	8192
 #define RISCV_IOMMU_DEF_FQ_COUNT	4096
 
-/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
-#define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
-#define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
-
 /* IOMMU PSCID allocation namespace. */
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
@@ -165,7 +161,7 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
 	if (!queue->base)
 		return -ENOMEM;
 
-	qb = phys_to_ppn(queue->phys) |
+	qb = riscv_iommu_phys_to_ppn(queue->phys) |
 	     FIELD_PREP(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, logsz);
 
 	/* Update base register and read back to verify hw accepted our write */
@@ -608,7 +604,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 		do {
 			ddt = READ_ONCE(*(unsigned long *)ddtp);
 			if (ddt & RISCV_IOMMU_DDTE_V) {
-				ddtp = __va(ppn_to_phys(ddt));
+				ddtp = __va(riscv_iommu_ppn_to_phys(ddt));
 				break;
 			}
 
@@ -616,7 +612,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 			if (!ptr)
 				return NULL;
 
-			new = phys_to_ppn(__pa(ptr)) | RISCV_IOMMU_DDTE_V;
+			new = riscv_iommu_phys_to_ppn(__pa(ptr)) | RISCV_IOMMU_DDTE_V;
 			old = cmpxchg_relaxed((unsigned long *)ddtp, ddt, new);
 
 			if (old == ddt) {
@@ -683,7 +679,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
 		if (ddtp & RISCV_IOMMU_DDTP_BUSY)
 			return -EBUSY;
 
-		iommu->ddt_phys = ppn_to_phys(ddtp);
+		iommu->ddt_phys = riscv_iommu_ppn_to_phys(ddtp);
 		if (iommu->ddt_phys)
 			iommu->ddt_root = devm_ioremap(iommu->dev,
 						       iommu->ddt_phys, PAGE_SIZE);
@@ -730,7 +726,7 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	do {
 		rq_ddtp = FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE, rq_mode);
 		if (rq_mode > RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
-			rq_ddtp |= phys_to_ppn(iommu->ddt_phys);
+			rq_ddtp |= riscv_iommu_phys_to_ppn(iommu->ddt_phys);
 
 		riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP, rq_ddtp);
 		ddtp = riscv_iommu_read_ddtp(iommu);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
