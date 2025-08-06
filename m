Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B848C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNrSErJqL8qTgIm0+3x0hscfu0/CjVODTzyncZYhaJ4=; b=fUMNFH+LCG+6/c
	00IZwR1Vo2Zf9g+0E3ooXgeH6/pyn6jq7WPumMEOACIpp2ZqU2DrYlZtmVNWjVztTI22Ci2jMQomB
	f4CsyMEesyJlwuoVgfechBFjimF2uRqS3eFNTETxDE6UhcpRTTV0NX24o2Mj63zIYkbGh7mCpZJN5
	vpVHyrj9T7UnK82UaOf2AIoHXqXkqJ5TYuT+jAezTYzxX35bIQYUKP9UEeODtv2sH7Z9m4Skh0mCE
	fJQbWSxXf4CVw6SobIHScX2gfWb8+69JhqOBrLH5vbPU/4fPjnNlR0U9MZTbf3GCehbBeVU1DDeEi
	oWxgP8n+87CaVT96wVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlcA-0000000GYrI-0Gpo;
	Wed, 06 Aug 2025 21:24:02 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHM-0000000GGtd-1Vd4
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:29 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2400117dd80so1277475ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510307; x=1755115107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OFlIqQp7LfOXLtzFAGq5nR1orhSSuVevPR/iGUx1pag=;
        b=4bro+vNAPF7uaHbN4lhWGuINOUsqvmU5Lkv0cTEm8v3HYx8BM+xvgIaLt81rEwQzXE
         ePdQDDjnsVmch/IsqDbcQZkrrJ3kzCH7Ecz4NUs8UKc/B5iCc56HXBjo9JXahCTDjefL
         kCHyCb/M2Wray/wgpXi0jmJXf0X8rgfIeu/AcPEqcJbMRsFh/CXaJxBIpbC7ZpO2QNn6
         nBfu0QtdQ9vI4hhkA6E41sEaqmPbIZCVIEj6+7VWM9wMESxBxN2FVF1LN4JhJ2nq/9iJ
         mnRBidhmAAa7LF+kOmy6h/fnTKJ1y3v6t80pFuq8GQfqpG+Hj03iMC859s1pqoJ34XY/
         hS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510307; x=1755115107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFlIqQp7LfOXLtzFAGq5nR1orhSSuVevPR/iGUx1pag=;
        b=nT4RBWcW+tp+JhO43RTA3j2X9Wt8jZQ4paMHm4WLOzAIZQFIn+wRpTSDl68W0ZQRsk
         xldu43q1UF4seS5oNCuoowGaJFLSaLBIB0bCVw6WwlnH7DXaymoFOkroeqcuXDewL3Xl
         PlRgRak911hfJHwCXT0IpdOtFJZ6VQVkB0bbrKzEPCpCDQ4Jot+yuacYrBpxcXBfeZmE
         e3q7lfkN6uQKXvmieoM8+AOONRvIGVurTrw9p8EA9dHQuhgYqym6851NcyezLVOqqtOU
         o9MaBRYA6OVav/jxkyuc4JLKluus6RqzDUyNxoO5oYnGFeiuT7SShxLu8sxvb4rrpON5
         4zGA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mFVAuwpskFC4m0+Tnrp2GmRB15apEfVqTDcVtK54kwa18ADxrHb2+U8IEP2CvrqOGCqMkdzOhu4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2vaI71m9DwSgxin6AYsecS+aKb90H2iIfWc8pSED3WJy4wM3h
	pPlwkEAYJhbtvjPpDG95vv8VQ6INn0EiTx3+/1D0E7Z0U536kdY1iBB9HZYoI0PJEMtrtSp9+RI
	uTKu94Q==
X-Google-Smtp-Source: AGHT+IExoXGbX1n3oux0+ebgASacivEUZvDFKwtmFYuGqpCTA7y0Fiel45h6jynxmc5ok7SFueltFvmebss=
X-Received: from pjbqb13.prod.google.com ([2002:a17:90b:280d:b0:31c:160d:e3be])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e810:b0:240:10dc:b7c9
 with SMTP id d9443c01a7336-2429f1e410amr61901265ad.9.1754510307282; Wed, 06
 Aug 2025 12:58:27 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:54 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-33-seanjc@google.com>
Subject: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
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
X-CRM114-CacheID: sfid-20250806_125828_396146_2618B8E1 
X-CRM114-Status: GOOD (  21.79  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

For vCPUs with a mediated vPMU, disable interception of counter MSRs for
PMCs that are exposed to the guest, and for GLOBAL_CTRL and related MSRs
if they are fully supported according to the vCPU model, i.e. if the MSRs
and all bits supported by hardware exist from the guest's point of view.

Do NOT passthrough event selector or fixed counter control MSRs, so that
KVM can enforce userspace-defined event filters, e.g. to prevent use of
AnyThread events (which is unfortunately a setting in the fixed counter
control MSR).

Defer support for nested passthrough of mediated PMU MSRs to the future,
as the logic for nested MSR interception is unfortunately vendor specific.

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: squash patches, massage changelog, refresh VMX MSRs on filter change]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/msr-index.h |  1 +
 arch/x86/kvm/pmu.c               | 34 ++++++++++++------
 arch/x86/kvm/pmu.h               |  1 +
 arch/x86/kvm/svm/svm.c           | 36 +++++++++++++++++++
 arch/x86/kvm/vmx/pmu_intel.c     | 13 -------
 arch/x86/kvm/vmx/pmu_intel.h     | 15 ++++++++
 arch/x86/kvm/vmx/vmx.c           | 59 ++++++++++++++++++++++++++------
 7 files changed, 124 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index f19d1ee9a396..06bd7aaae931 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -736,6 +736,7 @@
 #define MSR_AMD64_PERF_CNTR_GLOBAL_STATUS	0xc0000300
 #define MSR_AMD64_PERF_CNTR_GLOBAL_CTL		0xc0000301
 #define MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR	0xc0000302
+#define MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET	0xc0000303
 
 /* AMD Last Branch Record MSRs */
 #define MSR_AMD64_LBR_SELECT			0xc000010e
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 4246e1d2cfcc..817ef852bdf9 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -715,18 +715,14 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	return 0;
 }
 
-bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
+bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
 	if (!kvm_vcpu_has_mediated_pmu(vcpu))
 		return true;
 
-	/*
-	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
-	 * in Ring3 when CR4.PCE=0.
-	 */
-	if (enable_vmware_backdoor)
+	if (!kvm_pmu_has_perf_global_ctrl(pmu))
 		return true;
 
 	/*
@@ -735,7 +731,22 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
 	 * capabilities themselves may be a subset of hardware capabilities.
 	 */
 	return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
-	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed ||
+	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
+}
+EXPORT_SYMBOL_GPL(kvm_need_perf_global_ctrl_intercept);
+
+bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	/*
+	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
+	 * in Ring3 when CR4.PCE=0.
+	 */
+	if (enable_vmware_backdoor)
+		return true;
+
+	return kvm_need_perf_global_ctrl_intercept(vcpu) ||
 	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
 	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
 }
@@ -927,11 +938,12 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
 	 * in the global controls).  Emulate that behavior when refreshing the
 	 * PMU so that userspace doesn't need to manually set PERF_GLOBAL_CTRL.
 	 */
-	if (kvm_pmu_has_perf_global_ctrl(pmu) && pmu->nr_arch_gp_counters) {
+	if (pmu->nr_arch_gp_counters &&
+	    (kvm_pmu_has_perf_global_ctrl(pmu) || kvm_vcpu_has_mediated_pmu(vcpu)))
 		pmu->global_ctrl = GENMASK_ULL(pmu->nr_arch_gp_counters - 1, 0);
-		if (kvm_vcpu_has_mediated_pmu(vcpu))
-			kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
-	}
+
+	if (kvm_vcpu_has_mediated_pmu(vcpu))
+		kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
 
 	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
 	bitmap_set(pmu->all_valid_pmc_idx, KVM_FIXED_PMC_BASE_IDX,
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index dcf4e2253875..51963a3a167a 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -239,6 +239,7 @@ void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu);
 void kvm_pmu_branch_retired(struct kvm_vcpu *vcpu);
 
 bool is_vmware_backdoor_pmc(u32 pmc_idx);
+bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu);
 bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu);
 
 extern struct kvm_pmu_ops intel_pmu_ops;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 2d42962b47aa..add50b64256c 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -790,6 +790,40 @@ void svm_vcpu_free_msrpm(void *msrpm)
 	__free_pages(virt_to_page(msrpm), get_order(MSRPM_SIZE));
 }
 
+static void svm_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	bool intercept = !kvm_vcpu_has_mediated_pmu(vcpu);
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	int i;
+
+	if (!enable_mediated_pmu)
+		return;
+
+	/* Legacy counters are always available for AMD CPUs with a PMU. */
+	for (i = 0; i < min(pmu->nr_arch_gp_counters, AMD64_NUM_COUNTERS); i++)
+		svm_set_intercept_for_msr(vcpu, MSR_K7_PERFCTR0 + i,
+					  MSR_TYPE_RW, intercept);
+
+	intercept |= !guest_cpu_cap_has(vcpu, X86_FEATURE_PERFCTR_CORE);
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++)
+		svm_set_intercept_for_msr(vcpu, MSR_F15H_PERF_CTR + 2 * i,
+					  MSR_TYPE_RW, intercept);
+
+	for ( ; i < kvm_pmu_cap.num_counters_gp; i++)
+		svm_enable_intercept_for_msr(vcpu, MSR_F15H_PERF_CTR + 2 * i,
+					     MSR_TYPE_RW);
+
+	intercept = kvm_need_perf_global_ctrl_intercept(vcpu);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET,
+				  MSR_TYPE_RW, intercept);
+}
+
 static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -847,6 +881,8 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	if (sev_es_guest(vcpu->kvm))
 		sev_es_recalc_msr_intercepts(vcpu);
 
+	svm_recalc_pmu_msr_intercepts(vcpu);
+
 	/*
 	 * x2APIC intercepts are modified on-demand and cannot be filtered by
 	 * userspace.
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 779b4e64acac..2bdddb95816e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -128,19 +128,6 @@ static struct kvm_pmc *intel_rdpmc_ecx_to_pmc(struct kvm_vcpu *vcpu,
 	return &counters[array_index_nospec(idx, num_counters)];
 }
 
-static inline u64 vcpu_get_perf_capabilities(struct kvm_vcpu *vcpu)
-{
-	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_PDCM))
-		return 0;
-
-	return vcpu->arch.perf_capabilities;
-}
-
-static inline bool fw_writes_is_enabled(struct kvm_vcpu *vcpu)
-{
-	return (vcpu_get_perf_capabilities(vcpu) & PERF_CAP_FW_WRITES) != 0;
-}
-
 static inline struct kvm_pmc *get_fw_gp_pmc(struct kvm_pmu *pmu, u32 msr)
 {
 	if (!fw_writes_is_enabled(pmu_to_vcpu(pmu)))
diff --git a/arch/x86/kvm/vmx/pmu_intel.h b/arch/x86/kvm/vmx/pmu_intel.h
index 5620d0882cdc..5d9357640aa1 100644
--- a/arch/x86/kvm/vmx/pmu_intel.h
+++ b/arch/x86/kvm/vmx/pmu_intel.h
@@ -4,6 +4,21 @@
 
 #include <linux/kvm_host.h>
 
+#include "cpuid.h"
+
+static inline u64 vcpu_get_perf_capabilities(struct kvm_vcpu *vcpu)
+{
+	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_PDCM))
+		return 0;
+
+	return vcpu->arch.perf_capabilities;
+}
+
+static inline bool fw_writes_is_enabled(struct kvm_vcpu *vcpu)
+{
+	return (vcpu_get_perf_capabilities(vcpu) & PERF_CAP_FW_WRITES) != 0;
+}
+
 bool intel_pmu_lbr_is_enabled(struct kvm_vcpu *vcpu);
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1233a0afb31e..85bd82d41f94 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4068,6 +4068,53 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	bool intercept = !has_mediated_pmu;
+	int i;
+
+	if (!enable_mediated_pmu)
+		return;
+
+	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
+				    has_mediated_pmu);
+
+	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
+					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
+				   has_mediated_pmu);
+
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
+					  MSR_TYPE_RW, intercept);
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PMC0 + i, MSR_TYPE_RW,
+					  intercept || !fw_writes_is_enabled(vcpu));
+	}
+	for ( ; i < kvm_pmu_cap.num_counters_gp; i++) {
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
+					  MSR_TYPE_RW, true);
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PMC0 + i,
+					  MSR_TYPE_RW, true);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++)
+		vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_FIXED_CTR0 + i,
+					  MSR_TYPE_RW, intercept);
+	for ( ; i < kvm_pmu_cap.num_counters_fixed; i++)
+		vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_FIXED_CTR0 + i,
+					  MSR_TYPE_RW, true);
+
+	intercept = kvm_need_perf_global_ctrl_intercept(vcpu);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_STATUS,
+				  MSR_TYPE_RW, intercept);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_CTRL,
+				  MSR_TYPE_RW, intercept);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL,
+				  MSR_TYPE_RW, intercept);
+}
+
 static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	if (!cpu_has_vmx_msr_bitmap())
@@ -4115,17 +4162,7 @@ static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 		vmx_set_intercept_for_msr(vcpu, MSR_IA32_FLUSH_CMD, MSR_TYPE_W,
 					  !guest_cpu_cap_has(vcpu, X86_FEATURE_FLUSH_L1D));
 
-	if (enable_mediated_pmu) {
-		bool is_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
-		struct vcpu_vmx *vmx = to_vmx(vcpu);
-
-		vm_entry_controls_changebit(vmx,
-					    VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL, is_mediated_pmu);
-
-		vm_exit_controls_changebit(vmx,
-					   VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
-					   VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL, is_mediated_pmu);
-	}
+	vmx_recalc_pmu_msr_intercepts(vcpu);
 
 	/*
 	 * x2APIC and LBR MSR intercepts are modified on-demand and cannot be
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
