Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348A7C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb73p0feX9mFXXWTwqgba2nhevfH1bQm8/sxr7AATsI=; b=vRsUeHXDK6BYxc
	5zvX9oaUhHYC0krKLNFvnTTeoJ+UalV61zhpXv4Ylker7kmP40M+5Y1WHvkjV+zcEPWPPWwzdqOxg
	/HVamymXFu+Xqu0ib0p0yFd5k0QAcGXqroqCYef+hXN00xYqx3IbE+1J2ysjACS6ZAjziSiNvqY4U
	0ipQeQ++E5/Wn+0nM1q6Y3D3O/13QB4851dfofjkO8LMFt8QJ9GWt8PauXsy8WQUubgv08ipzagum
	QWiJLZAP4+6xmpUncy6rMdsWLaJn7Zmti+tvZm3r8eSYzHD/l90sgNQJCqz7ZLDC9/cad/a1XEdhb
	GHvVz8IO67E4afhUyVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t2-0000000Ep7j-3jkX;
	Thu, 05 Jun 2025 06:15:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sy-0000000Ep3C-3doB
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3114560d74aso665131a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104132; x=1749708932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=A9ofncOWPPk4FqmPyziugPJb5GuMYRRTeNiXD0ibGCP2m1x0OalJWYOw4jgsdxD3Z+
         M6NWNe96l8z0MCOt3D4t8aB48wM9cEbMBxtrlZnOXozkLf74hTwtI9ZpryyBaYMCyQ5H
         caoPpMYESr80jpXTZovhrAs1enmZIMPH34+xjy8SGGoIKZZLnqPZvITZYFB21BPsej3s
         yFwFqnalq1oks96YkQAH+mXr+/9arw1+Fofjsju2AhEkp6yYPuk+vOCUqy0w1U8ptNKh
         Sfs/c4eol+2vBwkfYd7bdNlm6jTwo03w4rPFRx6FpHI3Vq/9qqQmiCWFZiW7WR49h4Zk
         KBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104132; x=1749708932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=XjO5PQHzt49JkGhdoPCTcUR/JaWCzunWQgIaC4vh1TOkUH/7BC8Tw1Vmg1499+/Tr4
         JbUoKLykGlHz5rzpBl59WcFsXmxDE4jnoPGW1W2BTquQ55MS1OlJ8kpCK6MjvnQuHCmd
         fkDCxgST445LkTBwKjXP9eWY3/h0ftKDbQdfOAG+6nlq31HazxFxCNv5rQRxQ6S8t478
         dgvd1KybJ/c/X8TYTERc/564TTYm5gFfCzULO65OnNdYZBkfSKuPJtCMUxGhyy36IQJH
         nFU/CAqW7EokUC2D+kV6FGS9g36zyOQfU4ArSgBHlmuu2CATOinBnw0GVJey2aobAptK
         w/sg==
X-Forwarded-Encrypted: i=1; AJvYcCV3oZPWHoWK8+WcOr/xiqJHeiOJvP2QJKljpCrss6amaTBgJPvjDvbceWEXqhTONHymeRV+cTPDc2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrOJOtGLm8NHrSwkSIbGoYXgWeoJA3IWy71TM4sF9UbRTJU9rT
	tRAaF7BNRJ5hlt0uIegDq9wV+mkOKuaEsK30rBusq37U5ylV2wODd/dbxJLdsIjhng8=
X-Gm-Gg: ASbGncve+2B2PlVxMMX0gbZCaQvWfYgwZO2OYtLgPjK0F6IvHNHc6/+g/a7NTaDAH6Q
	QoGQOm9PUW+tAI7XdhVFJzftu4LtV0jhVwoK3GMC1/01OUiWFw9wAFr7sfco8BBCgGZAPSlxh5P
	9F+cQRbIr7WPnwVGcDPjc4piocaerPRxVaA9Q0iuCvF0HZ52eQqvxFVTQGO95eOFwQafgDixlws
	KpLb+aCwl2sldHaBS/y5LLtm4qlmapRWp/s88bDMDWpe1EsMe/0b+xysEYLNy1qCblaRawPrvcs
	GpUOvd+k8xJO+jksvahVasgQNVOWY7eABxchruW9kNkGO1ZDBEmmJx+KE5jepM5+FvHRNThysSb
	4uH+6YQ==
X-Google-Smtp-Source: AGHT+IGaQDp4t9Rc9PacdM1BZZoSLCIgCU7kc4zabKe3J73B2NovkDFU1CUL1ahoIxkagRn4o+A2cg==
X-Received: by 2002:a17:90b:2641:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-3130cd2c648mr8923161a91.15.1749104132103;
        Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:31 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 07/13] RISC-V: KVM: Don't flush TLB in gstage_set_pte() when PTE is unchanged
Date: Thu,  5 Jun 2025 11:44:52 +0530
Message-ID: <20250605061458.196003-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231532_926209_3DB8FFE4 
X-CRM114-Status: GOOD (  10.05  )
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

The gstage_set_pte() should flush remote TLB only when a leaf PTE
changes so that unnecessary remote TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..d4eb1999b794 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
