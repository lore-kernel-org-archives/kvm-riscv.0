Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DF9CFD315
	for <kvm-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 02:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3bJ0C4VyULseapUgsrd1RQzBEbU0oGkkDep2CwwCnA=; b=hJy4VvBeJIqj1U
	gHxIAsGs+1S1iReN+Fiia9nXhEN8a0eUEiyQ3SxnjPuMlBq5bileSWfbkh8Ny8x3dDme4V+VhBVHR
	TATzS7i+/X4d/iRwLlovP60AjLrzBC/0MQGfsc+co3bVPQ1i0Xr1zjWfowRmCJWXznJwrBkzAzq+x
	R7TMP7OAZj5twui7ekIMEWMbC55Jpbj2G/3x9pDNUXmq5Dc7XlX5XJcD3+NKq7MUwbmvMjDnsYiEh
	lrv615EESnX2TY33eT0uc5mQMZG6UFKNx8NR2ZLH9gUtsOW6tXwuB1Io24zMPiBvXzXHoAJO0qoyG
	D6hMOJx9CwRLOXqx1cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzun-0000000A4Dz-3Xdy;
	Sun, 23 Nov 2025 02:33:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMzum-0000000A4DM-3NTx
	for kvm-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 02:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3A2C60160
	for <kvm-riscv@lists.infradead.org>; Sun, 23 Nov 2025 02:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63378C19422
	for <kvm-riscv@lists.infradead.org>; Sun, 23 Nov 2025 02:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763865203;
	bh=rCc4nq3PttRA8+0oSgsrW9Mo0xwldTDWGoI5ab8Qu1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zy6HV/LUskZIV9pI7pgm2TEPeb4LQ72q/tyx+nNCuvgxYqPR0TuySDoEP84tsF7Sc
	 2fuV/mfELjNsy+Af53do+7qiv/M0+cfRDToub2NWq73qYBPT9GfEmJ0UyFikKZgFBG
	 dDIL5UEZdvDF6Kht6Kt8FlVRCpJYOdlBfCi0Iv+DHUtT+u/DY2z7de1QJOPHXsrDNH
	 UUbe9MnCRqb4Y4IfaKWLVuNcu12SJgC1A2k5F1Id+yER5cTzJqQAG/rzlcHRExQEtS
	 DGJEFg3YNoRUVkfYlilLb5CK1Itbo2c2+fayxhfmrUjtgh8vt+I9l3Qk+vUt7oU5P5
	 UGJnrh6PSDSOA==
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47790b080e4so16928645e9.3
        for <kvm-riscv@lists.infradead.org>; Sat, 22 Nov 2025 18:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV26uRl+Y0r5RIHp6bESRayDMZKdZJsQJhs9Fiy9Y8/ZvLPSNDVTZyrTYmJsZu+GlgmhT3GaKS7rS4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYFbCHeNQ7NeB8iTrur+wXqZBy7YbSTJYfLQKuow9cua5bwJcl
	OPyNUQXZEW+mBp9EBDi5c1XMxZm78P2JdrY4Jaor4Lk9PH8ztNqtANW0snla/w4B6Ci9y25Rr+N
	oQoO10aWj9l92jjtmMlCYK4THDCwx4Ic=
X-Google-Smtp-Source: AGHT+IFu8+keWKht8NAR12FzNoKQ1ZakL3uoRUW8Qu35TSMqtSJ2/G6S36LtFGsDYOLOjquBzTcDQ3YJIc/S1fXfwQs=
X-Received: by 2002:a05:600c:3590:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-477c104fc20mr85112725e9.0.1763865201944; Sat, 22 Nov 2025
 18:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20251122075023.27589-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251122075023.27589-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 23 Nov 2025 10:33:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
X-Gm-Features: AWmQ_bmTGM3DvVj2QLOaGmzVQQuWw2wC2Ygj63d-XxxSA_PqRhUSHSryftk40Qg
Message-ID: <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgMzo1MOKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBDdXJyZW50bHksIEhHQVRQIG1vZGUgdXNlcyB0aGUgbWF4aW11bSB2YWx1ZSBk
ZXRlY3RlZCBieSB0aGUgaGFyZHdhcmUKPiBidXQgb2Z0ZW4gc3VjaCBhIHdpZGUgR1BBIGlzIHVu
bmVjZXNzYXJ5LCBqdXN0IGFzIGEgaG9zdCBzb21ldGltZXMKPiBkb2Vzbid0IG5lZWQgc3Y1Ny4K
PiBJdCdzIGxpa2VseSB0aGF0IG5vIGFkZGl0aW9uYWwgcGFyYW1ldGVycyAobGlrZSBubzVsdmwg
YW5kIG5vNGx2bCkgYXJlCj4gbmVlZGVkLCBhbGlnbmluZyBIR0FUUCBtb2RlIHRvIFNBVFAgbW9k
ZSBzaG91bGQgbWVldCB0aGUgcmVxdWlyZW1lbnRzCj4gb2YgbW9zdCBzY2VuYXJpb3MuClllcywg
bm81LzRsdmwgaXMgbm90IGNsZWFyIGFib3V0IHNhdHAgb3IgaGdhdHAuIFNvLCBjb3ZlcmluZyBI
R1BBVFAgaXMKcmVhc29uYWJsZS4KCkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCA3ICsrKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4g
aW5kZXggYjY3ZDYwZDcyMmMyLi5iZmY4MGM4MGVhZDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0zMjAs
NyArMzIwLDYgQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lk
KQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjU3WDQgPDwgSEdB
VFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdB
VFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjU3WDQpIHsKPiAgICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X2dzdGFnZV9tb2RlID0gSEdBVFBfTU9ERV9TVjU3WDQ7Cj4gLSAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDU7Cj4gICAgICAgICAgICAgICAgIGdv
dG8gZG9uZTsKPiAgICAgICAgIH0KPgo+IEBAIC0zMjgsNyArMzI3LDYgQEAgdm9pZCBfX2luaXQg
a3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENT
Ul9IR0FUUCwgSEdBVFBfTU9ERV9TVjQ4WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAg
ICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBf
TU9ERV9TVjQ4WDQpIHsKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlID0g
SEdBVFBfTU9ERV9TVjQ4WDQ7Cj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdk
X2xldmVscyA9IDQ7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPgo+
IEBAIC0zMzYsNyArMzM0LDYgQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2Rl
dGVjdCh2b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjM5
WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FU
UCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjM5WDQpIHsKPiAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlID0gSEdBVFBfTU9ERV9TVjM5WDQ7Cj4gLSAg
ICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDM7Cj4gICAgICAgICAg
ICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPiAgI2Vsc2UgLyogQ09ORklHXzMyQklUICov
Cj4gQEAgLTM1NCw2ICszNTEsMTAgQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2Rl
X2RldGVjdCh2b2lkKQo+ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gMDsK
Pgo+ICBkb25lOgo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0
YWdlX21vZGUgPSBtaW4oc2F0cF9tb2RlID4+IFNBVFBfTU9ERV9TSElGVCwga3ZtX3Jpc2N2X2dz
dGFnZV9tb2RlKTsKSXQncyBvdXQgb2YgdGhlIG5vNS80bHZsIHNjb3BlLCBiZWNhdXNlIHdlIGxv
c2UgKGhzLW1vZGUpc2F0cD1zdjM5ICsKaGdhdHA9c3Y0OHg0IGNvbWJpbmF0aW9uLgoKSG93IGFi
b3V0IHJlLXBhcnNpbmcgbm81LzRsdmwgcGFyYW1ldGVycz8KCj4gKyAgICAgICBrdm1fcmlzY3Zf
Z3N0YWdlX3BnZF9sZXZlbHMgPSBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgLSBIR0FUUF9NT0RFX1NW
MzlYNCArIDM7Cj4gKyNlbmRpZgo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgMCk7Cj4g
ICAgICAgICBrdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfYWxsKCk7Cj4gIH0KPiAtLQo+IDIu
NTAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
