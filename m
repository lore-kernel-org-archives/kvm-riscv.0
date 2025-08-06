Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE44C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwOB0pr8L8Q3ZQtrq56SzyN8+zFl/6/N20KJ1jsgd1M=; b=JQZqPc2QuceEGS
	uvidUybl0g/Rtd0EClrQFPnNzAzt5SmfjISsZTmcdSsDdcKn7eJHYlfjnrjtnVBJJ5sVOttn66jyo
	/JfhzP3txmmOUW6xsUkG5Y1q5oPAC4wECOZoeg9pquQ+4g/UzyWVZlJILXXY7Tg7lzJfrlODCN4LV
	Xd98RjirOvtFAYQSfCkmgr1swV6QlAQDxpa8LcL4S3KQpNSptvZ0ZgkoQ8mUpQ3uEL7anxbJ8G4Tp
	UH8nkach/rNtWxb7YpplC7yNQ0by0TbkdPoqO3X01WqoyTYahpA7TepvQCJ2QYqDSjs+DpVUHuriy
	JEet05bf1rZLVbIVVOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlyg-0000000GcsC-1hdU;
	Wed, 06 Aug 2025 21:47:18 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHd-0000000GHDG-1HOH
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:46 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b38fc4d8dbaso218985a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510324; x=1755115124; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=ADIzp5zTr4Is+lYQMi2OeS/M6hJRsdiXHsPrg8w9wCHbQQl1jpHZF0aVVRmCkQJ3KD
         bDm0K6es7D8c+xWJzIWt0m1H0q/UIWaJtBDU0u4YbqBBdavqMWbIwDDS7EuVRkPj9+7Q
         Br8RAIsWIEcHjY+WDtSoZusaYDeiuq2AiQyT6LPG0JdRNCbIkDRuH3nL8X4A5Jm46OS1
         j4MIvobYwSEOYMcmtahbG1g1GIDXxbg797hTYs0ugI1IOLOYp228IOR90EdxMwFU4aBo
         jNtQ8lKfV/0d9CE7lhZpa9R38xze/Uj4KqKB9O3CwxOBx+0Lyz3AEaJuOgRL7BOHXZdN
         dw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510324; x=1755115124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIwiS3b08lZbnfZBzBRHsRLYuS/hl5WgYmD0pyHBLVw=;
        b=TpsERDXow9r+7dERef/5Gw1vjMbSvqo9FExocTkIZnKP9c+X/0S4OJupc2JczlINoj
         GPYcPogySK8lod9o4AtUXQewdfU++KM5IoBowJgTQzO61BE2639wMlblIOsE1nEwm+De
         pCAX20OZBDxiDQSTyK31MtXjjmZXu2P9oteiH9jHaagsV0GpGk5QDTdoev7B4LRm/A+X
         lziOFPBtfCD5xvSB6S7ILrs/Tpje6OSVvx/optH/jQSNFtmA8ANb5oVBNz+3GvI0g9IN
         MySKbVKu4eH5wawKsKKUGxZN1zl996OJDAHGXHdoag3pIFI+lqfkG518a6ftZx1PEivK
         HUFw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMLYCOgcS+Bxh6G5wAle/q6cIhxRTb94LfABD4ktvViSPg9NmMWSerFWoKL0U/hoOVqF+biI3D3g=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPXe4HYddmCFVBxCuT7LaMHPTjXwQSuVqCkSeEjGGOawy/ffuE
	udeqcmMw/FlGKegijxX3UH9+ZJfIozScr0bvADnPnBOE+I5hNzhvH8zbmAtEFUF77lVWThMfS97
	c2WxYSg==
X-Google-Smtp-Source: AGHT+IEQR+T9dam/zfnLIV/i5izf3PHRRWb6ka2239rbCk7AqXY3VxMNYGaiVe7zhD28m3tT7rq7DHc261E=
X-Received: from pjzd15.prod.google.com ([2002:a17:90a:e28f:b0:312:151d:c818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f645:b0:240:150e:57ba
 with SMTP id d9443c01a7336-242a0a90e7amr55806795ad.3.1754510324526; Wed, 06
 Aug 2025 12:58:44 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:04 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-43-seanjc@google.com>
Subject: [PATCH v5 42/44] KVM: nSVM: Disable PMU MSR interception as
 appropriate while running L2
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
X-CRM114-CacheID: sfid-20250806_125845_381657_7A212202 
X-CRM114-Status: GOOD (  10.76  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index b7fd2e869998..de2b9db2d0ba 100644
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
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
