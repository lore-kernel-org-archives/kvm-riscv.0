Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C2C7115B
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJ/cQxivS89tinaEdBTgRjh21RVdtoNtVcgVYOISRcw=; b=d9LYTJSsYbYKzg
	PJnalJjIXYhf3DqeTDlZdazzBcro2SbofAmdgGD2CfIPUeJw3zuibZSy1peMhQfB8wj1xkGw/h+w0
	qkopfbjbkGAfm0IMdDo4G5YXRUPXDyZr1py8vB/laiMZelgtIIN4YU/kmB3IiH2oEymqH3h09orVD
	kSzxP8x0ENXQfelJK1UIecoA1dFDmGw3x0ZUEeNmbkCXPrfAD4wsKPX9QLwGC+peJ9G0vrx3nEgj5
	D+ySH+mTyQDG6gI7Vpdj+YUT1nty6wu/bMaiLCmunfYQh9SM+yLXFsg/5j8VWjQCXb6lmANySVzR3
	psn1yEhiJpW6yitKNOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscX-00000004Nzl-1fOM;
	Tue, 24 Jun 2025 01:38:45 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpw4-000000047i9-2jbl
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 22:46:46 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4e7fac85892so1193450137.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750718803; x=1751323603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym0HxdMynda5jpDn6I4eu6hPVQjdVA1rMVxf5FN/Ffs=;
        b=gj2AmwrA1MqHT0onZqxHi6WDR8f2gNUYk8fGFNA0x7XoqLMIvlwwq/6/DJyaLr1WMD
         cmzDLU94/M6+5Vj6v0S/QdwWplOoJM7R9puMQ6xtscc0/tXxXYhdHNZwv2W1lVgOKnlE
         12Ey81nUuzmuuU4bsd98yasx8TTzbYLrs1ubN/Tabk+4lWdknakhPRAQPDR/sQFMyxxo
         C4J9gPAP6CWRpOCZ/P8bs3hGgxRswaqAL/AVfjHdRiAHT77ZdmuLQ6RxRb0syPqA6gwe
         V4LiQxZ6jp9MEHLLqCB6mSWMDMkWoPp+c3jEHJ/X48gyXzRx9dfwQ1KEphJJXxKSLhjY
         /h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718803; x=1751323603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym0HxdMynda5jpDn6I4eu6hPVQjdVA1rMVxf5FN/Ffs=;
        b=DkGtFjBO51C2q/V2q65zl/Xm8ai2wvGKmAPVDLZ2V90eEvZ2sMxURjCtTGtaAnS0m6
         Nnh9inNhFIusXF5p+2hEwZ/eQPcl/3cOq7Zxp1e4I8GYxMixRpW8PSkGTUe/+heo/UhD
         bj+S/onygWlLVWgbUiCZquwpUuFr1vHbOT6jTpMk6RIzDOuhz4xjc/ERlYpa5ZGMEjjZ
         i2rm+XnRqeIAwUf88dpnRTzYhLUbpJY4dCcWojlG+2WatnYqZQ66sO45LnuK4caXSHmV
         AJUNQ9HHCRL62oC2tvEHHau3/sx1nyjRVa+G6fcbAS6FQPlsLgGWnxRIkWZUvsUly0jS
         IZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCW+M3bNIl4D29Q4v5Ox676jDjW2DFm4hI0ymscjKCeHur0rDBGRBerytvteRMmVkauM0V/VAuXtyKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxndJsPLm4bLcu012yqZzE/dD34ccQebVzAsFLdW4JDPJph386N
	fUlex49Pdrawu4GclF3L0DZikYA8qfMytUsx50XS6+BceUO15ZIbPpA21QPKrTDms/mhDABuUZq
	BZBC3a9/8k8ZKL2DVaOgi19mm7ZQPCpGTp0ztKnrU/w==
X-Gm-Gg: ASbGnctpnmMNxZc6RfHea1djcrI3bvxSU5guf4p4EdyqgBd0dO7nflitl4GFpgaD75V
	eWyucaIcBqgK+0AEV5uLL7PdYDl5cJkKubZ67GYysykbGh76EFtn066blqEL8FGdjQc87v7QIiI
	F84JlPO7tX7Nopr6PM9W+JyCi5kjDahSB4qxlgUf0MMJHN
X-Google-Smtp-Source: AGHT+IFFi5eDNgPmLRk5B8kDGRwTLx842aYBtGrbpiDH5LOZp5sY2aVIe4JANq3ZFJwGeg3PELwobnK+RDfeH6qpX80=
X-Received: by 2002:a05:6102:6ca:b0:4e9:94a3:1a34 with SMTP id
 ada2fe7eead31-4e9c299dff9mr7875257137.16.1750718803142; Mon, 23 Jun 2025
 15:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250620155051.68377-1-jesse@rivosinc.com> <20250623-c4c3115e6402176024bac6ea@orel>
In-Reply-To: <20250623-c4c3115e6402176024bac6ea@orel>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 23 Jun 2025 15:46:31 -0700
X-Gm-Features: Ac12FXzOlaSm8467YuophwGI70NXmcwcBfhPWLQv-KNC7l7Ri6aKh7MVt_taL8w
Message-ID: <CALSpo=YQun4owTSkCULpgSu386nHK4q8kuU--oif4Wtw2S_V1w@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: lib: sbi_shutdown add exit code.
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_154644_778376_9F6D2918 
X-CRM114-Status: GOOD (  25.33  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMTA6MDHigK9BTSBBbmRyZXcgSm9uZXMgPGFuZHJldy5q
b25lc0BsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgMDg6NTA6
NTFBTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4gPiBXaGVuIGV4aXRpbmcgaXQgbWF5IGJl
IHVzZWZ1bCBmb3IgdGhlIHNiaSBpbXBsZW1lbnRhdGlvbiB0byBrbm93IHRoZQo+ID4gZXhpdCBj
b2RlLgo+ID4gQWRkIGV4aXQgY29kZSB0byBzYmlfc2h1dGRvd24sIGFuZCB1c2UgaXQgaW4gZXhp
dCgpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5j
b20+Cj4gPiAtLS0KPiA+ICBsaWIvcmlzY3YvYXNtL3NiaS5oIHwgMiArLQo+ID4gIGxpYi9yaXNj
di9pby5jICAgICAgfCAyICstCj4gPiAgbGliL3Jpc2N2L3NiaS5jICAgICB8IDQgKystLQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9saWIvcmlzY3YvYXNtL3NiaS5oIGIvbGliL3Jpc2N2L2FzbS9zYmkuaAo+
ID4gaW5kZXggYTU3MzhhNWMuLmRlMTFjMTA5IDEwMDY0NAo+ID4gLS0tIGEvbGliL3Jpc2N2L2Fz
bS9zYmkuaAo+ID4gKysrIGIvbGliL3Jpc2N2L2FzbS9zYmkuaAo+ID4gQEAgLTI1MCw3ICsyNTAs
NyBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBs
b25nIGFyZzAsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmczLCB1
bnNpZ25lZCBsb25nIGFyZzQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBhcmc1KTsKPiA+Cj4gPiAtdm9pZCBzYmlfc2h1dGRvd24odm9pZCk7Cj4gPiArdm9pZCBzYmlf
c2h1dGRvd24odW5zaWduZWQgaW50IGNvZGUpOwo+ID4gIHN0cnVjdCBzYmlyZXQgc2JpX2hhcnRf
c3RhcnQodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVuc2lnbmVkIGxvbmcgZW50cnksIHVuc2lnbmVk
IGxvbmcgc3ApOwo+ID4gIHN0cnVjdCBzYmlyZXQgc2JpX2hhcnRfc3RvcCh2b2lkKTsKPiA+ICBz
dHJ1Y3Qgc2JpcmV0IHNiaV9oYXJ0X2dldF9zdGF0dXModW5zaWduZWQgbG9uZyBoYXJ0aWQpOwo+
ID4gZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9pby5jIGIvbGliL3Jpc2N2L2lvLmMKPiA+IGluZGV4
IGZiNDBhZGI3Li4wMjIzMTI2OCAxMDA2NDQKPiA+IC0tLSBhL2xpYi9yaXNjdi9pby5jCj4gPiAr
KysgYi9saWIvcmlzY3YvaW8uYwo+ID4gQEAgLTE1MCw3ICsxNTAsNyBAQCB2b2lkIGhhbHQoaW50
IGNvZGUpOwo+ID4gIHZvaWQgZXhpdChpbnQgY29kZSkKPiA+ICB7Cj4gPiAgICAgICBwcmludGYo
IlxuRVhJVDogU1RBVFVTPSVkXG4iLCAoKGNvZGUpIDw8IDEpIHwgMSk7Cj4gPiAtICAgICBzYmlf
c2h1dGRvd24oKTsKPiA+ICsgICAgIHNiaV9zaHV0ZG93bihjb2RlICYgMSk7Cj4gPiAgICAgICBo
YWx0KGNvZGUpOwo+ID4gICAgICAgX19idWlsdGluX3VucmVhY2hhYmxlKCk7Cj4gPiAgfQo+ID4g
ZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9zYmkuYyBiL2xpYi9yaXNjdi9zYmkuYwo+ID4gaW5kZXgg
Mjk1OTM3OGYuLjlkZDExZTlkIDEwMDY0NAo+ID4gLS0tIGEvbGliL3Jpc2N2L3NiaS5jCj4gPiAr
KysgYi9saWIvcmlzY3Yvc2JpLmMKPiA+IEBAIC0xMDcsOSArMTA3LDkgQEAgc3RydWN0IHNiaXJl
dCBzYmlfc3NlX2luamVjdCh1bnNpZ25lZCBsb25nIGV2ZW50X2lkLCB1bnNpZ25lZCBsb25nIGhh
cnRfaWQpCj4gPiAgICAgICByZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRfU1NFLCBTQklfRVhUX1NT
RV9JTkpFQ1QsIGV2ZW50X2lkLCBoYXJ0X2lkLCAwLCAwLCAwLCAwKTsKPiA+ICB9Cj4gPgo+ID4g
LXZvaWQgc2JpX3NodXRkb3duKHZvaWQpCj4gPiArdm9pZCBzYmlfc2h1dGRvd24odW5zaWduZWQg
aW50IGNvZGUpCj4gPiAgewo+ID4gLSAgICAgc2JpX2VjYWxsKFNCSV9FWFRfU1JTVCwgMCwgMCwg
MCwgMCwgMCwgMCwgMCk7Cj4gPiArICAgICBzYmlfZWNhbGwoU0JJX0VYVF9TUlNULCAwLCAwLCBj
b2RlLCAwLCAwLCAwLCAwKTsKPgo+IFdlIGNhbid0IGRvIHRoaXMgYmVjYXVzZSBhIGt2bS11bml0
LXRlc3RzIGV4aXQgY29kZSBpcyBub3QgYW4KPiBTUlNUOjpyZXNldF9yZWFzb25bMV0uIFRoaXMg
Y291bGQgcmVzdWx0IGluIHRoZSBTQkkgaW1wbGVtZW50YXRpb24KPiByZXR1cm5pbmcgYW4gZXJy
b3IsIG9yIGRvaW5nIHNvbWV0aGluZyBlbHNlLCByYXRoZXIgdGhhbiBzaHV0dGluZwo+IGRvd24u
CgpZZXMgdGhhdCdzIHdoeSB0aGVyZSBpczoKK3NiaV9zaHV0ZG93bihjb2RlICYgMSk7CkFkbWl0
dGVkbHkgaXQgc2hvdWxkIHByb2JhYmx5IGJlOgorc2JpX3NodXRkb3duKCEhY29kZSk7Cgo+Cj4g
SWYgdGhpcyBpcyBhIGN1c3RvbSBrdm0tdW5pdC10ZXN0cy1zcGVjaWZpYyBTQkkgaW1wbGVtZW50
YXRpb24sIHRoZW4KPiB3ZSBjb3VsZCBwYXNzIGluIGEgcmVzZXRfcmVhc29uIGluIHRoZSAweEUw
MDAwMDAwIC0gMHhFRkZGRkZGRiByYW5nZS4KClRoYXQgc3RpbGwgZG9lc24ndCBndWFyYW50ZWUg
aXQgdG8gc3VjY2VlZC4KSW4gdGhlIGV4aXQgZnVuY3Rpb24gd2UgY2FuIGFkZCBhIGZhbGxiYWNr
IGxpa2UgYHNiaV9zaHV0ZG93bigwKTtgLApidXQgcmVhc29uIGNvZGUgMSAoU3lzdGVtIGZhaWx1
cmUpIHNob3VsZCBhbHdheXMgd29yay4KSWYgYW55b25lIHdhbnRzIHRvIHVzZSBpdCBmb3IgU0JJ
IHNwZWNpZmljIGNvZGVzLCB0aGF0J3MgZmluZSwKYnV0IEkgb25seSBhZGRlZCBpdCBmb3IgdGhl
IE5vIHJlYXNvbiBhbmQgU3lzdGVtIGZhaWx1cmUgZXhpdCBjb2Rlcy4KClRoYW5rcywKSmVzc2Ug
VGF1YmUuCgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNi
aS1kb2MvYmxvYi9tYXN0ZXIvc3JjL2V4dC1zeXMtcmVzZXQuYWRvYyN0YWJsZV9zcnN0X3N5c3Rl
bV9yZXNldF9yZWFzb25zCj4KPiBUaGFua3MsCj4gZHJldwo+Cj4KPiA+ICAgICAgIHB1dHMoIlNC
SSBzaHV0ZG93biBmYWlsZWQhXG4iKTsKPiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4K
PiA+Cj4gPiAtLQo+ID4ga3ZtLXJpc2N2IG1haWxpbmcgbGlzdAo+ID4ga3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
