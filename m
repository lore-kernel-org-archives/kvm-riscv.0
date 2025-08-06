Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE3CC87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAVWZWuOB304b007kLSaV7DP2/43lwXo4c7ZXqNKkMw=; b=CGT50iVnH9yQ6G
	1L2pNZvLzUGF+eLBIxrfiLktEd0fKIFvB/Tj6uKSxQYLAZcISLEKYQVGROP7ohZvhr2VvyrdLoVXQ
	Hp2+wkZordwEs7ul8oLkxYONQ8d7TfhNUfRi6aFFG/ttDUUMyckEv5m6Nr3S2fxccONVpwNrUKcbU
	aIWijhrjcdOHgUirfJnOuTo/58YNq/96vEKK36qsuOxpKFoFPPItaGB6DlTNKJopRP6nhiMYwUslD
	Y/jQMQsgDILLUJ6CRDgNFBvIJgXckL+XE43/KLwUcAnVxh5WQkcy+uxfwQD8ZDAtXxAzgxxWxlrsZ
	X8dW8xXmyvDGR9tjSPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlyg-0000000Gcrz-0Ikz;
	Wed, 06 Aug 2025 21:47:18 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHc-0000000GHBl-0jXa
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:46 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b4227538a47so135137a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510323; x=1755115123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AqSoz/ys0/nDwriVLA2HvcSasFXIo2nt11bZwmhw7W4=;
        b=rQPe1xgLr0WYWegdjyg3F7223rHQdUiSWs/lrrsR/p0KeCbCJzTF0byjzLriqwXDHX
         Okj2++j5bhVozeIgRWS3rkkOleldBTpHH6dOR0b9rlGkKSUqk8ABKZMIkSHRyqZluM1q
         86lP4HRVj5CbTkZv+0F/IdDAVwSNU7RB0OSM7dlEgzUVcFfnqxeQAOph14J3sAWGBGG5
         Riqn0J39AbLHc69jrHQuH/ratg46koHFMNjfKO2/lMerB00WoDxxvIvPg/hAUpKHH1kC
         I180DBLz+fulwb9fi1+siGNtb+ktGcRZc3PCg6e4mfrQiQXoN7VnVYonV372/waqqNPV
         LVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510323; x=1755115123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqSoz/ys0/nDwriVLA2HvcSasFXIo2nt11bZwmhw7W4=;
        b=JvFYiMIEGQjysyC73TvuPplUOgG1URtHJhiKIMJqL7ue6iYg4NmO0bBlMm70Dn7AFE
         KlKQeUB0dTutnWbn8cPuGjN/r4DWSxysJEZNGsyBAJhhiw9aSB6kBsjEde85jsBFbd2X
         8mp7eclfEhETBaM9foawzUXiUjM6d56gpyP2iucquRpw3zjOdH76A87zPf0+Q+WBE1bb
         6dy6k17jDs7lXD7S0MruYLuVRSstcfQKphn1eqXzeVjPmt/Ak0UY0mmmuzrYO4ia6guu
         nSvCDJDvjXv8xhSjQKE3Sz5wNUBoS1bK/w9cZO2ZOWUqfUPS087brFVyVGOSa+x/HdRG
         Drrw==
X-Forwarded-Encrypted: i=1; AJvYcCVOpC1e1wsqQyQhAN7t2D325Vqu9wgEvxh+EMhtv+x5+n2TZybWlNkmUztyeATWXh/dF4aB5vKvQ10=@lists.infradead.org
X-Gm-Message-State: AOJu0YydeylzQA5VCq+05UVPIxoM2lj3keiiK6RjxDnPZun1o2v/p9Cz
	TXtw+7BT7QtNmtZQUaxkAxhuF2TRfYZ+3CQV+3JOTTUm/tFYWOaKzogaUOFyAAgsGJ0k9MQiBet
	//uqOnQ==
X-Google-Smtp-Source: AGHT+IFhegW1gGR7UHrSJevPOd3ITDk2k4F1jYjU8AgzTqj6JmCrtpCZa2eEdv34H9OVmz6MG3yGyWC8HfY=
X-Received: from pjbsx14.prod.google.com ([2002:a17:90b:2cce:b0:311:c197:70a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:31e:3bbc:e9e6
 with SMTP id 98e67ed59e1d1-3217638fd88mr438488a91.19.1754510322909; Wed, 06
 Aug 2025 12:58:42 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:03 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-42-seanjc@google.com>
Subject: [PATCH v5 41/44] KVM: nVMX: Disable PMU MSR interception as
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
X-CRM114-CacheID: sfid-20250806_125844_209258_EE721CBE 
X-CRM114-Status: GOOD (  14.08  )
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

From: Mingwei Zhang <mizhang@google.com>

Merge KVM's PMU MSR interception bitmaps with those of L1, i.e. merge the
bitmaps of vmcs01 and vmcs12, e.g. so that KVM doesn't interpose on MSR
accesses unnecessarily if L1 exposes a mediated PMU (or equivalent) to L2.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: rewrite changelog and comment, omit MSRs that are always intercepted]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 47f1f0c7d3a7..b986a6fb684c 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -627,6 +627,34 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 #define nested_vmx_merge_msr_bitmaps_rw(msr) \
 	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
 
+static void nested_vmx_merge_pmu_msr_bitmaps(struct kvm_vcpu *vcpu,
+					     unsigned long *msr_bitmap_l1,
+					     unsigned long *msr_bitmap_l0)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	int i;
+
+	/*
+	 * Skip the merges if the vCPU doesn't have a mediated PMU MSR, i.e. if
+	 * none of the MSRs can possibly be passed through to L1.
+	 */
+	if (!kvm_vcpu_has_mediated_pmu(vcpu))
+		return;
+
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PERFCTR0 + i);
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PMC0 + i);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++)
+		nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_FIXED_CTR0 + i);
+
+	nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_GLOBAL_CTRL);
+	nested_vmx_merge_msr_bitmaps_read(MSR_CORE_PERF_GLOBAL_STATUS);
+	nested_vmx_merge_msr_bitmaps_write(MSR_CORE_PERF_GLOBAL_OVF_CTRL);
+}
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -724,6 +752,8 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_MPERF, MSR_TYPE_R);
 
+	nested_vmx_merge_pmu_msr_bitmaps(vcpu, msr_bitmap_l1, msr_bitmap_l0);
+
 	kvm_vcpu_unmap(vcpu, &map);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
