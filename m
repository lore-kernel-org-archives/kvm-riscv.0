Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75240CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zGzQSwK/FKd3NJL757p9DdnVIFqjwVapozmb661TU0=; b=g5+GwsCr+9ekZa
	l0xqDkLWZ442XFxUNoRDNlCWzVWWXHUdMB/cNq+KNFhqBoS19A3hOqlAA53lgXWED9pNC7Xyis8kr
	nJGaqa47pDqAR4+YSFOCv2h4uex/M+xrcsjBnlF2jrKxmssl90yXmQzWJSoz7IVpU3jLl+AtbZRpy
	Q4fXcmBDRiUBRsijamL6uea4ERz+7C0Z9r6U0Fhioktxux1cDghgWQnNpEym9bu92RXXpBOfxXBKQ
	/LvdUk48xCYhYL5DuFEsi9tqpzpesH60mSCIfdLTFe4FKKET3+SpSNF5lucwhspo0c6LB3OnW7ag7
	9Pjmd2F1vU/GlV4t7Wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmZw-0000000GKMJ-0e6z;
	Tue, 28 Oct 2025 16:29:48 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmZt-0000000GKKu-3seB
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:29:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-430c17e29d9so26023015ab.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761668985; x=1762273785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU+TdivIUQqN8kZ5z+UlMDP2EK04JqI3D0gfCEED62A=;
        b=IuEArl8FnsS6EpSKbZDY4F4YFgubMGTlTKLf3NLvWsgwhQdprbfzfEFNNc/tdjx3Bc
         oI4TcxOR5OfF6Q3+Fcif4nnhPszVj1WPYvf0zL+dqOahiKAg2DyahGxkZjjGBjWMkEal
         ueHg9SuhZoJUul5Dg5L+/0azfuPL1MBSVpmFyPkCtKUQOKOdGCRsQoE9sHHeQeBgusc2
         Pq8JH1NGWMkaACiCKZ6/mLh/Enn0XOLR+rfZiIbUt2Um7fkN/Jmw5xMsM+9ZMJlurH8J
         gYzfwRezHhYVj7Xmic054M6GM4naEwBith4/g6DxtfdZv+cbQz8ZIOvwO8gEsFDdN/os
         T2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668985; x=1762273785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU+TdivIUQqN8kZ5z+UlMDP2EK04JqI3D0gfCEED62A=;
        b=N1nY1bp4VKECyhXZzBtZvYlY1pDGHVYHOdWxRibTuxAOXDB8pO1BKEkDux72DF0K1y
         6xK5O4IKQAB9a/xN/CF2WHRaGZnecHBNMcSiq8XYis+7J9JNSYWWBO8Eca+OpRlKv+fz
         KJfuKgjlJYd1Ot7VvGIXz+jB0d4jo0RjmPRsjRwIY2SAI0UKURQTtE6UnO/uh/DweZdu
         Coe6h8U5u6x3miIjPfK4OkwXM7FKPtl8aTcO4bAdsiFzEYw6osRyVE0TbELm+UsuwfJp
         GShu4gIzn/ZqQSUSNCLYsiXEx/FavnBJF18o8N3MA17Qn8AmDsg2INOV06QzXPtX55Kc
         Qz1w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+trz9h7aDah9KSPRMdJSLmVevBeq8B8Xtju6vVQzkJ5J3kntFM2BZSqSQldXKvzOvSAD7wWUvCU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7nzMwMCfGZuNE/yFnZnzozal6Eo/g0PuE3O30m0aPo7bOycyX
	1gGEfs4GAIEg9CzZSKdezXEZyCkHWbPtJyOTYRno7ZrVlwqfWLVkOUfsDu+ZeG9wlDzDJF6+ZU3
	rh2CdpzP84loiualfQr8TSjWxdP3rhRXvBMm0MmilxQ==
X-Gm-Gg: ASbGncsJc3ybGzWMAHnz7Gxoh1zNePZW7iiW7GUHTeIS7gM1IauwOUPAPf0/y1I42hR
	QlLJqHM6Ga1nfSnrchAySovbXP70x9h4QsDOFV+6ppTs09K4RmXN5DAtgGcFKYruaTU/sfOgjss
	TJ2tdcb1iKAJu4AuLk0asnjwRFDMxfmz6EfaeK32kAn8M/lyjYatNUeu1pY73pqoZTCK556Sj4V
	lgyn5Z/D2u1rj3vQpVMZp5yFkAT3f0fM7UZRegBxu1pzhS5L43JOy27KT1RCUfTiRSYClDOcCuE
	gQ6UdWbBGmebPLy+hg==
X-Google-Smtp-Source: AGHT+IErAS74fWZIiI+tq2UyEDPXnXxNVCopnwSSqDNelEK9r7LFhgamKfvM6HVy6byU9ivOLNYx10ZFvWOtH8QctNI=
X-Received: by 2002:a05:6e02:97:b0:3f3:4562:ca92 with SMTP id
 e9e14a558f8ab-432f82bbd0dmr6242035ab.10.1761668984856; Tue, 28 Oct 2025
 09:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251023032517.2527193-1-minachou@andestech.com>
In-Reply-To: <20251023032517.2527193-1-minachou@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 21:59:34 +0530
X-Gm-Features: AWmQ_blNGqcbnB8O5PtfaRq8QkAGM6_aeGo0IUFrD9sil21TuzEIfSgTnICVsec
Message-ID: <CAAhSdy285QMVghHZv0He8-YOdBdK71_UXtQcy7_nf=3jaPxWsg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, tim609@andestech.com, ben717@andestech.com, 
	az70021@gmail.com, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092946_211601_388256ED 
X-CRM114-Status: GOOD (  19.92  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgODo1OeKAr0FNIEh1aSBNaW4gTWluYSBDaG91CjxtaW5h
Y2hvdUBhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxt
aW5hY2hvdUBhbmRlc3RlY2guY29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUg
R3Vlc3QvVk0gcnVuIG9uIHRoZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1
c2hlcyB0aGF0IEhvc3QgQ1BV4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1h
eSByZXRhaW4gc3RhbGUgVlMtc3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0
ZXMgdG8gYQo+IGRpZmZlcmVudCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEg
dG8gR1BBIG1hcHBpbmdzLCBjYXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0
Lgo+Cj4gVG8gZml4IHRoaXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZSgpIGlzIGV4
dGVuZGVkIHRvIGZsdXNoIGJvdGgKPiBHLXN0YWdlIGFuZCBWUy1zdGFnZSBUTEJzIHdoZW5ldmVy
IGEgVkNQVSBtaWdyYXRlcyB0byBhIGRpZmZlcmVudCBIb3N0IENQVS4KPiBUaGlzIGVuc3VyZXMg
dGhhdCBubyBzdGFsZSBWUy1zdGFnZSBtYXBwaW5ncyByZW1haW4gYWZ0ZXIgVkNQVSBtaWdyYXRp
b24uCj4KPiBGaXhlczogOTJlNDUwNTA3ZDU2ICgiUklTQy1WOiBLVk06IENsZWFudXAgc3RhbGUg
VExCIGVudHJpZXMgd2hlbiBob3N0IENQVSBjaGFuZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBIdWkg
TWluIE1pbmEgQ2hvdSA8bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBC
ZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpNeSBjb21tZW50cyBvbiB2
MiBhcmUgbm90IGFkZHJlc3NlZC4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gdjM6Cj4gLSBSZXNv
bHZlZCBidWlsZCB3YXJuaW5nOyB1cGRhdGVkIGhlYWRlciBkZWNsYXJhdGlvbiBhbmQgY2FsbCBz
aWRlIHRvCj4gICBrdm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplCj4KPiB2MjoKPiAtIFVwZGF0
ZWQgRml4ZXMgY29tbWl0IHRvIDkyZTQ1MDUwN2Q1Ngo+IC0gUmVuYW1lZCBmdW5jdGlvbiB0byBr
dm1fcmlzY3ZfbG9jYWxfdGxiX3Nhbml0aXplCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdm1pZC5oIHwgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCAy
ICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZtaWQuYyAgICAgICAgICAgICB8IDggKysrKysrKy0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1pZC5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdm1pZC5oCj4gaW5kZXggYWI5OGUxNDM0ZmI3Li43NWZiNmU4NzJjY2Qg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1pZC5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1pZC5oCj4gQEAgLTIyLDYgKzIyLDYgQEAgdW5z
aWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfYml0cyh2b2lkKTsKPiAgaW50IGt2bV9y
aXNjdl9nc3RhZ2Vfdm1pZF9pbml0KHN0cnVjdCBrdm0gKmt2bSk7Cj4gIGJvb2wga3ZtX3Jpc2N2
X2dzdGFnZV92bWlkX3Zlcl9jaGFuZ2VkKHN0cnVjdCBrdm1fdm1pZCAqdm1pZCk7Cj4gIHZvaWQg
a3ZtX3Jpc2N2X2dzdGFnZV92bWlkX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+IC12
b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Owo+ICt2b2lkIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KTsKPgo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggM2ViY2ZmZmFhOTc4Li43OTYyMThlNGE0NjIg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCj4gQEAgLTk2OCw3ICs5NjgsNyBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9y
dW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgICAgICAgICAgKiBOb3RlOiBUaGlz
IHNob3VsZCBiZSBkb25lIGFmdGVyIEctc3RhZ2UgVk1JRCBoYXMgYmVlbgo+ICAgICAgICAgICAg
ICAgICAgKiB1cGRhdGVkIHVzaW5nIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF92ZXJfY2hhbmdlZCgp
Cj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdl
X3ZtaWRfc2FuaXRpemUodmNwdSk7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9sb2NhbF90
bGJfc2FuaXRpemUodmNwdSk7Cj4KPiAgICAgICAgICAgICAgICAgdHJhY2Vfa3ZtX2VudHJ5KHZj
cHUpOwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYwo+IGluZGV4IDNiNDI2YzgwMDQ4MC4uNjMyM2Y1MzgzZDM2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtaWQuYwo+
IEBAIC0xMjUsNyArMTI1LDcgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfdXBkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAga3ZtX21ha2VfcmVxdWVzdChL
Vk1fUkVRX1VQREFURV9IR0FUUCwgdik7Cj4gIH0KPgo+IC12b2lkIGt2bV9yaXNjdl9nc3RhZ2Vf
dm1pZF9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3ZvaWQga3ZtX3Jpc2N2X2xv
Y2FsX3RsYl9zYW5pdGl6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgdm1pZDsKPgo+IEBAIC0xNDYsNCArMTQ2LDEwIEBAIHZvaWQga3ZtX3Jpc2N2
X2dzdGFnZV92bWlkX3Nhbml0aXplKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAg
dm1pZCA9IFJFQURfT05DRSh2Y3B1LT5rdm0tPmFyY2gudm1pZC52bWlkKTsKPiAgICAgICAgIGt2
bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3ZtYV92bWlkX2FsbCh2bWlkKTsKPiArCj4gKyAgICAgICAv
Kgo+ICsgICAgICAgICogRmx1c2ggVlMtc3RhZ2UgVExCcyBlbnRyeSBhZnRlciBWQ1BVIG1pZ3Jh
dGlvbiB0byBhdm9pZCB1c2luZwo+ICsgICAgICAgICogc3RhbGUgZW50cmllcy4KPiArICAgICAg
ICAqLwo+ICsgICAgICAga3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV92dm1hX2FsbCh2bWlkKTsKPiAg
fQo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
