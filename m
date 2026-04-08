Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825BFD5F79
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VixBdGpLsQpQaPKiZ34k3MkXvgdHP27Ee5Qp55aTj94=; b=aHds2w2S0Ebza5
	9DfyZmsPoQMhGgWwNynDUB+HHFIO3QIP19F8EvR7LRtERUFIhLZfWrXb2ThutQCkngzB1lO7WeZLC
	twtH1O1ugdHsHSS3XJV06ZeW6dJ5B0rHp955Ldkw4ov4JUNqwqoIrefY47aALPoa8UdWaswY7Wn0W
	LY0Mq0PxVwmhiB6+RhjJQ4PiyMxPpt03czT8/d4IvuWHX2jbrfRQUVisoaIJDwR6jlnwnmBJu6+1J
	mKzKjMR4lc69isvv3oc5KNrAmCmfvZcxwZTx2PK9SYez6qhQiXhCYg/5BBmgYWFtzM07bMh05SJ+p
	+A2WFTQEiVsaRCGYt/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoT-00000008Enc-0Ibc;
	Wed, 08 Apr 2026 04:46:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoK-00000008Eco-29DE;
	Wed, 08 Apr 2026 04:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68D25445A7;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FA10C19425;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623597;
	bh=lChrzKmkSUM2VwN/SlQWXnrTo6efmgqrmXjeou47SQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PhqFD4cy3LSKa2+erT2riN9afxOLOg9J66WEvfzIv+MJ5G6CIosfoC8oY17PmTyQg
	 ARrXdGLUKbZpmVD+6Wilj111y17BHhGknxXVpV7S4LzpSOUWSI/yVQ0DIO3nIQCEUR
	 fMUhZP+vPF921JpAlKpQCh6CtiF72eTLYmLWl2iFq51Jyvo0xM64YeJPEjnLHSpjy+
	 NxanhlvYRO1G0hbEszMxRHw4QiLDtsMRGmzHXXYB2H+NXfQX0SWZiM/Dkr5jBrgN5C
	 FaDYnd+Db6+NC50h0SeHXDL9blz3op9mGDAQIp0EJURF8dOBnWJ32n4w7IRKPkyJgc
	 cKsGx80qz02yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32796FD5F76;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:58 -0700
Subject: [PATCH 10/16] KVM: riscv: selftests: Add mmio test
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-10-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
In-Reply-To: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=7215;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=I1m1SXH0L+QYSFNr6TSVf7ckXNM0lll65+t/TdGFsTs=;
 b=+KRMu+rX16oBPNgSUL6TEER4P32IoJXyqtv72sFw5alZ+T2Acuu1muy0vleUGouSxHuDBDY61
 fc0UIqYhN/AChEN4fM3N0TvboiWeV0iI9sAqQJ1YOYa038JAefijOHJ
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214640_665015_A9EDC420 
X-CRM114-Status: GOOD (  13.21  )
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

Use the test KVM device to validate that reads and writes to a device
are properly emulated by KVM. This test checks all load and store
instructions that are emulated by KVM.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/riscv/mmio_test.c | 184 ++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index ba5c2b643efa..d402fb339bc0 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -204,6 +204,7 @@ TEST_GEN_PROGS_s390 += rseq_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += riscv/mmio_test
 TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/riscv/mmio_test.c b/tools/testing/selftests/kvm/riscv/mmio_test.c
new file mode 100644
index 000000000000..9726860a269a
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/mmio_test.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mmio_test.c - Tests the mmio functionality.
+ */
+#include "kvm_util.h"
+#include "ucall_common.h"
+
+#define MMIO_TEST_REGION 0x20000000
+
+#define test_standard_read(len, instruction, name, options)					\
+static void test_##name(void)									\
+{												\
+	unsigned long mmio_result, reference_result;						\
+	/* Configure the MMIO to return 0xff for each byte to check sign extension */		\
+	unsigned long reference = ((unsigned long)-1 >> ((sizeof(long) - len) * 8));		\
+	*((unsigned long *)MMIO_TEST_REGION) = reference;					\
+	/* Check that reads through MMIO are equivalent to standard reads. */			\
+	asm volatile (										\
+		".option push\n"								\
+		options										\
+		#instruction "	%[mmio_res], 0(%[region])\n"					\
+		#instruction "	%[ref_res], 0(%[ref])\n"					\
+		".option pop\n"									\
+		: [mmio_res] "=&cr" (mmio_result), [ref_res] "=&cr" (reference_result)		\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (&reference)			\
+	);											\
+	GUEST_ASSERT_EQ(mmio_result, reference_result);						\
+	GUEST_DONE();										\
+}
+
+#define test_sp_read(len, instruction, name)							\
+static void test_##name(void)									\
+{												\
+	unsigned long mmio_result, reference_result;						\
+	unsigned long tmp;									\
+	/* Configure the MMIO to return 0xff for each byte to check sign extension */		\
+	unsigned long reference = ((unsigned long)-1 >> ((sizeof(long) - len) * 8));		\
+	*(((unsigned long *)MMIO_TEST_REGION)) = reference;					\
+	/* Check that reads through MMIO are equivalent to standard reads. */			\
+	asm volatile (										\
+		"mv	%[tmp], sp\n"								\
+		"mv	sp, %[region]\n"							\
+		".option push\n"								\
+		".option arch,+c\n"								\
+		#instruction "	%[mmio_res], 0(sp)\n"						\
+		"mv	sp, %[ref]\n"								\
+		#instruction "	%[ref_res], 0(sp)\n"						\
+		".option pop\n"									\
+		"mv	sp, %[tmp]\n"								\
+		: [mmio_res]  "=&cr" (mmio_result), [ref_res] "=&cr" (reference_result),	\
+		  [tmp] "=&r" (tmp)								\
+		: [region] "r" (MMIO_TEST_REGION), [ref] "cr" (&reference)			\
+	);											\
+	GUEST_ASSERT_EQ(mmio_result, reference_result);						\
+	GUEST_DONE();										\
+}
+
+test_standard_read(1, lb, lb, "")
+test_standard_read(1, lbu, lbu, "")
+test_standard_read(4, lw, lw, "")
+test_standard_read(4, c.lw, c_lw, ".option arch,+c\n")
+test_sp_read(4, c.lwsp, c_lwsp)
+
+#if __riscv_xlen == 64
+test_standard_read(2, lh, lh, "")
+test_standard_read(2, lhu, lhu, "")
+test_standard_read(4, lwu, lwu, "")
+test_standard_read(8, ld, ld, "")
+test_standard_read(8, c.ld, c_ld, ".option arch,+c\n")
+test_sp_read(8, c.ldsp, c_ldsp)
+#endif
+
+#define test_standard_write(len, write, read, name, options)					\
+static void test_##name(void)									\
+{												\
+	unsigned long result;									\
+	unsigned long reference = (0x55555555UL >> ((sizeof(long) - len) * 8));			\
+	/* Check that we can write and then read the same value. */				\
+	asm volatile (										\
+		".option push\n"								\
+		options										\
+		#write "	%[ref], 0(%[region])\n"						\
+		#read "		%[res], 0(%[region])\n"						\
+		".option pop\n"									\
+		: [res] "=&cr" (result)								\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (reference)			\
+	);											\
+	GUEST_ASSERT_EQ(result, reference);							\
+	GUEST_DONE();										\
+}
+
+#define test_sp_write(len, write, read, name)							\
+static void test_##name(void)									\
+{												\
+	unsigned long result;									\
+	unsigned long tmp;									\
+	unsigned long reference = (0x55555555UL >> ((sizeof(long) - len) * 8));			\
+	/* Check that we can write and then read the same value. */				\
+	asm volatile (										\
+		"mv	%[tmp], sp\n"								\
+		"mv	sp, %[region]\n"							\
+		".option push\n"								\
+		".option arch,+c\n"								\
+		#write "	%[ref], 0(sp)\n"						\
+		#read "		%[res], 0(sp)\n"						\
+		".option pop\n"									\
+		"mv	sp, %[tmp]\n"								\
+		: [res] "=&cr" (result), [tmp] "=&r" (tmp)					\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (reference)			\
+	);											\
+	GUEST_ASSERT_EQ(result, reference);							\
+	GUEST_DONE();										\
+}
+
+test_standard_write(1, sb, lb, sb, "")
+test_standard_write(2, sh, lh, sh, "")
+test_standard_write(4, sw, lw, sw, "")
+test_standard_write(4, c.sw, c.lw, c_sw, ".option arch,+c\n")
+test_sp_write(4, c.swsp, c.lwsp, c_swsp)
+
+#if __riscv_xlen == 64
+test_standard_write(8, sd, ld, sd, "")
+test_standard_write(8, c.sd, c.ld, c_sd, ".option arch,+c\n")
+#endif
+
+static void run(void *guest_code, char *instruction)
+{
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	virt_map(vm, (unsigned long)MMIO_TEST_REGION, MMIO_TEST_REGION, 1);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "MMIO with instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	kvm_vm_free(vm);
+}
+
+void test_mmio_read_sign_extension(void)
+{
+	run(test_lb, "lb");
+	run(test_lbu, "lbu");
+	run(test_lw, "lw");
+	run(test_c_lw, "c.lw");
+	run(test_c_lwsp, "c.lwsp");
+
+#if __riscv_xlen == 64
+	run(test_lh, "lh");
+	run(test_lhu, "lhu");
+	run(test_lwu, "lwu");
+	run(test_ld, "ld");
+	run(test_c_ld, "c.ld");
+	run(test_c_ldsp, "c.ldsp");
+#endif
+}
+
+void test_mmio_write(void)
+{
+	run(test_sb, "sb");
+	run(test_sh, "sh");
+	run(test_sw, "sw");
+	run(test_c_sw, "c.sw");
+	run(test_c_swsp, "c.swsp");
+
+#if __riscv_xlen == 64
+	run(test_sd, "sd");
+	run(test_c_sd, "c.sd");
+#endif
+}
+
+int main(void)
+{
+	test_mmio_read_sign_extension();
+	test_mmio_write();
+
+	return 0;
+}

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
