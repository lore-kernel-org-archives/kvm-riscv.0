Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6197C369D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnVSi7/WgDn+EyfoTL9fCvUhoyZc0LHFXddhV1FGg8U=; b=L0a64sqkN0w36K
	7/5u3eKHhRohOaWeoSVsM2tNf+Fb5qO1oKGrsyjFrsgc7qiOgcgNBZvaxMFrQz8UpVUqwTnDw+G+l
	nmUzlCC6uEwWlIPvoIvVL1MClXROpTcgw/RWOFb4mRcgxLSzPKnnc91zxjRDkqpE9xIvN09ZaqhD9
	CeGuOVN6R9b0SnzYKYTE2rqFJ59kgNOCedmOU5dlEc/oa53XiwHzY7NlQgQ/RKnLHIbCDO3oPvQTM
	eA7ZyN0oZHaryBoP6hFRrl6x+xYr0+RKX2A0enzj8hYoUA8p3HEWEmNZ8LRyqVO6N3i+fPSDgD11n
	xZQA2RNzSRNaiHWr85ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XHB-00000007kdm-0i12;
	Mon, 28 Apr 2025 22:48:37 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XGl-00000007kY4-1g0O
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 22:48:13 +0000
Message-ID: <3b05d1a0-c873-4e61-b98c-b725d0dbb350@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745880477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcxC+Ay3y++e8Uv8HSaPaQbT8svhorPAd8NEoyT9pQI=;
	b=gbk/utjp8SkhpN2UgzGCFAPMbnS1Kbgb7ZVz2I/t/rMrQETR+n3GqokpmvE7WiWgDWPYPX
	/JeD4wVWLBC8aDNWmBSoea57Ec18zpj6W9h3E9HYcwQZvFizVSfbmwAyLRp+a26L8Ukoq9
	YUvPHUR6+gr98+SWOqpUx33iB6ZR1/A=
Date: Mon, 28 Apr 2025 15:47:47 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception
 handling
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
 <20250425-dc44cb547ab5e2f994c94e80@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250425-dc44cb547ab5e2f994c94e80@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_154811_869843_C77744C8 
X-CRM114-Status: GOOD (  17.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDQvMjUvMjUgNjo1MCBBTSwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDI0
LCAyMDI1IGF0IDA1OjQwOjI5UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+PiBTYXZlIHN0
dmFsIGR1cmluZyBleGNlcHRpb24gaGFuZGxpbmcgc28gdGhhdCBpdCBjYW4gYmUgZGVjb2RlZCB0
bwo+PiBmaWd1cmUgb3V0IHRoZSBkZXRhaWxzIG9mIGV4Y2VwdGlvbiB0eXBlLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCAx
ICsKPj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L2hhbmRsZXJzLlMg
ICAgICB8IDIgKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJv
Y2Vzc29yLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9j
ZXNzb3IuaAo+PiBpbmRleCA1ZjM4OTE2NjMzOGMuLmY0YTdkNjRmYmU5YSAxMDA2NDQKPj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgK
Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vz
c29yLmgKPj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RydWN0IGV4X3JlZ3Mgewo+PiAgIAl1bnNpZ25l
ZCBsb25nIGVwYzsKPj4gICAJdW5zaWduZWQgbG9uZyBzdGF0dXM7Cj4+ICAgCXVuc2lnbmVkIGxv
bmcgY2F1c2U7Cj4+ICsJdW5zaWduZWQgbG9uZyBzdHZhbDsKPj4gICB9Owo+PiAgIAo+PiAgICNk
ZWZpbmUgTlJfVkVDVE9SUyAgMgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5TIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2xpYi9yaXNjdi9oYW5kbGVycy5TCj4+IGluZGV4IGFhMGFiZDNmMzViYi4uMjg4NGMxZTg5Mzli
IDEwMDY0NAo+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L2hh
bmRsZXJzLlMKPj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9o
YW5kbGVycy5TCj4+IEBAIC00NSw5ICs0NSwxMSBAQAo+PiAgIAljc3JyICBzMCwgQ1NSX1NFUEMK
Pj4gICAJY3NyciAgczEsIENTUl9TU1RBVFVTCj4+ICAgCWNzcnIgIHMyLCBDU1JfU0NBVVNFCj4+
ICsJY3NyciAgczMsIENTUl9TVFZBTAo+PiAgIAlzZCAgICBzMCwgMjQ4KHNwKQo+PiAgIAlzZCAg
ICBzMSwgMjU2KHNwKQo+PiAgIAlzZCAgICBzMiwgMjY0KHNwKQo+PiArCXNkICAgIHMzLCAyNzIo
c3ApCj4gV2UgY2FuJ3QgYWRkIHN0dmFsIHdpdGhvdXQgYWxzbyBjaGFuZ2luZyBob3cgbXVjaCBz
dGFjayB3ZSBhbGxvY2F0ZSBhdCB0aGUKPiB0b3Agb2YgdGhpcyBtYWNybywgYnV0IHNpbmNlIHdl
IG5lZWQgdG8ga2VlcCBzcCAxNi1ieXRlIGFsaWduZWQgaW4gb3JkZXIKPiB0byBjYWxsIEMgY29k
ZSAocm91dGVfZXhjZXB0aW9uKCkpIHdlJ2xsIG5lZWQgdG8gZGVjcmVtZW50IC04KjM2LCBub3QK
Clllcy4gVGhhbmtzIGZvciBjYXRjaGluZyB0aGF0LgoKPiAtOCozNS4gT3IsIHdlIGNvdWxkIGp1
c3Qgc3dpdGNoIHN0cnVjdCBleF9yZWdzIHRvIGJlIHRoZSBrZXJuZWwncyBzdHJ1Y3QKPiBwdF9y
ZWdzIHdoaWNoIGhhcyAzNiB1bnNpZ25lZCBsb25ncy4gVGhlICdiYWRhZGRyJyBtZW1iZXIgaXMg
Zm9yIHN0dmFsIGFuZAo+IHRoZSBhZGRpdGlvbmFsIGxvbmcgaXMgb3JpZ19hMC4KCkkgdGhpbmsg
c3dpdGNoaW5nIHRvIHB0X3JlZ3MgaXMgYmV0dGVyIGluIHRlcm1zIG9mIG1haW50YWluYWJpbGl0
eSBpbiAKdGhlIGZ1dHVyZS4KSSB3aWxsIGRvIHRoYXQuCgo+PiAgIC5lbmRtCj4+ICAgCj4+ICAg
Lm1hY3JvIHJlc3RvcmVfY29udGV4dAo+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIHJlc3RvcmUgc3R2YWwg
dG9vLgoKRG8gd2UgP8KgIHN0dmFsIGlzIHdyaXR0ZW4gYnkgaGFyZHdhcmUgYW5kIGRvZXNuJ3Qg
Y29udGFpbiBhbnkgc3RhdGUgb2YgCnRoZSBpbnRlcnJ1cHRlZCBwcm9ncmFtLgpPbmNlLCB0aGUg
dHJhcCBoYW5kbGVyIHByb2Nlc3NlcyB0aGUgdHJhcCB1c2luZyBzdHZhbCBpbmZvcm1hdGlvbiwg
dGhlcmUgCmlzIG5vIG5lZWQgdG8gcmVzdG9yZSBpdC4KCkFtIEkgbWlzc2luZyBzb21ldGhpbmcg
PwoKPiBUaGFua3MsCj4gZHJldwo+Cj4+IC0tIAo+PiAyLjQzLjAKPj4KPj4KPj4gLS0gCj4+IGt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKPj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
