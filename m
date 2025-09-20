Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8EACAC5A7
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VyC64CH2A9MI0gIAd1r/oBoAi9YSsWU3K1h52mjJ9g=; b=fCpvqogERx7Ve2
	02jzBG/2/FE48APsLngkMGmXgankvibBnGO8mvSf1Nxpp3CoyxJmVB8cuyrhqniSvwk8KLFus9y5m
	KgMiS8OdyLIusxZl/9GOBYsWDVJMdyPm01J2f/rKh2c6duTK24++5/gQaOSEMEVQixLARaop7pZEd
	Osw54/03ubA/sH5GEHlchEVXaLRvudWDCzjSF7Nrpf5JEalM3epGXdfVUmhy9MPKC4BKvETp3H9Oa
	/0QRy7jjGAOsVAllCmA1XwAtT1Rk+kFIH5PWy7AUv6vrbENJ+T6wx39uaVO7YLYvv2Iasrsf+2mT7
	+eDjwenUI6k52rUmByiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MP-00000005tWb-0NjM;
	Sat, 20 Sep 2025 20:39:09 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04ML-00000005tQH-1jMd
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:06 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-88432e29adcso101587739f.2
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400744; x=1759005544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyclL1XhlEcYsrqgE10jIhLpC+mtwJUT0A78Decqu/E=;
        b=DYJvsgG7ULNIrNbWQrKSI3BMU5hl67ep30JQ6jBhstCnDZHYaO9/Y8+4f1wldSdbJT
         z/unSz8oSkVkHwOvkXNdtJ9h4VtVQTT3UNAkpPuGTC0yCGyk1yXgGkPMvepGIyO3etXF
         zTNL6XaUfXh/x5a6t7W16nYUu/JHpeuGKYKaw9OC73Ztl+1qbNjkWHfiPDjkfed9KLVV
         AuaQuM4oQkiKoTXtvtoNHrmOfM9QIYrcF+JUlxgRTpcyDASDHwTGEeKJQ0B0MDw7Irth
         IRC2Oi7MLlVFgXO/2aneIX61MIOVIBJZulmIPb4tdvW3E2bFUo0ivI3GQ+400qojaDNF
         OU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400744; x=1759005544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyclL1XhlEcYsrqgE10jIhLpC+mtwJUT0A78Decqu/E=;
        b=VBeZLniTxhpyGbthY5byS7d0pyUyMBhzKC1HKiZ1YHGDnPjNUGLGVIuaRwyCZlrr6U
         mVkks9wjDA1LZPziCDS3SRBSD7gi31t7JT1qOf2lg+EIEMTjn4vEOVhE1wIvvM6YnuDI
         YN22bWhLpYFeX3jqgIBP57P2wUBYn4dEam72Pet5npb6ZskrvNZ7jaWBeEyz7ktXor1m
         BXZSIDmxwZ1SDxcO6opo1Px1vbTPwpxBEbSrAurDx5+WFyK2pvRvQZH3aHfhiKTUN2a/
         DzibKU+VKafgEX5Y8j208G1m4Nkv1i0cQYbq8dufm8vZT3Au5mKjpxJcxZXlmGTGRFtr
         a7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWpJWdRKlL+ph/ZVXP/cCxaZlAvimkkwzfISO5sN3sNPL1+B9l9ix/leFo9BKirxp2pbWRLIT8h5fU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEwyqGADw2PfAxUXhmnd6hojieWta0ugYgE1ipGNjExa2y7R4
	Af/QEonX0Qny4fdW5Fv0AOiqidt+pZ8/dShCGhwa0Ije9bR69YdZChhfBasM64TK6h4=
X-Gm-Gg: ASbGncvu839qPGg7sosdAkKCV14fBj9G9XNIQd8PVQnWHPR/ItN1pSBLfroWZ0HxQwZ
	4TMA02JN9TeZ55NRDCIt3X4nX518zqEU8iWshNSWf3eDRtZRTm1mJellKHcPiChLygcWkDjT4c5
	+9QH56ZpXW9q2/IBUb+7BVfF8xludC42Dn3rP3wWDso3a+tda9DON4tGh5T0vmLI6FsYlG1EFuG
	b2M7qOdxeGxMvLCaaVNXeRFZNKyOLNePD+G00itfKxXe37yOs5t8q7USKzleV7XfOqNVOjLHrMD
	1MO4mRYFOYeBrFNQJZLGhNyOLU/sYZzk6XRZ46njIsZHjmbU5bDLZfi76S+JIBjp1/nNs1i+Opq
	XCL3Bt00Dt9ehTYV1fTkqnb0J
X-Google-Smtp-Source: AGHT+IG40gGHsXsi5eSQylQi3Zsm0ULLvlAN1CN/2lldqNCL8Ji0Ye7gijLwVVX5LjTNRaDqmRWawQ==
X-Received: by 2002:a05:6602:6d04:b0:887:788c:d345 with SMTP id ca18e2360f4ac-8addc8a1170mr1309874539f.12.1758400744491;
        Sat, 20 Sep 2025 13:39:04 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm304724039f.1.2025.09.20.13.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:04 -0700 (PDT)
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
Subject: [RFC PATCH v2 09/18] iommu/dma: enable IOMMU_DMA for RISC-V
Date: Sat, 20 Sep 2025 15:38:59 -0500
Message-ID: <20250920203851.2205115-29-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133905_476862_68B211BF 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

With iommu/riscv driver available we can enable IOMMU_DMA support
for RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 70d29b14d851..9d8c90690275 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -150,7 +150,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || RISCV
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
