Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E5DC7115B
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRqFFS9bQ06aJl1gHDSHAZmCyg029HjQUKss4L7z64Y=; b=RPsOjrzyHyKgkh
	obu0lQV1qGVtia4776K6V5RVBZoV/ZWs6Y6D0sGwnAyEWDjb87RCyDKHIu4W0VSBkH0uGWGOlL+yy
	qQttthNKDd+DDqKfZBcRkwQj+BJmkFMEilAfH/S1tAAiNljUhmrluYfr8rLLuYm78TbuA6LIfp8xC
	yX5awiiDTG9/KUcXrq/i4s2UHcnNHe2m1MtDk89SXTP3Xq8Dd6dC4LBjVarsRnqJ2sPUy1f35oCxF
	G4FX8TmuVrIPG/kXRQppN77+p6ATw+dAiltAUbKSuHHF3FNtBn8aGcod6H90SWJ8oQtJ2tuGopui4
	HQs9FEsQYEV132r48ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWk-0000000AEa3-2Zia;
	Wed, 18 Jun 2025 13:08:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr59-00000009xea-1uNw
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235e1d710d8so84657345ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246555; x=1750851355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=E8bP/IXvHVZltbcCQpMU+FeIcQfT7ze8RrES9xk+VtBWtRBfl+oR9Zvr4fCujEIWYx
         7O3YYCPqp6/yKj/qWQ3kNOI92t5qHm0UkaMv6THMG7QG4/qui2vcYbEvRJUHO6fNXaWV
         2a68mQW4s9vzW2sSZkjvXGWth23x/PQGRKTufFQSC8X423IhH5jD1FhjzQ9NYjxphffL
         smXsZNQ6LsAJGv2cQZzBpAwjNgTj0BG0ZehaklNSN1CltMmRiHhYTJby7LFHsihUW8M4
         m3QKxVETTIOZ2xf6xXAse7KjGByHEPUEEUCNNBH+zO5Z9QLw9sgr5uU+ZbD90MZiBTap
         zqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246555; x=1750851355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=s2pRLZ4AkH0k1uiYQZHYLlZViHxtn1j/4p3TbAW3sQ4FFzswH9UuIsR5OOFPwGnJHc
         C4H0q15Cnvk8/JGY0SfOfUyu3oqbWrtrbRoRIFWm2zFQjh85mhbJM2YE/yS1r9Pr8wtl
         sjdtwINWo+eHH7aKfwZbKuwlP6BviHq8WN+rbJd4AUFGA0383eAHn/VbPQxfX8DR1I65
         N3P3xglhHvFI6rC7ISlhxGlyH84QFIAIHmpGDaV8moKxnySwn+WB2SrnLbDdfJswwrA6
         7kSmtwIJMNFxTVJoRfowbG+KeR75bz9M3Ue1DIgMLuKMhIsj+nlk79qCvrJIJaILZBQ/
         gzXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMFO1dEJ/SkvHs8Q8i0ti8Ll+1JMUBlcgz4KFhuN6IS614kCDZpwX8ANisyBqOOJbTiHYIdn6cIJs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrOJJskgKAi6fuxMMiuwhMnWA4mRkvNUwohIphGI0FME7rYENE
	JPdNnexNh0pKrv9rMtLNEB2vVE+GPXSD2FB0ptQs8UMmHMsMaSvU+x03T2WniX+vWfY=
X-Gm-Gg: ASbGnctYH8ihcqSH1pjlyDw47680CieaY8nbUgKEKU7ZH1UWaASagMuWWXDsIb9hZrT
	xcMJxRH1Dlbda1Rjzpm9tADEmk1f1Ie5Vw9s38U6TieUPk6Pn343bYqRt6QNJMIMN9xjv+WBCoI
	3w9fPljdIA/s2Iri8ZJbufuMWPWyY1Lj9nmR52ZHvBrkfJkUDk3j66d/dZ7aklQbAH5Ldc2rVQb
	45ynF700jzBLePXW1+wDfXkcKy4vs6uC5XtqVcLfR9SHIgGs+15uA7Da1vsd+f+wl14YjBZvx2B
	+VJcWkV65RAGmcol8iJ/DDYUuLv42rsV0whnzTOuAym3j7k7sDBuxqbaICqDpYlSG9Z/yBt9WNI
	pFbOi8/9aUZfs0l1mCQ==
X-Google-Smtp-Source: AGHT+IGDxSM7ATGEf8luR6FsHBoP9Rz03O76JFYYcytYYgv6CqHzBB2u3MegIdGDixYFe2vIN2X5yg==
X-Received: by 2002:a17:902:dad1:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-2366b3de5damr236240735ad.27.1750246554649;
        Wed, 18 Jun 2025 04:35:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Wed, 18 Jun 2025 17:05:22 +0530
Message-ID: <20250618113532.471448-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043555_504916_D305080B 
X-CRM114-Status: GOOD (  11.22  )
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

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 806c41931cde..b195a93add1c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b467dc1f4c7f..f9fb3dbbe0c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
