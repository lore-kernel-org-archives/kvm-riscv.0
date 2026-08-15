Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B12C5AD5A
	for <kvm-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTnTJgrB5C52dyTpcfuCdGxU68Nic2dZO201buPW8Bk=; b=IHR2QJukDbJELY
	E8umtrEhXH++WhcvncqnZ6FWnlpBKXfpUfNg3pcWwgDKd4TlKvHjCOL2yzbqMG5moyiQgPpG2/uzk
	eGupfJCKEZ3nOVUPuOnmQchqlL25hIpMuoML4v5TrbBIGYpbdH6a6W60us88uXcQil69c7CfyoU84
	LvtYEoRjinvZIUygFUvqBTaDyQKsCW4ApyKsBdte7n/DUclvUAU/DTg8YCMipWf2kjd8y8pnFs7eH
	OCCzu38/0DlFAksQ81O6r5gRKVD0ZM6pjJJjFNORbrqhoyhBz+1RawxQs6mOhy91T9vXgnFYj1tCR
	Kc+P0wm1OZe29vJ++sDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBj5-00000003kUR-0PH7;
	Sat, 15 Aug 2026 10:34:55 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBj3-00000003kTq-0EXq
	for kvm-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:34:54 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pBGNsphtwvKUMT19aojQRvWbbD9gZSFI8gT/RJcmfQM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786790091; v=1; x=1787394891;
 b=wzKMFc+zIYpGkZFMV7uprkN6uskeVSt0lbNpSpP8LC+HMdX7FXqu1wbcLnoqg+4wdzNHK6ma
 SCYG0hAQZXJmo7CfyFwLDrF0BxgjZpFLwhCGtF5X6QyDuG9aA1fbQe8VdrVvO0WQKLvIHckPjFG
 UzVHcw809gbzHrvtzCXkEya0=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id ee0bac32ec84a1c6;
	Sat, 15 Aug 2026 10:34:51 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v4 RESEND 5/5] KVM: selftests: Enable pre_fault_memory_test for RISC-V
Date: Sat, 15 Aug 2026 06:34:41 -0400
Message-ID: <20260815103441.865076-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815102833.864330-1-jinyu.tang@linux.dev>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_033453_231340_03F23C77 
X-CRM114-Status: UNSURE (   7.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

RISC-V now supports KVM_PRE_FAULT_MEMORY, so include the generic
pre_fault_memory_test in the RISC-V KVM selftest build.

The test uses PAGE_SIZE from the architecture processor header. Define
the normal 4K RISC-V selftest page size so the generic test can build
for RISC-V.

Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm              | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6fc34e9bf8e1..ac64ac92fd4b 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -225,6 +225,7 @@ TEST_GEN_PROGS_riscv += coalesced_io_test
 TEST_GEN_PROGS_riscv += dirty_log_perf_test
 TEST_GEN_PROGS_riscv += get-reg-list
 TEST_GEN_PROGS_riscv += mmu_stress_test
+TEST_GEN_PROGS_riscv += pre_fault_memory_test
 TEST_GEN_PROGS_riscv += rseq_test
 TEST_GEN_PROGS_riscv += steal_time
 
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index abde3c71c891..70487c8ed155 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -12,6 +12,9 @@
 #include <asm/vdso/processor.h>
 #include "kvm_util.h"
 
+#define PAGE_SHIFT		12
+#define PAGE_SIZE		BIT_ULL(PAGE_SHIFT)
+
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
 #define INSN_OPCODE_SYSTEM	28
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
