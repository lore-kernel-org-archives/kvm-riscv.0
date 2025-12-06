Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E7D3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzI7f7WyOFDOsCp1SshrFw5xYCpSpQOqiISSyouGDRM=; b=OHaYOI7YykEzjx
	4j/c32X34SXoGYtpfcABFg957eWzDVCtSm2fpRFdeCe7UuNhAaAuQdNsWJt0sURByMEU1KPzTAZ/p
	L+YUUPhMPLnJWExLGypWoD2StwPMXEfwu6wiLLUfThpEjY6yVyKMgVGyVOrim2CodW/JpHUm0XCnF
	HMOEbL6heORtd3+GGGWaWX8R4sz25yEvFsmJFQ5R7hUyhihYjNsHD44M1Z5A/Y6+KzS9qyFDHo5+G
	R6KMCqXsEavbsANoNmh5f+2Cb/baCbEjWADwbp8n4sTSCKJkix+7UfbYyGuH7uRDYsZS3hsHnttbm
	QoJWcYRd+8/FJ83SoI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1n-0000000AIKg-44v9;
	Sat, 06 Dec 2025 00:19:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0R-0000000AFjZ-3psz
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=; b=ae9reu4Jc3ZIGuKHVAaTWl0D1L
	gjTKYyoCCWXOw14R186R16ks3RzXBc2dBEgZoZlp3pxaqeK6YWX9sN+mU5xxZORvAWZNE7ADjn1j9
	txqSn97L+1Ko4d9jrdmdPWa/hfVEv/IAVoxGLTmRSZBwHhFK7TwfO7yNCVVr9cU/gH1DJd29oEPk+
	vTs2tEKoiTZ+67iGLO/t+fS07d4N8FdcVxjVKNCqA//ow3GU+z751oGXGMMjIfll+VlOG5Vm7LmwF
	cWldh1/NqYC3vNohgDOagPjKxSVcBnWE7V4sk14Z9NpPsXMJz6vFtCkydEoWwlB7WDeO4GsvYLZR9
	4Szle+rg==;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0M-00000006SYS-0B2F
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:34 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-295592eb5dbso46086745ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980307; x=1765585107; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=;
        b=0/zturG11mr/1Hq3erScFcUMLeoI//KQSAErHzddY2RsDWzPoaioXb8H5tHB17hq7m
         js6ETdLimjBOY9YArw+RbUvbaEgtQaPX91alU/ZdW9MzbgDiq+T7Jj/b7Dl9+GfM1dIN
         O/a77cyfkRz0rPGtPr4CaCFJPC1sqJWPCvuggFbSs/4ExuXsLbgkQfbRiPZeoPOpOLSm
         Yis9LF6SO6pS+WWIWYAQUCDb71x0f18knbPo7hu7ltkVN/Bx1I68ASsuQKPl9SwPBYEs
         oqM8SJTkKqc0eqjWqZlntmPyFMpMzEyBabiZh5r3jQxV9GCABBzPSQLWJzyD9ChQF0Pc
         UvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980307; x=1765585107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDDQncQUzzwpRSzzmwHiRYOU7FF2nSUQYIeQTrnvQK8=;
        b=nff5LVK+M3s1voZRLfSoRKhDRCRgjhHWxH9LWLPyrbnpSI31I7OTSN2M5STnA6vLdu
         kF1izBSVq8s3KA/nMLly9ZTnC5GYe/+lNv+mI+EEXwv58lDhcKHr9MA6i5vS2j6YKTQz
         RG+WBmHcJWMKNrDepCSOFI1SLJclVlWIPQFJP6jsoAVwwuZ8H7tkkXlEdGBkW70vNdLa
         /NcJoOH9i8iW1W32ksvu23+oicxBGeu4rVPxwfh382OjFvEW+CClefbsu7a345Qy+oh4
         VGv1Jnp8EvT3IOLJsL0UZf7/FpqEbXwA96dP7o42CDbBbExx6Nfvw+nWu1a11Cii7HCH
         8Oag==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9d33TXDY+Qpihl6c40z327VCLdT7SPGE0iayDMoFVBOvTE2GTMXSK4q9DBtIQUHgcGx/FYuRLrQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP0/uRsDK43Zuy4+qIjUw/I6ZjP2wZshIATuZGCoKMX92tY0f6
	Yl6Nx/vex3lhwcQete/3QnPYYexyuFBZMjMhIFo0537KVti78kjS+0jgMABb3NMzPGiJ8CD9xMm
	UReG6sg==
X-Google-Smtp-Source: AGHT+IG4vHPmom8LOFsNf9ubPRsWVZC6RkdL55O4HgJ6N06qyh5/Ls7bYlKNT7sQNBmfh9FVeBcsEGoEIG4=
X-Received: from plhz1.prod.google.com ([2002:a17:902:d9c1:b0:298:51f6:847d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f84:b0:294:fc77:f021
 with SMTP id d9443c01a7336-29df5deb193mr7205895ad.49.1764980306541; Fri, 05
 Dec 2025 16:18:26 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:06 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-31-seanjc@google.com>
Subject: [PATCH v6 30/44] KVM: nVMX: Add macros to simplify nested MSR
 interception setting
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
X-CRM114-CacheID: sfid-20251206_001830_113157_21CF44DA 
X-CRM114-Status: UNSURE (   7.16  )
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

Add macros nested_vmx_merge_msr_bitmaps_xxx() to simplify nested MSR
interception setting. No function change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 40777278eabb..b56ed2b1ac67 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -617,6 +617,19 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 						   msr_bitmap_l0, msr);
 }
 
+#define nested_vmx_merge_msr_bitmaps(msr, type)	\
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1,	\
+					 msr_bitmap_l0, msr, type)
+
+#define nested_vmx_merge_msr_bitmaps_read(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_R)
+
+#define nested_vmx_merge_msr_bitmaps_write(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_W)
+
+#define nested_vmx_merge_msr_bitmaps_rw(msr) \
+	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -700,23 +713,13 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	 * other runtime changes to vmcs01's bitmap, e.g. dynamic pass-through.
 	 */
 #ifdef CONFIG_X86_64
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_FS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_GS_BASE, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_FS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_GS_BASE);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_KERNEL_GS_BASE);
 #endif
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_PRED_CMD, MSR_TYPE_W);
-
-	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
-					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
+	nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_SPEC_CTRL);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_PRED_CMD);
+	nested_vmx_merge_msr_bitmaps_write(MSR_IA32_FLUSH_CMD);
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_APERF, MSR_TYPE_R);
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
