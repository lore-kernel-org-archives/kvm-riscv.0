Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB45C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcAV6svfKTaGtvV1aXkJTut0XtOJdpIr04i9pniKY54=; b=a6MkSXr2p8eNtT
	73GwcLEZWIsXSxv68pHMGxph1UMLRoblQ9naSgktui0q7WNv1OY5lPQC9uzvx+XG3heHsOJu034F9
	XKovahrpq4zVIFwubUqBj7di0KXee7p4kdNsF7RWZbtTRpERx1Z1DufkdsEcibXz2pu4JxI9lYLty
	BmlfqYJJsx3ocKtTCh3yQuA6OWXLzWJpCxi1a53ddw+qTZtJw/PW4A2TqX5OVGvdsuWxz2kRw0ZuL
	ezFBaE64rCIRoBK4//lrHH6qeEsclddoCGyHKL/7aT9tBYl3Xxj8ol4QjNgPfxD4/x+0IXg+TRUS6
	s+tP1DtOgTdGG7mBlI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCixo-0000000GOvI-3ffd;
	Wed, 07 May 2025 17:53:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZS-0000000GLHK-2OZg
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 17:28:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso76995e9.3
        for <kvm-riscv@lists.infradead.org>; Wed, 07 May 2025 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746638917; x=1747243717; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=U8a++3pzLGjvZM/BvmeaVcX+tS4lOI1LrYXqSyzsCOh7yzT36JPQebKkJfqxfIZUQC
         x6Asu1jG1BWVFEXAlil2w5UbmiMHMwhjj8Em02u0MxTxgdG1OFf+8NP6+RscxKb2r9Wx
         nKEGMpR/QDcQXpdpDBHp7xs/uASogdgpgJQeICkKasrZp73zHM2DYgIGLeKgIz+4lpx9
         tBA1KlF0QT0lqlGarK479tGot0vv2QLdjVnnnB7A6wXQ0mOmuNPPLBC4fCS3FwL1GiW4
         qw/6YdaeabzuvGxIObV6J9+pZu0NsZaq3BdmluURPABW4aftsAoRFSKRUpBTvmKjvw5+
         C3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638917; x=1747243717;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=kMwDgB5ccH/S5Ecut/vIAgZ/P0zIaZQa1iZ7pXfSZmONhTR9XVWqBPPRLQ/Lu2EHM9
         wIrznNIlIIBsuxTmQFIwxefiSbRQxJxcQQ6MgPhRtzt+lb7eJn0ChAHrhsRlEjELDHBM
         gf0tu//YC++LJ5O0yICQepCwW++zspyn5iBfqHFW847MZoR+YnL84s5vJOe9P5Nm4X5z
         owIGPmfvFh/07jCffbyFXVhStJwv9Vtb5g47uCbtODfRH+TJHvj99pcJ7ahBDOnZYS/f
         iA8bmJmLzCkJvBdk+9E9E8gGXQTkj+uS6KwPHhcrkO4nGhgYr8Rv8FElLolTbVbrBKxN
         +A/Q==
X-Gm-Message-State: AOJu0Yw3wPPvJPOHtarAr2fYzs+JzNi4qjUMUKa0t1Fo9BSJMwSurP/m
	Gbmin3BbB+ZOGPZHaQmLTPYizQ51FYQlEmD8FZLwi9Fqh8uDln1vC2Vo+l0xuJg=
X-Gm-Gg: ASbGnctctFHbp0HgqOI2a0SqnlAzkzu7KK+EOxiN1i5PYergLTYkD8PPojhXVgETKkZ
	qoT3NAOSOfHTf+xp8bNn92SLqtsQQPn+kwFXlfBkg1T1P9oTaaHbHLm9OHFWxaXC/mKJBwiU8Pk
	bRCRexXM8fQnYXHKI4grc05/zoFcPfu8tm/hsJU29OYlwL/xCgxdjbO4OvOMJ+kXGchBVa60ui4
	exmDhUMvG+2W6Kn+FqFQ0UGVgkspNEW7ttMCTPSzNjds+Ka/+LLEHLxg+ccRh3653fQA+MnJNMU
	ZV8mYxe/6Xqb1juc5mF+YRKBGcAyihRRKXWPlfVZx48SfQ0n
X-Google-Smtp-Source: AGHT+IHU+1d2rnAPUioAKK829WKkuchI8dVVAYZLNapz3Ruq/guJ3Nrk018+5LxP/Vpdt+N6B5rWQw==
X-Received: by 2002:a05:600c:8711:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-441d44dd3b3mr14261685e9.5.1746638916681;
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f39f:9517:bfc5:cd5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm7953815e9.40.2025.05.07.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 07 May 2025 19:28:35 +0200
Message-Id: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
 <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
In-Reply-To: <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102838_600505_AD0D1922 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0wNS0wN1QxNzozMTozMyswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfc2JpLmgKPj4gQEAgLTU1LDYgKzU1LDggQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlf
Zm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+PiAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fcnVu
ICpydW4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgdHlwZSwg
dTY0IGZsYWdzKTsKPj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHBjLCB1bnNpZ25lZCBsb25nIGExKTsKPgo+IFVzZSB0YWJzIGZv
ciBhbGlnbm1lbnQgaW5zdGVhZCBvZiBzcGFjZXMuCgpPb3BzLCBJIHRvdGFsbHkgZm9yZ290IHRo
YXQgbGludXggdXNlcyB0YWJzIGV2ZW4gZm9yIGFsaWdubWVudC4KCj4gT3RoZXJ3aXNlLCBpdCBs
b29rcyBnb29kIHRvIG1lLgo+IEkgaGF2ZSB0YWtlbiBjYXJlIG9mIHRoZSBhYm92ZSBjb21tZW50
IGF0IHRoZSB0aW1lCj4gb2YgbWVyZ2luZyB0aGlzIHBhdGNoLgoKVGhhbmtzLCBJJ2xsIHBvc3Qg
djIgd2l0aG91dCB0aGUgdGhyZWUgcGF0Y2hlcy4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
