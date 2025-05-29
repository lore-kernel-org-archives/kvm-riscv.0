Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03700C54FB3
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaFy2tfyioMRWWQ5GQd/X2yfF32pPrdFyYTtOy6+e9o=; b=BMuD6Z1ft2tQBt
	rQu3u8eOVmwuj0hdU8TncdP6ANGMkdeTGpKem7FwPyORlbzM24niOMY/Av0lGAwMo1hLwW3QQl0RE
	js5H0wmxAryyEzLz9tB9MnxKhVYWMzYVlumi8aidvBkdPJBYtFV5HDLTx1AsX4ZONI4MX032w7ZrF
	641EV9pmbuW6PIylhvUiHWo6b+6BiQfk6jDW3USlZ6kVRMk93d+yUy9wCtQmaPX2yNI8luhPqGUQX
	id1w2IrgFQRGQO5RuciHBLDVeXAS4T0M/zeZHVuNMWP0ari1lUecSBOzRVSP6G4T9Epw4AdpRy6o4
	+/QlCw3TM7jtDl08BxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbP-0000000GcV4-3CLd;
	Thu, 29 May 2025 22:19:55 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbN-0000000GcRw-1nbY
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2c36951518so1272805a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557192; x=1749161992; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYpwhp6Hm+pvfi+Cbdt++fTIeJjtPKhaMoLpXy5DIw=;
        b=Ildf1ebpK4JgaCnAdkU+SJLTAnUgmknOMLidTs3cYaUTArUUiRIgqg6cmHX8zbcDG8
         F8FIhly6RCZYxRSQEDrKpS5LUlymYQjRjeVFK9rhA8/HrYIPi6pojfpcJ03LN30YSBAj
         6Zy5CLlxqgRoZ8FE9HgR6VJYqfMjraNNGRE/t3X08wQ87WQinSM6ThAEJuw6c67d5MAr
         izGiOt/PfOrZMNberx4XJLd6dA72IHgSauxiN6nA6zK4XmctTCzKZaybFxJrtudNoEEe
         +4A7oY4Q+8gUWhqbzJv0BymWe+WrkT1R9TPR9BJQePg4Z+D+kClnXfDLnvXkP9369msm
         xpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557192; x=1749161992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckYpwhp6Hm+pvfi+Cbdt++fTIeJjtPKhaMoLpXy5DIw=;
        b=BD4ThPeJ3pPyo/YpD662uf9YXfvIBgOfc2AJR1Y7N3DctTiDEqqDmajUgjjiCCA+wR
         JDVDN8DottqmEEPMwbRPMIlNumklyw8u52yH9rvpGxaCMVu7TzvuDzZCtKClYtrz8ZuI
         0qSDsc1YHe6m4nfvzW21Qf7JgJEX8Y/NbRcy93hvQEAtIzPXXD2nYDtQapJqTE3rSypr
         UH/s+ay37DiLzXL6h1pwVmJQ9vON7LQ00XnHEV1EPDybzgVRyrTmyX6JusrUoCOuTGM8
         2yMbCyIvN086zx062G12q3ElrQWw/HQ/hjSYSHR+nBURxrj0IVf+c8sZ74iUBzgMZH96
         jUwg==
X-Gm-Message-State: AOJu0Yx+9b4QJ52kxaByjBpOV9FhuEHFyEln6ULg3FprEopsZrk9mA7C
	vQfibM9eKvc2UxpM3QXrosGMsqXyn69tD9UvGyFDObUxrwrLrWv4PkoXLlgqb26eu+cneo2gQ1a
	2/JK6yw==
X-Google-Smtp-Source: AGHT+IHG+BQc7caU6eHEAk61KexpAoTaK0e3VVheD8QYsGdTSLRbNUsZ4bpQdlnwNDmTfVxJjIrhBb554GM=
X-Received: from pfwz39.prod.google.com ([2002:a05:6a00:1da7:b0:746:1eb5:7f3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2d8c:b0:20d:d31c:cd28
 with SMTP id adf61e73a8af0-21ad94e216amr2088378637.7.1748557192502; Thu, 29
 May 2025 15:19:52 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:20 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-8-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 07/16] x86/pmu: Rename pmu_gp_counter_is_available()
 to pmu_arch_event_is_available()
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151953_469665_8D5A2986 
X-CRM114-Status: GOOD (  13.89  )
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

Rename pmu_gp_counter_is_available() to pmu_arch_event_is_available() to
reflect what the field and helper actually track.  The availablity of
architectural events has nothing to do with the GP counters themselves.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/pmu.c | 4 ++--
 lib/x86/pmu.h | 6 +++---
 x86/pmu.c     | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/x86/pmu.c b/lib/x86/pmu.c
index d06e9455..599168ac 100644
--- a/lib/x86/pmu.c
+++ b/lib/x86/pmu.c
@@ -21,7 +21,7 @@ void pmu_init(void)
 		pmu.gp_counter_mask_length = (cpuid_10.a >> 24) & 0xff;
 
 		/* CPUID.0xA.EBX bit is '1' if a counter is NOT available. */
-		pmu.gp_counter_available = ~cpuid_10.b;
+		pmu.arch_event_available = ~cpuid_10.b;
 
 		if (this_cpu_has(X86_FEATURE_PDCM))
 			pmu.perf_cap = rdmsr(MSR_IA32_PERF_CAPABILITIES);
@@ -51,7 +51,7 @@ void pmu_init(void)
 		}
 		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
 		pmu.gp_counter_mask_length = pmu.nr_gp_counters;
-		pmu.gp_counter_available = (1u << pmu.nr_gp_counters) - 1;
+		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
 
 		if (this_cpu_has_perf_global_status()) {
 			pmu.msr_global_status = MSR_AMD64_PERF_CNTR_GLOBAL_STATUS;
diff --git a/lib/x86/pmu.h b/lib/x86/pmu.h
index f07fbd93..d0ad280a 100644
--- a/lib/x86/pmu.h
+++ b/lib/x86/pmu.h
@@ -64,7 +64,7 @@ struct pmu_caps {
 	u8 nr_gp_counters;
 	u8 gp_counter_width;
 	u8 gp_counter_mask_length;
-	u32 gp_counter_available;
+	u32 arch_event_available;
 	u32 msr_gp_counter_base;
 	u32 msr_gp_event_select_base;
 
@@ -110,9 +110,9 @@ static inline bool this_cpu_has_perf_global_status(void)
 	return pmu.version > 1;
 }
 
-static inline bool pmu_gp_counter_is_available(int i)
+static inline bool pmu_arch_event_is_available(int i)
 {
-	return pmu.gp_counter_available & BIT(i);
+	return pmu.arch_event_available & BIT(i);
 }
 
 static inline u64 pmu_lbr_version(void)
diff --git a/x86/pmu.c b/x86/pmu.c
index 8cf26b12..0ce34433 100644
--- a/x86/pmu.c
+++ b/x86/pmu.c
@@ -436,7 +436,7 @@ static void check_gp_counters(void)
 	int i;
 
 	for (i = 0; i < gp_events_size; i++)
-		if (pmu_gp_counter_is_available(i))
+		if (pmu_arch_event_is_available(i))
 			check_gp_counter(&gp_events[i]);
 		else
 			printf("GP event '%s' is disabled\n",
@@ -463,7 +463,7 @@ static void check_counters_many(void)
 	int i, n;
 
 	for (i = 0, n = 0; n < pmu.nr_gp_counters; i++) {
-		if (!pmu_gp_counter_is_available(i))
+		if (!pmu_arch_event_is_available(i))
 			continue;
 
 		cnt[n].ctr = MSR_GP_COUNTERx(n);
@@ -902,7 +902,7 @@ static void set_ref_cycle_expectations(void)
 	uint64_t t0, t1, t2, t3;
 
 	/* Bit 2 enumerates the availability of reference cycles events. */
-	if (!pmu.nr_gp_counters || !pmu_gp_counter_is_available(2))
+	if (!pmu.nr_gp_counters || !pmu_arch_event_is_available(2))
 		return;
 
 	if (this_cpu_has_perf_global_ctrl())
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
