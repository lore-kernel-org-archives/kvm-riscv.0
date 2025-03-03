Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71941C282D0
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBJNGmFUvp5S/goqu/Tf1AxB1wSdNuOEo0hrg/v2/BQ=; b=F3Q8pwKSpq8AN1
	kQyuXgs0pPCIFFxXggVIZy3Nzx0ouBgfdGTVHl48r8bv6OBbGU+etb5+BxRSOhy6dfJPgfg2OKlS5
	KY+TuDFZAw6yszB5G0A7CepO0VLy1+HAVgHsTIgeIExoykRQfWuFQXe2cfuN5dQSuVnjGf3J9/66y
	hZgnzKR7aNSVySAgC44KlvK8X/XwI/0z0SdiKZ34hFypMHF2kipolA9N4qzLaLfMHCFjgjh9wkv9V
	ZeI29DyHgsTrPhwM5HXR+wClD5ik6J53V4ncrqi/9j6T+P9pd2CtAUEhluA3ydXp+VopaIqGAZVFT
	aj1GPlXS/lZ1wZp6q8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEf2-00000002W3W-0uXV;
	Mon, 03 Mar 2025 22:53:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEey-00000002Vxv-1XvU
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22359001f1aso111368105ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042395; x=1741647195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSJ9VliM2a+aTryqldG0CH+Q28sfdpKDs8cwc/DPQU0=;
        b=SK9bzEOvlJ/WgfCCYl0a6q/GLS8bSqZ5yKU9MZ2M2HsP5v8n3WZqvu4PO7QAJLcBGO
         2rNseWsGP+YfIJjrhcnTli1S7baePrUijmOSHkFoxt4RdDQ/pHNmQzXCV6Vi11JuDfKg
         DxqJAfh5Z/DBen7g1iXt0NFtithVgmhSoAiCmya3TdytTA/zRNOOWCSMGk+o+yjqwvLQ
         OKKZjp98tmuWQbKng5p+DFhPDKXFwQPSEwipb0ZQDRXqnlnGdwPLvh4CXidbe37MFl43
         OByuxsoFtCsIj2YtdWvvW2VYMrWtzFlZOII5qezsFvhqC2FEMirQVvLULVK0cQkC3i1Z
         5aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042395; x=1741647195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSJ9VliM2a+aTryqldG0CH+Q28sfdpKDs8cwc/DPQU0=;
        b=Z2slQruSSghmzWnQ5/bvAHGCEmRd/jMhD1tppD5unazctWPVCM/zOz5wqJIEMAsYGS
         jpfVh9l6lON+AqTv/C8rfkDBlQYVDyOrDMGxlMP7z+1He6Zpy13xJuIYxIdTgeyR4j6W
         ldMJCH52fdJqmCgSpwyL9cmCIMSqK3POGGOJKDN7Z4dSwxCvfpf0e+IbWm4bfRa1HnSk
         SKqATeVSvKxRl5CxL/nT3uc4yU9eIpqC1/kpfMoUJnbYGjbuVmENGGL7i/MjHqioDUlH
         9uBNL86DRhGi6AIXxJ5sMMH/xZW2iDxBva7LhN1oiU+uRdkl6G9rVFi9sj3GucoJjkUn
         NsBg==
X-Forwarded-Encrypted: i=1; AJvYcCU2kxFOvQhPV3hdhcCxFEgncNIkD1zLF//eh4X2TxJaRJoBWbIUZawNVXLT8oymJehg1q4Lf9Rq4YU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhBVn2tJTtmYSSPtxbbiWak9bDrHf2SkvLeznLXVaPWjlTuFhR
	NtYB01q/2jaixMe03y3i5BuaFY4rl7Vrk2GUH8mhC6W0/oHnxWiaD67jY5yXaRmpzjlbXZs8wTs
	Q
X-Gm-Gg: ASbGnctga1zUOOpm0/VNQkj1DYkydFpoTpE1hXFVqoTLVUSxZTBTKwXtSZFRlBjn61l
	oIUIy3xLYlELPPuBdZsBcwh4Ivj3MBmmTx1pGru3avCuk0BYHrPr/qV+6Eptut+ZmbcvT4BXn0O
	wKvgXv21yjI5MMCUwgzDW3iThz5JtBj07IuP3ZXlixkBQBv4obHw5+8G/Gqu2Nove3ulWU81ouk
	LFUV217/ZVoUEh1Ad9+kdDKzjtl9MHPqroGV8ftgCuISPPlcTboTzTji5JDkeCkH/H6eqwi3pJB
	l+hdCQDDq0k8ejmP6fVEaxFm4dVq7cPu5ksXoYa9c0hj47cxj3iSHll4+Q==
X-Google-Smtp-Source: AGHT+IFgJxk7LwSBEIbBrY7Dr1CLOJZk/TMcnbzG8visvcRF+/r9iXWzrvGMz6kqm+x+c1jOver7mQ==
X-Received: by 2002:a05:6a00:244d:b0:736:5504:e8af with SMTP id d2e1a72fcca58-7365504e9edmr9350148b3a.24.1741042395376;
        Mon, 03 Mar 2025 14:53:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:15 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:08 -0800
Subject: [PATCH v2 3/4] KVM: riscv: selftests: Change command line option
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-3-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145316_411097_1576F40D 
X-CRM114-Status: GOOD (  15.56  )
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

The PMU test commandline option takes an argument to disable a
certain test. The initial assumption behind this was a common use case
is just to run all the test most of the time. However, running a single
test seems more useful instead. Especially, the overflow test has been
helpful to validate PMU virtualizaiton interrupt changes.

Switching the command line option to run a single test instead
of disabling a single test also allows to provide additional
test specific arguments to the test. The default without any options
remains unchanged which continues to run all the tests.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 284bc80193bd..de66099235d9 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -39,7 +39,11 @@ static bool illegal_handler_invoked;
 #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
 #define SBI_PMU_TEST_OVERFLOW	BIT(3)
 
-static int disabled_tests;
+struct test_args {
+	int disabled_tests;
+};
+
+static struct test_args targs;
 
 unsigned long pmu_csr_read_num(int csr_num)
 {
@@ -604,7 +608,11 @@ static void test_vm_events_overflow(void *guest_code)
 	vcpu_init_vector_tables(vcpu);
 	/* Initialize guest timer frequency. */
 	timer_freq = vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency));
+
+	/* Export the shared variables to the guest */
 	sync_global_to_guest(vm, timer_freq);
+	sync_global_to_guest(vm, vcpu_shared_irq_count);
+	sync_global_to_guest(vm, targs);
 
 	run_vcpu(vcpu);
 
@@ -613,28 +621,30 @@ static void test_vm_events_overflow(void *guest_code)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
-	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
+	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
 	pr_info("\t-h: print this help screen\n");
 }
 
 static bool parse_args(int argc, char *argv[])
 {
 	int opt;
-
-	while ((opt = getopt(argc, argv, "hd:")) != -1) {
+	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
+				  SBI_PMU_TEST_OVERFLOW;
+	while ((opt = getopt(argc, argv, "ht:")) != -1) {
 		switch (opt) {
-		case 'd':
+		case 't':
 			if (!strncmp("basic", optarg, 5))
-				disabled_tests |= SBI_PMU_TEST_BASIC;
+				temp_disabled_tests &= ~SBI_PMU_TEST_BASIC;
 			else if (!strncmp("events", optarg, 6))
-				disabled_tests |= SBI_PMU_TEST_EVENTS;
+				temp_disabled_tests &= ~SBI_PMU_TEST_EVENTS;
 			else if (!strncmp("snapshot", optarg, 8))
-				disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
+				temp_disabled_tests &= ~SBI_PMU_TEST_SNAPSHOT;
 			else if (!strncmp("overflow", optarg, 8))
-				disabled_tests |= SBI_PMU_TEST_OVERFLOW;
+				temp_disabled_tests &= ~SBI_PMU_TEST_OVERFLOW;
 			else
 				goto done;
+			targs.disabled_tests = temp_disabled_tests;
 			break;
 		case 'h':
 		default:
@@ -650,25 +660,27 @@ static bool parse_args(int argc, char *argv[])
 
 int main(int argc, char *argv[])
 {
+	targs.disabled_tests = 0;
+
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
-	if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_BASIC)) {
 		test_vm_basic_test(test_pmu_basic_sanity);
 		pr_info("SBI PMU basic test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_EVENTS)) {
 		test_vm_events_test(test_pmu_events);
 		pr_info("SBI PMU event verification test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
 		test_vm_events_snapshot_test(test_pmu_events_snaphost);
 		pr_info("SBI PMU event verification with snapshot test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
 		test_vm_events_overflow(test_pmu_events_overflow);
 		pr_info("SBI PMU event verification with overflow test : PASS\n");
 	}

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
