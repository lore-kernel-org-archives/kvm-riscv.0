Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE06C83F1B
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPaz81rc9gWKoFbeUaDFGINxplvzkKJMaCQmyPz+kEg=; b=C7HLANHjcRj3U1
	A07uE6nEZD0VRhqomBqd5MEHqibMHqUkq0BYsKKS5Lrj/LiK5ZQvF+/f0Q673vzRZGzOZAP/Hj6bv
	xFR1jineF2zhOYFWxxGeNxIHi8UC1LmHEXmeKdlcyBtpaVc+LncBcx5qbvE7wv2qzeEnTreyop80k
	miUJyS4Pb669Qa390yk6/6vOdz7GxqStZiO2VdpItlftVS29T30GBHXo4C6xFCx6FKk8AOXRFO5zN
	rk4Rs3qM1nAUXJyt+K4/4WC0Sspk57bVXfoBJ0Aa8RXUMMprp/hNum9K1mwQXMGuuhBEroyxkx1EU
	OlR4mz3oTsUxrOzxZ72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDRW-0000000EpU7-3Wfr;
	Fri, 11 Jul 2025 13:05:34 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDRT-0000000EpSS-2aH6
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 13:05:33 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e13a58191eso17673575ab.2
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Jul 2025 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752239130; x=1752843930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJE3CLjEeonNUb8mT2xwmsMp3adhwfxqmRNHfpesc2o=;
        b=GAFxoNmPZ9ao7NrAIoG7Sahe+7G15kFqx5Sezn2LIdR20vy55/0xIB9gcz/Ks4wKZG
         fvNQQHHcUJESB5GCq1iO91qJVZI14DIuQuwqgfbMYMl92X2YRl5LrBhUL45bieiklUEX
         ouMu/lFbMIpcCWC0vKaGeEWSNXzGB/1n9kNCTGG85pzFOXwcfq5QuL1qpOIIGDOoBE2Y
         0SizqbXvSrD1sRafgKDTnfwFf9CmPNKljdhORtXcBTSt4H21iE6IcWFXVMiAdFcJJzZM
         OQ+RcEQzWgqlgSLF7SU0R09Rbd8QdIqZnohYC3Nabwcvw6+B4p8ADO2s/wCSuV4oSbOc
         me8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752239130; x=1752843930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJE3CLjEeonNUb8mT2xwmsMp3adhwfxqmRNHfpesc2o=;
        b=TxyOhUcWEtqWTzSxy4aUqguYz8f58Uswlql38RnCESP1y+MyI/ex7QN0XYnRdUCaeQ
         LYxyMaadK3xth/N5ueW6givXKSXdE+rsBC4qs/m3ZTp16ZAo8RhTJ+GZGVDTJMn0aA8e
         I4jPs+M//nOd5WaTizVbGUDk9hkiuNRXWc8A6Pph0LiWpAQrg6PqBOG4hrpzz+zD0F10
         NRBO5EEbrvBehZt+bRjeMFWPjkgBtI6wjtHosTZmtCJsMLH3d9TiDQ2ezEddHrnXrPvP
         eV7hfeiJkS4QV3K9D4pV4X+sxI/zBs02OVnVFusQ2DqdE2ZdAipxCMHhjXxyWUbFdYs7
         a8xg==
X-Forwarded-Encrypted: i=1; AJvYcCXd+l7eZ5sLDNrIubDnCNMjwZeSB4l4Zz4mtd7h09MJfUyr5gOFLRpfs0A9o3c2YEr0Wgp3kU23N38=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4ziHpR6JNGAVPtDhm6J38xE90EtbRrYOlCa6txAJCSE6Lv50
	uiNABJxyInPzZRiqVV39z2in6XWTRwGYL2+BnL+4lr3pv7V4uNvXChaWuPSptnhAJZFQ1AeH7Ob
	HgvEIMJT4w7hRQx7ZfCACSHiOqsfuUIvqh5FTb5nk3A==
X-Gm-Gg: ASbGncvEY7MqgoJ1wdYYhU1N1UFKBz+m4fNNnvvrId+9Gef3MzE2qsnthp1TjB/HeVL
	ql0qv87/Umizumm8pOhvYWdQWCJp4fcNXYVnpG3dGMqcoqCzK7BNVLF36R6Sm6BrOJeGBbbIlhh
	JAS3rL54NqZk7jGL+6BLDCcDoOEXVLSBs3h7lrYigp7WoWT0U35/WWn/A9F/16DSXDvxjhCRTnx
	fBo+LTL
X-Google-Smtp-Source: AGHT+IEPU9SyMA3ByH+HpMG+YsQr79SQw8svyUaMdhj2IE3tiGFc6RjWYvNGPYPV7cSMIf3tPt5HkTmZtilB6ri5/o4=
X-Received: by 2002:a05:6e02:2682:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3e253341fe2mr44338105ab.18.1752239130172; Fri, 11 Jul 2025
 06:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250707035345.17494-1-apatel@ventanamicro.com>
In-Reply-To: <20250707035345.17494-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jul 2025 18:35:17 +0530
X-Gm-Features: Ac12FXwUE-a6Xf4G6F5Wb87U6THpUu9QoAOdL2yGtZJMrmr3dB1cTnbnWmVVvS8
Message-ID: <CAAhSdy17yUD=7aMcX2VuFHm+1-TQ6jhwsnPJAQsGS_AmmP1WCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Few timer and AIA fixes for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_060531_867975_299E59F6 
X-CRM114-Status: GOOD (  16.23  )
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

T24gTW9uLCBKdWwgNywgMjAyNSBhdCA5OjIz4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIFJJU0MtViBQcml2aWxlZ2VkIHNwZWNpZmljYWl0
b24gc2F5cyB0aGUgZm9sbG93aW5nOiAiV0ZJIGlzIGFsc28KPiByZXF1aXJlZCB0byByZXN1bWUg
ZXhlY3V0aW9uIGZvciBsb2NhbGx5IGVuYWJsZWQgaW50ZXJydXB0cyBwZW5kaW5nCj4gYXQgYW55
IHByaXZpbGVnZSBsZXZlbCwgcmVnYXJkbGVzcyBvZiB0aGUgZ2xvYmFsIGludGVycnVwdCBlbmFi
bGUgYXQKPiBlYWNoIHByaXZpbGVnZSBsZXZlbC4iCj4KPiBCYXNlZCBvbiB0aGUgYWJvdmUsIGlm
IHRoZXJlIGlzIHBlbmRpbmcgVlMtdGltZXIgaW50ZXJydXB0IHdoZW4gdGhlCj4gaG9zdCAoYWth
IEhTLW1vZGUpIGV4ZWN1dGVzIFdGSSB0aGVuIHN1Y2ggYSBXRkkgd2lsbCBzaW1wbHkgYmVjb21l
IE5PUAo+IGFuZCBub3QgZG8gYW55dGhpbmcuIFRoaXMgcmVzdWx0IGluIFFFTVUgUklTQy1WIGNv
bnN1bWluZyBhIGxvdCBvZiBDUFUKPiB0aW1lIG9uIHRoZSB4ODYgbWFjaGluZSB3aGVyZSBpdCBp
cyBydW5uaW5nLiBUaGUgUEFUQ0gxIHNvbHZlcyB0aGlzCj4gaXNzdWUgYnkgYWRkaW5nIGFwcHJv
cHJpYXRlIGNsZWFudXAgaW4gS1ZNIFJJU0MtViB0aW1lciB2aXJ0dWFsaXphdGlvbi4KPgo+IEFz
IGEgcmVzdWx0IFBBVENIMSwgcmFjZSBjb25kaXRpb25zIGluIHVwZGF0aW5nIEhHRUlbRXxQXSBD
U1JzIHdoZW4gYQo+IFZDUFUgaXMgbW92ZWQgZnJvbSBvbmUgaG9zdCBDUFUgdG8gYW5vdGhlciBh
cmUgYmVpbmcgb2JzZXJ2ZWQgb24gUUVNVQo+IHNvIHRoZSBQQVRDSDIgdHJpZXMgdG8gbWluaW1p
emUgdGhlIGNoYW5jZXMgb2YgdGhlc2UgcmFjZSBjb25kaXRpb25zLgo+Cj4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiAgLSBBZGRlZCBtb3JlIGRldGFpbHMgYWJvdXQgcmFjZSBjb25kaXRpb24gaW4gUEFU
Q0gyIGNvbW1pdCBkZXNjcmlwdGlvbi4KPgo+IEFudXAgUGF0ZWwgKDIpOgo+ICAgUklTQy1WOiBL
Vk06IERpc2FibGUgdnN0aW1lY21wIGJlZm9yZSBleGl0aW5nIHRvIHVzZXItc3BhY2UKPiAgIFJJ
U0MtVjogS1ZNOiBNb3ZlIEhHRUlbRXxQXSBDU1IgYWNjZXNzIHRvIElNU0lDIHZpcnR1YWxpemF0
aW9uCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggfCAgNCArKy0KPiAgYXJj
aC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgfCA1MSArKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgICAgICB8IDQ1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAg
ICAgfCAgMiAtLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgICAgICB8IDE2ICsrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMo
LSkKPgoKUXVldWVkIHRoaXMgc2VyaWVzIGFzIGZpeGVzIGZvciBMaW51eC02LjE2CgpJIGhhdmUg
dGFrZW4gY2FyZSBvZiB0aGUgY29tbWVudCBvbiBQQVRDSDIgYXQgdGhlIHRpbWUgb2YgcXVldWlu
Zy4KClRoYW5rcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
