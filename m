Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E22E77173
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+k+BJXsFoz9Sn+GoVptG8+nEmvZiDq4r9O4joVl8Wk=; b=2Ps5wM/ANUrTkc
	eyTfmRb99gClmSkoH5XfYaxR+0nplV/ZpyZVzvlZwT2xVPrwn7mABG7ujkfdSMhXoVfLZwUtxQ9wO
	2vXTglnjt2Ddw1C+VWyx4CVZYckF1jd7oYa9nE4O2IDR1PujTJWEyldM7xZdxW0d0W3G6BWgrZZ2N
	h9G6Ie1YGBRQataNQg1Enyncb997wux11dLbo7FBKIF+sQOIxeBfhjhETDTqJk09FewYrDOXEY4a1
	IuIronUkrp6KXSGCryUJb98Jv74TKzV+EQM5lW13Zd/fWpJqw0HThUsH10M7u/tqQSp+pSxEEhpgd
	JEw8cgU4dkQ8rTiCmvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYsG-00000006rCm-1otD;
	Mon, 09 Dec 2024 08:12:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYqE-00000006ql9-0TjV
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 08:10:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso5861033a12.2
        for <kvm-riscv@lists.infradead.org>; Mon, 09 Dec 2024 00:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733731804; x=1734336604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOdGE0llx04cHDIB0WcrC/Ji09jqKKAXDGd/eNwLnL0=;
        b=W6qRPvwGw+RkaW6QsSwC9EWtskbaI2/phKgZkrxzRA1y3tVkOuUPhvEr+WTHRCzlvK
         6wOmio3mzYngK4aLndXOGEr1CTurr/fumclbcHz5pOZkW2MEHf/PMxXIEKsfcPDOpuJH
         2VDg0CaqPdP1NyYcpKg5SbFBTlO7GFjPpg0cFjyNcSJ23N1WetyCMNCHRj5UtTAyKEAK
         DsdnL4+ZgO3+tJG6NXYA9PKsHunVifDeo0YiLISz6G5vIqRh30UAAWnmHbebxI7gznyf
         FLyhY/Gja3m3z6/yU13fYx7u/wkEZMB6/BoNWzm8SpyYzf+MjEeA5TSRyMrXNVpB9p4i
         poWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731804; x=1734336604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOdGE0llx04cHDIB0WcrC/Ji09jqKKAXDGd/eNwLnL0=;
        b=jymKiFvYkXTJNuC+UNScjt3hUZ/nV1bdk5ez3LXhpYxnhmJN4iEoEhdIA0vXRy++Ba
         M7U4vrHbf7iNRY8wBbcNaE8sqlRLh8Adfjbh5x0FG/3TVlm6Qv5DWs9XSh4kGBD4X0j0
         AbHmNP5qReEyi/q60X8jitVJqOQWhjqk8V0QhJQV5zk1GRbIJxyd3GBrk4BTl3PllJiA
         J3C2Cdq7CffYHunTnQ1+ZqwbVftDdgJUycjQEHpXvx6rwCOWKsgpTG4KckDQYE/jV5Uy
         WjGnqwV88aUMSnn8jHkPpTQ/p01xZeVPNuYYfFys0peNBUitt2LDd4hwGvEgv5cf8NEv
         e1TA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2RsFtP26xJ4IG8o8vd0mxALS0ALSauJn8N6YzsXGf77k6hPk5w0jZXIn8gwrSDzc/DzNE+25j9c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy253yoZ23NxUGBO5pvgRI6kAuDLuZfYxbjDAajUgLGOLJVPl/w
	rVSfjEOMbLzQ08GhJjcAXM/HU6Qi6lI0JByGGUlL9aUmMeSFngOtHeGzK2hLJmBGn9JYXfwg6GP
	arwzvFqcdnWsWvpTwo9A4vXeN+z7ZW5CImlQ/1A==
X-Gm-Gg: ASbGncvTe/vjqmBOk4mTaHSRkJ/HcMl4QS2oPaYEn00Mbsb2umtIFOlDFlkusAhJwEl
	ePV67ffvw8hIDIjoN3yq7epPBNwmjc5vczKwq
X-Google-Smtp-Source: AGHT+IGNck5i4vPd2OxR76eBBx6zUGhGMnAu9BdeT9Vh0NpmJctj2kl8Ojqzeyx0WmJshY5K/xlMG+5FLizyFcfrOBI=
X-Received: by 2002:a05:6402:520d:b0:5d2:723c:a577 with SMTP id
 4fb4d7f45d1cf-5d3be6d07famr11938931a12.14.1733731803826; Mon, 09 Dec 2024
 00:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
 <20241120-dev-maxh-svukte-v3-v3-3-1e533d41ae15@sifive.com> <20241125-7cfad4185ec1a66fa08ff0f0@orel>
In-Reply-To: <20241125-7cfad4185ec1a66fa08ff0f0@orel>
From: Max Hsu <max.hsu@sifive.com>
Date: Mon, 9 Dec 2024 16:09:51 +0800
Message-ID: <CAHibDyztkj3vFmZ7Gg=0QFoauO7pdm4+c16y8hQiaTkCQPc=LQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001006_212876_85EC9BDB 
X-CRM114-Status: GOOD (  20.56  )
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

T2theSwgSSB1bmRlcnN0YW5kIGl0IG5vdywgc2luY2UgdGhlIEd1ZXN0IE9TIG1heSB1dGlsaXpl
IHRoZSBTdnVrdGUKZXh0ZW5zaW9uIHNpbXBseSBieSBzZXR0aW5nIHRoZSBzZW52Y2ZnLlVLVEUg
d2l0aG91dCBhbnkgdHJhcC4KSW4gdGhlIHZpZXcgb2YgVk1NLCB0aGUgU3Z1a3RlIGV4dGVuc2lv
biBzaG91bGQgYmUgYWx3YXlzIHByZXNlbnRlZC4KCkknbGwgYWRkIHRoZSBleHRyYSBlbnRyeSBp
biB0aGUga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCgpCmZvciB0aGUgdjQgcGF0
Y2hlcy4KClRoYW5rcywgQW51cCwgUGF1bCwgYW5kIEFuZHJldyBmb3IgdGhlIHBhdGllbmNlIGFu
ZCBkZXRhaWxlZApleHBsYW5hdGlvbi4KCkJlc3QsCk1heCBIc3UKCk9uIE1vbiwgTm92IDI1LCAy
MDI0IGF0IDg6MDjigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3
cm90ZToKPgo+IE9uIFdlZCwgTm92IDIwLCAyMDI0IGF0IDEwOjA5OjM0UE0gKzA4MDAsIE1heCBI
c3Ugd3JvdGU6Cj4gPiBBZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZVS1RFIGZvciBWTU0gdG8gZGV0
ZWN0IHRoZSBlbmFibGVtZW50Cj4gPiBvciBkaXNhYmxlbWVudCB0aGUgU3Z1a3RlIGV4dGVuc2lv
biBmb3IgR3Vlc3QvVk0KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVl
bC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXguaHN1
QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAxICsKPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPiA+IGluZGV4IDRmMjQyMDEzNzZiMTcyMTUzMTVjZjFmYjg4ODhkMGE1NjJk
Yzc2YWMuLjE1OGY5MjUzNjU4YzRjMjhhNTMzYjJiZGExNzlmYjQ4YmY0MWUxZmMgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBlbnVt
IEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiA+ICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBV1JT
LAo+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0sCj4gPiAgICAgICBLVk1fUklTQ1Zf
SVNBX0VYVF9TU05QTSwKPiA+ICsgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NWVUtURSwKPiA+ICAg
ICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwKPiA+ICB9Owo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
Ywo+ID4gaW5kZXggNWI2ODQ5MGFkOWI3NWZlZjZhMTgyODlkOGM1Y2Y5MjkxNTk0ZTAxZS4uNGMz
YTc3Y2RlZWQwOTU2ZTIxZTUzZDFhYjRlOTQ4YTE3MGFjNWM1YyAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
b25lcmVnLmMKPiA+IEBAIC00Myw2ICs0Myw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25n
IGt2bV9pc2FfZXh0X2FycltdID0gewo+ID4gICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNWSU5WQUwp
LAo+ID4gICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNWTkFQT1QpLAo+ID4gICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFNWUEJNVCksCj4gPiArICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZVS1RFKSwKPiA+ICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihaQUNBUyksCj4gPiAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFX
UlMpLAo+ID4gICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCQSksCj4gPgo+ID4gLS0KPiA+IDIuNDMu
Mgo+Cj4gQW51cCByYWlzZWQgdGhlIG1pc3NpbmcgZW50cnkgaW4ga3ZtX3Jpc2N2X3ZjcHVfaXNh
X2Rpc2FibGVfYWxsb3dlZCgpIGluCj4gdGhlIGxhc3QgcmV2aWV3LiBBbiBhZGRpdGlvbmFsIHBh
cmFncmFwaCB3YXMgYWRkZWQgdG8gdGhlIGNvdmVyIGxldHRlciBmb3IKPiB0aGlzIHJldmlldywg
YnV0IEkgdGhpbmsgdGhlcmUncyBzdGlsbCBhIG1pc3VuZGVyc3RhbmRpbmcuIElmIHRoZSBndWVz
dAo+IGNhbiBhbHdheXMgdXNlIHRoZSBleHRlbnNpb24gKHdoZXRoZXIgaXQncyBhZHZlcnRpc2Vk
IGluIGl0cyBJU0Egc3RyaW5nCj4gb3Igbm90KSwgdGhlbiB0aGF0IG1lYW5zIGl0IGNhbm5vdCBi
ZSBkaXNhYmxlZCBmcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZgo+IHRoZSBWTU0uIFRoZSBvbmx5IElT
QSBleHRlbnNpb25zIHdoaWNoIG1heSBiZSBkaXNhYmxlZCBhcmUgdGhlIG9uZXMgdGhhdAo+IHRy
YXAgb24gdGhlaXIgdXNlLCBhbGxvd2luZyBLVk0gdG8gZW11bGF0ZSByZXNwb25zZXMgd2hpY2gg
YSBwaHlzaWNhbCBoYXJ0Cj4gd2l0aG91dCB0aGUgZXh0ZW5zaW9uIHdvdWxkIHByb2R1Y2UuCj4K
PiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
