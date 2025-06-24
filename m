Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ADFC77B7F
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kCFTpYxX1n6PyxXp88BI+yiaM6VACJchZMjto64sg8=; b=crqihpNiwyow9+
	ctiL0fD4FvnJBqXE4wnalEGvgpMv5GmIM81/h8Yb2sayElyV69AXxYJ6Ia1SNkkO/aMG8YjIarpVB
	kTvzyvaIh770FDVN/OwL69FdarLhAewGdaIBm+gv4+8PCmPv+g4/H044se1DpGBG+vZl+quzRhfVy
	nF/yx0D557qUfMpKaB4R/yHIvbz/y1OPQUriknkS1v7HCLydgk7ae9dLDq+W5JzmKpX/H775+WGXx
	MxA8BwfEJ01S/asccbaKgLaJ5RBKphd2Dc9X77C+ND2lpGhNj9JUumGnLT6SYEbJMWa+p0RnSaSqd
	GbQ28p1N/b6km26UpdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzVO-000000056Zd-3AQN;
	Tue, 24 Jun 2025 08:59:50 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzDq-000000053oJ-3d2Z
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 08:41:44 +0000
Date: Tue, 24 Jun 2025 10:41:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750754500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZJk1co4OhHhKxG5ybsrLzoSEb0nCOo3fmKlGka1MHg=;
	b=ozbY9Al3iiJNs8m0qlPPplG13XOr4UHQAfIKaSCfF1xOj8JPwCLLaO8AOD8naHiyLY9uKX
	Nbf6eienajX9v67L1aP6XLVTmrJS8LaLQ0jG+nuvFNgLE8DdeNy0lJo2py48bG97y6k8OO
	xCks1cKu0aXWQQ75KyehYEvqtW2byNU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: lib: sbi_shutdown add exit code.
Message-ID: <20250624-9f7044f67c5054d0a948b94a@orel>
References: <20250620155051.68377-1-jesse@rivosinc.com>
 <20250623-c4c3115e6402176024bac6ea@orel>
 <CALSpo=YQun4owTSkCULpgSu386nHK4q8kuU--oif4Wtw2S_V1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSpo=YQun4owTSkCULpgSu386nHK4q8kuU--oif4Wtw2S_V1w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_014143_065564_797F8141 
X-CRM114-Status: GOOD (  29.06  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMDM6NDY6MzFQTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gT24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMTA6MDHigK9BTSBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0BsaW51eC5kZXY+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgSnVuIDIwLCAyMDI1
IGF0IDA4OjUwOjUxQU0gLTA3MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+ID4gPiBXaGVuIGV4aXRp
bmcgaXQgbWF5IGJlIHVzZWZ1bCBmb3IgdGhlIHNiaSBpbXBsZW1lbnRhdGlvbiB0byBrbm93IHRo
ZQo+ID4gPiBleGl0IGNvZGUuCj4gPiA+IEFkZCBleGl0IGNvZGUgdG8gc2JpX3NodXRkb3duLCBh
bmQgdXNlIGl0IGluIGV4aXQoKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1
YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBsaWIvcmlzY3YvYXNtL3Ni
aS5oIHwgMiArLQo+ID4gPiAgbGliL3Jpc2N2L2lvLmMgICAgICB8IDIgKy0KPiA+ID4gIGxpYi9y
aXNjdi9zYmkuYyAgICAgfCA0ICsrLS0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2
L2FzbS9zYmkuaCBiL2xpYi9yaXNjdi9hc20vc2JpLmgKPiA+ID4gaW5kZXggYTU3MzhhNWMuLmRl
MTFjMTA5IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvcmlzY3YvYXNtL3NiaS5oCj4gPiA+ICsrKyBi
L2xpYi9yaXNjdi9hc20vc2JpLmgKPiA+ID4gQEAgLTI1MCw3ICsyNTAsNyBAQCBzdHJ1Y3Qgc2Jp
cmV0IHNiaV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcg
YXJnNCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnNSk7Cj4g
PiA+Cj4gPiA+IC12b2lkIHNiaV9zaHV0ZG93bih2b2lkKTsKPiA+ID4gK3ZvaWQgc2JpX3NodXRk
b3duKHVuc2lnbmVkIGludCBjb2RlKTsKPiA+ID4gIHN0cnVjdCBzYmlyZXQgc2JpX2hhcnRfc3Rh
cnQodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVuc2lnbmVkIGxvbmcgZW50cnksIHVuc2lnbmVkIGxv
bmcgc3ApOwo+ID4gPiAgc3RydWN0IHNiaXJldCBzYmlfaGFydF9zdG9wKHZvaWQpOwo+ID4gPiAg
c3RydWN0IHNiaXJldCBzYmlfaGFydF9nZXRfc3RhdHVzKHVuc2lnbmVkIGxvbmcgaGFydGlkKTsK
PiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9pby5jIGIvbGliL3Jpc2N2L2lvLmMKPiA+ID4g
aW5kZXggZmI0MGFkYjcuLjAyMjMxMjY4IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvcmlzY3YvaW8u
Ywo+ID4gPiArKysgYi9saWIvcmlzY3YvaW8uYwo+ID4gPiBAQCAtMTUwLDcgKzE1MCw3IEBAIHZv
aWQgaGFsdChpbnQgY29kZSk7Cj4gPiA+ICB2b2lkIGV4aXQoaW50IGNvZGUpCj4gPiA+ICB7Cj4g
PiA+ICAgICAgIHByaW50ZigiXG5FWElUOiBTVEFUVVM9JWRcbiIsICgoY29kZSkgPDwgMSkgfCAx
KTsKPiA+ID4gLSAgICAgc2JpX3NodXRkb3duKCk7Cj4gPiA+ICsgICAgIHNiaV9zaHV0ZG93bihj
b2RlICYgMSk7Cj4gPiA+ICAgICAgIGhhbHQoY29kZSk7Cj4gPiA+ICAgICAgIF9fYnVpbHRpbl91
bnJlYWNoYWJsZSgpOwo+ID4gPiAgfQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L3NiaS5j
IGIvbGliL3Jpc2N2L3NiaS5jCj4gPiA+IGluZGV4IDI5NTkzNzhmLi45ZGQxMWU5ZCAxMDA2NDQK
PiA+ID4gLS0tIGEvbGliL3Jpc2N2L3NiaS5jCj4gPiA+ICsrKyBiL2xpYi9yaXNjdi9zYmkuYwo+
ID4gPiBAQCAtMTA3LDkgKzEwNyw5IEBAIHN0cnVjdCBzYmlyZXQgc2JpX3NzZV9pbmplY3QodW5z
aWduZWQgbG9uZyBldmVudF9pZCwgdW5zaWduZWQgbG9uZyBoYXJ0X2lkKQo+ID4gPiAgICAgICBy
ZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRfU1NFLCBTQklfRVhUX1NTRV9JTkpFQ1QsIGV2ZW50X2lk
LCBoYXJ0X2lkLCAwLCAwLCAwLCAwKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gLXZvaWQgc2JpX3No
dXRkb3duKHZvaWQpCj4gPiA+ICt2b2lkIHNiaV9zaHV0ZG93bih1bnNpZ25lZCBpbnQgY29kZSkK
PiA+ID4gIHsKPiA+ID4gLSAgICAgc2JpX2VjYWxsKFNCSV9FWFRfU1JTVCwgMCwgMCwgMCwgMCwg
MCwgMCwgMCk7Cj4gPiA+ICsgICAgIHNiaV9lY2FsbChTQklfRVhUX1NSU1QsIDAsIDAsIGNvZGUs
IDAsIDAsIDAsIDApOwo+ID4KPiA+IFdlIGNhbid0IGRvIHRoaXMgYmVjYXVzZSBhIGt2bS11bml0
LXRlc3RzIGV4aXQgY29kZSBpcyBub3QgYW4KPiA+IFNSU1Q6OnJlc2V0X3JlYXNvblsxXS4gVGhp
cyBjb3VsZCByZXN1bHQgaW4gdGhlIFNCSSBpbXBsZW1lbnRhdGlvbgo+ID4gcmV0dXJuaW5nIGFu
IGVycm9yLCBvciBkb2luZyBzb21ldGhpbmcgZWxzZSwgcmF0aGVyIHRoYW4gc2h1dHRpbmcKPiA+
IGRvd24uCj4gCj4gWWVzIHRoYXQncyB3aHkgdGhlcmUgaXM6Cj4gK3NiaV9zaHV0ZG93bihjb2Rl
ICYgMSk7CgpBaCwgSSBvdmVybG9va2VkIHRoYXQuCgo+IEFkbWl0dGVkbHkgaXQgc2hvdWxkIHBy
b2JhYmx5IGJlOgo+ICtzYmlfc2h1dGRvd24oISFjb2RlKTsKCkluZGVlZCwgaXQgd291bGQgb25s
eSB3b3JrIG5vdyBiZWNhdXNlIGJpdCAwIGlzIHNldCBpbiB0aGUgYWJvcnQKZXhpdCBjb2RlLgoK
PiAKPiA+Cj4gPiBJZiB0aGlzIGlzIGEgY3VzdG9tIGt2bS11bml0LXRlc3RzLXNwZWNpZmljIFNC
SSBpbXBsZW1lbnRhdGlvbiwgdGhlbgo+ID4gd2UgY291bGQgcGFzcyBpbiBhIHJlc2V0X3JlYXNv
biBpbiB0aGUgMHhFMDAwMDAwMCAtIDB4RUZGRkZGRkYgcmFuZ2UuCj4gCj4gVGhhdCBzdGlsbCBk
b2Vzbid0IGd1YXJhbnRlZSBpdCB0byBzdWNjZWVkLgo+IEluIHRoZSBleGl0IGZ1bmN0aW9uIHdl
IGNhbiBhZGQgYSBmYWxsYmFjayBsaWtlIGBzYmlfc2h1dGRvd24oMCk7YCwKPiBidXQgcmVhc29u
IGNvZGUgMSAoU3lzdGVtIGZhaWx1cmUpIHNob3VsZCBhbHdheXMgd29yay4KPiBJZiBhbnlvbmUg
d2FudHMgdG8gdXNlIGl0IGZvciBTQkkgc3BlY2lmaWMgY29kZXMsIHRoYXQncyBmaW5lLAo+IGJ1
dCBJIG9ubHkgYWRkZWQgaXQgZm9yIHRoZSBObyByZWFzb24gYW5kIFN5c3RlbSBmYWlsdXJlIGV4
aXQgY29kZXMuCgpZdXAsIEkgc2VlIG5vdyB0aGF0IHRoZSBpbnRlbnRpb24gaXMganVzdCB0byBz
YXkgc3VjY2Vzcy9mYWlsdXJlLCBub3QKcGFzcyBkb3duIHRoZSBhY3R1YWwgZXhpdCBjb2RlLiBU
aGUgY29tbWl0IG1lc3NhZ2Ugc2F5cyBleGl0IGNvZGUsCnRob3VnaCwgd2hpY2ggaXMgd2h5IEkg
ZGlkbid0IHJlYWQgdGhlIHBhdGNoIGNsb3NlbHkuCgpQbGVhc2Ugc2VuZCBhIHYyIHdpdGggdGhl
ICEhIGNoYW5nZSBhbmQgYSBjaGFuZ2UgdG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKVGhhbmtzLApk
cmV3CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
