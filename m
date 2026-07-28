Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2820C531F9
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:Subject:In-Reply-To:
	References:Mime-Version:Date:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5sOFgMgXOZ3UWG6MK8E3zJ6p16KMxq5g2TNBzMCE78=; b=po0cPLf7uOL1yr
	yejGSZVclr8++2d7bzuojDy9H6N4noD2lKFWPs8rPi92H7JFKyU8E4xqdVJSR5ZFFuAfiqBWA/qpK
	VIyt5mUIiFI8eOaUroHPSC/1FznFsEAjMF8tWEVGAbcsED1NO8zuSu+irZgwXmlqSZ8hZzvGVBz1z
	RWSRW81LYrorq/Dd99P8gllRKbUfWuJ1ys53KMSBnopIx+RkNgMTSKmSSyOilnEJqpTvyp7Tr7B80
	jIJPCPGUt2Q2llfV4EIVRRZWilvtqnkEMSlvmW7MBgBKNJOR3ESPn9fBGFBXN1xWMSul9JVzDntg6
	lO7azfJkfd1dyzE0WHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woknW-00000005pxF-3Uxo;
	Tue, 28 Jul 2026 16:36:54 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woknU-00000005pwa-0SC3
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785256602; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UqSzfZD/yy5iBL6j0bWJrIqUDWKu6ZWP8mPJEJHjZ9s=;
 b=MwmDHwv3NxNOWvLXZl8YPTHZPp1GieqEWC4Da2bgB5NR8ZzDu84VCMhOu97h+1y7pbiUht
 J9fr+DbyWzytHVt7FekmlupIZ03hI99nPf/7HqEAM1nVSzLFU+oeKX3P3AIWbh4NzRhCRH
 KHwcOyTrygr1vQi9WNzVIPPmvS4wrnCt/JrHFAlO/S9geaWRW0dZE+sgXt2CzkcMYgEUJ0
 150viqWuTM4oVOFkiSH5s4uCEh1tDKmcVaj7xTNE5P14zGOpwcGrAk5rfJfuJryWChwIpM
 nM0S1lRNNPCehBVBWkNpi+Xbj5rQjvm1qZ5rsYBECJyOsRuRy8BcySJD4HMwyw==
Cc: <yang.yicong@picoheart.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<geshijian@picoheart.com>, <shenyang.young@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Wed, 29 Jul 2026 00:36:37 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a68da99+7e6419+lists.infradead.org+yang.yicong@picoheart.com>
References: <20260728141938.95845-1-yang.yicong@picoheart.com> <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from [192.168.0.109] ([27.38.181.244]) by smtp.feishu.cn with ESMTPS; Wed, 29 Jul 2026 00:36:40 +0800
To: "Anup Patel" <anup@brainfault.org>
Message-Id: <dbf5e68a-db4e-414e-aea0-085ceed4365f@picoheart.com>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093652_224929_0A08B4E7 
X-CRM114-Status: GOOD (  12.11  )
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

T24gNy8yOC8yNiAxMTo1NyBQTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUsIEp1bCAyOCwg
MjAyNiBhdCA3OjQ54oCvUE0gWWljb25nIFlhbmcgPHlhbmcueWljb25nQHBpY29oZWFydC5jb20+
IHdyb3RlOgo+Pgo+PiBDdXJyZW50bHkgdGhlIFJNVyBmb3IgSU1TSUMgTVJJRiBpcyBpbXBsZW1l
bnRlZCB3aXRoCj4+IHdvcmQgTFJTQyBsb29wLiBUaGlzIHdpbGwgb25seSBjb3ZlciB0aGUgbG93
ZXIgMzJiaXQKPj4gb24gYSA2NGJpdCBzeXN0ZW0uIEluc3RlYWQgb2YgZ3VhcmQgdGhlIGltcGxl
bWVudGF0aW9uCj4+IHdpdGggQ09ORklHXzY0QklUIGhlcmUsIHVzZSB0cnlfY21weGNoZygpIHdy
YXBwZXIKPj4gd2hpY2ggaGFzIGFscmVhZHkgdGFrZSBjYXJlIHRoaXMgdG8gZml4IHRoaXMgaXNz
dWUuCj4+IEl0IGNhbiBhbHNvIHVzZSBBTU8gaW5zdHJ1Y3Rpb25zIG9uIHN1cHBvcnRlZCBzeXN0
ZW0uCj4+Cj4+IEZpeGVzOiBkYjhiN2U5N2Q2MTMgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5l
bCB2aXJ0dWFsaXphdGlvbiBvZiBBSUEgSU1TSUMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBZaWNvbmcg
WWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYyB8IDE1ICsrKysrKy0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPj4gaW5kZXgg
ZDM4ZjVkZTA4MzRjLi5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4+IEBAIC0y
MjAsMTUgKzIyMCwxMiBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19y
bXcoc3RydWN0IGltc2ljX21yaWYgKm1yaWYsCj4+ICB7Cj4+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBvbGRfdmFsID0gMCwgdG1wID0gMDsKPj4KPj4gLSAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoCj4+IC0gICAgICAgICAgICAgICAiMDogICAgIGxyLncuYXEgICAlMSwgJTBcbiIKPj4gLSAg
ICAgICAgICAgICAgICIgICAgICAgYW5kICAgICAgICUyLCAlMSwgJTNcbiIKPj4gLSAgICAgICAg
ICAgICAgICIgICAgICAgb3IgICAgICAgICUyLCAlMiwgJTRcbiIKPj4gLSAgICAgICAgICAgICAg
ICIgICAgICAgc2Mudy5ybCAgICUyLCAlMiwgJTBcbiIKPj4gLSAgICAgICAgICAgICAgICIgICAg
ICAgYm5leiAgICAgICUyLCAwYiIKPj4gLSAgICAgICAgICAgICAgIDogIitBIiAoKnB0ciksICIr
ciIgKG9sZF92YWwpLCAiK3IiICh0bXApCj4+IC0gICAgICAgICAgICAgICA6ICJyIiAofndyX21h
c2spLCAiciIgKG5ld192YWwgJiB3cl9tYXNrKQo+PiAtICAgICAgICAgICAgICAgOiAibWVtb3J5
Iik7Cj4+ICsgICAgICAgbmV3X3ZhbCAmPSB3cl9tYXNrOwo+PiArCj4+ICsgICAgICAgb2xkX3Zh
bCA9IFJFQURfT05DRSgqcHRyKTsKPj4gKyAgICAgICBkbyB7Cj4+ICsgICAgICAgICAgICAgICB0
bXAgPSAob2xkX3ZhbCAmIH53cl9tYXNrKSB8IG5ld192YWw7Cj4+ICsgICAgICAgfSB3aGlsZSAo
IXRyeV9jbXB4Y2hnKHB0ciwgJm9sZF92YWwsIHRtcCkpOwo+IAo+IFRoaXMgcGF0Y2ggaXMgYWxy
ZWFkeSBicm9rZW4gYmVjYXVzZSAib2xkX3ZhbCA9IFJFQURfT05DRSgqcHRyKTsiCj4gbXVzdCBi
ZSBkb25lIGluc2lkZSB0aGUgZG8geyAuLi4gfSB3aGlsZSAoLi4uKQo+IAoKdHJ5X2NtcHhoZygp
IHdpbGwgdXBkYXRlIHRoZSAmb2xkX3ZhbCBpZiBmYWlsZWQgdG8gZXhjaGFuZ2UsIHRoZW4KYSBz
ZWNvbmQgUkVBRF9PTkNFKCkgd2l0aGluIHRoZSBsb29wIHdpbGwgYmUgcmVkdW5kYW50LCByaWdo
dD8KCnRoYW5rcy4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
