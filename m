Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75340C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyGQqbuwCeHKU8g39+LSJyyYKB4d+77cuss2N/+st7k=; b=h8gQ+YtRBMTq0J
	ja/M4SBQHXArlyGYkEO4T3Q2ZcGncj0tMrhSQ4LaLCur28wwoSQiubmiQ5mW2grLQxuFTahyQvluc
	/TnzdsCDyQ3TCkuXpWrWDa+QSvrXp3ZVhvoBcmZYG2TR7SQZXuCQMVzvgS0aQBQ5xge8pTNv3cfQ/
	LdBD5r55UKuVA3gYGMCc2VapECmIs8ouwmjJNFU/cnh+aPe38fY3Kikng1LEkUDuseePJz6hPrfRa
	uM1wefTUsmbpmDySskF3sW/NuBa6BNsiRl3/tOl6boamTnX4IpDMwAgLJKkjCUid7Hj1D1Uv5ox1e
	hcCthIdg+Nh5Su9HTCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sk-0000000Eoow-0Soh;
	Thu, 05 Jun 2025 06:15:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sc-0000000EojT-1xYD
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3115a6db4d6so468223a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104109; x=1749708909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Iwx8NoDTniX1jxmQ6HvQXY8SuCaJi4qXxXEsxBkb4=;
        b=kli7+eUmeHPqAqFWL2UvQRuNx3MfjU27ogEv2kDSon39l4H2/FkGATTP2JJgEJQuDp
         JdpwX4UB+f7NWVmSc4Z+CMwbD7A8ZuZ3W0mT0m3cunVT+0QrZmr9+5vqjEaJLG269ssg
         PukEkSg05/i92+k1AfjkkdKS7zp6oQxpUpx1poGC+DDfyc/upQkjRpFoBK+Lc57mXpqC
         Ujbr7SYf6Sf1s45P2i+bHn+f5mIcsxElQ7xNsqED456kvQogLSViFBXR+rdAa79JVR8u
         uxpjjJYLBWQQ8qoRUWBiPcsx2K+W+UbjrMxYdzuZrTl/v2rEYKzVKxQxl9Up5jRnQnsw
         uYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104109; x=1749708909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Iwx8NoDTniX1jxmQ6HvQXY8SuCaJi4qXxXEsxBkb4=;
        b=Gs2TLpMAfkmX14ZQxH6Z4BH1t3I/3r8LPEpdWQQC22mxpEUa2QIImjylBIaX3rywyh
         1udBI1SKfGMQIf4FosFuaC3jXUj6K+bY1jm4zKEPtSUZD2+dr5OzX1sx7kwNvfJV6h4F
         uzCl+TsbHImjLmae5273hgrg44vIeMjlfVuIlBP5VsamBqutaTEWekmXEGX+39djT+MI
         9eneVevTmAzbgs78OPdqs6auiUe/dlvTbllU242wNwkx/a93NK8XzNHesdJDEbaPB2aL
         cpLkaqr/SQsYNt7ssD9SOZa8oF3CVqYefM9SJA8XNSnEpWClGnNE2pCknZTp/Bj9wYcT
         kw6g==
X-Forwarded-Encrypted: i=1; AJvYcCXGt/HYgMh3hVy2livvJiYoX2ZDoycUJEFa1IS0Sd51fq8WYDnKD0d3zhy0qtVsDA2BLxviTEwHPCs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz37CoZyw6/Df8dBb/gz/A76wA+El2Tkb4WSqPom9XC8rBUM2e2
	5DxhC5sKUENVnZ9JNj8ZtlErQ9b0bt6wdTlbMHGIevuhlCl2Xt6v36bxIR3HdMt25Ns=
X-Gm-Gg: ASbGncvVdNIAY+6u1rjPT+pweD61nR7O7b8drxFtvaHJeXMZF9/8iziiNjl1TehbPLQ
	rJ0ffkbIWtotJf2Ilr/sybWqLo7xTBPkSqH+UmlILoFaOimFVHZolQ3pwXKDh5HMaI+6LadeZFf
	wpVs0p8YkBhDJZdP+xuE/rujdIJrvkA72TCqxJJd1RlPYr/Ag5RgOvFZzsffDL1OFENcnuo7VPL
	OsV3nlqeQnuxJs21e4cI2Lml6QgwhPLdlBedc2g13Oe6fGSmt7g5OpaR7L1yP6TPIoqzvssZ8wD
	eG/2jjhaMyqxwsmQMnHWi3oS+XtY+DwDpnAXVojZ9L/En4lMh9qh/PLuOX86iM1PSrcBWqIy9uZ
	tdWp76JTR9IgwtCe2
X-Google-Smtp-Source: AGHT+IE5uPZLOAhVuqWaFE8UdeKOXIRbJ0H8KWIVX2JV+WCepOe45QIRWAIT5GZJ2vN2n4ZWB/B3YQ==
X-Received: by 2002:a17:90b:4ccb:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-3130ccf5055mr7616893a91.5.1749104109337;
        Wed, 04 Jun 2025 23:15:09 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:08 -0700 (PDT)
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
Subject: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
Date: Thu,  5 Jun 2025 11:44:46 +0530
Message-ID: <20250605061458.196003-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231510_503967_D6F743D9 
X-CRM114-Status: GOOD (  12.00  )
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

As-per the SBI specification, an SBI remote fence operation applies
to the entire address space if either:
1) start_addr and size are both 0
2) size is equal to 2^XLEN-1

From the above, only #1 is checked by SBI SFENCE calls so fix the
size parameter check in SBI SFENCE calls to cover #2 as well.

Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 5fbf3f94f1e8..9752d2ffff68 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -103,7 +103,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
-		if (cp->a2 == 0 && cp->a3 == 0)
+		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
 			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
@@ -111,7 +111,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
-		if (cp->a2 == 0 && cp->a3 == 0)
+		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
 			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
 						       hbase, hmask, cp->a4);
 		else
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
