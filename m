Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC07CDB475
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XXmEWRYwuVYEaailoo6Il4GhHwhl5YFOGcPD9TuzJ0=; b=Clqx69nuNmY5YP
	uFMXU4P/JVwZc4bOUpkvvNzemLp+x+ey4urhEnYcMIifKDg8B1Lvk/iHSselfZvjhJP3mt8HyA1Lg
	nRbTC74tYUz1rHrdzO3n/A4Hcaoq1PC84ZIXlX9gnao2pVfvhj8HS9T39Hld9rFxeTP9qnZ4nsOk5
	bEYM/tuuZF3RYeo7vANerWJRFcUt9RgVMkB1e+4aeg9d+SGdSmh2QX1G5ck4QUlNhAwoCQSBEfcMQ
	q2Dw1knkNGJ21hXpz7tUh92LCVbMQivb6is7IThCjBmJBfMTRgS2/yxryOw6S3Llx36eE6iHAapyo
	pcQNNiOIIdRdpV+FF59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVr8-00000004Mbq-2xrO;
	Mon, 22 Jun 2026 04:01:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVqx-00000004MU7-1klj;
	Mon, 22 Jun 2026 04:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 543704458F;
	Mon, 22 Jun 2026 04:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35DEFC2BCFD;
	Mon, 22 Jun 2026 04:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782100902;
	bh=TVUTi3JzfDP6+5V/37ec117+w6OR65FVI5bIsfJZApA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q4AOBYjlxIBqxzMIEV3PLP2UaHQnNf09AVYFW/j9dCpu2/frUABGIn/9dv9O1xDK2
	 rnOODipLb1VwSN/TV78VqjNdgWoaXzcwyyxDl7ytdHBMGINu80z7T7Zx/SNw8NuhEU
	 fZkNZRPy4MRCyTX8dNhnGxXDngcYv4OdtuCrFAa/xFJ+4CFDdgVEFkHfMCafe1fKlU
	 fZ5+DeVDB3Kxp8SVWvMiMaztSYfuiuIRWzUP3T2M0s8OXpXzATTLpXqHSAzJ7Lrh1v
	 ZoyAb/tfmIscpN+RHs6G4gKJcJo/p3bHbO6SAsHFymaBdJnrCzFO0rFeUB1z0CsjcX
	 CFaAG2Z+VGefw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBC2CDB471;
	Mon, 22 Jun 2026 04:01:42 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Sun, 21 Jun 2026 21:01:31 -0700
Subject: [PATCH v2 13/16] KVM: riscv: selftests: Add csr emulation test
MIME-Version: 1.0
Message-Id: <20260621-riscv_insn_table-v2-13-7f0810ee2274@gmail.com>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782100900; l=4572;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=UIPBSpc0H3jB7+KpJxg4F5rG4rgb2Zzku6x9eNCAhf8=;
 b=LkA15MenggXoi151d45SYPIEvfF6f5Fo3rW9bGmHd1LZ5uSRXUZT9goc9vyY3EB3pqtMjq6G7
 wPZWWace2SQCE3C+XBtQd73He4AWPCES9KyX40XDcpXuv8kW6z3sMPA
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260605
 with auth_id=810
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

Introduce a kvm test that uses the emulated test csr to validate that
all emulated reads/writes to csrs function as expected.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm     |   1 +
 tools/testing/selftests/kvm/riscv/csr_test.c | 126 +++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 07a5fc2bf67c..88ccd15e8f94 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -212,6 +212,7 @@ TEST_GEN_PROGS_s390 += s390/irq_routing
 TEST_GEN_PROGS_s390 += mmu_stress_test
 
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
+TEST_GEN_PROGS_riscv += riscv/csr_test
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
 TEST_GEN_PROGS_riscv += riscv/mmio_test
diff --git a/tools/testing/selftests/kvm/riscv/csr_test.c b/tools/testing/selftests/kvm/riscv/csr_test.c
new file mode 100644
index 000000000000..b3e8b99b6e92
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/csr_test.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * csr_test.c - Tests the csr functionality.
+ */
+#include "kvm_util.h"
+#include "ucall_common.h"
+
+#define CSR_TEST 0x240
+#define FP 0x00006000
+
+/*
+ * Use the fcsr as a U-mode accesible csr and compare against the custom 'test'
+ * hypervisor csr (currently using vsscratch)
+ */
+#define test_csr(write, initial, mode)								\
+static void test_##write(void)									\
+{												\
+	unsigned long hypervisor_result, reference_result, old_hypervisor;			\
+	unsigned long mask = 0x15;								\
+	asm volatile (										\
+		"csrs	sstatus, %[enable_fp]\n"						\
+		"csrw	fcsr, %[init]\n"							\
+		#write"	zero, fcsr, %[mask]\n"							\
+		"csrr	%[ref_res], fcsr\n"							\
+		: [ref_res] "=&r" (reference_result)						\
+		: [enable_fp] "r" (FP), [mask] #mode(mask), [init] "r" (initial)		\
+		: "memory"									\
+	);											\
+	asm volatile (										\
+		"csrw	%[test_csr], %[init]\n"							\
+		#write"	%[old], %[test_csr], %[mask]\n"						\
+		"csrr	%[hyp_res], %[test_csr]\n"						\
+		: [hyp_res] "=&r" (hypervisor_result), [old] "=&r" (old_hypervisor)		\
+		: [test_csr] "i"(CSR_TEST), [mask] #mode(mask), [init] "r" (initial)		\
+		: "memory"									\
+	);											\
+	/* Check that writing works */								\
+	GUEST_ASSERT_EQ(reference_result, hypervisor_result);					\
+	/* Check that reading works */								\
+	GUEST_ASSERT_EQ(old_hypervisor, initial);						\
+	GUEST_DONE();										\
+}
+
+test_csr(csrrw, 0x0, r)
+test_csr(csrrs, 0x0, r)
+test_csr(csrrc, 0x15, r)
+test_csr(csrrwi, 0x0, i)
+test_csr(csrrsi, 0x0, i)
+test_csr(csrrci, 0x15, i)
+
+static void run(void *guest_code, char *instruction)
+{
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "CSR instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	kvm_vm_free(vm);
+}
+
+static void check_test_csr_guest(void)
+{
+	unsigned long scause, stvec;
+
+	asm volatile(
+		"la	%[stvec], 1f\n"
+		"csrw	stvec, %[stvec]\n"
+		"csrwi	%[test_csr], 0x0\n"
+		"1:\n"
+		"csrr	%[scause], scause\n"
+		: [scause] "=&r" (scause), [stvec] "=&r" (stvec)
+		: [test_csr] "i" (CSR_TEST)
+	);
+
+	/* An illegal instruction will be generated if CONFIG_RISCV_KVM_TEST_CSR is not enabled. */
+	if (scause == 2)
+		GUEST_FAIL("CONFIG_RISCV_KVM_TEST_CSR not enabled.\n");
+	GUEST_DONE();
+}
+
+static int check_test_csr(void)
+{
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	int success;
+
+	vm = vm_create_with_one_vcpu(&vcpu, check_test_csr_guest);
+
+	/* Skip if CONFIG_KVM_MMIO_TEST not enabled */
+	if (!kvm_create_device(vm, KVM_DEV_TYPE_TEST))
+		exit(KSFT_SKIP);
+
+	vcpu_run(vcpu);
+
+	success = get_ucall(vcpu, &uc) == UCALL_DONE;
+
+	kvm_vm_free(vm);
+
+	return success;
+}
+
+int main(void)
+{
+	/* Skip if CONFIG_RISCV_KVM_TEST_CSR not enabled */
+	if (!check_test_csr())
+		exit(KSFT_SKIP);
+
+	run(test_csrrw, "csrrw");
+	run(test_csrrs, "csrrs");
+	run(test_csrrc, "csrrc");
+	run(test_csrrwi, "csrrwi");
+	run(test_csrrsi, "csrrsi");
+	run(test_csrrci, "csrrci");
+
+	return 0;
+}

-- 
2.54.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
