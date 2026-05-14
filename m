Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC8BCD4F39
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gjmDdVrvzvcAHLwjud52GsDwE5404ledXyrTbLjEqc=; b=onjZRryGDuA38s
	ILs9CKR1hrJ6mILHTpR13aI7zlIzh5G3HP6HL1ALC7xHj8QcQLwUDXvXZyj8h3r6X97uAsyuz+gao
	COI0J9Sat/t+Vqx49hTCrxaayRjT+eKFKAB2NGPPibAD0WmOvnAox8GxLv/aCTCws8a04k3tVgXW/
	vS99zXIopRTM5QXwRLuGfjY4aBvyqaVsJ5HtT7bB16cPvSSwMrKphCwwQhUXI9ZPhDjzx4peDWWg2
	V2ko3RR/t0xFsJ5w+SyO34ZaeOx5iLyydu4tkxpl7QAsvuVit2lqN2IbTfS8rkM8bMoNL7gMgK3m7
	O70V7YB5yavzNuywpP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzY-00000006DUK-0Xr6;
	Thu, 14 May 2026 17:37:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzV-00000006DRq-1Dxx
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:36:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43fe62837baso4356023f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780215; x=1779385015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzOXpklejgsU43guiJHt9ocv4/DBH4gkj5ecH1UKTFA=;
        b=VA8Lk4f8rPHk9W2wJuAtBYU3D5496cID4HoB07b+Wrqba9sUjJefBYwhAX65NPHrxl
         3C9nKS3tbgZXZ/iPkxidXSkQT3fdXooQhnHUvahGRFUaRzmJ3EvzAua8w79o59PupDUw
         p4tH80trC5XaGxFkDelgz1J4oTa5SX5Kk5uAKHTwkqum9LXyKynWLwm/EiiPVvzGJ0YE
         UFMxqe/YepKB9PUd/l3dlLogwJoaZLQkg5ZRK/F703qof9I1zWfCEIAaBJWTFsBMxzyo
         +dBXspv0Dc96eB1BmTj2WbUrAyfgbeCB74VZJNaeATV7Lx572YLbTVPZu6aQ9XWmwxrO
         twpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780215; x=1779385015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzOXpklejgsU43guiJHt9ocv4/DBH4gkj5ecH1UKTFA=;
        b=onhtubrHOvRECVMVdL52WIxaCk+s6lNGf5sZgdhZeBJoeJI5Ctcb6qRXhr/Y4hYIaN
         0GTLfnT3Dg/LHyQi0MK+9HWGIQC46NcFvNmebgYKVaAP0TIsZAftrS/MReUz0hcrtm5o
         d/IIM0O5qV6R9wmOSSuZEtv2sAwfBp2co4Xqoi1NkuEn4TBk+QxHBoNIl9bjNch1SZ8D
         B4yWSQY5tHBbPngidIAZuuEk9ekNGMGw6u1jP+trkm3nLMIpr3N/X5AonyY3uay+ScSF
         YGmFHN6Q3XzrVZ4gXV3IfswdRHkMKvDLn2IhVEj+0tD1F+TtNThMaHC8izcCU6QG/UDP
         mRsg==
X-Forwarded-Encrypted: i=1; AFNElJ+3gZuSNMoCwZNVW6ZRFJBN3e8NF8Bcwz8tIKXDAjVXPWi9RWIIF/1F1iE80SUpiNFXq0TaK7RNOog=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm/U87zsEUWPpmSYuwkt6uA/V3VFY7e2PHtI5hfiRh18J+VE6C
	wT0Cu4i932AvKxnE6YJ6nKESzXyriBtWTaInAxXOsemvEuTql85vG+mJ
X-Gm-Gg: Acq92OHffePvPwbu2am+Hdltnu8KAo9g612VKGwLzupozJB4sqGZIFvOjgxCPC0M8Zi
	ie5KF7T2jAnXyScpJmNdVaPjFrEM6e887MQEYPngLuCd1duNY3A+7ay8T9Oov1hWmNPLFWit66e
	8xVohysqyPjqomEiNf5/ZcAI/1QO2Vby3elDS+DHDw4hj465r0DJFEHbhafr/oWUwlnP5MFDOSS
	sUA7B63gehkTsJGYLaxYnsvgyu5TshwsoVTG7F1AifLZwLawYWhmYgYno469i/uEwnrtsHluRdK
	nEOASk92sedjhjjXsyDVDbdNLB6QHxjAuVZkVCUrhnOKGuz9CBX6fpJuIFjYdcpbm3ZcGIH/3hb
	edRK/7wj8VGCucYWc0OPQXuum6WLrd7fWdWl+s67noSXehCNtqEPKV9GdYfRigAHYCO8grCHamR
	uK3gnjczHUsjfnQdQg94ploMds2tmj9ymmdAq1NeFcCSZAXG44+ZBurnJ5fpI2
X-Received: by 2002:a05:6000:2f83:b0:43d:7883:87ce with SMTP id ffacd0b85a97d-45e5c595a6fmr80251f8f.34.1778780215294;
        Thu, 14 May 2026 10:36:55 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe222bsm6575063f8f.27.2026.05.14.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:36:54 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info OOM
Date: Thu, 14 May 2026 19:36:41 +0200
Message-ID: <20260514173642.41448-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514173642.41448-1-osama.abdelkader@gmail.com>
References: <20260514173642.41448-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103657_336854_ECBEA997 
X-CRM114-Status: UNSURE (   9.94  )
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

kvm_riscv_vcpu_pmu_event_info() returned -ENOMEM from the
SBI extension handler, which caused kvm_riscv_vcpu_sbi_ecall()
to abort KVM_RUN and surface the error to userspace instead of
completing the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 91aa0155a420..bb46dcbfb24d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -501,8 +501,10 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 	}
 
 	einfo = kzalloc(shmem_size, GFP_KERNEL);
-	if (!einfo)
-		return -ENOMEM;
+	if (!einfo) {
+		ret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
 	if (ret) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
