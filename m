Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00975CF34D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:From:Message-Id
	:Date:In-Reply-To:Subject:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nU98vaYTRQ7km0VwCFuwaPwlhq4d+8M0B1RGDYKAeJQ=; b=qkLJlEBgrcRc4G
	obSg4x8pReC41E7+q6PgR2c+yyXxj08o8o/03r7iKIuNm4ip/xCUuAfhjbT/X5e4lo/b7Cpndp8CD
	ItwVDzqPk19lYKZ/93Yn96RrGuHQnWof0VERKJRzxvyISJ+xdk4OoWtYb8yoXLwadj9mjBwFX+Lmy
	LtfhOV7qCirBdMAyxkDq/6h+rsXEn2zk20T5dylNK1buKDE0vbG/AOsuT2/W8MXxrqtLQc5kvRwrQ
	eiT+qus4vbqyq2b/auFVGnF5PzzD3X7vM1nG9vgsid1WUUsE1b7ITfxCqOAEqc92k9WpkHUGhPIDr
	9ErLMQTxqDZE09wtisCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkZ5-00000003cB2-37d9;
	Wed, 19 Nov 2025 15:57:51 +0000
Received: from sg-1-101.ptr.blmpb.com ([118.26.132.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkZ2-00000003c9X-0qyP
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 15:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1763567861; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mQ45HxHEz7bEk0U1Kg7KEiKQ1cBt2yG8qBc7T+EeuPs=;
 b=UqQV/M0KVnqVIbes+T1VV5SYDQBUho8kznxbAiYsToK+jUa4il3/H/XbholIfk2vhMtJjp
 qBcw52taj1iZnwQoxlvwy6vQyl96TiF5DLpAY/hnB8OKpiyrxr3bxooNrdZddhA7V4FTh5
 cModvja+7QNJsvuYxDrSOrVjKQI+lSnHCBf4TMYmvtLXrpNTTgkaB6Xadywgbtlfw2YI4R
 1HMOwLrt30weNo9TEwQpsV6nTf4bz4Zbwq3Jq/+Ttc+NwLbHFhn89RC5I13WCOSG9aNnOl
 yfod9OGzB8lb4c9K7hvmAD7rJwuVYmdbbk2hWYvfNJf/0OF4eMx4QOpG4cabOQ==
To: "Paul Walmsley" <pjw@kernel.org>
Cc: <patchwork-bot+linux-riscv@kernel.org>, 
	<linux-riscv@lists.infradead.org>, <corbet@lwn.net>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>, 
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <will@kernel.org>, 
	<peterz@infradead.org>, <boqun.feng@gmail.com>, <mark.rutland@arm.com>, 
	<anup@brainfault.org>, <atish.patra@linux.dev>, <pbonzini@redhat.com>, 
	<shuah@kernel.org>, <parri.andrea@gmail.com>, <ajones@ventanamicro.com>, 
	<brs@rivosinc.com>, <guoren@kernel.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-kselftest@vger.kernel.org>, <apw@canonical.com>, 
	<joe@perches.com>, <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
In-Reply-To: <b7dc669e-cc48-f163-0146-0ef37dbd19ec@kernel.org>
X-Lms-Return-Path: <lba+1691de8f3+3986f9+lists.infradead.org+luxu.kernel@bytedance.com>
Date: Wed, 19 Nov 2025 23:57:38 +0800
Message-Id: <b0b0f9d727b334fa569c726fc13490dd51d4fe42.7caea664.2799.41de.8705.9603c8f00a51@bytedance.com>
From: =?utf-8?q?=E8=B7=AF=E6=97=AD?= <luxu.kernel@bytedance.com>
Mime-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com> <176355541475.758643.7685467502830246491.git-patchwork-notify@kernel.org>
	<b7dc669e-cc48-f163-0146-0ef37dbd19ec@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075748_600938_AB4D59AA 
X-CRM114-Status: GOOD (  15.84  )
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

SGkgUGF1bCwKCkkgd2lsbCBjb250aW51ZSB3aXRoIHRoaXMgd29yay4gQW5kIHRoYW5rcyBmb3Ig
QW5kcmVhJ3MgZmVlZGJhY2suCgpCZXN0IFJlZ2FyZHMsClh1IEx1Cgo+IEZyb206ICJQYXVsIFdh
bG1zbGV5IjxwandAa2VybmVsLm9yZz4KPiBEYXRlOsKgIFdlZCwgTm92IDE5LCAyMDI1LCAyMzo0
Mgo+IFN1YmplY3Q6wqAgUmU6IFtQQVRDSCB2NCAwMC8xMF0gcmlzY3Y6IEFkZCBaYWxhc3IgSVNB
IGV4dGVuc2lvbiBzdXBwb3J0Cj4gVG86IDxwYXRjaHdvcmstYm90K2xpbnV4LXJpc2N2QGtlcm5l
bC5vcmc+Cj4gQ2M6ICJYdSBMdSI8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4sIDxsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPiwgPGNvcmJldEBsd24ubmV0PiwgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4sIDxwYWxtZXJAZGFiYmVsdC5jb20+LCA8YW91QGVlY3MuYmVya2VsZXku
ZWR1PiwgPGFsZXhAZ2hpdGkuZnI+LCA8cm9iaEBrZXJuZWwub3JnPiwgPGtyemsrZHRAa2VybmVs
Lm9yZz4sIDxjb25vcitkdEBrZXJuZWwub3JnPiwgPHdpbGxAa2VybmVsLm9yZz4sIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4sIDxib3F1bi5mZW5nQGdtYWlsLmNvbT4sIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4sIDxhbnVwQGJyYWluZmF1bHQub3JnPiwgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj4sIDxw
Ym9uemluaUByZWRoYXQuY29tPiwgPHNodWFoQGtlcm5lbC5vcmc+LCA8cGFycmkuYW5kcmVhQGdt
YWlsLmNvbT4sIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4sIDxicnNAcml2b3NpbmMuY29tPiwg
PGd1b3JlbkBrZXJuZWwub3JnPiwgPGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+LCA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4sIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz4sIDxr
dm1Admdlci5rZXJuZWwub3JnPiwgPGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnPiwgPGxp
bnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+LCA8YXB3QGNhbm9uaWNhbC5jb20+LCA8am9l
QHBlcmNoZXMuY29tPiwgPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+IEZvbGtzLAoKPsKgCj4g
T24gV2VkLCAxOSBOb3YgMjAyNSwgcGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3Jn
IHdyb3RlOgoKPsKgCj4gPiBUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byByaXNjdi9saW51eC5n
aXQgKGZvci1uZXh0KQoKPiA+IGJ5IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPjoKCj7C
oAo+IFRoaXMgYWN0dWFsbHkgaXNuJ3QgdHJ1ZTsgSSd2ZSBvbmx5IGFwcGxpZWQgdGhlIGZpcnN0
IGZvdXIgcGF0Y2hlcyAoc2VlwqAKCj4gYmVsb3cpLgoKPsKgCj4gPiBPbiBNb24sIDIwIE9jdCAy
MDI1IDEyOjIwOjQ2ICswODAwIHlvdSB3cm90ZToKCj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBzdXBw
b3J0IGZvciB0aGUgWmFsYXNyIElTQSBleHRlbnNpb24sIHdoaWNoIHN1cHBsaWVzIHRoZQoKPiA+
ID4gcmVhbCBsb2FkIGFjcXVpcmUvc3RvcmUgcmVsZWFzZSBpbnN0cnVjdGlvbnMuCgo+ID4gPsKg
Cgo+ID4gPiBUaGUgc3BlY2lmaWNhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKCj4gPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi16YWxhc3IvYmxvYi9tYWluL2NoYXB0ZXIyLmFkb2MK
Cj4gPiA+wqAKCj4gPiA+IFRoaXMgcGF0Y2ggc2VpcmVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGx0
cCBvbiBRZW11IHdpdGggQnJlbnNhbidzIHphbGFzcgoKPiA+ID4gc3VwcG9ydCBwYXRjaFsxXS4K
Cj4gPiA+wqAKCj4gPiA+IFsuLi5dCgo+ID7CoAoKPiA+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0
aCBsaW5rczoKCj4gPiDCoCAtIFt2NCwwMS8xMF0gcmlzY3Y6IEFkZCBJU0EgZXh0ZW5zaW9uIHBh
cnNpbmcgZm9yIFphbGFzcgoKPiA+IMKgIMKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3Yv
Yy8wNTk3YjljODYyN2UKCj4gPiDCoCAtIFt2NCwwMi8xMF0gZHQtYmluZGluZ3M6IHJpc2N2OiBB
ZGQgWmFsYXNyIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KCj4gPiDCoCDCoCBodHRwczovL2dp
dC5rZXJuZWwub3JnL3Jpc2N2L2MvNmUyYTBmZjcwYWJlCgo+ID4gwqAgLSBbdjQsMDMvMTBdIHJp
c2N2OiBod3Byb2JlOiBFeHBvcnQgWmFsYXNyIGV4dGVuc2lvbgoKPiA+IMKgIMKgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9kNWUyMDYyOGE4ODIKCj4gPiDCoCAtIFt2NCwwNC8xMF0g
cmlzY3Y6IEludHJvZHVjZSBaYWxhc3IgaW5zdHJ1Y3Rpb25zCgo+ID4gwqAgwqAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9yaXNjdi9jL2M0MTM5ZWE2NzE3YwoKPiA+IMKgIC0gW3Y0LDA1LzEwXSBy
aXNjdjogQXBwbHkgWmFsYXNyIHRvIHNtcF9sb2FkX2FjcXVpcmUvc21wX3N0b3JlX3JlbGVhc2UK
Cj4gPiDCoCDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQoKPiA+IMKgIC0gW3Y0LDA2LzEwXSByaXNj
djogQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBhcmNoX3hjaGcvYXJjaF9jbXB4
Y2hnIG9wZXJhdGlvbnMKCj4gPiDCoCDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQoKPiA+IMKgIC0g
W3Y0LDA3LzEwXSByaXNjdjogQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBhcmNo
X2F0b21pYyBvcGVyYXRpb25zCgo+ID4gwqAgwqAgKG5vIG1hdGNoaW5nIGNvbW1pdCkKCj4gPiDC
oCAtIFt2NCwwOC8xMF0gcmlzY3Y6IFJlbW92ZSBhcmNoIHNwZWNpZmljIF9fYXRvbWljX2FjcXVp
cmUvcmVsZWFzZV9mZW5jZQoKPiA+IMKgIMKgIChubyBtYXRjaGluZyBjb21taXQpCgo+ID4gwqAg
LSBbdjQsMDkvMTBdIFJJU0MtVjogS1ZNOiBBbGxvdyBaYWxhc3IgZXh0ZW5zaW9ucyBmb3IgR3Vl
c3QvVk0KCj4gPiDCoCDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQoKPiA+IMKgIC0gW3Y0LDEwLzEw
XSBSSVNDLVY6IEtWTTogc2VsZnRlc3RzOiBBZGQgWmFsYXNyIGV4dGVuc2lvbnMgdG8gZ2V0LXJl
Zy1saXN0IHRlc3QKCj4gPiDCoCDCoCAobm8gbWF0Y2hpbmcgY29tbWl0KQoKPsKgCj4gSW4gdGVy
bXMgb2YgcGF0Y2hlcyA1LTgsIHdlJ3JlIHN0aWxsIHdhaXRpbmcgZm9yIFh1IEx1IHRvIHVwZGF0
ZSB0aGXCoAoKPiBwYXRjaGVzIGJhc2VkIG9uIEFuZHJlYSdzIGZlZWRiYWNrLiDCoFh1IEx1LCBh
cmUgeW91IHN0aWxsIHBsYW5uaW5nIHRvwqAKCj4gdXBkYXRlIHRoZXNlPwoKPsKgCj7CoAo+IC0g
UGF1bAo+wqAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
