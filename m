Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE4DC71136
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6c1On2bJ9xDmkMMCWo0+YuNtan/KUfkxcxSwYmf+A8=; b=HHszSm2RmlWTL0
	NidyMmvZGbD83Hs/mf4+WisLEBBSDceTgyGG5KSyyGRFoXEQaBT2FrGwt4XRC/KERlpk3pEsYyw9Q
	EG510BhX8hpCEs5gG3dagreM6wPDuqm5dRFwegBmMjSPYH+h6yY/O9TJkFAKPRQAbEsRlRoVwo6uM
	elqSC0Bpe5OjaVwNTUOp32AMez/z+ny+dyQSM05PJAs6M+EgfCDmuJcW9gy7YDo1GHmKqwAqm+Vz8
	aoifvi4STnKHMNWJWEmmDsPuP+hhW8mFdEQdGib3SZeVCT2IB1CjsKGdUI/mdJ5zO3g+NwRkGBmtc
	y9NB55awL//NERrpNFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4TO-0000000GURX-0AuH;
	Fri, 13 Jun 2025 13:29:34 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4TK-0000000GUPj-3Yu8
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 13:29:32 +0000
Date: Fri, 13 Jun 2025 15:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749821365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDFsYEgxo1GXhtFdQGrCC+9YCOStEBIAsgElrlaVhWs=;
	b=DhcdyrLhQdNsb4gZpeaIn1xkIfmF5quDJPQodcIzL76+o+IAvTDTXPpAkkddf/Jux25r7K
	mS6yCvB7i66zgNM6f4cH/+RM5qwf4C+zf0k82NBlcT9HK5BHm0bybQi+n23mJFsWP2pmOl
	1zhMS9WQi2HAnHdbG2argozEOfKFqOo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] riscv: Allow SBI_CONSOLE with no uart
 in device tree
Message-ID: <20250613-031a531dce64411cb0ba7774@orel>
References: <20250612200747.683635-1-jesse@rivosinc.com>
 <20250613-68a39013932d854741a41c4c@orel>
 <CALSpo=Y1uq6zAJYgJOTnVxzaNMmms7-eVSF4U_Z2rJ1zNVU9+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSpo=Y1uq6zAJYgJOTnVxzaNMmms7-eVSF4U_Z2rJ1zNVU9+w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_062931_037177_7B7CAD8D 
X-CRM114-Status: GOOD (  31.19  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMDU6MTE6MTlBTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gT24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTI6NTPigK9BTSBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0BsaW51eC5kZXY+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSnVuIDEyLCAyMDI1
IGF0IDAxOjA3OjQ3UE0gLTA3MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+ID4gPiBXaGVuIENPTkZJ
R19TQklfQ09OU09MRSBpcyBlbmFibGVkIGFuZCB0aGVyZSBpcyBubyB1YXJ0IGRlZmluZWQgaW4g
dGhlCj4gPiA+IGRldmljZSB0cmVlIGt2bS11bml0LXRlc3RzIGZhaWxzIHRvIHN0YXJ0Lgo+ID4g
Pgo+ID4gPiBPbmx5IGNoZWNrIGlmIHVhcnQgZXhpc3RzIGluIGRldmljZSB0cmVlIGlmIFNCSV9D
T05TT0xFIGlzIGZhbHNlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8
amVzc2VAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGxpYi9yaXNjdi9pby5jIHwgMiAr
Kwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvbGliL3Jpc2N2L2lvLmMgYi9saWIvcmlzY3YvaW8uYwo+ID4gPiBpbmRleCBmYjQw
YWRiNy4uOTZhM2MwNDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYi9yaXNjdi9pby5jCj4gPiA+ICsr
KyBiL2xpYi9yaXNjdi9pby5jCj4gPiA+IEBAIC0xMDQsNiArMTA0LDcgQEAgc3RhdGljIHZvaWQg
dWFydDBfaW5pdF9hY3BpKHZvaWQpCj4gPiA+Cj4gPiA+ICB2b2lkIGlvX2luaXQodm9pZCkKPiA+
ID4gIHsKPiA+ID4gKyNpZm5kZWYgQ09ORklHX1NCSV9DT05TT0xFCj4gPiA+ICAgICAgIGlmIChk
dF9hdmFpbGFibGUoKSkKPiA+ID4gICAgICAgICAgICAgICB1YXJ0MF9pbml0X2ZkdCgpOwo+ID4g
PiAgICAgICBlbHNlCj4gPiA+IEBAIC0xMTQsNiArMTE1LDcgQEAgdm9pZCBpb19pbml0KHZvaWQp
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICJGb3VuZCB1YXJ0IGF0ICVwLCBidXQgZWFybHkg
YmFzZSBpcyAlcC5cbiIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgIHVhcnQwX2Jhc2UsIFVB
UlRfRUFSTFlfQkFTRSk7Cj4gPiA+ICAgICAgIH0KPiA+ID4gKyNlbmRpZgo+ID4KPiA+IERvZXNu
J3QgdGhpcyBnZW5lcmF0ZSB1YXJ0MF9pbml0X2ZkdC9hY3BpIGRlZmluZWQgYnV0IG5vdCB1c2Vk
IHR5cGVzIG9mCj4gPiB3YXJuaW5ncz8KPiAKPiBObywgYnV0IGl0IHNob3VsZCBoYXZlLCBJJ2xs
IGZpeCBpdC4KPiAKPiA+IFdlIG5lZWQgdG8gcHV0IGV2ZXJ5dGhpbmcgdW51c2VkIHVuZGVyIHRo
ZSAjaWZuZGVmCj4gPiBDT05GSUdfU0JJX0NPTlNPTEUsIGp1c3QgYXMgdWFydDBfcmVhZC93cml0
ZSBhbHJlYWR5IGFyZS4gQWx0ZXJuYXRpdmVseSwKPiA+IHdlIGNhbiBrZWVwIGV2ZXJ5dGhpbmcg
b3V0IG9mIHRoZSAjaWZuZGVmIGFuZCBleHBvcnQuCj4gCj4gVGhlIHByb2JsZW0gaXMgdWFydDBf
aW5pdF9mZHQgcGFuaWNzIGlmIG5vIGNvbXBhdGlibGUgdWFydCB3YXMgZm91bmQuCgpMZXQncyBk
bwoKI2lmbmRlZiBDT05GSUdfU0JJX0NPTlNPTEUKICAgaWYgKHJldCkgewogICAgICAgcHJpbnRm
KCIlczogQ29tcGF0aWJsZSB1YXJ0IG5vdCBmb3VuZCBpbiB0aGUgZGV2aWNlIHRyZWUsIGFib3J0
aW5nLi4uXG4iLF9fZnVuY19fKTsKICAgICAgIGFib3J0KCk7CiAgIH0KI2Vsc2UKICAgdWFydDBf
YmFzZSA9IE5VTEw7CiAgIHJldHVybjsKI2VuZGlmCgpBbmQgdGhlbiBpbiB1YXJ0MF9wdXRzKCkg
ZG8gYSAKCiAgYXNzZXJ0KHVhcnQwX2Jhc2UpOwoKVGhpcyBydWxlcyBvdXQgbWFwcGluZyBhIHVh
cnQgYXQgcGh5c2ljYWwgYWRkcmVzcyB6ZXJvLCBidXQgaG9wZWZ1bGx5CnRoYXQncyBub3QgYSB0
aGluZy4gSWYgaXQgZXZlciBkb2VzIGFwcGVhciB0byBiZSBhIHRoaW5nLCB0aGVuIHdlIGNhbgpq
dXN0IGFkZCBhIGJvb2xlYW4gdG8gdHJhY2sgd2hldGhlciB0aGUgYmFzZSBhZGRyZXNzIGlzIHZh
bGlkIG9yIG5vdC4KQnV0IHdlJ2xsIGJ1cm4gdGhhdCBicmlkZ2Ugd2hlbiB3ZSBjcm9zcyBpdCBs
YXRlciwgaWYgZXZlci4KClRoYW5rcywKZHJldwoKPiAKPiBUaGFua3MsCj4gSmVzc2UgVGF1YmUK
PiA+IHZvaWQgc2JpX3B1dHMoY29uc3QgY2hhciAqcyk7Cj4gPiB2b2lkIHVhcnQwX3B1dHMoY29u
c3QgY2hhciAqcyk7Cj4gPgo+ID4gdGhlbiBqdXN0IGhhdmUgYSBzaW5nbGUgdXNlIG9mIHRoZSAj
aWZkZWYsCj4gPgo+ID4gdm9pZCBwdXRzKGNvbnN0IGNoYXIgKnMpCj4gPiB7Cj4gPiAjaWZkZWYg
Q09ORklHX1NCSV9DT05TT0xFCj4gPiAgICAgc2JpX3B1dHMocyk7Cj4gPiAjZWxzZQo+ID4gICAg
IHVhcnQwX3B1dHMocyk7Cj4gPiAjZW5kaWYKPiA+IH0KPiA+Cj4gPiBJIHRoaW5rIEkgbGlrZSB0
aGF0IGJldHRlciBzaW5jZSBpdCB3aWxsIGVuc3VyZSBhbGwgY29kZSBnZXRzIGNvbXBpbGUKPiA+
IHRlc3RlZCBhbGwgdGhlIHRpbWUgYW5kIGFsbG93IGFuIFNCSSBjb25zb2xlIHVzaW5nIHVuaXQg
dGVzdCB0byBhbHNvCj4gPiBhY2Nlc3MgaXRzIHVhcnQgaWYgaXQgaGFzIG9uZSwganVzdCBiZWNh
dXNlLi4uCj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+ID4KPiA+Cj4gPiA+ICB9Cj4gPiA+Cj4g
PiA+ICAjaWZkZWYgQ09ORklHX1NCSV9DT05TT0xFCj4gPiA+IC0tCj4gPiA+IDIuNDMuMAo+ID4g
Pgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cj4gCj4gLS0gCj4ga3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAo+IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
