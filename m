Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D242BC28B2E
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfNDZnBR8kuR++xm12mAq7RQ/GUWhOMOzXMNksQhWeM=; b=A5l6JI/CjXkiEi
	LzJ6H5o8oSIycCvOHOdhwcGuhxwmucHu/7rE+GJOw2J6sOmwq0Mb65IhL4hLxaX30z2Vl6yuOHdMq
	V6Eepp4+Q+wWzHLGxEhNv2uxSQooWd7BSwjJKfbfQ2z+GpPac+wTt+q0l/Pp+8vdMzn8wBrVeWM6x
	ROOdGL3ysM53kJCES5J17RjTF6YpNE25kZxS3bldCMDvRpNMqcx8fWerUOkn1HM+lDNHxvk/xyI8K
	0dCLA8l+K4oW5502PRE6p59/n6TvCibS3+aJbGQIJiUlh8K764k4T92l2UHuEKBlE7flx0Hrs25Pc
	7gbndEgjEJCYnTdYIOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traCE-00000002E5b-2LhB;
	Mon, 10 Mar 2025 10:17:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tra1T-00000002CYy-1vmx
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 10:06:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so33700675e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20230601.gappssmtp.com; s=20230601; t=1741601169; x=1742205969; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJfwQiA9AVTQINZ23mXNQSuHyWFsPfeAEiqtu1mzS+U=;
        b=Mgl4Wv16cyLWWqEyv7DwYR5LzpzgLf46ekIlCmg7zCAkTsWppIPjmOnEA1t62rBduG
         4lRuOh/RLHnC3VQ/lbtTwZwYZUf4A7pXVVy2/KZYBne2FqQmGGvIZf/vfPmPtmH9v9yu
         GVG8bMRjIQEWA8sAUhpszxfpTdTllRsTYDhBKtP556eW5bNlfiEWJ6G1UwmHgPnepQSu
         XQXB3/Jy38IsShc13sJRs82l+2wKFe3F6PpPjrmbe+fLi4SyzUmGobQOiF3akramMmXy
         BcTpPp4k19iBUz+hO5BK7JWiqPnXbtrjUs1EJRjL0CmgVKh+THa6OSGoo9nlbmClVxpc
         NaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741601169; x=1742205969;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJfwQiA9AVTQINZ23mXNQSuHyWFsPfeAEiqtu1mzS+U=;
        b=UEKPxq2YYWkU1vnc4rCB+nQhfLNEar+7ncWHsvfeh+7tE3j0ZEp9xb3NQVvNXHa0xo
         XjP/kA6lySRLhJrLQleNKm7ZMpoB9VG7C4IWSvekpGPewHK1qSSrkX3Zmy/QRw9ZZ20h
         Wxg8Xn4viQboapcvcGQuH6Gv1PPVgLFbfcLRwPERSpG98JufqWog1OsyZ436La9yuP0v
         VUYipHQXPpf2+6lGW0d/LkqeR7Wfe/0rBPXmG5TgVrfAyso0cf5IHbU88W1+gYhmry83
         0nXd2R1lql/Hj0nBAEYPvVf0IJa7delpff0Sp26zrdIbyz+deXCILXGJETfKCXT88v0S
         gLPA==
X-Gm-Message-State: AOJu0YyJJxg1V0CdptzAuhypzjGeuB76MKfB2MB1I1dk7kPbMszFizkh
	SoY8TTG1yIQnZldJJ1/qCam3lq1TPqr7+KzspIC7gEAfuCp4ZrWmHzSopghRlVhQEnH+ptoTqA9
	2+B0=
X-Gm-Gg: ASbGncu32nGax2cjJP/B12+EwK3fwoEhGqv7p0C5rlsJpKgr+heoXK0ynTLBcK+KY4Y
	CVk7VW3F80N3FHle1mRKNgLpySxKtmnhv1Sn76U/k2B4Ya9VlLXXmvaXlrzVrP3pxXlhRUsMGId
	wWk7qVkSUarKJFAMZoJAKwbfFtP7EAlmxlg8nfQNsx/v/D7DNr3er4C38zJ9emsngtEo2n4a4mw
	TBylCQkJhyAnbWZRBtOB/eItRIv8sAE0vegD27pqCUiuMA8yboVApq7YHavI12NTrCM8Nd5+1AT
	8J8vmGeM/5JcI1lWhx2FMHujr80uT8pmD+qq76ld9UusKx73Nvu3oi7ABCqtGPQtdsdzh3NRhMv
	BinUmCBLrQFvZ1sYmqN4TXaFDPjZ9juBKMJzNFXinxQ==
X-Google-Smtp-Source: AGHT+IGx+e0oTtMQ+YsxvX9mbdnKxOlPYoD5dYSjNasOT4xEUDOgKVitTe5iS44DltgIv6oIgvLa8w==
X-Received: by 2002:a05:600c:4fc9:b0:43b:ce08:c382 with SMTP id 5b1f17b1804b1-43c601cfd0dmr89530915e9.16.1741601169040;
        Mon, 10 Mar 2025 03:06:09 -0700 (PDT)
Received: from ?IPV6:2001:861:8b82:e3f0:652b:a6a1:f717:23c3? ([2001:861:8b82:e3f0:652b:a6a1:f717:23c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfad9b823sm19517605e9.5.2025.03.10.03.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:06:08 -0700 (PDT)
Message-ID: <b7c034c9-4adf-4601-849e-0c87af3624bf@virtualopensystems.com>
Date: Mon, 10 Mar 2025 11:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Understanding in-kernel irqchip (APLIC + IMSIC)
 behavior with multiple devices and interrupt handling
From: Samuele Paone <s.paone@virtualopensystems.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, Alvise Rigo <a.rigo@virtualopensystems.com>
References: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
 <CAK9=C2UUnP0xV-p6NMH8ma2-hB2K52_5Ug-OKJWcSq1xwBXCFw@mail.gmail.com>
 <5e839bfd-16c0-45cc-b01a-6ae69f6a22cd@virtualopensystems.com>
Content-Language: en-US
In-Reply-To: <5e839bfd-16c0-45cc-b01a-6ae69f6a22cd@virtualopensystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_030611_803841_1D7CF54E 
X-CRM114-Status: GOOD (  29.00  )
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

SGVsbG8sCgpJIHdhcyBqdXN0IHdvbmRlcmluZyBpZiB5b3UgaGFkIHRoZSBjaGFuY2UgdG8gdGFr
ZSBhIGxvb2sgYXQgdGhpcz8KClJlZ2FyZHMsCgpTYW11ZWxlCgpPbiAyLzE5LzI1IDEwOjE5IEFN
LCBTYW11ZWxlIFBhb25lIHdyb3RlOgo+IEhlbGxvLAo+IHRoYW5rcyBmb3IgdGhlIHJlcGx5Cj4K
PiBJIGFtIGFza2luZyB0aGF0IGJlY2F1c2Ugd2UgaGF2ZSB0aGUgc3VzcGVjdCB0aGF0IHRoZXJl
IGlzCj4gYSBzbWFsbCBlcnJvciBpbiB0aGUgd2F5IGVkZ2UgdHJpZ2dlcmVkIGludGVycnVwdHMg
YXJlIGVtdWxhdGVkIHdoZW4gYQo+IGRldmljZSBwZXJmb3JtIGEgd3JpdGUgb24gdGhlIGlycWZk
Lgo+Cj4gVGhlIHBvaW50IGlzIHRoYXQgaW4gYHZpcnQva3ZtL2V2ZW50ZmQuY2AgaW4gZnVuY3Rp
b24gYGlycWZkX3dha2V1cGA6Cj4gYGBgCj4gwqDCoMKgwqDCoMKgwqAgaWYgKGt2bV9hcmNoX3Nl
dF9pcnFfaW5hdG9taWMoJmlycSwga3ZtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEtWTV9VU0VSU1BBQ0VfSVJRX1NPVVJDRV9JRCwgMSwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSkg
PT0gLUVXT1VMREJMT0NLKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWR1bGVfd29yaygm
aXJxZmQtPmluamVjdCk7Cj4gYGBgCj4gVGhlIGxldmVsIGlzIGFsd2F5cyBzZXQgdG8gMS4gSW4g
dGhlIGNhc2Ugb2YgYW4gZWRnZSB0cmlnZ2VyZWQgaW50ZXJydXB0LAo+IEkgd291bGQgZXhwZWN0
IHRoZSBiZWhhdmlvciBvZiBgJmlycWZkLT5pbmplY3RgOgo+IGBgYAo+IMKgwqDCoCBpZiAoIWly
cWZkLT5yZXNhbXBsZXIpIHsKPiDCoMKgwqDCoMKgwqDCoCBrdm1fc2V0X2lycShrdm0sIEtWTV9V
U0VSU1BBQ0VfSVJRX1NPVVJDRV9JRCwgaXJxZmQtPmdzaSwgMSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmFsc2UpOwo+IMKgwqDCoMKgwqDCoMKgIGt2bV9zZXRfaXJxKGt2bSwg
S1ZNX1VTRVJTUEFDRV9JUlFfU09VUkNFX0lELCBpcnFmZC0+Z3NpLCAwLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSk7Cj4gwqDCoMKgIH0gZWxzZQo+IMKgwqDCoMKgwqDC
oMKgIGt2bV9zZXRfaXJxKGt2bSwgS1ZNX0lSUUZEX1JFU0FNUExFX0lSUV9TT1VSQ0VfSUQsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlycWZkLT5nc2ksIDEsIGZhbHNlKTsKPiB9
Cj4gYGBgCj4KPiBUaGUgcG9pbnQgaXMsIHRoYXQgY2FuIG5ldmVyIGhhcHBlbiBzaW5jZSBga3Zt
X3NldF9pcnFfaW5hdG9taWNgIGlzIAo+IGltcGxlbWVudGVkCj4gbGlrZSB0aGlzOgo+IGBgYAo+
IGludCBrdm1fYXJjaF9zZXRfaXJxX2luYXRvbWljKHN0cnVjdCBrdm1fa2VybmVsX2lycV9yb3V0
aW5nX2VudHJ5ICplLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGt2bSAqa3ZtLCBpbnQgaXJxX3NvdXJjZV9pZCwgaW50IGxldmVsLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBsaW5lX3N0YXR1cykKPiB7Cj4gwqDCoMKgIGlmICgh
bGV2ZWwpCj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FV09VTERCTE9DSzsKPiAuLi4KPiB9Cj4g
YGBgCj4gUmVnYXJkcywKPiBTYW11ZWxlCj4KPiBPbiAxLzMxLzI1IDY6MDYgUE0sIEFudXAgUGF0
ZWwgd3JvdGU6Cj4+IE9uIFR1ZSwgSmFuIDcsIDIwMjUgYXQgMTA6MzbigK9QTSBTYW11ZWxlIFBh
b25lCj4+IDxzLnBhb25lQHZpcnR1YWxvcGVuc3lzdGVtcy5jb20+IHdyb3RlOgo+Pj4gSGVsbG8g
ZXZlcnlvbmUsCj4+PiBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIHJlZ2FyZGluZyB0aGUgaW4ta2Vy
bmVsIGlycWNoaXAKPj4+IGltcGxlbWVudGF0aW9uLCBzcGVjaWZpY2FsbHkgaW4gdGhlIGNvbnRl
eHQgb2YgQVBMSUMgYW5kIElNU0lDIGZvcgo+Pj4gUklTQy1WOgo+Pj4KPj4+IDEuICoqQmVoYXZp
b3Igd2l0aCBNdWx0aXBsZSBEZXZpY2VzKio6IERvZXMgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24KPj4+IHN1cHBvcnQgdGhlIGNyZWF0aW9uIG9mIGEgVk0gd2l0aCBib3RoIFBDSSBkZXZpY2Vz
ICh0aGF0IHVzZSBNU0kpIGFuZAo+Pj4gTU1JTyBkZXZpY2VzICh0aGF0IHVzZSB3aXJlZCBpbnRl
cnJ1cHRzKT8KPj4gWWVzLCBpdHMgc3VwcG9ydGVkLgo+Pgo+PiBNU0lzIGZyb20gYm90aCBQQ0ll
IGFuZCBQbGF0Zm9ybSBkZXZpY2VzIGFyZSBwcm9jZXNzZWQgYnkgSU1TSUMuCj4+IFdpcmVkIGlu
dGVycnVwdHMgYXJlIGhhbmRsZWQgdGhyb3VnaCBBUExJQyBNU0ktbW9kZSB3aGVyZSB0aGUKPj4g
QVBMSUMgY29udmVydHMgaW50ZXJydXB0IHN0YXRlIGNoYW5nZSBpbnRvIE1TSSB3cml0ZXMuCj4+
Cj4+PiBJZiBzdWNoIGEgc2NlbmFyaW8gaXMgbm90IHN1cHBvcnRlZCwgaG93IGNhbiBJIGNvbmZp
Z3VyZSBhbiBNTUlPCj4+PiBkZXZpY2UgdG8gdXNlIE1TSSBpbnRlcnJ1cHRzPyBXb3VsZCBpdCBh
bGwgYm9pbCBkb3duIHRvIHNvbWUgZGV2aWNlCj4+PiB0cmVlIGNvbmZpZ3VyYXRpb24KPj4+IChp
LmUuLCB0aGUgTU1JTyBkZXZpY2UgdHJlZSBub2RlICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSByZWZl
cmVuY2luZyB0aGUKPj4+IElNU0lDIHJhdGhlciB0aGFuIHRoZSBBUExJQyBkaXJlY3RseSk/Cj4+
IFBsYXRmb3JtIChvciBNTUlPKSBkZXZpY2VzIHdpdGggTVNJIHN1cHBvcnQgZG9uJ3QgbmVlZCB0
aGUgImludGVycnVwdHMiCj4+IERUIHByb3BlcnR5LCBpbnN0ZWFkIHRoZSAibXNpLXBhcmVudCIg
RFQgcHJvcGVydHkgaXMgdXNlZCB0byBwb2ludCB0bwo+PiB0aGUgSU1TSUNzLgo+Pgo+Pj4gMi4g
SSBmaW5kIHVuY2xlYXIgaG93IHRoZSB2YXJpYWJsZSBgbGV2ZWxgIGlzIHVzZWQgaW5zaWRlIGZ1
bmN0aW9uCj4+PiBga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbmplY3RgIGluIGBhcmNoL3Jpc2N2L2t2
bS9haWFfYXBsaWMuY2AKPj4+Cj4+PiBgYGAKPj4+IHN3aXRjaCAoaXJxZC0+c291cmNlY2ZnICYg
QVBMSUNfU09VUkNFQ0ZHX1NNX01BU0spIHsKPj4+IGNhc2UgQVBMSUNfU09VUkNFQ0ZHX1NNX0VE
R0VfUklTRToKPj4+IGlmIChsZXZlbCAmJiAhKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRF
X0lOUFVUKSAmJgo+Pj4gwqDCoMKgwqAgIShpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9Q
RU5ESU5HKSkKPj4+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9QRU5ESU5HOwo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV2ZWwgPSAwOwo+Pj4gYnJlYWs7Cj4+
PiBjYXNlIEFQTElDX1NPVVJDRUNGR19TTV9FREdFX0ZBTEw6Cj4+PiBpZiAoIWxldmVsICYmIChp
cnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9JTlBVVCkgJiYKPj4+IMKgwqDCoMKgICEoaXJx
ZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVfUEVORElORykpCj4+PiBpcnFkLT5zdGF0ZSB8PSBB
UExJQ19JUlFfU1RBVEVfUEVORElORzsKPj4+IGJyZWFrOwo+Pj4gY2FzZSBBUExJQ19TT1VSQ0VD
RkdfU01fTEVWRUxfSElHSDoKPj4+IGlmIChsZXZlbCAmJiAhKGlycWQtPnN0YXRlICYgQVBMSUNf
SVJRX1NUQVRFX1BFTkRJTkcpKQo+Pj4gaXJxZC0+c3RhdGUgfD0gQVBMSUNfSVJRX1NUQVRFX1BF
TkRJTkc7Cj4+PiBicmVhazsKPj4+IGNhc2UgQVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0xPVzoK
Pj4+IGlmICghbGV2ZWwgJiYgIShpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9QRU5ESU5H
KSkKPj4+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9QRU5ESU5HOwo+Pj4gYnJlYWs7
Cj4+PiB9Cj4+Pgo+Pj4gaWYgKGxldmVsKQo+Pj4gaXJxZC0+c3RhdGUgfD0gQVBMSUNfSVJRX1NU
QVRFX0lOUFVUOwo+Pj4gZWxzZQo+Pj4gaXJxZC0+c3RhdGUgJj0gfkFQTElDX0lSUV9TVEFURV9J
TlBVVDsKPj4+IGBgYAo+Pj4KPj4+IENvbnNpZGVyaW5nIGBlZGdlX3Jpc2VgIGludGVycnVwdHMs
IGFzIGZhciBhcyBJIGNhbiBzZWUsIHRoZQo+Pj4gQVBMSUNfSVJRX1NUQVRFX0lOUFVUIGlzIHNl
dCBvbmx5IGluIHRoZSBjb2RlIGFib3ZlCj4+PiDCoCBidXQgcHJldmVudHMgZWRnZV9yaXNlIGlu
dGVycnVwdHMgZnJvbSBiZWluZyBzZXQgcGVuZGluZy4KPj4+IE1vcmVvdmVyLCBpbiBhIHN5c3Rl
bSBlbXVsYXRvciBpbXBsZW1lbnRhdGlvbiB0aGF0IHVzZXMgaW4ta2VybmVsIAo+Pj4gSVJRQ0hJ
UCBhbmQKPj4+IElycUZkLCB0aGlzIHZhcmlhYmxlIGlzIGhhcmQtY29kZWQgKGB2aXJ0L2t2bS9l
dmVudGZkLmNgIGluIGZ1bmN0aW9uCj4+PiBgaXJxZmRfd2FrZXVwYCB3aGVuIGl0IGNhbGxzIGBr
dm1fYXJjaF9zZXRfaXJxX2luYXRvbWljYCkKPj4+IGluIHRoZSBrZXJuZWwgYXMgMS4KPj4gVGhl
IElOUFVUIGJpdCBpbiB0aGUgSVJRIHN0YXRlIHJlcHJlc2VudHMgdGhlIHJhdyBpbnB1dAo+PiBz
dGF0ZSB3aGVyZWFzIHRoZSBQRU5ESU5HIGJpdCBpbiB0aGUgSVJRIHN0YXRlIHJlcHJlc2VudHMK
Pj4gdGhhdCBnaXZlbiBJUlEgbmVlZHMgdG8gYmUgdGFrZW4gYnkgQ1BVLgo+Pgo+Pj4gMy4gKipN
U0ktb25seSBTdXBwb3J0IGluIHRoZSBpcnFjaGlwKio6IFRoZSBpbi1rZXJuZWwgaXJxY2hpcAo+
Pj4gZG9jdW1lbnRhdGlvbiBzdGF0ZXMgdGhhdCBpdCBvbmx5IHN1cHBvcnRzIE1TSS4gSG93ZXZl
ciwgdGhlIFJJU0MtVgo+Pj4gaGFyZHdhcmUgZG9jdW1lbnRhdGlvbiBtZW50aW9ucyB0aGF0IEFQ
TElDIGNhbiB0YWtlIHdpcmVkIGludGVycnVwdHMKPj4+IGFzIGlucHV0IGFuZCBjb252ZXJ0IHRo
ZW0gdG8gTVNJIHRvIGZvcndhcmQgdG8gSU1TSUMuIENvdWxkIHNvbWVvbmUKPj4+IGNsYXJpZnkg
d2hhdCBpcyBtZWFudCBieSAiTVNJLW9ubHkiIHN1cHBvcnQgaW4gdGhpcyBjb250ZXh0PyBBcmUg
dGhlcmUKPj4+IHNwZWNpZmljIGNvbnN0cmFpbnRzIG9yIGltcGxlbWVudGF0aW9uIGRldGFpbHMg
dGhhdCBsaW1pdCB0aGUgaXJxY2hpcAo+Pj4gdG8gb25seSBzdXBwb3J0IE1TSSBmb3IgdmlydHVh
bGl6YXRpb24/Cj4+IFRoZSBLVk0gaW4ta2VybmVsIEFJQSB2aXJ0dWFsaXphdGlvbiBvbmx5IGhh
cyBIVyBhY2NlbGVyYXRpb24gZm9yCj4+IElNU0lDIHdoZXJlYXMgdGhlIEFQTElDIE1TSS1tb2Rl
IGlzIHN0aWxsIHRyYXAtbi1lbXVsYXRlZC4KPj4KPj4+IDQuICoqRGV2aWNlIHRyZWUgbm9kZSBk
aWZmZXJlbmNlcyoqOiBIb3cgd291bGQgYSBkZXZpY2UgdHJlZSBub2RlIAo+Pj4gYmFja2VkCj4+
PiBieSBNU0kgaW50ZXJydXB0IGRpZmZlciBmcm9tIGEgZGV2aWNlIGJhY2tlZCBieSBhIHdpcmVk
IGludGVycnVwdD8KPj4gSXQgaXMgZGlmZmVyZW50aWF0ZWQgdXNpbmcgIm1zaS1wYXJlbnQiIGFu
ZCAiaW50ZXJydXB0cyIgRFQgcHJvcGVydHkuCj4+Cj4+IFJlZ2FyZHMsCj4+IEFudXAKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
