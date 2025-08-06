Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A285C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plQfM/z8P4SoG1EAKqM3YIS1D2s0L5c6jjnnEhDzpeQ=; b=v3GrmQHyy6ZN5e
	x0I+kzE3VaOuwHCjSak2CBI3tBahAPpzwYQBqBb15ylsUwc/8zaY3G4Tyh4Dk0e19C72LNlD5C11X
	nAOFTL9FT+ku0cAwHi4GzsZhBnAIgULg9Z7UE4WDTgbM+/6e5/Bt6a3MI4X4gr2Ak3cjcagHB5gAC
	fpewWiNMLTLXKOPsmf3ft6FduG1j9X0zGpL8QctQGCrthT50/Va1M1YgbKO3V03Cm/+HE9092L4Z1
	FVdTailquVZJnKT0fri9zZ1fJsxDl7mTjzqLltNur5JFdmuEYMS8WeVfY17DTWBrprjS37dnLayJY
	btQSuzGyf7b5cn+T/1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmPO-0000000GhRD-47xl;
	Wed, 06 Aug 2025 22:14:54 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkH9-0000000GGfp-3yp1
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:17 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2400499ab2fso1564105ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510295; x=1755115095; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7n78nD110ztSdGmfKKJPHep+PzR1j4ORmKnKizGjxcI=;
        b=37xS0hcxkeqLwyCCR5AjgyMpjn4jC5uleUN7HzbaInKcWK+GT39J4LBGPNkwcJbdEU
         ZireT2t1It+Q2CStxVv+C6TGYvXL0xdwZ7sXMNPqGyHuhLNcghmVlKr3j9ZiTpTW1AXd
         3xySDrF/RmxCWOZUFWlN9UGcBI4SjRp04vkt9mrqPJxdT5IJVCncyppsGOC9zVUShoI8
         0juu1GEyNRwNQN4PaNOG+MzDPHxnYlFXe+40xR1Fcsco/dNVLREsrwt8+E8Xz3PCjqmQ
         xCxMjaRGIQEld+BZyWx+jjOZFmZM60/EdMZqa/Q7NR7DK3O+K1OsDyS4CW46uTH/lJu/
         efNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510295; x=1755115095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n78nD110ztSdGmfKKJPHep+PzR1j4ORmKnKizGjxcI=;
        b=bvvJuBrNqgGD1MrFyLdt4yuO2ogfA6R39PwXoeS1uL1WR6zDv1oObdlIidAnTyZsst
         RR7nhMc4yoZLZF9bzosHDs4sbgKEg9JcLtE+AzlStcTMy6yEUbbXJ2u2q4ApHZxtxM9+
         7OCviXLzhVWeXundm5lFT9ciqoqHuGU3k0NmdB0vazSRsVRCAiyEGbITsgg8P+9d3keO
         8eHnWtu5pQmRsuuqKBXu/K1Cx3+osmH+p/CvAJU4K8xOZ6jQXu2+yGX0EMcMyxsJZIFb
         mg3D6hMneIdktgTh3IJCCTjZgnpCubw2l7Zs51lAZ9BXf0/jM6XxXdl7shId+8VVRpfy
         Q8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW7eKnBEmut5EYWT2n1M6tSCa2Ii3o3fm+fzY+EVhy9frO/4GkSK1z6LmHXyomaFbJh22ABrK3NWVU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvj+rocTZXSkxYp1JcQUthgG0o85152r/02LAwUtulgaF9m/jC
	LpllG5J0vzV4IlPRhG0Vo80bnlYRLrnelijcUlxUTzH+Sz1OWrn2qTUiyCi8/HF91lhfLY+Ix0/
	e2J+59w==
X-Google-Smtp-Source: AGHT+IFqf7ZAG29dPCj/MpatUq6hwXzWupLmSqVpNm34U7crTT1sTW/TFLrPZa6u05A4GwIlFGKGaClhUR8=
X-Received: from pjpy17.prod.google.com ([2002:a17:90a:a411:b0:321:370d:cae5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec8:b0:242:abac:30f0
 with SMTP id d9443c01a7336-242abac3c63mr29143805ad.42.1754510294999; Wed, 06
 Aug 2025 12:58:14 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:47 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-26-seanjc@google.com>
Subject: [PATCH v5 25/44] KVM: x86: Use KVM_REQ_RECALC_INTERCEPTS to react to
 CPUID updates
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
X-CRM114-CacheID: sfid-20250806_125816_018955_DAEFF4ED 
X-CRM114-Status: GOOD (  11.64  )
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

Defer recalculating MSR and instruction intercepts after a CPUID update
via RECALC_INTERCEPTS to converge on RECALC_INTERCEPTS as the "official"
mechanism for triggering recalcs.  As a bonus, because KVM does a "recalc"
during vCPU creation, and every functional VMM sets CPUID at least once,
for all intents and purposes this saves at least one recalc.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/cpuid.c   | 2 ++
 arch/x86/kvm/svm/svm.c | 4 +---
 arch/x86/kvm/vmx/vmx.c | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e2836a255b16..cc16e28bfab2 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -448,6 +448,8 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	 * adjustments to the reserved GPA bits.
 	 */
 	kvm_mmu_after_set_cpuid(vcpu);
+
+	kvm_make_request(KVM_REQ_RECALC_INTERCEPTS, vcpu);
 }
 
 int cpuid_query_maxphyaddr(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 3d9dcc66a407..ef7dffc54dca 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1225,7 +1225,7 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
 
 	svm_hv_init_vmcb(vmcb);
 
-	svm_recalc_intercepts(vcpu);
+	kvm_make_request(KVM_REQ_RECALC_INTERCEPTS, vcpu);
 
 	vmcb_mark_all_dirty(vmcb);
 
@@ -4478,8 +4478,6 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 	if (sev_guest(vcpu->kvm))
 		sev_vcpu_after_set_cpuid(svm);
-
-	svm_recalc_intercepts(vcpu);
 }
 
 static bool svm_has_wbinvd_exit(void)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2244ca074e9d..6094de4855d6 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7782,9 +7782,6 @@ void vmx_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 		vmx->msr_ia32_feature_control_valid_bits &=
 			~FEAT_CTL_SGX_LC_ENABLED;
 
-	/* Recalc MSR interception to account for feature changes. */
-	vmx_recalc_intercepts(vcpu);
-
 	/* Refresh #PF interception to account for MAXPHYADDR changes. */
 	vmx_update_exception_bitmap(vcpu);
 }
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
