Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C15C83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOJZ8LrMllYOHl+ZWOfCwEWdycE9k9TaCtV1ngV4Az4=; b=SIe75hyWH4YIuS
	JH53FmarK9BYWUDveumfQXJVJ6Kby5fY09oYqOdzBCe3cIRyRu8s8NdBMJGGls0gNXbMo5hk0VlI3
	6uL5yueXc84iBU3gJS6RdQYuCIR8gTXjd9ibygJFeu3VXz3lacwi43FV0E9iASGrmAa9hor332q5d
	kBWgNthbLmpoLtLYWfktpklW7gVVJ2gdL2Z9hvHrstv8Njgbt5BKo7jlLmC27ng3GDKVdW5dPX4of
	ZF58LYlcEVzsAd/fE8FJcvHBC/Kz7PEflKKcZwDvez96txW18zGHauPkkE0GlPt8swXdU1oQx7zXq
	uyg3ItfC0H+5plIV+m1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRBt-0000000F2zz-0mWp;
	Mon, 28 Jul 2025 16:59:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQ9X-0000000EtP3-3qEz
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 15:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753717959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ajKmblQIi5n8fN4LrMcXTNw8c+8khNFBixAeFhjQpQ=;
	b=VieE1jojrFKZ9sab6yuyfqY1hdhilX32+zZDsFHryJQ4dUzOSo0EivnLRndqgYYsQTnWCu
	/lHaGvxIkJbcMGxM3el4N5nOtC4ypgZMWEzh2DlbDg2ydcvja5JygR/4rwf1SOmNTEMcnC
	gUNzDzd1d6Gn0FHSXphieJkvsKjMGfY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-KlthU0kCMJO7TdRsijg5Hg-1; Mon, 28 Jul 2025 11:52:37 -0400
X-MC-Unique: KlthU0kCMJO7TdRsijg5Hg-1
X-Mimecast-MFC-AGG-ID: KlthU0kCMJO7TdRsijg5Hg_1753717956
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4538f375e86so35348025e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717956; x=1754322756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ajKmblQIi5n8fN4LrMcXTNw8c+8khNFBixAeFhjQpQ=;
        b=uebMgG+k9yiQKZM4vzULBeze7r5hG13dfQ6NIQFISUJMY6S4oVJBLya0DScTVD3Fr/
         usJsQwrW133MXeaPHq0zMczlntu8AChPXPU9kNrC7OuuI4BJqHGYxvbmVKc3+DenCtlK
         gm2D6aWsWMFtvib1Eq5p0tXfPrQIoOFayN8QQKQuyXK8+LcP+v6/HyTWSsWOF15QKhaP
         6JfanQz8Q5X3TDbcdJ7+D8oe/3aHBSn/taWHQaO0WbXq0kGE22vPI1ruD4R2mkzrS1gw
         LgB/ag1LJ+oZYEl8e7PUeZnAHzmhwHz6KsP+O21I81gIaW9OkEfoMF9o1sRRWp3tXtOM
         QtsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWYHA+NXrI4ejGQbkUiNyIoneXBjnSruCFiHTehbeqMJ0po2lF8ODne8i1kcR+DkXLWBWlQKPHXEA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/79+b0fctYTaR3fJtU4JOjNsTnP4P9U140o132p0Fi//uDPU0
	3zLHvUsjUmmPRwINhFzisZugqqCud+yITUWNM6I2MIYibYW5ecphK3KFcJCeB3+ffuWnIVKKUpA
	ZahQtdPJ10HIRy3Qcg7EKdAL7L1Q1moBm6LKl+xz74hxNtC3/Z1JLCWRbJ7WuT6BUWmiIUZK3lD
	KGLjNkBFFsNYMiV6e2Ttsqc8DLD4t7B2RszwyfYpBlyw==
X-Gm-Gg: ASbGnctGF/Uxbrnd7gw7Xu7rQtx3fL25hFidCuhvyIxHi5vIYpZvU9MFk8m/xUQhlrD
	kCNGgnUghEZx3LbM/mz4AF80Kunp4LcRt5XQ+c3SHHYbr9IeBAGhRjNZaOZ+VHax/uITcovG0x6
	cH2ki/L/CNMuahkr1VfMa7xQ==
X-Received: by 2002:a05:6000:2209:b0:3a5:8cc2:10aa with SMTP id ffacd0b85a97d-3b7766451f7mr9100330f8f.32.1753717956143;
        Mon, 28 Jul 2025 08:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBGFp3+itaFUNpRqfJjDUWaUPScb2LyQwR7RlmJb+Ax1zLGpuUzLHHmfb1XxwBmd1C4N3RQSHmM2SZxD9pqC8=
X-Received: by 2002:a05:6000:2209:b0:3a5:8cc2:10aa with SMTP id
 ffacd0b85a97d-3b7766451f7mr9100313f8f.32.1753717955778; Mon, 28 Jul 2025
 08:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
In-Reply-To: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Jul 2025 17:52:24 +0200
X-Gm-Features: Ac12FXxyIBqr6aXH6QdzF7T94hnE0BS5b_WVUACGolEDHfPEEz9xXJvF5CEiaCI
Message-ID: <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tY429-lEPtKlTOeTScwZbA_jcQMBCxswJiYhcxyLH-s_1753717956
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_085240_020713_A84EF9C9 
X-CRM114-Status: GOOD (  10.40  )
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

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMjowNuKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+ICAgICAgIFJJU0MtVjogcGVyZi9rdm06IEFkZCByZXBvcnRpbmcg
b2YgaW50ZXJydXB0IGV2ZW50cwoKU29tZXRoaW5nIGhlcmUgYXRlIFF1YW4gWmhvdSdzIFNpZ25l
ZC1vZmYtYnkgbGluZSwgd2hpY2ggaXMgcHJlc2VudCBhdApodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzk2OTMxMzJkZjRkMGY4NTdiOGJlM2E3NTc1MGMzNmI0MDIxM2ZjYzAuMTcyNjIxMTYzMi5n
aXQuemhvdXF1YW5AaXNjYXMuYWMuY24KYnV0IG5vdCBpbiB5b3VyIGJyYW5jaC4KClBhb2xvCgo+
ICAgICAgIFJJU0MtVjogS1ZNOiBVc2UgZmluZF92bWFfaW50ZXJzZWN0aW9uKCkgdG8gc2VhcmNo
IGZvciBpbnRlcnNlY3RpbmcgVk1Bcwo+ICAgICAgIFJJU0MtVjogS1ZNOiBBdm9pZCByZS1hY3F1
aXJpbmcgbWVtc2xvdCBpbiBrdm1fcmlzY3ZfZ3N0YWdlX21hcCgpCj4KPiBTYW11ZWwgSG9sbGFu
ZCAoMik6Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBpbmNsdXNpb24gb2YgU21ucG0gaW4gdGhl
IGd1ZXN0IElTQSBiaXRtYXAKPiAgICAgICBSSVNDLVY6IEtWTTogQWRkIHN1cHBvcnQgZm9yIFNC
SV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTgo+Cj4gWHUgTHUgKDEpOgo+ICAgICAgIFJJU0Mt
VjogS1ZNOiBEZWxlZ2F0ZSBpbGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0IHRvIFZTIG1vZGUKPgo+
ICBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgICAgICAgICAgICAgICAgICB8ICAg
MiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCAgICAgICAg
ICAgICAgICB8ICA3MiArKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAg
ICAgICAgICAgICAgICAgfCAxMDkgKy0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
bW11LmggICAgICAgICAgICAgICAgICAgfCAgMjEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV90bGIuaCAgICAgICAgICAgICAgICAgICB8ICA4NCArKysrCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggICAgICAgICAgICAgIHwgIDEzICsKPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oICAgICAgICAgfCAgMzMgKysKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1pZC5oICAgICAgICAgICAgICAgICAgfCAgMjcgKysK
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgICAgICAgfCAg
IDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICsKPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDYgKy0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTIgKy0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAzMzggKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNj
di9rdm0vbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KPiAgYXJj
aC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1MDkgKysr
KystLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMTEwICsrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQ4ICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
ZXhpdC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIwICstCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDg0ICsrLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTMgKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICAgICAgICAgICAgICAgICAgIHwgMzM4
ICsrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyAgICAg
ICAgICAgICAgICAgIHwgIDE3ICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jICAg
ICAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Yw
MS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDI1ICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZtLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZtaWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI1ICsKPiAgdG9vbHMvcGVy
Zi9hcmNoL3Jpc2N2L3V0aWwva3ZtLXN0YXQuYyAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgdG9v
bHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5cGVzLmggfCAgMzUgLS0K
PiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfdHJhcF90eXBlcy5oICAgICAgfCAg
NTcgKysrCj4gIDMxIGZpbGVzIGNoYW5nZWQsIDEzODIgaW5zZXJ0aW9ucygrKSwgNjgyIGRlbGV0
aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
Z3N0YWdlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X21tdS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV90
bGIuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9zYmlfZndmdC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92bWlkLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5j
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL3Jpc2N2X2V4Y2Vw
dGlvbl90eXBlcy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3Yv
dXRpbC9yaXNjdl90cmFwX3R5cGVzLmgKPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
