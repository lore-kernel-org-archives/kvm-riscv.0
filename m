Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC406C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TRNcJNGxN0/j4OH/hzuP1scjlw37QQyjEVF7i91zxT0=; b=z7B/DF5u5TVHRJ
	B4ZUneeC58XyEg9RgEeiVb8D1nTbY3f4q9cQstnBvjH8WZzhrYt4ajKyQJM/k1c1vTMEWGxRpCtV2
	LnBy1tHpgQwAymeO5BHE/daMDixYs6oDAXeO2XGI2G8x/oWrlo73i57MvJ/2ok+q3dDoCF4yXxROo
	PVeAHdsH1a1U8C4ACcVCncEpNvoNVSYkAmHfdZQF+tA51T209HnmTixMupaDbmWf2yTnOMaBpEBrP
	eYFUGSgYMsrFgAlfOnDiVlyTefwoF4ARZLu6HP4A6FsnkWR0N7jcT5P7VPb1getdbwLyEQcsV7Mc2
	2FuGxmiazdiNlPKYQbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Kz-00000002Wve-1X3F;
	Mon, 17 Mar 2025 12:12:57 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Gi-00000002Vn6-26sg
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:08:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742213304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nAUtTywMc3YKHpBV94Y/xUKnalZ4JMJwa5m6KMjJ0Dg=;
	b=R6iEaPTYQgaVYWxtDupCUgr6D9wmhhn2qMaS8CVhbD/EuGPN4bvpybaQBAaPQJnWmfkiEo
	pRpTYSG13viz/tuYJ2Cp8mszmDlpJhT/oDLc/CnzXicUt06s/ZUOTpjo1SI5i5wrVm4R3O
	0aPWKu41+dqqPFZTci7+A2oTnRc5NU4=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	cleger@rivosinc.com
Subject: [kvm-unit-tests PATCH] riscv: sbi: Add no target ipi test
Date: Mon, 17 Mar 2025 13:08:15 +0100
Message-ID: <20250317120814.35241-2-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_050833_132065_FDD3A31A 
X-CRM114-Status: UNSURE (   6.31  )
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

While an hmask of zero without an hbase of -1 (which would mean
broadcast) is pointless, since nothing is targeted, the spec
doesn't say it should return an error. Maybe it should? Anyway,
for now, just confirm that it "works".

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 219f7187acf3..16d918d00848 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -507,6 +507,10 @@ end_two:
 			max_hartid = cpus[cpu].hartid;
 	}
 
+	/* Test no targets */
+	ret = sbi_send_ipi(0, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "no targets");
+
 	/* Try the next higher hartid than the max */
 	ret = sbi_send_ipi(2, max_hartid);
 	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.error);
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
