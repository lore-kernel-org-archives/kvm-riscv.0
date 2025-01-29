Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA93C0218D
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm70WdEpb8ReBZm8tCdGsILE8qVIOSZKfUEbZ8qO40w=; b=gVsv8IgjzFqvga
	8cwSYRbKzj943aPb92W/dGuifBrLvuFuF+Ka/O/plSAReWnYQZz09V5qFc91fGQrs5suZ6osrSxNs
	QuERRARpOPnBqOh+/3K8tTOjeWoU/3ROIVxK9bFHCenhsGDCvgk0gWJ05ZrW/uZ/1GwtwrYnMSCdo
	5/n6k95wvwbdOPSmSsKQjY3f4t16ppOuwdr4GiCrdOQ/RC+mb6cY8S7bT6yw4B4/plSon1CcMKPXw
	0s3E1TiV/QGbbEgQh7nNj0r/KTHhI1bmSIsCaxWZvt5rwBZ5gst9v8BZH/7TvikUnc5H1Rr4ng41n
	W42XmYLiAVwnNtlc9ZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBSU-00000007RuM-1gey;
	Wed, 29 Jan 2025 17:02:34 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBSR-00000007Rtq-3eID
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:02:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738170149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFHW41pSdOH1Z9seM5cA80DUdnQR49XAXWp1acmUcTg=;
	b=ofhz0mWZbVwG6k8QapMPX13H+pc3GLudy0vUvLwEmfVFd7kcQ7MUsCUDOYO6iz16BFPAwk
	dsDSZqgFEsJk63u69t4uhhQYENUYaYZdzH0gOceCdWl+826MBX5efjaVOgFcfaVWUYy5MY
	uPtKaoZzFLPOZK/hss2csV4VbsWI9Y4=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com,
	cleger@rivosinc.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 2/3] riscv: sbi: Export sbiret_report/check
Date: Wed, 29 Jan 2025 18:01:41 +0100
Message-ID: <20250129170138.174222-7-andrew.jones@linux.dev>
In-Reply-To: <20250129170138.174222-5-andrew.jones@linux.dev>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090232_048986_949E2DD9 
X-CRM114-Status: UNSURE (   8.10  )
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

As more SBI tests are written not all will be in riscv/sbi.c. Export
sbiret reporting functions to be used in other SBI test files.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-tests.h | 21 +++++++++++++++++++++
 riscv/sbi.c       | 17 -----------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index ce129968fe99..2bdc9440d82d 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -33,4 +33,25 @@
 #define SBI_SUSP_TEST_HARTID	(1 << 2)
 #define SBI_SUSP_TEST_MASK	7
 
+#ifndef __ASSEMBLY__
+#include <asm/sbi.h>
+
+#define sbiret_report(ret, expected_error, expected_value, fmt, ...) ({						\
+	long ex_err = expected_error;										\
+	long ex_val = expected_value;										\
+	bool ch_err = (ret)->error == ex_err;									\
+	bool ch_val = (ret)->value == ex_val;									\
+	bool pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
+														\
+	if (!pass)												\
+		report_info(fmt ": expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",	\
+			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
+														\
+	pass;													\
+})
+
+#define sbiret_check(ret, expected_error, expected_value) \
+	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
+
+#endif /* __ASSEMBLY__ */
 #endif /* _RISCV_SBI_TESTS_H_ */
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 9f591f8ff76a..3eca8c7e35ed 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -156,23 +156,6 @@ static bool get_invalid_addr(phys_addr_t *paddr, bool allow_default)
 	return false;
 }
 
-#define sbiret_report(ret, expected_error, expected_value, fmt, ...) ({						\
-	long ex_err = expected_error;										\
-	long ex_val = expected_value;										\
-	bool ch_err = (ret)->error == ex_err;									\
-	bool ch_val = (ret)->value == ex_val;									\
-	bool pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
-														\
-	if (!pass)												\
-		report_info(fmt ": expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",	\
-			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
-														\
-	pass;													\
-})
-
-#define sbiret_check(ret, expected_error, expected_value) \
-	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
-
 static void check_base(void)
 {
 	struct sbiret ret;
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
