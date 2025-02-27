Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42243C1B0FF
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5xmUZmcrD4XAqP6J5snlHZvF2B4+cHYnR+U0MMNH1g=; b=eIScErMzSUWUYk
	96jAelgnZDzxTAVUXBEFP/eUaXHWpvmiInUeWV1p+nyixQ9nD0L1GFQoeSwWicZD0WXwmsn6hPFHa
	u+B7Ahe1pfU3FTJgWymO3S+2VKjJ9FFuonIpo+OKgz4LfnUFcZ0caiE6At9neYHVXmXg484aTEdFg
	VBQgH+ttLtprk7++cGDsM9iu69zlpkd/FlMv2RbnuOk6qdTsyQLRhzioRhUtp68Pq53/21hWmN8YP
	pKgc6IRZwV6ZncfXs+nqyiG2PYu8c2JVCqFOAXNSLuNh9pfymo0yLei5q+eTcJMwpha7UYV1p4MQT
	8OqICjql8SuQRNArkyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6c-00000007nJJ-03MK;
	Thu, 27 Feb 2025 14:43:18 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnejx-00000007hBy-0nKA
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:19:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740665991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NNwa4wgppz8WuChRIaUgRF2NmxXLb64Uq4gZYXy5Mo=;
	b=hJrfRrEUIc2W2uU+gRBIlvEwLx4P9Kx+x3NVboRP8c5A7vTWC1B+1xkPNdOHrPJIBdM6Qe
	FajxY/76BPAswgAN1xWbeDDEm6Bh+x6KXxIF7t4Yw18WRl1PYKBxRxqx7bl+EvdQTV9Mx+
	ev5WO8muREz9LktKYHAUf14qL4pHSaE=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 01/11] riscv: sbi: Drop fwft upper bits test
Date: Thu, 27 Feb 2025 15:19:25 +0100
Message-ID: <20250227141946.91604-14-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_061953_379561_FECEB992 
X-CRM114-Status: UNSURE (   8.23  )
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

The test should be checking for SBI_SUCCESS and that the behavior of
feature = BIT(32) is the same as feature = 0 (MISALIGNED_EXC_DELEG).
However, enabling MISALIGNED_EXC_DELEG doesn't always lead to traps
in S-mode (the platform may support misaligned accesses and not
trap at all). Drop this upper bits of feature ID test for now.
We'll add it back with another feature that has a deterministic
behavior (such as with the ADUE feature).

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-fwft.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
index f73ae52e7397..f3408d8de081 100644
--- a/riscv/sbi-fwft.c
+++ b/riscv/sbi-fwft.c
@@ -57,21 +57,6 @@ static void fwft_check_base(void)
 	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_START);
 	fwft_check_reserved(SBI_FWFT_GLOBAL_RESERVED_END);
 
-#if __riscv_xlen > 32
-	/* Check id > 32 bits */
-	{
-		struct sbiret ret;
-
-		ret = fwft_get_raw(BIT(32));
-		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
-				    "get feature with bit 32 set error");
-
-		ret = fwft_set_raw(BIT(32), 0, 0);
-		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
-				    "set feature with bit 32 set error");
-	}
-#endif
-
 	report_prefix_pop();
 }
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
