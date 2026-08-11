Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A81C5AC67
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRtnspLB/PFnZX4OTNQOa1xr0xMCAheLAbS5yYB7bos=; b=tp/vmSUWyrfj55
	jvVSWe2+I9TdpU1utHMZe6aCns5WH0Sk3MLOYdVblcgmNYA2dTRZNoeaaLe7kY1K0nfW2stj/Voel
	ENvxWI9IWu+Oj+d8qI7FxPT91bwn/S/q90Xz+M4GHfGibttb/XdF/Z2kG9y+KUOILxf5PKjkIRzvr
	XaeaVK5B7aIf3e6mDASxqLL5py866Bn6B2nydt5PaQgtl7ehzjV3Amg6DkYIeTcwZqKFY4/xvWBut
	ecjlhtT9b15Hd2FGQsyoTfSxJoiwcc5wY7nVzzf/nBMN3JE1SHR5/urhJMy4lnu/4KwlsAVmGeGMK
	Opq1yhasr/PWMjI6kC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZx-0000000DN4l-1XFG;
	Tue, 11 Aug 2026 06:03:14 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-178.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZu-0000000DN22-26SS
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:03:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786428188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJJi6fAW87uNl1GyGL1wWoOrHzVefNmtF4hW3yne+6I=;
	b=dwjLWgXdHe5FfZ1oqSdC5E94o5zj3BhveFwy74U09yRS/yiWF1lpeL4LKHeXP014CFeVuE
	FbOF9kg0dHZM8ev5G/lEvQawQzZTB8FLEXCnKObwDBhKQEeNa0arBDVIP93lrI3s/2xEpX
	4urR/cDI4SEFBtZrnpKwrvOAxjQdw4U=
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
Date: Tue, 11 Aug 2026 14:01:34 +0800
Message-ID: <20260811060134.106973-4-jinyu.tang@linux.dev>
In-Reply-To: <20260811060134.106973-1-jinyu.tang@linux.dev>
References: <20260811060134.106973-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230310_972052_BDD7533B 
X-CRM114-Status: UNSURE (   9.13  )
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

RISC-V selects VM_MODE_DEFAULT at runtime. Initialize the supported
guest modes before creating the VM so the generic test can run on
RISC-V hosts where the default mode is discovered from KVM
capabilities.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 tools/testing/selftests/kvm/Makefile.kvm              | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h | 3 +++
 tools/testing/selftests/kvm/pre_fault_memory_test.c   | 3 +++
 3 files changed, 7 insertions(+)

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
diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index a0fcae3cb7a8..6eebf0524673 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -8,6 +8,7 @@
 #include <linux/sizes.h>
 
 #include <test_util.h>
+#include <guest_modes.h>
 #include <kvm_util.h>
 #include <processor.h>
 #include <pthread.h>
@@ -219,6 +220,8 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
 
 int main(int argc, char *argv[])
 {
+	guest_modes_append_default();
+
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
 
 	test_pre_fault_memory(0, false);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
