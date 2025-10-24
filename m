Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B412ACCF9E3
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVAKccunCiY2dM6otwAWWkGAoQtIBAjpgdxxw4fZeWs=; b=M+lgrfdUsS1FPg
	twRq4xGhJ3mvKQ2EzQWyeO45qa9otGIN1lBmUnKOeCOg8J1/GFxHeDW3RQ8OmzipkLZYQ6aoQEryG
	yuKp5eMiEqhB0oSltmWy4wgyuTpl5Z0x42QvWNvFDv+P72e67DbOrBHWSZJT8QV9u+FqfO6xeODjx
	rxEan5nwXcKvT8HGZ9v4WCaLWnBDmqYIl5SY1fjzcP8TyqPulFxpFnxwpJ8Nk4MmWO16AAZCLJjaL
	CLkEJ1WA55Eo2pFVov3qdL3O6FQlaoJhrDo/8B3p43vNZ6z4rPpnUVoH/vjZj3MkZFT+dWajzRy6U
	j06WMM7YBVPCDTBuv1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCI9M-00000009aEe-1jqF;
	Fri, 24 Oct 2025 13:48:12 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCI9J-00000009aDd-23jm;
	Fri, 24 Oct 2025 13:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=f5diEmPPNESN80ndikOu8sUGisGcbXnl7Wuzqda4zCI=;
	b=cowho3UZrXu60pj6hLyZgrj6e7GPPu4DI6TCC4DGLfjR7uPu6wkkq3D9Zh9BmK
	spPrvzHhynmALK55kWB6iKst5T/HYd4LWzPlmLqxs7c+bf88LT/+W9C1zhWsnGsc
	4mIWLyPVud/T18l9MmsM0ZcNmM4EBs/vJ/gfLQKuAqoWA=
Received: from [IPV6:240e:38d:8311:d200:1962:a997:732d:a171] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wB3XpiRg_toJLfzCQ--.14430S2;
	Fri, 24 Oct 2025 21:48:01 +0800 (CST)
Message-ID: <7aa181d9-84fe-41e1-af6e-14a3ad6629ef@163.com>
Date: Fri, 24 Oct 2025 21:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org,
 kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
 <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
 <20251021-a97dc10e19bd8542675484dd@orel>
 <5ed53d05-2ed8-43dc-8a41-1906b6982c80@163.com>
 <DDOX5JZWQK87.2SZ1CS39ZZAOZ@ventanamicro.com>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <DDOX5JZWQK87.2SZ1CS39ZZAOZ@ventanamicro.com>
X-CM-TRANSID: _____wB3XpiRg_toJLfzCQ--.14430S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr45ZFykJr1kKr43Ar43Jrb_yoW5uF48pF
	4DC3WUKrWDta4xAry0gw1xtrW0ywn8AFy7Xr90qa48Ca4kKFnayr13Ka15Wa4fXr1xZ34j
	vr4Yg34fG34fZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQmRUUUUUU=
X-Originating-IP: [240e:38d:8311:d200:1962:a997:732d:a171]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYBbwoWj7d6T4AQABsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_064810_027769_5F12C59F 
X-CRM114-Status: GOOD (  20.39  )
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

T24gMTAvMjIvMjUgMjI6MjYsIFJhZGltIEtyxI1tw6HFmSB3cm90ZToKPiAyMDI1LTEwLTIyVDIx
OjEzOjA4KzA4OjAwLCBXdSBGZWkgPGF0d3VmZWlAMTYzLmNvbT46Cj4+IE9uIDEwLzIyLzI1IDA3
OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCAwOToz
Mjo1N1BNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4gMjAyNS0xMC0yMFQyMToy
NjoxOCswODowMCwgV3UgRmVpIDxhdHd1ZmVpQDE2My5jb20+Ogo+Pj4+PiBPbiAxMC8xOC8yNSAw
MDowNCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+Pj4+Pj4+IC0gICAgICAgICAgICAgICBndWVzdF9t
b2RlX2FwcGVuZChWTV9NT0RFX1A1NlY1N180Sywgc3ogPj0gNTkpOwo+Pj4+Pj4+IC0gICAgICAg
ICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A1MFY0OF80Sywgc3ogPj0gNTApOwo+
Pj4+Pj4+IC0gICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChWTV9NT0RFX1A0MVYzOV80
Sywgc3ogPj0gNDEpOwo+Pj4+Pj4+ICsgICAgICAgICAgICAgICBndWVzdF9tb2RlX2FwcGVuZChW
TV9NT0RFX1A1NlY1N180Sywgc2F0cF9tb2RlID49IFNBVFBfTU9ERV81NyAmJiBzeiA+PSA1OSk7
Cj4+Pj4+Pj4gKyAgICAgICAgICAgICAgIGd1ZXN0X21vZGVfYXBwZW5kKFZNX01PREVfUDUwVjQ4
XzRLLCBzYXRwX21vZGUgPj0gU0FUUF9NT0RFXzQ4ICYmIHN6ID49IDUwKTsKPj4+Pj4+PiArICAg
ICAgICAgICAgICAgZ3Vlc3RfbW9kZV9hcHBlbmQoVk1fTU9ERV9QNDFWMzlfNEssIHNhdHBfbW9k
ZSA+PSBTQVRQX01PREVfMzkgJiYgc3ogPj0gNDEpOwo+Pj4+Pj4KPj4+Pj4+IFNvbWV0aGluZyBh
bG9uZyB0aGVzZSBsaW5lcyB3YXMgd2hhdCBJIHdhcyBzdWdnZXN0aW5nIGluIHRoZSBsYXN0IHBh
dGNoLAo+Pj4+Pj4gYnV0IHdoZXJlIHdlIHNlbGVjdCBmcm9tIG1hbnkgbW9yZSBjb21iaW5hdGlv
bnMgb2YgUCBhbmQgViBmb3IgbW9kZXMuCj4+Pj4+Pgo+Pj4+Pj4gVk1fTU9ERV9QNDFWMzlfNEsK
Pj4+Pj4+IFZNX01PREVfUDQxVjQ4XzRLCj4+Pj4+PiBWTV9NT0RFX1A0MVY1N180Swo+Pj4+Pj4g
Vk1fTU9ERV9QNTBWNDhfNEsKPj4+Pj4+IFZNX01PREVfUDUwVjU3XzRLCj4+Pj4+PiBWTV9NT0RF
X1A1OVY1N180Swo+Pj4+Pgo+Pj4+PiBEbyB3ZSBuZWVkIG1vcmU/IGUuZy4gZm9yIHN2MzksIHRo
ZXJlIGNvdWxkIGJlIFA1MFYzOSBhbmQgUDU2VjM5Lgo+Pj4+Cj4+Pj4gQmFyZSBpcyBwcm9iYWJs
eSB0aGUgbW9zdCBpbXBvcnRhbnQgZmlyc3Qgc3RhZ2UgbW9kZSwgYXMgaXQncyB0aGUgb25seQo+
Pj4+IG9uZSB0aGF0IG1pZ2h0IGZ1bGx5IHRlc3QgdGhlIHR3byBleHRyYSBiaXRzIG9mIFN2NTd4
NC4KPj4+Cj4+PiBJbmRlZWQsIGJ1dCBmb3IgdGhhdCB3ZSBuZWVkIGEgbW9kZSBuYW1lZCBzb21l
dGhpbmcgbGlrZSBWTV9NT0RFX0JBUkU1OS4KPj4KPj4gVGhlIGN1cnJlbnQgY29kZSBoYXMgc29t
ZSBhc3N1bXB0aW9uIG9uIG5vbi1iYXJlIG1vZGUsIHN1Y2ggYXMgdmlydF9tYXAuCj4+IEl0IGxv
b2tzIG5vdCB0cml2aWFsIHRvIHN1cHBvcnQgQkFSRSBtb2RlLiBJcyBpdCBva2F5IHRvIGZvY3Vz
IG9uCj4+IG5vbi1iYXJlIG1vZGUgaW4gdGhpcyBzZXJpZXMsIGFuZCBsZWF2ZSBiYXJlIG1vZGUg
c3VwcG9ydCB0byBhbm90aGVyCj4+IHBhdGNoc2V0Pz4KPiAKPiBPZiBjb3Vyc2UuICBUaGVyZSBp
cyBubyBwb2ludCBpbiBhZGRpbmcgc3ltYm9scyB0aGF0IGFyZSBub3QgdXNlZC4KPiAKPj4+PiBJ
IHRoaW5rIGEgc2luZ2xlIGNvbWJpbmF0aW9uIHBlciAieDQiIG1vZGUgbWlnaHQgYmUgc3VmZmlj
aWVudCwgc2luY2UKPj4+PiBhbGwgbm9uLWJhcmUgZmlyc3Qgc3RhZ2VzIGdlbmVyYXRlIDU2LWJp
dCBwaHlzaWNhbCBhZGRyZXNzZXMgYW55d2F5LCBidXQKPj4+PiBpdCBtYWtlcyBzZW5zZSB0byBo
YXZlIGFsbCBvZiB0aGVtIGlmIHdlJ3JlIGRvaW5nIG1vcmUgdGhhbiBvbmUuCj4+Pgo+Pj4gWWVh
aCwgbWlnaHQgYXMgd2VsbC4KPj4KPj4gQWRkIGFsbCBvZiB0aGVtPwo+IAo+IFRlc3RzIGNhbm5v
dCBjaG9vc2UgaGdhdHA7IEtWTSBqdXN0IHRlbGxzIHVzIHRoYXQgdGhlIHBoeXNpY2FsIHdpZHRo
IGlzLgo+IFRoaXMgbWVhbnMgdGhhdCB3ZSBtdXN0IHN1cHBvcnQgdGhlIGZvbGxvd2luZzoKPiAK
PiAgICBWTV9NT0RFX1A0MVYzOV80Swo+ICAgIFZNX01PREVfUDUwVjM5XzRLCj4gICAgVk1fTU9E
RV9QNTlWMzlfNEsKPiAKPiBJIGRvbid0IHRoaW5rIGl0J3MgY29ycmVjdCB0byBhc3N1bWUgdGhh
dCB3aGVuIFN2QUJ4NCBpcyBzdXBwb3J0ZWQsIHRoZW4KPiBTdkFCIGlzIHN1cHBvcnRlZCwgaGVu
Y2Ugd2UgbXVzdCBoYXZlIFN2MzkgZm9yIGVhY2ggaGdhdHAgbW9kZSB0aGF0IEtWTQo+IHN1cHBv
cnRzLgoKQWdyZWVkLgoKPiAKPiBBbmQgc2hvdWxkbid0IGl0IGJlIGludmFsaWQgdG8gcGljayBW
TV9NT0RFX1A0MVYzOV80SyB3aGVuIEtWTSBpcyB1c2luZwo+IFN2NDh4ND8gIAoKQWdyZWVkLCBQ
NDEgaXMgbm90IGEgZ29vZCBjYW5kaWRhdGUgZm9yIFN2NDh4NC4KCj4gRm9yIHRlc3RzIHRoYXQg
dGhhdCBkb24ndCBjYXJlIGFib3V0IHBoeXNpY2FsIHdpZHRoLCB3ZSBjb3VsZAo+IGFkZDoKPiAK
PiAgICBWTV9NT0RFX1BYWFYzOV80SwoKSW50ZWwgYWRkcyBWTV9NT0RFX1BYWFY0OF80SyBiZWNh
dXNlICJ4ODZfNjQgbWFjaGluZXMgYXJlIGhhdmluZyB2YXJpb3VzIApwaHlzaWNhbCBhZGRyZXNz
IHdpZHRoIHJhdGhlciB0aGFuIHNvbWUgc3RhdGljIHZhbHVlcyIgYWNjb3JkaW5nIHRvIApjb21t
aXQgNTY3YTlmMWU5ZGUsIGFuZCB4ODYgaGFzIHRvIHByb2JlIHRoZSByZWFsIGdwYSB3aWR0aCBv
biB2bSAKY3JlYXRpb24uIFJJU0MtViBoYXMgMyBmaXhlZCBncGEgd2lkdGhzLCBzbyBtYXliZSB3
ZSBjYW4gdXNlIHRoZSAKZXhwbGljaXQgd2lkdGhzPwoKPiAKPiBJdCBkb2Vzbid0IHNlZW0gbmVj
ZXNzYXJ5IHRvIHN1cHBvcnQgbW9yZSB0aGFuIHRoYXQsIGJ1dCBpZiBvdXIgdGVzdHMKPiB3YW50
IGxhcmdlciB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UsIHdlIGNhbiBhZGQgVjQ4IGFuZCBWNTcgdmFy
aWFudHMuCgpJIHRoaW5rIFY0OC9WNTcgaXMgbmVjZXNzYXJ5LCBpZiBhIG1hY2hpbmUgaXMgZGVz
aWduZWQgdG8gaGF2ZSBTVjQ4IApndWVzdHMsIGl0J3MgYmV0dGVyIHRvIHRlc3QgaXQuCgpTbyBp
cyBpdCBva2F5IHRvIGhhdmUgdGhlIGNvbWJpbmF0aW9uIG9mIGFsbCA5IG1vZGVzPwoJUCg0MSwg
NTAsIDU2KSB4IFYoMzksIDQ4LCA1NykKQnV0IG9ubHkgc2V2ZXJhbCBvbmVzIGFyZSBwaWNrZWQg
dXAgZm9yIGEgc3BlY2lmaWMgbWFjaGluZSwganVzdCBhcyAKbWVudGlvbmVkIGFib3ZlLCB3ZSB3
b24ndCBzZWxlY3QgUDQxVjM5IGZvciBTdjQ4eDQgZXRjLgoKVGhhbmtzLApGZWkuCgo+IAo+IFRo
YW5rcy4KCgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
