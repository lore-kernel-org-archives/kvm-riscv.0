Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B0C87FCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xr4f8PAlOBzJEETsfsraZYsyfSXrMLQEPGF9uktE6eg=; b=nfRmh6IH62AZDe
	ocuS5ZNvZGgqHztUBwW0FpGpgsRJVFErokyCb2VF0GFS6DKgWLv1HrMdYlT6FIvYxsWatHZLKmkK0
	9G77pjcwP0OBDuWYY73t9t0kgEFmhoVUXvRcFiOChZx/QRtB/R/vMzKWiksR1QJh3/EqBkqnFmB8A
	vzWoodYxQ6LsfOgc5boqt5utRtd14ptgQmSM4V5OTAVVtEkuM997kZPHZ7N6MvFN/GysVh1NJDJrz
	Y81mEsdg9dA3QeCqNGoeToyQ1wSaIF8bMpKDw/k5vSidbZzj61KNrkyx1L8YyFme8yEaRqtqs41OJ
	637kjYwpiQzvGaa980dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkWL-0000000GMDu-1FZb;
	Wed, 06 Aug 2025 20:13:57 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGY-0000000GG9L-2sTi
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31ed2a7d475so260460a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510258; x=1755115058; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RSqs7LjEbfI/o+XH+tbZdSeN9oFJhrETU4UrZ2e2+po=;
        b=zKbNLdMhuO/KzP3s0+lq2ciGTC/eR6vLWaEjl5uZv+Gjcz/bTcJGT//sBEfpyBQQLY
         8Zju4g4mi5Myp0ziE0r6H3SOt2wDqcSwJRcZPKJeTJIMnKRzkirc1U7hdGQBjMgFv8Bp
         JDI8LhThekQ7/+Np7QciyYN9jH6auJBj7w5rkebYIQpKwuTARI9x7njuX96dEgznFRqQ
         SnB6QlKiufnA87Rj2uPQePv2GuC1vZbZjUIoZwaC9SdemgWtISmEkBI2COdspC5UlSk4
         tkHllqo12yx8PFKTnHKhrqS8sPtMpjZ3+/KaqB6q7BX0Da6PRZutyGT+l5S0Cu5q8QyB
         x4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510258; x=1755115058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSqs7LjEbfI/o+XH+tbZdSeN9oFJhrETU4UrZ2e2+po=;
        b=AjWuv+5yY5h3HLPsIZr2qGcluHi9xOrGimRf11Vi2x7uKKeN87+FGe5/9FsPeL9geU
         3TUAxlROAtIkpxlPnQ+lEnQi5FGz2DaDcLpaAGuoWA7QJ1ci2y5qXXpjLaKUQRi/3QTA
         F3eBvJYNdNdcAUwhus9KdAB4Wsj4inD1T3JmOQ7w8XMaNeGRXDZcEqYuDihPZCDzz2Bp
         8iYjfIuC/5me91nQhg87txuj7YDMQU6fgY2F3fQUtZGfyJe/TojDqPd+qHBwEMqYtQ39
         39+11t7BTViH5vR0qNZG/Et0FeVKXNfQFoaaY15kLfRP4USPBxdrw05ql+ZS4fvida66
         8xkw==
X-Forwarded-Encrypted: i=1; AJvYcCW77WoJ/5dC/zfoBkndHwt9G1uLVKjPrtmQdipmcL2aSYzhVYCCOey5XW3hprd19NVdYa6NW9EMWfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjZFj0v/WZXA1XEEupkp591IO3UlW+oWsH2S6qIvoOozM+9iG5
	qN4i8mHQ+/Yflw9aSRut4APx3zQI8mfHUSipgLckY7nClqtSdvpuYNfJrmC4FSCf2EQbv3Xb2fF
	Kysex+A==
X-Google-Smtp-Source: AGHT+IHRaSY+k4TAZbl8ZMQSCfgVDMYJiwgIqFCqRbteQRg9trtxOd4uQTojLJyQdeJPXNfHx0P6bSsh+7Q=
X-Received: from pjqq16.prod.google.com ([2002:a17:90b:5850:b0:31c:2fe4:33bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c10:b0:311:ef19:824d
 with SMTP id 98e67ed59e1d1-32166df97d9mr4595576a91.2.1754510257253; Wed, 06
 Aug 2025 12:57:37 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:27 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-6-seanjc@google.com>
Subject: [PATCH v5 05/44] perf: Clean up perf ctx time
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
X-CRM114-CacheID: sfid-20250806_125738_738660_161BCD54 
X-CRM114-Status: GOOD (  19.86  )
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

The current perf tracks two timestamps for the normal ctx and cgroup.
The same type of variables and similar codes are used to track the
timestamps. In the following patch, the third timestamp to track the
guest time will be introduced.
To avoid the code duplication, add a new struct perf_time_ctx and factor
out a generic function update_perf_time_ctx().

No functional change.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 13 +++----
 kernel/events/core.c       | 70 +++++++++++++++++---------------------
 2 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 63097beb5f02..186a026fb7fb 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -999,6 +999,11 @@ struct perf_event_groups {
 	u64				index;
 };
 
+struct perf_time_ctx {
+	u64		time;
+	u64		stamp;
+	u64		offset;
+};
 
 /**
  * struct perf_event_context - event context structure
@@ -1037,9 +1042,7 @@ struct perf_event_context {
 	/*
 	 * Context clock, runs when context enabled.
 	 */
-	u64				time;
-	u64				timestamp;
-	u64				timeoffset;
+	struct perf_time_ctx		time;
 
 	/*
 	 * These fields let us detect when two contexts have both
@@ -1172,9 +1175,7 @@ struct bpf_perf_event_data_kern {
  * This is a per-cpu dynamically allocated data structure.
  */
 struct perf_cgroup_info {
-	u64				time;
-	u64				timestamp;
-	u64				timeoffset;
+	struct perf_time_ctx		time;
 	int				active;
 };
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index bf0347231bd9..2cf988bdabf0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -815,6 +815,24 @@ static void perf_ctx_enable(struct perf_event_context *ctx,
 static void ctx_sched_out(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t event_type);
 static void ctx_sched_in(struct perf_event_context *ctx, struct pmu *pmu, enum event_type_t event_type);
 
+static inline void update_perf_time_ctx(struct perf_time_ctx *time, u64 now, bool adv)
+{
+	if (adv)
+		time->time += now - time->stamp;
+	time->stamp = now;
+
+	/*
+	 * The above: time' = time + (now - timestamp), can be re-arranged
+	 * into: time` = now + (time - timestamp), which gives a single value
+	 * offset to compute future time without locks on.
+	 *
+	 * See perf_event_time_now(), which can be used from NMI context where
+	 * it's (obviously) not possible to acquire ctx->lock in order to read
+	 * both the above values in a consistent manner.
+	 */
+	WRITE_ONCE(time->offset, time->time - time->stamp);
+}
+
 #ifdef CONFIG_CGROUP_PERF
 
 static inline bool
@@ -856,7 +874,7 @@ static inline u64 perf_cgroup_event_time(struct perf_event *event)
 	struct perf_cgroup_info *t;
 
 	t = per_cpu_ptr(event->cgrp->info, event->cpu);
-	return t->time;
+	return t->time.time;
 }
 
 static inline u64 perf_cgroup_event_time_now(struct perf_event *event, u64 now)
@@ -865,22 +883,11 @@ static inline u64 perf_cgroup_event_time_now(struct perf_event *event, u64 now)
 
 	t = per_cpu_ptr(event->cgrp->info, event->cpu);
 	if (!__load_acquire(&t->active))
-		return t->time;
-	now += READ_ONCE(t->timeoffset);
+		return t->time.time;
+	now += READ_ONCE(t->time.offset);
 	return now;
 }
 
-static inline void __update_cgrp_time(struct perf_cgroup_info *info, u64 now, bool adv)
-{
-	if (adv)
-		info->time += now - info->timestamp;
-	info->timestamp = now;
-	/*
-	 * see update_context_time()
-	 */
-	WRITE_ONCE(info->timeoffset, info->time - info->timestamp);
-}
-
 static inline void update_cgrp_time_from_cpuctx(struct perf_cpu_context *cpuctx, bool final)
 {
 	struct perf_cgroup *cgrp = cpuctx->cgrp;
@@ -894,7 +901,7 @@ static inline void update_cgrp_time_from_cpuctx(struct perf_cpu_context *cpuctx,
 			cgrp = container_of(css, struct perf_cgroup, css);
 			info = this_cpu_ptr(cgrp->info);
 
-			__update_cgrp_time(info, now, true);
+			update_perf_time_ctx(&info->time, now, true);
 			if (final)
 				__store_release(&info->active, 0);
 		}
@@ -917,7 +924,7 @@ static inline void update_cgrp_time_from_event(struct perf_event *event)
 	 * Do not update time when cgroup is not active
 	 */
 	if (info->active)
-		__update_cgrp_time(info, perf_clock(), true);
+		update_perf_time_ctx(&info->time, perf_clock(), true);
 }
 
 static inline void
@@ -941,7 +948,7 @@ perf_cgroup_set_timestamp(struct perf_cpu_context *cpuctx)
 	for (css = &cgrp->css; css; css = css->parent) {
 		cgrp = container_of(css, struct perf_cgroup, css);
 		info = this_cpu_ptr(cgrp->info);
-		__update_cgrp_time(info, ctx->timestamp, false);
+		update_perf_time_ctx(&info->time, ctx->time.stamp, false);
 		__store_release(&info->active, 1);
 	}
 }
@@ -1562,20 +1569,7 @@ static void __update_context_time(struct perf_event_context *ctx, bool adv)
 
 	lockdep_assert_held(&ctx->lock);
 
-	if (adv)
-		ctx->time += now - ctx->timestamp;
-	ctx->timestamp = now;
-
-	/*
-	 * The above: time' = time + (now - timestamp), can be re-arranged
-	 * into: time` = now + (time - timestamp), which gives a single value
-	 * offset to compute future time without locks on.
-	 *
-	 * See perf_event_time_now(), which can be used from NMI context where
-	 * it's (obviously) not possible to acquire ctx->lock in order to read
-	 * both the above values in a consistent manner.
-	 */
-	WRITE_ONCE(ctx->timeoffset, ctx->time - ctx->timestamp);
+	update_perf_time_ctx(&ctx->time, now, adv);
 }
 
 static void update_context_time(struct perf_event_context *ctx)
@@ -1593,7 +1587,7 @@ static u64 perf_event_time(struct perf_event *event)
 	if (is_cgroup_event(event))
 		return perf_cgroup_event_time(event);
 
-	return ctx->time;
+	return ctx->time.time;
 }
 
 static u64 perf_event_time_now(struct perf_event *event, u64 now)
@@ -1607,9 +1601,9 @@ static u64 perf_event_time_now(struct perf_event *event, u64 now)
 		return perf_cgroup_event_time_now(event, now);
 
 	if (!(__load_acquire(&ctx->is_active) & EVENT_TIME))
-		return ctx->time;
+		return ctx->time.time;
 
-	now += READ_ONCE(ctx->timeoffset);
+	now += READ_ONCE(ctx->time.offset);
 	return now;
 }
 
@@ -11991,7 +11985,7 @@ static void task_clock_event_update(struct perf_event *event, u64 now)
 
 static void task_clock_event_start(struct perf_event *event, int flags)
 {
-	local64_set(&event->hw.prev_count, event->ctx->time);
+	local64_set(&event->hw.prev_count, event->ctx->time.time);
 	perf_swevent_start_hrtimer(event);
 }
 
@@ -11999,7 +11993,7 @@ static void task_clock_event_stop(struct perf_event *event, int flags)
 {
 	perf_swevent_cancel_hrtimer(event);
 	if (flags & PERF_EF_UPDATE)
-		task_clock_event_update(event, event->ctx->time);
+		task_clock_event_update(event, event->ctx->time.time);
 }
 
 static int task_clock_event_add(struct perf_event *event, int flags)
@@ -12019,8 +12013,8 @@ static void task_clock_event_del(struct perf_event *event, int flags)
 static void task_clock_event_read(struct perf_event *event)
 {
 	u64 now = perf_clock();
-	u64 delta = now - event->ctx->timestamp;
-	u64 time = event->ctx->time + delta;
+	u64 delta = now - event->ctx->time.stamp;
+	u64 time = event->ctx->time.time + delta;
 
 	task_clock_event_update(event, time);
 }
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
