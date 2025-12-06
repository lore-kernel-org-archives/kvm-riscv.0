Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0C1D3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHr9U5gDpoM6P4gidYemp4MiZvlCBHRL2aKnDmXwAtc=; b=qKyNFxmnxW3cV/
	Iih4jMYWCbziktCcT3hk2SftpjwEjxbmtATr8bFn8/Mv1qQeVfXmPGFlpgHkO8K2JPfDwaSDGQZ/P
	hlBUU/MFGw0aqjLmI3iKT/NvvIycmEKWocjrg2nSu1sOqA81l5mgsrGmqGrOeOeS86raaR2BeOx7p
	QRWBR6BVhd0yWGg0hCt03achOHWpD3emjDksuvhE9RIitem0ZTO4uijRzUdirhrtKLEMlO/vEqN/Y
	47CUtf38zWl/CFip09X5DqCx3YbX0lJgchRDwdC94B0TuvU+cHxjhwpzpdXY3vdPUfaVv2NWeRD/J
	Do3RlItjdmlrHrrosU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2v-0000000AKav-3bt1;
	Sat, 06 Dec 2025 00:21:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1B-0000000AH3h-2LDD
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dghHZC8C4J94U5X0EsLhdqx+qyyu5Gw9y0a71sLAgMI=; b=WGMqxMVTv7TOKUWPQxfo5N9F90
	mDiNMnVVBSsffrYfa2LDZ/2SDdzabl0cXYzD8KWSjQtnwtOcmn1rnR7fnBS5HoZdP2tVi8hm40m4j
	n5ehMWUAuST5WtsSdDJkW8JzOByeoejtkWxG7nlcUFk9ijnNyZ8MO2lDzpmqNnIySixNBw7ePsdlK
	trW9CsBZcEsBzVri6UVaaIZNty6X/3fqwS5n5a/be1e3bpWUG4CxeKe4TCbUfdTjNmbjkaop/+Qkl
	nplaOz3pMo6xToPYuBsyKuIfusGG+TQJhjdRoFEql802s7SCb8/yNW605VJKyERw9BrwUytzY/nNx
	CLvaTyfA==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf9G-000000072vV-47ze
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-297e5a18652so32996375ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980335; x=1765585135; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dghHZC8C4J94U5X0EsLhdqx+qyyu5Gw9y0a71sLAgMI=;
        b=H853E1eJDiwe+J5ShPlzUr/BK6hbGKdf+jrD01phUqk0GuY73bTM+rbgbRucj5ee9F
         TSJWVvL+Yo+mty91X4v2kp3zMLI9aYzLF9+v3mkPDO9cP5FvQCbnkIiaUpZdUE/iAUGa
         kKsr2+dQiNYdIT/Xm0EYTY+NN3NLRMmf3cPopktdWJAU/a56LP0s21cIN+u4IBEnedBY
         5cuLOPe7C8JyMpMFTvpCjBF5p+EXi1WjJKtGTzTBhlmsAy7rbeLkXtFcMlz4YYWOwHDT
         L34NmmO8o6Xw5GG8HksoSkGqA9Nruo57sHfudQe7f3Qi7PqIMRtxQvFr1509ed1FUjfr
         EiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980335; x=1765585135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dghHZC8C4J94U5X0EsLhdqx+qyyu5Gw9y0a71sLAgMI=;
        b=dJTvjDvWUArAbQ1njivOb5zTnyvSP9PRRo0S5KJ3qtE/ORUIDdkLWtiEQ1RfdO1ttB
         n1bJkSiZEpfvzBebxVd68ielJ292Oi3Ewg2yXuFiGpHulF57+29kBoeGCHQeWO70uq6J
         qjcfq10cPXnEGR+koXvenaGuBtMBACrltPtXqwhfsMDUTxU5U9OtG+8+7fzy8uv50s/u
         Itmn9gD/wAW5tIYiMSNhydFmnH0dg/FIq6VX3dh4F4w+5ztTHsZ554q7ck4vOKNhmYKh
         TQ6fo5iPnvLirNMY/v26hzruGdjSmWgeVTN3LZ5xPA0RqYdP06r0B5OZodZFJZE7GysJ
         9urA==
X-Forwarded-Encrypted: i=1; AJvYcCW5rsTVwYJ4s+1K/IJbQQd+mE0GGaWfFLzoZ+bY5IZu1e8gBcrllNqxPHo2RcGy1Lu8N8OJvpv41+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDFVm8X5EWfG+sA8JKoHJD9B3eFgX1z3YBSsXaWhMiyY2un3J8
	sy2WE6MBFcgO83XBuWVrgSd1kw4LToabRPaP90bY9Kn2VEEajyxhYZxiJ5vVr0ukOQf+JjQGIf+
	iqqM+vw==
X-Google-Smtp-Source: AGHT+IGiF/KlyKw3jh5Mhte5oVO+4hAY3tNIkOZ4DdyLYn/+Z0r5Rwc99w3eHOaoOE5Aq4b+oO/Y2gl+Kqw=
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:b99:9560:3dc9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e290:b0:35b:c84f:c7b0
 with SMTP id adf61e73a8af0-36617e37e14mr1031726637.8.1764980334861; Fri, 05
 Dec 2025 16:18:54 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:20 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-45-seanjc@google.com>
Subject: [PATCH v6 44/44] KVM: VMX: Add mediated PMU support for CPUs without
 "save perf global ctrl"
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
X-CRM114-CacheID: sfid-20251205_232339_522612_46B9696A 
X-CRM114-Status: GOOD (  17.08  )
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

Extend mediated PMU support for Intel CPUs without support for saving
PERF_GLOBAL_CONTROL into the guest VMCS field on VM-Exit, e.g. for Skylake
and its derivatives, as well as Icelake.  While supporting CPUs without
VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL isn't completely trivial, it's not that
complex either.  And not supporting such CPUs would mean not supporting 7+
years of Intel CPUs released in the past 10 years.

On VM-Exit, immediately propagate the saved PERF_GLOBAL_CTRL to the VMCS
as well as KVM's software cache so that KVM doesn't need to add full EXREG
tracking of PERF_GLOBAL_CTRL.  In practice, the vast majority of VM-Exits
won't trigger software writes to guest PERF_GLOBAL_CTRL, so deferring the
VMWRITE to the next VM-Enter would only delay the inevitable without
batching/avoiding VMWRITEs.

Note!  Take care to refresh VM_EXIT_MSR_STORE_COUNT on nested VM-Exit, as
it's unfortunately possible that KVM could recalculate MSR intercepts
while L2 is active, e.g. if userspace loads nested state and _then_ sets
PERF_CAPABILITIES.  Eating the VMWRITE on every nested VM-Exit is
unfortunate, but that's a pre-existing problem and can/should be solved
separately, e.g. modifying the number of auto-load entries while L2 is
active is also uncommon on modern CPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c    |  6 ++++-
 arch/x86/kvm/vmx/pmu_intel.c |  7 -----
 arch/x86/kvm/vmx/vmx.c       | 52 ++++++++++++++++++++++++++++++++----
 3 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 614b789ecf16..1ee1edc8419d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5142,7 +5142,11 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 
 	kvm_nested_vmexit_handle_ibrs(vcpu);
 
-	/* Update any VMCS fields that might have changed while L2 ran */
+	/*
+	 * Update any VMCS fields that might have changed while vmcs02 was the
+	 * active VMCS.  The tracking is per-vCPU, not per-VMCS.
+	 */
+	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
 	vmcs_write64(TSC_OFFSET, vcpu->arch.tsc_offset);
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 55249fa4db95..27eb76e6b6a0 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -777,13 +777,6 @@ static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_
 	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl()))
 		return false;
 
-	/*
-	 * KVM doesn't yet support mediated PMU on CPUs without support for
-	 * saving PERF_GLOBAL_CTRL via a dedicated VMCS field.
-	 */
-	if (!cpu_has_save_perf_global_ctrl())
-		return false;
-
 	return true;
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6a17cb90eaf4..ba1262c3e3ff 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1204,6 +1204,17 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 	return true;
 }
 
+static void vmx_add_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
+{
+	vmx_add_auto_msr(&vmx->msr_autostore, msr, 0, VM_EXIT_MSR_STORE_COUNT,
+			 vmx->vcpu.kvm);
+}
+
+static void vmx_remove_autostore_msr(struct vcpu_vmx *vmx, u32 msr)
+{
+	vmx_remove_auto_msr(&vmx->msr_autostore, msr, VM_EXIT_MSR_STORE_COUNT);
+}
+
 #ifdef CONFIG_X86_32
 /*
  * On 32-bit kernels, VM exits still load the FS and GS bases from the
@@ -4225,6 +4236,8 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 
 static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
 {
+	u64 vm_exit_controls_bits = VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
+				    VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
 	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -4234,12 +4247,19 @@ static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
 	if (!enable_mediated_pmu)
 		return;
 
+	if (!cpu_has_save_perf_global_ctrl()) {
+		vm_exit_controls_bits &= ~VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL;
+
+		if (has_mediated_pmu)
+			vmx_add_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
+		else
+			vmx_remove_autostore_msr(vmx, MSR_CORE_PERF_GLOBAL_CTRL);
+	}
+
 	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
 				    has_mediated_pmu);
 
-	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
-					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
-				   has_mediated_pmu);
+	vm_exit_controls_changebit(vmx, vm_exit_controls_bits, has_mediated_pmu);
 
 	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
 		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
@@ -7346,6 +7366,29 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
 					      msrs[i].host);
 }
 
+static void vmx_refresh_guest_perf_global_control(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+
+	if (msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
+		return;
+
+	if (!cpu_has_save_perf_global_ctrl()) {
+		int slot = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
+						       MSR_CORE_PERF_GLOBAL_CTRL);
+
+		if (WARN_ON_ONCE(slot < 0))
+			return;
+
+		pmu->global_ctrl = vmx->msr_autostore.val[slot].value;
+		vmcs_write64(GUEST_IA32_PERF_GLOBAL_CTRL, pmu->global_ctrl);
+		return;
+	}
+
+	pmu->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
+}
+
 static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
@@ -7631,8 +7674,7 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
 
 	vmx->loaded_vmcs->launched = 1;
 
-	if (!msr_write_intercepted(vmx, MSR_CORE_PERF_GLOBAL_CTRL))
-		vcpu_to_pmu(vcpu)->global_ctrl = vmcs_read64(GUEST_IA32_PERF_GLOBAL_CTRL);
+	vmx_refresh_guest_perf_global_control(vcpu);
 
 	vmx_recover_nmi_blocking(vmx);
 	vmx_complete_interrupts(vmx);
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
