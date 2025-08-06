Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E7CA0EC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 00:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twXLU+f49Gl7QjFyDInwcHUxr9ZNefzUQZUdzqIN8/k=; b=fCNg6OnrVLslMo
	+Bi/qkiOuqWnChUHO6p5kJZBbjTu9R2KeHbwgI/OuBU3+BN2IziDNvPXBKswg0VI4pyT/pVzoI2/n
	eXh4m0Nj4hYXOeuzJshdaqhBlbW40sByvEDS5c+uuToFdflCrtCwHa5qtB8Xxx79LHa8Keh7/pkvY
	CQDNYBSr0OmiT5aeqt1CGY0PfYQWbC6GkwFHP9tPqEhso1hgOt+GZ4gu42rdsDdVQa4AT+EeujVXt
	4xEIoMwr7SHr0EydufFdx8VXzchCm20fN9g/DDLLzj00RAoLHeqjDil39PmqlwNeJZqehA1cthv3Q
	EgOPJCpXEO0MCl4JBB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoHZ-0000000GtdY-1q9s;
	Thu, 07 Aug 2025 00:14:57 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGv-0000000GGTk-0X3L
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76bec81c902so268132b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510280; x=1755115080; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1JVfLN/93q2WYEPFa3NA5hoBJW9RWjYsNWhQaVXoFO0=;
        b=Xm4n2ygcSQotDU/MxGfYP8YipOIdQ8PoXWgYgA1jgy6mU87dtE6jxmS9YLyzXypPKT
         6QxSRaqpgE7wHuiEU8n9gthajtLFNBJE9sg2cMPDrKK6EgnQyyM8nsm/nceGJujXgiDd
         FmoGPqPjVrC/Amc9vL3hROdFba0VZmvIhGTfbzfVa1U1+ST4ykGcNqV++CyhK+KEPreC
         aSZLy/0EkmUkYd0I/xUCsRDvR9HtP5uRnEK2oX0J9AybxLoavnHWaX3cAJqJ7B4ppuCA
         2t0iBSapDVO4yk3+cDmnYJyF1L/njXpcvMdEhfoau2KOiZIblacTiqaLI1TsrtuE7RRM
         haNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510280; x=1755115080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JVfLN/93q2WYEPFa3NA5hoBJW9RWjYsNWhQaVXoFO0=;
        b=MXXPuNUhw6PbyIzo+QosCr2/Y7bXZfQmwUuTJxOf/K/RuTuPnCbK61iqzBC7zI5x5r
         Lh4CW+hCKo+BQ75i4ulr5doHAML8trU/OGcAbTad4bv86GqthS8GFwNPpX3YgK+kp9Kr
         EbgvC1wuoyRXp0jVT0bK9nHWjvd18cNdvyBFhz4+X5Nm1HX4skVH+6ypZQvhBuLOMBIA
         xrVjzzAhgqIeaUjpu2PAk+09AiZjzvttVWiIBvxYEC9MAPQ6Y/dZDp5FDVgIYm5pLwdv
         acJWcOJzPzC6eTqhpzT6ibCv4x52HEuUPPzOhH22F6LXK0HjQv0ddnaBxKrtfDKpY22h
         RIEg==
X-Forwarded-Encrypted: i=1; AJvYcCVswRqQ7Mn117XqHJPSPgBiw5Vtm3gKoVq40rgEyhvPL6I2xEuBbsA9RdQZ3nSrhGNNBVeNYNU6aTo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1jceaFQSxIQzPYLF32E5sndWHWRbjp7BBh1mCBThv+R+kHyEg
	vv84xh0VYcBgJ4BxnYmaobKdUlfSniuOaAc9qdjU97VlpyOExU4J0unQv+/dmpyRnTvuoYrHaKe
	FJMMmVA==
X-Google-Smtp-Source: AGHT+IGEqoS6XNELOGxlbJeBvkZJOh3lrJxf4kRuSXEbOp8u6GEP+lPQ4e26oXCRK4Rwc//kWZSE9nj7nV8=
X-Received: from pgbcr1.prod.google.com ([2002:a05:6a02:4101:b0:b42:25bb:216b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d9d:b0:240:1d69:9cc9
 with SMTP id adf61e73a8af0-24041326731mr1241511637.16.1754510279868; Wed, 06
 Aug 2025 12:57:59 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:39 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-18-seanjc@google.com>
Subject: [PATCH v5 17/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported
 PMU capabilities
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
X-CRM114-CacheID: sfid-20250806_125801_163392_7E960D7C 
X-CRM114-Status: GOOD (  13.09  )
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

Take a snapshot of the unadulterated PMU capabilities provided by perf so
that KVM can compare guest vPMU capabilities against hardware capabilities
when determining whether or not to intercept PMU MSRs (and RDPMC).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 3206412a35a1..0f3e011824ed 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -26,6 +26,10 @@
 /* This is enough to filter the vast majority of currently defined events. */
 #define KVM_PMU_EVENT_FILTER_MAX_EVENTS 300
 
+/* Unadultered PMU capabilities of the host, i.e. of hardware. */
+static struct x86_pmu_capability __read_mostly kvm_host_pmu;
+
+/* KVM's PMU capabilities, i.e. the intersection of KVM and hardware support. */
 struct x86_pmu_capability __read_mostly kvm_pmu_cap;
 EXPORT_SYMBOL_GPL(kvm_pmu_cap);
 
@@ -104,6 +108,8 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 	bool is_intel = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 	int min_nr_gp_ctrs = pmu_ops->MIN_NR_GP_COUNTERS;
 
+	perf_get_x86_pmu_capability(&kvm_host_pmu);
+
 	/*
 	 * Hybrid PMUs don't play nice with virtualization without careful
 	 * configuration by userspace, and KVM's APIs for reporting supported
@@ -114,18 +120,16 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 		enable_pmu = false;
 
 	if (enable_pmu) {
-		perf_get_x86_pmu_capability(&kvm_pmu_cap);
-
 		/*
 		 * WARN if perf did NOT disable hardware PMU if the number of
 		 * architecturally required GP counters aren't present, i.e. if
 		 * there are a non-zero number of counters, but fewer than what
 		 * is architecturally required.
 		 */
-		if (!kvm_pmu_cap.num_counters_gp ||
-		    WARN_ON_ONCE(kvm_pmu_cap.num_counters_gp < min_nr_gp_ctrs))
+		if (!kvm_host_pmu.num_counters_gp ||
+		    WARN_ON_ONCE(kvm_host_pmu.num_counters_gp < min_nr_gp_ctrs))
 			enable_pmu = false;
-		else if (is_intel && !kvm_pmu_cap.version)
+		else if (is_intel && !kvm_host_pmu.version)
 			enable_pmu = false;
 	}
 
@@ -134,6 +138,7 @@ void kvm_init_pmu_capability(const struct kvm_pmu_ops *pmu_ops)
 		return;
 	}
 
+	memcpy(&kvm_pmu_cap, &kvm_host_pmu, sizeof(kvm_host_pmu));
 	kvm_pmu_cap.version = min(kvm_pmu_cap.version, 2);
 	kvm_pmu_cap.num_counters_gp = min(kvm_pmu_cap.num_counters_gp,
 					  pmu_ops->MAX_NR_GP_COUNTERS);
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
