Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F24DC02193
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyn8vGsGAiVkBgG8rnhlYDu1g5/O7o2ImYvaGcwVA7Q=; b=JaZ7dxTUe/Czkb
	SZIO+izQCaqNQuMGLWSY8ZxIi5ZfNyl7GdztWMLq647T4mDjwGP0zD1XbGL0MshljGUvpoDA/A6xB
	fLUhvYfisCN+RkBbsxiwb0bwEpGAdJnFKB1wxFGYY7EH4A2o5yPaM1FCA0c2kmr/Wk7KRzQqgbRRI
	TBCXaufp8Gw3sE5ynDW/IzMFbMt8gMHEm8MXpxrXJYQ+CKbjHk6z5D8W+qm1wqRX5CSg7ZlPX9HIv
	bm+yzKUYXSImzRXNNLCQS8DzmTuNBdI1yTp29lFIAPcqpDeyN/wevBT1t4anOzIUncG6W3qxzPyFj
	K1Gr5l/o6MnTNS1wxTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBRl-00000007Rqv-04C8;
	Wed, 29 Jan 2025 17:01:49 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBRh-00000007Roy-3js1
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:01:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738170103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bLigEkSWtR8ZYPXRjj83A3BRSZlPsBzFx3+Knxy+/E=;
	b=QmPmwL2fLCNtfwOvVSWSx7TqFZnAn0+FoXNM58hw21m1tUf1pPEIjsVLZb/wUnYWg1IMBg
	SJq6cemMgOONaAI/iv7RtQSlyTiyeMeeKmPpKe8EqP0cQYR4skIMYVQk86FfUGdqrzL2ml
	16aT6vnhCDHs/9ThNeH3Tbs7loZHeVY=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: jamestiotio@gmail.com,
	cleger@rivosinc.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 1/3] riscv: sbi: Improve gen_report
Date: Wed, 29 Jan 2025 18:01:40 +0100
Message-ID: <20250129170138.174222-6-andrew.jones@linux.dev>
In-Reply-To: <20250129170138.174222-5-andrew.jones@linux.dev>
References: <20250129170138.174222-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090146_217915_76F7875D 
X-CRM114-Status: UNSURE (   9.83  )
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

Make several improvements to gen_report(), starting by renaming it
to something less generic (sbiret_report) and then, instead of
relying on report prefix to link the report_info with the unexpected
return values to the failed test, use the test string itself, by
taking it as a parameter. And, reporting sbiret.error and
sbiret.value separately was more verbose than necessary since the
report_info can be used to see which one failed, so combine them.
Finally, return the pass/fail result of the test in case a caller
wants to use it.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 6f4ddaf13df3..9f591f8ff76a 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -156,19 +156,22 @@ static bool get_invalid_addr(phys_addr_t *paddr, bool allow_default)
 	return false;
 }
 
-static void gen_report(struct sbiret *ret,
-		       long expected_error, long expected_value)
-{
-	bool check_error = ret->error == expected_error;
-	bool check_value = ret->value == expected_value;
-
-	if (!check_error || !check_value)
-		report_info("expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",
-			    expected_error, expected_value, ret->error, ret->value);
-
-	report(check_error, "expected sbi.error");
-	report(check_value, "expected sbi.value");
-}
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
 
 static void check_base(void)
 {
@@ -184,7 +187,7 @@ static void check_base(void)
 		expected = (long)strtoul(getenv("SBI_SPEC_VERSION"), NULL, 0);
 		assert_msg(!(expected & BIT(31)), "SBI spec version bit 31 must be zero");
 		assert_msg(__riscv_xlen == 32 || !(expected >> 32), "SBI spec version bits greater than 31 must be zero");
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
@@ -199,7 +202,7 @@ static void check_base(void)
 	if (env_or_skip("SBI_IMPL_ID")) {
 		expected = (long)strtoul(getenv("SBI_IMPL_ID"), NULL, 0);
 		ret = sbi_base(SBI_EXT_BASE_GET_IMP_ID, 0);
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
@@ -207,17 +210,17 @@ static void check_base(void)
 	if (env_or_skip("SBI_IMPL_VERSION")) {
 		expected = (long)strtoul(getenv("SBI_IMPL_VERSION"), NULL, 0);
 		ret = sbi_base(SBI_EXT_BASE_GET_IMP_VERSION, 0);
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("probe_ext");
 	expected = getenv("SBI_PROBE_EXT") ? (long)strtoul(getenv("SBI_PROBE_EXT"), NULL, 0) : 1;
 	ret = sbi_base(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
-	gen_report(&ret, 0, expected);
+	sbiret_check(&ret, 0, expected);
 	report_prefix_push("unavailable");
 	ret = sbi_base(SBI_EXT_BASE_PROBE_EXT, 0xb000000);
-	gen_report(&ret, 0, 0);
+	sbiret_check(&ret, 0, 0);
 	report_prefix_popn(2);
 
 	report_prefix_push("mvendorid");
@@ -225,7 +228,7 @@ static void check_base(void)
 		expected = (long)strtoul(getenv("MVENDORID"), NULL, 0);
 		assert(__riscv_xlen == 32 || !(expected >> 32));
 		ret = sbi_base(SBI_EXT_BASE_GET_MVENDORID, 0);
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
@@ -233,7 +236,7 @@ static void check_base(void)
 	if (env_or_skip("MARCHID")) {
 		expected = (long)strtoul(getenv("MARCHID"), NULL, 0);
 		ret = sbi_base(SBI_EXT_BASE_GET_MARCHID, 0);
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
@@ -241,7 +244,7 @@ static void check_base(void)
 	if (env_or_skip("MIMPID")) {
 		expected = (long)strtoul(getenv("MIMPID"), NULL, 0);
 		ret = sbi_base(SBI_EXT_BASE_GET_MIMPID, 0);
-		gen_report(&ret, 0, expected);
+		sbiret_check(&ret, 0, expected);
 	}
 	report_prefix_popn(2);
 }
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
