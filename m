Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB60C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LBHMyJ4V+ReX7znujq9lR92A1UckKvyTRYc1m3yx/A=; b=0cvI1sPEEuz0gJ
	R/2Zs/ezhuDdNzgXdSBQRBVKHvxQhH4sF763aPkvsOssOrJIbDSZcXhkwaXSDS7lfLbyKLNQs0Slt
	dMforJgoohflImwIvYD+ZWOFCLTpzyuVmYKDfo2DH7NVBVkFOjqs9NDk9blEELv0KGZoqEL5l3SGg
	iAMz8cMe0HAfbBI0NyyFBejuMDyTBmMWxX8pfGcHrThEPy3yt7bD8+znSwX03d+VF9YUxjz8nTheV
	MwRcHFphzS01yYU0dzg33y/q1Z7zumrvjnEMC3f8vZkR3hgmzdTswYZz8yBWXtWxXMHNw/0hESwEJ
	yCsiriItCP6Ph0Rx+UEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlef-0000000GZGm-4AMF;
	Wed, 06 Aug 2025 21:26:37 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHN-0000000GGvN-3pa0
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23fe28867b7so2375495ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510309; x=1755115109; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h+R0RK6o+FBkoODCsg4/sPruy7k1VkLsFBuytBNeaEE=;
        b=1mA7rBR/I6HwUswNiBr2Nk4A09ZrVGIskSfNvXllmn5aAscdoYjaVCk1eQXBbiTPNO
         KELxz1eZnbOcKPoDDvVJFb1rCL3nRSIYHFp3+HtLclHQzGTrS6moeokQIdCxkR53UC7O
         oSRZ38jnIS4AyVuus47l60GXtdGR6/S29jNzpcvQrVydQGJPqpSOMsEO760Q+1PjwnJh
         ew1ynCj3Tx48nai+39t5zs7BXfUGAKDuUSHCfYj4sBBskbqfLNtYlTCCdrqTyE8etEne
         4CPhmh54HY3iSCkBBb7/VgukTE79h5dgtJ7rflInYV1phSs3joi0xZyh8LD5qLRWHaO9
         nCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510309; x=1755115109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+R0RK6o+FBkoODCsg4/sPruy7k1VkLsFBuytBNeaEE=;
        b=UUFYAEQtzE35ZuQlvfnIgk29B8bGoAznrF/hKeLHzQpCJR83yKgXL8RT4xPsvWaW6g
         n8XlSu3P4kXiVrEVt9g9cBJfn3H8WqFgm6VjZc6zebaymaIuP7wrqWsDVtDYw3kcnGsu
         7fo2g1Fq3gUShERjkT0sYzCUEnLCnoIHJexCZAcwq59xqub+N/mvU5UWqA00znneQ9/r
         C976AT9+65/zNXwCSsdgTvfJhbluzNCj4M3NjUFTbv1mJj2/9df8IoIywXZMmoj1+Eld
         kqOlL59Ypf4+eSQgDlyCVxW408rqVTSlgjdAZKV5/Zzi1YoXUuf07YIYjqB1pjBtIw/O
         fI9w==
X-Forwarded-Encrypted: i=1; AJvYcCWGWMBiK2ulMwUJS2cdqqHRnoxv/IpEk/YCbg7G++NTfYaoawwE4TyD/UY6miFvdppcT6arCpnJW2M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqslMvRCxEhKdcZOHcD0mDfjgtGsMXBQlPuaIqL4gixqkozs+k
	KxmE2HdCHcJPRJNm/clbXo9CclEzShxZ16XURAj/zMfPpElN285OUJcVOB9SbJkdBgK/I2x7+G3
	h1Z3zLQ==
X-Google-Smtp-Source: AGHT+IEfUJQHCKm2Ka63Vh1rz9TId3URvafpVHxlHcjND/kCO75vRaPMhhxSn7fVXTy0Nxb/+lRjTxRhOaU=
X-Received: from pgbcz12.prod.google.com ([2002:a05:6a02:230c:b0:b42:1518:df18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d510:b0:240:763d:e9a6
 with SMTP id d9443c01a7336-242a0ae9d65mr50650645ad.25.1754510308841; Wed, 06
 Aug 2025 12:58:28 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:55 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-34-seanjc@google.com>
Subject: [PATCH v5 33/44] KVM: x86/pmu: Bypass perf checks when emulating
 mediated PMU counter accesses
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
X-CRM114-CacheID: sfid-20250806_125829_962409_CC4B1671 
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

When emulating a PMC counter read or write for a mediated PMU, bypass the
perf checks and emulated_counter logic as the counters aren't proxied
through perf, i.e. pmc->counter always holds the guest's up-to-date value,
and thus there's no need to defer emulated overflow checks.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: split from event filtering change, write shortlog+changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 5 +++++
 arch/x86/kvm/pmu.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 817ef852bdf9..082d2905882b 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -377,6 +377,11 @@ static void pmc_update_sample_period(struct kvm_pmc *pmc)
 
 void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
 {
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu)) {
+		pmc->counter = val & pmc_bitmask(pmc);
+		return;
+	}
+
 	/*
 	 * Drop any unconsumed accumulated counts, the WRMSR is a write, not a
 	 * read-modify-write.  Adjust the counter value so that its value is
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 51963a3a167a..1c9d26d60a60 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -111,6 +111,9 @@ static inline u64 pmc_read_counter(struct kvm_pmc *pmc)
 {
 	u64 counter, enabled, running;
 
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu))
+		return pmc->counter & pmc_bitmask(pmc);
+
 	counter = pmc->counter + pmc->emulated_counter;
 
 	if (pmc->perf_event && !pmc->is_paused)
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
