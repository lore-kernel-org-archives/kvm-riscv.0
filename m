Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36901C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG+WIkXd/a0I9Eye59MnnX2UdPs03wzhaHOXbg9PE6Q=; b=sTe6i5fw+7asCJ
	trROtyOka3RxC5jPJbUZHvAAA8DUq4geZEleVwfs1a4AN9W9dRhq1UkcHGYeRErE/4js0Fdhx5TwH
	y0TASuWAs/gJdjdvo+/xD9NTFEI1ztdHpJffxV6VpSvEg3Q+Xz4lB9lQyck8FYC2r1+wz1+FORhXc
	qdGYfVSuDQUEfprgn2B+ekoc9FaNWNbAni4eAIzg9quY6qaGooPHChz6qxK1R0Wbtw9mhqwxUeat1
	dGGj/awjrTA/08LepkprFVXP1o4eO1PAu1PKpbApI/reUzPJefZiYMhY8w+Eo1HLUeqOqv+IsTUKW
	ua/FpmGvUY23/wfJh6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWOT-000000055M2-2zsn;
	Fri, 09 May 2025 22:40:37 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWN1-000000055Ce-0BaV;
	Fri, 09 May 2025 22:39:08 +0000
Message-ID: <1da6648a-251b-456b-9ddd-a7ffa95a5125@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746830344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsqNWeffoeI2a1Nha5CVjiw3khettMZ8t2Y5EabwFrE=;
	b=U2uaZT8uuKGxqCUflSnTSX7zhox5JAB0nlgVO4PX9893DQ3vSWCMm1P8LhI2UeKkeH49Mo
	IUzRFWP2cKwA1wLuc62ymb3HcegdNRpKpxlMHtPh+4CIbCBzqKuS6dc3jo2Jwd7nz0ILcI
	CwOkbRM9NDzpt81bdlAaJYYPfF/NhlI=
Date: Fri, 9 May 2025 15:38:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
 <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
 <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_153907_249489_A6A6472A 
X-CRM114-Status: GOOD (  17.20  )
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

Ck9uIDUvOC8yNSA2OjMyIEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0wNVQx
NDozOToyOS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ogo+PiBTRU5W
Q0ZHIGFuZCBTU1RBVEVFTiBDU1JzIGFyZSBjb250cm9sbGVkIGJ5IEhTRU5WQ0ZHKDYyKSBhbmQK
Pj4gU1NUQVRFRU4wKDYzKSBiaXRzIGluIGhzdGF0ZWVuLiBFbmFibGUgdGhlbSBsYXppbHkgYXQg
cnVudGltZQo+PiBpbnN0ZWFkIG9mIGJvb3RpbWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEF0aXNo
IFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfaW5zbi5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPj4gQEAg
LTI1Niw5ICsyNTYsMzcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2xhenlfZW5hYmxl
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IGNzcl8KPj4gICAJcmV0dXJuIEtW
TV9JTlNOX0NPTlRJTlVFX1NBTUVfU0VQQzsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW50IGt2
bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2VuYWJsZV9zZW52Y2ZnKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKPj4gKwkJCQkJCSAgdW5zaWduZWQgaW50IGNzcl9udW0sCj4+ICsJCQkJCQkgIHVuc2lnbmVk
IGxvbmcgKnZhbCwKPj4gKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBuZXdfdmFsLAo+PiArCQkJCQkJ
ICB1bnNpZ25lZCBsb25nIHdyX21hc2spCj4+ICt7Cj4+ICsJcmV0dXJuIGt2bV9yaXNjdl92Y3B1
X2hzdGF0ZWVuX2xhenlfZW5hYmxlKHZjcHUsIGNzcl9udW0sIFNNU1RBVEVFTjBfSFNFTlZDRkcp
Owo+PiArfQo+IEJhc2ljYWxseSB0aGUgc2FtZSBjb21tZW50cyBhcyBmb3IgWzEvNV06Cj4KPiBX
aHkgZG9uJ3Qgd2Ugd2FudCB0byBzZXQgdGhlIEVOVkNGRyBiaXQgKDYyKSB1bmNvbmRpdGlvbmFs
bHk/Cj4KPiBJdCB3b3VsZCBzYXZlIHVzIHRoZSB0cmFwIG9uIGZpcnN0IGFjY2Vzcy4gIFdlIGRv
bid0IGdldCBhbnl0aGluZyBmcm9tCj4gdGhlIHRyYXAsIHNvIGl0IGxvb2tzIGxpa2UgYSBuZXQg
bmVnYXRpdmUgdG8gbWUuCgpXZSB3YW50IHRvIGxhenkgZW5hYmxlbWVudCBpcyB0byBtYWtlIHN1
cmUgdGhhdCBoeXBlcnZpc29yIGlzIGF3YXJlIG9mIAp0aGUgd2hhdCBmZWF0dXJlcwpndWVzdCBp
cyB1c2luZy4gV2UgZG9uJ3Qgd2FudCB0byBuZWNlc3NhcmlseSBlbmFibGUgdGhlIGFyY2hpdGVj
dHVyZSAKc3RhdGVzIGZvciB0aGUgZ3Vlc3QgaWYgZ3Vlc3QgZG9lc24ndCBuZWVkIGl0LgoKV2Ug
bmVlZCBsYXp5IGVuYWJsZW1lbnQgZm9yIENUUiBsaWtlIGZlYXR1cmVzIGFueXdheXMuIFRoaXMg
d2lsbCBhbGlnbiAKYWxsIHRoZSB0aGUgZmVhdHVyZXMgY29udHJvbGxlZApieSBzdGF0ZWVuIGlu
IHRoZSBzYW1lIG1hbm5lci4gVGhlIGNvc3QgaXMganVzdCBhIHNpbmdsZSB0cmFwIGF0IHRoZSAK
Ym9vdCB0aW1lLgoKSU1PLCBpdCdzIGZhaXIgdHJhZGUgb2ZmLgo+PiArCj4+ICtzdGF0aWMgaW50
IGt2bV9yaXNjdl92Y3B1X2hzdGF0ZWVuX2VuYWJsZV9zdGF0ZWVuKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKPj4gKwkJCQkJCSAgdW5zaWduZWQgaW50IGNzcl9udW0sCj4+ICsJCQkJCQkgIHVuc2ln
bmVkIGxvbmcgKnZhbCwKPj4gKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBuZXdfdmFsLAo+PiArCQkJ
CQkJICB1bnNpZ25lZCBsb25nIHdyX21hc2spCj4+ICt7Cj4+ICsJY29uc3QgdW5zaWduZWQgbG9u
ZyAqaXNhID0gdmNwdS0+YXJjaC5pc2E7Cj4+ICsKPj4gKwlpZiAocmlzY3ZfaXNhX2V4dGVuc2lv
bl9hdmFpbGFibGUoaXNhLCBTTVNUQVRFRU4pKQo+PiArCQlyZXR1cm4ga3ZtX3Jpc2N2X3ZjcHVf
aHN0YXRlZW5fbGF6eV9lbmFibGUodmNwdSwgY3NyX251bSwgU01TVEFURUVOMF9TU1RBVEVFTjAp
Owo+PiArCWVsc2UKPj4gKwkJcmV0dXJuIEtWTV9JTlNOX0VYSVRfVE9fVVNFUl9TUEFDRTsKPj4g
K30KPiBUaGUgc2FtZSBhcmd1bWVudCBhcHBsaWVzIHRvIHRoZSBTRTAgYml0ICg2Mykgd2hlbiB0
aGUgZ3Vlc3QgaGFzIHRoZQo+IHNzdGF0ZWVuIGV4dGVuc2lvbi4KPgo+IEtWTSBkb2Vzbid0IHdh
bnQgdG8gZG8gYW55dGhpbmcgb3RoZXIgdGhhbiBzdG9wIHRyYXBwaW5nIGFuZCByZWVudGVyLCBz
bwo+IGl0IHNlZW1zIHRvIG1lIHdlIGNvdWxkIGp1c3Qgbm90IHRyYXAgaW4gdGhlIGZpcnN0IHBs
YWNlLgo+Cj4gVGhhbmtzLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
