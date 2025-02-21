Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867BCC021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Mm7td2eGzve1iclFfYSaFbJjyR1KnZUvQ10oOZUnT8=; b=HHQFO87M8M+jhK
	PgQjuXHTbNDySEcqNBf4vh6XWj9bOrA67gTvaY6NJl5f0QkPuu9cNKrpC73PahA12BIilPSzASyqz
	k7yJMwA75tYAV0yqBFST0URxTrC6GBW3URVMS/o6Dia39b3ojzqH5alV8/+ar4MfXxSyKpNJ5V3gY
	RV267rkxDDi2FYEpuSrxrlcGXwaP5prSWUFNoT58pS6KwN86p/RrYxyQwMsTaxY8MfyeDhdY+NdKt
	W51wq+BoX8aEzQNgwcUqd2+PMP+L9OKJhxqTFFCr/dfhJAH1Ptz2gwWnUBfaC6He1cbCH8zvdf6R4
	rnlpT7Jfarn8eobtVWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNS-000000063Yz-16iX;
	Fri, 21 Feb 2025 15:55:46 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNQ-000000063XA-1Ly3
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XsFc/trEqoDREYqPZyQUCnOe2D46+/c3wDaEc681yk=;
	b=jIf9DOfQvNgVtdVJl/UdMWpC2QsPx7+h2P1wRSmVU3ghWQvrVnGNh60W8dg6hOOJ6sYSK0
	g85zIfy/vPSKl4zkW+SDl+MhxVaDIbzgSWczBNW/A2rQFqHO5yuJSPqVorpVbUjsAOJAzB
	38buSnroJxOeTGzKCJYIR0+7s2nxKY0=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft failures as kfails
Date: Fri, 21 Feb 2025 16:55:35 +0100
Message-ID: <20250221155533.123418-13-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075544_781764_A5C12F15 
X-CRM114-Status: UNSURE (   7.32  )
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

Until we fix opensbi mark these known failures as kfails so we can
pass CI.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi-fwft.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/riscv/sbi-fwft.c b/riscv/sbi-fwft.c
index b10c147f22dd..19340d6bb48c 100644
--- a/riscv/sbi-fwft.c
+++ b/riscv/sbi-fwft.c
@@ -63,11 +63,17 @@ static void fwft_check_base(void)
 		struct sbiret ret;
 
 		ret = fwft_get_raw(BIT(32));
-		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
+		if (ret.error == 0)
+			report_kfail(true, false, "get feature with bit 32 set error: SBI_ERR_INVALID_PARAM");
+		else
+			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
 				    "get feature with bit 32 set error");
 
 		ret = fwft_set_raw(BIT(32), 0, 0);
-		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
+		if (ret.error == 0)
+			report_kfail(true, false, "set feature with bit 32 set error: SBI_ERR_INVALID_PARAM");
+		else
+			sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM,
 				    "set feature with bit 32 set error");
 	}
 #endif
@@ -167,7 +173,10 @@ static void fwft_check_misaligned_exc_deleg(void)
 	ret = fwft_misaligned_exc_set(0, SBI_FWFT_SET_FLAG_LOCK);
 	sbiret_report_error(&ret, SBI_SUCCESS, "Set misaligned deleg feature value 0 and lock");
 	ret = fwft_misaligned_exc_set(1, 0);
-	sbiret_report_error(&ret, SBI_ERR_LOCKED,
+	if (ret.error == SBI_ERR_DENIED)
+		report_kfail(true, false, "Set locked misaligned deleg feature to new value: SBI_ERR_LOCKED");
+	else
+		sbiret_report_error(&ret, SBI_ERR_LOCKED,
 			    "Set locked misaligned deleg feature to new value");
 	ret = fwft_misaligned_exc_get();
 	sbiret_report(&ret, SBI_SUCCESS, 0, "Get misaligned deleg locked value 0");
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
