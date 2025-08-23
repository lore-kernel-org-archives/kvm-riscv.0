Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF40CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7EMyRVfrgMkYN4ryM7QfPrKfido2cVbuynuvBEiIyA=; b=M0IP9qmz6BuxSm
	EGSJds9O+1T8HXXAb+VzjvSqH9mlMrOyfWNV2SJ1kNpH+gfDiGNshC6FyGGkNkI97jDYDNkLTV2qe
	P2hwdlC0EPaR0Thx0EeLimlfo8wx95WUaLkHPg66OMZA6eMhN9blhLbWbPUj9U68/3/llyqkuIbMX
	d9qQOZgNTodjdhLJ03RxdBEwPk11fpyp/15NOLhbrVXm5mCV2OuJLRQH4UFIaCynr7jewGR8d6Z7M
	6exq4s3mgwt7fNNevFdbYMt+iHYDEaQ8R2DPpoFX94khzXVq3QLsfftqPNmp1oaRWRJCDEQVMDENp
	SC7f5LpX00SjwkeIwsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFb-000000052v7-1Bhw;
	Sat, 23 Aug 2025 16:37:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqf1-00000004xPb-2KvX
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:08 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b477029ea5eso2864104a12.3
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964807; x=1756569607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxIYjoD6qGJ2CFZvAXrDV0PDdB+JeyudOZZgvLWLYX8=;
        b=o3GePfqnArwIGJRIOmEI/19+dLgKkNKkSzJgfSRv7nb3mN0vbanlBTVPxtEEaE3HVs
         CDOtirJs+VXllqIEsZ9rqGApnlrDelYJUeqvClXuhkXFrXbQOcflIv884fOgo1nCF00M
         zrIukR94VPbXPyqRKMvwgwbGVqZiNS7Afqoeal8DCdVDDSi91YFOsTITYSLgLn6dwJ4q
         3rj/WP7aj4IJ9QcFuv1nBFWQ1mybGEz45yuP2HqX8mzZZHY0wy13eE0t3kJF2NswcdhN
         5NS/fozqBihN1MX3PeiceCKEr96zs1TJ83YN2PLA/P6PH8xBdfvAJg81US6XSgoVWIay
         yy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964807; x=1756569607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxIYjoD6qGJ2CFZvAXrDV0PDdB+JeyudOZZgvLWLYX8=;
        b=QWgaPsavaX96hxlTrZRQgAlJJgxI6hzcQDLlYpPypIrsN08n6mMLzzvjqbzeotF5CM
         NHMNFlZYj4VtChp5Qf6QbcISrMgdP2fddoeDwbov7LWvljFTN72C0cDtq+p/Qoxyz/aF
         qMLjMKrDPZeNXPHTcN55uZM7qps1/tt2qIdl9Uwn4Sqq8G24A4afsoqrkCTiHgYL1Zy2
         tOAHgJ82doZuoRYYUbPDO9yu8YThccURfM3KbNWO0CmK/ivAm43jCpPtKm/+b8c30IZr
         56NqAdVX+lDzLvNR/YB72/4zrTVLap/eN4yD6jAgIE5P+CMbuTveduPDFZAgUAlBce5M
         pHug==
X-Forwarded-Encrypted: i=1; AJvYcCWZCJKduIYtCLiQy9HW2UV7jz5AiWavPQG8lkSBxiwzFf4pdbuPAM+WT0cxQqbAhUGr6OI8kLXjEaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZUgPxkCVJyegMwMOyVWKr7OUJ24Ze9Qm2RrdshC9sQ1rZQW8a
	xNYqFfOu4r4SbsfuAQkbA8vsbAlF+O1oTCdV22yDxAs88zUL4fxTIwwbINMnz0mYhS0=
X-Gm-Gg: ASbGncuKleefqIKf1Vfeqrh7LObMCJF6piqE/pDJWCgis47l5+JZsn+z9kW67q4VaaB
	CTP1WXkuEBAky/bSTeHnYx5NXd/zI5lZPo6+9cT/2dWhgai2V2iDtNgbMIiuaF++Y1OA25zCWF3
	ZBAiRwGXoRoXQLOoaBw4tatOYGJgMENqoMdYiwI2Rp0JOrRe/KvV31qkLrKjASzBKljbIfhBoZ3
	oex33bgPN0uwspEo9uAfGadgUX+jTvuUaMfOaVsgU1bnPEsSq70jplbOLn/qVO8u9kVUWV6Xkb3
	I87KGioFDGjiZjbhB+Tl4UTygwNwDAaVyFMem7Bi410p/Wpqur4jt0OX1vpPWNjb/CBEONvDlgF
	BMBuKFPJ1rWESQypkwKGIOEgsfjt5xVBhxaZVflwLYZfz9wF9X3NrtsmOTSk3DH4BOvQazClf
X-Google-Smtp-Source: AGHT+IH5FZJLOyfrOllB8g78rtlC90yaqO9Xq93Uvux/rEMgW/lp4f5ouiM5epDFAdg0M4MxVn/lXQ==
X-Received: by 2002:a05:6a20:1592:b0:23d:dd9b:b563 with SMTP id adf61e73a8af0-24340d15dcemr10004613637.39.1755964806710;
        Sat, 23 Aug 2025 09:00:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 1/6] RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
Date: Sat, 23 Aug 2025 21:29:42 +0530
Message-ID: <20250823155947.1354229-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090007_604059_9E1BA8B4 
X-CRM114-Status: UNSURE (   9.61  )
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

The hedeleg may be updated by ONE_REG interface before the VCPU
is run at least once hence set the initial value of hedeleg in
kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3ebcfffaa978..47bcf190ccc5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+
+	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
 	}
 
-	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
