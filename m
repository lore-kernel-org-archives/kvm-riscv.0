Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26C2C5CFDB
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzOWNeylOyJ0A/F0JiPGRme3zTwGYE4iEGTaiPrRwdM=; b=CLLRthWPM9sn+C
	gp+gMGOs8rPyic8MLC20mCHSXq3HUpwPGQusBH7WIe09kPLoyxSYOGE9t9VQnjXbT8BmkB5cbfMV0
	51+bNkRKCwjtfOG1SCwyuXC2Ny2FerkRax4RuV5ImwT75V1vU64eTZAHFG6HpE0cHJqLHBS7zxcsm
	jP7LTDvqolEVFH5QauGobrN6RiQiAp0b0QUabUsWHY5y2sNUD3wwuZdndp9HTfsD68zojwTmJM3j+
	mzqwQWUSaKiC+i5Yx/4oJ7FOOZ6mTxCqtt3zpQOg1QwCngZGZ4VkMuflSLD/TyhNA72pCw4R45bK7
	58ogbVfrLA/v1pcrUiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqMl-00000002bzg-26QF;
	Fri, 14 Aug 2026 11:46:27 +0000
Received: from out-135.mta0.migadu.com ([2001:41d0:1004:224b::87] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqMe-00000002bx8-2bFN
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 11:46:22 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DWVWKUddK6cm3cADsjGMhQ+YmtUIIGHlVIpbg6PZ+20=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786707978; v=1; x=1787312778;
 b=SM10e2ddxFJXQj+GsE6lOr4h7JVdpBIDQwi9VxJwp3g2YklGfSATR4IPsCcl0dMfdwF6uvC1
 oTJKVzyeM+6mEL+I853ZpXXegEYVVI1ojMLd2rPAdhsMwR/amt9XkQFn6AhSLUnFc0dmgHhmlaB
 9p/vgbuIY7EGgTzkJGioVcro=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id f255273505126e07;
	Fri, 14 Aug 2026 11:46:13 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v3 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
Date: Fri, 14 Aug 2026 07:45:07 -0400
Message-ID: <20260814114507.583424-4-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814114507.583424-1-jinyu.tang@linux.dev>
References: <20260814114507.583424-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_044620_799393_73E66FFB 
X-CRM114-Status: UNSURE (   7.86  )
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
v1 -> v2:
- Drop the per-test guest_modes_append_default() call from
  pre_fault_memory_test.c.  RISC-V already initializes supported and
  default guest modes from kvm_selftest_arch_init(), which is called by
  the common kvm_selftest_init() constructor, as suggested by Sean.

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
