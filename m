Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2AD58E79
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iME3UoogjaCgKiuftJ28nmiV/RZv/Y1pFX2jLgG0emA=; b=3Yuy11UjxJPJTs
	9CAu13HVW25DX4U7+Ucu9QzHHELf6AdJj4oCWd7sGGB3PK5Lij14BAQQlA7dtlWu+oLTFdQRZe/6E
	twnkhpa3T4QKKL8SETNtED3Ujsp3a8KkWWILC+h97oQKG36TLNdWYrxEblcpxwo27fp1rJriqbb/b
	/02ZWLi1vwq7Su/bn6cATwa6K423DcSH72YybyfdPFfy+g14pyLj2APYVQALwR+ycuxmmE1BCbj1r
	ixZyH3udRpsROHmYBH3Fk5RIi58fcqwnfHZo1wwrMKzSjGw6G2hlvADadv1bv6utYiTEHwbTYB0TN
	s6l5jXNj4IKSQn5oiAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy9U-0000000CRi1-0UKT;
	Mon, 02 Mar 2026 07:57:16 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy9R-0000000CRhF-0M6l
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 07:57:14 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-463967f35d7so3427992b6e.1
        for <kvm-riscv@lists.infradead.org>; Sun, 01 Mar 2026 23:57:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438232; cv=none;
        d=google.com; s=arc-20240605;
        b=keFIwT0PdQo2C1ekbA75izF/DNu9jOZXYkt2xp4C2Y47VtezYlZwZN5C2S40zuSfpC
         JTW9o7qhsLZMAbWKBa05lBfjk1PnviliP5yRohUi3NHL92llUQbf6Y5QGQIgtrzJnu3h
         xqY6K0UZvvMuV6XWNOm7Dm9hNcrGKI5MZTZTv7zs9k0+Jvf9oTqT8Ra3UL/JvMgoAV00
         77xz4uHg9W3K7/tNmpPkErSB110QFXG9QPzqyxpqEpvi9ZaKTtwDSu8VzQ0gZHMWq160
         ymQXN/gsd32gzIxR/vO8jp/MCKrbOTFNPT38iDSSOVcH1dwN4/95qEz1BpA9vxsncHan
         e2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        fh=Uv6LIOJfNNK4PPM5LTQcJ7upQxlkIzHUsgjMJ6uUQNw=;
        b=I9UUl1R7HcZtX3KY11vuzRi/G23RIyV9aXCWIFkyDFFnm0JZA4e/ybR1xVVf5p3God
         VBPVgJsScA6+txp3WS3q6KmukoPm1qRgDCB0bi2ksBjCQMBmgqZjetQjIXlgCieAHvPa
         Ovoh7nTHqfNly9Jut6hCDcktUlu56SfFqfGbRIDdnlV2c60dDF1UeDzDuom5+vdt2owR
         q/mYIdJ8MMirJx9r2kws7IH9tlvP2l2NvhTQtmBwmKdp3aKag3RYRZDNIG/B4liSLEcP
         B0w6NvdCluhqM6kruHCEtiEVaKV/XF38EsUMzuG5B1HxqKNoipmQVzB/xZo0qey5VHvL
         8yWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772438232; x=1773043032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        b=wehS1ZPsj85pGpmpk7t7OdH5ZhJCOYVbK7pzIcMxhlb6SlLa6dMBviJ+Z9lGQvZr73
         vtAtiXklFPUC5HK27CLnmP3NQam4OTXSOnOWJ7V6oEesW2sXfPoJPTh7640n5iS1TjyN
         +JYeFQTD+lThx+rL3UbAEwMokTl1pNb6M7PjZ6KDvupHWGgmBiPG1Vq/UVuCoVhTv+Nd
         14HrPujDiRetmOxpkk5XaZUQwUnb1UKFroz65v3It8mLGZTD9j3Sjj8F2VXfrRdfE/yX
         JbfZEVzkC0gY4SycLZhLvoDu+tVszDUbZtalJBmHvnlo8zuDoUMptUAeU8yH7FR+YrvN
         6LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438232; x=1773043032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        b=fXnHG9jQ18hl/m6KX+KlDqQDc8gqWQOYBSCPeuFZkgoLO2mBNfM6RANTlzkFksBJmo
         /WyjHPvLqIFyalBchoWOnKkUTvj1p9cs0z5t12exenGm5D0HMuxVD2i3EWtWIARHydw7
         rPB3seSRZG/+a8iUjPsV5AZo7t2LH/KALYRmXvk08qb7FltwdH+KrxfrHM7iI6t/sLVv
         FAePiWFcnT22HPVmsy3Q4xtgjQFAZLFps9ml7ry6ZCLMvUvOt5EEvAvoc2znZ7e6hxjE
         +XolzvM1zeWv3OMFqwqP0cHoGHp1ne33NwGQomT/17yOt/mI3l+RD3AUFr16jjTXyQZ2
         lrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVt4107OrsO5+MmBC+mlycrJmoJi1Dx7plnaNGNXwA8UsvQoPLu5lWvS7aWKHmC+h2FxE8Kes1FdmE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4g9/YBDGDoSt0RiM8lNUIN1v5YY/zB5jVLOB3CxOTkcllTkpG
	h+nKqSUE18MPCeAc43kb9CbIx3sF2QBYnecNxTjKtI6xeFvnSxPpbTTYdSDGg6Xo/A+0hcAdThC
	kvp3foL1N/iykb+ybunFNSr1x8NBMAKZzV90jCyOo/Q==
X-Gm-Gg: ATEYQzwBFX5GZr0M290Knlq2rLcVT1tqZgXUtwviosh41OUdZC+df8dTz1bSuTee9H6
	GrFAJ++nCUmc6cLD1dghWZoQdMBAxEfSc7Z+wpTIIhWfUOuiPeHJZchGFMYMfe6WuiEbG0hwo94
	Kq/u1I7Emrlpc7pcQNvwuxz0jkSQyoDU19j56bTgFL8RTBvGmdYqLubk3D0hSsBWY9xB8Od5FL/
	ksWZXxFMfffyr5Mz3oo28/a0DvV2vU2Uzy/+By6Yh/0g+I997IaiSwo0K9RsNsVFTUR4t5mI4jx
	dW3PPJMQ9OB0nQhABCPGTrsJ+rEL6euLaEOhNDVVhdUqqDPfUfi8hjtuWnjjN35BaQvhgq/2mmV
	zekMlWCtae0L/ZBin4y7KVC7PaOs=
X-Received: by 2002:a05:6820:2083:b0:663:f65:1c92 with SMTP id
 006d021491bc7-679faef9814mr7063277eaf.49.1772438231609; Sun, 01 Mar 2026
 23:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20260224104438.57727-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260224104438.57727-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 13:27:00 +0530
X-Gm-Features: AaiRm50pyr6g5dnPfdIYyaLubJSF_te9LsJuAngs7UB_FiwXT0ux5z9Q5yJiHLM
Message-ID: <CAAhSdy38=Ho1H21AboHyN3AgqskRxqrPfrzP-uJmv80QjBPRrg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_235713_385103_ACAA21F8 
X-CRM114-Status: GOOD (  27.97  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgNDoxNOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEZ1enplciByZXBvcnRzIGEgS0FTQU4gdXNlLWFmdGVy
LWZyZWUgYnVnIHRyaWdnZXJlZCBieSBhIHJhY2UKPiBiZXR3ZWVuIEtWTV9IQVNfREVWSUNFX0FU
VFIgYW5kIEtWTV9TRVRfREVWSUNFX0FUVFIgaW9jdGxzIG9uIHRoZSBBSUEKPiBkZXZpY2UuIFRo
ZSByb290IGNhdXNlIGlzIHRoYXQgYWlhX2hhc19hdHRyKCkgaW52b2tlcwo+IGt2bV9yaXNjdl9h
aWFfYXBsaWNfaGFzX2F0dHIoKSB3aXRob3V0IGhvbGRpbmcgZGV2LT5rdm0tPmxvY2ssIHdoaWxl
Cj4gYSBjb25jdXJyZW50IGFpYV9zZXRfYXR0cigpIG1heSBjYWxsIGFpYV9pbml0KCkgdW5kZXIg
dGhhdCBsb2NrLiBXaGVuCj4gYWlhX2luaXQoKSBmYWlscyBhZnRlciBrdm1fcmlzY3ZfYWlhX2Fw
bGljX2luaXQoKSBoYXMgc3VjY2VlZGVkLCBpdAo+IGNhbGxzIGt2bV9yaXNjdl9haWFfYXBsaWNf
Y2xlYW51cCgpIGluIGl0cyBmYWlsX2NsZWFudXBfaW1zaWNzIHBhdGgsCj4gd2hpY2ggZnJlZXMg
Ym90aCBhcGxpY19zdGF0ZSBhbmQgYXBsaWNfc3RhdGUtPmlycXMuIFRoZSBjb25jdXJyZW50Cj4g
aGFzX2F0dHIgcGF0aCBjYW4gdGhlbiBkZXJlZmVyZW5jZSB0aGUgZnJlZWQgYXBsaWMtPmlycXMg
aW4KPiBhcGxpY19yZWFkX3BlbmRpbmcoKToKPiAgICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNb
aXJxXTsgICAvKiBVQUYgaGVyZSAqLwo+Cj4gS0FTQU4gcmVwb3J0Ogo+ICBCVUc6IEtBU0FOOiBz
bGFiLXVzZS1hZnRlci1mcmVlIGluIGFwbGljX3JlYWRfcGVuZGluZwo+ICAgICAgICAgICAgICBh
cmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzoxMTkgW2lubGluZV0KPiAgQlVHOiBLQVNBTjogc2xh
Yi11c2UtYWZ0ZXItZnJlZSBpbiBhcGxpY19yZWFkX3BlbmRpbmdfd29yZAo+ICAgICAgICAgICAg
ICBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzozNTEgW2lubGluZV0KPiAgQlVHOiBLQVNBTjog
c2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBhcGxpY19tbWlvX3JlYWRfb2Zmc2V0Cj4gICAgICAgICAg
ICAgIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjQwNgo+ICBSZWFkIG9mIHNpemUgOCBhdCBh
ZGRyIGZmNjAwMDAwYmE5NjVkNTggYnkgdGFzayA5NDk4Cj4gIENhbGwgVHJhY2U6Cj4gICBhcGxp
Y19yZWFkX3BlbmRpbmcgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmM6MTE5IFtpbmxpbmVdCj4g
ICBhcGxpY19yZWFkX3BlbmRpbmdfd29yZCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzozNTEg
W2lubGluZV0KPiAgIGFwbGljX21taW9fcmVhZF9vZmZzZXQgYXJjaC9yaXNjdi9rdm0vYWlhX2Fw
bGljLmM6NDA2Cj4gICBrdm1fcmlzY3ZfYWlhX2FwbGljX2hhc19hdHRyIGFyY2gvcmlzY3Yva3Zt
L2FpYV9hcGxpYy5jOjU2Ngo+ICAgYWlhX2hhc19hdHRyIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYzo0NjkKPiAgYWxsb2NhdGVkIGJ5IHRhc2sgOTQ3MzoKPiAgIGt2bV9yaXNjdl9haWFfYXBs
aWNfaW5pdCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzo1ODMKPiAgIGFpYV9pbml0IGFyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzoyNDggW2lubGluZV0KPiAgIGFpYV9zZXRfYXR0ciBhcmNo
L3Jpc2N2L2t2bS9haWFfZGV2aWNlLmM6MzM0Cj4gIGZyZWVkIGJ5IHRhc2sgOTQ3MzoKPiAgIGt2
bV9yaXNjdl9haWFfYXBsaWNfY2xlYW51cCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzo2NDQK
PiAgIGFpYV9pbml0IGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzoyOTIgW2lubGluZV0KPiAg
IGFpYV9zZXRfYXR0ciBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmM6MzM0Cj4KPiBUaGUgcGF0
Y2ggcmVwbGFjZXMgdGhlIGFjdHVhbCBNTUlPIHJlYWQgaW4ga3ZtX3Jpc2N2X2FpYV9hcGxpY19o
YXNfYXR0cigpCj4gd2l0aCBhIG5ldyBhcGxpY19tbWlvX2hhc19vZmZzZXQoKSB0aGF0IG9ubHkg
dmFsaWRhdGVzIHdoZXRoZXIgdGhlIGdpdmVuCj4gb2Zmc2V0IGZhbGxzIHdpdGhpbiBhIGtub3du
IEFQTElDIHJlZ2lvbiwgd2l0aG91dCB0b3VjaGluZyBhbnkKPiBkeW5hbWljYWxseSBhbGxvY2F0
ZWQgc3RhdGUuIFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSBLVk0gQVBJCj4gZG9jdW1lbnRh
dGlvbiBmb3IgS1ZNX0hBU19ERVZJQ0VfQVRUUjoKPiAgICJUZXN0cyB3aGV0aGVyIGEgZGV2aWNl
IHN1cHBvcnRzIGEgcGFydGljdWxhciBhdHRyaWJ1dGUuIEEgc3VjY2Vzc2Z1bAo+ICAgIHJldHVy
biBpbmRpY2F0ZXMgdGhlIGF0dHJpYnV0ZSBpcyBpbXBsZW1lbnRlZC4gSXQgZG9lcyBub3QgbmVj
ZXNzYXJpbHkKPiAgICBpbmRpY2F0ZSB0aGF0IHRoZSBhdHRyaWJ1dGUgY2FuIGJlIHJlYWQgb3Ig
d3JpdHRlbiBpbiB0aGUgZGV2aWNlJ3MKPiAgICBjdXJyZW50IHN0YXRlLiIKClRoaXMgaXMgbm90
IGEgaGFyZCByZXF1aXJlbWVudC4KCj4gVGhlIHVwcGVyIGJvdW5kcyBvZiBlYWNoIHJlZ2lvbiBh
cmUgdGFrZW4gZGlyZWN0bHkgZnJvbSB0aGUKPiBSSVNDLVYgQUlBIHNwZWNpZmljYXRpb24sIHNv
IHRoZSBjaGVjayBpcyBpbmRlcGVuZGVudCBvZiB0aGUgcnVudGltZQo+IHZhbHVlcyBvZiBucl9p
cnFzIGFuZCBucl93b3Jkcy4KPgo+IFRoaXMgcGF0Y2ggYm90aCBmaXhlcyB0aGUgdXNlLWFmdGVy
LWZyZWUgYW5kIG1ha2VzIHRoZSBoYXNfYXR0cgo+IGltcGxlbWVudGF0aW9uIHNlbWFudGljYWxs
eSBjb3JyZWN0Lgo+Cj4gRml4ZXM6IDI4OWEwMDdiOThiMDZkICgiUklTQy1WOiBLVk06IEV4cG9z
ZSBBUExJQyByZWdpc3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2t2bS9haWFfYXBsaWMuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFf
YXBsaWMuYwo+IGluZGV4IGY1OWQxYzBjOGM0M2EuLjVlN2ExMDU1YjJkZTYgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFf
YXBsaWMuYwo+IEBAIC01MjcsNiArNTI3LDMxIEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX2lvX2Rldmlj
ZV9vcHMgYXBsaWNfaW9kb2V2X29wcyA9IHsKPiAgICAgICAgIC53cml0ZSA9IGFwbGljX21taW9f
d3JpdGUsCj4gIH07Cj4KPiArc3RhdGljIGludCBhcGxpY19tbWlvX2hhc19vZmZzZXQoc3RydWN0
IGt2bSAqa3ZtLCBncGFfdCBvZmYpCj4gK3sKPiArICAgICAgIGlmICgob2ZmICYgMHgzKSAhPSAw
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICsgICAgICAgaWYg
KChvZmYgPT0gQVBMSUNfRE9NQUlOQ0ZHKSB8fAo+ICsgICAgICAgICAgICAgICAob2ZmID49IEFQ
TElDX1NPVVJDRUNGR19CQVNFICYmIG9mZiA8IChBUExJQ19TT1VSQ0VDRkdfQkFTRSArIDEwMjMg
KiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19TRVRJUF9CQVNFICYmIG9m
ZiA8IChBUExJQ19TRVRJUF9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9m
ZiA9PSBBUExJQ19TRVRJUE5VTSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19D
TFJJUF9CQVNFICYmIG9mZiA8IChBUExJQ19DTFJJUF9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAg
ICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19DTFJJUE5VTSkgfHwKPiArICAgICAgICAgICAgICAg
KG9mZiA+PSBBUExJQ19TRVRJRV9CQVNFICYmIG9mZiA8IChBUExJQ19TRVRJRV9CQVNFICsgMzIg
KiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJRU5VTSkgfHwKPiAr
ICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19DTFJJRV9CQVNFICYmIG9mZiA8IChBUExJQ19D
TFJJRV9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19D
TFJJRU5VTSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJUE5VTV9MRSkg
fHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJUE5VTV9CRSkgfHwKPiArICAg
ICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19HRU5NU0kpIHx8Cj4gKyAgICAgICAgICAgICAgIChv
ZmYgPj0gQVBMSUNfVEFSR0VUX0JBU0UgJiYgb2ZmIDwgKEFQTElDX1RBUkdFVF9CQVNFICsgMTIw
MyAqIDQpKQo+ICsgICAgICAgKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gK30KPiArCgpUaGlzIGlz
IGNoYW5naW5nIHRoZSBmdW5jdGlvbmFsIGJlaGF2aW9yIG9mIEtWTV9IQVNfREVWSUNFX0FUVFIK
Zm9yIEFQTElDIGJlY2F1c2Ugbm93IEtWTV9IQVNfREVWSUNFX0FUVFIgd2lsbCByZXR1cm4gMCBl
dmVuCmZvciBub24tZXhpc3RlbnQgQVBMSUMgcmVnaXN0ZXJzLgoKSW5zdGVhZCwgdGhlIGNvcnJl
Y3QgZml4IGlzIHRvIGp1c3QgdGFrZSBkZXYtPmt2bS0+bG9jayBpbiBhaWFfaGFzX2F0dHIoKQpq
dXN0IGxpa2UgYWlhX2dldF9hdHRyKCkgYW5kIGFpYV9wdXRfYXR0cigpLgoKPiAgaW50IGt2bV9y
aXNjdl9haWFfYXBsaWNfc2V0X2F0dHIoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHR5
cGUsIHUzMiB2KQo+ICB7Cj4gICAgICAgICBpbnQgcmM7Cj4gQEAgLTU1OCwxMiArNTgzLDExIEBA
IGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2dldF9hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWdu
ZWQgbG9uZyB0eXBlLCB1MzIgKnYpCj4gIGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2hhc19hdHRy
KHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlKQo+ICB7Cj4gICAgICAgICBpbnQg
cmM7Cj4gLSAgICAgICB1MzIgdmFsOwo+Cj4gICAgICAgICBpZiAoIWt2bS0+YXJjaC5haWEuYXBs
aWNfc3RhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+Cj4gLSAgICAgICBy
YyA9IGFwbGljX21taW9fcmVhZF9vZmZzZXQoa3ZtLCB0eXBlLCAmdmFsKTsKPiArICAgICAgIHJj
ID0gYXBsaWNfbW1pb19oYXNfb2Zmc2V0KGt2bSwgdHlwZSk7Cj4gICAgICAgICBpZiAocmMpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByYzsKPgo+IC0tCj4gMi4zNC4xCj4KClJlZ2FyZHMsCkFu
dXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
