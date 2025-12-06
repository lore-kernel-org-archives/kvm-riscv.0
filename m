Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77622D3ABC7
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHT2yvHuj76Mh5elGcUVhODDj45HIcKN0kELTy2kmK8=; b=aq1dFiCwZYX/mv
	v8OTIKnJ7TguGPpkf8IFz8WECHwnTJ/4D1QE+Fpwfs+FqjD9o18w2yzdrGR0zY9oL2bIs1Hlsiqd2
	KpJ6JAW6IDDo2o2leZpHzUJdwtZJ1loVqyloZgGHenv1XniGKzshM93lnP9sXBoA2/lsqBoay6RNq
	c4Ikxn6T9qqB+TupRBgdhA6RR5O+gFUYIFEAYQUfb9BEfFaov+KNfOFAFf9N9Jx5URfxz5SXN1hs8
	6P7t+VdiYyqPNnlFzqEpmhNRTorqovXJ6DKD900Lz7Hcu3vedi1CW9ovc1FDNSrkm6nQG2buJvJX+
	hhYUarKHI7uf0oGQ8PTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg5o-0000000AMI4-13Yy;
	Sat, 06 Dec 2025 00:24:08 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg5l-0000000AMHV-29FP
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:24:06 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2958c80fcabso58798545ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980644; x=1765585444; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EW7FbaDPVd5t9h4ibnQZUOMw78F2xoAgB/he+4U2Bes=;
        b=Pis/YvJg+YzHlB8nW4OGU2u0XkUN/uC2l0H8YKyAqyIVY4T456bR/REGpFQLDkL2ki
         CPWKoad9BF0GdlEmx7w9sC6lUTT1tFJQlmqMv17ErG8QzSqypp13URE0jeS+v6DcBl3e
         TtmkUfrGg/QEYjXAQI6RCa2RwEWHZgr6Sgyn5d0UatPqFHPQL2TQQt2wPX04dO4VuzuJ
         sMc483iPbz4+maZ5Fqxv/j//Sw4Wf47mBWLAS/PVXFmwSeoTWN5FknKG0Pf4ssILLPNh
         Ob3TIcL3xDQFD3D3ZDojIoIiV0Op8FSyz6qfDRiaKmIo4n0LOwApvQSbY8f32ZB9veQj
         pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980644; x=1765585444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW7FbaDPVd5t9h4ibnQZUOMw78F2xoAgB/he+4U2Bes=;
        b=ilXKW8659wNTKwEYPaojY9DYKsODp7T+UEXpHcRWn+/dh962uOTsR1jCD8VHg+w3Wy
         V68d1zkt9M5p9foOuixEC4heb9tFCVOwfgxNmHCM9ZuhUMwh54Pg9Qq1hbjPYbMvNy/S
         XKgjKIcv0hM20RB733QZ5EjRHZrhgAwDwovl0QszXTclpCZXVxcbVNggh9iv/Itn2WaX
         v4aX79lSPt4/Wi/ahdJGkTa2Sc3T++OL20fwbSz3n9LIoEeZ2FyPEdyfbp6QFioDv9OI
         qmgrqIs5irZEhspivalwoQt50YqzTi8OIgzq9kZ8nOVx7NF8m1zUj30CtGQUp0Yeomja
         d3kg==
X-Forwarded-Encrypted: i=1; AJvYcCVq3qDQSRHzpCeoLv/XIUb4xxaRBzdJcW0Muqfye2odU04/6vbWZcZcr0opjdAy/GjVr6mJCuQe18U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2gWRyN+L+RRI7qArvilKJ7kzkUKnYlQFlmmtPwrQOFnO5y+az
	r4P9b9GIraFY3FP9IBjhuSswHlIVfltgAr72vEn4udvBAEBpHgezcOtJVJJow73L4RTLXKE8O+B
	G98hvKg==
X-Google-Smtp-Source: AGHT+IEzWFttnZLEQAsOaxYvtzWLuPcRq6QltY73DikVd5gmywMn7Yi+CzZHr3S07fvHdxIzVSJyvXKfRes=
X-Received: from plrc6.prod.google.com ([2002:a17:902:aa46:b0:29d:5afa:2de])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32d0:b0:294:f310:5218
 with SMTP id d9443c01a7336-29df4cb6bfamr6615315ad.0.1764980310360; Fri, 05
 Dec 2025 16:18:30 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:08 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-33-seanjc@google.com>
Subject: [PATCH v6 32/44] KVM: nSVM: Disable PMU MSR interception as
 appropriate while running L2
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
X-CRM114-CacheID: sfid-20251205_162405_555516_4FFF7B83 
X-CRM114-Status: UNSURE (   9.52  )
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

Add MSRs that might be passed through to L1 when running with a mediated
PMU to the nested SVM's set of to-be-merged MSR indices, i.e. disable
interception of PMU MSRs when running L2 if both KVM (L0) and L1 disable
interception.  There is no need for KVM to interpose on such MSR accesses,
e.g. if L1 exposes a mediated PMU (or equivalent) to L2.

Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index ba0f11c68372..93140ccec95d 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -194,7 +194,7 @@ void recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[7] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[10] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -222,6 +222,22 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		MSR_IA32_LASTBRANCHTOIP,
 		MSR_IA32_LASTINTFROMIP,
 		MSR_IA32_LASTINTTOIP,
+
+		MSR_K7_PERFCTR0,
+		MSR_K7_PERFCTR1,
+		MSR_K7_PERFCTR2,
+		MSR_K7_PERFCTR3,
+		MSR_F15H_PERF_CTR0,
+		MSR_F15H_PERF_CTR1,
+		MSR_F15H_PERF_CTR2,
+		MSR_F15H_PERF_CTR3,
+		MSR_F15H_PERF_CTR4,
+		MSR_F15H_PERF_CTR5,
+
+		MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR,
+		MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET,
 	};
 	int i, j;
 
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
