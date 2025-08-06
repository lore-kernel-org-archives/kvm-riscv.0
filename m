Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B7C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkV+0dI+exUzRFgt5YB/ThM9zF/Bw5FrzOJ7IEqjtBs=; b=c5ksZS7+22oDij
	5QPx7/iDwB4OUnIU0A9Jawv626wT6iXKlPbA04pAqDLXMKlIkclvnl1dtzMTjZOU7CF06Vx5Lj58J
	byRGaUkLdYXMy38FcT/GO2JlNbLeq6U24vyOpux5tR1mascoLo+m2Q3bw3ZTBJu9oxfncJCdAvvNM
	KtjJqiJBC7YV62tzmvr/O9YKfJgRQp/9szChj6qMKwwz0CUgFpnCH95dMyZF2i7H3o828GVT9uyTF
	B2+NSvawvYdNkDsn+Chv8g7bWXroM0DHilYrD3Ysj0Twy5/AdAzDouqRVqNiSWB5WljXCRw/c1eV8
	7zCtbXedwLemLruoAr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmdy-0000000GjTF-3sEe;
	Wed, 06 Aug 2025 22:29:58 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHP-0000000GGxj-3l2d
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:33 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2425e41424cso2209515ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510310; x=1755115110; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0x+D+og4ia0Wyj0NvWobUD8Pzlie97PfvMw2iXhJJfQ=;
        b=V1UMV4CIb6XsaO7LTPdN+ovJ7VpUk9rQ/ZF2E//QAymugu3ufKGq1lZ8Z5Jys59J3P
         WAOl3RriF+VCBwVqxA+rcL/ZhpYBB7vGU+BdDONlbzb9/4SJ7oigGjVcY8jinvRnNNFe
         JKaiG4hpKUBahhvZy1dufe7IRrDVGiliS69TG3+9o0dwWZB2M3ui3rIqLuHNXG1LmQjO
         zMyicPs3YPoPppdj7y+S36HdUZOpVOPTEXizg85e9Z7IfS2+M7S3DoSxMeM2FfyozSgQ
         B0+2cjZrYNQZPbbzzmeFyHiB4Zyb4+35KRbyvv005knIwwBdEoKyzwGnHlHczLE148EF
         wnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510310; x=1755115110;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x+D+og4ia0Wyj0NvWobUD8Pzlie97PfvMw2iXhJJfQ=;
        b=owWbeNL9jvyql6vgviLIU2YtIOckjHdLMRM52OueSEixBa2bbvcALlsiKeCgeAMfqJ
         yIH9QqGuhhsOGti+nk3p/uwazDwHHU+w/PfqPn1Us2pGbkJHf3nspv2WkUs/din8jlic
         TmQ/67ZjvGJJlh2kwvsO0Xp/bpkCFLJGC5+QkV253MAbOHMr6M0SmUhTMSY/ZIlZOylV
         jbKIMRzF6EAM4dM174297i338ysqTlxmAsTVKtKDjaPyBiNylKAlM4jR81JbuK4pyHkA
         Sk5a06dsHYzpCX+RbB1UyaKB1quOW2vbMUTMn2WeD6fSetGAEvv2BONWrk5YHgMQcgxr
         /xsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV511vJhlP+VDp6H/jl/ABs9UASYvUAtn1dCIzUUPFDwyE6XOgHYTxUTZbdDO/U03JB+kBDfc2D5v0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwKQIjZbGmJjkjGkrATSTCaiU/TmbLQaSy5macv5nV3RHMty0o
	+qBDsKsuaKBkOm+5YT+NSiDJqzIHkm1STHlosicS8WNzXgYv1Ye7FJJVLM651Jq3AYZo18vcg7A
	qJPGvBA==
X-Google-Smtp-Source: AGHT+IHACZSLEKXNmtK1WJ2A5Z4mKbWmXm0xD8HleVhgcyjfcmK2gM+EKW1OlQ2W16ylb8rulTtPFwBYIyI=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:312:14e5:174b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:98d:b0:225:abd2:5e4b
 with SMTP id d9443c01a7336-242b19acfe4mr5266535ad.16.1754510310549; Wed, 06
 Aug 2025 12:58:30 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:56 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-35-seanjc@google.com>
Subject: [PATCH v5 34/44] KVM: x86/pmu: Introduce eventsel_hw to prepare for
 pmu event filtering
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
X-CRM114-CacheID: sfid-20250806_125831_954993_FAB903EA 
X-CRM114-Status: GOOD (  15.34  )
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

From: Mingwei Zhang <mizhang@google.com>

Introduce eventsel_hw and fixed_ctr_ctrl_hw to store the actual HW value in
PMU event selector MSRs. In mediated PMU checks events before allowing the
event values written to the PMU MSRs. However, to match the HW behavior,
when PMU event checks fails, KVM should allow guest to read the value back.

This essentially requires an extra variable to separate the guest requested
value from actual PMU MSR value. Note this only applies to event selectors.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 ++
 arch/x86/kvm/pmu.c              | 7 +++++--
 arch/x86/kvm/svm/pmu.c          | 1 +
 arch/x86/kvm/vmx/pmu_intel.c    | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b891bd92fc83..5512e33db14a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -528,6 +528,7 @@ struct kvm_pmc {
 	 */
 	u64 emulated_counter;
 	u64 eventsel;
+	u64 eventsel_hw;
 	struct perf_event *perf_event;
 	struct kvm_vcpu *vcpu;
 	/*
@@ -556,6 +557,7 @@ struct kvm_pmu {
 	unsigned nr_arch_fixed_counters;
 	unsigned available_event_types;
 	u64 fixed_ctr_ctrl;
+	u64 fixed_ctr_ctrl_hw;
 	u64 fixed_ctr_ctrl_rsvd;
 	u64 global_ctrl;
 	u64 global_status;
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 082d2905882b..e39ae37f0280 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -890,11 +890,14 @@ static void kvm_pmu_reset(struct kvm_vcpu *vcpu)
 		pmc->counter = 0;
 		pmc->emulated_counter = 0;
 
-		if (pmc_is_gp(pmc))
+		if (pmc_is_gp(pmc)) {
 			pmc->eventsel = 0;
+			pmc->eventsel_hw = 0;
+		}
 	}
 
-	pmu->fixed_ctr_ctrl = pmu->global_ctrl = pmu->global_status = 0;
+	pmu->fixed_ctr_ctrl = pmu->fixed_ctr_ctrl_hw = 0;
+	pmu->global_ctrl = pmu->global_status = 0;
 
 	kvm_pmu_call(reset)(vcpu);
 }
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 9ffd44a5d474..9641ef5d0dd7 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -165,6 +165,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
+			pmc->eventsel_hw = data;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 2bdddb95816e..6874c522577e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -61,6 +61,7 @@ static void reprogram_fixed_counters(struct kvm_pmu *pmu, u64 data)
 	int i;
 
 	pmu->fixed_ctr_ctrl = data;
+	pmu->fixed_ctr_ctrl_hw = data;
 	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
 		u8 new_ctrl = fixed_ctrl_field(data, i);
 		u8 old_ctrl = fixed_ctrl_field(old_fixed_ctr_ctrl, i);
@@ -430,6 +431,7 @@ static int intel_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 			if (data != pmc->eventsel) {
 				pmc->eventsel = data;
+				pmc->eventsel_hw = data;
 				kvm_pmu_request_counter_reprogram(pmc);
 			}
 			break;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
