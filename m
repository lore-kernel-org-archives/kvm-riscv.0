Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FA4C19F32
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKmCpb80gH21xRH0zPft5xtJfB7qmJ95hT9HF/XnopI=; b=IPK5OKUDKvs8by
	fUrYchPReRVbg0WKtaAAQkhhrwMqfIGqhENFD/E7sex0EWrsl/kMvIaRdAie6SINikC9y5979TTTh
	BKlN44PisV3OJVscHVAa7iBLgJzEaXZjw/Z68qxH3v5ZcPVYcwNgg/J5jDEt+QVCz8l3HkzD4e0F2
	HxC7y/gSrXGpUhOGVSr/LLKGVinA31mRxNdz1SaTvsqFrePjSPfNdfKKklOzWVbwcbsPcgfZTyldM
	+UKurhO1SOuE9oddqgOjUnNER5PJ0of1aLl/5ifqIiQqN21PSEU1Cr370OsJok/CUbp9jrpsHRAIu
	+m9fJ4Uo3JPSsqINnb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf87-00000007noK-3XAD;
	Thu, 27 Feb 2025 14:44:51 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnemg-00000007hyN-1MKc
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:22:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9bpxCsE53SfkLBTeYSTjoUbSdAkSjxCHOL2lhqUohY=;
	b=LrvRUWzJbXBYtS8HiceysXKloFMQIAqJRU7Q8aZDdKI8PRjScUSdNJdl3jyo8rXxl+YCgt
	lxwT6q51tJt2yRCJColkD+7N3x0h8ZcgQ4CrsLExbSu2wB/CKNstO2h/tPrfjOBd4IIk1S
	vnpKWj/OTzpDtIJxtF6jOWiEQViOvy4=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 11/11] riscv: sbi: Add bad fid tests
Date: Thu, 27 Feb 2025 15:22:39 +0100
Message-ID: <20250227142238.102412-2-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062242_504920_100B07CB 
X-CRM114-Status: UNSURE (   9.85  )
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

Ensure we get the correct error code when attempting to use an
invalid FID.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-fwft.c  |  2 ++
 riscv/sbi-tests.h |  2 ++
 riscv/sbi.c       | 18 ++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
index ca4d49b5db85..ac2e34869dfa 100644
--- a/riscv/sbi-fwft.c
+++ b/riscv/sbi-fwft.c
@@ -339,6 +339,8 @@ void check_fwft(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_FWFT);
+
 	fwft_check_base();
 	fwft_check_misaligned_exc_deleg();
 	fwft_check_pte_ad_hw_updating();
diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index 7c7fe30541e4..f8ce3c269d48 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -70,5 +70,7 @@
 #define sbiret_check(ret, expected_error, expected_value) \
 	sbiret_report(ret, expected_error, expected_value, "check sbi.error and sbi.value")
 
+void sbi_bad_fid(int ext);
+
 #endif /* __ASSEMBLY__ */
 #endif /* _RISCV_SBI_TESTS_H_ */
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 1d9d1871a28b..0404bb81317d 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -72,6 +72,12 @@ static struct sbiret sbi_system_suspend_raw(unsigned long sleep_type, unsigned l
 	return sbi_ecall(SBI_EXT_SUSP, 0, sleep_type, resume_addr, opaque, 0, 0, 0);
 }
 
+void sbi_bad_fid(int ext)
+{
+	struct sbiret ret = sbi_ecall(ext, 0xbad, 0, 0, 0, 0, 0, 0);
+	sbiret_report_error(&ret, SBI_ERR_NOT_SUPPORTED, "Bad FID");
+}
+
 static void start_cpu(void *data)
 {
 	/* nothing to do */
@@ -178,6 +184,8 @@ static void check_base(void)
 
 	report_prefix_push("base");
 
+	sbi_bad_fid(SBI_EXT_BASE);
+
 	ret = sbi_base(SBI_EXT_BASE_GET_SPEC_VERSION, 0);
 
 	report_prefix_push("spec_version");
@@ -331,6 +339,8 @@ static void check_time(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_TIME);
+
 	report_prefix_push("set_timer");
 
 	install_irq_handler(IRQ_S_TIMER, timer_irq_handler);
@@ -438,6 +448,8 @@ static void check_ipi(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_IPI);
+
 	if (nr_cpus_present < 2) {
 		report_skip("At least 2 cpus required");
 		report_prefix_pop();
@@ -731,6 +743,8 @@ static void check_hsm(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_HSM);
+
 	report_prefix_push("hart_get_status");
 
 	hartid = current_thread_info()->hartid;
@@ -1210,6 +1224,8 @@ static void check_dbcn(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_DBCN);
+
 	report_prefix_push("write");
 
 	dbcn_write_test(DBCN_WRITE_TEST_STRING, num_bytes, false);
@@ -1475,6 +1491,8 @@ static void check_susp(void)
 		return;
 	}
 
+	sbi_bad_fid(SBI_EXT_SUSP);
+
 	timer_setup(susp_timer);
 	local_irq_enable();
 	timer_start(SBI_SUSP_TIMER_DURATION_US);
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
