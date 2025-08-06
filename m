Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13D2C87FDA
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycBDbm4NJhpdiruhf7O2CeVg4+GI6EF/s9cRXELuPj0=; b=YYmm7o5cgIPHUu
	Hl9DcPWKWKrvpTWywc4v8BAwU5ateda5g+bLaHHTnCfimUzRcBn6kGKVfZrPA3+OHXLmWX7IiocA1
	Z4jizDrs5fUOMSWvzAkO/kxhWmuzX06aroT0koxtfGZCnXkuUGAY1VvtDNeugfRxao8aB61tKmYJn
	873Q/oC7gHER13GV/Vg9/Kf2LVdBKlZtxuW29g+GKGl6pdksXc6zqoL9/P9MyIf1IHHfsPIK7LEsR
	xyK4d1s/fwVi46Ihs/wNyPq9Q6+P7eoBbjtD0jqSnsMZKAFki1B5/K0Z/tLZVlwvq4vDtvgJswSh0
	GlgTG+CQBCdWbqNl4QAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlwN-0000000Gc83-2DzM;
	Wed, 06 Aug 2025 21:44:55 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGp-0000000GGP1-0ioB
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23fe98c50daso1497425ad.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510274; x=1755115074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0uQwWV7lYMOxBil53zyDkn96gfX2tt2/DqWsDrl/9hs=;
        b=MYvvQAf5hNTIHqJrf0uNqUg3j7PVQN02RFJ0LRY0SZktB+EoNM6kWHH71jydVBycev
         C9AD4tu1jCcxWb5qlrKztTEEot6IvuhuUgGiXldUZVfoHarlqURz3OkVkhT1qt9o5MEb
         dxu62LftXc1CoU5KFYxnsRw1QxOZOo9uwglhvXF90loXJWsW7zOujzuX9o11H85qpgxY
         Hc8uW/Un02xGmv+uSlenKchr6QU1+KOqJKG6bt270EwDsXLkjW1OXM5yJBaDdRECs48I
         Q9Wp+cqoF8bko3hXqB3NJ7s8goRTF6enbGqKg3Jnl/b+QWLuw3rrJeDfOqru4+4S9ps0
         P0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510274; x=1755115074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uQwWV7lYMOxBil53zyDkn96gfX2tt2/DqWsDrl/9hs=;
        b=oyr+cL0Gt3VsMhHB0CLCDvNGFXxMsdM/uvp52SM4o9AML8q8r1EEDyndLcRIcLfbge
         bv0/zPx7X1Q1Qr3rrFdstL8ammPkYJM2PDAR0z2975rbDG05hrdaQAF4cPiqo0QeDhr6
         zDIhiPw+QQ67GZLBAnfqWIfZ3p6V96ttFncHYZhpY43xp8+o4xIy9Z+EABkLTlyAXnJ5
         /7pVHDRJzlmYIZv8L00iI22D0yY1igRwttDSeJ61JxRMubRFAaP8LTPJyl+pwLR+0qAe
         iVXAVyiCDu86UTDFq1KuQM5IQjLpkygEKkv1yIMMQ+JfwJzzHbbXWHfZtv7vgd/Rlv8d
         WzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYj90rwk6c0pZ7k2jgW7R2vqYbSwbJGZB1dt93+DpWj1bJVbAtC2b8DY4Io99N8xnwU4nJs14iyzg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+aiMI+7MNEAXNGhVnMAVRet11efOUAuUI4ug2fZ4kT+0HcXr
	XGwKf+k/Mf5zsjhHYaoI8CcEnGGSamOCGpAJo54kWO5OaqUFv/Ss7h4NAfyt1qdSyiLlxXbTK0J
	D2nZjyw==
X-Google-Smtp-Source: AGHT+IGH2b2xUlwmCehGLeN80BLd5ICkd9hx9VxyJMjC6VJA8pJue1wqM8eYOcrMqHKsQHTGrwNwqHX4jyM=
X-Received: from plkh12.prod.google.com ([2002:a17:903:19ec:b0:240:9ca:fc49])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce05:b0:240:49d1:6347
 with SMTP id d9443c01a7336-2429f30b512mr54270245ad.35.1754510274358; Wed, 06
 Aug 2025 12:57:54 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:36 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-15-seanjc@google.com>
Subject: [PATCH v5 14/44] KVM: VMX: Setup canonical VMCS config prior to kvm_x86_vendor_init()
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
X-CRM114-CacheID: sfid-20250806_125755_239439_AFD822D4 
X-CRM114-Status: GOOD (  15.45  )
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

Setup the golden VMCS config during vmx_init(), before the call to
kvm_x86_vendor_init(), instead of waiting until the callback to do
hardware setup.  setup_vmcs_config() only touches VMX state, i.e. doesn't
poke anything in kvm.ko, and has no runtime dependencies beyond
hv_init_evmcs().

Setting the VMCS config early on will allow referencing VMCS and VMX
capabilities at any point during setup, e.g. to check for PERF_GLOBAL_CTRL
save/load support during mediated PMU initialization.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 95765db52992..ed10013dac95 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8335,8 +8335,6 @@ __init int vmx_hardware_setup(void)
 
 	vmx_setup_user_return_msrs();
 
-	if (setup_vmcs_config(&vmcs_config, &vmx_capability) < 0)
-		return -EIO;
 
 	if (boot_cpu_has(X86_FEATURE_NX))
 		kvm_enable_efer_bits(EFER_NX);
@@ -8560,11 +8558,18 @@ int __init vmx_init(void)
 		return -EOPNOTSUPP;
 
 	/*
-	 * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothing
-	 * to unwind if a later step fails.
+	 * Note, VMCS and eVMCS configuration only touch VMX knobs/variables,
+	 * i.e. there's nothing to unwind if a later step fails.
 	 */
 	hv_init_evmcs();
 
+	/*
+	 * Parse the VMCS config and VMX capabilities before anything else, so
+	 * that the information is available to all setup flows.
+	 */
+	if (setup_vmcs_config(&vmcs_config, &vmx_capability) < 0)
+		return -EIO;
+
 	r = kvm_x86_vendor_init(&vt_init_ops);
 	if (r)
 		return r;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
