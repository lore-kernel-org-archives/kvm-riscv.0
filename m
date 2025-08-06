Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC05CC87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsDylNj56IrfhU2F6SijCwKv7HVuRjEfMpWkMTv2BnQ=; b=P46nmZ4JytFMGh
	14qibuwDQKV7pebl1WDo4j7zMXamz8tmeD8W0zGgx/wVzEai7a3JfIR5DY6v5jwQZnqhInYjQdw6k
	0sqhdCPAz7Hd7232iLtS6yPCmDE2ufteXI2TJpZusH2/NQMf8eXmUoRp6ebgs0sUAFH9FNsaevH5P
	v3d6ExqTQrlydiVoe5+RiDtLRx+p7EZp6ECRlfnow8ozEwkbWOyA0sZJx5pNwC/k9rz7S+6pNIrrW
	oI/n84A5mUJ3xPsQ2yjeQbkLbPzkJroTYqYST011GHQWxnvbJVBFUiR5MgFbclGorJDYCCzx2EhT6
	v9HnTbggWgwC3vHS/BPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmsS-0000000GkyV-1VUp;
	Wed, 06 Aug 2025 22:44:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHU-0000000GH4M-3pYM
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:38 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3214765a5b9so480299a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510316; x=1755115116; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zkAAwl8vElfQMpdapHv3m96nWKKm7bgpMF9fVPIUZ/g=;
        b=DPsCstxnm2MbO5QJ4YOXD7A2UICqGqWV0K4OfUXYgfTjPK9tmqlhXXHZqk4rqPZBlp
         TNF36FXy5ErSOUl5pP/2ph5XwICyAO4bzpM0g53jPhgxCqfakB1c4YKBOYANED+HB/ye
         eTNHc7USkTuG66OyT/zPCHVcAgGWvLezNRDE28JsEjIUNZ78/7nEP9d7l+Qhc1L+VuZm
         LyOCv4Rn88RONf1e/zaNBhO39n6JFJMDOeZXRkT3/cIUgN5zKRtGehBD4DUamzlJIhM2
         c/Ilxft5M25P9H280F0Ol62uMXV3O4LRnYORJWd6vTo6g9VHJ88psVdwlA5d9BsuSAnR
         gROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510316; x=1755115116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkAAwl8vElfQMpdapHv3m96nWKKm7bgpMF9fVPIUZ/g=;
        b=pe31v3/GMYOPPiKEZ8zJEcRy4ChOw1G+WgnYgOJZ7BtXTwigdGS0fLQqDHsb8MWeXu
         o1uE8QiXgyHxddzyp97sAdK5N+uQqGfcOylGSveaGrUh0qUzV+PzEqB5RpGTvDknOxT0
         uqkQ7Vo4hUPMldjd/RX7cPoM0pgVRwyYdmNTC4YnsuaO2WGzqi7dKQIg1syfQ2amG5QU
         0ONhP2MiBJz8H3hPy9jEAA0ySJKxavXveCoC823FjZpjz9BeIenPZGOGblgpv51ue2oC
         tzNRKOSf2GODaysPAauRxiD8nJ3sV9WS8RnAoXrtPk9LJ4m60yLpq7XHB00QLyI7ySHr
         ki3g==
X-Forwarded-Encrypted: i=1; AJvYcCVvpkZ8BrSIh7XwYmmnn1yNi50HiXHYW7q2hJuAC0+e3jCVwAK1lLd8jaz3wK+MBKpOEtlsrTQPL7c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYFThg06p+Xm+uveoIq6FYCmZJd36H80Kt4R76dPkQQfGnWK5y
	1h4l/LT4unojTnHZMlpt7qV4v8ZhqL2HCGcuSaZgFgYZo9LUsKA4TPareH4zZfqYooqvWDkI78W
	UZy3a4A==
X-Google-Smtp-Source: AGHT+IFaZiYR5zJC7+pYfASpXTxuG1epwB6mNpav4wNliQpQcOBcA3rZjhVGTTG4ScmGlrhUBGt34kaYMPo=
X-Received: from pjbqb13.prod.google.com ([2002:a17:90b:280d:b0:31f:61fc:b283])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d87:b0:31e:c630:ec93
 with SMTP id 98e67ed59e1d1-32166ca773bmr5198285a91.16.1754510316148; Wed, 06
 Aug 2025 12:58:36 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:59 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-38-seanjc@google.com>
Subject: [PATCH v5 37/44] KVM: x86/pmu: Load/put mediated PMU context when
 entering/exiting guest
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
X-CRM114-CacheID: sfid-20250806_125836_973359_3D59FDEC 
X-CRM114-Status: GOOD (  22.83  )
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
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-pmu-ops.h |   2 +
 arch/x86/include/asm/msr-index.h       |   1 +
 arch/x86/kvm/pmu.c                     | 111 +++++++++++++++++++++++++
 arch/x86/kvm/pmu.h                     |  10 +++
 arch/x86/kvm/svm/pmu.c                 |  34 ++++++++
 arch/x86/kvm/svm/svm.c                 |   3 +
 arch/x86/kvm/vmx/pmu_intel.c           |  45 ++++++++++
 arch/x86/kvm/x86.c                     |   4 +
 8 files changed, 210 insertions(+)

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
index 06bd7aaae931..0f50a74797a4 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1171,6 +1171,7 @@
 #define MSR_CORE_PERF_GLOBAL_STATUS	0x0000038e
 #define MSR_CORE_PERF_GLOBAL_CTRL	0x0000038f
 #define MSR_CORE_PERF_GLOBAL_OVF_CTRL	0x00000390
+#define MSR_CORE_PERF_GLOBAL_STATUS_SET	0x00000391
 
 #define MSR_PERF_METRICS		0x00000329
 
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index b4c6a7704a01..77042cad3155 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1234,3 +1234,114 @@ int kvm_vm_ioctl_set_pmu_event_filter(struct kvm *kvm, void __user *argp)
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
+	perf_load_guest_context(kvm_lapic_get_reg(vcpu->arch.apic, APIC_LVTPC));
+
+	/*
+	 * Disable all counters before loading event selectors and PMCs so that
+	 * KVM doesn't enable or load guest counters while host events are
+	 * active.  VMX will enable/disabled counters at VM-Enter/VM-Exit by
+	 * atomically loading PERF_GLOBAL_CONTROL.  SVM effectively performs
+	 * the switch by configuring all events to be GUEST_ONLY.
+	 */
+	wrmsrl(kvm_pmu_ops.PERF_GLOBAL_CTRL, 0);
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
+			wrmsrl(gp_counter_msr(i), 0);
+		if (pmc->eventsel_hw)
+			wrmsrl(gp_eventsel_msr(i), 0);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
+		pmc = &pmu->fixed_counters[i];
+
+		pmc->counter = rdpmc(INTEL_PMC_FIXED_RDPMC_BASE | i);
+		if (pmc->counter)
+			wrmsrl(fixed_counter_msr(i), 0);
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
+	perf_put_guest_context();
+}
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 1c9d26d60a60..e2e2d8476a3f 100644
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
index a5e70a4e7647..c03720b30785 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -233,6 +233,32 @@ static bool amd_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pm
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
@@ -244,8 +270,16 @@ struct kvm_pmu_ops amd_pmu_ops __initdata = {
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
index add50b64256c..ca6f453cc160 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4416,6 +4416,9 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	vcpu->arch.regs_avail &= ~SVM_REGS_LAZY_LOAD_SET;
 
+	if (!msr_write_intercepted(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL))
+		rdmsrq(MSR_AMD64_PERF_CNTR_GLOBAL_CTL, vcpu_to_pmu(vcpu)->global_ctrl);
+
 	/*
 	 * We need to handle MC intercepts here before the vcpu has a chance to
 	 * change the physical cpu
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 6874c522577e..41a845de789e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -786,6 +786,43 @@ static void intel_pmu_write_global_ctrl(u64 global_ctrl)
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
+
 struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = intel_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = intel_msr_idx_to_pmc,
@@ -799,9 +836,17 @@ struct kvm_pmu_ops intel_pmu_ops __initdata = {
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
index b8014435c988..7fb94ef64e18 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10906,6 +10906,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		run_flags |= KVM_RUN_LOAD_DEBUGCTL;
 	vcpu->arch.host_debugctl = debug_ctl;
 
+	kvm_mediated_pmu_load(vcpu);
+
 	guest_timing_enter_irqoff();
 
 	for (;;) {
@@ -10936,6 +10938,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		++vcpu->stat.exits;
 	}
 
+	kvm_mediated_pmu_put(vcpu);
+
 	/*
 	 * Do this here before restoring debug registers on the host.  And
 	 * since we do this before handling the vmexit, a DR access vmexit
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
