Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2A2CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsBilfzGn6XqbmYeM02yJ/hSJkRtKKHYV0DvM40Lp2I=; b=Z5+SlIZLJLQuPN
	cyb49kyqrWSxcfuxuJMiin3NxWgcEdkB97kuxLtmuRkikJp1e13ELFrndehVn4LEgrRSUlmRaR6gG
	dDIGEtAF+3J9+e7etj1wRrUzvDFsdoGIsq1wFnNLSd9SuT2CuCgTHFypdzy/NYD5N9Eic8e+xDBRa
	Qy84evBf0n4/fJWoe0FPWD7Iv6oqjujJmcYjJpcGNUAgvrHqGMSP+dTSD51gtEwaQMcCGe2zM64Mk
	OD8DlWVHrWOxnyFqsrdQ6PeC9vwJ0rX84mGA2H3e1e+0ZKWQCpfK4Et1wuV4sfbsxNqZL3G0uRqdM
	Kt5p8ZuzTk75sr9Pjw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjf-00000003w0L-2Xbg;
	Sat, 23 Aug 2025 06:28:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPxH-00000002LHm-32Xu
	for kvm-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 11:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TAj4MTsX9crtFaSUyO+PrnGMFjFfbBShLF1OedjML3o=; b=qOf/ePD60QWk3Whx3Ihmv/FuD5
	vts5diuLcXAphxN+469qKNQg3OtdIm0wnzYIreCr0yzn3SFIqH57C8zTOiR9wT+YO7yNvqqcDyAem
	OsOQLEbPLRsIyc5lrBQPK+XC0cAAux/Gd8R4mHrgDUAG8crAg/VZp4XEarG4Zuf3w5/21hXWt78Y6
	PS8ujvOQ5ckHvFJGKntoYHGKcm1x7aET3ecL/ClncPtfUHfVzZWcCAy0NcXPoVD6j42aZhIamoG9x
	xeCyLKDlgF2BNKMmGLnxxRbU0QY2vkJ8cIrigQyDKIdaovRlRcVY5WDDxexk/c6b1if+j9ojH6Pfw
	AnWCvG+w==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPxE-00000000t8Y-3Z7R
	for kvm-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:29:10 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e6831f5ce4so7905915ab.3
        for <kvm-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755862145; x=1756466945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAj4MTsX9crtFaSUyO+PrnGMFjFfbBShLF1OedjML3o=;
        b=BZs1YSkBc0IdmeNqST6yEuBOfSmXlaZ1kYusP/DW7j+ve2DWHzrQldLBkNBlGKLkaf
         dvtBMVbj15sCFrCIKEpRoc/ei+6FsHLR9umcMm/86ebJb3SkQmjhHoXz4/rpC9DBZQk2
         BLO6lMkM/b4e0T+7pf8oG2nEV7T2AxYsnZQFB3examjwsz8QLpLKGdFG0+0c+NtysasS
         CYKCTAh2w9uJKuHayw+WzYLw9h3hm/qkQmGGIj+DQPrqwKm4F/VPGPsAbf7hRqhIGCGw
         a/E+wYqzLKdDK7UuXBh1BojmBZ4BoNI2capTBUcZBVJnNnhjSSbfRTCpaA+3kxa72HK6
         /ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862145; x=1756466945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAj4MTsX9crtFaSUyO+PrnGMFjFfbBShLF1OedjML3o=;
        b=RG6HcynbXXj9EPnmKCw+Da91P0b85RLGFEXTAZCWVYPhmZ80Ie+3EwsLxD8BrynVip
         usBjm90mnDvPYmPlRRT3xgX60zb9ydFqik+WhASiuQycu4D0BDbwGprf+HVnhzPfVQyj
         VvkBPE7Ipnitj/T2K/trXG3W0xCAI0HrnknJvU9OwrrNyIhUFxRmFrz1zKbuKwI3UZSN
         lXXXdr3OqMQA+9m1eBpmtnBiN9E2fPuX2khxc/gzuroJW+RY+YPt7sqqu95QOIinA0nA
         H1LrcSTX/BQrGZExPGi+UPnSfLGc1z9kogu3Kj/Ew/9xQKbHJpgtrosag8HoefW98gM1
         c+4w==
X-Gm-Message-State: AOJu0YzGpKClwnwPgaAPWVnc7Hq+v4EqKeHGDwhsumQWEgGAURNoAEHb
	KyOOWxZP7iyF4Q2Mgvj0CfgwScVUrsmFVppAZsyo4gA7cpuOxOGUQsynqffrTQK38Fk9JbF1UF2
	NM/hzEP3mm2lX+t/IpOue3xb5rVu4xovnniAJEBVSVA==
X-Gm-Gg: ASbGncua83tITqA69yepajz8tzceao0nHjISOtRBawdczFya1SWKzzrsqDxnqFMOiKv
	oo0FTKXeS2RoyDAXVkkP2gS1N6oxyUrb4+n3CZ4n86e7fEY+8UmTwr1Os4aGNz7WUah3KpF8hIL
	oEwYG5lRQlKW105ASWfBxcDq7PiPqXVzCsoAf575MCndw02cVGCL4ZbMMvhyaJh6Lxp3Wf3EMXC
	JcmlB0m
X-Google-Smtp-Source: AGHT+IFotCEaG3Imylyjy2m0DQxnH2th5L/KRoKnw2C+LytW2vVJKqgXGAwa/u5DAm0MxjMWmuNiRe1PyZgcFc/tw+c=
X-Received: by 2002:a05:6e02:2284:b0:3e9:e4ca:8f0a with SMTP id
 e9e14a558f8ab-3e9e4ca9b34mr9579755ab.25.1755862145223; Fri, 22 Aug 2025
 04:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:58:52 +0530
X-Gm-Features: Ac12FXzA7OqPPvuSEUi3YmGf4O7XQNOfsrf-wXEXFi1rcASEvUu6djRNFKE82bo
Message-ID: <CAAhSdy1OcQBgV6T5z0K5mMv9pr23_oVVEJpimdzDjgAN3BhYeg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_122909_144148_3F1CC89F 
X-CRM114-Status: GOOD (  13.45  )
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA0OjI04oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHVzZXJzcGFjZSBsb2FkIGNhbiBwdXQg
dXAgdG8gMjA0OCBiaXRzIGludG8gYW4geGxlbiBiaXQgc3RhY2sKPiBidWZmZXIuICBXZSB3YW50
IG9ubHkgeGxlbiBiaXRzLCBzbyBjaGVjayB0aGUgc2l6ZSBiZWZvcmVoYW5kLgo+Cj4gRml4ZXM6
IDJmYTI5MDM3MmRmZSAoIlJJU0MtVjogS1ZNOiBhZGQgJ3ZsZW5iJyBWZWN0b3IgQ1NSIikKPiBD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBhcyBhIGZpeCBmb3Ig
TGludXgtNi4xNwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Zl
Y3Rvci5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfdmVjdG9yLmMKPiBpbmRleCBhNWY4OGNiNzE3ZjMuLjA1ZjNjYzJkOGUzMSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV92ZWN0b3IuYwo+IEBAIC0xODIsNiArMTgyLDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X3Nl
dF9yZWdfdmVjdG9yKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4g
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmVnX3ZhbDsKPgo+ICsgICAgICAgICAgICAg
ICBpZiAocmVnX3NpemUgIT0gc2l6ZW9mKHJlZ192YWwpKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICBpZiAoY29weV9mcm9tX3VzZXIo
JnJlZ192YWwsIHVhZGRyLCByZWdfc2l6ZSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FRkFVTFQ7Cj4gICAgICAgICAgICAgICAgIGlmIChyZWdfdmFsICE9IGNudHgtPnZlY3Rv
ci52bGVuYikKPiAtLQo+IDIuNTAuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
