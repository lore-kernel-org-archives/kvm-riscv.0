Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B2CC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyxUY8CmuUkGkk3H3Pm4UuTCkH4MwsBqTLzkTbBxOjc=; b=ZmxDfQsZZyhNO4
	LRE7YXhOxNw3cT5nFC/3EcbV3uBjbpeBsrMheEcE39fjkmjxwyMW7VhoWymtPZzS4LDn2/qL1nH4k
	N7dEHc0tAn1sfJ2bofCBoS21qct8+9uwto1VCk17TpG8jbfcCi642llEGINUcWonv1DCNZxFKYrrP
	KdJlBK2ICpCLKF84A+TGinVz9gY+rG7vQe2EmVUexbD8itOICBtd5uQs9YDomhjfIYtQnD+XYPv2x
	NM+65rByF92KrPya6bawmo1EadbWEXZ0rhteWPLCqoc7N/A4RLGakShWGNLszrseY48lPpambRN9Z
	0vJJoD53LV9q4nlUCymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6y8-00000007Io8-2FJ7;
	Sun, 11 May 2025 13:43:52 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6y6-00000007Imh-0hAH
	for kvm-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:43:51 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d818add2a3so12674095ab.1
        for <kvm-riscv@lists.infradead.org>; Sun, 11 May 2025 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746971029; x=1747575829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tikqvcPSSM0+ie8ei00WO4p/o6p01PdEuZ4eNfazi4=;
        b=1cSJaFvoD7OuQF71ygjJ2RUqEy3I/kdDpA/X6ZgGeFZxjHwMO/WfcpQ9wjmGI26cQx
         k8XMGMLCdCNMSvDmf/T0bOCjbujaZRZXiQm8s8T7tOrkVYkssTt1mmJ8TUZVVYaJ/51N
         cgXMFpLZse9KZYYbFP9ZNEGesFZ+k8jscb0EqdXGO4VjbPvkUWc47vn2f3v7RKOei40e
         DfYZw3mH8gJndVpCV8G3+yN1M6wYFbL4H1R1nAxAFOiXhaSAf8Y40LtYA8rTUHjdKLzI
         OfSdTFXrN56cGFfpUSs8S+9R7nhzqgiFLfptNwa/ttir1EeYn04BjGOxLJQ3TjebeYek
         otbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971029; x=1747575829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tikqvcPSSM0+ie8ei00WO4p/o6p01PdEuZ4eNfazi4=;
        b=bGJp3TcJ0C9YiaUW+iVgbhTKb1fDL2e9MYQQewhFCpklJXRbu/KlqZ6mE4kb0ARNYt
         5UvG1tLK2krcYqPExg8s6c5PSfxkBXHT0GBh/2J0ZNo/hUzBBRmX67GVjDmu6sl0VHbm
         XSOkkAsml5xLXsac7m8/bKTeizAX41SLi0Lhg1twzaSsAD5GrIhogh/fx2szRqRwhW9u
         SapVLBpXIQp/JSqHue3eNJJDP26HYJgO6sEAVBf+qyKLd6u8Lax6LA/vkKDj783G2ubJ
         9drzyod7HeZ95k2hA2/o1pPmsPjKzWdWwPUvHXCFx93C5J8zSOhP9yzlwxFeA0JrTBeM
         Kffg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/o4AwuV3eTu8tgFgU9GAXSRjqQuawazxEh3o7m13da8xBL+iW9giVEObu5JQbWgCCzYh37OCknc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLvE+S+SJDqbFdPpwZq3PqpVVRG25EFJLxv8MaQicSdtR//Iqt
	RlExq3Iq3zO6dIyfCC4k1K8a4gpa+f2BI9RsLj7icLjnnSiOOupazx3KK+4T8ZsUNVA7Pu15dHI
	u9ZUr4FxvjM0CjGIyunQ8uqZ1aWhUexSgwddmFg==
X-Gm-Gg: ASbGnctqNGpWTVeAiDlEjRUj0NAxNQ1WRLB+/DhLHjVfP03m3IJEnwiijOGgMSc53X/
	1u2BX58X38iFTRo/7X5ckfs7HQ4i6Cxsx9VA6JUHAK/mIE4+7kfH9a+rqygFkWkPOjRzZ3iknLN
	9YMU2hV2bbwmL3F2hLbYwxL15aIkVqR7FB
X-Google-Smtp-Source: AGHT+IGyy1tvQ5e1+LwmeN6aMxyvc+Kf3eAUBMdPUntGYmvmLxOM06L/3VzGSjkoX8RjJISKXUhUmqEwo7e719ksem0=
X-Received: by 2002:a05:6e02:1fc8:b0:3d0:26a5:b2c with SMTP id
 e9e14a558f8ab-3da7e34871amr88924955ab.8.1746971028558; Sun, 11 May 2025
 06:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com> <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com> <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
 <20250509-0811f32c1643d3db0ad04f63@orel> <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
 <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
In-Reply-To: <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 May 2025 19:13:37 +0530
X-Gm-Features: AX0GCFs_ezw8XJlOzMkddRA3UmJgoXKaRdAdTo6LGXAA1hZrT5A6WwM3ss5-FXk
Message-ID: <CAAhSdy3j0Uf52hs+_gRxkROTA4sjMkLk1sMtv=XZWsyv15TBSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064350_400849_CE446F01 
X-CRM114-Status: GOOD (  24.78  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCA3OjI34oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNS0wOVQxNzo1OToyOCswNTozMCwg
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPiBPbiBGcmksIE1heSA5LCAyMDI1
IGF0IDU6NDnigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90
ZToKPiA+PiBPbiBGcmksIE1heSAwOSwgMjAyNSBhdCAwNTozMzo0OVBNICswNTMwLCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4+ID4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjE24oCvUE0gUmFkaW0g
S3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+ID4gPiAyMDI1
LTA1LTA5VDEyOjI1OjI0KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoK
PiA+PiA+ID4gPiBPbiBUaHUsIE1heSA4LCAyMDI1IGF0IDg6MDHigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPj4gPiA+ID4+ICAqIFByZXNl
cnZlIHRoZSB1c2Vyc3BhY2UgaW5pdGlhbGl6ZWQgVkNQVSBzdGF0ZSBvbiBzYmlfaGFydF9zdGFy
dC4KPiA+PiA+ID4gPj4gICogUmV0dXJuIHRvIHVzZXJzcGFjZSBvbiBzYmlfaGFydF9zdG9wLgo+
ID4+ID4gPiA+Cj4gPj4gPiA+ID4gVGhlcmUgaXMgbm8gdXNlcnNwYWNlIGludm9sdmVtZW50IHJl
cXVpcmVkIHdoZW4gYSBHdWVzdCBWQ1BVCj4gPj4gPiA+ID4gc3RvcHMgaXRzZWxmIHVzaW5nIFNC
SSBIU00gc3RvcCgpIGNhbGwgc28gU1RST05HIE5PIHRvIHRoaXMgY2hhbmdlLgo+ID4+ID4gPgo+
ID4+ID4gPiBPaywgSSdsbCBkcm9wIGl0IGZyb20gdjMgLS0gaXQgY2FuIGJlIGhhbmRsZWQgYnkg
ZnV0dXJlIHBhdGNoZXMgdGhhdAo+ID4+ID4gPiB0cmFwIFNCSSBjYWxscyB0byB1c2Vyc3BhY2Uu
Cj4gPj4gPiA+Cj4gPj4gPiA+IFRoZSBsYWNrIG9mIHVzZXJzcGFjZSBpbnZvbHZlbWVudCBpcyB0
aGUgaXNzdWUuICBLVk0gZG9lc24ndCBrbm93IHdoYXQKPiA+PiA+ID4gdGhlIGluaXRpYWwgc3Rh
dGUgc2hvdWxkIGJlLgo+ID4+ID4KPiA+PiA+IFRoZSBTQkkgSFNNIHZpcnR1YWxpemF0aW9uIGRv
ZXMgbm90IG5lZWQgYW55IEtWTSB1c2Vyc3BhY2UKPiA+PiA+IGludm9sdmVtZW50Lgo+ID4+ID4K
PiA+PiA+IFdoZW4gYSBWQ1BVIHN0b3BzIGl0c2VsZiB1c2luZyBTQkkgSFNNIHN0b3AoKSwgdGhl
IEd1ZXN0IGl0c2VsZgo+ID4+ID4gcHJvdmlkZXMgdGhlIGVudHJ5IGFkZHJlc3MgYW5kIGFyZ3Vt
ZW50IHdoZW4gc3RhcnRpbmcgdGhlIFZDUFUKPiA+PiA+IHVzaW5nIFNCSSBIU00gc3RhcnQoKSB3
aXRob3V0IGFueSBLVk0gdXNlcnNwYWNlIGludm9sdmVtZW50Lgo+ID4+ID4KPiA+PiA+IEluIGZh
Y3QsIGV2ZW4gYXQgR3Vlc3QgYm9vdCB0aW1lIGFsbCBub24tYm9vdCBWQ1BVcyBhcmUgYnJvdWdo
dC11cAo+ID4+ID4gdXNpbmcgU0JJIEhTTSBzdGFydCgpIGJ5IHRoZSBib290IFZDUFUgd2hlcmUg
dGhlIEd1ZXN0IGl0c2VsZgo+ID4+ID4gcHJvdmlkZXMgZW50cnkgYWRkcmVzcyBhbmQgYXJndW1l
bnQgd2l0aG91dCBhbnkgS1ZNIHVzZXJzcGFjZQo+ID4+ID4gaW52b2x2ZW1lbnQuCj4gPj4KPiA+
PiBIU00gb25seSBzcGVjaWZpZXMgdGhlIHN0YXRlIG9mIGEgZmV3IHJlZ2lzdGVycyBhbmQgdGhl
IElTQSBvbmx5IGEgZmV3Cj4gPj4gbW9yZS4gQWxsIG90aGVyIHJlZ2lzdGVycyBoYXZlIElNUERF
RiByZXNldCB2YWx1ZXMuIFplcm9zLCBsaWtlIEtWTQo+ID4+IHNlbGVjdHMsIGFyZSBhIGdvb2Qg
Y2hvaWNlIGFuZCB0aGUgYmVzdCBkZWZhdWx0LCBidXQgaWYgdGhlIFZNTSBkaXNhZ3JlZXMsCj4g
Pj4gdGhlbiBpdCBzaG91bGQgYmUgYWxsb3dlZCB0byBzZWxlY3Qgd2hhdCBpdCBsaWtlcywgYXMg
dGhlIFZNTS91c2VyIGlzIHRoZQo+ID4+IHBvbGljeSBtYWtlciBhbmQgS1ZNIGlzICJqdXN0IiB0
aGUgYWNjZWxlcmF0b3IuCj4gPgo+ID4gVGlsbCBub3cgdGhlcmUgYXJlIG5vIHN1Y2ggSU1QREVG
IHJlc2V0IHZhbHVlcyBleHBlY3RlZC4gV2Ugd2lsbAo+ID4gY3Jvc3MgdGhhdCBicmlkZ2Ugd2hl
biBuZWVkZWQuIEFsdGhvdWdoLCBJIGRvdWJ0IHdlIHdpbGwgZXZlciBuZWVkIGl0Lgo+Cj4gVGhl
IElNUERFRiBpc3N1ZSBhbHJlYWR5IGV4aXN0cy4gIEtWTSByZXNldHMgc2NvdW50ZXJlbiB0byA3
LCBidXQKPiB1c2Vyc3BhY2Ugd2FudHMgaXQgdG8gYmUgZGlmZmVyZW50LCBsaWtlbHkgMC4KClRo
ZSBzY291bnRlcmVuIHNldCB0byA3IGlzIHRlbXBvcmFyeSB3b3JrYXJvdW5kIHdoaWNoIGlzIHN1
cHBvc2VkCnRvIGJlIHJlbW92ZWQgb25jZSBHdWVzdCBMaW51eCBpbml0aWFsaXplcyBzY291bnRl
cmVuIGNvcnJlY3RseSBhdApib290IHRpbWUuIEF0IHRoaXMgcG9pbnQgaW4gdGltZSB3ZSBjYW4g
cmVtb3ZlIHRoaXMgc2NvdW50ZXJlbgp3b3JrYXJvdW5kIGZyb20gS1ZNIGJlY2F1c2UgdGhlIFNC
SSBQTVUgZHJpdmVyIGlzIGluaXRpYWxpemluZwpzY291bnRlcmVuIGNvcnJlY3RseSBzaW5jZSBt
YW55IGtlcm5lbCByZWxlYXNlcy4KKFJlZmVyLCBwbXVfc2JpX3N0YXJ0aW5nX2NwdSgpIGluIGRy
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMpCgpJZiB3ZSBhYnNvbHV0ZWx5IG5lZWQgYSBtZWNo
YW5pc20gZm9yIHVzZXJzcGFjZSB0byBwcm92aWRlIGN1c3RvbQpyZXNldCB2YWx1ZXMgb2YgQ1NS
cyB0aGVuIHdlIHNob3VsZCB1c2UgdGhlIGV4aXN0aW5nIE9ORV9SRUcKaW50ZXJmYWNlIHRvIGRl
ZmluZSBhIG5ldyB0eXBlIHVzaW5nIHdoaWNoIENTUiByZXNldCB2YWx1ZXMgY2FuIGJlCnNldCBh
dCBWTSBjcmVhdGlvbiB0aW1lLiBCdXQsIEkgc3RpbGwgdGhpbmsgd2UgZG9uJ3QgbmVlZCBzdWNo
IGEKbWVjaGFuaXNtIGltbWVkaWF0bHkuCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
