Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A91C282C9
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8P3ZlxRquDcN4fdQa8qA4rd92eHP8Bi795HGF7iHIw=; b=moUdNzRJpzyNnA
	XcQ8UlO8M47E7wNi41IOs1DlEo16NybNTxP3QKyO4DwrLVOxyzHdpYH9d6Xh8aqrSjL6tWfD40Lp/
	J9naxekrzoM35mQiCfA5jlAFlgsrtMS2Pc7hqouloWumunvkvgsr0K5MXxEG6tuihjkbQoV+2+gcE
	+a6JFQRbN/APWYbyomGdLaVRxXu4URI2J9uM7Ay6TcNmRylm4rqX3rglmDSg/TNALS/aLt3yJJJJi
	GbpBWLKqUTb47QzaN39PHZYHZdrud1f8PrOgp3HBVZP1nOhThmP3B6FvySMWM7bFz3wAoIn5G41c4
	gWr1iACHz4O6HbQqlwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6f-00000007nOO-2Lnf;
	Thu, 27 Feb 2025 14:43:21 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnemR-00000007hvl-3Zb9
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:22:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npBhLsost3p1iTIPMqLH80FZQabDf08tkU5LPKEMCRw=;
	b=KuSJKy1uqCPR8fIGZ9+j3U+zrIA35dorbYPg3zaFz7sjdcCWRvc/7RXbIm8e8KJmIFeNz5
	UeYCpXmo6wLfJxHMxsziY6zTTfdwvXzHEfLsobzW39qm6xFu6CV5NpebEEKi1ksavJXJ+z
	2finTpnkmCTnzGzAcLXMbvu7ajUeizc=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 09/11] riscv: sbi: Probe/skip SUSP
Date: Thu, 27 Feb 2025 15:22:24 +0100
Message-ID: <20250227142223.102348-2-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062228_045686_3F7BB417 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Q2xlYW5seSBza2lwIHRlc3Rpbmcgc3VzcGVuZCB3aGVuIHRoZSBTVVNQIGV4dGVuc2lvbiBpc24n
dCBhdmFpbGFibGUuCgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5k
ZXY+Ci0tLQogcmlzY3Yvc2JpLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLmMgYi9yaXNj
di9zYmkuYwppbmRleCBhMGE4MzMxYjA0YmQuLmU1ZjZlMWM3MmFlNiAxMDA2NDQKLS0tIGEvcmlz
Y3Yvc2JpLmMKKysrIGIvcmlzY3Yvc2JpLmMKQEAgLTE0NTIsNiArMTQ1MiwxMiBAQCBzdGF0aWMg
dm9pZCBjaGVja19zdXNwKHZvaWQpCiAKIAlyZXBvcnRfcHJlZml4X3B1c2goInN1c3AiKTsKIAor
CWlmICghc2JpX3Byb2JlKFNCSV9FWFRfU1VTUCkpIHsKKwkJcmVwb3J0X3NraXAoIlNVU1AgZXh0
ZW5zaW9uIG5vdCBhdmFpbGFibGUiKTsKKwkJcmVwb3J0X3ByZWZpeF9wb3AoKTsKKwkJcmV0dXJu
OworCX0KKwogCXRpbWVyX3NldHVwKHN1c3BfdGltZXIpOwogCWxvY2FsX2lycV9lbmFibGUoKTsK
IAl0aW1lcl9zdGFydChTQklfU1VTUF9USU1FUl9EVVJBVElPTl9VUyk7CkBAIC0xNDc5LDcgKzE0
ODUsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19zdXNwKHZvaWQpCiAJCQlsb2NhbF9pcnFfZW5hYmxl
KCk7CiAKIAkJCWlmICghcGFyYW1zLnJldHVybnMgJiYgcmV0LmVycm9yID09IFNCSV9FUlJfTk9U
X1NVUFBPUlRFRCkgewotCQkJCXJlcG9ydF9za2lwKCJTVVNQIG5vdCBzdXBwb3J0ZWQ/Iik7CisJ
CQkJcmVwb3J0X2ZhaWwoInByb2JpbmcgY2xhaW1zIHN1cHBvcnQsIGJ1dCBpdCdzIG5vdD8iKTsK
IAkJCQlyZXBvcnRfcHJlZml4X3BvcCgpOwogCQkJCWdvdG8gb3V0OwogCQkJfSBlbHNlIGlmICgh
cGFyYW1zLnJldHVybnMpIHsKLS0gCjIuNDguMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
