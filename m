Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B1C87FDA
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 00:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4ISSwPOL3ArWBFdnKgZHHAaVzRmLnnVCOiKHTer3IM=; b=jv0qRv7V43pYxu
	OHYsRKjdICcabBCBbB0kY8fpycIu4FjrtLt3wMBIua/79nWhXXisMYWgvhffc/ioX9r3cv4B7quPe
	c0IX/booyyjt9QL9WvNiIvC+Rny9piVGSovNlDK9RCqMtHEVwsOiaNh1HStrqX/R77vOGuVNRF57p
	D/MOuPfAPEL9+nL+K5zm6jR5Bw3ya3YKd2S45Myxf6wzGi+cUN6DOPz/rIVktBvplbRXjjEgu2Z4g
	eAS5O2jvPKRMGMvr5Jxa/jJEcIJuhXE+om5OLKaaATYYcc7tDnx862ZnmR8g4ae7AH6vcnAYei3Zc
	38K8nkrTbCXSB2+rW2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujoHY-0000000Gtd7-3Ubb;
	Thu, 07 Aug 2025 00:14:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGl-0000000GGLa-3Yv1
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31ea10f801aso467768a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510270; x=1755115070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=P+6kUSR5aBTgNcunERrWOcQMCZiG0moZeRQ0turCJ94=;
        b=amiYzzQO32kRdvrvsUUzmpjyfIMqaOipV7u3J9/BIQPj6qEPBNSMZzhNWi8/est/o9
         /7gbs3qEz9Jm7aJ2JTDnJ/twmO9aGY8OCUP0+p8XLRyWFPcR3o7H1PAOzkVnErJ1Pvsm
         TFVhoEaNtiPEcs3rfa/e8KM9vx8cDpJz3PhLUTI0rqijeKtgZWVLPkIjaSfCQp28pImr
         JXBUDzHXfzSiFXm6UeXQlM3Yepm01cHVqzUV9RCgaD1xNKAjaBVHTJMjlHcBGs6AoJvN
         zd1qQjlo0YCbqwWXiB0ADJU96SMr49CRdZ+Fwn6bR3e8u8oYm5oHDy3andrNOdQlEBdz
         MuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510270; x=1755115070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+6kUSR5aBTgNcunERrWOcQMCZiG0moZeRQ0turCJ94=;
        b=iRfp1YY80fB9fk5GCYaZdqdOKeoux7fsF4qmahd3RS5NVGn8/ucbsgOZtz4wI4TDT/
         XnCQuA/YtLQe8vaRnXW1/DhyKXOuhVhk2mmSPvXFh0NFmEproqMo695jX7CL06v5Q/R6
         VY2OoIennuJyzG47puYhl28e9/vl4eVVcGDjsH7vyz1uoIRcFs7Ea4ECcdQ5T/L5cbkh
         ZeuQY7xxO+hvCc4WicSChj2zIdTUIh2QRO1mG9QeY6YXO4S/uT9m2MAhpn9kMBDS6QIB
         FklvQjaWHNsBz11MZl3DRJARsQQANCcdE6OKwJvGmqDIdtVGdP0CKI4apNNDpZzOctHq
         vTSA==
X-Forwarded-Encrypted: i=1; AJvYcCX4RZs5laJoTnYxwYicJSByhpJsyNZAYCxb5QAKhiQ7cgSWmhLFE2bve3AC/oI8MTN9MUzn3niNOTU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLk/+TNAYhSRSv1f6j+YBVpz7ju2m7KM5WLiQG7ABW5KRFJO12
	+GFaa5YNHn950NFsgezCkzbWcLwb7KjrZrR0G89ZBViTW3pTZXUm0xmu65MrDotW2mHIUL1HMGT
	tT2D0GQ==
X-Google-Smtp-Source: AGHT+IF3NS6j+zPTC7HBpb/PhEo054/sULoDCrTNDdSbB3JBoD67HO9NJP/SyaYTvqhMXFbG0IGQUgBSmnM=
X-Received: from pjbeu16.prod.google.com ([2002:a17:90a:f950:b0:31f:28cf:d340])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7d0:b0:312:ea46:3e66
 with SMTP id 98e67ed59e1d1-32166ca3f0bmr5365514a91.21.1754510270478; Wed, 06
 Aug 2025 12:57:50 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:34 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-13-seanjc@google.com>
Subject: [PATCH v5 12/44] perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU
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
X-CRM114-CacheID: sfid-20250806_125751_888485_2AD29D21 
X-CRM114-Status: GOOD (  10.05  )
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

From: Kan Liang <kan.liang@linux.intel.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU for Intel core PMU. It only indicates
that the perf side of core PMU is ready to support the mediated vPMU.
Besides the capability, the hypervisor, a.k.a. KVM, still needs to check
the PMU version and other PMU features/capabilities to decide whether to
enable support mediated vPMUs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index c2fb729c270e..3d93fcf8b650 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5322,6 +5322,8 @@ static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
 	else
 		pmu->intel_ctrl &= ~(1ULL << GLOBAL_CTRL_EN_PERF_METRICS);
 
+	pmu->pmu.capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	intel_pmu_check_event_constraints(pmu->event_constraints,
 					  pmu->cntr_mask64,
 					  pmu->fixed_cntr_mask64,
@@ -6939,6 +6941,9 @@ __init int intel_pmu_init(void)
 			pr_cont(" AnyThread deprecated, ");
 	}
 
+	/* The perf side of core PMU is ready to support the mediated vPMU. */
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	/*
 	 * Many features on and after V6 require dynamic constraint,
 	 * e.g., Arch PEBS, ACR.
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
