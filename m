Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA6C021B5
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIimmPy1dpp5xKX2CvxYdct8eJvy1+ddo3PUGYGpjew=; b=BwQupccgdD3Szu
	Aw/bEn0xQjtQKJG6M90XQ2n4X7UvZ3JIau9a/orQlaSqUCyk+zj4T2Ug00TY5ihFxsGv268ux2KmV
	bZheZnmSvG9lERLM4aKdANGlpmY0wNf8HD/CsB65nD/g1PzeNNtaaueF2js+VEa0EZdgL/zkjrbVy
	p04WMTCiJ5PyGef+FmKjjGB1xVUiUuc7QZMJTX4hliAuy5xgCDK6/pcvWmXI/RDlvc/pFB11YUctk
	IC/MXUqam0nfTj/+l8KQX3iXa/4RBe6YvcnLapVkeM1dJbyppcPd0gloERTBstYJ4xpsMOVvwY13X
	oZMYaaKRndRYHzuvS1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNm-000000063kw-3sZk;
	Fri, 21 Feb 2025 15:56:06 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNj-000000063jF-1VaS
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:56:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41hy5nOmnE5UpOW5ZzQwfqkJnNPaMBzXlc81F3q3/3w=;
	b=EBVIpchSG+WUNtJc7OeiSfco3NkEFHMyuOWlq+xJZrLa9uf4pJ1pSuZ5LwuQzBL/+7a0Hp
	pumFgaq8oARsrS0R5go4u7oAgQ6q6946tRbcfBRa6o/JcY4dr7iM9KaTnHtkSWqN7iiyEn
	LzmNuPzThg1BGM3UmhpYdXwj97UbqYo=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 08/10] riscv: sbi: Probe/skip SUSP
Date: Fri, 21 Feb 2025 16:55:42 +0100
Message-ID: <20250221155533.123418-20-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075603_540318_1420A6FE 
X-CRM114-Status: UNSURE (   7.67  )
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

Cleanly skip testing suspend when the SUSP extension isn't available.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index a0a8331b04bd..e5f6e1c72ae6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -1452,6 +1452,12 @@ static void check_susp(void)
 
 	report_prefix_push("susp");
 
+	if (!sbi_probe(SBI_EXT_SUSP)) {
+		report_skip("SUSP extension not available");
+		report_prefix_pop();
+		return;
+	}
+
 	timer_setup(susp_timer);
 	local_irq_enable();
 	timer_start(SBI_SUSP_TIMER_DURATION_US);
@@ -1479,7 +1485,7 @@ static void check_susp(void)
 			local_irq_enable();
 
 			if (!params.returns && ret.error == SBI_ERR_NOT_SUPPORTED) {
-				report_skip("SUSP not supported?");
+				report_fail("probing claims support, but it's not?");
 				report_prefix_pop();
 				goto out;
 			} else if (!params.returns) {
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
