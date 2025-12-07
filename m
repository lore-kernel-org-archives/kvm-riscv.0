Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1C5D2CE17
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Dec 2025 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ekmafAabTKiuCEcwmlbNsOVg4iNnEGYP8fAM632MkA=; b=w45xJ7OBPLkLpV
	O3tw9iLGeKGLodAUAC0blxWwRq9J9O1JGbpknnj3792h029aeCydYdIlvQY0EfN7tA4/YC3O5sK92
	VWGhDDWheBTesqaZAaafwPXAUzgltaHcJ9eXKabiIAwyZbwH3HGl/pMyIN2fjgKX1g48vz2fl1lez
	Mnw2tsPIrHZFgw1lxWZ8v5lA2X79+F2IiKY7rxjPOH/gp89jS60z3677am8Pn8WYs6qK3Sh74jeA7
	tmkUEy4xXPA2WX9PNXzfNLt7KQIjb/9eNTY8sAu7brUBFxv0XlUfAWJExymMQxbwXGLr1w8OTXul5
	pEAJfgjlEr/vo8mKo3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76L-0000000BU8b-1VGr;
	Sun, 07 Dec 2025 05:14:29 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76H-0000000BU7O-2JTg
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Dec 2025 05:14:28 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6597b877066so2153129eaf.2
        for <kvm-riscv@lists.infradead.org>; Sat, 06 Dec 2025 21:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765084464; x=1765689264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=yphoFExAA6hw9FxEy79Q0Ktooulcc9EkrJ9pqdXEvLG6qOehRXefP1OnRnaNEVNhLc
         Poky6A4ZJdREh/x8eKFnYaZT3857GWvtWxmk8nQFmT1znJ2J2KXWrCdELfW6gdephopu
         4DR+dZ+uYk+4wjI8xgSDnCda9Qtoua7kHAxOWJhA7g/eia6rO3TYCsmskTiHmbdj21k8
         y+DJtXXPhRmrjy9VW8z8q7gS+a2QlJ9arTOWgdp8NmjDXr73SrjMRLDH5uIgcnRWRO3E
         BR/tSfSIUG7CSXrQ9SUIx2CcEDwy/ukbDWA/BzUILDPZWGXKFS/DpDF0zMVq44y42Bel
         5JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765084464; x=1765689264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=icGCtaXwmOOduQHn4Fb5XQmX21MVvR8RkoF3Z1Djutiy49hdOjgWK487jZkyHQ9+kW
         Lm1OPbV46PJWXXgAmUtWMKdbQxrt1Vro31HuU/8DvqmOgxbMy7sz4tbQJjug/BvB2Fqr
         QuhKWXppf/HSzX2qXw68BZyQapGQk6nN0uf/UWuhsh/gOcVytogRqdZb6yGvc/1+Qckr
         fifNSeoIiCNVhY/rb2rmNuIrXuLfke1Y0P86fL6UIcdqUg0GneVm8dxhChoGEswfduc3
         5MzYKcEB/lgE5i73bPN6u5oTx4X5um86mStLrr1LxqgpWUQ5OWo9vLO2UKOXqzhtUB04
         cAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvhU0E1EeCTbges1CBlzKYMDnzCOA7a/WNXzcMSDXx97iP2P0Zz0nHpWkXHptBNce1bhHor7i9bs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPGu+VegHmbB7sx8FfitJyrJR4SaTu53VfoAd5V582FHeRUi0T
	p7crmWYVpiNsc92X7z4r8QVvMAMwL+Cs+ScdO2zzJd90LpSCYdGvPtegStCvknb7yCCOzAlc9Gy
	CzOGZnRH+4sx0LqR+tbJSrRjfsqZOlnr09cBDIeHvvg==
X-Gm-Gg: ASbGnct/S6GHFbPLhzKi8Luqhs5ELJEzC6z/eoAycx/b7PugmJfQX4J2dY1jFBHcfCT
	296eecN6wv0SQSHmQac3RT/TQciBH2/8wasty2tf2JiBgcUyQL9ZNArGIS031EaxqIhMObA83Xm
	HBt9y16NHt3EO5n/A+LIxFYDkjQyHZvTRZ1Z+BlVKTpBRJImS9ORFwTuxzOn1+PwYxgGJ64Y6Yx
	lfICIdosw/+d5PQ10rskFMT7ZcdxnQ/12zV9QUPANDNrfgxZ4GLv/pMDouaDHcqhkSOBjEk
X-Google-Smtp-Source: AGHT+IH3teezYiglKMW0l9sCwPDXKzHK/uYMVzLl99zBL+8tY4BEmXzPQzc7f6ucWRYnVm2fOg07KrRcgASdUHrgci4=
X-Received: by 2002:a05:6820:f030:b0:659:9a49:8f73 with SMTP id
 006d021491bc7-6599a973da4mr2018657eaf.56.1765084463840; Sat, 06 Dec 2025
 21:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 10:44:13 +0530
X-Gm-Features: AQt7F2qP99gde5P8lRQoinF2DOSDMpaUpigWBx6hvnDvXPL66vGpk9e2egXMZ2I
Message-ID: <CAAhSdy1cPnxjntaR=cwZqG+oVgFpZKM0rKYAEdkHUCToMvN0Ag@mail.gmail.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_211425_857943_DDCB15EB 
X-CRM114-Status: UNSURE (   6.85  )
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

T24gU2F0LCBEZWMgNiwgMjAyNSBhdCA0OjU34oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIEtWTSdzIGludGVybmFsIHBzZXVkby1v
dmVybGF5IG9mIGt2bV9zdGF0c19kZXNjLCB3aGljaCBzdWJ0bHkKPiBhbGlhc2VzIHRoZSBmbGV4
aWJsZSBuYW1lW10gaW4gdGhlIHVBUEkgZGVmaW5pdGlvbiB3aXRoIGEgZml4ZWQtc2l6ZSBhcnJh
eQo+IG9mIHRoZSBzYW1lIG5hbWUuICBUaGUgdW51c3VhbCBlbWJlZGRlZCBzdHJ1Y3R1cmUgcmVz
dWx0cyBpbiBjb21waWxlcgo+IHdhcm5pbmdzIGR1ZSB0byAtV2ZsZXgtYXJyYXktbWVtYmVyLW5v
dC1hdC1lbmQsIGFuZCBhbHNvIG5lY2Vzc2l0YXRlcyBhbgo+IGV4dHJhIGxldmVsIG9mIGRlcmVm
ZXJlbmNpbmcgaW4gS1ZNLiAgVG8gYXZvaWQgdGhlICJvdmVybGF5IiwgZGVmaW5lIHRoZQo+IHVB
UEkgc3RydWN0dXJlIHRvIGhhdmUgYSBmaXhlZC1zaXplIG5hbWUgd2hlbiBidWlsZGluZyBmb3Ig
dGhlIGtlcm5lbC4KPgo+IE9wcG9ydHVuaXN0aWNhbGx5IGNsZWFuIHVwIHRoZSBpbmRlbnRhdGlv
biBmb3IgdGhlIHN0YXRzIG1hY3JvcywgYW5kCj4gcmVwbGFjZSBzcGFjZXMgd2l0aCB0YWJzLgo+
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBSZXBvcnRlZC1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IENsb3NlczogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL2FQZk5LUnBMZmhtaFlxZlBAa3NwcAo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6
CkFja2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVw
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
