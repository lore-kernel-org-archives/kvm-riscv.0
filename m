Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DC7C021B8
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oonv1ZpSXE7oqRd2SuzQSynJLSQbayO4LCZlstLlspY=; b=OT39/67Sz12aAL
	fbHNpZIHC3NG1aqPpQ4z6BVBRwLEL90zPAzR6FnIhyUSPd5nnI9tf3OmVPt7+eo6vYI+iuohBTYaw
	pjfI9AhvZiFQiHZEQWgiPwEAX8U7hXUlXRlmcagC88sCmHnVhJC9XeSa5miuvkAPeS5sYww+Krwxn
	NyS1kkcj2ujz6c3kDkdbycQfKGWUKOFLTKtOW83jdd5JG8OtV6WLKF/VZUmaFXoVwJxokPt8BgYoE
	DK6xjgvCkSTRgBwaThwm9lAyrw55h9htL2cctREiOlEq42qlePrqmtauS1e/vZ6Md4er5VuWG3M/9
	j31V6sdi7SRTxyeHfHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1D-00000005LF1-0NHP;
	Wed, 26 Feb 2025 20:28:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxy-00000005KRg-1rwq
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22328dca22fso2348125ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601513; x=1741206313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUL9vPYfIsBYwLRgV8qB6RCZqGNjsrfsVU1Ka6aFYBY=;
        b=kD3VJdllQQ55pUbEzMJY3nD+gu+XD+QQE+GwCdqy57QhYi1Iv+wgZqgtXDxAGDPGDo
         r2VYP3rGNhOJHGkLggDOTZZwOv2/A1oJyXb2jx/5s6bpW2m1rd5NCUlvuiYJcey2PElH
         dGyGO2SOsU+5Wud+w/VOOzXQOppCFSFbOFyApKmPZZRztao77yPAFsgXWHniz3/5IH87
         6ypiidAFKhpqbmnaw7Z4Peogkfm7W3pHA0QtSnqqJ+Yhv8wr0TteYhylidJ5UNmbYYiI
         LL1T4W6Z3jeB8XFGjrUQNWBEIIoi858ixx0mcKzQO9NF6PIdKEfKw94JpohFdv4kC8XN
         uoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601513; x=1741206313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUL9vPYfIsBYwLRgV8qB6RCZqGNjsrfsVU1Ka6aFYBY=;
        b=Bmb3CZjzqMuWIIpEZMM84dLgZ/sP/H3pBuuQB2atsIUYIVyANBxAO9kyOnIwtNUuHF
         PODluyNSs9+bMarJa2i7YFg7DjBA5tlfxHnWxfEFxH27NejgmHnTYeOyOxECGlSN87X5
         0/oKIJ3X3mygJYLAULSsPZ3lf9YCxWEpYO/xduDljo4ufoREbIwo2QKC7hq77DWTTUV/
         x6bWvKqi0UtosnoFsTJvDLZhsZa1UbIk0qccxD9qD16Xzkdp2uLeF9i+hyiGLoacbp8A
         mDi2ir1gUubvNBsOXZdkWnXYUdY5qToLbTOV2ZlU+BiUciqjR6aNSW89ewGwRe9zbJa/
         GG0A==
X-Forwarded-Encrypted: i=1; AJvYcCUA85ZdRiVe9SJKLsdUayyflBK0thgUzMIo6z7b22dZH1+MJccR05iqhmLj7+iAlZzIpEGW1TLoJR0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwshLO8mRn+ZzrY6IWUUTLxNtrIGmpeSXU5tmjmmLb/v6reGxBC
	hRC4CgZNnkLLjWt9hYjY7n3+Qyfa6VWNIxEzvT6o+KCCGYAxvUMgOCOj8cazW6g=
X-Gm-Gg: ASbGncuhVsr6KosQMjKXuSLm2vihs+4j7anY0jCmWIPS1682oj2EGIMF4WEadGeNRWZ
	sgl6QlCqo/03XylW6QtPmga0yMn36sZSRWNginu1iH2eB+sMm0G+Dps/kx9AHbsQDHqQL/FAasx
	LSIeQqP204nzGIDGrxPKfzn2/laz1Uqvop2bNjhQxIuvzfHf9bZPlYFP/oHxeWyYvcui0IgVYCt
	f5idS//7Eway4QGXVoV4M3jkLFO9EKXy8Zoh7EkCHnhHyhorsUFVG0jiObBUfd5ZyiYUjV0JMMt
	Qezn24cvodzLdmzldDVcXXtk4nlw8DdWv9jrsdw=
X-Google-Smtp-Source: AGHT+IHVxqxBZKHrXRbMLQx94rePhcj/KMG3dvOa85IKXsVDVZmW7p4O5rV92MpOYiz4YyuBZBfk6Q==
X-Received: by 2002:a05:6a00:1828:b0:732:5b10:572b with SMTP id d2e1a72fcca58-734790cbaf5mr13305359b3a.10.1740601513545;
        Wed, 26 Feb 2025 12:25:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:05 -0800
Subject: [PATCH 3/4] KVM: riscv: selftests: Change command line option
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-3-74c058c2bf6d@rivosinc.com>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
In-Reply-To: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122514_492611_2C23063C 
X-CRM114-Status: GOOD (  15.60  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 284bc80193bd..533b76d0de82 100644
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
+	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {
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
