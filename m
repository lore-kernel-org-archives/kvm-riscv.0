Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA0D3ABC4
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCaExB30bk4mA3pW9pylSlhZCHVtG0aQuWNaDeYGDdc=; b=isGuKoYUWQ7l/m
	yzf2D/v48JOhLhWsnKUiEbIgd3bVqJXpGzXVv5n5/6TQKmQ7rZhEYm3nim/S2JZ7XRlfwps1d4VWp
	mNATpkg5j94qN8ZAfrtzyGFdfP+HsBp4cUQjPWaiwUoVgid3byovcHFV9wt4XrFuaR4c4tgEFN8Wa
	J2kvwE7f1HAkOgBCmZOmkzQaLR5+Q+jJzmsFTKAqc9rb4VfOgC0ykZP4J3h0R+5g9denJey91Hvgy
	xSTYdAtdTdc9zxHSstzUfsHH0zpN+cOJ2eCkfP/ydw8z7BFJDLJWS1O7RM1cxN6K2pEkt1DJRT3YC
	CAeLh6vkmZh+Cw2Umh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1u-0000000AIaY-1gNb;
	Sat, 06 Dec 2025 00:20:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0S-0000000AFl2-3AOO
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so4794211a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980315; x=1765585115; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YVw2IrEv6dj1lN2Egcfs+/+7XHiKcsFRJtntJAtFFMc=;
        b=d1aDRN2nhaDWp0FsHLmffZ0QM/0xRWbRS7bEapbMWM+gSvuD47oD0g+RdLVObwHM0q
         WE+c0SEZosLN3LPvTMiM/LIsmdPgh8uGZXeK9irQeVwMlYUSKNXtGhveUOO03JNC2MmJ
         cYo+A1Fhhn68q7uQ0RvY/L1vt7Bf2LbikED+KjR07dlTsF7wk31nKrKfDlhVPe9gER/t
         zh0BTZzm2YNwuz7jr8G6rMyJdtFRBUttgJosF2Kgw79BNvVmDn70vsypTCAzTX8piwbE
         HMwYWJpAkLJbzxeQ4TDeo1CnM/pPy3ClCBLlvAhqbQmVpNOC6tbxTD90fuLGIK8TxBRO
         3O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980315; x=1765585115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVw2IrEv6dj1lN2Egcfs+/+7XHiKcsFRJtntJAtFFMc=;
        b=p2hg6AP8s3jEOtucBA8ZlAQkGURlBx57ib/8GWwXRFxIBI8bepXm5XM+xBqTjBZKoM
         XUmprQ0ckF38sCZV/g4PqsOQv0B6PSeSI5+hHAPdjDysteeLc3mX4I3DYRTWsb2qSQhk
         jVPLavhDyt8l05O+Z2ctsPUbW5BDeAT7NPOJ1yFMqafhuT2ayuFeS3E+nF2P615mqCzB
         Sm8FEZMR7CCISCq06F3ayQpFBh78P6ouGf4BvPCWN2nFabjTwW/9kaMHGklfSA4m3HIb
         DQegCZC23XTdbumlh/0jDHrK4He4Zsr+XF2L4t1T9SXd0srV6RcAsgcIMuKi+WmHQ9eg
         rq1w==
X-Forwarded-Encrypted: i=1; AJvYcCXDc9eK2GZGyz1hv0mO4Nb3JMsoYPW/aCMfsXx82AHt8au2/RQKPxSEjsDylX/gWsovlkmvACE9amo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBU8fMGzdL4ifM4llv0UmvFt3TwyphRPUw2ijin3n2pE5wZxSm
	VFo54x6ygFIB9lJ0gOdKR9mkS5pSIlf4xOxkimOIFH57V86WbXRhAnjedc4Z0uXiVUgb3uRI5k3
	NEDWcPQ==
X-Google-Smtp-Source: AGHT+IH5qbAxlC2vbzunodq4KUrEtCHMXaoxZK4q8nETSOlwObwaBJfEq5OV6dsDt0Oyzwdbj6cNRcmYmOA=
X-Received: from pjbfs2.prod.google.com ([2002:a17:90a:f282:b0:334:1843:ee45])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec7:b0:349:9d63:8511
 with SMTP id 98e67ed59e1d1-349a25e3b79mr670940a91.25.1764980315199; Fri, 05
 Dec 2025 16:18:35 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:10 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-35-seanjc@google.com>
Subject: [PATCH v6 34/44] KVM: x86/pmu: Elide WRMSRs when loading guest PMCs
 if values already match
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161836_908915_8D397E01 
X-CRM114-Status: GOOD (  11.36  )
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

When loading a mediated PMU state, elide the WRMSRs to load PMCs with the
guest's value if the value in hardware already matches the guest's value.
For the relatively common case where neither the guest nor the host is
actively using the PMU, i.e. when all/many counters are '0', eliding the
WRMSRs reduces the latency of handling VM-Exit by a measurable amount
(WRMSR is significantly more expensive than RDPMC).

As measured by KVM-Unit-Tests' CPUID VM-Exit testcase, this provides a
a ~25% reduction in latency (4k => 3k cycles) on Intel Emerald Rapids,
and a ~13% reduction (6.2k => 5.3k cycles) on AMD Turin.

Cc: Manali Shukla <manali.shukla@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index cb07d9b62bee..fdf1df3100eb 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1314,13 +1314,15 @@ static void kvm_pmu_load_guest_pmcs(struct kvm_vcpu *vcpu)
 	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
 		pmc = &pmu->gp_counters[i];
 
-		wrmsrl(gp_counter_msr(i), pmc->counter);
+		if (pmc->counter != rdpmc(i))
+			wrmsrl(gp_counter_msr(i), pmc->counter);
 		wrmsrl(gp_eventsel_msr(i), pmc->eventsel_hw);
 	}
 	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
 		pmc = &pmu->fixed_counters[i];
 
-		wrmsrl(fixed_counter_msr(i), pmc->counter);
+		if (pmc->counter != rdpmc(INTEL_PMC_FIXED_RDPMC_BASE | i))
+			wrmsrl(fixed_counter_msr(i), pmc->counter);
 	}
 }
 
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
