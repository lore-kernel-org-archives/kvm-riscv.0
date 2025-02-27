Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912BC282C6
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J/yyl3b1vMrCsMgG5v5tonZ7UPuWlymK4JM0dVoUzk=; b=rMSiOBOXUkLkmt
	04VkiO3DE6B5T4/J4tahrJEjOiQN6Rsslc87/pSj9Fp0bhSULual5y6OtXORInuCuJvqAzeY5I74Q
	Q/aDCz5u5OW4rL5GkCvJRZBA6uLW9K9L4zqB8jzdpIOATZhpNbloBMKCxFSlUyl1SwJyqYKMuwzpx
	j66hIO0Y2YydHg0p3sbsjxLRyDACccd9AgI60yJW325W14YewlNczI4TE5O2FMlernxwmSDA4gfyb
	ufQpMTeEH3KuhI6wucFTqqI30Dem1ER1CtnbDPqzM77+7SDsb+w01HjbT50jt4jblbgTKPC4vWcGf
	RdqvQag2TV40g2xYsvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6d-00000007nLD-3FDR;
	Thu, 27 Feb 2025 14:43:19 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnekA-00000007hIh-084T
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:20:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3PeoPyIc13YEfgNMQwanehYzKuTgaJI9JL42BO8WQ0=;
	b=C3pUe268DpZs7/NNdvFYc6qumPDxRM78pAsAP0420VQOrbbI7FrWxtdWqymrMnDqgX1TmU
	H4RTzpo64OJ0GKUtWwg82ZUcFCB94HMahuaomvh5a+lGv9qSPjOBAgVpuoMe1U261yaLyG
	sC9JDzlwQ72eJ+DQEroyJpBJL6cVmhY=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 05/11] riscv: sbi: Improve susp expected error output
Date: Thu, 27 Feb 2025 15:19:29 +0100
Message-ID: <20250227141946.91604-18-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062006_221221_27546244 
X-CRM114-Status: UNSURE (   8.49  )
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

Improve the output of expected error tests. We don't use
sbiret_report_error() because we're not passing in an SBI_ERR_*
name to stringify.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index dd5cb6fa26bf..ceeb0d8d2779 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -1433,9 +1433,8 @@ static void check_susp(void)
 			} else if (!params.returns) {
 				report_fail("unexpected return with error: %ld, value: %ld", ret.error, ret.value);
 			} else {
-				report(ret.error == params.ret.error, "expected sbi.error");
-				if (ret.error != params.ret.error)
-					report_info("expected error %ld, received %ld", params.ret.error, ret.error);
+				if (!report(ret.error == params.ret.error, "got expected sbi.error (%ld)", params.ret.error))
+					report_info("expected sbi.error %ld, received %ld", params.ret.error, ret.error);
 			}
 
 			report_prefix_pop();
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
