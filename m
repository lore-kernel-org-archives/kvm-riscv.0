Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37569CCD1BB
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmO2uktt+deeySLPbR4SXXZiMBqDAfStXkmNcJF5ES0=; b=hHL6Zw8GcyNNMu
	92WudfsZ8nhGRZcY+CB4OUDQ9eOr0DIW0k5d3g5ziuqrewHOz0amABbhIP71ejdz7vWWtTRaOQV36
	HQTcDjmg/cEhdzeqARoorVpJ8STsPW3laaVkVzvv6jzbjyAQ7bfMWf/+iKzaa1aAkKMSDgbIZXkfC
	buz79XAnV2uf3L4StPFtaNJxKToaTqVm8gdr8qKhLcy0rgHyjIJ7h0VGr7aonjX2buAtOA1Uq2uuZ
	fuCyaDxO2CVqbtK7GnzofElTxjqiRnQRozqbjFVDwYw7wN3qp0og9UMc8KzcLsEg/QYe8cBVdIEQ8
	jP4EJCH6jWftwkMOA4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYeX-00000002xIG-3ErT;
	Wed, 22 Oct 2025 13:13:21 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYeU-00000002xCs-3Tnm;
	Wed, 22 Oct 2025 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=dNFjraCpNh7+75LVcDevdXj5Re6gnRD7Ns+uq9Y59qE=;
	b=kvM4xxQzDTqkaRY9ie5pTqz47tIuX8x+eypjtyZEVGjUTiJCCIOcKMLqhkDIig
	W1yNaNmxQ2rJ4dO/wc0w+h95VuXxm6ZR5n+3ouC5gYEKCl8xd2iSxaqr6z+5+USj
	dB6bPPixQkZVenezOIZeDYUx1IvGybVlMTe0tg9a+zqH0=
Received: from [IPV6:240e:38d:8311:d200:fe66:484:83e8:525c] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCHzKhk2PhoLPlTBA--.36428S2;
	Wed, 22 Oct 2025 21:13:10 +0800 (CST)
Message-ID: <5ed53d05-2ed8-43dc-8a41-1906b6982c80@163.com>
Date: Wed, 22 Oct 2025 21:13:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
To: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org,
 kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
 <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
 <20251021-a97dc10e19bd8542675484dd@orel>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20251021-a97dc10e19bd8542675484dd@orel>
X-CM-TRANSID: PygvCgCHzKhk2PhoLPlTBA--.36428S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFyUAw4kZF4xCFWkJw45Awb_yoW5XrW7pF
	Z8C3W8K3yDJa47ZF1Igw1rtr4vywn5AFyUWry7tas7Ca4qgr12yr43Ka15W3s3Ar1xZry0
	vr4agwn3G393ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVwZxUUUUU=
X-Originating-IP: [240e:38d:8311:d200:fe66:484:83e8:525c]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYhLuoWj4yeK65QABsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061319_238163_DD7EFAEB 
X-CRM114-Status: GOOD (  19.40  )
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

T24gMTAvMjIvMjUgMDc6NTUsIEFuZHJldyBKb25lcyB3cm90ZToKPiBPbiBNb24sIE9jdCAyMCwg
MjAyNSBhdCAwOTozMjo1N1BNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IDIwMjUt
MTAtMjBUMjE6MjY6MTgrMDg6MDAsIFd1IEZlaSA8YXR3dWZlaUAxNjMuY29tPjoKPj4+IE9uIDEw
LzE4LzI1IDAwOjA0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+Pj4+IC0gICAgICAgICAgICAgICBn
dWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1NlY1N180Sywgc3ogPj0gNTkpOwo+Pj4+PiAtICAg
ICAgICAgICAgICAgZ3Vlc3RfbW9kZV9hcHBlbmQoVk1fTU9ERV9QNTBWNDhfNEssIHN6ID49IDUw
KTsKPj4+Pj4gLSAgICAgICAgICAgICAgIGd1ZXN0X21vZGVfYXBwZW5kKFZNX01PREVfUDQxVjM5
XzRLLCBzeiA+PSA0MSk7Cj4+Pj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChW
TV9NT0RFX1A1NlY1N180Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV81NyAmJiBzeiA+PSA1OSk7
Cj4+Pj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1MFY0OF80
Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV80OCAmJiBzeiA+PSA1MCk7Cj4+Pj4+ICsgICAgICAg
ICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A0MVYzOV80Sywgc2F0cF9tb2RlID49
IFNBVFBfTU9ERV8zOSAmJiBzeiA+PSA0MSk7Cj4+Pj4KPj4+PiBTb21ldGhpbmcgYWxvbmcgdGhl
c2UgbGluZXMgd2FzIHdoYXQgSSB3YXMgc3VnZ2VzdGluZyBpbiB0aGUgbGFzdCBwYXRjaCwKPj4+
PiBidXQgd2hlcmUgd2Ugc2VsZWN0IGZyb20gbWFueSBtb3JlIGNvbWJpbmF0aW9ucyBvZiBQIGFu
ZCBWIGZvciBtb2Rlcy4KPj4+Pgo+Pj4+IFZNX01PREVfUDQxVjM5XzRLCj4+Pj4gVk1fTU9ERV9Q
NDFWNDhfNEsKPj4+PiBWTV9NT0RFX1A0MVY1N180Swo+Pj4+IFZNX01PREVfUDUwVjQ4XzRLCj4+
Pj4gVk1fTU9ERV9QNTBWNTdfNEsKPj4+PiBWTV9NT0RFX1A1OVY1N180Swo+Pj4KPj4+IERvIHdl
IG5lZWQgbW9yZT8gZS5nLiBmb3Igc3YzOSwgdGhlcmUgY291bGQgYmUgUDUwVjM5IGFuZCBQNTZW
MzkuCj4+Cj4+IEJhcmUgaXMgcHJvYmFibHkgdGhlIG1vc3QgaW1wb3J0YW50IGZpcnN0IHN0YWdl
IG1vZGUsIGFzIGl0J3MgdGhlIG9ubHkKPj4gb25lIHRoYXQgbWlnaHQgZnVsbHkgdGVzdCB0aGUg
dHdvIGV4dHJhIGJpdHMgb2YgU3Y1N3g0Lgo+IAo+IEluZGVlZCwgYnV0IGZvciB0aGF0IHdlIG5l
ZWQgYSBtb2RlIG5hbWVkIHNvbWV0aGluZyBsaWtlIFZNX01PREVfQkFSRTU5LgoKVGhlIGN1cnJl
bnQgY29kZSBoYXMgc29tZSBhc3N1bXB0aW9uIG9uIG5vbi1iYXJlIG1vZGUsIHN1Y2ggYXMgdmly
dF9tYXAuIApJdCBsb29rcyBub3QgdHJpdmlhbCB0byBzdXBwb3J0IEJBUkUgbW9kZS4gSXMgaXQg
b2theSB0byBmb2N1cyBvbiAKbm9uLWJhcmUgbW9kZSBpbiB0aGlzIHNlcmllcywgYW5kIGxlYXZl
IGJhcmUgbW9kZSBzdXBwb3J0IHRvIGFub3RoZXIgCnBhdGNoc2V0Pz4KPj4KPj4gSSB0aGluayBh
IHNpbmdsZSBjb21iaW5hdGlvbiBwZXIgIng0IiBtb2RlIG1pZ2h0IGJlIHN1ZmZpY2llbnQsIHNp
bmNlCj4+IGFsbCBub24tYmFyZSBmaXJzdCBzdGFnZXMgZ2VuZXJhdGUgNTYtYml0IHBoeXNpY2Fs
IGFkZHJlc3NlcyBhbnl3YXksIGJ1dAo+PiBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIGFsbCBvZiB0
aGVtIGlmIHdlJ3JlIGRvaW5nIG1vcmUgdGhhbiBvbmUuCj4gCj4gWWVhaCwgbWlnaHQgYXMgd2Vs
bC4KCkFkZCBhbGwgb2YgdGhlbT8KCj4gCj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiArICAgICAgICAg
ICAgICAgLy8gc2V0IHRoZSBmaXJzdCAobWF4aW11bSkgc3VwcG9ydGVkIG1vZGUgYXMgZGVmYXVs
dAo+Pj4+Cj4+Pj4gUGxlYXNlLCBubyBDKysgY29tbWVudHMsIGFuZCBkb24ndCB3ZSB3YW50IGEg
VjM5IG1vZGUgdG8gYmUgdGhlIGRlZmF1bHQ/Cj4+Pj4gSW4gZmFjdCwgVk1fTU9ERV9QNDFWMzlf
NEsgc2hvdWxkIGFsd2F5cyBiZSBzdXBwb3J0ZWQsIHNvIHdlIGNhbiBqdXN0IHNldAo+Pj4+IFZN
X01PREVfREVGQVVMVCB0byB0aGF0Lgo+Pj4KPj4+IEl0J3MgbGlrZWx5IHRoZSBtYXhpbXVtIHN1
cHBvcnRlZCBtb2RlIGlzIHRoZSBtb3N0IGNvbW1vbiBjb25maWd1cmF0aW9uCj4+PiBvbiBwcm9k
dWN0aW9uPwo+Pgo+PiBZZXMsIEtWTSBjdXJyZW50bHkgcGlja3MgdGhlIHdpZGVzdCBtb2RlLCBh
bHRob3VnaCBJIHRoaW5rIHRoZSBvcHRpbWFsCj4+IGNob2ljZSBvZiBoZ2F0cCBpcyB0aGUgc21h
bGxlc3Qgb25lIHRoYXQgZnVsbHkgY292ZXJzIHRoZSB3aG9sZSBndWVzdAo+PiBwaHlzaWNhbCBh
ZGRyZXNzIHNwYWNlLgo+Pgo+PiAoZS5nLiBpZiBhbGwgZ3Vlc3QgbWVtb3J5IGlzIG1hcHBlZCBi
ZWxvdyAyIFRpQiwgS1ZNIHNob3VsZCBwaWNrIFN2Mzl4NAo+PiAgIGZvciBpdHMgaGdhdHAsIHJl
Z2FyZGxlc3Mgb2Ygd2hhdCBpcyB0aGUgd2lkZXN0IHN1cHBvcnRlZCBtb2RlLikKPiAKPiBZZXMs
IGFuZCBmb3IgdGhlIHRlc3RzLCBJIHRoaW5rIHRoZSBndWVzdCBjb25maWcgY2FuIGp1c3QgZGVm
YXVsdCB0byB0aGUKPiBtaW5pbWFsLiBUZXN0cyB0aGF0IG5lZWQgcGFydGljdWxhciBtb2RlcyBj
YW4gc2VsZWN0IHRoZW0gd2hlbiBzdXBwb3J0ZWQuCj4gV2UgZW5zdXJlIHRlc3RzIHJ1biB0aGUg
c2FtZSBjb2RlIG9uIGFsbCBob3N0cyB0aGlzIHdheSB3aGVuIHRoZSBtb2RlCj4gc2VsZWN0ZWQg
aXNuJ3Qgd2hhdCdzIHVuZGVyIHRlc3QuCgpPSy4KClRoYW5rcywKRmVpLgoKPiAKPiBUaGFua3Ms
Cj4gZHJldwoKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
