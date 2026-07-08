Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB3C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do4wpQqZlPYQeYxTUQJ+NuOIaGV4nJOrYfAguRWgUaA=; b=fIpc3AG21VBA5R
	9dDAuXeoS9irKjfNoYgXUIlInnpuqVtMtM6XzFuzHbcO1sQz7adWUlCYeDJU0zF5GpvPdiJlrimWs
	3LM5Z4mq31v7tXCO38CP+yID8npn6pbu2AeC0sSLiDR3+1fkKJkzh2UO7cNNN+goPD9ew29Dxpg0B
	ayrHyn/dwXTO5ODyTVkGfZcQ1kPVI9ipl8e4DUbsdTQDre+9NzW58vRwwG0vjSlamHkAv8R20Tann
	PgNcVZ8cj/7hfxtslBnVeMkPjxCvFyW5ZmKIYnxvFbAG6fBCE6amb4gBmDHeT38ir2gDr0EcAcp2U
	oAZU4dyEjSFaV9FocMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5v-0000000GGKI-1i7F;
	Wed, 08 Jul 2026 03:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5Y-0000000GFtD-1vaN
	for kvm-riscv@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2zWjmjX847p2DKDjhGEU6haOXKl59H/UFpmrJDlC52A=; b=q85ed69eH8/ebZm75qD8PPRTQe
	ZF/BPTjYKZgqtV105vH1Kpb15E9B4B4ecIjDACnomY8KRgaw7cLo+evr9AlyV8tlnBD4MbU5U+Het
	Vc6BGgEbDNzaalXUoi0XmQMF5tGgAOzvF/ZrliXbQaoEl/I/q/rJvr9+5IBsc1MB9ujI+wEW/xess
	iD2mnDFqM0DPlnqiSBhp4T5SUelZW2ekxZKdXQivEf4vepqVjB5veoENFcFijQdWZ3xuiiasR01p6
	016XWKc+664ak5P5+GwltCHjTxH1cAXfI6nkfXOzS3CZBfwrtSDPn9Pfg2SUl+5gWVw75AN7gRViM
	0KFqgNAQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJ5U-00000007yWd-3UIm
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cca0c5799eso1998475ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481798; x=1784086598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zWjmjX847p2DKDjhGEU6haOXKl59H/UFpmrJDlC52A=;
        b=YChuIJ/tu70bckza0FqtxcDApmHUNaVq4LjZBaH308mx/eNNTRVuD1DRjhcmvlXjhA
         X3DRrMS6W28L71Fp5VaBG/G/QchW9pP1COszcC2RhywrxR8bY1c6LTUjcZCXBHlSSf2C
         Vf3HWv93vB03ax+m5qrn2F/8A9rCrLkCGbqtLd4Cn+Ac/fwuMK8tWjebri9CJLDhudQN
         qLWKF+dEJLIuVJR/i6nbm2Hb6mxLCcw4o0O/IId0tF06zFzGT2stRfH1hqbDqEs2nWP4
         q0BbJ2z4cIFBNrD31hAFmASuGRTiMcdxuYfBHr6TaCFzU71yMQIESHks/PU0ipDInvQc
         RtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481798; x=1784086598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zWjmjX847p2DKDjhGEU6haOXKl59H/UFpmrJDlC52A=;
        b=sOiAUmPTWKecW/iOgtj9BvZFNnBboZUGguMOktNCw2Sodj426t6bsUYTDG4Y5X9Oep
         ghl2fcYsezS2D8vP2zIqipij3tfAX4SC4Tj8IVcpLSqhO+OwFmnDFzHgPLF25RdSNH0s
         7c/NeMMTx+U62Hxy7XBYakLa4HuMr4t0rrjnrBTmT7XOzbY3GxvamPJKGCyQ1xwJX/08
         Ab2OlqXajY4g6yItN0+xYlMAAWBjtTbJz9ARcNmLk0taRUbzo23HYwU5UlctAbK9zhsM
         YJ7yesGGcPuA9LAs1l7saQbFtEg640QWagwt+e56lhVw7TjeYD9gyWi5N9te0ypRqvBc
         TvsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY//ZHLP20As24SjNKf2ClVQvZKJCfuHSqIRVDwhoIB3VOmNgAQ6tUDztihIvAo8MupmHhVaCvw2E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPS4Wm2Rx/5cgvTTj8BC00X5GUzgDNlNM6dSlewlqIU3mUTkRZ
	/rAZsxaaJCKYmN8MzCtWrG8FzlUOJFM0y3NjpgLEGAEA+Xp2sKd7/kET
X-Gm-Gg: AfdE7cnTRN9vW4hxnQnAQtIzDCTN8F1bmhmJH5ZUM+NCN8kb60YwKAwAKjqUYSI/oY/
	t8Yqbhc/mpqYlFMrigsikjtSrxhOIwDh5Gl6Mypv/577rn7M8MR+c36hhjjptuh4MsxEGCz2eDY
	2zj9YBltep+mcxmJAwpRjTJhTtgPkhpT7TqdDpQfCD2GoFAE5mJD5HvOC79/21GoUC6EGRAl0k0
	jGB+9x4r5LJXu7oxo64q8jgJyWLDfUw6Pnuw1vepXMU1oBOa+245OkfkJO0oiPH5JXdXFH7Wurq
	ekmFN2rLwxPQGV9XKCCHgSbQyowGmZS1x0wzJdDCsADAiuvJx8N2bank+1GCKNdBAvY5vQJ1g0d
	WiYJeRUr+VSZEPYCRHo6ANV+sjrPKGh79vP1mDZHJWnK4zXTveRyRRlc+tIHNQZ/V0ZF4CUlxLG
	yeBgI/oSHZ8WaQIxFvtQfnR2oSTDNMPjpD8Xk9J8tksLgx2g08+Q==
X-Received: by 2002:a05:6a21:e083:b0:3b2:a8cd:ef4a with SMTP id adf61e73a8af0-3c0bd0207b7mr633916637.30.1783481798022;
        Tue, 07 Jul 2026 20:36:38 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:37 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:34 -0700
Subject: [PATCH v3 11/17] KVM: riscv: selftests: Add mmio test
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-11-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=7342;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=flhGK1cZlSB5RszV7FH4hbM+9rZBqj+41XqhLfCb3Wo=;
 b=7z/sq1C5QkABZJ08eLwPrGCQCGs4rIkpvETSlgM26LZdj47BbE0APnCXxkYDsFFGp+9PCA7BC
 rj0oOqSFdX/DoKumtNDJAqKygQdAEps8OnXHRd8G3BqJjiMoZGF9FAF
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043641_170220_D2DD40E4 
X-CRM114-Status: GOOD (  14.63  )
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

Use the test KVM device to validate that reads and writes to a device
are properly emulated by KVM. This test checks all load and store
instructions that are emulated by KVM.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/riscv/mmio_test.c | 189 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..07a5fc2bf67c 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -214,6 +214,7 @@ TEST_GEN_PROGS_s390 += mmu_stress_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += riscv/mmio_test
 TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/riscv/mmio_test.c b/tools/testing/selftests/kvm/riscv/mmio_test.c
new file mode 100644
index 000000000000..ea3837771a33
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/mmio_test.c
@@ -0,0 +1,189 @@
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
+test_standard_read(2, lh, lh, "")
+test_standard_read(2, lhu, lhu, "")
+test_standard_read(4, lw, lw, "")
+test_standard_read(4, c.lw, c_lw, ".option arch,+c\n")
+test_sp_read(4, c.lwsp, c_lwsp)
+
+#if __riscv_xlen == 64
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
+	unsigned long reference = (0x5555555555555555ULL >> ((sizeof(long) - len) * 8));	\
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
+	unsigned long reference = (0x5555555555555555ULL >> ((sizeof(long) - len) * 8));	\
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
+test_sp_write(8, c.sdsp, c.ldsp, c_sdsp)
+#endif
+
+static void run(void *guest_code, char *instruction)
+{
+	int fd;
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	fd = kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	virt_map(vm, (unsigned long)MMIO_TEST_REGION, MMIO_TEST_REGION, 1);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "MMIO with instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
+void test_mmio_read_sign_extension(void)
+{
+	run(test_lb, "lb");
+	run(test_lbu, "lbu");
+	run(test_lh, "lh");
+	run(test_lhu, "lhu");
+	run(test_lw, "lw");
+	run(test_c_lw, "c.lw");
+	run(test_c_lwsp, "c.lwsp");
+
+#if __riscv_xlen == 64
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
+	run(test_c_sdsp, "c.sdsp");
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
+

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
