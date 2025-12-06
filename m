Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49717D3ABC8
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkgddsdotZVDeSEpqcVwNzCMnvkMvHnnjGYXYA76Tys=; b=GF5vmToW/UKYQn
	tnjlWDdLxFBR8cSDJP9CZVHhp0Lq36gMkbWhQSmfC6hRL4yF1Ts5eySupP1ZjhTpffVeUHWmXnXru
	0WQYh/7brHvii0tX2a1qqHry4H0KaqZ7Es9KHDnM4JMWwVMsJOXXoMmvDd5j+F50XlS3stO4YLgaS
	WDChSpRSt5Y5s5mGVLFhlCObGOYRwRKrqm9hg9myyo90hwyL/3LH2Y0ZeA2D74joahOYUxS9Cyhps
	jP/Hl62yXH8D6ZCzgmPjkXZlnY8M3AdE+qwdXiawa9h+Ozlf45NYyiasPPtQALaO3WfgBnapMCKHz
	dc0DSrVffviefsRu4Fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg5Y-0000000AMGO-45wY;
	Sat, 06 Dec 2025 00:23:53 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg5W-0000000AMG6-3xZY
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:23:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-29806c42760so76406955ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980629; x=1765585429; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=xbxvY9ZDgys9inYWKLBOLkCO3x+kecsWp2/P9vanMAPnTlR1xBC/llH9D0wfEi6Khv
         3EeoXU99DDyG4rE6lFxXrnR396o6fj/yWybY3KBW2J5wO3DNNjxjJBilxvAzI0c0QQm0
         I6MTacrULGbvsFkrz9leGBSQgSH5w3pbmTsvYe+7fj5TgVOF/CoeOKgHsJPcammS1v96
         OnRcM9JyMpugEehUqXUa5gp+q4zfcGilReh50ibHq/zRVHZ3EcO+e7TURcjeZpaGHvy/
         12tcnpHD2vkZ/EckfvJxdICX6+qxIkIPBmX1JG6+MrlGhu/X9XxAGrde3GmdOdeYMBLK
         LGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980629; x=1765585429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=hfqmRcd0+HP4pxV8atEclOb/d7mreWCS706s4M2zxiTV7aU+ZvkKPAfIPsBTyCZBds
         jM5Gs3rzA994p7WMaO1JZJQzn4HmHQ7HNqko97w5orqwIsqrXd9EwIh5VvMzOB1GdOf4
         O7vFrWyjHlCwD6uoStOfW/Gkl/HbqA4Dn/zLw3rcj2/+HRoQnYvulqVjvbfCadiF2WPz
         zpqyEZcXBd8FUdq0h+zedHpagVsOZnOEjmov5+g9tMCWe/Bw6cA55LKeGeZDaxLEUA3J
         RZqY8v81WwPzIFHZgkWyp5jD6YoWsCX0XTnzndevNIcX+WzeFY4zp+rWoSswQchcz7UF
         M+SA==
X-Forwarded-Encrypted: i=1; AJvYcCVUltG59epn9gXLj8qDmdmP5R9nlZHoszoIkVCY9DKmmdDqt+/G8Yd7CShvAV1nAqtU+Suigl1hxE4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwicyOH0gKStyA8KhdHWS6+ME+wPxf1NHkMEi1QFXPqegEHxx/A
	clgKNeRY0xypLdBO+RYXRS8UT60vt8DC48vgBr0+qhwZefaSaMcF0GbNlQLqioVtITw/pD2q1Xh
	EYF8McA==
X-Google-Smtp-Source: AGHT+IEi41vT7k5Y8TL0eorj0ILiZzn3n1cXKu+mvARIF/KTkqiX2XdS9wsUu8uQeqy5b+ge2DTi5IOhdXM=
X-Received: from pfmm14.prod.google.com ([2002:a05:6a00:248e:b0:7dd:8bba:63ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea0:b0:7a9:8770:ce5a
 with SMTP id d2e1a72fcca58-7e8c3628897mr847803b3a.20.1764980303025; Fri, 05
 Dec 2025 16:18:23 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:04 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-29-seanjc@google.com>
Subject: [PATCH v6 28/44] KVM: x86/pmu: Disallow emulation in the fastpath if
 mediated PMCs are active
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
X-CRM114-CacheID: sfid-20251205_162350_979302_4288B18F 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Don't handle exits in the fastpath if emulation is required, i.e. if an
instruction needs to be skipped, the mediated PMU is enabled, and one or
more PMCs is counting instructions.  With the mediated PMU, KVM's cache of
PMU state is inconsistent with respect to hardware until KVM exits the
inner run loop (when the mediated PMU is "put").

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.h | 10 ++++++++++
 arch/x86/kvm/x86.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 25b583da9ee2..0925246731cb 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -234,6 +234,16 @@ static inline bool pmc_is_globally_enabled(struct kvm_pmc *pmc)
 	return test_bit(pmc->idx, (unsigned long *)&pmu->global_ctrl);
 }
 
+static inline bool kvm_pmu_is_fastpath_emulation_allowed(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	return !kvm_vcpu_has_mediated_pmu(vcpu) ||
+	       !bitmap_intersects(pmu->pmc_counting_instructions,
+				  (unsigned long *)&pmu->global_ctrl,
+				  X86_PMC_IDX_MAX);
+}
+
 void kvm_pmu_deliver_pmi(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_event(struct kvm_vcpu *vcpu);
 int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned pmc, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 589a309259f4..4683df775b0a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2215,6 +2215,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_invd);
 
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_invd(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
@@ -2271,6 +2274,9 @@ static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 
 static fastpath_t __handle_fastpath_wrmsr(struct kvm_vcpu *vcpu, u32 msr, u64 data)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	switch (msr) {
 	case APIC_BASE_MSR + (APIC_ICR >> 4):
 		if (!lapic_in_kernel(vcpu) || !apic_x2apic_mode(vcpu->arch.apic) ||
@@ -11714,6 +11720,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_halt(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
