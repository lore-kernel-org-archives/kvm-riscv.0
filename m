Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C8EC36002
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU4w1nb0k4E6+hJCDtKEqMYk48T+DdkJAhUsUgLpTwU=; b=zS7nEphf236hdg
	Yq/MoNrLBcxe1wcpW+7UF/O8bj/917xnHPMJmqcJL+p0oNZPfFehoujVGj7+3HO9IMU7yHhasKe/V
	vRVRyEW0K1VYZFh5XeXhILa0Ln5HqtQvnVwADlDPaV1KSz/xKYKxCvEuygu6NqB/GhXIG2L4RjqS5
	RrPIh8Aoy6mAT7v/l1sgme8P5weyTxiDAYqAr5UlpF+dMlafwdvC0ApZobxdG65rmtPaa3RjEw3g4
	xsdnWEijFlPhmKwR4mv3YShqC1dvNQXRYkgKDUzmqzWz3BaTUKxRDar4Rg7IRjuc6+P5QHcOa16Yp
	gvx/OtoZn57S53AI8hQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdV-0000000FbL9-1PYT;
	Fri, 21 Mar 2025 16:54:21 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdS-0000000FbGD-06Vd
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:54:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742576051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKtK3T8rQ5Y+UYKn5E6rBhpv2qWXGv+TG0wqcWzYaf8=;
	b=IDzwI5ZgUb7t4iU+0juMWN+ZBm8S3yokyisfop8Qtzgb8Wr7GYhrpxH+LnDfn0c3pqVa/X
	9WmhoaQRycHK3P7IO16oaawvV+a9mCY6cNI0pUKXlm6K552hob1zsCeiaDkzMOsr6SMLBw
	c2iWC7DoHrTUJCW7OaEUswtPc9Eb33c=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com,
	akshaybehl231@gmail.com
Subject: [kvm-unit-tests PATCH 2/3] riscv: sbi: Add kfail versions of sbiret_report functions
Date: Fri, 21 Mar 2025 17:54:06 +0100
Message-ID: <20250321165403.57859-7-andrew.jones@linux.dev>
In-Reply-To: <20250321165403.57859-5-andrew.jones@linux.dev>
References: <20250321165403.57859-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_095418_198117_67B648BB 
X-CRM114-Status: UNSURE (   7.51  )
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

report_kfail is useful for SBI testing to allowing CI to PASS even
when SBI implementations have known failures. Since sbiret_report
functions are frequently used by SBI tests, make kfail versions of
them too.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-tests.h | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index ddfad7fef293..d5c4ae709632 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -39,7 +39,8 @@
 #include <libcflat.h>
 #include <asm/sbi.h>
 
-#define __sbiret_report(ret, expected_error, expected_value, has_value, expected_error_name, fmt, ...) ({	\
+#define __sbiret_report(kfail, ret, expected_error, expected_value,						\
+			has_value, expected_error_name, fmt, ...) ({						\
 	long ex_err = expected_error;										\
 	long ex_val = expected_value;										\
 	bool has_val = !!(has_value);										\
@@ -48,9 +49,9 @@
 	bool pass;												\
 														\
 	if (has_val)												\
-		pass = report(ch_err && ch_val, fmt, ##__VA_ARGS__);						\
+		pass = report_kfail(kfail, ch_err && ch_val, fmt, ##__VA_ARGS__);				\
 	else													\
-		pass = report(ch_err, fmt ": %s", ##__VA_ARGS__, expected_error_name);				\
+		pass = report_kfail(kfail, ch_err, fmt ": %s", ##__VA_ARGS__, expected_error_name);		\
 														\
 	if (!pass && has_val)											\
 		report_info(fmt ": expected (error: %ld, value: %ld), received: (error: %ld, value %ld)",	\
@@ -63,14 +64,23 @@
 })
 
 #define sbiret_report(ret, expected_error, expected_value, ...) \
-	__sbiret_report(ret, expected_error, expected_value, true, #expected_error, __VA_ARGS__)
+	__sbiret_report(false, ret, expected_error, expected_value, true, #expected_error, __VA_ARGS__)
 
 #define sbiret_report_error(ret, expected_error, ...) \
-	__sbiret_report(ret, expected_error, 0, false, #expected_error, __VA_ARGS__)
+	__sbiret_report(false, ret, expected_error, 0, false, #expected_error, __VA_ARGS__)
 
 #define sbiret_check(ret, expected_error, expected_value) \
 	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
 
+#define sbiret_kfail(kfail, ret, expected_error, expected_value, ...) \
+	__sbiret_report(kfail, ret, expected_error, expected_value, true, #expected_error, __VA_ARGS__)
+
+#define sbiret_kfail_error(kfail, ret, expected_error, ...) \
+	__sbiret_report(kfail, ret, expected_error, 0, false, #expected_error, __VA_ARGS__)
+
+#define sbiret_check_kfail(kfail, ret, expected_error, expected_value) \
+	sbiret_kfail(kfail, ret, expected_error, expected_value, "check sbi.error and sbi.value")
+
 static inline bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
