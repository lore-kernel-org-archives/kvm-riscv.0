Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A497C5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIqv7H+1OSzHXunqKkwasHSg8sfFK3qPq3wLXMbyFvs=; b=KKTZgMU8qwpUUo
	jW3UPBlXyVdwlqe5c01sn34aN6ejoQLhWdehNgpw0dSJ5/9iMhbkFzcOijaRVewb6OcgE8MkIZTES
	w/fho8DWpvzQEd2B4eTZD1AH9t/1UCgwhom4y9OJUY8CSt33w5I1fMq1Z0QMKTigPp78Zc3MnCx8F
	fTYHCeQ4IS8+7CmwOHcVZUNNff/s3SbqPOpd2CksfDCsIF7bL4atjnJVaTClIr6hNtix+hpIL7lWy
	m872cfcFzfUI3TVAeRg+Ib+1UYg76vRSvfran42Hq9UXyj94ktN0Xw7mLi+q3BDhnevIMCjr8HUhj
	lUH7MCvXGhb/PlWxDMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbV-0000000GcbY-4A8U;
	Thu, 29 May 2025 22:20:01 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbT-0000000GcXa-1bh1
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:20:00 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-310c5c2c38cso1384460a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557198; x=1749161998; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vNslUGWw1CMVPjS9VIQPMuWCe949NCq6H3qTd+RjZjs=;
        b=OgAw4CFQvH84g0DhYWnXOoMdjpWw47xYjiPmKzCFlKFfcL3yLi6/RAKsgP2L9xxTwD
         RLyVH1aPXaEtQ6KcQ7W88fAfYwUSxPfYYSyjf31iS4h0w3NIslIq6M1fPAL4y4F583r8
         HXS166G+2Ky+grAFHcFpF7jYpBP3amRlMp9+GgIe8kb4JgfHW5E1ygesTJ14IzOYcq+S
         1HVQANLQb2W/JFnAJjAd2dOn7y3mpieNQa7ZRZ5pkFWEvP3E/ByB8SeyLBML0/QEiZWZ
         bhWXOOHWohgTGMQ6znbbmMD1UiOOK7iHlNR/eav0MIEOmrOJBhLsyrRuKXcFWZIqhCFu
         qeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557198; x=1749161998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNslUGWw1CMVPjS9VIQPMuWCe949NCq6H3qTd+RjZjs=;
        b=ROcYaufmEbYjdYWQsGT4q7/r7J9qM+AsTbqcOKzJLQ/f0JTTkNKyU9bjEtfWFlcz2v
         GDoPmP7JN3TU6kxt/0gXronzFq8B1W/f1AB+zbD+25zH3TxE6U2e/VHWH5g6YmeXpEyu
         yjd1+o326jFH4/2Yfw8FHRsjHn7olRL4qAoa8fo0nP+6xEuL0Mz/M7FkGjCdPJSyUQvP
         TdmM8ecdc0paiMX6tkezbg6JEBkE6zmSLkVbSYc2xO5q38EG2DwmOynfZ9xKJd95NvYN
         /WJbRPNHyckpF3h1ryEP9wlknrT25uyBFAQH/2cBrh5QW+jpqlXMkvQ3yU8GZhimnj8F
         mFCg==
X-Gm-Message-State: AOJu0Yx6jycL4YPJC4F41TpVxfsllj1N9sFtPBwGVHixXML4N7ofyj4Y
	s7TyiRYhQrBUEmkMiBeIqUs+MZyPHWQTulI7My9e3PiElyRCNjD9/n455PXhY+zobCNwadyUQAM
	EPnJoyA==
X-Google-Smtp-Source: AGHT+IHrGNPA7Fjoti9Yh7zCMe8Ut+1HXp93j1eoloOFL1oI/TXxq/AiO9jim6fDWY8a2L2xOX3pv7ki0x0=
X-Received: from pjbqj13.prod.google.com ([2002:a17:90b:28cd:b0:30a:2020:e2bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c90:b0:311:c1ec:7cfd
 with SMTP id 98e67ed59e1d1-3124198ae5cmr1481581a91.26.1748557197961; Thu, 29
 May 2025 15:19:57 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:23 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-11-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 10/16] x86/pmu: Use X86_PROPERTY_PMU_* macros
 to retrieve PMU information
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151959_428969_121019DB 
X-CRM114-Status: UNSURE (   9.57  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Use the recently introduced X86_PROPERTY_PMU_* macros to get PMU
information instead of open coding equivalent functionality.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/pmu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
index 44449372..c7f7da14 100644
--- a/lib/x86/pmu.c
+++ b/lib/x86/pmu.c
@@ -7,21 +7,19 @@ void pmu_init(void)
 	pmu.is_intel = is_intel();
 
 	if (pmu.is_intel) {
-		struct cpuid cpuid_10 = cpuid(10);
-
-		pmu.version = cpuid_10.a & 0xff;
+		pmu.version = this_cpu_property(X86_PROPERTY_PMU_VERSION);
 
 		if (pmu.version > 1) {
-			pmu.nr_fixed_counters = cpuid_10.d & 0x1f;
-			pmu.fixed_counter_width = (cpuid_10.d >> 5) & 0xff;
+			pmu.nr_fixed_counters = this_cpu_property(X86_PROPERTY_PMU_NR_FIXED_COUNTERS);
+			pmu.fixed_counter_width = this_cpu_property(X86_PROPERTY_PMU_FIXED_COUNTERS_BIT_WIDTH);
 		}
 
-		pmu.nr_gp_counters = (cpuid_10.a >> 8) & 0xff;
-		pmu.gp_counter_width = (cpuid_10.a >> 16) & 0xff;
-		pmu.arch_event_mask_length = (cpuid_10.a >> 24) & 0xff;
+		pmu.nr_gp_counters = this_cpu_property(X86_PROPERTY_PMU_NR_GP_COUNTERS);
+		pmu.gp_counter_width = this_cpu_property(X86_PROPERTY_PMU_GP_COUNTERS_BIT_WIDTH);
+		pmu.arch_event_mask_length = this_cpu_property(X86_PROPERTY_PMU_EBX_BIT_VECTOR_LENGTH);
 
 		/* CPUID.0xA.EBX bit is '1' if a counter is NOT available. */
-		pmu.arch_event_available = ~cpuid_10.b;
+		pmu.arch_event_available = ~this_cpu_property(X86_PROPERTY_PMU_EVENTS_MASK);
 
 		if (this_cpu_has(X86_FEATURE_PDCM))
 			pmu.perf_cap = rdmsr(MSR_IA32_PERF_CAPABILITIES);
@@ -38,7 +36,7 @@ void pmu_init(void)
 			/* Performance Monitoring Version 2 Supported */
 			if (this_cpu_has(X86_FEATURE_AMD_PMU_V2)) {
 				pmu.version = 2;
-				pmu.nr_gp_counters = cpuid(0x80000022).b & 0xf;
+				pmu.nr_gp_counters = this_cpu_property(X86_PROPERTY_NR_PERFCTR_CORE);
 			} else {
 				pmu.nr_gp_counters = AMD64_NUM_COUNTERS_CORE;
 			}
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
