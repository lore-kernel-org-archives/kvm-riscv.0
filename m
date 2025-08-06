Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C063C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdstTOPXESABGZ5ZognaTET7hYI4j66WXekOn9Ne4Tg=; b=lAbbkFApLBzDUv
	aHgLzYb2lgNMesNtL6nifBB8JNgKsCVevMS38bY+/6lyh9Qk8HGnNwjj2qCt6NHux2ArgSWQ9XgH5
	k+7jaPSWwhQLHDI2v46jywNK5PBxigW0ZSu1m/wlvOB0p3yxlb9jqIRQ+tfvo+8mBKK3QfQ4RiXiS
	E5tpLlqdiowP6lOI7gUk0P5MyH1FvKjFdA6x+Hotf3jP7rbaSqsG56IBArXa8AFbJcNTu2s1lExmw
	VTb14dtAP4xLyvzGIFLN5nWU3cnMbzX+09WsUvQHTMLOYFWTA33dELVHEAGuSfrzYfxEAdnSl8Fh+
	LqASRuXWhwyDgdP4HUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlUc-0000000GXqw-38w6;
	Wed, 06 Aug 2025 21:16:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHH-0000000GGnf-1pJ2
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:24 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23fd8f85dd2so1790795ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510302; x=1755115102; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn8S/sdm+8bvzWJ6gbgYYHL6yp6bRqDxs3iW0RSe7uI=;
        b=CMsZVxrCpAUpjOOWBi+nQe3jLI1dFddiTv7pB0bjjEMKXPbyW5T6MH+xQSMsiEUWMB
         nNqi44+1VXZmBDH8khAdM5DJOyUdjqhAbKOKucN5Yh0BUu3aXBwXs7jZyLeXQKobK9d+
         YGvalJ97PnXr/8FVueQUePWmXsMKGuIMYTo+3XVwuX8kHYjRCHE7yt7MvHSZh/Gn2d/8
         Wp03MY9GqfEF1LXAiLFd34ouIRbD3wWfsAIZgj8BZgfk9YYk47f+zncP5gVYPYxVOQx3
         jigR8YJoKbiPNUs/kLOeahKzoEzZquaRitKkZEvAWaDmWlTWj1FIOtFM+EIVZvS/iNbm
         X7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510302; x=1755115102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn8S/sdm+8bvzWJ6gbgYYHL6yp6bRqDxs3iW0RSe7uI=;
        b=v4SfM33zclLt/M+wfuREdWsb0/F3dGDURD2MNg1P++WlAyLCa08xAIFMgrl+WW/SjE
         Uvx0kM6kSISX0PmT9MbTQQ5CSIuurV+v+ShgM//qHQG+0j8Spa6OPFIQerKooZ1YkEdt
         1gSNWH3nTTNC+JjGYi3iCj1pegoURkurcPkUI3v4LeLErQKuAapEiFhcAAyqlAPptYFW
         Cn0dUV2HKkvM2LT11YE8kE9vH/fXfR1tDnw5sJUfPAiwMsSDUhv3ong0yjAKq1pVea/K
         amu3CQHBkuHy27lmQ0Sa0fmapVqbWlEPNqEbcTSkuCGat79pxDottoJNU9jmTiF1Bpdn
         gGJw==
X-Forwarded-Encrypted: i=1; AJvYcCUA8IKmsabVs4F4QlFthl7ET/b9LhHfIXc9csatEiI8egiyFAHTJZ1MwTHr1e1ye1W/+RdG/7qDY4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyloZbI6wnCASyT/D2F0gmLPgzySjVJJ9a7r+PFZMDSyDZ+oMsd
	PEzCG23jNI9xAwZtpOVFzrUBfqoBkJUtJPPVVE8cUSX1YhaON1tra4M+z+5eqBRWqsRUnyYX6JH
	cBLCShg==
X-Google-Smtp-Source: AGHT+IFo65jEdjZGUxY/vUUE9hB8u0/Ehm65nxno4lYpqINC12VaTwhwaABlYMWVK9zS/nrWWsDoA8ThjT4=
X-Received: from plha17.prod.google.com ([2002:a17:902:ecd1:b0:23f:d0e0:7e93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2cf:b0:240:71ad:a454
 with SMTP id d9443c01a7336-2429f2d9e92mr70108355ad.1.1754510302251; Wed, 06
 Aug 2025 12:58:22 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:51 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-30-seanjc@google.com>
Subject: [PATCH v5 29/44] KVM: x86/pmu: Use BIT_ULL() instead of open coded equivalents
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
X-CRM114-CacheID: sfid-20250806_125823_489512_8B33036D 
X-CRM114-Status: GOOD (  11.82  )
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

Replace a variety of "1ull << N" and "(u64)1 << N" snippets with BIT_ULL()
in the PMU code.

No functional change intended.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: split to separate patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c       |  4 ++--
 arch/x86/kvm/vmx/pmu_intel.c | 15 ++++++---------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 96be2c3e0d65..b777c3743304 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -199,11 +199,11 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 					 kvm_pmu_cap.num_counters_gp);
 
 	if (pmu->version > 1) {
-		pmu->global_ctrl_rsvd = ~((1ull << pmu->nr_arch_gp_counters) - 1);
+		pmu->global_ctrl_rsvd = ~(BIT_ULL(pmu->nr_arch_gp_counters) - 1);
 		pmu->global_status_rsvd = pmu->global_ctrl_rsvd;
 	}
 
-	pmu->counter_bitmask[KVM_PMC_GP] = ((u64)1 << 48) - 1;
+	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(48) - 1;
 	pmu->reserved_bits = 0xfffffff000280000ull;
 	pmu->raw_event_mask = AMD64_RAW_EVENT_MASK;
 	/* not applicable to AMD; but clean them to prevent any fall out */
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 98f7b45ea391..6352d029298c 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -536,11 +536,10 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 					 kvm_pmu_cap.num_counters_gp);
 	eax.split.bit_width = min_t(int, eax.split.bit_width,
 				    kvm_pmu_cap.bit_width_gp);
-	pmu->counter_bitmask[KVM_PMC_GP] = ((u64)1 << eax.split.bit_width) - 1;
+	pmu->counter_bitmask[KVM_PMC_GP] = BIT_ULL(eax.split.bit_width) - 1;
 	eax.split.mask_length = min_t(int, eax.split.mask_length,
 				      kvm_pmu_cap.events_mask_len);
-	pmu->available_event_types = ~entry->ebx &
-					((1ull << eax.split.mask_length) - 1);
+	pmu->available_event_types = ~entry->ebx & (BIT_ULL(eax.split.mask_length) - 1);
 
 	if (pmu->version == 1) {
 		pmu->nr_arch_fixed_counters = 0;
@@ -549,16 +548,15 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 						    kvm_pmu_cap.num_counters_fixed);
 		edx.split.bit_width_fixed = min_t(int, edx.split.bit_width_fixed,
 						  kvm_pmu_cap.bit_width_fixed);
-		pmu->counter_bitmask[KVM_PMC_FIXED] =
-			((u64)1 << edx.split.bit_width_fixed) - 1;
+		pmu->counter_bitmask[KVM_PMC_FIXED] = BIT_ULL(edx.split.bit_width_fixed) - 1;
 	}
 
 	intel_pmu_enable_fixed_counter_bits(pmu, INTEL_FIXED_0_KERNEL |
 						 INTEL_FIXED_0_USER |
 						 INTEL_FIXED_0_ENABLE_PMI);
 
-	counter_rsvd = ~(((1ull << pmu->nr_arch_gp_counters) - 1) |
-		(((1ull << pmu->nr_arch_fixed_counters) - 1) << KVM_FIXED_PMC_BASE_IDX));
+	counter_rsvd = ~((BIT_ULL(pmu->nr_arch_gp_counters) - 1) |
+			 ((BIT_ULL(pmu->nr_arch_fixed_counters) - 1) << KVM_FIXED_PMC_BASE_IDX));
 	pmu->global_ctrl_rsvd = counter_rsvd;
 
 	/*
@@ -603,8 +601,7 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 			pmu->pebs_data_cfg_rsvd = ~0xff00000full;
 			intel_pmu_enable_fixed_counter_bits(pmu, ICL_FIXED_0_ADAPTIVE);
 		} else {
-			pmu->pebs_enable_rsvd =
-				~((1ull << pmu->nr_arch_gp_counters) - 1);
+			pmu->pebs_enable_rsvd = ~(BIT_ULL(pmu->nr_arch_gp_counters) - 1);
 		}
 	}
 }
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
