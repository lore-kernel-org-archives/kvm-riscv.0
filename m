Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D9C36000
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ix9WiuYWabTZMRTplfElf+jCCt9RrQxRbf7m/sqNhg=; b=ouhwua6vwVDe1W
	9hzzr9wXiOpZSeytOXAefAusYEUzBQdAM71h09p/xU3uXVp2z4arBnilz0z3gNtxlWoB8rP154wkO
	P6vdXEAWMZ8Giph3zEXiXedqn3+qjimSXIETJ07Ysb7MVQXSkDF6rKyJNHiUtskOHdvVkG0cSSUMH
	hWa5Ac+yzKrLntxtaWdI3OEkmatuXtu3NDlFM9KqCN0vroANvsoFw3fPJpNZ0Jhgjvzt0KY7Y2Ztl
	deszqPs1UqRXVz7k49/F5uCse/blfnVvv/8CX01boIlDzBKWVPDVGk8Ohnb1zYQ35UyT5MEUo5Vui
	aB1qqD+8AD5j1dwHwdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdS-0000000FbIm-2yVA;
	Fri, 21 Mar 2025 16:54:18 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfdP-0000000FbGU-33XC
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:54:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742576053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIolc26Z9WyQwzj190zC3vU/7vb8zQejDnHfjjlS2TY=;
	b=NnbjDHenGbSrKQVFGKgBN+CwdoxdxAfoFHK3CZWZKR0PiBVecIWj1ZLTqlBjykdDmPrHE7
	GEEoHwnBwlYMhnSqtyBequ2VItBsBxe1svNQ4bF0TLyyfn6NcEOQ2/CfwGMy30iy0ItSpM
	dbkGVD1B/QPMv0QrMAinnYfIGZxC06U=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com,
	akshaybehl231@gmail.com
Subject: [kvm-unit-tests PATCH 3/3] riscv: sbi: Use kfail for known opensbi failures
Date: Fri, 21 Mar 2025 17:54:07 +0100
Message-ID: <20250321165403.57859-8-andrew.jones@linux.dev>
In-Reply-To: <20250321165403.57859-5-andrew.jones@linux.dev>
References: <20250321165403.57859-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_095415_912299_FE4AC024 
X-CRM114-Status: UNSURE (   8.87  )
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

Use kfail for the opensbi s/SBI_ERR_DENIED/SBI_ERR_DENIED_LOCKED/
change. We expect it to be fixed in 1.7, so only kfail for opensbi
which has a version less than that. Also change the other uses of
kfail to only kfail for opensbi versions less than 1.7.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-fwft.c | 20 +++++++++++++-------
 riscv/sbi.c      |  6 ++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
index 3d225997c0ec..c52fbd6e77a6 100644
--- a/riscv/sbi-fwft.c
+++ b/riscv/sbi-fwft.c
@@ -83,19 +83,21 @@ static void fwft_feature_lock_test_values(uint32_t feature, size_t nr_values,
 
 	report_prefix_push("locked");
 
+	bool kfail = __sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
+
 	for (int i = 0; i < nr_values; ++i) {
 		ret = fwft_set(feature, test_values[i], 0);
-		sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED,
-			"Set to %lu without lock flag", test_values[i]);
+		sbiret_kfail_error(kfail, &ret, SBI_ERR_DENIED_LOCKED,
+				   "Set to %lu without lock flag", test_values[i]);
 
 		ret = fwft_set(feature, test_values[i], SBI_FWFT_SET_FLAG_LOCK);
-		sbiret_report_error(&ret, SBI_ERR_DENIED_LOCKED,
-			"Set to %lu with lock flag", test_values[i]);
+		sbiret_kfail_error(kfail, &ret, SBI_ERR_DENIED_LOCKED,
+				   "Set to %lu with lock flag", test_values[i]);
 	}
 
 	ret = fwft_get(feature);
-	sbiret_report(&ret, SBI_SUCCESS, locked_value,
-		"Get value %lu", locked_value);
+	sbiret_report(&ret, SBI_SUCCESS, locked_value, "Get value %lu", locked_value);
 
 	report_prefix_pop();
 }
@@ -103,6 +105,7 @@ static void fwft_feature_lock_test_values(uint32_t feature, size_t nr_values,
 static void fwft_feature_lock_test(uint32_t feature, unsigned long locked_value)
 {
 	unsigned long values[] = {0, 1};
+
 	fwft_feature_lock_test_values(feature, 2, values, locked_value);
 }
 
@@ -317,7 +320,10 @@ static void fwft_check_pte_ad_hw_updating(void)
 	report(ret.value == 0 || ret.value == 1, "first get value is 0/1");
 
 	enabled = ret.value;
-	report_kfail(true, !enabled, "resets to 0");
+
+	bool kfail = __sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
+	report_kfail(kfail, !enabled, "resets to 0");
 
 	install_exception_handler(EXC_LOAD_PAGE_FAULT, adue_read_handler);
 	install_exception_handler(EXC_STORE_PAGE_FAULT, adue_write_handler);
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 83bc55125d46..edb1a6bef1ac 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -515,10 +515,12 @@ end_two:
 	sbiret_report_error(&ret, SBI_SUCCESS, "no targets, hart_mask_base is 1");
 
 	/* Try the next higher hartid than the max */
+	bool kfail = __sbi_get_imp_id() == SBI_IMPL_OPENSBI &&
+		     __sbi_get_imp_version() < sbi_impl_opensbi_mk_version(1, 7);
 	ret = sbi_send_ipi(2, max_hartid);
-	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.error);
+	sbiret_kfail_error(kfail, &ret, SBI_ERR_INVALID_PARAM, "hart_mask");
 	ret = sbi_send_ipi(1, max_hartid + 1);
-	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask_base got expected error (%ld)", ret.error);
+	sbiret_kfail_error(kfail, &ret, SBI_ERR_INVALID_PARAM, "hart_mask_base");
 
 	report_prefix_pop();
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
