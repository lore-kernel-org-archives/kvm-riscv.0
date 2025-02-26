Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A0BC19776
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zD0A7Dj9+iur7Qb/MHWYTp9GJ4mINfsoCUVHUTvL1Xw=; b=AYY9DJZCURlQhP
	/vaSLggRy/qo3fcBiCTTfS5dMOXG02SUKfBNO3W92lVWbRYx7clCy2xNEhT+ayfYtmvXWNxCsDPjY
	nWMjFkpbFFdbumObJcSov5gcHi6bP6fpKxO/lYtAzaefuilY3X2PMsroeMKk4jb9dr3CZamvF+Srj
	JGpr2gyOqpcEgl0NjdJDKc+tq3BjS2PQzy+9wzSPYYdod6yQaxuO0FEfaFAERsnDPgGZB1/naQLgF
	n48UV7HvnOv9owtBvkjYjavZ4iih2ytDVdw+n4eiCGD+Xcd27cFQHz5qUgIkpdhtUA+MfvB8sy0lD
	Ppi1a3MgH7eurN/6pA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1E-00000005LHC-3bW9;
	Wed, 26 Feb 2025 20:28:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxz-00000005KSU-1gye
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22349bb8605so3534605ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601514; x=1741206314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+xf5rb3O3ZrwcS1pmKysmwXefhXbLuGjQJfAu9gHOI=;
        b=dXeIdpkCePzWenDydTTLOy7FUhFTAR9lXw83tlUuwbuXzMtyJoXoq/FqZeinDZQ0Gv
         lvb16e2gkbyNYqmQg2ryNJAi1wLMUIc8AuYWk72tTTo7K7z2dU2bqKq6SjA2Wwa5dye+
         uBVOulcSfOFxa7Hc2n2Bx3xjbrvIZOhaDT2/U8NOMtLHJhdeIpQHjyz/RB/XZAB0Q8Pf
         AEwut6THsLtCrxaVtxSAbYCTz17IRTCce10tdVAPa/6h43dNS4K/TB37tTAqjxmdga+5
         dttFo8PG/xGP2o2h9CSaE5acnVZe1zLNiNTK6Zssejbl4JT/c6ycSnSXOHkMswjNTWH1
         Y2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601514; x=1741206314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+xf5rb3O3ZrwcS1pmKysmwXefhXbLuGjQJfAu9gHOI=;
        b=GhOlMUcKzUW84CGnk2gU/BvOq+qPvKpw1qyYLpM4MZwDjV/l0cb3R0SIBjnJii/fLx
         76R8+oGwtGscastN1OBs6VhcUNIUM/f5h8dSseGcRyqcA12skS5lBvaW9I8tJ4I1BwPO
         eHM6dyWaFhMBy0YQMhNGkhW6mygGAwl++Jrw7RvsqrQG3UQ7hD2qGOk8KdOotOhF/x1x
         7L0UtZpGmbUFrJqj8tBj4jlpNZAgZSMQb+stYMkVgBcnmmlrFW3nHuTj/QbTbo1b6699
         S6FhF6CTdYZ/H+FL/lSC7vW8kgiXqwSL3cmbM3CadW3eeqzP39vbwE63VLGbKRjDkkHe
         Rhvg==
X-Forwarded-Encrypted: i=1; AJvYcCUS60ignlPrTzZoq9EnfJAG9fY1XryJAibJfGAIE0RtK6aCq92/ARfKmiSoe09o3DGLvSse999aBhI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+KVPRybO+ZKWY+VQzrobm2nUuvSgwLwZ95gH4vkLbyx0AdPJI
	HlTPDHbvdyUv5twO2wBzLRZc6/EZ/GjME5x1EvgDIK0ltYkncdATq7Q59r3C+9E=
X-Gm-Gg: ASbGncuHb+hljnnpe8w5Ho+DsAabQED9/oWQvAArdSZulgkuPcq/rfd1B696B36k+/k
	07NVXCbbY9iRhCu5zIIAfGk0HXXyfnfi//x+w/84SrbtMGeHLM0Bj4roDk6PrBYBFuG7S2b3fAS
	qiy8ZqH+QLJ0DolcyopC92ZbVzwNrFjMKmk/zy9821Zpwpyv6E5mL/cA8Sv3IGRp0E4kCEW80jP
	Sp3wuKdMnOTeqeh/PiBzNoeXYFfpRJHrS3M7cRX4FEshAw9a92zTPoaYF2p9WXCO4mnSHA4VHM2
	EGKfOTkhT+9j3yI0zpLG5kWRKwG1u9f1LIyDk00=
X-Google-Smtp-Source: AGHT+IHw0vBB+PSny2qMliUf6DTVa+ZvGcPh/rPnK0tt+c9UR1fNAKJeSn8VDRagyarmbZCnK8Ejgg==
X-Received: by 2002:a05:6a00:a26:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-734791aa184mr14536500b3a.20.1740601514558;
        Wed, 26 Feb 2025 12:25:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:14 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:06 -0800
Subject: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250226_122515_440624_311A03E0 
X-CRM114-Status: GOOD (  18.19  )
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
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 36 ++++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 533b76d0de82..7c273a1adb17 100644
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
 
@@ -631,6 +640,8 @@ static bool parse_args(int argc, char *argv[])
 	int opt;
 	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
 				  SBI_PMU_TEST_OVERFLOW;
+	int overflow_interrupts = -1;
+
 	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {
 		switch (opt) {
 		case 't':
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
