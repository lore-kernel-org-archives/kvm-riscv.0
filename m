Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5003EC3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 05:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eJNb4gzwwogB270oMzTGC6HcVY8oGjztX/EWi+uEBg=; b=ymo7j20xfcjXHq
	CHvDeuMgSoQIUQYrGG4zDQu6kEtlo+ZgQibfdIGQsUIiEk8UpHpaqu6r+FAUNMIacKy1ZSwBHtkxM
	qClNNmkaF3PuKOE9tCJBGLmzI2IlmVg+SD5Y2JEEoYaqZMvKyKsoe0v+M6mBo8wDNXYZZ1x9Ze4z6
	fw/pGlhLoz0fbmt6a6tEs8Skd/y5ikQa61jXHursfeXLelSMCtmS9KIdLvaNUHRvWOx00VTYWiDqB
	/+TANQjkq5jGQEDC0ySOC9rFoMLBTcHY+P/+LzJb+pD/EYyRGYFCkh2XIia3J4pvJBoEKh35UG3OT
	bUjm2AXdo1oUCYbbzIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtOv-0000000HJq7-3bPs;
	Thu, 08 May 2025 05:02:29 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtOr-0000000HJnq-2KsY
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 05:02:27 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so6571185ab.0
        for <kvm-riscv@lists.infradead.org>; Wed, 07 May 2025 22:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746680544; x=1747285344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=UqarNX5+hFDZp6WyKRY8706EvHfE7VIicdnuO1kn8Od7XJ3ZbUKG12fWYTdRIBoa36
         AK1LSEBLrGkV0kcGqh18knrl1SQOemYxda+mpcmqQIxV3801A2Y5CjdLxnoa9r/T1IFV
         aRQ6WpfJFb8nsHxtebiDIyO+FN08Tj+SJ95BoExgqbcVuW2Q6kYcccTBLmVnZ3NgjfEj
         520UvozzOiz4wq4j8f7hpoBfq6H7x2hk7A5ImkdHmccnAMd8k1DDx1/wdsdXEvPk5N6v
         iGglsyCGfpWluaE7QMw7iM1qmPLdapGyZId+5ldHdhG3hag8PXtV93uVjE3KJxl4qgrM
         h/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746680544; x=1747285344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4O7+nQ6u5XMVEZ9olWj3Ht9QPAgJnl5lq5fX/yAqRY=;
        b=JfxMQ9n1Yhq1EXK1TH0xqtHSwtljHXlzvNdLNGtC89j3nQvtP63lPHfpdgpYH7bx0N
         Bv3e3qW93rQlSrBQZZ5U8IL+wNmDQDJuzhbgzeiuyZIIym2zO2DQJNj+vvs3c7orjaAN
         cHReGHrJ7GiMeUDa9RyMY9ybCTREVLqX55DMThluZQxXDsrfKjEIt42R+qbPgeAWizTG
         mDXvAGONvq6NAG2+YoaqTujyuxFAFTMk5G4vUCL4/mF/4GiKO+EHb/X2DSDV+BOTvKwO
         5Yu1E/qqD1LAhSpA0+pv9DG12eoSgTFgw9e1CQwvBb1qQke5EQUZIDSpZ9LpGrmQYvFP
         +skg==
X-Gm-Message-State: AOJu0Yx20INxwkpRyBivDUDqhpngzo4J+AfQTKOF0qtSbnGuDeaVJ2+p
	fGVyFaZpGGRfTnyDLhKvQZyUxxWXfZWawPfADMpcRyd33NS2qyaSBT9ImPhmUtIZAiCHA8+vcwB
	owZVYyNmpZZZ1vUoFVpEGXPia1YoHXMbZCawPMg==
X-Gm-Gg: ASbGncvWOKXOnezJV/XGaWNaQs5Htx7iW+oghFht+MROUoRy41/zNBSc8HmopqyhX2K
	TccWg9sbfjCuLer5qX468fAr4HJvGMcGaVslGb5Mxk9rjflzvML+koNeaWLOveF2rPTWjFfS4En
	t4b1BdO70Bz9wNGkbts2aH
X-Google-Smtp-Source: AGHT+IECR9VWWp5sM9ekT0izdpJvnXGhLFrUYyeXvUgiyjcyi/z8ERS2MGNabEsCST5MXjtN+VKccxirLbFB93wPSAg=
X-Received: by 2002:a05:6e02:33a1:b0:3d2:af0b:6e2a with SMTP id
 e9e14a558f8ab-3da7854d904mr27339085ab.5.1746680543894; Wed, 07 May 2025
 22:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com> <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
 <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
In-Reply-To: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 May 2025 10:32:13 +0530
X-Gm-Features: ATxdqUHAtn3fdoGp6jzvIyBGtoq6BWz_b3EO39aBJbq4imtAWzXWd7ChbJprOwA
Message-ID: <CAAhSdy0tb5Su_4ydBx1eSt6_1PPpgt1gE=nx53mwum=5DPzMRw@mail.gmail.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_220225_797128_6CFB4208 
X-CRM114-Status: GOOD (  12.91  )
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

T24gV2VkLCBNYXkgNywgMjAyNSBhdCAxMDo1OOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDUtMDdUMTc6MzE6MzMrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gVGh1LCBBcHIgMywgMjAy
NSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+
IHdyb3RlOgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4+IEBAIC01
NSw2ICs1NSw4IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiA+PiAgdm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiA+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHR5cGUsIHU2NCBmbGFncyk7Cj4g
Pj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgYTEpOwo+ID4KPiA+IFVzZSB0YWJzIGZvciBhbGln
bm1lbnQgaW5zdGVhZCBvZiBzcGFjZXMuCj4KPiBPb3BzLCBJIHRvdGFsbHkgZm9yZ290IHRoYXQg
bGludXggdXNlcyB0YWJzIGV2ZW4gZm9yIGFsaWdubWVudC4KPgo+ID4gT3RoZXJ3aXNlLCBpdCBs
b29rcyBnb29kIHRvIG1lLgo+ID4gSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1l
bnQgYXQgdGhlIHRpbWUKPiA+IG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KPgo+IFRoYW5rcywgSSds
bCBwb3N0IHYyIHdpdGhvdXQgdGhlIHRocmVlIHBhdGNoZXMuCgpCYXNlIHlvdXIgdjIgdXBvbiBy
aXNjdl9rdm1fcXVldWUgYnJhbmNoIGF0Cmh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGlu
dXguZ2l0CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
