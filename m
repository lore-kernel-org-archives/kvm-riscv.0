Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADCC5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnkr9dqBYCw2tjNc9jpYTN4zwT4Lj3jz6BkaGEeAQeM=; b=YehJJNqCDd2T50
	zEm1gflPM4B5CfbKbsp8qH2ggbeOzijKZM6ZlK2qCEf9G95Vz7zX0TqcIASrWvDPkvyD7XFaf/pzD
	wDTOiRNgubbkGsQVaVFZEj97ML0riV5xQ9+kt3/k4SS+oQEBbE9UYyTtSL8y0KJ69hwx4SlHH9iFJ
	5FtdAHCO9tf5raR0iR65ynhT+YTc9Dfq1tXO82v/Kazjq9PsIctC1fRxdbX3vLYAE2pNtTP7XDG09
	HDYg5oTg5nMkV7kRx2MQwKWvc0xxZ1bW08Vdoz+bSbEtw5CCcZh6sw6C06/zvHwGTyh62BJroRF35
	TDgWktBCtT2k8O3ECbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbR-0000000GcWF-0Hbe;
	Thu, 29 May 2025 22:19:57 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbP-0000000GcTn-10ls
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:56 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-740774348f6so1280966b3a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557194; x=1749161994; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nX98HJbRuSQ6xNdc0MwlmdF7eZrXWtOe+GKwLLWx4iA=;
        b=HjUBozWByroGR1Ji00QbqG99HkEZL53YqkgXcs+yR9zRcTc0R9y5BKRWQLKShRtnCj
         NRA4399FmBoAyzcxJsdE/mLzeePRlvvt270X4Xzz1Lz2Vfdi/Er9ok9Nwi2Jz7Mwxb4p
         bLHD10hEFm8i4lxN6qkCJa0F9Ym2vGRoJYzz+FzfwQ9Ql8TnAfm+7aEI7Ip61GHC4Te6
         Bj09/rgC2ZrGR4WV+KZ142n8ZFuPZTBMONUVjJ3HiBjKOTWuA2OZU2aRcqNQxN31PY+p
         0C39WdecBddT5j1Oz0nRi6jaMpAGV06OESsB64HFfi8xKb9V7LeK4CEO+4vPc3LV5LlU
         qPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557194; x=1749161994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX98HJbRuSQ6xNdc0MwlmdF7eZrXWtOe+GKwLLWx4iA=;
        b=NG/93jBbKpISjzEN+pICqcs0mkVUFWEBJx1aHE8QlnoYM6wyD1ITXnMUofq2n7S9mc
         7u9oqLVy3Y/Pnr6pGxVWJQqyCex2OOYErAOq+AQt3AZGKrEZUrfr/QsdqkBsVrYEQkkX
         R7R2TtYwgaLAWPP+HhlqmjdI9lI+sTdSuY9s2kLqRkb1uJYLRW0m1pRzgCaL00qdAFhE
         SPfVSJIEaD2VlSo29EizQvf7ZK6+sJqZatHfsk5VfENbWpW+pQarrJ0CdVY8w60b1WR/
         UN+68U+WD9amUZxPIM/H62ZZsPGQPkBstdsitmepJmIn/+yQymIqKN4JXqwx13wOJe9f
         D+Cg==
X-Gm-Message-State: AOJu0YwVGoD3LzTAPHmcCt5d+PkTy8yGhD95HpLsc4kpOuMaCelimAMe
	Kzm7KyJaDMVs9XYO6loy+37uNv5gkGNdNMkchvSb75Xjl0GGrh0+/VdU28H6VW0r7IDSVdXECAq
	ObyBMow==
X-Google-Smtp-Source: AGHT+IEBKjriVgxGk+BKu71J524sscOYWEh1dyyHEKyqWyY/JG1UDmL2b6mDtP1ardICqkEsw3RhMdZ0TiQ=
X-Received: from pfjg6.prod.google.com ([2002:a05:6a00:b86:b0:747:a049:d575])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:928a:b0:740:4fd8:a2bc
 with SMTP id d2e1a72fcca58-747bd958bb5mr1298997b3a.5.1748557194299; Thu, 29
 May 2025 15:19:54 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:21 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-9-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 08/16] x86/pmu: Rename gp_counter_mask_length
 to arch_event_mask_length
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151955_286490_5370C620 
X-CRM114-Status: GOOD (  10.80  )
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

Rename gp_counter_mask_length to arch_event_mask_length to reflect what
the field actually tracks.  The availablity of architectural events has
nothing to do with the GP counters themselves.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/pmu.c | 4 ++--
 lib/x86/pmu.h | 2 +-
 x86/pmu.c     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
index 599168ac..b97e2c4a 100644
--- a/lib/x86/pmu.c
+++ b/lib/x86/pmu.c
@@ -18,7 +18,7 @@ void pmu_init(void)
 
 		pmu.nr_gp_counters = (cpuid_10.a >> 8) & 0xff;
 		pmu.gp_counter_width = (cpuid_10.a >> 16) & 0xff;
-		pmu.gp_counter_mask_length = (cpuid_10.a >> 24) & 0xff;
+		pmu.arch_event_mask_length = (cpuid_10.a >> 24) & 0xff;
 
 		/* CPUID.0xA.EBX bit is '1' if a counter is NOT available. */
 		pmu.arch_event_available = ~cpuid_10.b;
@@ -50,7 +50,7 @@ void pmu_init(void)
 			pmu.msr_gp_event_select_base = MSR_K7_EVNTSEL0;
 		}
 		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
-		pmu.gp_counter_mask_length = pmu.nr_gp_counters;
+		pmu.arch_event_mask_length = pmu.nr_gp_counters;
 		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
 
 		if (this_cpu_has_perf_global_status()) {
diff --git a/lib/x86/pmu.h b/lib/x86/pmu.h
index d0ad280a..c7dc68c1 100644
--- a/lib/x86/pmu.h
+++ b/lib/x86/pmu.h
@@ -63,7 +63,7 @@ struct pmu_caps {
 	u8 fixed_counter_width;
 	u8 nr_gp_counters;
 	u8 gp_counter_width;
-	u8 gp_counter_mask_length;
+	u8 arch_event_mask_length;
 	u32 arch_event_available;
 	u32 msr_gp_counter_base;
 	u32 msr_gp_event_select_base;
diff --git a/x86/pmu.c b/x86/pmu.c
index 0ce34433..63eae3db 100644
--- a/x86/pmu.c
+++ b/x86/pmu.c
@@ -992,7 +992,7 @@ int main(int ac, char **av)
 	printf("PMU version:         %d\n", pmu.version);
 	printf("GP counters:         %d\n", pmu.nr_gp_counters);
 	printf("GP counter width:    %d\n", pmu.gp_counter_width);
-	printf("Mask length:         %d\n", pmu.gp_counter_mask_length);
+	printf("Event Mask length:   %d\n", pmu.arch_event_mask_length);
 	printf("Fixed counters:      %d\n", pmu.nr_fixed_counters);
 	printf("Fixed counter width: %d\n", pmu.fixed_counter_width);
 
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
