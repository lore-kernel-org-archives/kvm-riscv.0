Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F18C36005
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysSObuyh1e6G6BwiZDdGA/FWBufFkz9g3qXXwZVPwnk=; b=pmWhLdjx9z2wg2
	Zeu6LBtM28oezekHVGV5ppi/FKamLhgivAvzA8e8TPYO7T375BW2hj1VJ6KSg7iEtWAHXlBRVYpRQ
	cblaCPydWTRQCRAD8efdW5Ecli5RgrtkldkKKkm9mnUZ0MIYkrxaxGc1E9VGrkQDMl3Oqj+jndp4+
	RYkEKC2+mVdm0TTQV+TgpYe03pFzt5uzF7HUsWeTABYjhKs+b2lPjgxGlVhWrBZEhrUCYXJv1izF6
	1fSJh2gHPE3amicaLu4nvwYLXMcX/nhAM4oFFuvFpcNqI0n2z0k4flSFfrMFCstZg+LSCRY47g1zt
	j7eGURHQihInwEqhjbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdU-0000000FbKW-4C7i;
	Fri, 21 Mar 2025 16:54:21 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdP-0000000FbFv-3Yuj
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:54:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742576049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9zKZEdfQYZeghDcnUUsQR01GtR2H7Xuam0AVo+Vzx0=;
	b=DzV+ddJu0d7wt8hCmpHLUTZn0Jgcfy5vaXvNYtiEoXyOkAoIfE1oEiZ5an96GxNgoXf1aN
	H0jyEm4J6YrP8XbtY6T/FwFPDtQpybRRKykQv/xLAOty5mBhqCPzofFBq/CE2P1TLT1IuV
	tsF4wVQnnnV3wWG19aK0KJjxeZqJk04=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com,
	akshaybehl231@gmail.com
Subject: [kvm-unit-tests PATCH 1/3] lib/riscv: Also provide sbiret impl functions
Date: Fri, 21 Mar 2025 17:54:05 +0100
Message-ID: <20250321165403.57859-6-andrew.jones@linux.dev>
In-Reply-To: <20250321165403.57859-5-andrew.jones@linux.dev>
References: <20250321165403.57859-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_095416_029391_12238ABD 
X-CRM114-Status: UNSURE (   8.94  )
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

We almost always return sbiret from sbi wrapper functions so
do that for sbi_get_imp_version() and sbi_get_imp_id(), but
asserting no error and returning the value is also useful,
so continue to provide those functions too, just with a slightly
different name.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/sbi.h |  6 ++++--
 lib/riscv/sbi.c     | 18 ++++++++++++++----
 riscv/sbi-sse.c     |  4 ++--
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index edaee462c3fa..a5738a5ce209 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -260,9 +260,11 @@ struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
 struct sbiret sbi_send_ipi_broadcast(void);
 struct sbiret sbi_set_timer(unsigned long stime_value);
 struct sbiret sbi_get_spec_version(void);
-unsigned long sbi_get_imp_version(void);
-unsigned long sbi_get_imp_id(void);
+struct sbiret sbi_get_imp_version(void);
+struct sbiret sbi_get_imp_id(void);
 long sbi_probe(int ext);
+unsigned long __sbi_get_imp_version(void);
+unsigned long __sbi_get_imp_id(void);
 
 typedef void (*sbi_sse_handler_fn)(void *data, struct pt_regs *regs, unsigned int hartid);
 
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 53d25489f905..2959378f64bb 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -183,21 +183,31 @@ struct sbiret sbi_set_timer(unsigned long stime_value)
 	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
 }
 
-unsigned long sbi_get_imp_version(void)
+struct sbiret sbi_get_imp_version(void)
+{
+	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_get_imp_id(void)
+{
+	return sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, 0, 0, 0, 0, 0);
+}
+
+unsigned long __sbi_get_imp_version(void)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0, 0, 0, 0, 0, 0);
+	ret = sbi_get_imp_version();
 	assert(!ret.error);
 
 	return ret.value;
 }
 
-unsigned long sbi_get_imp_id(void)
+unsigned long __sbi_get_imp_id(void)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, 0, 0, 0, 0, 0);
+	ret = sbi_get_imp_id();
 	assert(!ret.error);
 
 	return ret.value;
diff --git a/riscv/sbi-sse.c b/riscv/sbi-sse.c
index 97e07725c359..bc6afaf5481e 100644
--- a/riscv/sbi-sse.c
+++ b/riscv/sbi-sse.c
@@ -1232,8 +1232,8 @@ void check_sse(void)
 		return;
 	}
 
-	if (sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
-	    sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7)) {
+	if (__sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+	    __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7)) {
 		report_skip("OpenSBI < v1.7 detected, skipping tests");
 		report_prefix_pop();
 		return;
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
