Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58194C87FCB
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 00:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PHYKCjt4y8J3bo+67EdYznFT1xszbiFcjvcHVf5eiE=; b=TUf8vv4SGst2o4
	p3ypQuXayj/PnagHz+iqKLARd2RCBdMymbS448ZjBNQGILsY2WcBAvJ8W0mo8qKfNfwN0E/pGs0rq
	AuN8tY32xz6tH60aNyzSeG45Fp6IYCxQavEu2WNBIkHKKNb2QfwgZ2BkAhsQNLojaJKQB6p7/UUvR
	25pqdbIrAm/uwirF/ksCh/q9HPD0WGfuYMCEEHzhSFIZYejdFk03oDfPMgkaw7TfxZpRrnoMtHQDk
	OT+4d6AdEMzRL/sbkjIVfnXsWHcPtbH3/mqsQkcmeAk9o9tqFxYmVHB4g2iBF+ltrQFwat0PBSUzr
	vuxP/VBxhk8Oweb0mHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoHZ-0000000GtdG-0TUW;
	Thu, 07 Aug 2025 00:14:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGr-0000000GGQw-11Fw
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:58 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2403e4c82dbso1537215ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510276; x=1755115076; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kcswufqwZeiVbOah5oR7VRWteUmksZlp7f05xG34s+k=;
        b=fkf07r+t95VqMQbIOIeYOp+1QSTQLdyVkG9KKQHdfwZWYxYjt/PjQj7VTZ0wrVDAWp
         8I6ifPdPaNualeMEuXKnQSKcaiSCup/E7f3oE3mvvMw+CENc9MSDaohyBwlnHJrafoso
         fDP23jqfv50TMPyNzZ5zGOwmlVsMLe58Yw9WXxf2h12gaupecPBmuNWqNs8wT0FpDREc
         hPMq2zpUEI0L6hQClmCKuWh8UGkyUbOaHIYSPB60Z/sCDv+USaZh0aACZRrgjAnZCIf+
         HSPfuunaZ5gYa3bWYUs3aH3sZglsqE8qFe4SNPkAkA/O8ksmqTwvSpMu/tWF8G1qLBjm
         4CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510276; x=1755115076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcswufqwZeiVbOah5oR7VRWteUmksZlp7f05xG34s+k=;
        b=pHR41LZUCyGLKreX6Tot/p7tMN5HagO8dDLiuF/SrWlPM6N9IoR3vEQeuBqVbwwCrv
         p3UEx3anFbOzk8/nmwmFQ+GJnfkXZGBfq/05YM20X5bO8vZuFGdwNB1H+PnmvzDW1gF3
         EIbkSR/pQq913r/xmllbE17dM2BaEIDzgRKdBGvCQsW0Bz5n6A6TEosn+GwrcHTA+Blp
         ZeCPVR5NHptVOtOSsijokohRbUWjJ73t1MDREsHR24/ZxEoNPchGYgdoVWX9r1k17BfS
         VDsLedqCRvpcnKENfDpWWZVOwYXxPbD21L1tI2FG8yG8hLqtWjEzJJfpLMGjj8pi2piS
         iQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsvrp2Osznt1gfWdHR/9odMgBqqdNsgJm3Brf8oNY3HRXW3OdP7kYkAUD80cHGIFSfR0pbtFE/rgg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/t3U+Tv7G2xt7sLCTuObBV4P51phWxTY3+DuGeeAulbJooLKY
	VOflIBCMPVjFuu+e51Ak9xUp4d0ai6d8I22dDcOtwwG/AuT0LsJgSXlWcm74McBqjCSaxWg3CMn
	0ulMVZg==
X-Google-Smtp-Source: AGHT+IE/UqkBVmIsYHo+3//+Db76eNFThoPapPb1lJatPNoq0GTt8I/qj7Zd+31YDzfBkj++w1pCOc8gls4=
X-Received: from pjbnd14.prod.google.com ([2002:a17:90b:4cce:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8e:b0:235:ef67:b5a0
 with SMTP id d9443c01a7336-242a0b3e6f7mr55163055ad.36.1754510276193; Wed, 06
 Aug 2025 12:57:56 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:37 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-16-seanjc@google.com>
Subject: [PATCH v5 15/44] KVM: SVM: Check pmu->version, not enable_pmu, when
 getting PMC MSRs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125757_310927_DA73FBDB 
X-CRM114-Status: GOOD (  13.34  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Gate access to PMC MSRs based on pmu->version, not on kvm->arch.enable_pmu,
to more accurately reflect KVM's behavior.  This is a glorified nop, as
pmu->version and pmu->nr_arch_gp_counters can only be non-zero if
amd_pmu_refresh() is reached, kvm_pmu_refresh() invokes amd_pmu_refresh()
if and only if kvm->arch.enable_pmu is true, and amd_pmu_refresh() forces
pmu->version to be 1 or 2.

I.e. the following holds true:

  !pmu->nr_arch_gp_counters || kvm->arch.enable_pmu == (pmu->version > 0)

and so the only way for amd_pmu_get_pmc() to return a non-NULL value is if
both kvm->arch.enable_pmu and pmu->version evaluate to true.

No real functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 288f7f2a46f2..7b8577f3c57a 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -41,7 +41,7 @@ static inline struct kvm_pmc *get_gp_pmc_amd(struct kvm_pmu *pmu, u32 msr,
 	struct kvm_vcpu *vcpu = pmu_to_vcpu(pmu);
 	unsigned int idx;
 
-	if (!vcpu->kvm->arch.enable_pmu)
+	if (!pmu->version)
 		return NULL;
 
 	switch (msr) {
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
