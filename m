Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98543D3ABC4
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnmjeH8ogn7AJilansVfggveTaNchwnrVCmRWgKmqN8=; b=oUnqLxy+HhVWB8
	pBsbOmufSHYnpyJBSNkNDVerT2qWRGxyYoAAQZkLYKCxnvtbBvR4gt00CIgZZJWrxfzWLEyCX9KoZ
	Xwm37JRFAqwrlWl1rrj7gIGtYdYELIivygxUxFNbEt7jG8HgtvSfY6gD1BmSChPRoYhlAjFoJlA4x
	byLMqh1XlgB/rYFYwBlq8pz8h9aE/ElWPPa/LuRN8OlOP0fc+QAeyviG0VsMi5QL/oqx6+7L9qQQT
	g5kFuODfZ8wlCNqcYyfrKxYrJCttJrHYiMISnfRaWgy4ZBnAPlZS+PXHGOLyB/D/TiXVVAyQtOqet
	7vfwZsE+elKaLRsAKlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0K-0000000AFZy-0u9p;
	Sat, 06 Dec 2025 00:18:28 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzk-0000000AEeF-3o6W
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7c7957d978aso2757090b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980271; x=1765585071; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=Otg6Ilv0qWyg+WDmvHSZQqzb+UhB8ZadCehPoL80T8162Nqgiy73XpGXOUGtvwj0Bm
         eEdpgAA7Gg5l8SBkPxr8IuV9bdPhFmvdDlhBpvDIZtNhwtbDXVa3cD0RIoobWCfpYOLS
         Bj7IJir0Zp1CzqGlSd7KvQaoRdFyWF998wGL2WLrUGoVM4+AuAujdDDglhiJSmhIUm+m
         ORNgzaVZmW6NcjFILQe3cViFd5dCtHy7lv1kqVNA1Fw65X6pHXwFDSA/yoXBkk0qRDXH
         B1MIEINr6OuJCtQ8xvTItIG06NP/X/a9cLpotK5U+l2/GO4HIlSQHqIMixw4Mg55935y
         eBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980271; x=1765585071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=704FSrHxrLR1ctx2c3pAZj/r3vJEFglglFSFFl0Rh7E=;
        b=fSjmD2hQWPrk5S3J5dqk+ao9jeoA8hyxF/n+4NLrlODWZMDJ8z+SN/SOOp1PMpwi9n
         lw3yfnGTzK0C5EmIWTjhsO+5uEtq16YdulmsOX82Spdg465r6OQIO50hutxtsH8HdOGr
         Bi0NCF1af3z96TfTruQcc50dYokq9MZbiOSaPXRD577aXnjkQUTeoOo2PkDGcQnH0qQE
         V0//PRMZ/IaUWuR2TVTpnWPM7BoRkHRhsHFWgupJjCWYO7w5USivTMZC/dvoaeWsO+Fk
         9ptAoAio9VtoA/L9dKolB/4QvoeKLJbZtGI3jOcypIedf7pDNVn+YZYBIWPgBQG4Jd+G
         LiHw==
X-Forwarded-Encrypted: i=1; AJvYcCUcXOd5MQZISQEQPXpGTfJLhlvNqz+KBzsgA0sKf04grYwiqOn1MheF1uhw73uQdEE1kfyl6TfA4Ys=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRkErctB/PA1KIkwST8iVEL6KoI2ANfmkvfOzoHQUKHZD5tQj
	8kd6mOJZozJNv9TCJFygEP46siNAWW9umNvF7TG8pmO26O/X1ZtG7VxKOhsbVVNY2UxEig56+LR
	Py2wlzQ==
X-Google-Smtp-Source: AGHT+IH7A1gUOgKFKJnzRngtLUVtNHZRNw8i6EgWRT3b89IXq+CAXu6n1GyBnJNQ7qWDwlQy81DLJeMmjzQ=
X-Received: from pfnr5.prod.google.com ([2002:aa7:8445:0:b0:7dd:8bba:639e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2347:b0:7e8:4471:8da
 with SMTP id d2e1a72fcca58-7e8c8924252mr849439b3a.59.1764980270980; Fri, 05
 Dec 2025 16:17:50 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:48 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-13-seanjc@google.com>
Subject: [PATCH v6 12/44] perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU
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
X-CRM114-CacheID: sfid-20251205_161753_057968_38D84EEA 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Kan Liang <kan.liang@linux.intel.com>

Apply the PERF_PMU_CAP_MEDIATED_VPMU for Intel core PMU. It only indicates
that the perf side of core PMU is ready to support the mediated vPMU.
Besides the capability, the hypervisor, a.k.a. KVM, still needs to check
the PMU version and other PMU features/capabilities to decide whether to
enable support mediated vPMUs.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage changelog]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/intel/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index fe65be0b9d9c..5d53da858714 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -5319,6 +5319,8 @@ static void intel_pmu_check_hybrid_pmus(struct x86_hybrid_pmu *pmu)
 	else
 		pmu->intel_ctrl &= ~GLOBAL_CTRL_EN_PERF_METRICS;
 
+	pmu->pmu.capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	intel_pmu_check_event_constraints(pmu->event_constraints,
 					  pmu->cntr_mask64,
 					  pmu->fixed_cntr_mask64,
@@ -6936,6 +6938,9 @@ __init int intel_pmu_init(void)
 			pr_cont(" AnyThread deprecated, ");
 	}
 
+	/* The perf side of core PMU is ready to support the mediated vPMU. */
+	x86_get_pmu(smp_processor_id())->capabilities |= PERF_PMU_CAP_MEDIATED_VPMU;
+
 	/*
 	 * Many features on and after V6 require dynamic constraint,
 	 * e.g., Arch PEBS, ACR.
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
