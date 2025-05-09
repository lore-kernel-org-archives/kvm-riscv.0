Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B13C3ABBC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 05:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6S0t/fX3hoLLSSY6ECAsnHeumM3KunLm2rx8E9CH8A=; b=bZPLEYh73dYvzp
	6Oy4IcEnejqj16kegBJjt94fYqunxdBuS8e0zTePXItJU0cPi8/6IcEMhxVzqhp4LdtYFvVLV0ixK
	D/+OKWRXwKjFPr4p5EeEtXIRckPzWhgjGgYDkE/Uc7jtZuCUS/Ubv7wO/FWzR6W/Mc1qZzwBNKvs3
	aVG86xlkx+ls8X1BRi5xbaRruzGgKC1C2Usu5+9hqY58EmN5MfDekzbaACdw46sOlzpbtE6Vh+vUM
	UW17OB7s9QxgC302ErHUQhZG+Rd2FChEXQLEmQveFeV7U/RZi/KYcHepVctwHqePhdGYQq10Gy8vI
	cARoTfMsp/vVUBgAiCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG3M-00000002V2T-1gZ7;
	Fri, 09 May 2025 05:13:44 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG3K-00000002V1Z-1OdZ
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 05:13:43 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30ddad694c1so18397631fa.2
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746767620; x=1747372420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=JtRxTRIaJRe7/82G/Fou87lRBRdbGdq3pHX3kgTn6qBlYiioVUD8fXKrPm4JkxXD9S
         PhKjptS6DYXXLPAhfJ30c0naF57BFuhEk2tArY8FXfdN1DwoF3aZGGLLg+P/PGDFZT1I
         RvRtBI6qGfZBX4u5XSXF2dLt3C9T++qUzQs9bAjw+i4bJQ8fGJIFKzcthv4fuvo3jw1s
         gWXZzSBZuJut9C4DRNj1cI7ByzCB8ziYuv7UIpewP8T/kBGNOxkmV7edNsaRHD27g4fr
         KkkSLnlmOZznGKGJFXvdWyOwaGq/U1Qp9mjkE/IHUW2WI5JzoAbu5swcsV3J6F/CTt9S
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767620; x=1747372420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=Qpj+ihV8vZEiPPukMcO9f5hlb6WtBTBKwGJvFOACPnSKnp6EHgxTSyVwh76OIlBh1w
         aJp39oGRQWR9dyK/OrGFkfnD5FPw1D55erKfJIzxlm3hDTFJior28aDZ9mDz41wZjOKv
         L0IsDjtlKA0kGt+Ta4/nFvrgpBlx6QIWLDJwmEmcXnDg8TQR8u+IIpVdp8KcK2BfEfVy
         fHqyhr9tlyb84Tcxch8x3zXsdkFnk8Q+HbWAryraF/QiR0uoq1c1Nua0thEg9fbneTh/
         SQKS6EBrz7wwVZIbj2Xk6EHwzpZukG1JQWIszYUrwkOuHEI5OSezwdFTp6NHgDKBJkn8
         WtgQ==
X-Gm-Message-State: AOJu0YyW4xWciqy4wn/+nyD23aVtnwkppV+fSmeCqTn3MonB2h5Ivb1y
	3VsMPwSx7psLsMYYPc3iKpHdtNZKXQcjOSY8P438sycaBevuZvUF28KwyNct009bWRiYuWpOOuY
	PkckwmYYFOTwQIkJuBmX82HgSGrsiPyqWr2v0Gg==
X-Gm-Gg: ASbGncsRYjzje4CWBLSA2x17xrJ8FVquWXSpLUJLPC9I8oi/gotek+GvnvZbTqnkf1k
	C7t/fe2WcB+n6BdlHCT8jhh4lvvzdtQxlmU/v+D24ya6lkL5KQkozh6Z8h+YLzmWwW28UiEkF0R
	WwrZbUkJxHMfHBG+z5j4PzDM0=
X-Google-Smtp-Source: AGHT+IH932onN3LtbuDsB2zIJMZAB7zVyXn9SdYNT5bEdTdpbtKDjtpG9xMpkEjuL1jvH3p5mBmUHA70IkrkqZGMWFs=
X-Received: by 2002:a05:651c:a11:b0:31a:466a:4746 with SMTP id
 38308e7fff4ca-326c4626122mr9560221fa.28.1746767619980; Thu, 08 May 2025
 22:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com> <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
In-Reply-To: <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 May 2025 10:43:28 +0530
X-Gm-Features: ATxdqUEv61ChnZUOzx7yPdXINdl80n6Z4DSE8-_2d7Qt3jd-BEsqt9upnD2bVHQ
Message-ID: <CAK9=C2XpNMmYu_MxcA390+SBm5fMSXYYJ37JeYGHa8OHjWmYqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: RISC-V: reset smstateen in a better place
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_221342_376474_06EF2D64 
X-CRM114-Status: GOOD (  14.80  )
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

T24gVGh1LCBNYXkgOCwgMjAyNSBhdCA4OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhpcyBnb3QgbWlzc2VkIHdoZW4gdGhlIHNl
cmllcyB3YXMgYXBwbGllZCBvdXQgb2Ygb3JkZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiBGZWVsIGZyZWUgdG8g
c3F1YXNoIHRoaXMgcGF0Y2ggd2l0aCAzNzZlM2MwZjhhYTUgKCJLVk06IFJJU0MtVjogcmVtb3Zl
Cj4gdW5uZWNlc3NhcnkgU0JJIHJlc2V0IHN0YXRlIikuCgpJIGhhdmUgc3F1YXNoZWQgdGhpcyBw
YXRjaCBpbnRvIGNvbW1pdCAzNzZlM2MwZjhhYTUKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA3Y2MwNzk2OTk5ZWIuLmE3OGY5ZWMy
ZmEwZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPiBAQCAtNjAsNiArNjAsNyBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3Zf
dmNwdV9jb250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgbWVt
c2V0KGNudHgsIDAsIHNpemVvZigqY250eCkpOwo+ICAgICAgICAgbWVtc2V0KGNzciwgMCwgc2l6
ZW9mKCpjc3IpKTsKPiArICAgICAgIG1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAw
LCBzaXplb2YodmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7Cj4KPiAgICAgICAgIC8qIFJlc3Rv
cmUgZGF0YXAgYXMgaXQncyBub3QgYSBwYXJ0IG9mIHRoZSBndWVzdCBjb250ZXh0LiAqLwo+ICAg
ICAgICAgY250eC0+dmVjdG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwo+IEBAIC0xMDEsOCArMTAy
LDYgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV9jb250ZXh0X3Jlc2V0KHZjcHUpOwo+Cj4g
LSAgICAgICBtZW1zZXQoJnZjcHUtPmFyY2guc21zdGF0ZWVuX2NzciwgMCwgc2l6ZW9mKHZjcHUt
PmFyY2guc21zdGF0ZWVuX2NzcikpOwo+IC0KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2ZwX3Jl
c2V0KHZjcHUpOwo+Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV92ZWN0b3JfcmVzZXQodmNwdSk7
Cj4gLS0KPiAyLjQ5LjAKPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
