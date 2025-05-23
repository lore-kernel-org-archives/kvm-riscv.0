Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFBC54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzcHSC6HcKx0oel7hks73uGdMlPQyM6jiGLbaAfhFGQ=; b=jh8ePfqEPbkx17
	6C0MlKE22/bDy1WFIzAdhKsyXoFfBx3JaOEcMI/0kaa9HXjyxYSQhdaKT5pCZpnEyWW8xpekGri7K
	MyzP3EI4mcy+yrRouwo8CoNa7ge1rvU5U0v7dy0a8bI3NQY1bqgIO0V8gC2shBDxMyrqgU+uo3u6H
	uYv5c9dIgzPTTVoJT8BPOFqwZyNVcIri8ScR866/HTdNtMOhxryVYfZPtcdr6s5rXifsrwSxyl4tg
	g+YiY8HFnO5TjlFm+4mCf8Q67KF6VyppQ3cL470/mJ2ScPh5CngXPzna8pEsIvFtjEf/izAQjcU1N
	nf7W82Xww4vTH33Wn+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWiw-00000004cme-0S4m;
	Fri, 23 May 2025 18:02:26 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWit-00000004cm4-0Sz1
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 18:02:24 +0000
Message-ID: <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748023337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVgfGwkpVOgVzuNCU5zCPpN93of0x7k+aYCz5DP0VOA=;
	b=cb6ir8xE4q8LN9CRbizpHOwYHG/1HnOlKRh3ajaE1tDkmTd8L19cu4lPf8tqbFVowAvU7o
	37f+G4WGNnNmva62kOAHzlLog/TeUa+vG94ciSfJV4Agz/wUc+d1DCUpdSbMrQe4M9rbRz
	+MQCdF0ERsqq1cCkeU0V+ucqdayBGaM=
Date: Fri, 23 May 2025 11:02:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
 <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_110223_357127_8F39AA64 
X-CRM114-Status: GOOD (  15.22  )
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

T24gNS8yMy8yNSA5OjI3IEFNLCBSYWRpbSBLcsOEbcODwqHDhSB3cm90ZToKPiAyMDI1LTA1LTIz
VDE3OjI5OjQ5KzAyOjAwLCBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ogo+
PiBPbiAyMy8wNS8yMDI1IDE1OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PiAyMDI1LTA1
LTIzVDEyOjE5OjMwKzAyOjAwLCBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Ogo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+Pj4+ICtzdGF0aWMg
Y29uc3QgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0dXJlc1td
ID0gewo+Pj4+ICsJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCj4+Pj4gKwlTQklfRldG
VF9MQU5ESU5HX1BBRCwKPj4+PiArCVNCSV9GV0ZUX1NIQURPV19TVEFDSywKPj4+PiArCVNCSV9G
V0ZUX0RPVUJMRV9UUkFQLAo+Pj4+ICsJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HLAo+Pj4+
ICsJU0JJX0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOLAo+Pj4+ICt9Owo+Pj4KPj4+IEhvdyB3
aWxsIHVzZXJzcGFjZSBjb250cm9sIHdoaWNoIHN1YnNldCBvZiB0aGVzZSBmZWF0dXJlcyBpcyBh
bGxvd2VkIGluCj4+PiB0aGUgZ3Vlc3Q/Cj4+Pgo+Pj4gKFdlIGNhbiByZXVzZSB0aGUgS1ZNIFNC
SSBleHRlbnNpb24gaW50ZXJmYWNlIGlmIHdlIGRvbid0IHdhbnQgdG8gYWRkIGEKPj4+ICAgRldG
VCBzcGVjaWZpYyBPTkVfUkVHLikKPj4KPj4gSGkgUmFkaW0sCj4+Cj4+IEkgZGlkbid0IGxvb2tl
ZCBhdCB0aGF0IHBhcnQuIEJ1dCBtb3N0IGxpa2VseSB1c2luZyB0aGUga3ZtIG9uZSByZWcKPj4g
aW50ZXJmYWNlIHNlZW1zIG9rIGxpa2Ugd2hhdCBpcyBkb25lIGZvciBTVEEgPyBXZSBjb3VsZCBo
YXZlIHBlciBmZWF0dXJlCj4+IG92ZXJyaWRlIHdpdGggb25lIHJlZyBwZXIgZmVhdHVyZS4KPiAK
PiBTb3VuZHMgZmluZS4KPiAKClllYWguIFdlIGNhbiBoYXZlIGEgZm9sbG93IHVwIHNlcmllcyBm
b3IgU0JJIEZXRlQgc3RhdGUgdGhhdCBhbGxvd3MgdXNlciAKc3BhY2UgdG8gdG9nZ2xlIGVhY2gg
c3RhdGUgaW5kaXZpZHVhbGx5LgoKPj4gSXMgdGhpcyBzb21ldGhpbmcgYmxvY2tpbmcgdGhvdWdo
ID8gV2UnZCBsaWtlIHRvIG1lcmdlIEZXRlQgb25jZSBTQkkgMy4wCj4+IGlzIHJhdGlmaWVkIHNv
IHRoYXQgd291bGQgYmUgbmljZSBub3QgZGVsYXlpbmcgaXQgdG9vIG11Y2guIEknbGwgdGFrZSBh
Cj4+IGxvb2sgYXQgaXQgdG8gc2VlIGlmIGl0IGlzbid0IHRvbyBsb25nIHRvIGltcGxlbWVudC4K
PiAKPiBOb3QgYmxvY2tpbmcsIGJ1dCBJIHdvdWxkIGF0IGxlYXN0IGRlZmF1bHQgRldGVCB0byBk
aXNhYmxlZCwgYmVjYXVzZQo+IGN1cnJlbnQgdXNlcnNwYWNlIGNhbm5vdCBoYW5kbGUgWzE0LzE0
XS4gIChXZWxsLi4uIHNhdmUvcmVzdG9yZSB3YXMKPiBwcm9iYWJseSBicm9rZW4gZXZlbiBiZWZv
cmUsIGJ1dCBsZXQncyB0cnkgdG8gbm90IG1ha2UgaXQgd29yc2UuIDpdKQo+IAoKVXNlciBzcGFj
ZSBjYW4gbm90IGVuYWJsZSBvciBkaXNhYmxlIG1pc2FsaWduZWQgYWNjZXNzIGRlbGVnYXRpb24g
YXMgCnRoZXJlIGlzIG5vIGludGVyZmFjZSBmb3Igbm93IHJpZ2h0bHkgcG9pbnRlZCBieSB5b3Uu
IEkgZ3Vlc3Mgc3VwcG9ydGluZyAKdGhhdCB3b3VsZCBiZSBxdWlja2VyIHRoYW4gZml4aW5nIHRo
ZSBicm9hZGVyIGd1ZXN0IHNhdmUvcmVzdG9yZSAKYW55d2F5cy4gSXNuJ3QgaXQgPwoKV2UgY2Fu
IGhhdmUgdGhlIHBhdGNoZXMgcmVhZHkgZm9yIHRoZSBuZXh0IE1XIGZvciBGV0ZUIG9uZSByZWcg
aW50ZXJmYWNlLgoKPiBUaGFua3MuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
