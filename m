Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5BFC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Meb/oUHKFL7/CDVcsCPohQMTYxpsdUauB2rz+2WTY2M=; b=D4Hw+4bn6h8ujl
	zN1uqux+wD0/VW3pR0rQbuPA5N1o2w07sUxFbn3Y35s0BQRhniyTDt+HGq/aJhxlUnmtqHDBxhjA+
	Pyb1t976xmms6q8DL6Yq2AaZclpeRTYXoQ9W5AT9UZx65Z2gy6uFzw329T/v9/Rpa1nQVFqtyL4h3
	GzVh7dIgPsr0nFaEkELe9aOw0iqCne3F3lVvyJWGIDDZrXiM8GYGxyNiuLn8MLd7s1ZwEpBySTrYL
	ohkQRHX4n6FjA3SwkvPg5Qyo1CiKi7xK2LXLDPtaAmz45Y7/QPITK33PW8QlTZZ9+grguxyXMy85A
	wcA/dKBwtsbAG478s0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Pt-0000000FsBf-2SJg;
	Fri, 13 Jun 2025 09:09:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzN1-0000000Fig9-2iHk;
	Fri, 13 Jun 2025 08:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1atCFaF+jXxfv3Wrhd4WEd8iT/QBuFuMb3fzUs6qZHo=; b=IE3CweJTvWZE46N/oi9aqO73Uj
	v0djj1GXdtmIEerRUlAxsbK762GQVrFYP5+7pLM/2AB0hODwWbJvUFzdzLf4o9wfidrGRBtbN+WuK
	5je3mHgIn23lKVEkmJPGH+rHFbA7GQqGmDT9B+7BGn/ylipLpcCO6yx0lDDVYastR+22w4dFCUqjJ
	vZA4VdqGCEwPni55WxuSsVKFGB/csnso3iYKCc8zKCMRUQBdF1yZQK+Q3vAzKSru3Lw6kAPX8oV3l
	cFmQgBfGsTEvxAcB60rdRdvQ2rzhpPNo5TVllnaPorFN+l76Uvjct1usWtn0aFcuRM2+ZUleATkNv
	irXnXJ/g==;
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzMy-00000002uqJ-0JST;
	Fri, 13 Jun 2025 08:02:39 +0000
Received: from zq-Legion-Y7000.smartont.net (unknown [180.110.114.155])
	by APP-05 (Coremail) with SMTP id zQCowABHzAoM20tolHFJBg--.51063S2;
	Fri, 13 Jun 2025 16:02:20 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] RISC-V: perf/kvm: Add reporting of interrupt events
Date: Fri, 13 Jun 2025 15:53:38 +0800
Message-Id: <9693132df4d0f857b8be3a75750c36b40213fcc0.1726211632.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHzAoM20tolHFJBg--.51063S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWrtF4xJrykCF1kZFyUGFg_yoWxCr48pw
	43CFZ2kr4FgrZrKa48GFnagF4xGFs3Xr1UGw1jgw409F4UAw1kJ3W7Wryrta4DWrZ5JrW8
	Cr1DCrWY9w1Yqr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1aFAJUUUUU==
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBwoMBmhLsDui7AAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_090236_737898_D323D779 
X-CRM114-Status: GOOD (  11.39  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

For `perf kvm stat` on the RISC-V, in order to avoid the
occurrence of `UNKNOWN` event names, interrupts should be
reported in addition to exceptions.

testing without patch:
---
Event name                    Samples  Sample%       Time(ns)
---------------------------  --------  --------  ------------
STORE_GUEST_PAGE_FAULT   	  1496461   53.00%    889612544
UNKNOWN                        887514   31.00%    272857968
LOAD_GUEST_PAGE_FAULT          305164   10.00%    189186331
VIRTUAL_INST_FAULT              70625    2.00%    134114260
SUPERVISOR_SYSCALL              32014    1.00%     58577110
INST_GUEST_PAGE_FAULT               1    0.00%         2545

testing with patch:
---
Event name                    Samples  Sample%       Time(ns)
---------------------------  --------  --------  ------------
IRQ_S_TIMER                   211271    58.00%  738298680600
EXC_STORE_GUEST_PAGE_FAULT    111279    30.00%  130725914800
EXC_LOAD_GUEST_PAGE_FAULT      22039     6.00%   25441480600
EXC_VIRTUAL_INST_FAULT          8913     2.00%   21015381600
IRQ_VS_EXT                      4748     1.00%   10155464300
IRQ_S_EXT                       2802     0.00%   13288775800
IRQ_S_SOFT                      1998     0.00%    4254129300

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 tools/perf/arch/riscv/util/kvm-stat.c         |  6 +-
 .../arch/riscv/util/riscv_exception_types.h   | 35 ------------
 tools/perf/arch/riscv/util/riscv_trap_types.h | 57 +++++++++++++++++++
 3 files changed, 60 insertions(+), 38 deletions(-)
 delete mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
 create mode 100644 tools/perf/arch/riscv/util/riscv_trap_types.h

diff --git a/tools/perf/arch/riscv/util/kvm-stat.c b/tools/perf/arch/riscv/util/kvm-stat.c
index 491aef449d1a..3ea7acb5e159 100644
--- a/tools/perf/arch/riscv/util/kvm-stat.c
+++ b/tools/perf/arch/riscv/util/kvm-stat.c
@@ -9,10 +9,10 @@
 #include <memory.h>
 #include "../../../util/evsel.h"
 #include "../../../util/kvm-stat.h"
-#include "riscv_exception_types.h"
+#include "riscv_trap_types.h"
 #include "debug.h"
 
-define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_exception_class);
+define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_trap_class);
 
 const char *vcpu_id_str = "id";
 const char *kvm_exit_reason = "scause";
@@ -30,7 +30,7 @@ static void event_get_key(struct evsel *evsel,
 			  struct event_key *key)
 {
 	key->info = 0;
-	key->key = evsel__intval(evsel, sample, kvm_exit_reason);
+	key->key = evsel__intval(evsel, sample, kvm_exit_reason) & ~CAUSE_IRQ_FLAG;
 	key->exit_reasons = riscv_exit_reasons;
 }
 
diff --git a/tools/perf/arch/riscv/util/riscv_exception_types.h b/tools/perf/arch/riscv/util/riscv_exception_types.h
deleted file mode 100644
index c49b8fa5e847..000000000000
--- a/tools/perf/arch/riscv/util/riscv_exception_types.h
+++ /dev/null
@@ -1,35 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#ifndef ARCH_PERF_RISCV_EXCEPTION_TYPES_H
-#define ARCH_PERF_RISCV_EXCEPTION_TYPES_H
-
-#define EXC_INST_MISALIGNED 0
-#define EXC_INST_ACCESS 1
-#define EXC_INST_ILLEGAL 2
-#define EXC_BREAKPOINT 3
-#define EXC_LOAD_MISALIGNED 4
-#define EXC_LOAD_ACCESS 5
-#define EXC_STORE_MISALIGNED 6
-#define EXC_STORE_ACCESS 7
-#define EXC_SYSCALL 8
-#define EXC_HYPERVISOR_SYSCALL 9
-#define EXC_SUPERVISOR_SYSCALL 10
-#define EXC_INST_PAGE_FAULT 12
-#define EXC_LOAD_PAGE_FAULT 13
-#define EXC_STORE_PAGE_FAULT 15
-#define EXC_INST_GUEST_PAGE_FAULT 20
-#define EXC_LOAD_GUEST_PAGE_FAULT 21
-#define EXC_VIRTUAL_INST_FAULT 22
-#define EXC_STORE_GUEST_PAGE_FAULT 23
-
-#define EXC(x) {EXC_##x, #x }
-
-#define kvm_riscv_exception_class                                         \
-	EXC(INST_MISALIGNED), EXC(INST_ACCESS), EXC(INST_ILLEGAL),         \
-	EXC(BREAKPOINT), EXC(LOAD_MISALIGNED), EXC(LOAD_ACCESS),           \
-	EXC(STORE_MISALIGNED), EXC(STORE_ACCESS), EXC(SYSCALL),            \
-	EXC(HYPERVISOR_SYSCALL), EXC(SUPERVISOR_SYSCALL),                  \
-	EXC(INST_PAGE_FAULT), EXC(LOAD_PAGE_FAULT), EXC(STORE_PAGE_FAULT), \
-	EXC(INST_GUEST_PAGE_FAULT), EXC(LOAD_GUEST_PAGE_FAULT),            \
-	EXC(VIRTUAL_INST_FAULT), EXC(STORE_GUEST_PAGE_FAULT)
-
-#endif /* ARCH_PERF_RISCV_EXCEPTION_TYPES_H */
diff --git a/tools/perf/arch/riscv/util/riscv_trap_types.h b/tools/perf/arch/riscv/util/riscv_trap_types.h
new file mode 100644
index 000000000000..854e9d95524d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/riscv_trap_types.h
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef ARCH_PERF_RISCV_TRAP_TYPES_H
+#define ARCH_PERF_RISCV_TRAP_TYPES_H
+
+/* Exception cause high bit - is an interrupt if set */
+#define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
+
+/* Interrupt causes (minus the high bit) */
+#define IRQ_S_SOFT 1
+#define IRQ_VS_SOFT 2
+#define IRQ_M_SOFT 3
+#define IRQ_S_TIMER 5
+#define IRQ_VS_TIMER 6
+#define IRQ_M_TIMER 7
+#define IRQ_S_EXT 9
+#define IRQ_VS_EXT 10
+#define IRQ_M_EXT 11
+#define IRQ_S_GEXT 12
+#define IRQ_PMU_OVF 13
+
+/* Exception causes */
+#define EXC_INST_MISALIGNED 0
+#define EXC_INST_ACCESS 1
+#define EXC_INST_ILLEGAL 2
+#define EXC_BREAKPOINT 3
+#define EXC_LOAD_MISALIGNED 4
+#define EXC_LOAD_ACCESS 5
+#define EXC_STORE_MISALIGNED 6
+#define EXC_STORE_ACCESS 7
+#define EXC_SYSCALL 8
+#define EXC_HYPERVISOR_SYSCALL 9
+#define EXC_SUPERVISOR_SYSCALL 10
+#define EXC_INST_PAGE_FAULT 12
+#define EXC_LOAD_PAGE_FAULT 13
+#define EXC_STORE_PAGE_FAULT 15
+#define EXC_INST_GUEST_PAGE_FAULT 20
+#define EXC_LOAD_GUEST_PAGE_FAULT 21
+#define EXC_VIRTUAL_INST_FAULT 22
+#define EXC_STORE_GUEST_PAGE_FAULT 23
+
+#define TRAP(x) { x, #x }
+
+#define kvm_riscv_trap_class \
+	TRAP(IRQ_S_SOFT), TRAP(IRQ_VS_SOFT), TRAP(IRQ_M_SOFT), \
+	TRAP(IRQ_S_TIMER), TRAP(IRQ_VS_TIMER), TRAP(IRQ_M_TIMER), \
+	TRAP(IRQ_S_EXT), TRAP(IRQ_VS_EXT), TRAP(IRQ_M_EXT), \
+	TRAP(IRQ_S_GEXT), TRAP(IRQ_PMU_OVF), \
+	TRAP(EXC_INST_MISALIGNED), TRAP(EXC_INST_ACCESS), TRAP(EXC_INST_ILLEGAL), \
+	TRAP(EXC_BREAKPOINT), TRAP(EXC_LOAD_MISALIGNED), TRAP(EXC_LOAD_ACCESS), \
+	TRAP(EXC_STORE_MISALIGNED), TRAP(EXC_STORE_ACCESS), TRAP(EXC_SYSCALL), \
+	TRAP(EXC_HYPERVISOR_SYSCALL), TRAP(EXC_SUPERVISOR_SYSCALL), \
+	TRAP(EXC_INST_PAGE_FAULT), TRAP(EXC_LOAD_PAGE_FAULT), \
+	TRAP(EXC_STORE_PAGE_FAULT), TRAP(EXC_INST_GUEST_PAGE_FAULT), \
+	TRAP(EXC_LOAD_GUEST_PAGE_FAULT), TRAP(EXC_VIRTUAL_INST_FAULT), \
+	TRAP(EXC_STORE_GUEST_PAGE_FAULT)
+
+#endif /* ARCH_PERF_RISCV_TRAP_TYPES_H */

base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
