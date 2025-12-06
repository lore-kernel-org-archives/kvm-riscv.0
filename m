Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F28CD3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvTVaGYiuYklB2egviMe6N8nQKtIcOTszxkPyxT4ZLw=; b=qYubMKnWkQHmza
	9bO4TF/YE5046UrH/U+8pyfLSPuaRqMePsOGGlWkiWNpTE54FBJ/OYTIf0pAiE+dw0Q7QSuyySLpf
	S9NhRNQo2LKNOSCJaMKF8KH6AB9AMdVbDLDj70cjXMzy8tux+g+5iWLueDb4jCuzu3iipn2YDvqgY
	tIlhBVFMkkUz/zd/yaFGEqlC2yc+QpGHHXQkGV9JuciHu1QrQ7oa+byy6zWnWsHnvAPnoZrsycQau
	KlPyPCUCAgb/QmaTkqmr72PkJGgITFXeUHH8ayxfB6IslOiV7fsVp6RnH7B2ncZK0dZ2WD/M3gQTZ
	IreCJlU9Z5xDkkaBLUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0N-0000000AFfE-2Hwa;
	Sat, 06 Dec 2025 00:18:31 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzm-0000000AEhB-3dMo
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:56 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-bf222e5b54dso1583903a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980273; x=1765585073; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvhz9N1L4N+mDurmwM1rhQiV/PP6RHnJJPdqNYMoi5g=;
        b=qQ4UH169+H4kSKs/7SF9ezovOxZpEvlmFm0H/ehzF5ncmd/oPkfEqZ1WkVw+2dG+Nk
         oTJ5z3vMAFLcCVn6iR3S+E81eaj6Vqlw3AC0XbQoRMRzF5herXWzXmW/fwrj+I6+V3pY
         bbrrDn8UezQQvrGGEvyCyuz8orbq7bzCCSpe7R02jEXkY+7yOIb5NCk826Mmx/vEUcjv
         Jk6LAZ35BSGcA/LIzJZoRc2iCZXBSKpHnk3Kh0xtOW8NHkKX0tfQuX0sJP/UTwKQna3I
         zcOcTceXUGZJqo3Sux93h+FUIFHmuAgGXiSR7W1KXX4Ix9boV8Vv/ujh7PMCuKerFofg
         u0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980273; x=1765585073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xvhz9N1L4N+mDurmwM1rhQiV/PP6RHnJJPdqNYMoi5g=;
        b=taWZ0dfgDqC7RvdL0FU9NWxtuZCmdrxGXuRZYDxdoRCOjtE1dUvB8YOpvKSMVv/D2a
         NnEks37FfkVUJQca4QiR5BQf9esSiKJdMGdgtofMfn5O7EU4m9HRNBZ0vLB83YTHxabQ
         YZN3hzlTdCfEnSRBgfAVeznwR/wyTvfIF1QrgIjLKkBC5CND1Rx/73LPWVt+n7QawoBx
         AFADwROLz7rbdONHFb+Uv9QarbkSYcbLDybFZ6az7X4TzsrocC0HnGsbiLu6Mg8G2FM4
         jhuoDoujpB0VFAaY5Pp3LdTPN0mRYirII9pU3pui9YmIiI1ezczQhp1nIafiVH/cWGmZ
         cFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgj1TsL5l7PAsfGbtT2+muCrp8mC1t/vQ8I9rGxzfzrV3xHj2MBzdkxjah38SwCzGELcNvuhhOfS4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE22QpdEQpjhtBb4cgqZ5QxCtWcY4ebxT0EnuFKrBCZfwoulia
	dQrZr3lAvv/zHPd1iuoScIy253+MbdkJxnwbV2BiNY3r9mLzWDu/rLkJBbM0ERafLGp9MEjD+/8
	8AiRgDw==
X-Google-Smtp-Source: AGHT+IFWUJIU/8E8cWwKD1KvVXfXTPgHtbYSY08/FWGA961BLSrK8ZlXaCtvUM6dR/7cetdvhZaXTRiVhyQ=
X-Received: from pfdc17.prod.google.com ([2002:aa7:8c11:0:b0:7dd:1a70:fbc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5605:b0:366:14b0:4b19
 with SMTP id adf61e73a8af0-366180292f3mr728551637.36.1764980272562; Fri, 05
 Dec 2025 16:17:52 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:49 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-14-seanjc@google.com>
Subject: [PATCH v6 13/44] perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for
 AMD host
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
X-CRM114-CacheID: sfid-20251205_161754_997703_7581AF50 
X-CRM114-Status: GOOD (  10.89  )
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
Tested-by: Xudong Hao <xudong.hao@intel.com>
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
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
