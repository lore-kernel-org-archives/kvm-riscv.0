Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0037CCAC5A5
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFqUmLCpSjDASO+V2+A6Qku3bxvtf3tZp6cHSfagjA8=; b=SzP3Q8rD5m2iw+
	Pydxpyslh6a6sbscP9GsomZgi7aZ6rukxXr7qqQxlGyoYtD9Ho9tymfgoRywyY5Za6cfKbHgsxgMm
	V0oZNn/lu3NsPXZ0P/XBx37eb29WBbvjDGEBqfhDiUqObOZJKaOc7D3+/1TvU2FsOjM0G8+hwM2MW
	BrYNjBzJmLQbP0UePmDVtl3Lx6RJRdKJUL3I1FGlaalgl2dW3zCXgqSOwVo9Nmpip2ULW6CAlTZsI
	dk7ialsHFcp22fabUbel3ocFl2SmIqsNrAbOVtk45QmN/jllNkjTtkieF3HKE8EDZ5jjKontB4lfH
	deMSXv/4lW4yfXLLqtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MR-00000005tZw-1eXz;
	Sat, 20 Sep 2025 20:39:11 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MM-00000005tSJ-2ZTo
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:07 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-424b20f8b7eso4393785ab.2
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400745; x=1759005545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfEiik7U1UfCLLRy1SfBX6A4ZldZkp0tuNOLkoczFfo=;
        b=eMr5Sru0i9dZePcOhNe+UE04Ur6aQCNNStNL75AMAr1bpDcln1de/jkWVUULbWDa94
         iUeWEifv/ArpylQVcKdBzxbRS0uTtE/IuPUYYtTP87uEdnRixZq+jHWMNhMVP77FsVtC
         1xl2YQFxWLzqq8He/JUxEx2aamxkF86P0Z0v0Tc1COKhOGjH98K8y5QB1BZOreIlXc6M
         aYJuxQ+T+CM4gsl63aN3VP6mkFFH5YV+xv7Rr3Ixm8PXE+fDJEMFWfIfH+Q1aOUsnzcK
         lmDZhbFUV+vSXz9ZywM3RZHx0xckXSgya8jkrEdQnygZLlqZEycBiCGj9OrDWx9vrIXn
         EUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400745; x=1759005545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfEiik7U1UfCLLRy1SfBX6A4ZldZkp0tuNOLkoczFfo=;
        b=bX+ZsCTRsu60sYIcMsXFtRG9kHw9ri2QTXUfzeK9XrlgXST0mjMnLrEskzSIy85ZN1
         Zcm4yAEgtykHp/92sIqXUpIPxONPykZsQiXlWYB+eCci7isCOBknk6of5tcG26Pi0MCK
         FYjoqeyRVP5kVCyS5HuOtks0/LtDZGt1CE2tEuheJwCgup6YNEsJh3KG8X9p5Z2Bvyco
         5rS9WoLQQgoqsX/kYpj2VnN0lZacSwIp//qNd4B8hg4t3qOCK/Zm1LscwinRBFlOQt0z
         aiQfF4UjFPtYbFplCMtrrgzqONWQR5GkogYQEFQPagjr2rhlLw/SK3CxxwD4JLG8dgCj
         nVcg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1uQ/wHbGULWPgOJEeuT9ajJqxRRrjD1vU23edVweda+Xyax7jh22ABU4+tYXPBKbIbSs6rDBPcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQvoBVmgykvHhVxqd0ChuEMZj8Qycm9zdWxp9ebRW4FBKvt6kX
	DZgA/AbPGW15FkxvqN+DpQ5714B8jZtf/K9BZ2wtZmCrBCwu+fens3GVpyWXFC8iHCU=
X-Gm-Gg: ASbGncshidLs1utRNR8G5k1Lqf8i0+6LSL4VWoP5e0PhhFg5ieI6ZUxLxA+VlsR7bUJ
	wKNZW/1hKcvkeONuuzgZOW1u13HxB7Z4IJ9ThpnazOR/P05m2l3quGFIlUsQLbMbJYTz6sENXgq
	xvq5dwyMJE6uDTt02IIxYF3KRjTZ0W07lJfptb3v7+1QOHw0Yqgat0VfxYjT6E6e0wYRkxA7ZgT
	RqKPsjndvennIAMaxkzt5h2fFTyvyn8pUqlkklrigaLOnkW9BcQA/mt85f9kKfv0jIjBoJyBPKY
	9/uzcFWSHh2Hy/gjTs0aG6rwqD2FY4SwmVnWZpsbyP4s/seTcCltCzm3aFlsGO1A2a14g7CFkhA
	ZgsyWDNL0OPkGpJxJKDTWzIbQ
X-Google-Smtp-Source: AGHT+IE581P0AkyphXbszugWZqZNJhwWmOr5TRI9ATozw6M+qkg0V/7BRnonU41e1GD3hHsR2JSR+w==
X-Received: by 2002:a05:6e02:1b09:b0:424:69b:e8bb with SMTP id e9e14a558f8ab-42481936b23mr116504325ab.9.1758400745560;
        Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3a590fcfsm3682210173.11.2025.09.20.13.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:05 -0700 (PDT)
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
Subject: [RFC PATCH v2 10/18] RISC-V: Define irqbypass vcpu_info
Date: Sat, 20 Sep 2025 15:39:00 -0500
Message-ID: <20250920203851.2205115-30-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133906_691123_A30ED31E 
X-CRM114-Status: UNSURE (   7.43  )
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

The vcpu_info parameter to irq_set_vcpu_affinity() effectively
defines an arch specific IOMMU <=> hypervisor protocol. Provide
a definition for the RISCV IOMMU.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 59c975f750c9..27ff169d1b77 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -25,6 +25,15 @@ struct fwnode_handle *riscv_get_intc_hwnode(void);
 int riscv_get_hart_index(struct fwnode_handle *fwnode, u32 logical_index,
 			 u32 *hart_index);
 
+struct riscv_iommu_ir_vcpu_info {
+	u64 gpa;
+	u64 hpa;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+	u32 group_index_bits;
+	u32 group_index_shift;
+};
+
 #ifdef CONFIG_ACPI
 
 enum riscv_irqchip_type {
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
