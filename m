Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A1C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50HcJclumOz5sI/YfIOh48+cHlWgLLY35fiAQlH5q10=; b=QSuOy+F0FC7S+m
	XbKJeNCCjN71k7eeqysYceh6gutp0g/RCT41GcP3bVeBWt168ylOB8pMt31+GcH2DWy7uhg3IZU7s
	GrMwlIRWJ5l10oCe/MELfZeJZcRe2UaiZFMiAyb+UkbsFPuFHBE+78/D1AWSNs0TwsvJhoJk1w7ji
	hLsOc5RvDbafhLfccGcSo0Qxw1ORBiP3WziP817/rrFChl/SoTZbrJyTFHSg3LZ5ydHxc2ZeHHlup
	OJ9Ve9J95FrqJ2paEIoAjo92fXq5broSR86BiTI0+AVqEg6OKdVpYMOrKgnPkAP+SLgNsfwxpAfAZ
	qzUhBW5Fd39k7NB6BvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlwN-0000000Gc7l-0wPU;
	Wed, 06 Aug 2025 21:44:55 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGn-0000000GGNW-3MAr
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-24086faa5bcso1566985ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510272; x=1755115072; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=f87NkBd7OfImcCpQeX3diUmsVfiaFPyYZVPWE7Qrj3mTzjRbbMo3mK6xJp6Ylw3kIx
         Y/FW3i/w75YqRTGZFmczXyk++Q8A8/aKx86X/zwuDu43wYKaRBo1wFvwCBTNS5l/eHb8
         cB1wOGXXG1NvccTnZBzTHuA0PKAhRhgXYbagd0eigxyru8DZ7eBf5QhQLvo3Ylfl42H6
         GWjSQtujBVYaIt1nkk75msPkD5Jl0vstQHjSSI2UEEWlCLWs1jpJyjuKyEyi3vmbVuZD
         Wb7T3Gu9+cpoEyKNluFUQi5TSQdAeWbEQyKhtHuWogfK9p1IRVJRjZ96M4Ejt4+McZko
         7y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510272; x=1755115072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZMeMFDLZr+yCjindHzAam67OkhMlNf3hlQ7J9N+n2w=;
        b=Av6sITiIbZDcvHTtom5USbSnTPNvvfV+Mn1SekUt3qDG+p4DRmFsvxte81eRk+Glo6
         mit3kLcPLSfIf36mQbG659h+Cb1QK0REUABjL/zth8fiJubYGmHg1kOs3xVcPRdcTtMo
         R1hwmMLjaPjQcMZfJiTUHrP+PexOKJ8u0MC5PdWKEXikjBI35lkpOxZTJkhJg8n2/Yzj
         9kYHvEPJ8Njo+Jn78ZwLDQQ5JQbzC7A8Y9bvmnxibyhwF8mmVLoY/3VyiaMO7YddI94h
         WXWwPcfObYSyqvaagksi5gsyGledITdr5Ags/0YVy9hfBPLPrQr9FyxVcBCbTMKTvlOg
         gqeA==
X-Forwarded-Encrypted: i=1; AJvYcCU2cabg/2gThqpEPVi5TNJzueSi28DUhN2J7v9o6GYzw9NnDehAEmPWNa7/dKjEeZJ5Yqvqthz0sOQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDGG8Rcr3Sie9mnx84+XVRwQ9TL7UkVqNKX1L7uib7qh3C5F/O
	5ppyBb6El6M9glufNKF+pcnyd0A5eJsnPwx6TZ3y3avKULNWd8HKFtjCGxcaWTMOcwuaz2qYtGf
	/9Opiwg==
X-Google-Smtp-Source: AGHT+IFt32OpTUGU6us4Rz359zlOuJVL+j3ifqAbqQAET68s3resGqbQqEcv8vf6Ss5FatBMSRwumXjkA8M=
X-Received: from pjbso3.prod.google.com ([2002:a17:90b:1f83:b0:311:1a09:11ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e784:b0:240:9f9:46a0
 with SMTP id d9443c01a7336-242b1aa312cmr4180365ad.38.1754510272385; Wed, 06
 Aug 2025 12:57:52 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:35 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-14-seanjc@google.com>
Subject: [PATCH v5 13/44] perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for
 AMD host
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
X-CRM114-CacheID: sfid-20250806_125753_856890_5FD4C6FE 
X-CRM114-Status: GOOD (  11.95  )
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

From: Sandipan Das <sandipan.das@amd.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU flag for version 2 and later
implementations of the core PMU. Aside from having Global Control and
Status registers, virtualizing the PMU using the mediated model requires
an interface to set or clear the overflow bits in the Global Status MSRs
while restoring or saving the PMU context of a vCPU.

PerfMonV2-capable hardware has additional MSRs for this purpose, namely
PerfCntrGlobalStatusSet and PerfCntrGlobalStatusClr, thereby making it
suitable for use with mediated vPMU.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/amd/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index b20661b8621d..8179fb5f1ee3 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -1433,6 +1433,8 @@ static int __init amd_core_pmu_init(void)
 
 		amd_pmu_global_cntr_mask = x86_pmu.cntr_mask64;
 
+		x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 		/* Update PMC handling functions */
 		x86_pmu.enable_all = amd_pmu_v2_enable_all;
 		x86_pmu.disable_all = amd_pmu_v2_disable_all;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
