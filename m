Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA442C3ABD8
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=190+YvzpKBaWgW7Tt2541btxHiIRnDQ9bnsyzzE8KuI=; b=YWXd5ZVDFEOQu/
	5jFLgtTxp+0Vl50F7ruvbO+iEeL4be+L/cg+wE9eUvkQQGE+rrkcdirrLDYdhe1qRJ/NvcYC+Qliv
	4FN3c2uOH4jjoG1pFkjiixdBKDtvTYa2BUwBlDaOQIQ81w4vM+V2oljzyELE/gSmGGcdAVAsOLw9T
	BdureDxxyDE3xWt4k1JLFqx8eAqWfUBAtzhHjumyOxg6leUmtrDV0c5pNvXge9LWomlOjQKSH53JP
	qfBIkWrbpqA8ai5Gb4k1cRuJndWJ6KgPaCFgwTTBtWbYigm9mYaLsA6t1gBZKLwMLP4pp2nxHT1bG
	7buRoT478am+sXZP00Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4we-00000004tQJ-1sTn;
	Fri, 16 May 2025 23:58:28 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4wb-00000004tOW-2J0C
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 23:58:26 +0000
Message-ID: <8b11ba85-0c95-4b7a-9206-ead8099bc013@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747439893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPRT6tmwQEpVbRbwRNdU0oFUqb9qQTxFeTyAspVLMs8=;
	b=pX95yTsDC3Ric+OnlCcVjjaBGP/p5qYQc46Vf3I4fAWFDb9NCt2l1vd9/H9mIMO1VrYswD
	6r3aU+1unjr5BQbqbkiPagtLp0NahXy+wMkgs4QbcfWls7AGoRy3phBMvUGtzMllVJvgx/
	/jv5Z0DY7BE2UvE65VhP7vtvmFGu6b4=
Date: Fri, 16 May 2025 16:57:47 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v7 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-15-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250515082217.433227-15-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_165825_724995_993F0F76 
X-CRM114-Status: GOOD (  16.02  )
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

T24gNS8xNS8yNSAxOjIyIEFNLCBDbMODwqltZW50IEzDg8KpZ2VyIHdyb3RlOgo+IFNCSV9GV0ZU
X01JU0FMSUdORURfREVMRUcgbmVlZHMgaGVkZWxlZyB0byBiZSBtb2RpZmllZCB0byBkZWxlZ2F0
ZQo+IG1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0b3JlIGl0
IGR1cmluZyBDUFUKPiBsb2FkL3B1dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVi
dWdAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwg
NDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYjBmNjZj
N2JmMDEwLi42NzcwYzA0M2JiY2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTE0
LDYgKzE0LDggQEAKPiAgICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gICAjaW5jbHVk
ZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+Cj4gICAKPiArI2RlZmluZSBNSVNfREVMRUcgKEJJ
VF9VTEwoRVhDX0xPQURfTUlTQUxJR05FRCkgfCBCSVRfVUxMKEVYQ19TVE9SRV9NSVNBTElHTkVE
KSkKPiArCj4gICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgewo+ICAgCS8qKgo+ICAgCSAq
IEBpZDogRmVhdHVyZSBJRAo+IEBAIC02OCw3ICs3MCw0NiBAQCBzdGF0aWMgYm9vbCBrdm1fZndm
dF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPiAg
IAlyZXR1cm4gZmFsc2U7Cj4gICB9Cj4gICAKPiArc3RhdGljIGJvb2wga3ZtX3NiaV9md2Z0X21p
c2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7
Cj4gKwlyZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKPiArfQo+ICsKPiAr
c3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+ICsJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25m
LAo+ICsJCQkJCXVuc2lnbmVkIGxvbmcgdmFsdWUpCj4gK3sKPiArCXN0cnVjdCBrdm1fdmNwdV9j
b25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPiArCj4gKwlpZiAodmFsdWUgPT0gMSkgewo+
ICsJCWNmZy0+aGVkZWxlZyB8PSBNSVNfREVMRUc7Cj4gKwkJY3NyX3NldChDU1JfSEVERUxFRywg
TUlTX0RFTEVHKTsKPiArCX0gZWxzZSBpZiAodmFsdWUgPT0gMCkgewo+ICsJCWNmZy0+aGVkZWxl
ZyAmPSB+TUlTX0RFTEVHOwo+ICsJCWNzcl9jbGVhcihDU1JfSEVERUxFRywgTUlTX0RFTEVHKTsK
PiArCX0gZWxzZSB7Cj4gKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiArCX0KPiAr
Cj4gKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlf
ZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAr
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArCQkJCQl1bnNpZ25lZCBs
b25nICp2YWx1ZSkKPiArewo+ICsJKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAmIE1J
U19ERUxFRykgPT0gTUlTX0RFTEVHOwo+ICsKPiArCXJldHVybiBTQklfU1VDQ0VTUzsKPiArfQo+
ICsKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNb
XSA9IHsKPiArCXsKPiArCQkuaWQgPSBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPiAr
CQkuc3VwcG9ydGVkID0ga3ZtX3NiaV9md2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0
ZWQsCj4gKwkJLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+
ICsJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPiArCX0s
Cj4gICB9Owo+ICAgCj4gICBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgoKTEdU
TS4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
