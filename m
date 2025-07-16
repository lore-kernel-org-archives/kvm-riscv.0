Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16028C83F27
	for <kvm-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 05:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGHG5UARTPvtMcEY7t0vf6kGp5iIXHzqO9vFA5ml7cA=; b=aljshiY5XIURUv
	idFK3v/2lPOEWD7RGYCCG820I72ONYAm53nSrx3IJc5dBTCnQ2YIg5MGxCCAEPQaAvjUah8YUMy2x
	6eJ3lgHtHipS2kk6jl4YPnqHz7yM2hro92FlHrjcBHAXZ+nWQm3IOfTStr/vtffQnZlbj3OdBSBqw
	m1p/RiEGXoK95NqL6dbp6bNk2I8f4yafZhgvrsHcvnzbXcY/3gzHxnDD8QdvogvsJAW4haRRxVc7G
	rvRmI/t6OQK/ovB1mikyKuO2ijv4kMZUxVSPLc4IvFXTggAKKmw9aEqYs4AV1rRyesdqMEzTwF1oX
	UwNZILpuJUsVQButChQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubukk-00000006nXg-2IRD;
	Wed, 16 Jul 2025 05:32:26 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuYz-00000006mbQ-2uj6
	for kvm-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 05:20:19 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3de1875bf9dso46871245ab.2
        for <kvm-riscv@lists.infradead.org>; Tue, 15 Jul 2025 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752643217; x=1753248017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pr0CgkuBDoCBojEhq3SOwjdkjudDtqxy7ZuiK0Se4o=;
        b=dZtZyP+OlnQeN53F4SIpc+if3dVoo8/6qY38dbX3ONt1+ODwsUsoDXFlVFq7gjFnse
         3NdL8fGKkQiAIyasF1k+FVYa/GP+8JfXScXXW6ETQIWh3AbwCeyvEln4Kf6ESggbq88n
         8XFmFH1zibgmmTrUW0QhFj07VQz3H8X95P/cnxQVPq09rIXL3MpNno1pVSuR4OGbp+kT
         9BfTaIzBgKneUl+u1opbtYVixFaWdkPDOMfsMf2pmyNbbdplGlDNg4+0gkW36CKYDxds
         QKhojbt5yZbIgFaKTgDoC6e6jGz9DDDA+S/mcYTJitVxva/CeT/E9yo2vu9HvfHeB9yE
         F5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752643217; x=1753248017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pr0CgkuBDoCBojEhq3SOwjdkjudDtqxy7ZuiK0Se4o=;
        b=QHHpe2Ej5vC+d/RWy9w7DpfTaE9jw93J3QJtwh4YlPFt/L5OqziYjJbksNkwp4rEIl
         a448NFWz6RxJF2d5Lmzz625xCxXn/sirLVDYHirI/DaWz0d5oUy+2oFMACklR+TSvT6Z
         HNj8NmMGRJW9rG3gwUd7+fGAN11a79tYQ0FyUOyLwgt5lzBEfgDcAnGHqv5fImM14Oug
         rYQwnNIdBw1GqC6XoDvdRHPoYT7v0S0sazt0ey5ejnQJi1YHDEMPRNaaPxNg5Qn3mblM
         f6qjwgSLC29MPcrgRXZsE8lpnGRsvtLN8LNUhy6DWfxy8EU0G8W0Ufu2C6/MdJ3bpfwS
         NzaA==
X-Forwarded-Encrypted: i=1; AJvYcCVJWf5pAXugvhEA04Jsniot2QRUw/+VHvwsaOqCKQ29fcHrnT1IJ++8N/v21TEf/jkLfeDxZkLmJLs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyW7ugIDghK5VwcyKqvU8kdNmsx0345QBDlsSeQeBL5Rgev0X3h
	FDb1X8sXRQScQt2bqwNuYBbSNdsT/g2SbPk4JV9ObsUZC6MbuUvKaqrrkXLwdBeNaX1FBTC1Pls
	ZP5anHC//yUUccki9dzHmP5fCogjBLa+VYuPnRc3Rxw==
X-Gm-Gg: ASbGncscLY1Cae4bK14caZsoOGsY4Fs4nJqsJtwl4YwbnCIBTMdT7/dZPsUSxtCb1Hd
	dJ1BxOwAVQ1GfW00tsec0ZKlwM/Ra4bPy4Ib2czZ1eEJl9/KXM28kiFQ1lWaVI95xG0jlhl7Ddy
	7vLIl6VgY4++L2sYjNd2CQyvUk0PIMKj22OZcBgwJVYIiv11OFVcySIZqK+2dGLrieYcuJYNiDH
	w2uioc0daNx0GUD
X-Google-Smtp-Source: AGHT+IG8QMvIrF4Nh6TtjPYY/OImrdrVsXWR40Aodp+LssWG0nbwGxcm5vyJpoaN8ajvyQHU4KVCDRQEYdjX4PMmHto=
X-Received: by 2002:a05:6e02:1c07:b0:3df:29c5:2972 with SMTP id
 e9e14a558f8ab-3e282da9cd2mr14405455ab.9.1752643216752; Tue, 15 Jul 2025
 22:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250714094554.89151-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250714094554.89151-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Jul 2025 10:50:05 +0530
X-Gm-Features: Ac12FXys72h69btMJ897A7pa9H69kTczP7dldA--hcTTkswEbCjKDSzqpxxAxFs
Message-ID: <CAAhSdy2XEyphi5K1xk29JXY991aie0LA5YF2zRbgA_8imSjXQQ@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: KVM: Delegate illegal instruction fault to VS mode
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: rkrcmar@ventanamicro.com, cleger@rivosinc.com, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_222017_969414_4F7C1F50 
X-CRM114-Status: GOOD (  14.24  )
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

T24gTW9uLCBKdWwgMTQsIDIwMjUgYXQgMzoxNuKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
dG8gVlMgbW9kZSBieSBkZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPiBleGNlcHRpb25zIGJlaW5nIHRy
YXBwZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPgo+IFRoZSBkZWxlZ2F0aW9u
IG9mIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgaXMgcGFydGljdWxhcmx5IGltcG9ydGFudAo+
IHRvIGd1ZXN0IGFwcGxpY2F0aW9ucyB0aGF0IHVzZSB2ZWN0b3IgaW5zdHJ1Y3Rpb25zIGZyZXF1
ZW50bHkuIEluIHN1Y2gKPiBjYXNlcywgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB3aWxs
IGJlIHJhaXNlZCB3aGVuIGd1ZXN0IHVzZXIgdGhyZWFkCj4gdXNlcyB2ZWN0b3IgaW5zdHJ1Y3Rp
b24gdGhlIGZpcnN0IHRpbWUgYW5kIHRoZW4gZ3Vlc3Qga2VybmVsIHdpbGwgZW5hYmxlCj4gdXNl
ciB0aHJlYWQgdG8gZXhlY3V0ZSBmb2xsb3dpbmcgdmVjdG9yIGluc3RydWN0aW9ucy4KPgo+IFRo
ZSBmdyBwbXUgZXZlbnQgY291bnRlciByZW1haW5zIHVuZGVsZXRlZCBzbyB0aGF0IGd1ZXN0IGNh
biBzdGlsbCBxdWVyeQo+IGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXZlbnRzIHZpYSBzYmkgY2FsbC4g
R3Vlc3Qgd2lsbCBvbmx5IHNlZSB6ZXJvIGNvdW50Cj4gb24gaWxsZWdhbCBpbnN0cnVjdGlvbiBm
YXVsdHMgYW5kIGtub3cgJ2Zpcm13YXJlJyBoYXMgZGVsZWdhdGVkIGl0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBm
b3IgTGludXgtNi4xNwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggODVjZmViYzMyZTRjZi4uM2Y2Yjky
NzBmMzY2YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtNDQsNiArNDQs
NyBAQAo+ICAjZGVmaW5lIEtWTV9SRVFfU1RFQUxfVVBEQVRFICAgICAgICAgICBLVk1fQVJDSF9S
RVEoNikKPgo+ICAjZGVmaW5lIEtWTV9IRURFTEVHX0RFRkFVTFQgICAgICAgICAgICAoQklUKEVY
Q19JTlNUX01JU0FMSUdORUQpIHwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQklUKEVYQ19JTlNUX0lMTEVHQUwpICAgICB8IFwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfQlJFQUtQT0lOVCkgICAgICB8IFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChFWENfU1lTQ0FMTCkg
ICAgICAgICB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VChFWENfSU5TVF9QQUdFX0ZBVUxUKSB8IFwKPiAtLQo+IDIuMjAuMQo+CgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
