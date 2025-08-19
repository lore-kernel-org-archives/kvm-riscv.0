Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4CECA0EEB
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWmwnBPQvshqm5vJmYIJcjOHZca8AFTYcYkDKnKEmsM=; b=X74ZRfWoY+A6k4
	ZcCl9VLlPXAs9GVM3/xVTKJSMbzlwQzaB/tcf9I1tSG6tJ9ZmNmrXg5wDuErRdPJcIWjsDt1m6j5J
	nfmrwhvIsaiUH+JWtnwyjf8BTEyDCWGD5AwmM0v0y5RfElnnBcdryOtS9BG9zUTuT2pMV9FCkzvJr
	WJH5Hi3hpHwRRw2ZJ/9f5zQ51frLGbITQYED8GDGphqovtytBQSxzD2VasVHBuK/ZZTSPv6AhV+2Y
	Q8p7Ug5f8PK/ouPEX3yl3lymLA/GWOEFL5B/nUm9YosWEaFNc3sFDUeqQ/d/nrjhJlD9Kc14pgwCY
	v0JeXRzwFDZr2CJ63mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSS1-0000000BTwH-0wWR;
	Tue, 19 Aug 2025 19:56:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQFQ-0000000B7Hc-25uZ
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 17:35:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b0049a9so2052135e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 19 Aug 2025 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755624946; x=1756229746; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HriY9Mwm+2fMM0vnEvPFFz/UXLfXmL7avJoov+0cHIs=;
        b=SWKnrJ/h8JLmtHWtDklsH0rEQS6Nhrry0dlsY/Q5ZM4me+IrJBMgbBuZaKMKW7cO8Q
         9f8Zkl6ibjOpmT/tdWJcmXzmqxUtL9Q38ZoF82lnVielrbiSYSqWa+48ILrOOcm6KFEj
         yk4N3E4gL2SGkYC+SWStr6JwJVbpqLXYb+ZGTYTbhxPmRp0hwBDNHHloKibj5iWa6Os8
         AsLpBHnK+ZJxxGRy0wWKVC8iS68SwH58ktfiaEYj5MEoxyTtE2DGzlg4v7Gslzukp78I
         iEzccxOtPItr2BxF8jkpkZXQ5vC2uHUUSf9+nmNFpVlSVNjf9U9zlVqfR4slFfpoII1q
         ZXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755624946; x=1756229746;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HriY9Mwm+2fMM0vnEvPFFz/UXLfXmL7avJoov+0cHIs=;
        b=j+ehSG813UEBHIYawnEjDGXWEFpjlVKoC7uoMT0NmvIsexnadlsNdCNzVE0AReWBq3
         /O9eTzsZ8oGO2BXmuwXJfHvRC25Bh0cMbKmjTU9cQTkqvnywiq2zP3MnqlwPI39Y6C5b
         t0sQLZ9EplaBDDM6VCZoV0VI1bji9JXHJLbO5AQaHgJgiJSr5qv3ZXSfBaLBAeAr2De5
         px91oFXXE54QQOZp2jISTeoTjLNJDXZnjf4ueLzcXDGFuVgNpCXsiDKnAZ1xdq0AigeK
         lXFrWOM2r1RQvoz3yoVgLSNNJM3iaM5ILoaC/IaV1A+CSa7A/KkjkM3p2PVH45kcZYlM
         2iMw==
X-Forwarded-Encrypted: i=1; AJvYcCWqYQTwo4Fz1yyaqi2/Fje6kqyuUBwFenU1Y8aUiO8sskKqTr3uu1HH+gSn5b5ltApf6Zsopd8viog=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBX0rd8pXVI4/LKeDCxGBShDJMgyGThQdwwrCUnx4YWZc3P5fS
	euTlIgcfO+xQzPeXZXRnUz4WFDVPHXIPB1QhR393jBZuqTyee4LpN3qWXlHY61sbONM=
X-Gm-Gg: ASbGnctiRYGkqIWKdTlLd2Rt6vuBKNGiFirN1r1RdN1psPJsSLGNOnteiJ0Pd3INOfB
	cAob0qXn526EAvu9ImuptpCl1jw1q4Umyld3CD3evt5jap6Lm8p4eW+D4qwOp0930zSzeDU3Ile
	eJwmD1IdpywDt/yJXy7/jVbyaNSZRAGWxOTU+V0HLbseb73vRwe+ZyL/W9akm3MYmd1m1KDW6sY
	4uSzJX+S6uHueNX5LgszVtaEcFCdFLKKUuakk/qc4NHUs9pJpcNTgv5ia+ksiyK2uS+gBXwO3HQ
	k6o1s1moQm4IEuYcswWnIf1TVKkoLx57DElnmOQWVu0ARDvXM4LV/s93D2T3FXHO32veXwSxBJ3
	gkkwlkFBljfVilKfdEuGIjb10syuVVA==
X-Google-Smtp-Source: AGHT+IHdHc43/qbPeSuFvpTUjrq1NXmEH79kFa8+PuZKM64k2/KwBznp+KjWl/svIF/2Oq3kUoCIug==
X-Received: by 2002:a05:600c:468f:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45b46b7681bmr4785225e9.1.1755624945689;
        Tue, 19 Aug 2025 10:35:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e7d6:daad:8c97:a08e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6bc85csm221551445e9.5.2025.08.19.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 10:35:45 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 19 Aug 2025 19:35:44 +0200
Message-Id: <DC6L3PG5HP48.2J8TC1JZHMJVO@ventanamicro.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Anup Patel" <anup@brainfault.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Shuah Khan" <shuah@kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Anup Patel" <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 0/6] ONE_REG interface for SBI FWFT extension
References: <20250814155548.457172-1-apatel@ventanamicro.com>
 <DC5HEJRMZ84K.34OPU922A7XBE@ventanamicro.com>
 <CAK9=C2X8-DBi7qQ87kMA0AiVdiFH0_4L4mzzZzbeCg2eiNm8Qg@mail.gmail.com>
 <DC6DLP13J0LA.XW9J3XFBCM1Y@ventanamicro.com>
 <CAK9=C2VA2jswYm_yxYsCaGKUkJT46rxUH-6OKdsApMZ8nhkrQw@mail.gmail.com>
In-Reply-To: <CAK9=C2VA2jswYm_yxYsCaGKUkJT46rxUH-6OKdsApMZ8nhkrQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_103548_544970_FE190C54 
X-CRM114-Status: GOOD (  29.23  )
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

MjAyNS0wOC0xOVQyMToyMjoyNyswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Ogo+IE9uIFR1ZSwgQXVnIDE5LCAyMDI1IGF0IDU6MTPigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Cj4+IDIwMjUtMDgtMTlUMTI6
MDA6NDMrMDU6MzAsIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPj4gPiBP
biBNb24sIEF1ZyAxOCwgMjAyNSBhdCAzOjU54oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiAyMDI1LTA4LTE0VDIxOjI1OjQy
KzA1OjMwLCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT46Cj4+ID4+ID4gVGhp
cyBzZXJpZXMgYWRkcyBPTkVfUkVHIGludGVyZmFjZSBmb3IgU0JJIEZXRlQgZXh0ZW5zaW9uIGlt
cGxlbWVudGVkCj4+ID4+ID4gYnkgS1ZNIFJJU0MtVi4KPj4gPj4KPj4gPj4gSSB0aGluayBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8gT05FX1JFRyB0aGUgQ1NScyAobWVkZWxlZy9tZW52Y2ZnKSwgb3Ig
YXQKPj4gPj4gbGVhc3QgZXhwb3NlIHRoZWlyIENTUiBmaWVsZHMgKGVhY2ggc2Vuc2libGUgbWVk
ZWxlZyBiaXQsIFBNTSwgLi4uKQo+PiA+PiB0aHJvdWdoIGt2bV9yaXNjdl9jb25maWcsIHRoYW4g
dG8gY291cGxlIHRoaXMgd2l0aCBTQkkvRldGVC4KPj4gPj4KPj4gPj4gVGhlIGNvbnRyb2xsZWQg
YmVoYXZpb3IgaXMgZGVmaW5lZCBieSB0aGUgSVNBLCBhbmQgdXNlcnNwYWNlIG1pZ2h0IHdhbnQK
Pj4gPj4gdG8gY29uZmlndXJlIHRoZSBTLW1vZGUgZXhlY3V0aW9uIGVudmlyb25tZW50IGV2ZW4g
d2hlbiBTQkkvRldGVCBpcyBub3QKPj4gPj4gcHJlc2VudCwgd2hpY2ggaXMgbm90IHBvc3NpYmxl
IHdpdGggdGhlIGN1cnJlbnQgZGVzaWduLgo+PiA+Pgo+PiA+PiBJcyB0aGVyZSBhIGJlbmVmaXQg
aW4gZXhwcmVzc2luZyB0aGUgSVNBIG1vZGVsIHRocm91Z2ggU0JJL0ZXRlQ/Cj4+ID4+Cj4+ID4K
Pj4gPiBFeHBvc2luZyBtZWRlbGVnL21lbnZjZmcgaXMgbm90IHRoZSByaWdodCBhcHByb2FjaCBi
ZWNhdXNlIGEKPj4gPiBHdWVzdC9WTSBkb2VzIG5vdCBoYXZlIE0tbW9kZSBoZW5jZSBpdCBpcyBu
b3QgYXBwcm9wcmlhdGUgdG8KPj4gPiBleHBvc2UgbTx4eXo+IENTUnMgdmlhIE9ORV9SRUcgaW50
ZXJmYWNlLiBUaGlzIGFsc28gYWxpZ25zCj4+ID4gd2l0aCBILWV4dGVuc2lvbiBhcmNoaXRlY3R1
cmUgd2hpY2ggZG9lcyBub3QgdmlydHVhbGl6ZSBNLW1vZGUuCj4+Cj4+IFdlIGFscmVhZHkgaGF2
ZSBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaXBpZCBpbiBrdm1fcmlzY3ZfY29uZmlnLgo+Cj4g
VGhlIG12ZW5kb3JpZCwgbWFyY2hpZCwgYW5kIG1pcGlkIGFyZSBhY2Nlc3NpYmxlIHZpYSBTQkkg
QkFTRQo+IGV4dGVuc2lvbiBidXQgbm90IGFueSBvdGhlciBNLW1vZGUgQ1NScyBoZW5jZSB0aGVz
ZSBhcmUgc3BlY2lhbC4KPgo+Pgo+PiBUaGUgdmlydHVhbGl6ZWQgTS1tb2RlIGlzIHVzZXJzcGFj
ZStLVk0uICAoS1ZNIGRvZXNuJ3QgYWxsb3cgdXNlcnNwYWNlCj4+IHRvIGNvbmZpZ3VyZSBtb3N0
IHRoaW5ncyBub3csIGJ1dCBJIHRoaW5rIHdlJ2xsIGhhdmUgdG8gY2hhbmdlIHRoYXQgd2hlbgo+
PiBnZXR0aW5nIHJlYWR5IGZvciBwcm9kdWN0aW9uLikKPgo+IFRoZSBSSVNDLVYgYXJjaGl0ZWN0
dXJlIGlzIG5vdCBkZXNpZ25lZCB0byB2aXJ0dWFsaXplIE0tbW9kZQo+IGFuZCB0aGVyZSBpcyBu
byBwcmFjdGljYWwgdXNlLWNhc2UgZm9yIHZpcnR1YWxpemVkIE0tbW9kZSBoZW5jZQo+IFdFIFdP
TidUIEJFIFNVUFBPUlRJTkcgSVQgSU4gS1ZNIFJJU0MtVi4KCk9oLCBzb3JyeSBmb3IgdGhlIG1p
c3VuZGVyc3RhbmRpbmcsIEknbGwgYmUgY2xlYXJlciBuZXh0IHRpbWUgYW5kIHRhbGsKYWJvdXQg
aW1wbGVtZW50YXRpb24gb2YgdGhlIHN1cGVydmlzb3IgZXhlY3V0aW9uIGVudmlyb25tZW50LgpL
Vk0rdXNlcnNwYWNlIHByb3ZpZGVzIFNFRSB0byB0aGUgVlMtbW9kZSwgd2hpY2ggaXMgdG8gVlMt
bW9kZSBhcyB3aGF0Ck0tbW9kZSBpcyB0byBTLW1vZGUsIGhlbmNlIEkgY2FsbGVkIEtWTSt1c2Vy
c3BhY2UgYSB2aXJ0dWFsaXplZCBNLW1vZGUuCgo+IEZZSSwgdGhlIEtWTSBBUk02NCBkb2VzIG5v
dCB2aXJ0dWFsaXplIEVMMyBlaXRoZXIgYW5kIGl0IGlzCj4gYWxyZWFkeSBpbiBwcm9kdWN0aW9u
IHNvIHBsZWFzZSBzdG9wIG1ha2luZyByYW5kb20gYXJndW1lbnRzCj4gZm9yIHJlcXVpcmluZyB2
aXJ0dWFsaXplZCBNLW1vZGUgZm9yIHByb2R1Y3Rpb24uCgpZZWFoLCBJIGFncmVlIHRoYXQgd2Ug
ZG9uJ3QgbmVlZCBpdCwgSSBqdXN0IGhhZCB0byBwcm92aWRlIHNvIG1hbnkKZXhhbXBsZXMgaW4g
dGhlIHByZXZpb3VzIGRpc2N1c3Npb24gdGhhdCBJIHdlbnQgaW50byBxdWl0ZSBuaWNoZSBjYXNl
cy4KClRoZSBpbmNyZWFzZWQgZmxleGliaWxpdHkgaXMgc2ltaWxhcmx5IHVzZWZ1bCBmb3IgbW9y
ZSBpbXBvcnRhbnQgY2FzZXM6CndlIGNhbid0IGF2b2lkICJ2aXJ0dWFsaXplZCBNLW1vZGUiL1NF
RSwgYnV0IHdlIGRvbid0IGhhdmUgdG8gY29tcGxldGVseQppbXBsZW1lbnQgaXQgaW4gSFMtbW9k
ZS4KCj4+IEZvciBnZW5lcmFsIHZpcnR1YWxpemF0aW9uLCB3ZSB3YW50IHRvIGJlIGFibGUgdG8g
Y29uZmlndXJlIHRoZQo+PiBmb2xsb3dpbmcgYmVoYXZpb3IgZm9yIGVhY2ggZXhjZXB0aW9uIHRo
YXQgd291bGQgZ28gdG8gdGhlIHZpcnR1YWxpemVkCj4+IE0tbW9kZToKPj4gICAwKSBkZWxlZ2F0
ZWQgdG8gdGhlIGd1ZXN0Cj4+ICAgMSkgaW1wbGVtZW50ZWQgYnkgdXNlcnNwYWNlCj4+ICAgMi1O
KSBpbXBsZW1lbnRhdGlvbnMgYnkgS1ZNIChpZGVhbGx5IHplcm8gb3Igb25lKQo+Pgo+PiBXZSBj
YW4gaGF2ZSBtZWRlbGVnLCBhbmQgYW5vdGhlciBtZXRob2QgdG8gZGVjaWRlIGhvdyB0byBoYW5k
bGUgdHJhcHBlZAo+PiBleGNlcHRpb25zLCBidXQgaXQgcHJvYmFibHkgbWFrZXMgbW9yZSBzZW5z
ZSB0byBoYXZlIGEgcGVyLWV4Y2VwdGlvbgo+PiBPTkVfUkVHIHRoYXQgc2V0cyBob3cgZWFjaCBl
eGNlcHRpb24gYmVoYXZlcy4KPj4KPgo+IE5vIHBvaW50aW5nIGluIGRpc2N1c3NpbmcgdGhpcyBm
dXJ0aGVyIHNpbmNlIHdlIHdvbid0IGJlIHN1cHBvcnRpbmcKPiB2aXJ0dWFsaXplZCBNLW1vZGUu
CgpJIHVuZGVyc3RhbmQsIGJhY2sgdG8gdGhlIGN1cnJlbnQgc2VyaWVzOgoKSSB0aGluayB3ZSBu
ZWVkIHRvIHByb3ZpZGUgbWVhbnMgd2l0aCB3aGljaCB1c2Vyc3BhY2UgY2FuIGNvbnRyb2wgd2hp
Y2gKRldGVCBmZWF0dXJlcyBhcmUgZW5hYmxlZCwgYmVjYXVzZSBLVk0ganVzdCBleHBvc2VzIGV2
ZXJ5dGhpbmcgaXQga25vdwphbmQgaGFyZHdhcmUgc3VwcG9ydHMgcmlnaHQgbm93OgogMSkgTWln
cmF0aW9uIGJldHdlZW4gZGlmZmVyZW50IHN5c3RlbXMgd291bGQgYmUgaGluZGVyZWQKIDIpIFdl
IGNvdWxkbid0IGFkZCBtb3JlIEZXRlQgZmVhdHVyZXMgd2l0aG91dCBicmVha2luZyB0aGUgU0VF
CgpUaGUgKDIpIGlzIHNpbWlsYXIgdG8gaG93IHdlIG11c3Qgc2V0ICIuZGVmYXVsdF9kaXNhYmxl
ZCA9IHRydWUiIHRvCmN1cnJlbnQgRldGVCwgYmVjYXVzZSBLVk0gY2FuJ3QgYmUgY2hhbmdpbmcg
dGhlIFNFRSBmb3IgdXNlcnNwYWNlLgoKRG8geW91IHdhbnQgbWUgdG8gc2VuZCBhIHBhdGNoIHRo
YXQgaW52ZXJ0cyB0aGUgZGVmYXVsdCwgdG8gbWFrZSBhbGwKZnV0dXJlIFNCSSBleHRlbnNpb24g
c3RhcnQgYXMgZGlzYWJsZWQsIHNvIHdlIGNhbid0IGVhc2lseSByZXBlYXQgdGhlCm1pc3Rha2Ug
aW4gdGhlIGZ1dHVyZT8KClRoYW5rcy4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
