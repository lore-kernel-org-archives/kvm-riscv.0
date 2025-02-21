Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76312C021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0maISAdigazgkTea8YXMbx8sJUGODBXzVrfoxtDHpT8=; b=Dwf1QJhxMv7aUB
	NBAn/1txljtlmnNrzWqvMZVAHJH5Qu+lURcfqPuBvTdOT36dQz3Eqdd7Bn3Eh80xRpPelvvJKaooA
	tdM1ERqdIztJmXDCPhk5KV6WJvx7YRNSM92UAkvlnPbP5ECNDPtU2wKcvWka979g4juxQNxukIyke
	Gd0eB0h3P/Ig1JmaUSMrGtW/+Z4o/1Aqd0iHXezE+ufIo+QpE0fAPYmrJ8kzzMWu1wox3od1OfBba
	+6fn6tZYsdZWrkH76/E7HZUcRSpkSGe9HKqRgcCn3ep+XvCR3+MZ9q0+q0TwGkrLxQV22VwFKEwpo
	/e2h0oRb9ZoeyebMYjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNZ-000000063db-0uCp;
	Fri, 21 Feb 2025 15:55:53 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNV-000000063aF-40Yg
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSjq5PpScF/AP5b856TyqTjuNPqfMh7IkiOPfI4hx/w=;
	b=c8GwRLUnPr+ZVzg3/GP69ur3wsxNB2qJUwvbMiv26xFP1lavh7TbCdz9Zg5wvbjqy1u6Wm
	/CG4OJhnXjNg3DJvtivpPvAsob4nlpDeHwEwVr3RYnXpk2xm7+Bh3NXcgf9oSTTtkcQeWd
	EIGVx0miT4ZUBdKjm0wi0Q96KPsvTwU=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 03/10] riscv: sbi: Ensure SUSP test gets an interrupt
Date: Fri, 21 Feb 2025 16:55:37 +0100
Message-ID: <20250221155533.123418-15-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075550_287322_4CC020DA 
X-CRM114-Status: GOOD (  13.54  )
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

A system suspend may call WFI. Set a periodic timer to ensure we get
an interrupt and don't hang forever.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-tests.h |  2 ++
 riscv/sbi.c       | 70 ++++++++++++++++++++++++++++++-----------------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index 7a24e083a7b8..7c7fe30541e4 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -19,12 +19,14 @@
 #define SBI_SUSP_HARTID_IDX	2
 #define SBI_SUSP_TESTNUM_IDX	3
 #define SBI_SUSP_RESULTS_IDX	4
+#define SBI_SUSP_NR_IDX		5
 
 #define SBI_CSR_SSTATUS_IDX	0
 #define SBI_CSR_SIE_IDX		1
 #define SBI_CSR_STVEC_IDX	2
 #define SBI_CSR_SSCRATCH_IDX	3
 #define SBI_CSR_SATP_IDX	4
+#define SBI_CSR_NR_IDX		5
 
 #define SBI_SUSP_MAGIC		0x505b
 
diff --git a/riscv/sbi.c b/riscv/sbi.c
index d7bf758e23fb..dd5cb6fa26bf 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -158,6 +158,19 @@ static bool get_invalid_addr(phys_addr_t *paddr, bool allow_default)
 	return false;
 }
 
+static void timer_setup(void (*handler)(struct pt_regs *))
+{
+	install_irq_handler(IRQ_S_TIMER, handler);
+	timer_irq_enable();
+}
+
+static void timer_teardown(void)
+{
+	timer_irq_disable();
+	timer_stop();
+	install_irq_handler(IRQ_S_TIMER, NULL);
+}
+
 static void check_base(void)
 {
 	struct sbiret ret;
@@ -534,18 +547,6 @@ static void hsm_timer_irq_handler(struct pt_regs *regs)
 	sbi_hsm_timer_fired = true;
 }
 
-static void hsm_timer_setup(void)
-{
-	install_irq_handler(IRQ_S_TIMER, hsm_timer_irq_handler);
-	timer_irq_enable();
-}
-
-static void hsm_timer_teardown(void)
-{
-	timer_irq_disable();
-	install_irq_handler(IRQ_S_TIMER, NULL);
-}
-
 static void hart_check_already_started(void *data)
 {
 	struct sbiret ret;
@@ -753,7 +754,7 @@ static void check_hsm(void)
 
 	cpumask_copy(&secondary_cpus_mask, &cpu_present_mask);
 	cpumask_clear_cpu(me, &secondary_cpus_mask);
-	hsm_timer_setup();
+	timer_setup(hsm_timer_irq_handler);
 	local_irq_enable();
 
 	/* Assume that previous tests have not cleaned up and stopped the secondary harts */
@@ -975,7 +976,7 @@ sbi_hsm_hart_stop_tests:
 
 	if (__riscv_xlen == 32 || ipi_unavailable) {
 		local_irq_disable();
-		hsm_timer_teardown();
+		timer_teardown();
 		report_prefix_pop();
 		return;
 	}
@@ -1084,7 +1085,7 @@ sbi_hsm_hart_stop_tests:
 	report(count, "secondary hart stopped after suspension tests with MSB set");
 
 	local_irq_disable();
-	hsm_timer_teardown();
+	timer_teardown();
 	report_prefix_popn(2);
 }
 
@@ -1215,6 +1216,12 @@ static void check_dbcn(void)
 void sbi_susp_resume(unsigned long hartid, unsigned long opaque);
 jmp_buf sbi_susp_jmp;
 
+#define SBI_SUSP_TIMER_DURATION_US 500000
+static void susp_timer(struct pt_regs *regs)
+{
+	timer_start(SBI_SUSP_TIMER_DURATION_US);
+}
+
 struct susp_params {
 	unsigned long sleep_type;
 	unsigned long resume_addr;
@@ -1226,9 +1233,17 @@ struct susp_params {
 static bool susp_basic_prep(unsigned long ctx[], struct susp_params *params)
 {
 	int cpu, me = smp_processor_id();
+	unsigned long *csrs;
 	struct sbiret ret;
 	cpumask_t mask;
 
+	csrs = (unsigned long *)ctx[SBI_SUSP_CSRS_IDX];
+	csrs[SBI_CSR_SSTATUS_IDX] = csr_read(CSR_SSTATUS);
+	csrs[SBI_CSR_SIE_IDX] = csr_read(CSR_SIE);
+	csrs[SBI_CSR_STVEC_IDX] = csr_read(CSR_STVEC);
+	csrs[SBI_CSR_SSCRATCH_IDX] = csr_read(CSR_SSCRATCH);
+	csrs[SBI_CSR_SATP_IDX] = csr_read(CSR_SATP);
+
 	memset(params, 0, sizeof(*params));
 	params->sleep_type = 0; /* suspend-to-ram */
 	params->resume_addr = virt_to_phys(sbi_susp_resume);
@@ -1352,19 +1367,11 @@ static bool susp_one_prep(unsigned long ctx[], struct susp_params *params)
 
 static void check_susp(void)
 {
-	unsigned long csrs[] = {
-		[SBI_CSR_SSTATUS_IDX] = csr_read(CSR_SSTATUS),
-		[SBI_CSR_SIE_IDX] = csr_read(CSR_SIE),
-		[SBI_CSR_STVEC_IDX] = csr_read(CSR_STVEC),
-		[SBI_CSR_SSCRATCH_IDX] = csr_read(CSR_SSCRATCH),
-		[SBI_CSR_SATP_IDX] = csr_read(CSR_SATP),
-	};
-	unsigned long ctx[] = {
+	unsigned long csrs[SBI_CSR_NR_IDX];
+	unsigned long ctx[SBI_SUSP_NR_IDX] = {
 		[SBI_SUSP_MAGIC_IDX] = SBI_SUSP_MAGIC,
 		[SBI_SUSP_CSRS_IDX] = (unsigned long)csrs,
 		[SBI_SUSP_HARTID_IDX] = current_thread_info()->hartid,
-		[SBI_SUSP_TESTNUM_IDX] = 0,
-		[SBI_SUSP_RESULTS_IDX] = 0,
 	};
 	enum {
 #define SUSP_FIRST_TESTNUM 1
@@ -1393,6 +1400,10 @@ static void check_susp(void)
 
 	report_prefix_push("susp");
 
+	timer_setup(susp_timer);
+	local_irq_enable();
+	timer_start(SBI_SUSP_TIMER_DURATION_US);
+
 	ret = sbi_ecall(SBI_EXT_SUSP, 1, 0, 0, 0, 0, 0, 0);
 	report(ret.error == SBI_ERR_NOT_SUPPORTED, "funcid != 0 not supported");
 
@@ -1402,6 +1413,8 @@ static void check_susp(void)
 		ctx[SBI_SUSP_TESTNUM_IDX] = i;
 		ctx[SBI_SUSP_RESULTS_IDX] = 0;
 
+		local_irq_disable();
+
 		assert(susp_tests[i].prep);
 		if (!susp_tests[i].prep(ctx, &params)) {
 			report_prefix_pop();
@@ -1411,6 +1424,8 @@ static void check_susp(void)
 		if ((testnum = setjmp(sbi_susp_jmp)) == 0) {
 			ret = sbi_system_suspend(params.sleep_type, params.resume_addr, params.opaque);
 
+			local_irq_enable();
+
 			if (!params.returns && ret.error == SBI_ERR_NOT_SUPPORTED) {
 				report_skip("SUSP not supported?");
 				report_prefix_popn(2);
@@ -1428,12 +1443,17 @@ static void check_susp(void)
 		}
 		assert(testnum == i);
 
+		local_irq_enable();
+
 		if (susp_tests[i].check)
 			susp_tests[i].check(ctx, &params);
 
 		report_prefix_pop();
 	}
 
+	local_irq_disable();
+	timer_teardown();
+
 	report_prefix_pop();
 }
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
