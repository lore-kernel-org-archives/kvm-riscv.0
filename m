Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AD7C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX4hLnFDAK2lRsIzlUAEG+Ue986oK29SLpwy17EEEuk=; b=vQv0Ca0XFoyLr4
	U0iNOv4xv5HWqZvYKfdMTJ/1XSY50Uflk3iIx26cZ5CKCpkkiDTj7sj7bfAT6AlDqGzFNcP8dxeHP
	MN9JEkgBOVLnZKM1X9ZoToR4VtMSD3kHVLq+Ka2EpQ2vXSJ4NtNZvROGsaE5+2aub1KpiVl7fV4/t
	jWgy6Of+2bBqHUAtKCxXVKFBGxIQ+Bx08hSY5OGSlNLllQzPeL9+yaQQwqGeDdbJRwsOJqPOjewnN
	gg/BEu8r1vMBUGMBe/IkDFHZjY4qT3JrKPvoSrAHypQpOx7izuBfErgeiA9IQzmVTN4yWCsDreAQj
	YDB9R+vumft323vB7hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbS-0000000GcXy-2sPF;
	Thu, 29 May 2025 22:19:58 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbR-0000000GcVY-0VLL
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:58 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b0e5f28841dso895062a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557196; x=1749161996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gxZgXphd2adbipZSwhEJv6yb2Dq/xt7bO+6gJulJvt8=;
        b=eZFcL08ZW/5pPduWl4RyeOMiKRLm3ZQPrZqQakfO3rVpOMsH1cOziEVtOO8KNotR6F
         pKHL0CJFWJ5QpciS98n0s5iqMJLb40iviIzFM33l36CiXKfNo11g0OJP/gkD/Yz2dnS1
         IyGGlHhPASASm9ENjVEBkHm5A+uX5Grg8FhJMEp2lVOPM+bwAIfzVMEK68eMoVx3suQ0
         66L/h2n2RdEwGuazrAXCwzNxE/IEJYvUzOgO58p8PTesPTrV0Bi1I9TEStHrGOF/V1t7
         JEzHewr4RN0lp1yzHBLaVKBZVLmgxS+bQqNHg+R+nPrF06eQ67rOZLLDyzHleLNsi8/Z
         jmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557196; x=1749161996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxZgXphd2adbipZSwhEJv6yb2Dq/xt7bO+6gJulJvt8=;
        b=Jc9+G44r1Ww/XhZ9IbI5ouMA7yySuFHtA05L40FmE0u3z3bgj3WBFkVCwnlhOXzr/y
         dmNk/xVtxhEZBvzvniqucDLjMh3RkV8SZytfd3BXwCnE/8Hb1t87otZg4LD3NcHiPIQZ
         6ECizFwg4UwbVcT7jLIT0OvXSN9/lJN1Pl0amzhgqWlupVUAnFUIefnCHm+vPB45ZlgK
         anbO59dHcqLMEAm/YlsF+TUUSUfFC08WIrPhncsS+Gu+OSxx3104VJUI2dMnNWtBoubt
         ye77fPcggRAye1cDLsHW6AUBEy5Rj19C+z2s4Vk4hD0ffdbD664VrNqJSaEyA1SUJM+r
         Nd7Q==
X-Gm-Message-State: AOJu0Yy/sH59fHFz1MBaZGJnA9QgHYGAQSvQ8DXwfm3JLSWCFtRUtCaS
	p2mLOSAveFwWMxTHZ8VGy8b/DlwfGyHKr13o1sARmDTPnlXlU7yQ/p2WeDuY6zLIoUGNzJhWWvo
	gbaGWQw==
X-Google-Smtp-Source: AGHT+IH0w/roq09Dtn3umfqlUM69m8mqnFe3o9acCe/5LRHUakJnkAfciNzMMbljEJ1XyxaZ7+27T8v406s=
X-Received: from pjbrr6.prod.google.com ([2002:a17:90b:2b46:b0:30e:5bd5:880d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c8a:b0:312:2bb:aa89
 with SMTP id 98e67ed59e1d1-3124173d8bamr1566838a91.20.1748557196086; Thu, 29
 May 2025 15:19:56 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:22 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-10-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 09/16] x86/pmu: Mark all arch events as
 available on AMD
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151957_169601_FEDA6742 
X-CRM114-Status: UNSURE (   9.74  )
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

Mark all arch events as available on AMD, as AMD PMUs don't provide the
"not available" CPUID field, and the number of GP counters has nothing to
do with which events are supported.

Fixes: b883751a ("x86/pmu: Update testcases to cover AMD PMU")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
index b97e2c4a..44449372 100644
--- a/lib/x86/pmu.c
+++ b/lib/x86/pmu.c
@@ -50,8 +50,8 @@ void pmu_init(void)
 			pmu.msr_gp_event_select_base = MSR_K7_EVNTSEL0;
 		}
 		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
-		pmu.arch_event_mask_length = pmu.nr_gp_counters;
-		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
+		pmu.arch_event_mask_length = 32;
+		pmu.arch_event_available = -1u;
 
 		if (this_cpu_has_perf_global_status()) {
 			pmu.msr_global_status = MSR_AMD64_PERF_CNTR_GLOBAL_STATUS;
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
