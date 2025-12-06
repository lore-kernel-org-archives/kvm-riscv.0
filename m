Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA6ED3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+vb10R8mtt1mOsajnAKAo8CuujVbgxj1aj1zCYusxE=; b=trSVb6KXPqBeIA
	bcsTZEJuhs2aSCQYrHCtdMuYJFzi2mXJGADMQz+xuDyvGYnIAxtDeKG4Lwvrq1CiZ8gvFXV/NIAKB
	6O8CTbvIjCJY/Z6SbgGCV1PfOIu6dpq11QTMKUjNQadZ45x7xUSXyPMWHZ6zuaDrbyPgCJoin58jC
	wGXI58XBN4XLgk5NPOs9TpSEAmR2Ergf0KCM+fQ0xnaDdbGVKAC8xToYJJzxfd88J/xqeJnFkwFf9
	p7iVnGI7TdOugG9ACxfGdQDIEJo4t3h4rY30RqtWT/i9nGhoa0EaiYYEtTymJ88LvAq9sayff13km
	ZfBVXSVPwI/kWlZUMDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1Y-0000000AHnZ-3PAb;
	Sat, 06 Dec 2025 00:19:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0E-0000000AFOM-1ovX
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:24 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-343daf0f488so2945615a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980301; x=1765585101; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=woqdwqYc7rQiICol2w1MfYRG1IsQA6G0tPae7LPMVAU=;
        b=Kswnow/o8rmoslhYrqkNCF/lVGNK0uSa6EJeKSugih0HyP3upliAMgHiR2roT+aQh1
         JrSjzUh+YnqrnYg2i/98Up0BemGeGLThDaTLcgP9grWmjswerspfTkCLg1RPIP/rBhr0
         nAdfMKAeW0Qp+IGg9oJg0jdZMjBtA3KFI7EtmtP8JjOYt+CWSB/7SPdc5e97bJiHAf/o
         aT3M/dIFl8I5Sv9z8HLjMY4TynTwFfmGybU2CmVATTpNrWKl+RY2bKnrlLbnusCYz1My
         l8FcRYQ6XuKwICvCghME2mOJa3wqrKRwb49U2PArfiluF0GU/9DpbGV+qgL5o3zUs1eF
         eCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980301; x=1765585101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woqdwqYc7rQiICol2w1MfYRG1IsQA6G0tPae7LPMVAU=;
        b=RMp1g2YK8wvkSKAoIHSC8glMZCPggEo+RLP7anhBESsozG66RkPLot/A+kKz135D8H
         3Q3cT4S67aERMEAHBNtFYYmVhsWmZ19cKI9ynJ0LKicwMp52gZHpkmxsxDB78kOW67Kh
         xH5Q7mcO4weMj06Aohfz0CdvoXG+so5mVZH57dUKz2WoYHDjwV9hJM1qdRzlTB5zM9/t
         phGEcERXMCoRDBV+px/+NQGB5xO7S9ONY1Gheh+137eLNCHxx8XKZgLxNcS3EBwwwYpq
         LvE2vFPuRtOfaRwD599lHyvAygjI59yDcDDCyetE+sySKST9uaEOuOwAsCYkPzL+f2eM
         j8aA==
X-Forwarded-Encrypted: i=1; AJvYcCXdTWutI2b7J4F0vTVyf6NzrCr7oxdksea9il0Yvc6o/xvrxy85zRej+pTGDtqO0zQTZYSaOA2TNQY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Ekq/dhrWhA1OnD7FLB6qZyEzOJkGYtkY4rM48iM5EKyJDFIP
	HilVk+kMOwdCcGEEOW/JUGaAQen03wEuy8KcJuNkc7hF/gFmlDqSrWrJGrw279SqjuOR2O4NQu6
	AZAYZZQ==
X-Google-Smtp-Source: AGHT+IFJtzUjMs3EhF2cTLNE2/+KZsTfbuJQ6pRxxJNiALtopWi5CNU9QJ//pu80N197imWodywRwcS+L+M=
X-Received: from pjxx15.prod.google.com ([2002:a17:90b:58cf:b0:340:bb32:f5cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33d1:b0:341:194:5e7d
 with SMTP id 98e67ed59e1d1-349a2686534mr715053a91.24.1764980300781; Fri, 05
 Dec 2025 16:18:20 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:03 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-28-seanjc@google.com>
Subject: [PATCH v6 27/44] KVM: x86/pmu: Load/put mediated PMU context when
 entering/exiting guest
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
X-CRM114-CacheID: sfid-20251205_161822_630955_516F778C 
X-CRM114-Status: GOOD (  21.99  )
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

Implement the PMU "world switch" between host perf and guest mediated PMU.
When loading guest state, call into perf to switch from host to guest, and
then load guest state into hardware, and then reverse those actions when
putting guest state.

On the KVM side, when loading guest state, zero PERF_GLOBAL_CTRL to ensure
all counters are disabled, then load selectors and counters, and finally
call into vendor code to load control/status information.  While VMX and
SVM use different mechanisms to avoid counting host activity while guest
controls are loaded, both implementations require PERF_GLOBAL_CTRL to be
zeroed when the event selectors are in flux.

When putting guest state, reverse the order, and save and zero controls
and status prior to saving+zeroing selectors and counters.  Defer clearing
PERF_GLOBAL_CTRL to vendor code, as only SVM needs to manually clear the
MSR; VMX configures PERF_GLOBAL_CTRL to be atomically cleared by the CPU
on VM-Exit.

Handle the difference in MSR layouts between Intel and AMD by communicating
the bases and stride via kvm_pmu_ops.  Because KVM requires Intel v4 (and
full-width writes) and AMD v2, the MSRs to load/save are constant for a
given vendor, i.e. do not vary based on the guest PMU, and do not vary
based on host PMU (because KVM will simply disable mediated PMU support if
the necessary MSRs are unsupported).

Except for retrieving the guest's PERF_GLOBAL_CTRL, which needs to be read
before invoking any fastpath handler (spoiler alert), perform the context
switch around KVM's inner run loop.  State only needs to be synchronized
from hardware before KVM can access the software "caches".

Note, VMX already grabs the guest's PERF_GLOBAL_CTRL immediately after
VM-Exit, as hardware saves value into the VMCS.

Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-pmu-ops.h |   2 +
 arch/x86/include/asm/msr-index.h       |   1 +
 arch/x86/kvm/pmu.c                     | 130 ++++++++++++++++++++++++-
 arch/x86/kvm/pmu.h                     |  10 ++
 arch/x86/kvm/svm/pmu.c                 |  34 +++++++
 arch/x86/kvm/svm/svm.c                 |   3 +
 arch/x86/kvm/vmx/pmu_intel.c           |  44 +++++++++
 arch/x86/kvm/x86.c                     |   4 +
 8 files changed, 225 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-pmu-ops.h b/arch/x86/include/asm/kvm-x86-pmu-ops.h
index ad2cc82abf79..f0aa6996811f 100644
--- a/arch/x86/include/asm/kvm-x86-pmu-ops.h
+++ b/arch/x86/include/asm/kvm-x86-pmu-ops.h
@@ -24,6 +24,8 @@ KVM_X86_PMU_OP_OPTIONAL(deliver_pmi)
 KVM_X86_PMU_OP_OPTIONAL(cleanup)
 
 KVM_X86_PMU_OP_OPTIONAL(write_global_ctrl)
+KVM_X86_PMU_OP(mediated_load)
+KVM_X86_PMU_OP(mediated_put)
 
 #undef KVM_X86_PMU_OP
 #undef KVM_X86_PMU_OP_OPTIONAL
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 9e1720d73244..0ba08fd4ac3f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1191,6 +1191,7 @@
 #define MSR_CORE_PERF_GLOBAL_STATUS	0x0000038e
 #define MSR_CORE_PERF_GLOBAL_CTRL	0x0000038f
 #define MSR_CORE_PERF_GLOBAL_OVF_CTRL	0x00000390
+#define MSR_CORE_PERF_GLOBAL_STATUS_SET	0x00000391
 
 #define MSR_PERF_METRICS		0x00000329
 
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 39904e6fd227..578bf996bda2 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -882,10 +882,13 @@ int kvm_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			diff = pmu->global_ctrl ^ data;
 			pmu->global_ctrl = data;
 			reprogram_counters(pmu, diff);
-
-			if (kvm_vcpu_has_mediated_pmu(vcpu))
-				kvm_pmu_call(write_global_ctrl)(data);
 		}
+		/*
+		 * Unconditionally forward writes to vendor code, i.e. to the
+		 * VMC{B,S}, as pmu->global_ctrl is per-VCPU, not per-VMC{B,S}.
+		 */
+		if (kvm_vcpu_has_mediated_pmu(vcpu))
+			kvm_pmu_call(write_global_ctrl)(data);
 		break;
 	case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
 		/*
@@ -1246,3 +1249,124 @@ int kvm_vm_ioctl_set_pmu_event_filter(struct kvm *kvm, void __user *argp)
 	kfree(filter);
 	return r;
 }
+
+static __always_inline u32 fixed_counter_msr(u32 idx)
+{
+	return kvm_pmu_ops.FIXED_COUNTER_BASE + idx * kvm_pmu_ops.MSR_STRIDE;
+}
+
+static __always_inline u32 gp_counter_msr(u32 idx)
+{
+	return kvm_pmu_ops.GP_COUNTER_BASE + idx * kvm_pmu_ops.MSR_STRIDE;
+}
+
+static __always_inline u32 gp_eventsel_msr(u32 idx)
+{
+	return kvm_pmu_ops.GP_EVENTSEL_BASE + idx * kvm_pmu_ops.MSR_STRIDE;
+}
+
+static void kvm_pmu_load_guest_pmcs(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	u32 i;
+
+	/*
+	 * No need to zero out unexposed GP/fixed counters/selectors since RDPMC
+	 * is intercepted if hardware has counters that aren't visible to the
+	 * guest (KVM will inject #GP as appropriate).
+	 */
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		pmc = &pmu->gp_counters[i];
+
+		wrmsrl(gp_counter_msr(i), pmc->counter);
+		wrmsrl(gp_eventsel_msr(i), pmc->eventsel_hw);
+	}
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
+		pmc = &pmu->fixed_counters[i];
+
+		wrmsrl(fixed_counter_msr(i), pmc->counter);
+	}
+}
+
+void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_vcpu_has_mediated_pmu(vcpu) ||
+	    KVM_BUG_ON(!lapic_in_kernel(vcpu), vcpu->kvm))
+		return;
+
+	lockdep_assert_irqs_disabled();
+
+	perf_load_guest_context();
+
+	/*
+	 * Explicitly clear PERF_GLOBAL_CTRL, as "loading" the guest's context
+	 * disables all individual counters (if any were enabled), but doesn't
+	 * globally disable the entire PMU.  Loading event selectors and PMCs
+	 * with guest values while PERF_GLOBAL_CTRL is non-zero will generate
+	 * unexpected events and PMIs.
+	 *
+	 * VMX will enable/disable counters at VM-Enter/VM-Exit by atomically
+	 * loading PERF_GLOBAL_CONTROL.  SVM effectively performs the switch by
+	 * configuring all events to be GUEST_ONLY.  Clear PERF_GLOBAL_CONTROL
+	 * even for SVM to minimize the damage if a perf event is left enabled,
+	 * and to ensure a consistent starting state.
+	 */
+	wrmsrq(kvm_pmu_ops.PERF_GLOBAL_CTRL, 0);
+
+	perf_load_guest_lvtpc(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
+
+	kvm_pmu_load_guest_pmcs(vcpu);
+
+	kvm_pmu_call(mediated_load)(vcpu);
+}
+
+static void kvm_pmu_put_guest_pmcs(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct kvm_pmc *pmc;
+	u32 i;
+
+	/*
+	 * Clear selectors and counters to ensure hardware doesn't count using
+	 * guest controls when the host (perf) restores its state.
+	 */
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		pmc = &pmu->gp_counters[i];
+
+		pmc->counter = rdpmc(i);
+		if (pmc->counter)
+			wrmsrq(gp_counter_msr(i), 0);
+		if (pmc->eventsel_hw)
+			wrmsrq(gp_eventsel_msr(i), 0);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
+		pmc = &pmu->fixed_counters[i];
+
+		pmc->counter = rdpmc(INTEL_PMC_FIXED_RDPMC_BASE | i);
+		if (pmc->counter)
+			wrmsrq(fixed_counter_msr(i), 0);
+	}
+}
+
+void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_vcpu_has_mediated_pmu(vcpu) ||
+	    KVM_BUG_ON(!lapic_in_kernel(vcpu), vcpu->kvm))
+		return;
+
+	lockdep_assert_irqs_disabled();
+
+	/*
+	 * Defer handling of PERF_GLOBAL_CTRL to vendor code.  On Intel, it's
+	 * atomically cleared on VM-Exit, i.e. doesn't need to be clear here.
+	 */
+	kvm_pmu_call(mediated_put)(vcpu);
+
+	kvm_pmu_put_guest_pmcs(vcpu);
+
+	perf_put_guest_lvtpc();
+
+	perf_put_guest_context();
+}
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 9a199109d672..25b583da9ee2 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -38,11 +38,19 @@ struct kvm_pmu_ops {
 	void (*cleanup)(struct kvm_vcpu *vcpu);
 
 	bool (*is_mediated_pmu_supported)(struct x86_pmu_capability *host_pmu);
+	void (*mediated_load)(struct kvm_vcpu *vcpu);
+	void (*mediated_put)(struct kvm_vcpu *vcpu);
 	void (*write_global_ctrl)(u64 global_ctrl);
 
 	const u64 EVENTSEL_EVENT;
 	const int MAX_NR_GP_COUNTERS;
 	const int MIN_NR_GP_COUNTERS;
+
+	const u32 PERF_GLOBAL_CTRL;
+	const u32 GP_EVENTSEL_BASE;
+	const u32 GP_COUNTER_BASE;
+	const u32 FIXED_COUNTER_BASE;
+	const u32 MSR_STRIDE;
 };
 
 void kvm_pmu_ops_update(const struct kvm_pmu_ops *pmu_ops);
@@ -240,6 +248,8 @@ void kvm_pmu_destroy(struct kvm_vcpu *vcpu);
 int kvm_vm_ioctl_set_pmu_event_filter(struct kvm *kvm, void __user *argp);
 void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu);
 void kvm_pmu_branch_retired(struct kvm_vcpu *vcpu);
+void kvm_mediated_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_mediated_pmu_put(struct kvm_vcpu *vcpu);
 
 bool is_vmware_backdoor_pmc(u32 pmc_idx);
 bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 6d5f791126b1..7aa298eeb072 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -234,6 +234,32 @@ static bool amd_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pm
 	return host_pmu->version >= 2;
 }
 
+static void amd_mediated_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	u64 global_status;
+
+	rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_STATUS, global_status);
+	/* Clear host global_status MSR if non-zero. */
+	if (global_status)
+		wrmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR, global_status);
+
+	wrmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET, pmu->global_status);
+	wrmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, pmu->global_ctrl);
+}
+
+static void amd_mediated_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	wrmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, 0);
+	rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_STATUS, pmu->global_status);
+
+	/* Clear global status bits if non-zero */
+	if (pmu->global_status)
+		wrmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR, pmu->global_status);
+}
+
 struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = amd_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = amd_msr_idx_to_pmc,
@@ -245,8 +271,16 @@ struct kvm_pmu_ops amd_pmu_ops __initdata = {
 	.init = amd_pmu_init,
 
 	.is_mediated_pmu_supported = amd_pmu_is_mediated_pmu_supported,
+	.mediated_load = amd_mediated_pmu_load,
+	.mediated_put = amd_mediated_pmu_put,
 
 	.EVENTSEL_EVENT = AMD64_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_AMD_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = AMD64_NUM_COUNTERS,
+
+	.PERF_GLOBAL_CTRL = MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+	.GP_EVENTSEL_BASE = MSR_F15H_PERF_CTL0,
+	.GP_COUNTER_BASE = MSR_F15H_PERF_CTR0,
+	.FIXED_COUNTER_BASE = 0,
+	.MSR_STRIDE = 2,
 };
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index fa04e58ff524..cbebd3a18918 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4368,6 +4368,9 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
 
+	if (!msr_write_intercepted(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL))
+		rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, vcpu_to_pmu(vcpu)->global_ctrl);
+
 	trace_kvm_exit(vcpu, KVM_ISA_SVM);
 
 	svm_complete_interrupts(vcpu);
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 855240678300..55249fa4db95 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -792,6 +792,42 @@ static void intel_pmu_write_global_ctrl(u64 global_ctrl)
 	vmcs_write64(GUEST_IA32_PERF_GLOBAL_CTRL, global_ctrl);
 }
 
+
+static void intel_mediated_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	u64 global_status, toggle;
+
+	rdmsrq(MSR_CORE_PERF_GLOBAL_STATUS, global_status);
+	toggle = pmu->global_status ^ global_status;
+	if (global_status & toggle)
+		wrmsrq(MSR_CORE_PERF_GLOBAL_OVF_CTRL, global_status & toggle);
+	if (pmu->global_status & toggle)
+		wrmsrq(MSR_CORE_PERF_GLOBAL_STATUS_SET, pmu->global_status & toggle);
+
+	wrmsrq(MSR_CORE_PERF_FIXED_CTR_CTRL, pmu->fixed_ctr_ctrl_hw);
+}
+
+static void intel_mediated_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	/* MSR_CORE_PERF_GLOBAL_CTRL is already saved at VM-exit. */
+	rdmsrq(MSR_CORE_PERF_GLOBAL_STATUS, pmu->global_status);
+
+	/* Clear hardware MSR_CORE_PERF_GLOBAL_STATUS MSR, if non-zero. */
+	if (pmu->global_status)
+		wrmsrq(MSR_CORE_PERF_GLOBAL_OVF_CTRL, pmu->global_status);
+
+	/*
+	 * Clear hardware FIXED_CTR_CTRL MSR to avoid information leakage and
+	 * also to avoid accidentally enabling fixed counters (based on guest
+	 * state) while running in the host, e.g. when setting global ctrl.
+	 */
+	if (pmu->fixed_ctr_ctrl_hw)
+		wrmsrq(MSR_CORE_PERF_FIXED_CTR_CTRL, 0);
+}
+
 struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = intel_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = intel_msr_idx_to_pmc,
@@ -805,9 +841,17 @@ struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.cleanup = intel_pmu_cleanup,
 
 	.is_mediated_pmu_supported = intel_pmu_is_mediated_pmu_supported,
+	.mediated_load = intel_mediated_pmu_load,
+	.mediated_put = intel_mediated_pmu_put,
 	.write_global_ctrl = intel_pmu_write_global_ctrl,
 
 	.EVENTSEL_EVENT = ARCH_PERFMON_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_INTEL_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = 1,
+
+	.PERF_GLOBAL_CTRL = MSR_CORE_PERF_GLOBAL_CTRL,
+	.GP_EVENTSEL_BASE = MSR_P6_EVNTSEL0,
+	.GP_COUNTER_BASE = MSR_IA32_PMC0,
+	.FIXED_COUNTER_BASE = MSR_CORE_PERF_FIXED_CTR0,
+	.MSR_STRIDE = 1,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 76e86eb358df..589a309259f4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11334,6 +11334,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		run_flags |= KVM_RUN_LOAD_DEBUGCTL;
 	vcpu->arch.host_debugctl = debug_ctl;
 
+	kvm_mediated_pmu_load(vcpu);
+
 	guest_timing_enter_irqoff();
 
 	/*
@@ -11372,6 +11374,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 
 	kvm_load_host_pkru(vcpu);
 
+	kvm_mediated_pmu_put(vcpu);
+
 	/*
 	 * Do this here before restoring debug registers on the host.  And
 	 * since we do this before handling the vmexit, a DR access vmexit
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
