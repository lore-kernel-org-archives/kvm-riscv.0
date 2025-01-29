Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A2C0218D
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL1xDNyqPkUyVtU+7Xl6bxIsASdwGNjzv13v6oTYQWE=; b=KwLr4bn6dmI9eG
	XcyEGyVWvcXB9zcLKWboZXF0w1DxxwAb8eHnhrFJ03zh+nJYf5JqwB12qPYwXrLTrefTZUTsms4OP
	uXWkVtAdwlR4ZWLy1wvCVND5sHTpPGh5ZDKCXEZXH8qdEFHAhEYDnvTIRg2HXIbpxMc6r0D3cSXME
	EDm32UOLXHH2VDZq2Ln3AY8ilpntuhg3Mg9y19b6d/9WSPxqiO13fx4htLRiVBhi2dt4Ulx/5ePiT
	qPmqYf0HdoY7mBExdhC11/KGDpvSNj1y3IMHNaWKM1PGBcIOZsqN4SNpDmmDL4GAgXJBivPCsZqzp
	1uVzvd6eUzrJmo6dkAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBSa-00000007RvY-2vgV;
	Wed, 29 Jan 2025 17:02:40 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBSZ-00000007Rv3-0Ein
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:02:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738170157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IyvNulkUYzz49vwGOQKL0P4z47Mn0/BksoYuJv3PwQM=;
	b=YmSly3saHIDuP5otR8x99/GW00kazHWyi1PILymOQSbuODiGeWU3RxGyz1dLwnfZfyd7dj
	UyJhN0hAsc0D7QeZEoqwcsl87ZVt7TWbwVniF/hRebqwzZlHpqOG+WquG+o0RX4UcGF5Xk
	tYkA7RHP8T2carc8SC2NS5bj2M4i3vk=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com,
	cleger@rivosinc.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 3/3] riscv: sbi: Add sbiret_report_error
Date: Wed, 29 Jan 2025 18:01:42 +0100
Message-ID: <20250129170138.174222-8-andrew.jones@linux.dev>
In-Reply-To: <20250129170138.174222-5-andrew.jones@linux.dev>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090239_238324_AC5B98F8 
X-CRM114-Status: UNSURE (   8.13  )
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

An sbiret value may be unspecified in the case of errors, and even in
the case of success when the function doesn't return anything.
Provide an sbiret report function that only checks sbiret.error.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-tests.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index 2bdc9440d82d..f6e646a79dbe 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -36,20 +36,29 @@
 #ifndef __ASSEMBLY__
 #include <asm/sbi.h>
 
-#define sbiret_report(ret, expected_error, expected_value, fmt, ...) ({						\
+#define __sbiret_report(ret, expected_error, expected_value, has_value, fmt, ...) ({				\
 	long ex_err = expected_error;										\
 	long ex_val = expected_value;										\
 	bool ch_err = (ret)->error == ex_err;									\
 	bool ch_val = (ret)->value == ex_val;									\
-	bool pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
+	bool pass = report(ch_err && (!(has_value) || ch_val), fmt, ##__VA_ARGS__);				\
 														\
-	if (!pass)												\
+	if (!pass && (has_value))										\
 		report_info(fmt ": expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",	\
 			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
+	else if (!pass)												\
+		report_info(fmt ": expected (error: %ld), received: (error: %ld)",				\
+			    ##__VA_ARGS__, ex_err, (ret)->error);						\
 														\
 	pass;													\
 })
 
+#define sbiret_report(ret, expected_error, expected_value, ...) \
+	__sbiret_report(ret, expected_error, expected_value, true, __VA_ARGS__)
+
+#define sbiret_report_error(ret, expected_error, ...) \
+	__sbiret_report(ret, expected_error, 0, false, __VA_ARGS__)
+
 #define sbiret_check(ret, expected_error, expected_value) \
 	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
