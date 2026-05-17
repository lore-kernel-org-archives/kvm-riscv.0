Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BFECD4F47
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wLJX1QC8wojD7zFejpF8Sj8+T7eEyxYVgjybuEXZvI=; b=LeKLD7VEdPvJlx
	yU1BdMIiWcRvPcY86rLol1z5Ffi/zpZNKkVWsoNMry+CQL9pbaBMtmltGHTicaEy9sZVM0YbQz0TN
	EjPSWdkfwHB2zroabWTobmU6tV69MffCZHFTP4+rORDJl39L9n4Y59pgUlHXoKlgEchVNEeRODQet
	1VSQzlqMotZ+cMBp5pBQWhlC8ax9yGJhb+GhN5uDwBuqLfbOAOVNpQDFvoWX4XBxkaNfQk/5hAMhY
	yJrRP2BLh1RuS9/zJUbKdwfiThCA74t7ajyyiMwUBWbp1GMhv7pCaOf4xKNNpVoKsJV2dwM8edmSH
	PYovHxbxX42kB2RwX0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdc5-0000000CxAi-2C6y;
	Sun, 17 May 2026 15:41:09 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdc3-0000000Cx9e-07PW
	for kvm-riscv@lists.infradead.org;
	Sun, 17 May 2026 15:41:08 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-691de293326so755457eaf.3
        for <kvm-riscv@lists.infradead.org>; Sun, 17 May 2026 08:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032465; cv=none;
        d=google.com; s=arc-20240605;
        b=JbVoZR3MnB+h1uGy68yOvC1NiF/WOg8G8BgM+pnkJUuVq0ByeqOyCMrI1NuZEIohUe
         +1TS6W7iOJYjanb8X7dThJYZ4qYv2ZwIRi4ONjyXwbXkS9BPwrzC8kCZzSFMYS1Eozn2
         2rHPbswVT4Q9Q7Hv1tIz/ztFJwFesdz5O2vFS3K2Gk2kBO4Ct51sAF77XudWI2UtcLxw
         TZd+wN9D4whzsmyd9Twe31AH7q291c71eBGpsbDrUZV++TOVxC7sqMmJZAhgvuRKEfaF
         ivzfFzk7GyhQZr23jIJQTPSaWSYIbYiwDnppGcTXOPH10jhXbIyfLFoBhlAG65i5uyBM
         U8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        fh=rbuEIzsYIr6/Ci4u+weYs2vcyXyAM8lWXjs5fQIK+YQ=;
        b=SNSv3sMNlfUVF7syjJAg7BOORtiG/uf6n0R19R6B1LdLuEULOJaqVAW4aLexOo9EVy
         r/xHJCqXuKcyAFfr+UCqk1JZ/To+R1D3emVtlZ3gXs8DT65/yKDvthABZowFn4jgBBiM
         fNNCsIZ4Wvkpu/+K9nXSua0mpj/v7GAU0HtrLAJ/v5+Uz5VlOsDHNTmfqqV8rF4SeUi9
         CNH0Q5FXvDyK0NkcuYkQ6vZ4y2pCXBBrMh2nW615nb+FEv9iybEoAzJ+XDRYBvLADp/n
         /w2/OqIeHXwibjFP/c5pzYE5ljCryLDIsUib816kmQxTI0norhOyTaKuyosPKuJHpkcj
         tw5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779032465; x=1779637265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        b=CRpBjWSNkosvytExgircEqqw8IN66xvhnP/XCxwDxqWaydqHMQ/QsUV5gpr9Xb8Ay6
         FNX8GYLSkUwUqhgGwBAexSnjRZz5yHbRm0HKcdlVTbzGN1wjRCSRpMd9R+I34Hs/7SSZ
         +Ake0zMzITLLA8aBRq6scLFC0/GBPX4axLqL3OKV8QaHJZsFyH9Gpd150yyFSq3FDGwZ
         4V+ocsBKvLj+TvKLJHjczv4fpxDbm6ydYq06dNG2WPe+c3AF5t4D2v636xyarWYPP1Jh
         yLyCzSH0EN85QRGMv89lD8BvFwgyZ9lk18dpqE8mEDBcgha7Vm5Q4Qu1svc5Q+0hs7Oa
         Icyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032465; x=1779637265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0PlNFCE2Ddf3BbVrhfMNR8SsVsSBHNtjC+3F7OAG5Y=;
        b=ne5YL+U8bFEn8B0UWxlCBq4A06ukydtMYFuYwHsPfT1a5w1COaLjHU2eqSRxb3aV7V
         lmOJuoJ+ieskJF6QY1TM9AsqtvGGUl5aHl3dUuHhRZyeI++ANppIVADaPz0W5WrvGqy1
         lWbJqvbYSCbAHiklHmT8ho64z4oL8Xo33sywrZp9306LP/exw22aEJodIAKFNy9wHJJx
         CHOVfG/hskwHszGARUuilA/OZL+Lx2OsgIZoNSuRhlIxQm2tEgNSdeotvrOEAJPRJGoX
         bOuUkLGbNyNIH/pQo9XfVB2OJ47KK8o9Fw3dUV4aqlimy7oKrnbF0tZnwmubzoqFV0xn
         MXjw==
X-Gm-Message-State: AOJu0YzNapoUUSDdbXvBGfnvSWKfd9oId8pmNjbXRebgaBX1cR2JoAwZ
	etB9oeM/Tat9SfRL/1pvQ1EyObfoSt1UDxEnHQqj7QskAOm3GSdjTaAHQ7iWb/HOHVuWgggJEWn
	KvWlk/a2R5e8W1BhIsbvhUmPJlZL1NcA47/PZr6TePg==
X-Gm-Gg: Acq92OFEisqMqsQwZm51/oKhPyxGKby9zth1Eyzte2osD1pblvhet5LKzwcziPibk+F
	ScpqIzVbJgElq2fmSDDOXE8IrLoqpvaDKCwjuPIaO22jdS7w6CJjFCrvt4XsdQ1WWV6fPaF1D+y
	7uSbI32voJyMG1nqYKxW6E4/Uq870+68mXvoNv9/n3vn7GB+VlO9kXoAaJAHRd/2WhS36bE7xhY
	ZTruxSEQIbKzef/Nwbv4F5AR+i1M05wWhe+BfzMtzXegXy5DiXXOUCnByn76O2Ll3Ze+kNMrOnj
	apnvBgy0hDPHn4K+sIxd/1czPYwHnlrxKAvK07sHQfgGlWQUvB9fdfYfcEn7dP9o06gZtO6du+d
	mJKLyvh5uNYe4pcJNgjvWz1h4WdqFDq9ZlArs
X-Received: by 2002:a05:6820:1b05:b0:696:2674:8a18 with SMTP id
 006d021491bc7-69c943688ffmr7938889eaf.35.1779032464846; Sun, 17 May 2026
 08:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260517124414.420919-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260517124414.420919-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 17 May 2026 21:10:53 +0530
X-Gm-Features: AVHnY4LJK5mceV0jtKoEXm7BnXz6dh6qkKEbPTaVu6WNg2Byna91HbXT0gIv9pg
Message-ID: <CAAhSdy3JTPZACJyKTCVsQeiDf+shPn9qnn2eLa=7Yr+73HjqeQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1
 SEND_IPI handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_084107_135920_73AC5507 
X-CRM114-Status: GOOD (  17.99  )
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

T24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgNjoxNOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTQkkgdjAuMSBTRU5EX0lQSSBoYW5kbGVyIGl0
ZXJhdGVzIG92ZXIgdGhlIGhhcnQgbWFzayBhbmQgY2FsbHMKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQo
KSB0byBmaW5kIHRoZSB0YXJnZXQgdmNwdSBmb3IgZWFjaCBzZXQgYml0LiBXaGVuIGEKPiBndWVz
dCBwcm92aWRlcyBhIGhhcnQgbWFzayBjb250YWluaW5nIGJpdHMgZm9yIG5vbi1leGlzdGVudCB2
Y3B1X2lkcywKPiBrdm1fZ2V0X3ZjcHVfYnlfaWQoKSByZXR1cm5zIE5VTEwsIHdoaWNoIGlzIHRo
ZW4gdW5jb25kaXRpb25hbGx5Cj4gZGVyZWZlcmVuY2VkIGJ5IGt2bV9yaXNjdl92Y3B1X3NldF9p
bnRlcnJ1cHQoKSwgY2F1c2luZyBhIGtlcm5lbCBjcmFzaC4KPgo+IEZpeCB0aGlzIGJ5IGFkZGlu
ZyBhIE5VTEwgY2hlY2sgYmVmb3JlIGRlcmVmZXJlbmNpbmcgdGhlIHJldHVybiB2YWx1ZS4KPiBJ
ZiB0aGUgdGFyZ2V0IHZjcHUgaXMgbm90IGZvdW5kLCBza2lwIGl0IGFuZCBjb250aW51ZSBwcm9j
ZXNzaW5nIHRoZQo+IHJlbWFpbmluZyB2YWxpZCBoYXJ0cy4KPgo+IEZpeGVzOiBhMDQ2YzJkODU3
OGMgKCJSSVNDLVY6IEtWTTogUmVvcmdhbml6ZSBTQkkgY29kZSBieSBtb3ZpbmcgU0JJIHYwLjEg
dG8gaXRzIG93biBmaWxlIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51
dEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNj
YXMuYWMuY24+Cj4gQXNzaXN0ZWQtYnk6IE9wZW5DbGF3OkRlZXBTZWVrLVYzLjIKCkxHVE0uCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlz
IGFzIGZpeCBmb3IgTGludXgtNy4xLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IFYxIC0+IFYy
Ogo+IC0gQ2hhbmdlZCBicmVhayB0byBjb250aW51ZSB3aGVuIHZjcHUgaXMgbm90IGZvdW5kLCBh
cyBzdWdnZXN0ZWQgYnkKPiAgIEFudXAgUGF0ZWwuIE5vbi1leGlzdGVudCBWQ1BVcyBpbiB0aGUg
aGFydCBtYXNrIHNob3VsZCBiZSBpZ25vcmVkCj4gICByYXRoZXIgdGhhbiBhYm9ydGluZyB0aGUg
ZW50aXJlIFNFTkRfSVBJIG9wZXJhdGlvbi4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfdjAxLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV92MDEuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3YwMS5jCj4gaW5kZXggMTg4ZDVlYTViM2I4NS4uYzljMzIzZDQ1NzdhOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV92MDEuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX3YwMS5jCj4gQEAgLTU1LDYgKzU1LDggQEAgc3RhdGljIGludCBrdm1f
c2JpX2V4dF92MDFfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVu
ICpydW4sCj4KPiAgICAgICAgICAgICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmaG1hc2ssIEJJ
VFNfUEVSX0xPTkcpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBydmNwdSA9IGt2bV9nZXRf
dmNwdV9ieV9pZCh2Y3B1LT5rdm0sIGkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
cnZjcHUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9zZXRfaW50ZXJydXB0KHJ2
Y3B1LCBJUlFfVlNfU09GVCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDAp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAtLQo+IDIuMzQuMQo+
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
