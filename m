Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A351C282C8
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZXLc0bthxdziBnUPZpPIFGovidLdOe4y4prrHq+Zao=; b=bqysuC1Q3Bfe94
	/wx/xQW0q7p3CessbIZ+ZZ3/NbudmFkSR4/cObgHciK+9zW0JZLjrUJtBCXYsSEI4dr8I0pFqO3mq
	+7vzupw5LO6BJaJE5ncPFfABm8cJho/Qj7MvlISFZOdNzw7SoFuwy4EUDJ2I0Qzy9Bj4/jvxTugP6
	MzdoipZ3X1JiN+eFud11zndY+uBF/guK+PurCeSFJ8Tqgclfz/rf0ZqzMGH5LIH1aJwxgj/cYKY4U
	BEEphW+R4UFavXDuiI/S0u8/iVYtwAVSHFZwREKDgCzdwFfSdDKGB4eFYv43v/V7mcWDhgLbXcpku
	8ZIWUwFoeu35/qeaH6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6e-00000007nLY-0OHy;
	Thu, 27 Feb 2025 14:43:20 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnekG-00000007hJM-1SEw
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:20:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oj0ZU1yb4Sth4eDbo3UsP1x6e6vIRF6qaprNpdWNgqg=;
	b=m7J4vjoNcgyizYH30tUh98oi1gv8HiovzSvu/apsmks00jpGwmScEEKWKegMWxZDFknqVS
	98/mzS8sQxIVFfLRFYKWNBKtHvo4mxxHYIRsiDEyd4qHZUccJdL76PbqyResdEVP1oGipg
	UP0YZggi8yjfEKZ9vPh/5pB9/HYQK3o=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 06/11] riscv: sbi: Improve interrupt handling cleanup
Date: Thu, 27 Feb 2025 15:19:30 +0100
Message-ID: <20250227141946.91604-19-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062012_529463_331D2BAB 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Each test should clean up after itself so following tests don't
need to worry about the current state and can just do its own
prep.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index ceeb0d8d2779..7bffaac07283 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -394,6 +394,8 @@ static void ipi_hart_wait(void *data)
 	timer_stop();
 	local_ipi_disable();
 	timer_irq_disable();
+	install_irq_handler(IRQ_S_SOFT, NULL);
+	install_irq_handler(IRQ_S_TIMER, NULL);
 
 	cpumask_set_cpu(me, &ipi_done);
 }
@@ -1395,9 +1397,6 @@ static void check_susp(void)
 	struct sbiret ret;
 	int testnum, i;
 
-	local_irq_disable();
-	timer_stop();
-
 	report_prefix_push("susp");
 
 	timer_setup(susp_timer);
@@ -1428,8 +1427,8 @@ static void check_susp(void)
 
 			if (!params.returns && ret.error == SBI_ERR_NOT_SUPPORTED) {
 				report_skip("SUSP not supported?");
-				report_prefix_popn(2);
-				return;
+				report_prefix_pop();
+				goto out;
 			} else if (!params.returns) {
 				report_fail("unexpected return with error: %ld, value: %ld", ret.error, ret.value);
 			} else {
@@ -1450,6 +1449,7 @@ static void check_susp(void)
 		report_prefix_pop();
 	}
 
+out:
 	local_irq_disable();
 	timer_teardown();
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
