Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF326C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGS3zdMO4ryjKiIcV/w2HM7UTJBbsn75lj5J4jESQfI=; b=X1Y5KjUaLn7bcL
	I/4jvDgRoA/2xbM3rsDTkGxojgpMFLt0B3ZhKngsafHIXt7FHaRQRU1JhVsKwkwIbXCCeMqMkfVbT
	uHQxKKMf8YwjFtvbcd4TehBr74XVT4TYFS94JO9LbxsTcTO/BXx97AF14eXDrDPAAnhay2t7PSLO7
	fo7BDCZuIpSckdSiONF4+MqOiFJwUAmtwMR4SPG42HJFB5/jmwJn7ERJYd81aNExIx2H4XLWRK7uh
	WcCXhHPoPpO++G5o9b5384HaoD+QYYokQSf+6C91+rOHSXsHCEgv3eUwKZ+F39iOX6QIuP1vDkuKt
	HqbLrkhrqeZE+phwezdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlAY-0000000GUTd-35Ox;
	Wed, 06 Aug 2025 20:55:30 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkH4-0000000GGbG-1jO1
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:11 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31f3cfdd3d3so333340a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510289; x=1755115089; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ThGb/1cQlCkxXgvsmi9By0m3uFp5vZO1mPp34NlVQTI=;
        b=LRdS3zqUTGvp4geKhQbb5djL+KK8jkuRnyuL6Iadfwb6UIQv8fMr3b3iBTpq3U3RUa
         JI/9pSfz0IFOllN4GbuXVHJ9QpdWzyyJoFHrUcQwF5MnJWbXx9JtClPzM+Yn7Lf6NsdD
         +XRRjH27UMZP/RBPshpW+8TJIfMl1kLOwr8DBbSIv43O8i+sgRVS1QvVoQbBovKgz9EI
         eXjGhTYA0vO6e9aMw4UR8aIFjyL5qgpRFGTaV+3bt6GYu/Zb2bteV4mOopFjRTbKFhKc
         kbfU7GDH3CrQhG6zLNDRkY8jR+nXPjda+Zbos3LxpYwnMgcIvQLLfUEX0g5K1mRlye5i
         4siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510289; x=1755115089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThGb/1cQlCkxXgvsmi9By0m3uFp5vZO1mPp34NlVQTI=;
        b=sO/PwMEqA8XtS6Zwt4Dgthg4wbfhLqSHAURwcqSxNddo/5WZ86JOZJmZD9vOp2vc/p
         4SNY7lpOUPAOj5cQArfYWtWk1HmSdgMh8ZmwQbxQo2SDwhSDd4rvfcBjoX3ZFams6WSj
         cJYMIFeZ5uH1T8FK59vfVCqM2l/XCi6vNLLAdxBrNvfkKDDF6LKqo8eUW4VN8lKHSXnw
         w9bpUH+cWfix2JYNF1vLC5GtGT41R3e0JFFIc6OM9tHc23zsSSEfUZAGN+pyF93u7nKo
         wTvzXioolr3DQHFY41veR0Mi/ASl+wBfCJZrUmPvgK1Yghgk018B9bIUeyxrnYVHrX0w
         z++w==
X-Forwarded-Encrypted: i=1; AJvYcCXH4i9GMJZig3ReE2qFsBUljDRQVV/yP2SFQhxan8ibJScF88SgXb2+DA39laruOpIK6vYs9HLGstY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqzr1W5sOJPSyP+PTvKDj2S0eDLy1C0oAiHx8m7RmgCBRERTNQ
	fK4KwaP+d/2OQKJBTjOM0bVQ6sIs1OLR5pJcMCIR2hgzk4lI3mnGl0ctpJ7a9S6XXbdO8cfYgRJ
	yrH/cZA==
X-Google-Smtp-Source: AGHT+IEDX7osU0iIbko+P3lNad2rdh21UdoQ7zV3q9ejnGRLDtg0+KAFySIgmFRbYCqEx1sz5hOKZCwZh1w=
X-Received: from pjbci4.prod.google.com ([2002:a17:90a:fc84:b0:313:242b:1773])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dce:b0:31f:5ebe:fa1c
 with SMTP id 98e67ed59e1d1-32166d77ff2mr6724469a91.0.1754510289629; Wed, 06
 Aug 2025 12:58:09 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:44 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-23-seanjc@google.com>
Subject: [PATCH v5 22/44] KVM: x86: Rename vmx_vmentry/vmexit_ctrl() helpers
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
X-CRM114-CacheID: sfid-20250806_125810_451283_C1C84FBF 
X-CRM114-Status: UNSURE (   9.40  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Rename the two helpers vmx_vmentry/vmexit_ctrl() to
vmx_get_initial_vmentry/vmexit_ctrl() to represent their real meaning.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 8c6343494e62..7b0b51809f0e 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4304,7 +4304,7 @@ static u32 vmx_pin_based_exec_ctrl(struct vcpu_vmx *vmx)
 	return pin_based_exec_ctrl;
 }
 
-static u32 vmx_vmentry_ctrl(void)
+static u32 vmx_get_initial_vmentry_ctrl(void)
 {
 	u32 vmentry_ctrl = vmcs_config.vmentry_ctrl;
 
@@ -4321,7 +4321,7 @@ static u32 vmx_vmentry_ctrl(void)
 	return vmentry_ctrl;
 }
 
-static u32 vmx_vmexit_ctrl(void)
+static u32 vmx_get_initial_vmexit_ctrl(void)
 {
 	u32 vmexit_ctrl = vmcs_config.vmexit_ctrl;
 
@@ -4686,10 +4686,10 @@ static void init_vmcs(struct vcpu_vmx *vmx)
 	if (vmcs_config.vmentry_ctrl & VM_ENTRY_LOAD_IA32_PAT)
 		vmcs_write64(GUEST_IA32_PAT, vmx->vcpu.arch.pat);
 
-	vm_exit_controls_set(vmx, vmx_vmexit_ctrl());
+	vm_exit_controls_set(vmx, vmx_get_initial_vmexit_ctrl());
 
 	/* 22.2.1, 20.8.1 */
-	vm_entry_controls_set(vmx, vmx_vmentry_ctrl());
+	vm_entry_controls_set(vmx, vmx_get_initial_vmentry_ctrl());
 
 	vmx->vcpu.arch.cr0_guest_owned_bits = vmx_l1_guest_owned_cr0_bits();
 	vmcs_writel(CR0_GUEST_HOST_MASK, ~vmx->vcpu.arch.cr0_guest_owned_bits);
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
