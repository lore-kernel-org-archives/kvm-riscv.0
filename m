Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26151C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shrLMfOZB5YTal5ZHGZHCBy/yaYMf0xdfi/0mtQ37Qk=; b=fmxE/QY/kqc+IG
	SpX8IC2Qun2SlQOdoKLf6+gwxjuwOSIy28gBe5w4S560KVqNIPWs/xS/OkEnB9LmjN5AMs2xxSkrd
	OqseunaXSwyzgj8cc2GHi0YUH/oMSUCzOe8KUqfKuJUjAF+1DBrCBHgI1JWeqRGJDJm8U35bK1izi
	uy+po5tVOlvCijCfYRC+GfOpzAwxj00cCaz61VQEVmHOqkcOAwB99TRa3p0d65lknzCQpjg1yOC/t
	lwZKo8BDAN1nkBPpjNoNqWuzqSXLTfs55HGt+FiJAaBQPN3goaqa+q+rma/aQa/WVbJxRMQ/oDTZE
	hAg8JB9T3v6KknVDhT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkMH-0000000GIvq-3k9F;
	Wed, 06 Aug 2025 20:03:33 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGT-0000000GG47-1O63
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:34 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76bef13c254so290732b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510252; x=1755115052; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3IAofGMjgJOHx6SdMcFjG4jFgSxJevKv5cJ/ErNkHsk=;
        b=0kBDNjO2l/MhjLai8n+OgvbjIryHlv/Fje5XIBx2zNCZRnsvjxo2HUHYfzyV4yL+Dx
         TcqxVLapweuHdq9PZPD9EqvoXae3l9FjGqA5aTwNWFUgLmMVmvmC/H9MTW89Hja8KsW2
         I5hs3FdIz0Hbt4y0R/jvj8D5+0bZb6YRK6iaiRGzD05fU8gWAo7+0Eh0cmjRjDynxqwP
         QFaKtyt0vf3mO8dBY0hgCFjw5XY6nqSXVcMHEUx9jcYYPY6+hE3gvQDHpjjobiwbqXYy
         AUK/cJtTN0GtZkdbdJmTN4+RDDUez1C3UtxnsnuDcJemN5q5U/QsrL5m55hlHI41v8kN
         MYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510252; x=1755115052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IAofGMjgJOHx6SdMcFjG4jFgSxJevKv5cJ/ErNkHsk=;
        b=RxIOvvxc4LmCK683qM9KOD2uW+izv0e/K84fSp+udEl+hAu2FaMJbiQeJo3+QOBbiL
         jF9rWx/v2hC3Hn2YrVXxUzEPEUG8Vd+BUsc01mHajZXcerJhIob25Ew27RSsIpkNh8ds
         cssfg6CLwSbNb/66BWdY5QHQwAwxKD7iXK5x4NxPt/blk6fkbREHJhZd+jgLyrQ1ZY1s
         OOBqyekshoXFij7/YFfUZ9pqfRlJr0Nle+Um1MEMGGGn6sC2/nSgy1mr5bI7vE6o+hum
         v2sDTNNlHmKzQOzrpXPyZx387ziPQv6CC2Mi/dyDdWLBTodV/L6/VIF5RegG2STGvzpz
         UOkg==
X-Forwarded-Encrypted: i=1; AJvYcCXsgorNcjosWII9XgWOsKxXGEeAdf1IV5NWkk1YnkpncVZgaPYYEzUdF21GM9a3H/WVnHGvTYHiUCs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSckRkicQSmM9ctO0+POF7NHpA+52/H+q2MV73Ob9utoTsd2Mx
	6bVU2yI10+anLLCWKNNbE4J6FNAnQM2bf8lV9+dukgQNlK9gyJDKqVwh3GEpSmG1D7aHjkb+6dw
	KYHsiFg==
X-Google-Smtp-Source: AGHT+IGg8m1AYQ1T/bkneerdDiI2IWHPXHDhUcioTumR7faJkpYOSLNXQVSuuMxt1I5dkPrSi8WAHfNQ8i8=
X-Received: from pgc3.prod.google.com ([2002:a05:6a02:2f83:b0:b42:2da2:8848])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a103:b0:23f:f712:4103
 with SMTP id adf61e73a8af0-24041364f38mr1167741637.18.1754510252085; Wed, 06
 Aug 2025 12:57:32 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:24 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-3-seanjc@google.com>
Subject: [PATCH v5 02/44] perf: Add generic exclude_guest support
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
X-CRM114-CacheID: sfid-20250806_125733_370180_A214C254 
X-CRM114-Status: GOOD (  10.41  )
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

Only KVM knows the exact time when a guest is entering/exiting. Expose
two interfaces to KVM to switch the ownership of the PMU resources.

All the pinned events must be scheduled in first. Extend the
perf_event_sched_in() helper to support extra flag, e.g., EVENT_GUEST.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index d4528554528d..3a98e11d8efc 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2866,14 +2866,15 @@ static void task_ctx_sched_out(struct perf_event_context *ctx,
 
 static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
 				struct perf_event_context *ctx,
-				struct pmu *pmu)
+				struct pmu *pmu,
+				enum event_type_t event_type)
 {
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_PINNED);
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_PINNED | event_type);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE | event_type);
 }
 
 /*
@@ -2929,7 +2930,7 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
-	perf_event_sched_in(cpuctx, task_ctx, pmu);
+	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
 		perf_pmu_enable(epc->pmu);
@@ -4147,7 +4148,7 @@ static void perf_event_context_sched_in(struct task_struct *task)
 		ctx_sched_out(&cpuctx->ctx, NULL, EVENT_FLEXIBLE);
 	}
 
-	perf_event_sched_in(cpuctx, ctx, NULL);
+	perf_event_sched_in(cpuctx, ctx, NULL, 0);
 
 	perf_ctx_sched_task_cb(cpuctx->task_ctx, task, true);
 
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
