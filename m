Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BBCA0FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NEwjKLcCPROUnW6HQb3kzL5dB+ioapFkZD+lU2Nfqzo=; b=G6ByRozgs/sMJu
	isAjpkJ93tnJu0nXQnXGrz5bZ83amhpGPvIdFR8ncPsLdSwI89l86wFwGS+q7M7bwK/nCXqK0H+he
	Ngj5NUzvameg2MWOPltrvC9Jsx88nUnWdr/yHoXQdicoDDsmYRlTxxn6GTvt0GeA/16jecfvk+HG2
	961wfmLzQv3pxILZA1lfST9Zh/a80nl4hZBdl0/3Uf3uBoSLvPnPNvJDjJHpKHgzA84WmT0lq/jNY
	4IBs/khRG9F9eW+T0vwMoWdBhywYox1VoR2xdZaPeYKjC349RC39R5L1lpOIlBAaCyIktMcG9oAxM
	jIyvDMPHiZucCjG0Jl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSPB-00000000bS2-1Dxt;
	Fri, 05 Sep 2025 09:06:49 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRBX-000000008Ph-2zJp
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 07:48:42 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4cJ7kk10RWz4xPRy
	for <kvm-riscv@lists.infradead.org>; Fri, 05 Sep 2025 15:48:30 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 5857mUY1083256
	for <kvm-riscv@lists.infradead.org>; Fri, 5 Sep 2025 15:48:30 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202509050748.5857mUY1083256@mse-fl1.zte.com.cn>
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 5857hA93076262
	for <kvm-riscv@lists.infradead.org>; Fri, 5 Sep 2025 15:43:10 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 5 Sep 2025 15:43:12 +0800 (CST)
Date: Fri, 5 Sep 2025 15:43:12 +0800 (CST)
X-Zmail-TransId: 2afa68ba94900b9-4afba
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>
Subject: =?UTF-8?B?W2t2bS11bml0LXRlc3RzIFBBVENIXSByaXNjdjogRml4IHNiaS1kZXBzIGV4cGFuc2lvbiBmb3Igb2xkZXIgR05VIE1ha2XCoA==?=
X-MAIL: mse-fl1.zte.com.cn 5857mUY1083256
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Fri, 05 Sep 2025 15:48:30 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68BA95CE.000/4cJ7kk10RWz4xPRy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004839_925612_D05397DE 
X-CRM114-Status: UNSURE (   7.55  )
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

From b8b66e40566bb89de57e45b08fc72446b26a7bfb Mon Sep 17 00:00:00 2001
From: Wu Fei <wu.fei9@sanechips.com.cn>
Date: Fri, 5 Sep 2025 14:31:48 +0800
Subject: [PATCH] riscv: Fix sbi-deps expansion for older GNU Make

The prerequisite $$($$*-deps) cannot be expanded to $(TEST_DIR)/sbi-deps
in 4.2.1 Make, rename it to sbi-deps without the prefix path.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 riscv/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/riscv/Makefile b/riscv/Makefile
index beaeaefa..372c56b3 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)

 all: $(tests)

-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
+sbi-deps += $(TEST_DIR)/sbi-asm.o
+sbi-deps += $(TEST_DIR)/sbi-dbtr.o
+sbi-deps += $(TEST_DIR)/sbi-fwft.o
+sbi-deps += $(TEST_DIR)/sbi-sse.o

-all_deps += $($(TEST_DIR)/sbi-deps)
+all_deps += $(sbi-deps)

 # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
 $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
