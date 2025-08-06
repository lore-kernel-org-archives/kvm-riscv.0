Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579D0C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hnmgVGVl2Or8FVKF/toV8CmjKT9/kDTibGa27MufUc=; b=uE49dSdWr7Vz+q
	WAwe2PuGVDnDMFmecAcQH0NT1AkMUFP4J4cF0pFZN1gYTn0/CCfB3oSn05HBZ2qbecUHZ5fKHmeV0
	U/kXfYhmPC7h5IBT0sMgFUd23cyHC5QxHf4tfrWzKqAQJVJLEQW34J/r8W4GyREu66XSims6HnJDw
	KTqURDIqO5I4gTqbSJSod3o5Z+1Zmy7OJLxPwbj2RWlWoP/qc3el9BGA6qnLQWQHvCTcUuMLCIC+M
	e9gOHIEc1PwwKUacV6ZGSU9Rg19gRzsJEzGPN79MCAAI0pR+IsLTD6vgwSl636w8p9MjF1LGvt3PQ
	BnJzHQc9zscnfP/8v8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujl5X-0000000GTPk-0V8y;
	Wed, 06 Aug 2025 20:50:19 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGz-0000000GGWj-1FKW
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:06 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76bfb082331so275540b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510284; x=1755115084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GWdUZrt+U2ZtCbYKTsMlrHRvg1+poTmQboTMZxCN7ww=;
        b=gxciG2OOinCL/+QP371/5D3kEDJ7+SBd/HnUJOStTQ1ZBKhdN+5vbPMQIiGdqU6ZXI
         BvRWd+6rW/MviTOptiGDiwAMpLZdLaTOrHi/pfaKhNY/XrCTtzcxr5sD5dyfuOxIFy5s
         dU148aIhdmafowk/KW8Uvz3jY53yC0W43Ai9fZ8cQEiH2AYcI7LruHDysQkNKzBx8XzL
         Zh+KAFu4c5BaHgUuNsnGCo0Synl8nl2s/rPClOfVX5HXZMVZE2Zp+IcUWRmgr89wm4jD
         kVS5dZHbKgRkGbdQugMCFdztWN+UclsIXo/VV1w/pZSOOj875zjISEDK+6b3LBtDls/i
         R2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510284; x=1755115084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWdUZrt+U2ZtCbYKTsMlrHRvg1+poTmQboTMZxCN7ww=;
        b=A2iFHIU8P0huDrDHFXKvG8gS9NgDeAj6m6fsJGdASATWjx6Di7sV+g3EI4ILMRgrsW
         yXFwXB7wlJM2yOSqBvwNP/5Bb4wo1s0BXPQbbqVDtdWJT3De5xZ5ubdCoWeXbjrQwRn5
         /43iJ5eh9Ex3Hw/vWoMDlfSCSD/5y70XPfItfFBm4ae+sa23cpNES0M9SYbtBt5G4wZP
         zH9Z4KgfC3xAS4PVWeg1NV4C3fFuU2eMk5I0GnJrXm4diiDbcOwrIFeqd8w58cVktX/d
         KdUpZeeQtTrJouca/hQ+7QipLpe0snV7SDdEG5as5VzMh2H+pJIBNLFtxu2vox6Emu00
         fl0w==
X-Forwarded-Encrypted: i=1; AJvYcCVKe3dRknlT3DYiyOjxbwaskRI+j8nPAOee4BK5R2ON/lvotxMUKUSFi1odvNfkxKZhPWGLLVnaBy4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOLHW3iSipXnx9ntXxsxw4+C030j9Z/4kEpuIatG7mBzVQ4E3e
	ImIBZ8JaqR4Y3l5zJgvRBXH1t4zIUkVZvRIQnBb6LSNyKEr5hwP8sSqgv9MRmfXjm33CzoNNCZL
	kEUzaOw==
X-Google-Smtp-Source: AGHT+IGuU+RWQRwCAfzWML148fgqdvdKW6alxUtwh3XwkGhhvD7y/3BjKg8jOpNbCUSNYHrZUCLfYMHRL8Y=
X-Received: from pghd12.prod.google.com ([2002:a63:fd0c:0:b0:b42:2d66:cdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8045:b0:240:43e9:6cb7
 with SMTP id adf61e73a8af0-24043e97001mr56266637.45.1754510284410; Wed, 06
 Aug 2025 12:58:04 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:41 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-20-seanjc@google.com>
Subject: [PATCH v5 19/44] KVM: x86/pmu: Implement Intel mediated PMU
 requirements and constraints
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
X-CRM114-CacheID: sfid-20250806_125805_344748_F4F61FF9 
X-CRM114-Status: GOOD (  14.67  )
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

Implement Intel PMU requirements and constraints for mediated PMU support.
Require host PMU version 4+ so that PERF_GLOBAL_STATUS_SET can be used to
precisely load the guest's status value into hardware, and require full-
width writes so that KVM can precisely load guest counter values.

Disable PEBS and LBRs if mediated PMU support is enabled, as they won't be
supported in the initial implementation.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: split to separate patch, add full-width writes dependency]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/capabilities.h |  3 ++-
 arch/x86/kvm/vmx/pmu_intel.c    | 17 +++++++++++++++++
 arch/x86/kvm/vmx/vmx.c          |  3 ++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index 5316c27f6099..854e54c352f8 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -389,7 +389,8 @@ static inline bool vmx_pt_mode_is_host_guest(void)
 
 static inline bool vmx_pebs_supported(void)
 {
-	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept;
+	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept &&
+	       !enable_mediated_pmu;
 }
 
 static inline bool cpu_has_notify_vmexit(void)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 07baff96300f..8df8d7b4f212 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -776,6 +776,20 @@ void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
 	}
 }
 
+static bool intel_pmu_is_mediated_pmu_supported(struct x86_pmu_capability *host_pmu)
+{
+	u64 host_perf_cap = 0;
+
+	if (boot_cpu_has(X86_FEATURE_PDCM))
+		rdmsrq(MSR_IA32_PERF_CAPABILITIES, host_perf_cap);
+
+	/*
+	 * Require v4+ for MSR_CORE_PERF_GLOBAL_STATUS_SET, and full-width
+	 * writes so that KVM can precisely load guest counter values.
+	 */
+	return host_pmu->version >= 4 && host_perf_cap & PMU_CAP_FW_WRITES;
+}
+
 struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.rdpmc_ecx_to_pmc = intel_rdpmc_ecx_to_pmc,
 	.msr_idx_to_pmc = intel_msr_idx_to_pmc,
@@ -787,6 +801,9 @@ struct kvm_pmu_ops intel_pmu_ops __initdata = {
 	.reset = intel_pmu_reset,
 	.deliver_pmi = intel_pmu_deliver_pmi,
 	.cleanup = intel_pmu_cleanup,
+
+	.is_mediated_pmu_supported = intel_pmu_is_mediated_pmu_supported,
+
 	.EVENTSEL_EVENT = ARCH_PERFMON_EVENTSEL_EVENT,
 	.MAX_NR_GP_COUNTERS = KVM_MAX_NR_INTEL_GP_COUNTERS,
 	.MIN_NR_GP_COUNTERS = 1,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index ed10013dac95..8c6343494e62 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7795,7 +7795,8 @@ static __init u64 vmx_get_perf_capabilities(void)
 	if (boot_cpu_has(X86_FEATURE_PDCM))
 		rdmsrq(MSR_IA32_PERF_CAPABILITIES, host_perf_cap);
 
-	if (!cpu_feature_enabled(X86_FEATURE_ARCH_LBR)) {
+	if (!cpu_feature_enabled(X86_FEATURE_ARCH_LBR) &&
+	    !enable_mediated_pmu) {
 		x86_perf_get_lbr(&vmx_lbr_caps);
 
 		/*
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
