Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E2D111A8
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 00:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVFWjCVLImcd/kKf55ho4SIrryQt6KQu5I+q70jtTzM=; b=LJBfSGHEOHZxuJ
	D4gs8cO/hEWyKEZxc0VpHjqkhKLgSMpjWAawPGmy2M559fk+q6/KkY0ndej0ve4/IaStNWjIh0rMr
	5NLb+xmvTPrwVq7rH1Rg0SQjzpWJ2e6x93/7uzm9JApInnpxC797Azjul+lUWQwGw3i7jVAaBbqFu
	TA8hwQ2aOsdnMXpxwdBghcOEgPtIO5WQiQIVuQ9uaZQlShnZ8bheABq4HWn2rdC4Z9m5BTmdBDKN1
	sz6DBqf4aG1xKxIiy6HYFwRPI0MC3bK+DXKYGkRjPbqGrVKrulGiW9Z6nQl++O62ZoY3V8FlUDcL+
	Stbe+tu+2cDUf2x8c+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProu-00000002hox-0NuZ;
	Mon, 01 Dec 2025 00:31:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPros-00000002hoI-0KcR;
	Mon, 01 Dec 2025 00:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48EFD60135;
	Mon,  1 Dec 2025 00:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B333C16AAE;
	Mon,  1 Dec 2025 00:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764549069;
	bh=eFfeaKnYfm7T1fmmBnN98nZcN0oQn69S6tmyVQbI8DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FcmqzLxETUROMfc8jbqXaPM0gH9POPPVrtpiBUGfStfpl0nbP11BICLIghFUZD49G
	 TZb6wvBXWXjiSLwNWAJq64QtW00oo7MpqxZ6hgwBO8eqiMmTql0lwz3zDN/8CSeOIj
	 TwP1OcUqgoZqA9mchRBFxO36Npm/SBxSII+rYVkBHWjG/7IFbTGChq2RpxTF5EFru3
	 MUJtcDnw8QaxRqgLNuTy4RLzVFoXZ076T/e72ggrN4YROu9akJ6wTVu0fyxw7sOu6P
	 qvVj8Mb7yO7QNn3WqwT0Su69XBcXeisi3jw4TkxrQQ4lSqyXcKMMtQ/wQ4VcQKGBWN
	 nKSt2lmxh05Mw==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	leobras@redhat.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	corbet@lwn.net
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH V3 3/4] RISC-V: paravirt: pvqspinlock: Add trace point for pv_kick/wait
Date: Sun, 30 Nov 2025 19:30:40 -0500
Message-Id: <20251201003041.695081-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201003041.695081-1-guoren@kernel.org>
References: <20251201003041.695081-1-guoren@kernel.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Add trace point for pv_kick&wait, here is the output:

ls /sys/kernel/debug/tracing/events/paravirt/
 enable   filter   pv_kick  pv_wait

cat /sys/kernel/debug/tracing/trace
 entries-in-buffer/entries-written: 33927/33927   #P:12

                                _-----=> irqs-off/BH-disabled
                               / _----=> need-resched
                              | / _---=> hardirq/softirq
                              || / _--=> preempt-depth
                              ||| / _-=> migrate-disable
                              |||| /     delay
           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
              | |         |   |||||     |         |
             sh-100     [001] d..2.    28.312294: pv_wait: cpu 1 out of wfi
         <idle>-0       [000] d.h4.    28.322030: pv_kick: cpu 0 kick target cpu 1
             sh-100     [001] d..2.    30.982631: pv_wait: cpu 1 out of wfi
         <idle>-0       [000] d.h4.    30.993289: pv_kick: cpu 0 kick target cpu 1
             sh-100     [002] d..2.    44.987573: pv_wait: cpu 2 out of wfi
         <idle>-0       [000] d.h4.    44.989000: pv_kick: cpu 0 kick target cpu 2
         <idle>-0       [003] d.s3.    51.593978: pv_kick: cpu 3 kick target cpu 4
      rcu_sched-15      [004] d..2.    51.595192: pv_wait: cpu 4 out of wfi
lock_torture_wr-115     [004] ...2.    52.656482: pv_kick: cpu 4 kick target cpu 2
lock_torture_wr-113     [002] d..2.    52.659146: pv_wait: cpu 2 out of wfi
lock_torture_wr-114     [008] d..2.    52.659507: pv_wait: cpu 8 out of wfi
lock_torture_wr-114     [008] d..2.    52.663503: pv_wait: cpu 8 out of wfi
lock_torture_wr-113     [002] ...2.    52.666128: pv_kick: cpu 2 kick target cpu 8
lock_torture_wr-114     [008] d..2.    52.667261: pv_wait: cpu 8 out of wfi
lock_torture_wr-114     [009] .n.2.    53.141515: pv_kick: cpu 9 kick target cpu 11
lock_torture_wr-113     [002] d..2.    53.143339: pv_wait: cpu 2 out of wfi
lock_torture_wr-116     [007] d..2.    53.143412: pv_wait: cpu 7 out of wfi
lock_torture_wr-118     [000] d..2.    53.143457: pv_wait: cpu 0 out of wfi
lock_torture_wr-115     [008] d..2.    53.143481: pv_wait: cpu 8 out of wfi
lock_torture_wr-117     [011] d..2.    53.143522: pv_wait: cpu 11 out of wfi
lock_torture_wr-117     [011] ...2.    53.143987: pv_kick: cpu 11 kick target cpu 8
lock_torture_wr-115     [008] ...2.    53.144269: pv_kick: cpu 8 kick target cpu 7

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kernel/qspinlock_paravirt.c        |  7 +++
 .../kernel/trace_events_filter_paravirt.h     | 60 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/riscv/kernel/trace_events_filter_paravirt.h

diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 299dddaa14b8..cae991139abe 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -9,8 +9,13 @@
 #include <asm/qspinlock_paravirt.h>
 #include <asm/sbi.h>
 
+#define CREATE_TRACE_POINTS
+#include "trace_events_filter_paravirt.h"
+
 void pv_kick(int cpu)
 {
+	trace_pv_kick(smp_processor_id(), cpu);
+
 	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
 		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
 	return;
@@ -28,6 +33,8 @@ void pv_wait(u8 *ptr, u8 val)
 		goto out;
 
 	wait_for_interrupt();
+
+	trace_pv_wait(smp_processor_id());
 out:
 	local_irq_restore(flags);
 }
diff --git a/arch/riscv/kernel/trace_events_filter_paravirt.h b/arch/riscv/kernel/trace_events_filter_paravirt.h
new file mode 100644
index 000000000000..db5e702a1f12
--- /dev/null
+++ b/arch/riscv/kernel/trace_events_filter_paravirt.h
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c), 2025 Alibaba Damo Academy
+ * Authors:
+ *	Guo Ren <guoren@kernel.org>
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM paravirt
+
+#if !defined(_TRACE_PARAVIRT_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_PARAVIRT_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(pv_kick,
+	TP_PROTO(int cpu, int target),
+	TP_ARGS(cpu, target),
+
+	TP_STRUCT__entry(
+		__field(int, cpu)
+		__field(int, target)
+	),
+
+	TP_fast_assign(
+		__entry->cpu = cpu;
+		__entry->target = target;
+	),
+
+	TP_printk("cpu %d pv_kick target cpu %d",
+		__entry->cpu,
+		__entry->target
+	)
+);
+
+TRACE_EVENT(pv_wait,
+	TP_PROTO(int cpu),
+	TP_ARGS(cpu),
+
+	TP_STRUCT__entry(
+		__field(int, cpu)
+	),
+
+	TP_fast_assign(
+		__entry->cpu = cpu;
+	),
+
+	TP_printk("cpu %d out of wfi",
+		__entry->cpu
+	)
+);
+
+#endif /* _TRACE_PARAVIRT_H || TRACE_HEADER_MULTI_READ */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../../arch/riscv/kernel/
+#define TRACE_INCLUDE_FILE trace_events_filter_paravirt
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
