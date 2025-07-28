Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93862C83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdGmk+sRGdARVbHDDnyA6PwcSA/t9cQCTWODy4lUQXA=; b=NPmbxTEMwI2baD
	D2BtbENuJuEAUIWMmIujgBdHuw4v2ZHd0MdJPPXSLmX0VKnMnuYOV0uy5/2EeZbNJmY6uUkKDWEeY
	HZWzXnEchcR98Rtz4qFvxvyCI1cDpnZ3OM/97i3lFPLZ+kxLRqb0Xo7q4wB/9a0jNE0aB+Cmg9gJV
	e4qXd8ahZbXHNF6Yt4CH8fuC2YRV8hGaYIPVaY7MQalSKRe7Ps03A3nDkVU/W/uHepcP2EtwtwFzZ
	/WpykYoBcYTDkVm47Lekc2laJcwOWKO0JgJ/tjbKXVfi/ca9JNXfcVi1tCthfUSLVb90acvQJS0hz
	1XFenSxFKzVAUmv9qisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugREK-0000000F3Ky-1Wl2;
	Mon, 28 Jul 2025 17:01:40 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQCa-0000000EtpT-1PrW
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 15:55:49 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3d181e839so9401695ab.2
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753718147; x=1754322947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoQc7MqIQDw+6Efs0Tj4gYVMkroavuwmc+QEfRy0pSo=;
        b=DazZGwQMB5jXtoxSP8N2K5ibfKw94z1iCh7Eyfz7gfcMUvN9U2YndCe/MdKTiXvR2O
         Yq0KVkGNwhJ8eOVVECUrpvNy1ymepO+z3QFfdDfllp3lsWA3jxMuf1X3x04b2jyIxip1
         M3D+N8fXYIWsLXm9LxH9CnAriSRKHyAEZZ9FJtfbkNfuL+71BUD1GqT0suPv/x6qTf4K
         EQ8fpIpgEywwRaTKKO41rq3oZA251qhIzl4/E4rogIKFANAJaOOH0mFkqg8W9uylbOtm
         AJuJn/RsAcnWl600U4ytaYvTyhRmDfNlPpH8HLMDiSA+hXc1hPHOGQVG479dNNz3fUw0
         YBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718147; x=1754322947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoQc7MqIQDw+6Efs0Tj4gYVMkroavuwmc+QEfRy0pSo=;
        b=VP+bpVxOuE4L9xQVPwX3g0USGN7AVYApzEnTsF0OP6O5iYxlNm+iRP7TKwtmJ0U00P
         ygW+uOa7MXwaenZyBQNHFvYZc76FZysKk10RLWr8E0QmMIbaS3N7BY12lYCN2O0PZv5d
         tu9i4pLGndy5+Or4LgmB+snIeb+d8XSz+Q0if/CiwNa/V3p8cNRKn5YfPXy5erE1+5se
         4pwu1p3bf5xkQtPahZgwaNfrAr9dypgRiOyimTKIziC/xeC5wXxTcbMV8NFEBy2HAUXK
         OpI0YnKTuVKeVG4Fw4frG5Hs6j7U887XnlI8DpFdktLX+cGmtsI5xJHiFvAkUMhpw5ql
         4uSg==
X-Forwarded-Encrypted: i=1; AJvYcCUXT0OfjgJ3BTUI6aAP+sr78q6rnp1z5eEmUQJjWW7all4tXgXX435U2VrkfKsHLI37A2cEvgshr2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFG9kfN0SfMhagBW/Ti57cs9vQFirVPqX/2xTjAYvfE1NRI7zb
	CoKPMjcpkk5yUPZf0+EksdXsdM4ZRQ8tmI56EHElBhapxfyiLco+vNZvE+DosvC0yCES9sA9gJV
	QFS0b50ti2xGo+vMkKp4JQ41K6MX4VlKBJmQv6fj6UA==
X-Gm-Gg: ASbGncvbd3vJ8Z/jkQVs1o/MbHoxiWsMM9VBYLwsNvkKhwfNbiMxbcX1cnPguXOurE3
	9P6EmwcvN0NzXVCzpCoX8pu/SAHCvZle6H4rLFcI3/4HDtmsLEpw4GwnpSkiD7WC2/GGhObXm/9
	5wiZNNM+U3kVj/pGU9ZLNGgw+sTj0+jPxOwEK6AcFDsLeSFzYue9hHspMNDB/KU7mxs0DA4AEyc
	UgGchIByWY+eUTDSw==
X-Google-Smtp-Source: AGHT+IGtyQUUSJu9cmUvDWm8BQBfdBuhLyQi/GAW+Z9BCrTE0REl/Sb8eIeFDFT/23beG7olLPsjNZMfh1lpKeQ/TI0=
X-Received: by 2002:a92:c242:0:b0:3e3:b74e:dd1a with SMTP id
 e9e14a558f8ab-3e3c5259f1fmr213615925ab.3.1753718147308; Mon, 28 Jul 2025
 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
In-Reply-To: <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Jul 2025 21:25:34 +0530
X-Gm-Features: Ac12FXyEGCGVkoPimb9v9aLpanQxwX644xefgJ4XRf_NEt1F87U2LZyXgZpr8DU
Message-ID: <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_085548_613381_B1F28D82 
X-CRM114-Status: GOOD (  13.82  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOToyMuKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMjowNuKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4gICAgICAgUklTQy1W
OiBwZXJmL2t2bTogQWRkIHJlcG9ydGluZyBvZiBpbnRlcnJ1cHQgZXZlbnRzCj4KPiBTb21ldGhp
bmcgaGVyZSBhdGUgUXVhbiBaaG91J3MgU2lnbmVkLW9mZi1ieSBsaW5lLCB3aGljaCBpcyBwcmVz
ZW50IGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci85NjkzMTMyZGY0ZDBmODU3YjhiZTNh
NzU3NTBjMzZiNDAyMTNmY2MwLjE3MjYyMTE2MzIuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuCj4g
YnV0IG5vdCBpbiB5b3VyIGJyYW5jaC4KClRoZXJlIHdlcmUgY291cGxlIG9mICItLS0iIGxpbmVz
IGluIHBhdGNoIGRlc2NyaXB0aW9uIHdoaWNoCmNyZWF0ZWQgcHJvYmxlbXMgZm9yIG1lIHNvIEkg
dHJpZWQgZml4aW5nIG1hbnVhbGx5IGFuZAphY2NpZGVudGFsbHkgYXRlIFNpZ25lZC1vZmYtYnku
CgpTb3JyeSBhYm91dCB0aGF0LgoKUmVnYXJkcywKQW51cAoKPgo+IFBhb2xvCj4KPiA+ICAgICAg
IFJJU0MtVjogS1ZNOiBVc2UgZmluZF92bWFfaW50ZXJzZWN0aW9uKCkgdG8gc2VhcmNoIGZvciBp
bnRlcnNlY3RpbmcgVk1Bcwo+ID4gICAgICAgUklTQy1WOiBLVk06IEF2b2lkIHJlLWFjcXVpcmlu
ZyBtZW1zbG90IGluIGt2bV9yaXNjdl9nc3RhZ2VfbWFwKCkKPiA+Cj4gPiBTYW11ZWwgSG9sbGFu
ZCAoMik6Cj4gPiAgICAgICBSSVNDLVY6IEtWTTogRml4IGluY2x1c2lvbiBvZiBTbW5wbSBpbiB0
aGUgZ3Vlc3QgSVNBIGJpdG1hcAo+ID4gICAgICAgUklTQy1WOiBLVk06IEFkZCBzdXBwb3J0IGZv
ciBTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1MRU4KPiA+Cj4gPiBYdSBMdSAoMSk6Cj4gPiAg
ICAgICBSSVNDLVY6IEtWTTogRGVsZWdhdGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBW
UyBtb2RlCj4gPgo+ID4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmgg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9nc3RhZ2UuaCAgICAgICAgICAgICAgICB8ICA3MiArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgICAgICB8IDEwOSArLS0tLQo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX21tdS5oICAgICAgICAgICAgICAgICAgIHwgIDIxICsKPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV90bGIuaCAgICAgICAgICAgICAgICAgICB8ICA4
NCArKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAgICAg
ICAgICAgfCAgMTMgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpX2Z3
ZnQuaCAgICAgICAgIHwgIDMzICsrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1p
ZC5oICAgICAgICAgICAgICAgICAgfCAgMjcgKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggICAgICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgYXJjaC9yaXNjdi9rdm0v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlz
Y3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiA+ICBh
cmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiAr
LQo+ID4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEyICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAzMzggKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L21tdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTA5ICsrKysrLS0tLS0tLS0t
LS0tLS0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTEwICsrLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDggKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyMCArLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDg0ICsrLS0KPiA+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1MyArKysKPiA+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgICAgICAgICAgICAgICAgICB8IDMz
OCArKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyAg
ICAgICAgICAgICAgICAgIHwgIDE3ICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV92MDEuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyNSArLQo+ID4gIGFyY2gvcmlzY3Yv
a3ZtL3ZtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gPiAgYXJj
aC9yaXNjdi9rdm0vdm1pZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjUgKwo+
ID4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2t2bS1zdGF0LmMgICAgICAgICAgICAgIHwg
ICA2ICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5
cGVzLmggfCAgMzUgLS0KPiA+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9yaXNjdl90cmFw
X3R5cGVzLmggICAgICB8ICA1NyArKysKPiA+ICAzMSBmaWxlcyBjaGFuZ2VkLCAxMzgyIGluc2Vy
dGlvbnMoKyksIDY4MiBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbW11LmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdGxiLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZtaWQuaAo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9v
bHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5cGVzLmgKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfdHJhcF90eXBl
cy5oCj4gPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
