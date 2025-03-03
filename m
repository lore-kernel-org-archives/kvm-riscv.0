Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E6C282C6
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhg5kS4Wh9ZeVRCIwOn5os/ZiLxRGmrgZth/VO5D+fc=; b=RUXtlqANvB/BE3
	Q0ib7NJwZ9r/Ioif61der9vMgnLxos5gTNfV3fd8HhTGs0idW0uFBdQugphCzGHh8eDsBLBzY1uKP
	Y+VX4T6r0gqCSre/hq2S61O6aZOG4/nz3dwjqZpOwAfF4IdwNrVhRLXBl8Urg8p8LCOCKzOxDhyYr
	fEUK+LMzPSpZ4t/nyesBn/9CJo7DeX5twSwED0v6gmzxGY+2G8oh1A553H6d2r5UHqAtAueVaMeAe
	okHkHa8iZmW/A5gcb9Z4+LR4CuQWlDvbqDNdX92VB6hS/bczKeCkooQ6yL1ZJtukgCS4RBihRsn2D
	3lI66ZagpurUgvNRozjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEf3-00000002W4o-15Cd;
	Mon, 03 Mar 2025 22:53:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEez-00000002Vyx-0pEG
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2237cf6a45dso43570295ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042396; x=1741647196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCtM/lSFNLHVQ6KX2EDg2QNHrviALMnTGfDgB4f3TXM=;
        b=APO4lA1h0JMF3lbAiQ8LnpidI5BNQEzg1QwjC+jmIvdd0/IM8PtxqZC4GY9f8x663k
         9scuMy7suZllFKETQkFGzYsYUpePLnGJRi5IKoYllEij8PCl5W9X7dCMjoQ4CARll3n0
         Q1OTTzfFLRmPcxM1/XPyE7OZaC5c9HHwNQBd5NFgvhk3hIcCWQxDr8C/SOMsQbNV7OBH
         QYkf5wlknRvsxZOzSIpkcFxNhZP4fhXcyrKGJeanxeGLaFbXnrjnXb6u9WllA5Q+y0Q9
         /3o8OYBcTb44q8DmB12CeqORyZdE1QN8e6pQFIsWWMuAa2IkP7kLd9S/1mwqQdL1478k
         VkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042396; x=1741647196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCtM/lSFNLHVQ6KX2EDg2QNHrviALMnTGfDgB4f3TXM=;
        b=vt9/9kRKHd+67m8hGDN1r+0LPI7FIJIQQ53XnXOs77Xre37AiVEf3c1Otc6v7rDdua
         ribpKyyTmVZriNtlegnTxseVjd6ZnXLUWGAqhjnGpzRIvzaW4Lj+WpgaVPCd0/C+X3eE
         IkXGXY5kw0++fPME6MmmWc7lI1uzAHtgeCig1veoEOKZ09yGKIDDTwMFTcB5iOele43S
         ZmQ/TvXADMaQf8BarkHjQGlpbhA+A/fIx8CiBsI/ATBTF7IH1GsuZyoXTIPopOVzi1hA
         IpPBxN80JTqRNec5EUPCDjYo/ZUZ+mBNXr06vkmcCti8IhYQYPlBlNuKOtTEnC4OSKny
         xIFg==
X-Forwarded-Encrypted: i=1; AJvYcCXPTnqpl/BA/l1ECrpQx5A5RX2Gr95ymyJmin7S4+qV6ZGIFnih/GF/wrcyolB+gz2KwJHXpcowk/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAAcEXfKTJFB2+gnNhl4emelwtJg54F4egu7+5tXWgRHhZqF83
	olzkuqor/bj1KmvPrSZPou4ZJ+bPClzuGdkNmo3LKuU5k7p+IkQ+WytP1tSDgSaH47r/p1wETxb
	y
X-Gm-Gg: ASbGncvDgHwBOTEQsz9YUL9FiEs7TRl0ldhIdDcMJG7LEZdsB8M8H/q0+dhdrLG/nwE
	maxkRv69OYWKe1dTBvTScH4aEA5R7MvUZTxVJ3v3Hs3Lct5FPSEuCi6tIQlCg7/7sogfWlw6s+c
	/XFGPS+hnsbIlM3sCBXRvH+AFggVPCT+yeVcxl0HJkhz6iXg516m94Gletn/XYvzb5BO/9tMUWs
	QhX+fL0/n9aPARWB0jMxpcWoX/XawQPZZpL0Azy5t+Cwaf3MJkqXQN3CVkgOQYDJvQQemSePBef
	DIGCZlb8pyfPLYChEYkYT/JLIIXQ5jZDzDw34f4sSiTKMaF+Xm4Ub9arBg==
X-Google-Smtp-Source: AGHT+IGXirVkG7YmM+e3F/UoJqVCuA4YUPHtWRuh1VU5G5YFfQvPrt0/VrZAaOMzGSWX8Cr6YTAmAg==
X-Received: by 2002:a05:6a00:92a1:b0:736:3ed1:e842 with SMTP id d2e1a72fcca58-7363ed1ec20mr10954047b3a.20.1741042396365;
        Mon, 03 Mar 2025 14:53:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:09 -0800
Subject: [PATCH v2 4/4] KVM: riscv: selftests: Allow number of interrupts
 to be configurable
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-4-41d177e45929@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250303_145317_259549_AEC64398 
X-CRM114-Status: GOOD (  17.64  )
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

It is helpful to vary the number of the LCOFI interrupts generated
by the overflow test. Allow additional argument for overflow test
to accommodate that. It can be easily cross-validated with
/proc/interrupts output in the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 38 +++++++++++++++++++-----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index de66099235d9..03406de4989d 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -39,8 +39,10 @@ static bool illegal_handler_invoked;
 #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
 #define SBI_PMU_TEST_OVERFLOW	BIT(3)
 
+#define SBI_PMU_OVERFLOW_IRQNUM_DEFAULT 5
 struct test_args {
 	int disabled_tests;
+	int overflow_irqnum;
 };
 
 static struct test_args targs;
@@ -478,7 +480,7 @@ static void test_pmu_events_snaphost(void)
 
 static void test_pmu_events_overflow(void)
 {
-	int num_counters = 0;
+	int num_counters = 0, i = 0;
 
 	/* Verify presence of SBI PMU and minimum requrired SBI version */
 	verify_sbi_requirement_assert();
@@ -495,11 +497,15 @@ static void test_pmu_events_overflow(void)
 	 * Qemu supports overflow for cycle/instruction.
 	 * This test may fail on any platform that do not support overflow for these two events.
 	 */
-	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
-	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
+	for (i = 0; i < targs.overflow_irqnum; i++)
+		test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
+
+	vcpu_shared_irq_count = 0;
 
-	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
-	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
+	for (i = 0; i < targs.overflow_irqnum; i++)
+		test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
 
 	GUEST_DONE();
 }
@@ -621,8 +627,11 @@ static void test_vm_events_overflow(void *guest_code)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
+	pr_info("Usage: %s [-h] [-t <test name>] [-n <number of LCOFI interrupt for overflow test>]\n",
+		name);
 	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("\t-n: Number of LCOFI interrupt to trigger for each event in overflow test (default: %d)\n",
+		SBI_PMU_OVERFLOW_IRQNUM_DEFAULT);
 	pr_info("\t-h: print this help screen\n");
 }
 
@@ -631,7 +640,9 @@ static bool parse_args(int argc, char *argv[])
 	int opt;
 	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
 				  SBI_PMU_TEST_OVERFLOW;
-	while ((opt = getopt(argc, argv, "ht:")) != -1) {
+	int overflow_interrupts = 0;
+
+	while ((opt = getopt(argc, argv, "ht:n:")) != -1) {
 		switch (opt) {
 		case 't':
 			if (!strncmp("basic", optarg, 5))
@@ -646,12 +657,24 @@ static bool parse_args(int argc, char *argv[])
 				goto done;
 			targs.disabled_tests = temp_disabled_tests;
 			break;
+		case 'n':
+			overflow_interrupts = atoi_positive("Number of LCOFI", optarg);
+			break;
 		case 'h':
 		default:
 			goto done;
 		}
 	}
 
+	if (overflow_interrupts > 0) {
+		if (targs.disabled_tests & SBI_PMU_TEST_OVERFLOW) {
+			pr_info("-n option is only available for overflow test\n");
+			goto done;
+		} else {
+			targs.overflow_irqnum = overflow_interrupts;
+		}
+	}
+
 	return true;
 done:
 	test_print_help(argv[0]);
@@ -661,6 +684,7 @@ static bool parse_args(int argc, char *argv[])
 int main(int argc, char *argv[])
 {
 	targs.disabled_tests = 0;
+	targs.overflow_irqnum = SBI_PMU_OVERFLOW_IRQNUM_DEFAULT;
 
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
