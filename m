Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD02606ADB1
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTl7oydJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hOEc3Ykw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oEnAUQ7sdesHaudUJ6rjTUgoq+3w9JEH4/UWlOGyarI=; b=OTl7oydJRN/4jrMGgaHLA1kP2C
	BFAJJKgN+vD5oH8tyqH8evaYMI7RxgfDTbpDg4fDEt2DEMZ4dNaI9FBly5xkdlst1pPsPiVZjm3R2
	uSZVM92val5EXrR2nQGoYFs/khHkQQOnp5b1mnhPl+EYm/ppKI8xYGiqTZU18uBx62dqPsu2pPJKa
	YrhmhMHFbxfuwCFv1ehyKt0+U8X701RvE/CvJ/IsYTyfVyhBE+MQOlTkn9yQU0sY3QZ4Kk9rCK7oQ
	jBB/+NYJ9qmk0QVVkBqgovuQoR3s2GUWzKcLn/0IHsvguuzmZHYPhOTEZiUPcsZGm+KNVlwVtWLgf
	sSPuyUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyt-0000000Dw3G-1UuN;
	Fri, 13 Nov 2026 18:26:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvys-0000000Dw0b-2brF
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=a447najyP6oiEfQOMuEwmzsq+JuFRrv0E+AbaPhpCIo=; b=hOEc3YkwQtQpZARn5ieWyaY5Ne
	Fee1m0HWE6LQ/qA1Behapz2i4AlA7dulrNddxuRIvHhJPeFGiaLYlTpC8BDGwfEFZ46z6C7VlAu68
	KOcy7f+V6eNYB3Cyi7RBaYgOT0TlTmX9dDDm0TwfZ9T29PSA3RPC7nRBMdx9PjXKu4dCzbokBKXla
	3qQ+w62TjIfT7oD6HIwpvhreNe+8CfnsnlYeDj6n4k4R702pjDkkNSqcirtqUHm6p/RL7NIonFGzf
	s3jdwOrmFyuMm3DKOL5B9HErrcjdvzC/ejUh4FtoEpmuRHex0vdSSgxvt0i+zef5PxcKwiDbDeAuM
	RQJevh8g==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyU-0000000BeOW-16LO;
	Fri, 13 Nov 2026 18:26:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRvyR-00000000LXo-1IJ3;
	Fri, 13 Nov 2026 18:26:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	Sriram Nambakam <snambakam@linux.microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [RFC PATCH 00/13] KVM: planes: Userspace API
Date: Fri, 13 Nov 2026 11:25:54 -0700
Message-ID: <20261113182607.82813-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoZSBWU00gd29ya8K5
IGRyaXZlcyBwbGFuZXMgZnJvbSB1c2Vyc3BhY2UsIHdoaWNoIHRha2VzIGEgbGl0dGxlCm1vcmUg
QVBJIHRoYW4gdGhlIHBsYW5lcyBzZXJpZXPCsiBpdHNlbGYgcHJvdmlkZXM6IGFuIGV4cGxpY2l0
CnVzZXJzcGFjZSBvcHQtaW4gKGVuYWJsaW5nIEtWTV9DQVBfUExBTkVTIHdpdGggdGhlIHBsYW5l
IGNvdW50LApiZWZvcmUgYW55IHZDUFUgaXMgY3JlYXRlZCksIEtWTV9HRVQvU0VUX1BMQU5FX1JV
Tl9TVEFURSB2Q1BVCmlvY3RscywgYW5kIHRoZSBtZWNoYW5pY3MgdG8gZ28gd2l0aCB0aGVtIOKA
lCBwZXItcGxhbmUgcmVxdWVzdHMKZmFubmVkIG91dCB0byB0aGUgdHdpbiB2Q1BVcywgWENSMCBz
aGFyZWQgYWNyb3NzIHR3aW5zICh3aXRoIGV2ZXJ5CnR3aW4ncyBmcHN0YXRlIHNpemVkIGZvciB0
aGUgZHluYW1pYyB4ZmVhdHVyZXMgdGhhdCBhbGxvd3MpLCBhbmQKQVBJQ3YgaW5oaWJpdGVkIHdo
aWxlIHBsYW5lcyBhcmUgZW5hYmxlZCAoZm9yIG5vdykuIFdpdGggc2VsZnRlc3RzLAppbmNsdWRp
bmcgUGFvbG8ncyBwbGFuZSBpbmZyYXN0cnVjdHVyZSB0ZXN0cyBmcm9tIHRoZSBvcmlnaW5hbApw
bGFuZXMgUkZDwrMsIHBvcnRlZCBmb3J3YXJkLgoKUG9zdGVkIHNlcGFyYXRlbHkgZnJvbSB0aGUg
VlNNIFJGQyB2MiAodG8gZm9sbG93KSBzbyB0aGlzIHBhcnQgY2FuCmJlIHJldmlld2VkIOKAlCBv
ciBmb2xkZWQg4oCUIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHBsYW5lcyBzZXJpZXMuIEJhc2VkCm9u
IHRoYXQgc2VyaWVzwrIgd2l0aCBteSBmaXhlc+KBtCBhcHBsaWVkIChpbmNsdWRpbmcgdHdvIGZv
bGxvdy11cApwYXRjaGVzIG9uIHRoYXQgdGhyZWFkKTsgdGhlIHdob2xlIHN0YWNrIGlzIGF0IOKB
tS4KCsK5IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI2MTAxNzEyMjUwMS42MTAyNDgt
MS1kd213MkBpbmZyYWRlYWQub3JnLwrCsiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAy
NjA2MDgxNDQyNTIuMzUxNDQzLTEtam9yb0A4Ynl0ZXMub3JnLwrCsyBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNTA0MDExNjExMDYuNzkwNzEwLTI5LXBib256aW5pQHJlZGhhdC5jb20v
CuKBtCBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyNjExMTEyMjI5MTEuNDc3LTEtZHdt
dzJAaW5mcmFkZWFkLm9yZy8K4oG1IGh0dHBzOi8vZ2l0LmluZnJhZGVhZC5vcmcvP3A9dXNlcnMv
ZHdtdzIvbGludXguZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3ZzbTIvcGxhbmVzLXVhcGkK
CkRhdmlkIFdvb2Rob3VzZSAoMTIpOgogIEtWTTogeDg2OiBMZXQgdXNlcnNwYWNlIG9wdCBpbiB0
byBtdWx0aXBsZSBwbGFuZXMgd2l0aCBLVk1fQ0FQX1BMQU5FUwogIEtWTTogc2VsZnRlc3RzOiBB
ZGQgeDg2IHBsYW5lcyBsaWZlY3ljbGUgdGVzdAogIEtWTTogQWRkIEtWTV9HRVQvU0VUX1BMQU5F
X1JVTl9TVEFURSB2Q1BVIGlvY3RscwogIEtWTTogc2VsZnRlc3RzOiBDb3ZlciBwbGFuZSBydW4t
c3RhdGUgaW9jdGxzIGluIHBsYW5lc190ZXN0CiAgS1ZNOiBwbGFuZXM6IEZhbiBvdXQgcGVyLXBs
YW5lIHJlcXVlc3RzIHRvIHR3aW4gdkNQVXMKICBLVk06IHg4NjogSW5oaWJpdCBBUElDdiB3aGVu
IFZNIHBsYW5lcyBhcmUgZW5hYmxlZAogIEtWTTogcGxhbmVzOiBFbmxhcmdlIGV2ZXJ5IHR3aW4n
cyBmcHN0YXRlIGZvciBkeW5hbWljIHhmZWF0dXJlcwogIEtWTTogeDg2OiBMZXQgdXNlcnNwYWNl
IGNob29zZSBzdGF0ZSBmb3IgcGxhbmUgdHdpbnMgdG8gc2hhcmUKICBLVk06IHBsYW5lczogTGV0
IHBsYW5lIHR3aW5zIHNoYXJlIFhDUjAKICBLVk06IHBsYW5lczogTGV0IHBsYW5lIHR3aW5zIHNo
YXJlIERSNgogIEtWTTogc2VsZnRlc3RzOiBDaGVjayBDUFVJRCBoYW5kbGluZyBvZiBwbGFuZSB0
d2lucwogIEtWTTogc2VsZnRlc3RzOiBDb3ZlciBwbGFuZSBzdGF0ZSBzaGFyaW5nCgpQYW9sbyBC
b256aW5pICgxKToKICBLVk06IHNlbGZ0ZXN0czogQWRkIFZNIHBsYW5lIGluZnJhc3RydWN0dXJl
IGFuZCB0ZXN0cwoKIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAgICAg
ICB8IDEyOSArKystCiBhcmNoL3Bvd2VycGMva3ZtL3RyYWNlLmggICAgICAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAg
ICB8ICAgOCArLQogYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICAg
IHwgICA0ICsKIGFyY2gveDg2L2t2bS9jcHVpZC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyNSArLQogYXJjaC94ODYva3ZtL21tdS9tbXUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEzICstCiBhcmNoL3g4Ni9rdm0vcmVncy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAz
ICstCiBhcmNoL3g4Ni9rdm0vdHJhY2UuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMg
Ky0KIGFyY2gveDg2L2t2bS92bXgvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
LQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjIxICsr
KysrKy0KIGFyY2gveDg2L2t2bS94ODYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
MSArCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICAgICAgICAgICAgICAgfCAgMzYg
Ky0KIGluY2x1ZGUvdWFwaS9saW51eC9rdm0uaCAgICAgICAgICAgICAgICAgICAgICB8ICAgNyAr
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtICAgICAgfCAgIDMgKwog
Li4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsLmggIHwgIDczICsrKwog
Li4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS94ODYvcHJvY2Vzc29yLmggICAgIHwgIDE0ICsKIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYyAgICB8ICA3NCArKy0KIC4u
Li90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3g4Ni9wcm9jZXNzb3IuYyB8ICA0NyArLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3BsYW5lX3Rlc3QuYyAgICAgIHwgMTM3ICsrKysKIC4u
Li9zZWxmdGVzdHMva3ZtL3g4Ni9wbGFuZV94ODZfdGVzdC5jICAgICAgICB8IDMzMSArKysrKysr
KysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2L3BsYW5lc190ZXN0LmMgfCA2MDUg
KysrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMzggKysrLQogMjMgZmlsZXMgY2hhbmdlZCwgMTg1MiBpbnNlcnRpb25zKCsp
LCA0NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcGxhbmVfdGVzdC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3g4Ni9wbGFuZV94ODZfdGVzdC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Ni9wbGFuZXNfdGVzdC5jCgotLSAKMi41MC4xCgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
