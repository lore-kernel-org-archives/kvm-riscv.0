Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D1FC1B0FF
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E73yOEi09nmFrNQ/7XIMGebYuqptIetq6MTxPC+10kg=; b=pADDPW9EY6UPqp
	95USv09k8nl9DbzVVj/x0rRVlJch/tUlXaFt8iKC/Nx5s7+NTVfHO/Y6gTo1JsE9xQkHx31goavc0
	hGMYZGMt6m9IGA02bAKI3BW9WRKiJtTWMk4Lok6GTYe0B6tJry4k/OXMHW9u/A6yTAhziI6vguu7y
	BY/EykUjJ2cLKk+aQ/OVECprGeVDEnRncgd3/4P7bukCsAmk0trm+6mfTquJs1BNZBLqONsbtcLrq
	74n1qKIvu0+spPllaLA8s3Dci6SGEqrnGUL+nX3emFMTSV1ePg//4iMXyPBOAjyHnydQikLwuObnu
	iUOAPjV8/zov0D/O5Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6f-00000007nNH-0rkj;
	Thu, 27 Feb 2025 14:43:21 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnemK-00000007huJ-2CE9
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:22:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9PoakR5GaHQ6JgRAx8BzE6lZfzoqOIRXwkCgBNPxb8g=;
	b=spHCme2Wa/g0w2F8IXk+EtqJWozaZG0luZkGltfCBf5LOYhxlYBMgLHcR1sIUQN02tr0Mz
	wlCdDXNr9vVSSIopFzE7jSy4PC1GmzV80IoKxjWVfQFwHNKQ0RfztuqWhILQiAS1XQgag9
	P48ZHoHqDIGPWvbVpE86a+to25kXRz0=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 08/11] riscv: sbi: HSM suspend may not be supported
Date: Thu, 27 Feb 2025 15:22:17 +0100
Message-ID: <20250227142216.102312-2-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062220_724748_05CF1133 
X-CRM114-Status: GOOD (  17.21  )
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

The spec doesn't require that any suspend types are supported and
indeed KVM doesn't support non-retentive suspend. Tolerate
SBI_ERR_NOT_SUPPORTED.

TODO: The HSM tests have lots of duplicated code and this patch
adds even more. We need to refactor them and we should break them
out into their own riscv/sbi-hsm.c file too.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 87 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 17 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 7bffaac07283..a0a8331b04bd 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -571,6 +571,8 @@ static void hart_start_invalid_hartid(void *data)
 		sbi_hsm_invalid_hartid_check = true;
 }
 
+static cpumask_t hsm_suspend_not_supported;
+
 static void ipi_nop(struct pt_regs *regs)
 {
 	ipi_ack();
@@ -587,7 +589,9 @@ static void hart_suspend_and_wait_ipi(unsigned long suspend_type, unsigned long
 	local_irq_enable();
 
 	ret = sbi_hart_suspend_raw(suspend_type, resume_addr, opaque);
-	if (ret.error)
+	if (ret.error == SBI_ERR_NOT_SUPPORTED)
+		cpumask_set_cpu(smp_processor_id(), &hsm_suspend_not_supported);
+	else if (ret.error)
 		report_fail("failed to %s cpu%d (hartid = %lx) (error=%ld)",
 			    typestr, smp_processor_id(), hartid, ret.error);
 	else if (!returns)
@@ -707,7 +711,7 @@ static void check_hsm(void)
 {
 	struct sbiret ret;
 	unsigned long hartid;
-	cpumask_t secondary_cpus_mask, mask;
+	cpumask_t secondary_cpus_mask, mask, resume_mask;
 	struct hart_state_transition_info transition_states;
 	bool ipi_unavailable = false;
 	int cpu, me = smp_processor_id();
@@ -715,7 +719,7 @@ static void check_hsm(void)
 	unsigned long hsm_timer_duration = getenv("SBI_HSM_TIMER_DURATION")
 					 ? strtol(getenv("SBI_HSM_TIMER_DURATION"), NULL, 0) : 200000;
 	unsigned long sbi_hsm_hart_start_params[NR_CPUS * SBI_HSM_NUM_OF_PARAMS];
-	int count, check;
+	int count, check, expected_count, resume_count;
 
 	max_cpus = MIN(MIN(max_cpus, nr_cpus), cpumask_weight(&cpu_present_mask));
 
@@ -879,6 +883,7 @@ static void check_hsm(void)
 		goto sbi_hsm_hart_stop_tests;
 	}
 
+	cpumask_clear(&hsm_suspend_not_supported);
 	on_cpumask_async(&secondary_cpus_mask, hart_retentive_suspend, NULL);
 
 	transition_states = (struct hart_state_transition_info) {
@@ -888,22 +893,36 @@ static void check_hsm(void)
 	};
 	count = hart_wait_state_transition(&secondary_cpus_mask, hsm_timer_duration, &transition_states);
 
-	report(count == max_cpus - 1, "all secondary harts retentive suspended");
+	expected_count = max_cpus - 1 - cpumask_weight(&hsm_suspend_not_supported);
+
+	if (expected_count != 0) {
+		if (expected_count != max_cpus - 1)
+			report_info("not all harts support retentive suspend");
+		report(count == expected_count, "supporting secondary harts retentive suspended");
+	} else {
+		report_skip("retentive suspend not supported by any harts");
+		goto nonret_suspend_tests;
+	}
+
+	cpumask_andnot(&resume_mask, &secondary_cpus_mask, &hsm_suspend_not_supported);
+	resume_count = cpumask_weight(&resume_mask);
 
 	/* Ignore the return value since we check the status of each hart anyway */
-	sbi_send_ipi_cpumask(&secondary_cpus_mask);
+	sbi_send_ipi_cpumask(&resume_mask);
 
 	transition_states = (struct hart_state_transition_info) {
 		.initial_state = SBI_EXT_HSM_SUSPENDED,
 		.intermediate_state = SBI_EXT_HSM_RESUME_PENDING,
 		.final_state = SBI_EXT_HSM_STARTED,
 	};
-	count = hart_wait_state_transition(&secondary_cpus_mask, hsm_timer_duration, &transition_states);
+	count = hart_wait_state_transition(&resume_mask, hsm_timer_duration, &transition_states);
 
-	report(count == max_cpus - 1, "all secondary harts retentive resumed");
+	report(count == resume_count, "supporting secondary harts retentive resumed");
 
+nonret_suspend_tests:
 	hart_wait_until_idle(&secondary_cpus_mask, hsm_timer_duration);
 
+	cpumask_clear(&hsm_suspend_not_supported);
 	on_cpumask_async(&secondary_cpus_mask, hart_non_retentive_suspend, NULL);
 
 	transition_states = (struct hart_state_transition_info) {
@@ -913,20 +932,32 @@ static void check_hsm(void)
 	};
 	count = hart_wait_state_transition(&secondary_cpus_mask, hsm_timer_duration, &transition_states);
 
-	report(count == max_cpus - 1, "all secondary harts non-retentive suspended");
+	expected_count = max_cpus - 1 - cpumask_weight(&hsm_suspend_not_supported);
+
+	if (expected_count != 0) {
+		if (expected_count != max_cpus - 1)
+			report_info("not all harts support non-retentive suspend");
+		report(count == expected_count, "supporting secondary harts non-retentive suspended");
+	} else {
+		report_skip("non-retentive suspend not supported by any harts");
+		goto hsm_suspend_tests_done;
+	}
+
+	cpumask_andnot(&resume_mask, &secondary_cpus_mask, &hsm_suspend_not_supported);
+	resume_count = cpumask_weight(&resume_mask);
 
 	/* Ignore the return value since we check the status of each hart anyway */
-	sbi_send_ipi_cpumask(&secondary_cpus_mask);
+	sbi_send_ipi_cpumask(&resume_mask);
 
 	transition_states = (struct hart_state_transition_info) {
 		.initial_state = SBI_EXT_HSM_SUSPENDED,
 		.intermediate_state = SBI_EXT_HSM_RESUME_PENDING,
 		.final_state = SBI_EXT_HSM_STARTED,
 	};
-	count = hart_wait_state_transition(&secondary_cpus_mask, hsm_timer_duration, &transition_states);
+	count = hart_wait_state_transition(&resume_mask, hsm_timer_duration, &transition_states);
 	check = 0;
 
-	for_each_cpu(cpu, &secondary_cpus_mask) {
+	for_each_cpu(cpu, &resume_mask) {
 		sbi_hsm_timer_fired = false;
 		timer_start(hsm_timer_duration);
 
@@ -952,15 +983,16 @@ static void check_hsm(void)
 			check++;
 	}
 
-	report(count == max_cpus - 1, "all secondary harts non-retentive resumed");
-	report(check == max_cpus - 1, "all secondary harts have expected register values after non-retentive resume");
+	report(count == resume_count, "supporting secondary harts non-retentive resumed");
+	report(check == resume_count, "supporting secondary harts have expected register values after non-retentive resume");
 
+hsm_suspend_tests_done:
 	report_prefix_pop();
 
 sbi_hsm_hart_stop_tests:
 	report_prefix_push("hart_stop");
 
-	if (ipi_unavailable)
+	if (ipi_unavailable || expected_count == 0)
 		on_cpumask_async(&secondary_cpus_mask, stop_cpu, NULL);
 	else
 		memset(sbi_hsm_stop_hart, 1, sizeof(sbi_hsm_stop_hart));
@@ -994,6 +1026,7 @@ sbi_hsm_hart_stop_tests:
 	/* Boot up the secondary cpu and let it proceed to the idle loop */
 	on_cpu(cpu, start_cpu, NULL);
 
+	cpumask_clear(&hsm_suspend_not_supported);
 	on_cpu_async(cpu, hart_retentive_suspend_with_msb_set, NULL);
 
 	transition_states = (struct hart_state_transition_info) {
@@ -1003,7 +1036,14 @@ sbi_hsm_hart_stop_tests:
 	};
 	count = hart_wait_state_transition(&mask, hsm_timer_duration, &transition_states);
 
-	report(count, "secondary hart retentive suspended with MSB set");
+	expected_count = 1 - cpumask_weight(&hsm_suspend_not_supported);
+
+	if (expected_count) {
+		report(count == expected_count, "retentive suspend with MSB set");
+	} else {
+		report_skip("retentive suspend not supported by cpu%d", cpu);
+		goto nonret_suspend_with_msb;
+	}
 
 	/* Ignore the return value since we manually validate the status of the hart anyway */
 	sbi_send_ipi_cpu(cpu);
@@ -1017,10 +1057,12 @@ sbi_hsm_hart_stop_tests:
 
 	report(count, "secondary hart retentive resumed with MSB set");
 
+nonret_suspend_with_msb:
 	/* Reset these flags so that we can reuse them for the non-retentive suspension test */
 	sbi_hsm_stop_hart[cpu] = 0;
 	sbi_hsm_non_retentive_hart_suspend_checks[cpu] = 0;
 
+	cpumask_clear(&hsm_suspend_not_supported);
 	on_cpu_async(cpu, hart_non_retentive_suspend_with_msb_set, NULL);
 
 	transition_states = (struct hart_state_transition_info) {
@@ -1030,7 +1072,14 @@ sbi_hsm_hart_stop_tests:
 	};
 	count = hart_wait_state_transition(&mask, hsm_timer_duration, &transition_states);
 
-	report(count, "secondary hart non-retentive suspended with MSB set");
+	expected_count = 1 - cpumask_weight(&hsm_suspend_not_supported);
+
+	if (expected_count) {
+		report(count == expected_count, "non-retentive suspend with MSB set");
+	} else {
+		report_skip("non-retentive suspend not supported by cpu%d", cpu);
+		goto hsm_hart_stop_test;
+	}
 
 	/* Ignore the return value since we manually validate the status of the hart anyway */
 	sbi_send_ipi_cpu(cpu);
@@ -1071,11 +1120,15 @@ sbi_hsm_hart_stop_tests:
 	report(count, "secondary hart non-retentive resumed with MSB set");
 	report(check, "secondary hart has expected register values after non-retentive resume with MSB set");
 
+hsm_hart_stop_test:
 	report_prefix_pop();
 
 	report_prefix_push("hart_stop");
 
-	sbi_hsm_stop_hart[cpu] = 1;
+	if (expected_count == 0)
+		on_cpu_async(cpu, stop_cpu, NULL);
+	else
+		sbi_hsm_stop_hart[cpu] = 1;
 
 	transition_states = (struct hart_state_transition_info) {
 		.initial_state = SBI_EXT_HSM_STARTED,
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
