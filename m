Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44EC87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZgcFDzPtaDGitZqlQAE1BOY15wob4RhwDCMF+Aq3GM=; b=sm9zmTN2m4TZbk
	1jW6ejZFfNIq25snd7MxL9UDXDPec4egXkzxZLl86A5TYL904DV+cbJkvZrdkUjFUEYU12tuW6GRN
	g/Voh5f1TxbLxEWecIzIxrNU3YHcOtEByZK5SqiSqM7VP4LlXytHLYAkMp8/zvhsDRxCj+uf4jYi6
	x+fH3x1dViOfOpZnVgu+x8ZRt3D9LjMm5Evoqx+aKVdOB/E4g/iFmd3v56y0QT2g7GaPPswEG/Cmd
	3zvKmv/Trm9QSfytq4j5xcwkcDqZrTxGR2PkkYMcn2d/FCT1nXj/4lO8XYBSgG7GOG0blSp9+MHQJ
	J/N4s/dxlMebYSRnszIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkJk-0000000GI6f-3f6V;
	Wed, 06 Aug 2025 20:00:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGR-0000000GG2Y-2J49
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:32 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2400499ab2fso1558685ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510250; x=1755115050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mLCoApegT2C8Zn1SJf1wYwN1uRlNuEQSrOHklByprgU=;
        b=wceTGUa0Gy2EdfxhcYBUvqQPS7MXg1E27i9Qtqi6pgHDYrwxSsEkppi2/prXMZstHD
         bmaLA1ukRylDCvA9Ay3nhj71M8+cqWga6uxQejDvR67yavayuJqdDcDr6Nz8lGiqUNok
         n1KiNifVzTkNGDoi4xU+M88XgOGTLaabf5g7sj6lG9p51Fl6cz33IIBLtAySNIfFoqWg
         XbNuFkl4ohrbCGjLz8zTu/yy87MxM4hXSETSWO7Zk2l42jAS/wOV7stwF/htKaqJmEzz
         8zNuTAoF/twJgmruaJur6Wyb3Sw6oa9xEvPfMOBrfj1wOrIJnu6YTw92WsHZG/n2mvIZ
         6t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510250; x=1755115050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLCoApegT2C8Zn1SJf1wYwN1uRlNuEQSrOHklByprgU=;
        b=Y0yaEot0kLssvlaWJqlByPrNfVgDWQQfCO7NjRa5g+Vme9jEbaSCLsw+HR8S56b1/C
         6BWji4RkXKTG74wQS1fSUXCuh0gJjlXxd1dAFxQBOIOTeLhGXskMyxCu2PWe0/waHD49
         vJNtCT/jE0m1WiHbs2fpS8cc8d9YP4oQEUrr56OZqR85W8DQBCBE7AUrS63LKCG5sniU
         0xChFKxGyiD4y6B9GzwkvhhyodHpsenEEOlEf76sPwhytYU1i5Qxmp/QjMigAdoqKqTJ
         9i2LTZ3lSguz9uUFw05Y0p2ldci8rnZUiX2Kg5nb/fwBtLGFXwwtVp5UySzme/HRkIjJ
         xqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUfmisV/p8OC7DgPDyhWRd9K3id9BkQtGJqfFZv8Im0gaYtxF+Dc4u7Vg9F6ImnGHUWrZJKsQOpkRE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzweWyHWw0a8z9qFKL29B2Nbxnr5WmPnzbDOtAnUdBYhQv4lfaI
	SCTjn5frqWKMgeCqXqvtTmd7Zuf6kDuCOaTF7nlZ6fYdG70pHPDGQXPVuqBCGwN2sm9VAVhh9ob
	uqQdOzA==
X-Google-Smtp-Source: AGHT+IGGAEizgonLm0FsoKt80WWuFMmxvZ9tdXyWc4+Z75ESLdyWsCnJtZKQl7SnHv99v5pbq5U5y7gC/zQ=
X-Received: from plq1.prod.google.com ([2002:a17:903:2f81:b0:23f:ecf6:4649])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:144b:b0:240:2970:65e7
 with SMTP id d9443c01a7336-2429eebe90emr51929475ad.25.1754510250416; Wed, 06
 Aug 2025 12:57:30 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:23 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-2-seanjc@google.com>
Subject: [PATCH v5 01/44] perf: Skip pmu_ctx based on event_type
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
X-CRM114-CacheID: sfid-20250806_125731_594524_91F4766F 
X-CRM114-Status: GOOD (  18.19  )
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

To optimize the cgroup context switch, the perf_event_pmu_context
iteration skips the PMUs without cgroup events. A bool cgroup was
introduced to indicate the case. It can work, but this way is hard to
extend for other cases, e.g. skipping non-mediated PMUs. It doesn't
make sense to keep adding bool variables.

Pass the event_type instead of the specific bool variable. Check both
the event_type and related pmu_ctx variables to decide whether skipping
a PMU.

Event flags, e.g., EVENT_CGROUP, should be cleard in the ctx->is_active.
Add EVENT_FLAGS to indicate such event flags.

No functional change.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 74 ++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 22fdf0c187cd..d4528554528d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -164,7 +164,7 @@ enum event_type_t {
 	/* see ctx_resched() for details */
 	EVENT_CPU	= 0x10,
 	EVENT_CGROUP	= 0x20,
-
+	EVENT_FLAGS	= EVENT_CGROUP,
 	/* compound helpers */
 	EVENT_ALL         = EVENT_FLEXIBLE | EVENT_PINNED,
 	EVENT_TIME_FROZEN = EVENT_TIME | EVENT_FROZEN,
@@ -778,27 +778,37 @@ do {									\
 	___p;								\
 })
 
-#define for_each_epc(_epc, _ctx, _pmu, _cgroup)				\
+static bool perf_skip_pmu_ctx(struct perf_event_pmu_context *pmu_ctx,
+			      enum event_type_t event_type)
+{
+	if ((event_type & EVENT_CGROUP) && !pmu_ctx->nr_cgroups)
+		return true;
+	return false;
+}
+
+#define for_each_epc(_epc, _ctx, _pmu, _event_type)			\
 	list_for_each_entry(_epc, &((_ctx)->pmu_ctx_list), pmu_ctx_entry) \
-		if (_cgroup && !_epc->nr_cgroups)			\
+		if (perf_skip_pmu_ctx(_epc, _event_type))		\
 			continue;					\
 		else if (_pmu && _epc->pmu != _pmu)			\
 			continue;					\
 		else
 
-static void perf_ctx_disable(struct perf_event_context *ctx, bool cgroup)
+static void perf_ctx_disable(struct perf_event_context *ctx,
+			     enum event_type_t event_type)
 {
 	struct perf_event_pmu_context *pmu_ctx;
 
-	for_each_epc(pmu_ctx, ctx, NULL, cgroup)
+	for_each_epc(pmu_ctx, ctx, NULL, event_type)
 		perf_pmu_disable(pmu_ctx->pmu);
 }
 
-static void perf_ctx_enable(struct perf_event_context *ctx, bool cgroup)
+static void perf_ctx_enable(struct perf_event_context *ctx,
+			    enum event_type_t event_type)
 {
 	struct perf_event_pmu_context *pmu_ctx;
 
-	for_each_epc(pmu_ctx, ctx, NULL, cgroup)
+	for_each_epc(pmu_ctx, ctx, NULL, event_type)
 		perf_pmu_enable(pmu_ctx->pmu);
 }
 
@@ -963,8 +973,7 @@ static void perf_cgroup_switch(struct task_struct *task)
 		return;
 
 	WARN_ON_ONCE(cpuctx->ctx.nr_cgroups == 0);
-
-	perf_ctx_disable(&cpuctx->ctx, true);
+	perf_ctx_disable(&cpuctx->ctx, EVENT_CGROUP);
 
 	ctx_sched_out(&cpuctx->ctx, NULL, EVENT_ALL|EVENT_CGROUP);
 	/*
@@ -980,7 +989,7 @@ static void perf_cgroup_switch(struct task_struct *task)
 	 */
 	ctx_sched_in(&cpuctx->ctx, NULL, EVENT_ALL|EVENT_CGROUP);
 
-	perf_ctx_enable(&cpuctx->ctx, true);
+	perf_ctx_enable(&cpuctx->ctx, EVENT_CGROUP);
 }
 
 static int perf_cgroup_ensure_storage(struct perf_event *event,
@@ -2898,11 +2907,11 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 
 	event_type &= EVENT_ALL;
 
-	for_each_epc(epc, &cpuctx->ctx, pmu, false)
+	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
 		perf_pmu_disable(epc->pmu);
 
 	if (task_ctx) {
-		for_each_epc(epc, task_ctx, pmu, false)
+		for_each_epc(epc, task_ctx, pmu, 0)
 			perf_pmu_disable(epc->pmu);
 
 		task_ctx_sched_out(task_ctx, pmu, event_type);
@@ -2922,11 +2931,11 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 
 	perf_event_sched_in(cpuctx, task_ctx, pmu);
 
-	for_each_epc(epc, &cpuctx->ctx, pmu, false)
+	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
 		perf_pmu_enable(epc->pmu);
 
 	if (task_ctx) {
-		for_each_epc(epc, task_ctx, pmu, false)
+		for_each_epc(epc, task_ctx, pmu, 0)
 			perf_pmu_enable(epc->pmu);
 	}
 }
@@ -3475,11 +3484,10 @@ static void
 ctx_sched_out(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t event_type)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+	enum event_type_t active_type = event_type & ~EVENT_FLAGS;
 	struct perf_event_pmu_context *pmu_ctx;
 	int is_active = ctx->is_active;
-	bool cgroup = event_type & EVENT_CGROUP;
 
-	event_type &= ~EVENT_CGROUP;
 
 	lockdep_assert_held(&ctx->lock);
 
@@ -3510,7 +3518,7 @@ ctx_sched_out(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t
 	 * see __load_acquire() in perf_event_time_now()
 	 */
 	barrier();
-	ctx->is_active &= ~event_type;
+	ctx->is_active &= ~active_type;
 
 	if (!(ctx->is_active & EVENT_ALL)) {
 		/*
@@ -3531,7 +3539,7 @@ ctx_sched_out(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t
 
 	is_active ^= ctx->is_active; /* changed bits */
 
-	for_each_epc(pmu_ctx, ctx, pmu, cgroup)
+	for_each_epc(pmu_ctx, ctx, pmu, event_type)
 		__pmu_ctx_sched_out(pmu_ctx, is_active);
 }
 
@@ -3687,7 +3695,7 @@ perf_event_context_sched_out(struct task_struct *task, struct task_struct *next)
 		raw_spin_lock_nested(&next_ctx->lock, SINGLE_DEPTH_NESTING);
 		if (context_equiv(ctx, next_ctx)) {
 
-			perf_ctx_disable(ctx, false);
+			perf_ctx_disable(ctx, 0);
 
 			/* PMIs are disabled; ctx->nr_no_switch_fast is stable. */
 			if (local_read(&ctx->nr_no_switch_fast) ||
@@ -3711,7 +3719,7 @@ perf_event_context_sched_out(struct task_struct *task, struct task_struct *next)
 
 			perf_ctx_sched_task_cb(ctx, task, false);
 
-			perf_ctx_enable(ctx, false);
+			perf_ctx_enable(ctx, 0);
 
 			/*
 			 * RCU_INIT_POINTER here is safe because we've not
@@ -3735,13 +3743,13 @@ perf_event_context_sched_out(struct task_struct *task, struct task_struct *next)
 
 	if (do_switch) {
 		raw_spin_lock(&ctx->lock);
-		perf_ctx_disable(ctx, false);
+		perf_ctx_disable(ctx, 0);
 
 inside_switch:
 		perf_ctx_sched_task_cb(ctx, task, false);
 		task_ctx_sched_out(ctx, NULL, EVENT_ALL);
 
-		perf_ctx_enable(ctx, false);
+		perf_ctx_enable(ctx, 0);
 		raw_spin_unlock(&ctx->lock);
 	}
 }
@@ -4050,11 +4058,9 @@ static void
 ctx_sched_in(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t event_type)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+	enum event_type_t active_type = event_type & ~EVENT_FLAGS;
 	struct perf_event_pmu_context *pmu_ctx;
 	int is_active = ctx->is_active;
-	bool cgroup = event_type & EVENT_CGROUP;
-
-	event_type &= ~EVENT_CGROUP;
 
 	lockdep_assert_held(&ctx->lock);
 
@@ -4072,7 +4078,7 @@ ctx_sched_in(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t
 		barrier();
 	}
 
-	ctx->is_active |= (event_type | EVENT_TIME);
+	ctx->is_active |= active_type | EVENT_TIME;
 	if (ctx->task) {
 		if (!(is_active & EVENT_ALL))
 			cpuctx->task_ctx = ctx;
@@ -4087,13 +4093,13 @@ ctx_sched_in(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t
 	 * in order to give them the best chance of going on.
 	 */
 	if (is_active & EVENT_PINNED) {
-		for_each_epc(pmu_ctx, ctx, pmu, cgroup)
+		for_each_epc(pmu_ctx, ctx, pmu, event_type)
 			__pmu_ctx_sched_in(pmu_ctx, EVENT_PINNED);
 	}
 
 	/* Then walk through the lower prio flexible groups */
 	if (is_active & EVENT_FLEXIBLE) {
-		for_each_epc(pmu_ctx, ctx, pmu, cgroup)
+		for_each_epc(pmu_ctx, ctx, pmu, event_type)
 			__pmu_ctx_sched_in(pmu_ctx, EVENT_FLEXIBLE);
 	}
 }
@@ -4110,11 +4116,11 @@ static void perf_event_context_sched_in(struct task_struct *task)
 
 	if (cpuctx->task_ctx == ctx) {
 		perf_ctx_lock(cpuctx, ctx);
-		perf_ctx_disable(ctx, false);
+		perf_ctx_disable(ctx, 0);
 
 		perf_ctx_sched_task_cb(ctx, task, true);
 
-		perf_ctx_enable(ctx, false);
+		perf_ctx_enable(ctx, 0);
 		perf_ctx_unlock(cpuctx, ctx);
 		goto rcu_unlock;
 	}
@@ -4127,7 +4133,7 @@ static void perf_event_context_sched_in(struct task_struct *task)
 	if (!ctx->nr_events)
 		goto unlock;
 
-	perf_ctx_disable(ctx, false);
+	perf_ctx_disable(ctx, 0);
 	/*
 	 * We want to keep the following priority order:
 	 * cpu pinned (that don't need to move), task pinned,
@@ -4137,7 +4143,7 @@ static void perf_event_context_sched_in(struct task_struct *task)
 	 * events, no need to flip the cpuctx's events around.
 	 */
 	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree)) {
-		perf_ctx_disable(&cpuctx->ctx, false);
+		perf_ctx_disable(&cpuctx->ctx, 0);
 		ctx_sched_out(&cpuctx->ctx, NULL, EVENT_FLEXIBLE);
 	}
 
@@ -4146,9 +4152,9 @@ static void perf_event_context_sched_in(struct task_struct *task)
 	perf_ctx_sched_task_cb(cpuctx->task_ctx, task, true);
 
 	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree))
-		perf_ctx_enable(&cpuctx->ctx, false);
+		perf_ctx_enable(&cpuctx->ctx, 0);
 
-	perf_ctx_enable(ctx, false);
+	perf_ctx_enable(ctx, 0);
 
 unlock:
 	perf_ctx_unlock(cpuctx, ctx);
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
