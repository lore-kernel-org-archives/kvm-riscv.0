Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2B7C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdtTVp0HiN3ExC3pXm2Mg+je4CTDlUXKP0/wHFeiG+I=; b=M06vkp705ufa+G
	eFwd1AnjCFiu+CeqE2Xeplc9cdzbp8efYMGzbPrcMN/pT/RBHvTwOsHB5VrSb3dXNwo03lI/2L7pT
	KfZPR4XFa+PENtIrG0OXH5ZhDHEuQQ+I1IaJHtha7Z5XOUWbH2vrdG8sfu36Ueguv2YuzTInyp380
	butoXs4d6IwL8I4SWxjpf1gwO3vwysqS1DdNX/ePYAuHkw34Q66XAYQZ2McWPZfVTpmFyuapM4cGw
	WFTfneTxOA8W76AsUktj2UKyWjALoaUdBymP6doCFuj4lzlYQ75q67DXslNGSbEOhCF0nTuLA1Yy1
	bYEoyBZclMVvgb1QVZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmdv-0000000GjR0-43jx;
	Wed, 06 Aug 2025 22:29:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHK-0000000GGrt-2qM0
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31eec17b5acso271838a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510305; x=1755115105; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I4KPqQMNJiob4xQ680shjgCKcMsOL7wxmLpd2hZ8prQ=;
        b=ewcPf1AJfxEAJAnkrTxTKBcC3jOwGfrh7ud0bZs8/E+7eb2SBMLGmYIS0xZ0YaZrmH
         EAg1Ly8uJ9ngtqwISI9rLk472dZoDL/huDpfuOsKfBjedWexLd+xg1Yxs3jN3Bp+SqP3
         QsVeWA/Dy1eWx5kZI99F8O542Ql3ZHtxoePvREHwynon8cqc36j4KCLQ4APTztnvnfdJ
         WnaMBJg+L441ZW5iJ1xmAj1khFqevBJmY0V4kL4hn9kOb2l1S82tKBM+DuzkLuW90g7J
         ax3y7c/QOIAXuyciEMwnzRLb+aXvvF7myIr6Hl+eKETd/U6EdhB2+/r+4zCKQGBNGooL
         aKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510306; x=1755115106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4KPqQMNJiob4xQ680shjgCKcMsOL7wxmLpd2hZ8prQ=;
        b=ttiwO0cdqnXmru+NSBTtNEPxmC2k3UEInhszlPtu0FZ01HUwHb7D55ty0Yx4SDpytN
         DtBC2lqhjbWi9CfhUm4utsXNerlhHAAwsYa4S1vo+UQBAwRACe1sR8WIxSBCGBf66vKW
         REdPMWTcUveuhpldLVjKHQmWjuafW3p7cDGznyUv4W8b3J2GcPE8ch+jus5UtDMVdGmi
         5pHwF471HqnbCFvXlkAtN2UtQ3uOGm8zsJ9gHKCGpN08WfseFbDtgUCkBHD+uMeMBE9D
         9F7MIKXONOLEUZxupzP7ZiwbgUfOMGUlYpZdNtnwJuyZLS0fGyJMydbr/KDnTaDQx/nL
         ImLA==
X-Forwarded-Encrypted: i=1; AJvYcCW+GqUlfvFKrr+Y8V/ZaI25/BzK/augCBz9zZOC+1Ho8SVJCvFysVHwbZvSEy0OzE2b3dk046zf1bY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9DSE58CVEBqddDOh7gSX6/ywC9+FGX1L6pG8w9gQoDG+bpG0o
	E/ZBeHaP9c0TTz06IGiyUY0FpR4qy/fKIZHlkrV7hEcRPWZwagm+ncH6UVqfuzIoEFWrJlzDCvc
	Gm++bTw==
X-Google-Smtp-Source: AGHT+IEv/lsCJTvAMTt82qYQ74YEmuDhqDy/AIKEkMbUihLXDbLqrOMm3UgmKM47ElROS0wMJkdtmjAP5S0=
X-Received: from pjbsn13.prod.google.com ([2002:a17:90b:2e8d:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:554e:b0:31e:ff97:75a1
 with SMTP id 98e67ed59e1d1-32166c19241mr5583048a91.3.1754510305634; Wed, 06
 Aug 2025 12:58:25 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:53 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-32-seanjc@google.com>
Subject: [PATCH v5 31/44] KVM: x86/pmu: Restrict GLOBAL_{CTRL,STATUS}, fixed
 PMCs, and PEBS to PMU v2+
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
X-CRM114-CacheID: sfid-20250806_125826_738090_3EB85DF6 
X-CRM114-Status: GOOD (  11.72  )
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

Restrict support for GLOBAL_CTRL, GLOBAL_STATUS, fixed PMCs, and PEBS to
v2 or later vPMUs.  The SDM explicitly states that GLOBAL_{CTRL,STATUS} and
fixed counters were introduced with PMU v2, and PEBS has hard dependencies
on fixed counters and the bitmap MSR layouts established by PMU v2.

Reported-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/pmu_intel.c | 51 ++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 1de94a39ca18..779b4e64acac 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -541,16 +541,33 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 				      kvm_pmu_cap.events_mask_len);
 	pmu->available_event_types = ~entry->ebx & (BIT_ULL(eax.split.mask_length) - 1);
 
-	if (pmu->version == 1) {
-		pmu->nr_arch_fixed_counters = 0;
-	} else {
-		pmu->nr_arch_fixed_counters = min_t(int, edx.split.num_counters_fixed,
-						    kvm_pmu_cap.num_counters_fixed);
-		edx.split.bit_width_fixed = min_t(int, edx.split.bit_width_fixed,
-						  kvm_pmu_cap.bit_width_fixed);
-		pmu->counter_bitmask[KVM_PMC_FIXED] = BIT_ULL(edx.split.bit_width_fixed) - 1;
+	entry = kvm_find_cpuid_entry_index(vcpu, 7, 0);
+	if (entry &&
+	    (boot_cpu_has(X86_FEATURE_HLE) || boot_cpu_has(X86_FEATURE_RTM)) &&
+	    (entry->ebx & (X86_FEATURE_HLE|X86_FEATURE_RTM))) {
+		pmu->reserved_bits ^= HSW_IN_TX;
+		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
 	}
 
+	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
+	if (intel_pmu_lbr_is_compatible(vcpu) &&
+	    (perf_capabilities & PERF_CAP_LBR_FMT))
+		memcpy(&lbr_desc->records, &vmx_lbr_caps, sizeof(vmx_lbr_caps));
+	else
+		lbr_desc->records.nr = 0;
+
+	if (lbr_desc->records.nr)
+		bitmap_set(pmu->all_valid_pmc_idx, INTEL_PMC_IDX_FIXED_VLBR, 1);
+
+	if (pmu->version == 1)
+		return;
+
+	pmu->nr_arch_fixed_counters = min_t(int, edx.split.num_counters_fixed,
+					    kvm_pmu_cap.num_counters_fixed);
+	edx.split.bit_width_fixed = min_t(int, edx.split.bit_width_fixed,
+					  kvm_pmu_cap.bit_width_fixed);
+	pmu->counter_bitmask[KVM_PMC_FIXED] = BIT_ULL(edx.split.bit_width_fixed) - 1;
+
 	intel_pmu_enable_fixed_counter_bits(pmu, INTEL_FIXED_0_KERNEL |
 						 INTEL_FIXED_0_USER |
 						 INTEL_FIXED_0_ENABLE_PMI);
@@ -571,24 +588,6 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 		pmu->global_status_rsvd &=
 				~MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI;
 
-	entry = kvm_find_cpuid_entry_index(vcpu, 7, 0);
-	if (entry &&
-	    (boot_cpu_has(X86_FEATURE_HLE) || boot_cpu_has(X86_FEATURE_RTM)) &&
-	    (entry->ebx & (X86_FEATURE_HLE|X86_FEATURE_RTM))) {
-		pmu->reserved_bits ^= HSW_IN_TX;
-		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
-	}
-
-	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
-	if (intel_pmu_lbr_is_compatible(vcpu) &&
-	    (perf_capabilities & PERF_CAP_LBR_FMT))
-		memcpy(&lbr_desc->records, &vmx_lbr_caps, sizeof(vmx_lbr_caps));
-	else
-		lbr_desc->records.nr = 0;
-
-	if (lbr_desc->records.nr)
-		bitmap_set(pmu->all_valid_pmc_idx, INTEL_PMC_IDX_FIXED_VLBR, 1);
-
 	if (perf_capabilities & PERF_CAP_PEBS_FORMAT) {
 		if (perf_capabilities & PERF_CAP_PEBS_BASELINE) {
 			pmu->pebs_enable_rsvd = counter_rsvd;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
