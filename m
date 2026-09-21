Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC9DC982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxNia5toh/yiUUdJHw9ITS0zAlJ6KxJNS6XY1vwpky4=; b=0tluHMAUyOXuqd
	owNY4TmSezFvUblJEerj+yBzZe+hgTzTw8dfWvqZiD5WOSNW1AW1g2x2LypKqqpsN2JKk0cXtqiC/
	9dduDUKzLBDRUw/N8QeaM6TTen0vzbvp0jh60fG84qY5qJJuq4urcVpBVCth4SVkuRsZBzjXnIuDN
	kaiD9MCSlFbO3Ot8N6L68ucbC6iMGVYPvodQL/VV7RHaMOlPv+e9rltdiW3GBuuvjrMnMit99T9fG
	84sN8nvMAqPtZzIi4vpGUH52owl3pIx15jPp6o6U2cYdp7kG0iSdY+ikV2tY3z8W2ohh56bzEb/C6
	6futJqNdPObwP3y86ZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7T-000000023c3-46ob;
	Mon, 21 Sep 2026 12:27:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7S-000000023bN-3btu;
	Mon, 21 Sep 2026 12:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9499E406B8;
	Mon, 21 Sep 2026 12:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB6B1F00893;
	Mon, 21 Sep 2026 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993658;
	bh=npVan5VYT3AMl8n3RsICnE+OLDep7BXyveNoQgrKcOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A1Cb4P8ThKMPt2giCW4nM7EaQmmLM33Ov/QZQmZa2tIcFUjS8Q7l9LaKF6xwPTAyb
	 xFHga9ra0KEbMXmpWx+sVZqNKmutZBveKjqGjRhkIV+S84Lq0mgyEP5yW4NSG8SD4/
	 dDVWFR94zsYs8mHpKyZhXlOe+k0xNlYSLuDK5jugzVHc1fNr0RV3T9XY4ZY0Z/zzLF
	 iA4zjbpCooMCQdKYj63+sKREzy75dn7cP8XMPKfQ2b0hNbrxuULvO0P91pV25XhEDs
	 fT7ENzTXbDfCjyN3N5mDTPvh5OO3H0jVLh8eQxFFwbi7r6TS4fDAhmHiDtJdkzUbso
	 8PUTqwSZAhPCg==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Mon, 21 Sep 2026 12:27:03 +0000
Subject: [PATCH RFC v4 3/4] RISC-V: paravirt: pvqspinlock: Add trace point
 for pv_kick/wait
MIME-Version: 1.0
Message-Id: <20260921-pvqspinlock-v4-3-409a22aed6ef@kernel.org>
References: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
In-Reply-To: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
 CHEN Jiankang <yubin.cjk@alibaba-inc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

Add tracepoints for pv_kick and pv_wait to observe the paravirt
qspinlock behavior:

  # cd /sys/kernel/debug/tracing
  # echo 1 > events/paravirt/enable
  # cat trace
  TASK-PID   CPU#  |||||  TIMESTAMP  FUNCTION
     | |       |   |||||     |         |
    sh-100   [001] d..2.  28.312294: pv_wait: cpu 1 out of wfi
  <idle>-0   [000] d.h4.  28.322030: pv_kick: cpu 0 kick target cpu 1

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/kernel/qspinlock_paravirt.c           |  7 +++
 arch/riscv/kernel/trace_events_filter_paravirt.h | 58 ++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index c534447437fe..04b13994e971 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -7,8 +7,13 @@
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
 }
@@ -25,6 +30,8 @@ void pv_wait(u8 *ptr, u8 val)
 		goto out;
 
 	wait_for_interrupt();
+
+	trace_pv_wait(smp_processor_id());
 out:
 	local_irq_restore(flags);
 }
diff --git a/arch/riscv/kernel/trace_events_filter_paravirt.h b/arch/riscv/kernel/trace_events_filter_paravirt.h
new file mode 100644
index 000000000000..8d57efda2c17
--- /dev/null
+++ b/arch/riscv/kernel/trace_events_filter_paravirt.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 GUO Ren (XuanTie) <guoren@kernel.org>
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
