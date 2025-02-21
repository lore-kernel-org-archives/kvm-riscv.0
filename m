Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E7C021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZXLc0bthxdziBnUPZpPIFGovidLdOe4y4prrHq+Zao=; b=JtX2cJ9Xpj3FF0
	wzV6mpe6MrMrGNDKL9nuI7waSsvihMVJcv8LbEkvauZM7LHmCILgXFukFKNMKoW13lUBaa/RyCzJ7
	1ETDQfQBZfSi7//tYG1f0I1E2C+rqkYLJVl0v/sLyQd/+kLcfquOuD2yN3ttOtsd9va+45bGJZWX9
	zxabeRWaVx2rdJcZh8kiIEksGz63KXnQXC4pMTJq3LM7gRwZl+Nhwbkr/SBxY9nQfK9oXPuWxLdsN
	xXtUEaGv2JwSZZ49F+mxjBRUXnc0aliuEvEBcQMWwDO+vcFgnzfyCrlTrk5+IUs9qaUlfOshvonZr
	NKmVlnyrRr4G3NqF+Cpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNd-000000063gk-0D2M;
	Fri, 21 Feb 2025 15:55:57 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNa-000000063dW-38Bu
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oj0ZU1yb4Sth4eDbo3UsP1x6e6vIRF6qaprNpdWNgqg=;
	b=DzvGsDsf6/MNhMM4q/nTYLoQYHX8gW7uQyABn9Yrwm9aKfLLBMpqWB2Tp/bxCPvRAis2n1
	kXkIX+vgqEXMCl3bXnPImGuDj6T7JjK40ps48TKQ9nbVvgIniJPYrgd1rA9w7wDVNkwD1c
	++6oQ14Y7H2g5il1qHmDIU+vFp5mv+M=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 05/10] riscv: sbi: Improve interrupt handling cleanup
Date: Fri, 21 Feb 2025 16:55:39 +0100
Message-ID: <20250221155533.123418-17-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075554_927903_40A61EAC 
X-CRM114-Status: UNSURE (   9.75  )
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
