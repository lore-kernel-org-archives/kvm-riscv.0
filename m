Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E9CC87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaQRF4HaGh6JtUXmTedBXPFL/BuB83CsA5z8a+sUzpw=; b=hnkIVLqET51UHs
	e2/W9QgKY8Asy7zgnRWm6UpWaZV08bkoGhuM9/0i/4PrW+SYfz7zepeg3UV19P3XfkNRQi6/hgs4t
	IJJo/7R2WngrDAz6yfiMfaldeQAU/ItYq57TXgpqpq6ASrLaFvtvi+YNOT5rvfVU2Eg9Y0A+aRcYq
	K+/HmH3WfjutIG+PUGoKnloasZ7X4jcSzh8ksbrYW1kMgMaSIVS1dyjy58pAtTNi9MZv+/hkDCHul
	25owXyTbsj0GBcp5+GkRGigBQXrzKyYRPCuaO4gjTA6r/jme6t0JK3GHKwuLQUiWyRB8fjKqmNWWP
	08fF+pYd/JJVSQZkg2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkvS-0000000GQmO-15Lk;
	Wed, 06 Aug 2025 20:39:54 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGt-0000000GGSG-0Sa7
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-315af08594fso334493a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510278; x=1755115078; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JPhdbzRHNYwbPflarjN5FFRR+xgGKTfGx/VQdQ/Orqk=;
        b=SkU0Opx2GhAb0OftuW8BJXj7Rb/4nzHtf3AkA77o4058VL+WdLag+s8/cTDd5mndEL
         IOyyyFIqQQiZF/ZAdocIhG9qixpnpy+6DGC1/DxSJPhaq9Jo/85+HYyYhi497I+2t9da
         xvlD33PIK67p5RGWqBioYb4ZY5aHvSACUeE9UsU8k0hNHIqgy7d9zUbQ64LQ4f3n8JNU
         aSKTCGIQG6+oiiBBKB0QHBVg0z9tpDDWkp3WFt7G8Ka02JFJcq3q29yGhBWMPYQiMuB+
         eMK90LuJdVVT7hGn1YAtBymsyfsIw2VgNLZk9ufKpPZtCX+JkxWcmeEP1kxZcfnKSRnx
         aMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510278; x=1755115078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPhdbzRHNYwbPflarjN5FFRR+xgGKTfGx/VQdQ/Orqk=;
        b=CYZ+ad3QguciIdwHWyaPBdhRqWztE+dhtqeKoCDHG0JP0EFW6gTWQVMl6nMlOlbQQ0
         QvIiVrJJLAbZxPyBA+BD6HKA7V7FmrYKyvDh4LeHz5wMyHJcfh8C4AGTqXsSmjMyqYko
         Dh/evTRwwXbNDUjMMdkAG36d+cVxArV6EcczEsHoWRxLzCF+jt0GYSAeq5frWY1elqqZ
         0/f2+0TGQbnLQ8HAVhS3zxQuqTqyRisHmFCepSsaY7CW8A7yxYY0+Oz5BDG6JkGgi0cf
         vNUPQ/TesKxAkWbmgkprnGbqH408VNWy7R0urGQiYUAQDcyp3b+ewne5x3c5Urjo7Qyd
         pJrA==
X-Forwarded-Encrypted: i=1; AJvYcCWMeI589l+ck1pwGIX2PYt5nHARLkZhqVciv8+W4Vi0AxO+VRVsp4PqV4+9GzPC/nNP1CAlVE1zC0I=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe6rfQ4jRH8BfQ4cQ7tb81twP0Pq2DOiMpnmSSVSrJ/QC2sYcb
	R5tWyRUX7ghNUmTTMKwWUI8f8Ix20rOC2KMvqeSzHnf/BHpdnlm6HpPs6g1AYkhl71A9HWisTok
	QsXFgOw==
X-Google-Smtp-Source: AGHT+IFSe1FbjsND/XiMAlJbwSv08tGHE8p8b2tGPxUBNGb/T59D+jgsyqvY56UbSdKD1Cfbmzp8QhdLT3k=
X-Received: from pjzj16.prod.google.com ([2002:a17:90a:eb10:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c86:b0:312:ffdc:42b2
 with SMTP id 98e67ed59e1d1-32167541295mr4635514a91.23.1754510278028; Wed, 06
 Aug 2025 12:57:58 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:38 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-17-seanjc@google.com>
Subject: [PATCH v5 16/44] KVM: Add a simplified wrapper for registering perf callbacks
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
X-CRM114-CacheID: sfid-20250806_125759_144550_2F5B6C75 
X-CRM114-Status: GOOD (  14.04  )
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
index 888f7c7abf54..6c604b5214f2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2328,7 +2328,7 @@ static int __init init_subsystems(void)
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
index 67c876de74ef..cbe842c2f615 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -159,7 +159,7 @@ static int __init riscv_kvm_init(void)
 		kvm_info("AIA available with %d guest external interrupts\n",
 			 kvm_riscv_aia_nr_hgei);
 
-	kvm_register_perf_callbacks(NULL);
+	kvm_register_perf_callbacks();
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5af2c5aed0f2..d80bbd5e0859 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9689,7 +9689,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
 #endif
 
-	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
+	__kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
 
 	if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
 		kvm_caps.supported_vm_types |= BIT(KVM_X86_SW_PROTECTED_VM);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..20c50eaa0089 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1731,10 +1731,17 @@ static inline bool kvm_arch_intc_initialized(struct kvm *kvm)
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
index ecafab2e17d9..d477a7fda0ae 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6429,10 +6429,11 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
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
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
