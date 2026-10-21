Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF30606A31A
	for <kvm-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ZOsYUs0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vl6hox2fwLb+nmDe9nUVgZ2PUTNiMuNxeZM9VYyz5LM=; b=2ZOsYUs0rIog0o
	h1+FzUeLXHTy5Zu3zLlQ3XstDBR+w15aXdzytE7dzqvI45hfDFkKQ3jO+22PkzZNQPctApGThj2I4
	PS4pnwO2RqpK8V6d/49FHeHBNdpla+zkHNAWWv3HPrsT7jMYGgPXiNnkur7DUz2mY60548fo396dz
	8mvb3RLiQL/om3QButdIP/A3WqjJrq+j4exY9WhIMwdYPLYHiE6KWawWN/HuwCIAxSyHG9RZYtPTZ
	IXVVzIL7o3INnocbexl9jh5FfbE5etvA/tpglmQHy/vDR+dAv/QgjwJHKehhnXtPFSgzvKBCc50tk
	vJzRPgy9D8uzPTciVOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQcn-0000000BFBa-39rb;
	Wed, 21 Oct 2026 07:20:37 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQck-0000000BFAs-1Yey;
	Wed, 21 Oct 2026 07:20:36 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j8gff3HJ5z8Xrrj;
	Wed, 21 Oct 2026 15:20:26 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 69L7KOCC052507;
	Wed, 21 Oct 2026 15:20:24 +0800 (+08)
	(envelope-from ye.zhihao1@zte.com.cn)
Message-Id: <202610210720.69L7KOCC052507@mse-fl1.zte.com.cn>
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 69L6EsS0078942;
	Wed, 21 Oct 2026 14:14:54 +0800 (+08)
	(envelope-from ye.zhihao1@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 21 Oct 2026 14:14:56 +0800 (CST)
X-Zmail-TransId: 2b036ad8586016c-6674b
X-Mailer: Zmail v1.0
Date: Wed, 21 Oct 2026 14:14:56 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <ye.zhihao1@zte.com.cn>
To: <atishp04@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAwOC8xMV0gUklTQy1WOiBLVk06IERpc2FibGUgYWxsIGhwbWNvdW50ZXIgYWNjZXNzIGZvciBWUy9WVSBtb2Rl?=
X-MAIL: mse-fl1.zte.com.cn 69L7KOCC052507
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: ye.zhihao1@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 21 Oct 2026 15:20:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD867BA.000/4j8gff3HJ5z8Xrrj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_002034_573722_B51D0702 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UXVlc3Rpb25zIG9uIEtWTSBQTVUgQ291bnRlciBOdW1iZXJpbmcsIEhjb3VudGVyZW4gU2V0dGlu
ZywgYW5kIE1pZ3JhdGlvbi9Db25mbGljdCBIYW5kbGluZwoKRGVhciBBdGlzaCBQYXRyYSwKCkhp
77yMCgpJIG5vdGljZWQgeW91ciByZWxldmFudCBwYXRjaGVzIGFuZCBjb21tZW50cyByZWdhcmRp
bmcgdGhlIEtWTSBtb2R1bGUgaW4geW91ciB2aXJ0dWFsaXphdGlvbiB3b3JrLiBEdXJpbmcgbXkg
dmlydHVhbGl6YXRpb24gdmFsaWRhdGlvbiwgSSBoYXZlIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb25z
OgoKSSBmb3VuZCB0aGF0IHRoZSBoYXJkd2FyZSBjb3VudGVyIG51bWJlcnMgYWN0dWFsbHkgdXNl
ZCBvbiB0aGUgaG9zdCBhcmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIHZpcnR1YWxpemVkIG51bWJl
cnMgcmV0dXJuZWQgYWZ0ZXIgS1ZNIGVtdWxhdGlvbi4gSXMgdGhpcyBiZWNhdXNlIHlvdSB3YW50
IHRvIGVuc3VyZSB0aGF0IHRoZSBWTSBjYW4gd29yayBwcm9wZXJseSBpbiBtaWdyYXRpb24gc2Nl
bmFyaW9zIGFuZCBhdm9pZCB0aGUgY29uZmxpY3Qgc2NlbmFyaW8gd2hlcmUgdGhlIGhvc3QgYW5k
IGd1ZXN0IGNvdW50IHNpbXVsdGFuZW91c2x5IG9uIHRoZSBzYW1lIENQVSBhbmQgc2hhcmUgdGhl
IHNhbWUgaGFyZHdhcmUgY291bnRlcj8gQWxzbywgd2h5IGFyZSBhbGwgdmlydHVhbGl6ZWQgZXZl
bnRzIGRpc2d1aXNlZCBhcyBzYW1wbGluZyBldmVudHM/IElzIGl0IGJlY2F1c2UgU0JJIFBNVSBk
b2VzIG5vdCBzdXBwb3J0IHRoZSBwYXNzaW5nIG9mIHRoaXMgZmxhZywgc28gS1ZNIGNhbm5vdCBk
aXN0aW5ndWlzaCBiZXR3ZWVuIHN0YXQgYW5kIHJlY29yZCBldmVudHM/CgpJbiBhZGRpdGlvbiwg
SSBub3RpY2VkIHRoYXQgaW4geW91ciBtYWluLmMsIEhjb3VudGVyZW4gaXMgc2V0IHRvIDB4MDIu
IElzIHRoaXMgYWxzbyBiZWNhdXNlIHRoZXJlIGlzIG5vIGNvcnJlbGF0aW9uIGJldHdlZW4gdGhl
IGxvZ2ljYWwgaGFyZHdhcmUgY291bnRlcnMgYW5kIHRoZSB2aXJ0dWFsIGNvdW50ZXJzPyBIYXZl
IHlvdSBjb25zaWRlcmVkIGVuYWJsaW5nIEhjb3VudGVyZW4gdG8gcmVkdWNlIHRoZSBvdmVyaGVh
ZCBjYXVzZWQgYnkgQ1NSIHRyYXBzPyBJbiBLVk0sIGlzIGl0IG1hbmRhdG9yeSB0byBtb2RpZnkg
dGhlIGxvZ2ljYWwgaGFyZHdhcmUgY291bnRlciBudW1iZXJzIGFuZCB0aGUgdmlydHVhbCBjb3Vu
dGVyIG51bWJlcnMgc28gdGhhdCB0aGV5IG1hdGNoIGFuZCBhcmUgY29uc2lzdGVudCwgYW5kIHdv
dWxkIGl0IGJlIG5lY2Vzc2FyeSB0byByZWNvbnNpZGVyIGhvdyB0byBzb2x2ZSB0aGUgbWlncmF0
aW9uIGFuZCBjb25mbGljdCBpc3N1ZXMgZW5jb3VudGVyZWQgaW4gdGhlIHByZXZpb3VzIHNjZW5h
cmlvcz8KCkJlc3QgcmVnYXJkcywKWkhJSEFPIFlFCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
