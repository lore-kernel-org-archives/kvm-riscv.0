Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F3FC021B0
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAmdyaDDZIOUGkJc9678Ew1e+q54XNeC8ztBxRDorgw=; b=yjXwYIHUKbjRny
	OZXj1p33wus15ybFyvS4/dw5aJGpmChcEy20lD5qNHwaJbfswktX1ChM2KzgdOKqCGMphM5pioTUC
	I08x68LbzvxE2MREiKGhi7kFACvRhR8MwKEo9MHykbPTU/KvRhT706lXdjHaZGZdPO9bdBVzRsW2C
	xzYOisKRThUAGLI8C7MYT6ulLOGOgk2hmxdOEFJef/Synt+l5CpEamEk7AlG7IWJC7w5FYMawmSYJ
	zPl868b4pBEMuoJJgmQiHs76Mtrh6H56qfYP9elOyfpaTOcnmbXlJ1nCkJ2XOBOZyR88nHKszCNJm
	oC4z+YABaIWMI63FR2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT8t-00000009Xxt-1urX;
	Tue, 18 Feb 2025 19:20:27 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSja-00000009Rqi-0FZ4
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 18:54:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739904855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTFEVM9+TW74NpZEjUuV9VdPfLNrP5NL7pd80UPDWPU=;
	b=APvbl/RE8fqS7JPBsvMxCslAIxwgux8ShhGkn/qJE+y4FbZHc70GlOQt6NlHhiTxs1Wa+c
	WVnGfPuyJr7BpWZhO+1OQaV71Q5RXqKlpt2+p0MN13tcHEzBrPOgskfy6TeydqkinV6RHr
	0rvRnhSo/2xnllZgC6RagBUcIozf7f4=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com
Subject: [kvm-unit-tests PATCH v2 3/3] riscv: sbi: Add sbiret_report_error
Date: Tue, 18 Feb 2025 19:54:04 +0100
Message-ID: <20250218185401.41250-8-andrew.jones@linux.dev>
In-Reply-To: <20250218185401.41250-5-andrew.jones@linux.dev>
References: <20250218185401.41250-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105418_247259_3FB40903 
X-CRM114-Status: UNSURE (   9.90  )
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

sbiret_report_error() has a different PASS format than
sbiret_report(). The former will always output the stringized
expected error so the format string doesn't need to contain it, e.g.

  PASS: sbi: test foo: SBI_SUCCESS
  PASS: sbi: test event id 0x0: SBI_INVALID_PARAM

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-tests.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index 2bdc9440d82d..7a24e083a7b8 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -36,20 +36,35 @@
 #ifndef __ASSEMBLY__
 #include <asm/sbi.h>
 
-#define sbiret_report(ret, expected_error, expected_value, fmt, ...) ({						\
+#define __sbiret_report(ret, expected_error, expected_value, has_value, expected_error_name, fmt, ...) ({	\
 	long ex_err = expected_error;										\
 	long ex_val = expected_value;										\
+	bool has_val = !!(has_value);										\
 	bool ch_err = (ret)->error == ex_err;									\
 	bool ch_val = (ret)->value == ex_val;									\
-	bool pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
+	bool pass;												\
 														\
-	if (!pass)												\
+	if (has_val)												\
+		pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
+	else													\
+		pass = report(ch_err, fmt ": %s", ##__VA_ARGS__, expected_error_name);				\
+														\
+	if (!pass && has_val)											\
 		report_info(fmt ": expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",	\
 			    ##__VA_ARGS__, ex_err, ex_val, (ret)->error, (ret)->value);				\
+	else if (!pass)												\
+		report_info(fmt ": %s (%ld): received error %ld",						\
+			    ##__VA_ARGS__, expected_error_name, ex_err, (ret)->error);				\
 														\
 	pass;													\
 })
 
+#define sbiret_report(ret, expected_error, expected_value, ...) \
+	__sbiret_report(ret, expected_error, expected_value, true, #expected_error, __VA_ARGS__)
+
+#define sbiret_report_error(ret, expected_error, ...) \
+	__sbiret_report(ret, expected_error, 0, false, #expected_error, __VA_ARGS__)
+
 #define sbiret_check(ret, expected_error, expected_value) \
 	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
