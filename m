Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826ECC87FDA
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzYJCGY4xUNtAXkkQ3SL8kg/br/OYKnadH04UtOlRMU=; b=ZFgypa0g5my1+4
	NNv+iIcgU4087G88JZ2kvzCVulSiaBQ73R0t7fqdjFt5q+UBVsS7gpkIsgvjzUUDHHWBdCRZKMU1n
	/qUdvWn++xDffd9IhOb2ftUxLr3LmSyk/M6VWoxmSEqUHpCy3a7j0R/6VWf2niNItkinyX+nkLMqT
	gU0uITz+F6Fa0OwQualwQ1dM9ZDAfEcszRNDpa7jiLrOS/fRbYmYFz5csjyjL1joky2fjNvBmA9DH
	XzPfms0FGu8UM4Ie/MqJaglLXlwXUmCOZobSZKN4hgplJyrj/4+rRXd6krPdgCuR/KmHJK2wxQZOn
	Prmi75Ma3BAyzEE4omrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmdz-0000000GjTb-17kE;
	Wed, 06 Aug 2025 22:29:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHR-0000000GGzb-0qJH
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:34 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31eb41391f3so293886a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510312; x=1755115112; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xm7g2YivXo6aQ0SA/h1DnHmIX017hVekqEmykFx3Fp8=;
        b=mhL/KeUcw4NUz/0olcHbFn4ZLIFh9+8lSdAEIq/SgzhOgNj5gxypRoweZe3MOCFHUd
         oPSqYi3rpyklSA8uJAGOnDh2AkFAVZN1EvVvKnYX/qpqaodwJC+2yAG4gk5TtLwtNqs2
         aJrO7IFG81qVikCsEENBwhgXMANmXlmrqrJy0L9yS8j6xqeDntKn/GjTg6/6IGjHP/vn
         fKUJmRQYFQYR3RA8bSWlUnMaIM7M3NCVX6+xdg4NvmQkTuLKtZCbLZWS43P6SI18GpIh
         JIXwYc3X7Dcj80alnDGgydNbF9maJuxX/4tKr2v9f6d61naoHLHRlgwI5zpzOm2ZdoYG
         YX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510312; x=1755115112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm7g2YivXo6aQ0SA/h1DnHmIX017hVekqEmykFx3Fp8=;
        b=rXSJNP72NgBS8+vgD3Tbc90ppUbfcWRIyq3hbWFI7enxq/xDONTGBuVAIV6I4eLm0k
         rzzVaTL2HbEHx0n4D2z/T+hQVweEFR3G9uu3xWeQDmKSL21V465PYo1ynfkc++dMABKy
         JPSfzIy7kf0XVIz1T1CDWZe6OIMdx5zoVl8HF5xJCxFXxbxf46mAzLWm9fENwx0rK5QR
         n1q4CoZKIhu3govaQJCDhZijCuO/sretVshyPvS8GJyZjFHrWuQYjtmRy2S9EpgGStuX
         LHZiHVpQMFjdG/woA1GzS9LL3/XsgvZhMRMMNV20yc++zreRolmuApqGm90GnkpW4jyS
         rH+w==
X-Forwarded-Encrypted: i=1; AJvYcCVjN60bIm75QEO1hnP/XrEAioANRNf8UIL98RHU2RTrD9h2VV3eJH3NJaHw5lZ3rHruUpIb2ZOenkE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+DiPj8A9iS81IEfxKvKTrH7aQdoOA8ufn+rWKQgGXIpkZsYGp
	7SH3iejNb9KvWWHAsoMOnBg7qCuUbQdKWz1CF2hCx8d4f7S9EtiwWdTsxPO78H8CYxYEI5GRMjW
	vVnUcyA==
X-Google-Smtp-Source: AGHT+IEYZIIJpt/ZXd2reg+ZYe1ccOM3EaPSbjMXbuV7EDQKePHF+PpZ3A2kJS4xCp7zKjQzYF60hKA/y+o=
X-Received: from pjbok13.prod.google.com ([2002:a17:90b:1d4d:b0:31c:2fe4:33bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc4:b0:31f:867:d6b4
 with SMTP id 98e67ed59e1d1-321694b7c0dmr5279932a91.10.1754510312321; Wed, 06
 Aug 2025 12:58:32 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:57 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-36-seanjc@google.com>
Subject: [PATCH v5 35/44] KVM: x86/pmu: Reprogram mediated PMU event selectors
 on event filter updates
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
X-CRM114-CacheID: sfid-20250806_125833_244877_FC6BCD93 
X-CRM114-Status: GOOD (  13.78  )
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

Refresh the event selectors that are programmed into hardware when a PMC
is "reprogrammed" for a mediated PMU, i.e. if userspace changes the PMU
event filters

Note, KVM doesn't utilize the reprogramming infrastructure to handle
counter overflow for mediated PMUs, as there's no need to reprogram a
non-existent perf event.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: add a helper to document behavior, split patch and rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index e39ae37f0280..b4c6a7704a01 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -518,6 +518,25 @@ static bool pmc_is_event_allowed(struct kvm_pmc *pmc)
 	return is_fixed_event_allowed(filter, pmc->idx);
 }
 
+static void kvm_mediated_pmu_refresh_event_filter(struct kvm_pmc *pmc)
+{
+	bool allowed = pmc_is_event_allowed(pmc);
+	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
+
+	if (pmc_is_gp(pmc)) {
+		pmc->eventsel_hw &= ~ARCH_PERFMON_EVENTSEL_ENABLE;
+		if (allowed)
+			pmc->eventsel_hw |= pmc->eventsel &
+					    ARCH_PERFMON_EVENTSEL_ENABLE;
+	} else {
+		u64 mask = intel_fixed_bits_by_idx(pmc->idx - KVM_FIXED_PMC_BASE_IDX, 0xf);
+
+		pmu->fixed_ctr_ctrl_hw &= ~mask;
+		if (allowed)
+			pmu->fixed_ctr_ctrl_hw |= pmu->fixed_ctr_ctrl & mask;
+	}
+}
+
 static int reprogram_counter(struct kvm_pmc *pmc)
 {
 	struct kvm_pmu *pmu = pmc_to_pmu(pmc);
@@ -526,6 +545,11 @@ static int reprogram_counter(struct kvm_pmc *pmc)
 	bool emulate_overflow;
 	u8 fixed_ctr_ctrl;
 
+	if (kvm_vcpu_has_mediated_pmu(pmu_to_vcpu(pmu))) {
+		kvm_mediated_pmu_refresh_event_filter(pmc);
+		return 0;
+	}
+
 	emulate_overflow = pmc_pause_counter(pmc);
 
 	if (!pmc_is_globally_enabled(pmc) || !pmc_is_locally_enabled(pmc) ||
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
