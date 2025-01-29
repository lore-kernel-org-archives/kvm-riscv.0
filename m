Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC7C02192
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2eIs7NBKk7Uq5mW2b8afTaEJ3CMZO03ucw9CARjsR4w=; b=pb6mNytsGcTYqf
	fSBDck/EosmuE2cVFeeibnK9uU+FtE4nHvFZBGcr2qgVpJtsGgf4XYo+xNL44aGM6EQfADpJkgIjA
	UQPcazlJcdXaPaQ4lppPqIRak9NSoWfl/TEwcuHl2L+5EcaGkRtLPnn1taBk7VwZcegaojcWZvf7/
	0PLhoo4SdiDJZeORiDmUcqjy3L/wWJGv2qEvDco/E9VhcAgusd+zElzAOYGq1OEGVvPw5vn4xNdQD
	RKnUIZxqve4zwNTMhhl0tRR+cPHu6ukXFtYKJrkOipfnaRDGkaoIuaEKUUSGfaopZ9TmJ9QFrR2rm
	xQ644oqh1FH5BYJRCEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBJR-00000007QgC-38YR;
	Wed, 29 Jan 2025 16:53:13 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBHs-00000007QKr-0hGE
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 16:51:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738169493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oACEiPZbuBC1YUMwr619TXGJQqTIcjZw76OrmjThV38=;
	b=b5XHR4G2ZaI3tA1xcTzXTOP0/hJMhUzJbdQeuFahet4UC1NEikfW7rAUk9I7weT36o54dQ
	wOezGoIkoMz0ImVvLsiL01Yfc4Ppx9rXHgEVzQNeJ33VEfSTOgJaCMvqGJJeNiuO+k/lLo
	AWvvA26Hn+M07QCEboEK4cfp9Tv9sOY=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Subject: [kvm-unit-tests PATCH] riscv: efi: Bump number of memregions
Date: Wed, 29 Jan 2025 17:51:32 +0100
Message-ID: <20250129165131.163433-2-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_085136_557098_0E4E9DA9 
X-CRM114-Status: UNSURE (   9.58  )
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

There may be a bunch of EFI memory regions in the EFI memory map,
which we convert to k-u-t memregions. Bump the number we allow to
ensure we don't hit the assert in memregions_add().

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---

I noticed that the gitlab CI started failing the riscv EFI tests. It
looks like the edk2 used by CI has been updated to a version later than
what I was using locally and the newer one has several more memory
regions.

 lib/riscv/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 211945448b0f..a30aa0c4cb80 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -31,7 +31,11 @@
 #endif
 
 #define MAX_DT_MEM_REGIONS	16
+#ifdef CONFIG_EFI
+#define NR_MEM_REGIONS		(MAX_DT_MEM_REGIONS + 128)
+#else
 #define NR_MEM_REGIONS		(MAX_DT_MEM_REGIONS + 16)
+#endif
 
 extern unsigned long _etext;
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
