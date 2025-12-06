Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185EAD3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DD9ugZMCcGF8eetKLj3ENtckSQMYK7zg3Ov1gQN4dKY=; b=mkXa3RODs2IYKo
	jtnzx26SIOhxAM+SgUiXLRVuita6pJ/DiG6FE1Bip8NFtRZfa9N5qQoysdIq/1ODjrN4K84H/Nuii
	XeDF6bOj3gVM8sdV6GUDk2FTWsFUyhhhMd4fNek55YunMBltNcUUFISGS1WmXS38d6PZIF1Ot4G7k
	O4Bs43FWpzap+mtntg1v1PPYMOowuTFKisvZFgv5RglQ7dcH4st2IXS3An9u9N0lp8SKTN1gE4tYe
	QtbTooBqkG1BJOwvqB9iByRiXDviHbJSXefQHq7AqSkvvxXq3yPcPy+i3ad9o/p3KiTnSJnmybP5r
	Nj0H9aMTUnrpHYpel01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0V-0000000AFtQ-2uHf;
	Sat, 06 Dec 2025 00:18:39 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzo-0000000AEk9-2Els
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340d3b1baafso3695307a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980275; x=1765585075; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eqIotjgCjEUdnt2WiVnuNRmRS2dnPuXPiOvBLci8ppE=;
        b=cEn+Z2P6DLPPcoJY3fFZGryuph3g17jMlww1GwSzUhRu9X2muz7hbIqbiG0EeSp2/0
         3lahifD10gP2s+dDy+QG6eRIAJ77MDXDVirqfTj9ajqMiivMvm+Yu6RxdTX8XkcoxvYq
         ot9F1vi+HfzJkWovdoHAerbKwDdJUfdzPGWmyBH9VfttD4O1/isnU8SQsd8blbJwlHay
         DOk55hka58slEXU6fGyKMl9Aw1cVeYIGkoKq/LHzJuVlhXAgb7UVmNkwkGqQPqSG2x6R
         hLzhPxpunYk2D/Z8ZClU8vjX2PEfAwficUsvtK3bDnUmiED8/jssd61ZMgypKhC/JcKt
         ZfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980275; x=1765585075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqIotjgCjEUdnt2WiVnuNRmRS2dnPuXPiOvBLci8ppE=;
        b=w/ypXGOFeSKQzH9oAUmzj0QvpbZ0n4q/WhsrebZUWm8WVVpxNEZUkJo1G3iBkfGTN5
         TIUKrxd3unejpsjGLqBdP1h23IkkfBIgLLJIQt63WtwmZ4Lwfjx0evK+Q4jTyzHpRb3W
         zMtaim2smzD3gn2uq9JFwmh8Xuy+WozUC62i1wC4znnSSM55c8+MW9xKsCvwg7EhWdxX
         CsaNv6+oiDZZOA1E8zJuutDJoyd36S/th/C36sKRnv525QNME67vZGocZEq/L4hfwbs5
         Gep3O9WM7AdIdQJAlEGSjoAw/XmPFGw7PvkdLWtu2a8DSFD57ZOuDIqqazOhfXOYT4WP
         bzJA==
X-Forwarded-Encrypted: i=1; AJvYcCURya6v8HuKa9Yr+PLyglXkkOrW0PXx2BbnDloPzj1ILD0/9vly5dgJ4X/7jEywKSfugnxKPf2WLgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhLrff3aaPnRqD/qy5vrq2px9JqUkgWEf39T775RQQ4L2aOZZ1
	YqQwbz2QjTt+rPw8hSW8uhsN/TUHhGZOLUc84nfgpod/XUS8KeFBDPeHRiJ6SI5U4kf3DgNpjEw
	CqvAxKw==
X-Google-Smtp-Source: AGHT+IEouBZxtWhTrY4lnM9VAu4F3ROpN1DG3BfY+U/j8YLDQib06swOT26j4RpeJbHBlGNlXEC9N5U6nuk=
X-Received: from pjps10.prod.google.com ([2002:a17:90a:a10a:b0:340:99d8:c874])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fc4:b0:32e:7270:9499
 with SMTP id 98e67ed59e1d1-349a2383216mr737832a91.0.1764980274477; Fri, 05
 Dec 2025 16:17:54 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:50 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-15-seanjc@google.com>
Subject: [PATCH v6 14/44] KVM: Add a simplified wrapper for registering perf callbacks
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
X-CRM114-CacheID: sfid-20251205_161756_679649_ECA4AD43 
X-CRM114-Status: GOOD (  12.88  )
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

Add a parameter-less API for registering perf callbacks in anticipation of
introducing another x86-only parameter for handling mediated PMU PMIs.

No functional change intended.

Acked-by: Anup Patel <anup@brainfault.org>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      |  2 +-
 arch/loongarch/kvm/main.c |  2 +-
 arch/riscv/kvm/main.c     |  2 +-
 arch/x86/kvm/x86.c        |  2 +-
 include/linux/kvm_host.h  | 11 +++++++++--
 virt/kvm/kvm_main.c       |  5 +++--
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 97627638e802..153166ca626a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2357,7 +2357,7 @@ static int __init init_subsystems(void)
 	if (err)
 		goto out;
 
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 out:
 	if (err)
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 80ea63d465b8..f62326fe29fa 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -394,7 +394,7 @@ static int kvm_loongarch_env_init(void)
 	}
 
 	kvm_init_gcsr_flag();
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	/* Register LoongArch IPI interrupt controller interface. */
 	ret = kvm_loongarch_register_ipi_device();
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45536af521f0..0f3fe3986fc0 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -174,7 +174,7 @@ static int __init riscv_kvm_init(void)
 
 	kvm_riscv_setup_vendor_features();
 
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c6d899d53dd..1b2827cecf38 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10107,7 +10107,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d93f75b05ae2..8e410d1a63df 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1749,10 +1749,17 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
 #ifdef CONFIG_GUEST_PERF_EVENTS
 unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
+void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void),
+				   void (*mediated_pmi_handler)(void));
+
+static inline void kvm_register_perf_callbacks(void)
+{
+	__kvm_register_perf_callbacks(NULL, NULL);
+}
+
 void kvm_unregister_perf_callbacks(void);
 #else
-static inline void kvm_register_perf_callbacks(void *ign) {}
+static inline void kvm_register_perf_callbacks(void) {}
 static inline void kvm_unregister_perf_callbacks(void) {}
 #endif /* CONFIG_GUEST_PERF_EVENTS */
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4954cbbb05e8..16b24da9cda5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6474,10 +6474,11 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.handle_mediated_pmi	= NULL,
 };
 
-void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
+void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void),
+				   void (*mediated_pmi_handler)(void))
 {
 	kvm_guest_cbs.handle_intel_pt_intr = pt_intr_handler;
-	kvm_guest_cbs.handle_mediated_pmi = NULL;
+	kvm_guest_cbs.handle_mediated_pmi = mediated_pmi_handler;
 
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
