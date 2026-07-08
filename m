Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B17CC44503
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YwuA9QgoHv/cOW3unrNJirvSDUG8Hq9gbNFlyffICw=; b=NWOu2Pi+g4DPy+
	lCOagK5GQ6vWtzg8tnfj9JEdvX1rkhECrP0ZFSWRi5DL5QuNOCrwG9e4XH5t+WOAwBbu8//fbrS6Z
	BXEIdJ7du5x8jl41lt/SF9Fiy+inmJ8Qy4M7O9nk//93K9uR28w4583Oothp6/Q5XLVRL92/aBRV4
	h4+FRKGz0MyVyzSD7JbvnAhVnxEcN01qOVeJoB9Gi2npdkWR3njeQTdDkN1pjN55bXzsQP0S4XxNg
	5+HIXWz0HikhgHz734WrlxPquU8CZGh99qLHtSkg8+Kc4wAJvW6w0u1s42mrVW16J/XH1NAUko/7T
	96EB6zhD7SicDrCIDajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5y-0000000GGPI-3SOE;
	Wed, 08 Jul 2026 03:37:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5c-0000000GFxW-0RzJ
	for kvm-riscv@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=; b=R9vFi2y9gzOqmT0uqyddfRsIiU
	TBeik3v29hH2RgPGUHld7HZ40E0v/q/i4jk1RtloL+iug+VSPCGkLCNipatVXVRkrGk/3Npf1Yaub
	jknkWa92sU+EegROcZxqemE0+kY9AdbZlaoFMTC1ke8rlEavbdgdTfY+6jGtLln0a7f/Eyw0cHk06
	K38Lv/75XAo8Zt+ht5Ood0j+QvsaB6hCiJ9S4wvfoDKbaPXMJa2PVnat+dm0tYkKTxccq1cCz59tv
	6BfUQ60NyH0gqopnXMJsCcRAYdbisN6B5TAJxy/bPH8kv6l6vcF54rY+w07Q1PFAC/fr1mh7ugPu6
	z1iLhJdw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJ5Z-00000007yXn-0b82
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8475eca3a66so263573b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481803; x=1784086603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=;
        b=AwqMnNfp52lis0MRWk9U6Pd5tFqQwclPVNMFLR8xe8GOHiZIc7cALfKrbBq0e8XwQ7
         HSm8Gdl3DBMhkuOL/wMM2i5/FkW/AoU7aaGy6Qc3DaiRmoztwarFWaICUC0uVUJoLNJs
         IAWrUEHDzlpVfP/NST1uzEnG8qfbes+7LLrMY+GfWmcM/+56R0X5UwLC2zEArlaIA3zG
         llrSWrSKPIPOcdqYyW2PUI9hzwexr6ykgxjfum2f8Je29DYje422rOoGwwnStPlPdHmQ
         BCqtEgBHtCzpJ+WiBGuZiMMBHubV2kB3h743k5c6ffuohSRjiTKJeTV+7cg1xTjhTLrd
         KfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481803; x=1784086603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=;
        b=fMj3yVxRK6M8ucY8HvX0ADTBsVCIq+z3hX5ia36+MG69EHF7MH4A+MNmsZUSCBFpvy
         YV5DItBoMqJKSnxyshvn6A6aukm4qRx+N5iY1mhlvbIw8e/Cf/TaF5iEomSTSZSQN4bb
         V1bN/0GqRcMeYGsyyZ6fU0BU6xEKN3OB0rktmO7Q66+Y5kO5gXJiJIt4/8l/Ur738Xu/
         G3g2nOl5cjasu2TNQKzzUz6v02l2p76ja7Q6MCh75LRyo+BbpCJcTdGdOifYFf7RKqWo
         6LpQY3kbkbyNETRomqbbDMUx9mguxMwUmd/0SQcVDyEGASkTAZW+si4iokA1rtYC+79j
         UDOg==
X-Forwarded-Encrypted: i=1; AHgh+RoBM0QRdFqdRNhZ+vpWp2EW1qvnlYIy1WZQ5OlA2oM8rzTefWCb2CI6npxVegP1CUw2CqU16/jz7Ps=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu3KpD01cd7IjzfmcCjzHCaTEMRTZJv+ixFFyithq1k3nAKxNE
	UFriD/7s56U8r+IJR4W8lU9Erz/SSqL9GUDY0MJMuu2hS18GA5dTiwZC
X-Gm-Gg: AfdE7ck1Go7Aakv7UXh12N5+Xwu6wFpyqZx2+y4aSgAaa10d1NTOJrMU7G52vtTzy2t
	VbTuzoSvuWnH2eu1OBjSAKg7ytZiAuLNF25TnO49l286tC2WlNfLFnAF62hQ59qENtHoNd/d/Uv
	8jeesIUM8HTg83n82Pz3U6IF2AsYqn75kRvmsxtDvGW5q2R6qIQQblqGdcjXlm0kKw+h4SOCV5s
	UV/pYlXNbbGzFvD1aCEdGVKrMkAktKZwaRvOdMuruPXSNhpd997nsoRLhUrUqP+E4vH8kGLCVDS
	TRJxg9JSZJ6hFKK43KKKyAcQyBFkRBFd1nckbnbDQt4/GeWOvbSjOiLE5Sa8HJh+DC++VBldRVn
	44Nur90Dn0fcYDUVXl3CvSLEfmunQ+uyNVUhkvbseSX43N/8ljnwbzbGYHswdtayVdPnFgzPTbW
	0/o6xtHyiZGBS173k+Hd2BvNZvYfON9r09AkhlY4I=
X-Received: by 2002:a05:6300:220d:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c0bd23ef9dmr601090637.50.1783481802761;
        Tue, 07 Jul 2026 20:36:42 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:42 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:37 -0700
Subject: [PATCH v3 14/17] KVM: riscv: selftests: Add csr emulation test
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-14-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=4678;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=qi/WyV6rxMYApvKgE9MTfWvRwuKF3Auj3h2yBnFI9Mg=;
 b=QczF1j024KNg8/dB49Lgm4Ao2CfVqUU6ddLzHSDUYeMCWduTnE82y0t5vR2FFGF8EVkyU4Mi0
 eWDQJmNv8UjAE94S/3gzb4BUmUKXenPsYliWICDyA0ktInJOh35mlXn
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043645_443059_F3C16CCE 
X-CRM114-Status: GOOD (  15.72  )
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

Introduce a kvm test that uses the emulated test csr to validate that
all emulated reads/writes to csrs function as expected.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm     |   1 +
 tools/testing/selftests/kvm/riscv/csr_test.c | 133 +++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

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
index 000000000000..bdedf7c84001
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/csr_test.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * csr_test.c - Tests the csr functionality. CONFIG_RISCV_KVM_TEST_CSR needs to be enabled.
+ */
+#include "kvm_util.h"
+#include "ucall_common.h"
+
+#define CSR_TEST 0x240
+#define MASK 0x15
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
+	asm volatile (										\
+		"csrs	sstatus, %[enable_fp]\n"						\
+		"csrw	fcsr, %[init]\n"							\
+		#write"	zero, fcsr, %[mask]\n"							\
+		"csrr	%[ref_res], fcsr\n"							\
+		: [ref_res] "=&r" (reference_result)						\
+		: [enable_fp] "r" (FP), [mask] #mode(MASK), [init] "r" (initial)		\
+		: "memory"									\
+	);											\
+	asm volatile (										\
+		"csrw	%[test_csr], %[init]\n"							\
+		#write"	%[old], %[test_csr], %[mask]\n"						\
+		"csrr	%[hyp_res], %[test_csr]\n"						\
+		: [hyp_res] "=&r" (hypervisor_result), [old] "=&r" (old_hypervisor)		\
+		: [test_csr] "i"(CSR_TEST), [mask] #mode(MASK), [init] "r" (initial)		\
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
+	int fd;
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	fd = kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "CSR instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
+static void check_test_csr_guest(void)
+{
+	unsigned long scause, stvec;
+
+	asm volatile(
+		".option push\n"
+		".option norvc\n"
+		"la	%[stvec], 1f\n"
+		"csrw	stvec, %[stvec]\n"
+		"csrwi	%[test_csr], 0x0\n"
+		"1:\n"
+		"csrr	%[scause], scause\n"
+		".option pop\n"
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
+	int fd;
+
+	vm = vm_create_with_one_vcpu(&vcpu, check_test_csr_guest);
+
+	fd = __kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+	if (fd < 0)
+		return 0;
+
+	vcpu_run(vcpu);
+
+	success = get_ucall(vcpu, &uc) == UCALL_DONE;
+
+	close(fd);
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
