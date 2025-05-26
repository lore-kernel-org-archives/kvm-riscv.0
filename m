Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EFEC54FB3
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1Isxa0PnsvKSW5v4QTqSuGV79JSy5poNlTOxyGA6TE=; b=Xoov/pxpOQ3+QE
	REkiR8n2HsH42fw1GZgBi3DxaB57FupclwOSTERk2haTkuznWtl12DzBlbR+hbAOt1PjIePpZ0ZpW
	XE4xYxrrKd9Am/eTrPQvjWuOicC6XN+Lr/ZqWw+w7+piK26VX8QOB7X4i7X/KwZE4zkoCT0JDlFix
	KtbU/ti9tHygKFB9MP0HejbBgdwnd9V8LXqhguRTb1dXLN8eQsFrOcNrbhTJpiwqLR3ll9aWMzKzb
	xJxPFhBhMd/gNNK/ZcsrTEPRMebtzjkhHBiNuqp3wljuQI0rcrSqcNZ67pEGrNqma+osA5m5BM33C
	Fyod0bLvyYw89dtzKKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTfY-00000008Rhj-2RXH;
	Mon, 26 May 2025 08:58:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTfW-00000008RgJ-0S0z
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 08:58:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cee550af2so418055e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748249928; x=1748854728; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=kOcUkirAeqjXT7Fb2zsdmHeIGPaxpNGpgcywJ1oPA13zVh7BcvAOp1b/l+Jkic1j09
         O6OrG/DrRwYbGrPPV91a7qK6EFWauvgPeKL6XGLWdQRYdQbYNXkLScFqQPwnTf2RQMY1
         N1IElwa4BopNDu/068AqZreNu/E25swyzhboHEB9xl9ZO2EJWTSbg0beBjcr+6ypYZw8
         +I3CNueXdU4D//KaUhm2HKxQ9ADtxWyHrg+vKnQcx48JXd+iHEWm1ImCC9H028DLcU+2
         RGG/vfoiAVHesDrj18I+HeE2sz0ga9tj/LE8svxhdL36I+ZV9aPId7j3kn7eTDRO7Fon
         0dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249928; x=1748854728;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=d11vZiUo7WKMzVufVsrv0j1ut1DIToaiS96qkddDl4h/qNi01vh141f0a/s5oGXPUJ
         1TpcytgJWZTUZ+LXaCwetMSdv/KyIJ6+nm8J3cTY9yAV1XNe+CGpAGGodqNCeQzsfRYS
         x4mBLdTgru8Jm4j+mMkYcyvaqcXcg2oWW8NmTctdOuI5y/B5mp6hrdQh+19yW02orIX4
         cIONa8O4hLrqm8pr+jplt1jN5+KHrptLuND0LFth962Pco+F/A4VCmjfLH9s9txcR0fB
         19V66W3tYBxB9EIpUVN5uKDEn6M/DdwL7F6Tbvo1xI7bwUVnOyIwfDJtZMG/6lO6NJIc
         zQzw==
X-Forwarded-Encrypted: i=1; AJvYcCUBnnnalf8hekgyZ1HxtwcvXB1ZiYVFHPNdjqX95Y4TqgWBYFVzHAbtPmftKgUNItgtXel3mZq+eAg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhq+Z495CeV/lOD1vutJVdooWv/uC/zUwLgbXWdM4ZSJxjkSZq
	7/nJFEUFI9Irj4UK0UhSseVAjuqkUqGnu55oZrLh4EzrlrowE+n/1BYoFrvx51+7jrw=
X-Gm-Gg: ASbGnct7lBxtK2F2lniEPEJY52k+tmSiKUxu8XJqPPlf6XL0qN63ICd2peixbbPc7eR
	R+mnOltNGNmnKi1f7hBXr5VAEBM7MqbO0IIh32HREhetH8RAG752KoqWOyVP/2ZlMHPZXl54L9V
	hj475iQ0UvOO9lVxgL1ZD3sMeTY0Cjihw5DetnyT4xXwHHzmIUYhwd3eMKRH3N9JPRxqgIIgptc
	cEW342H45d3iOhffYApIYcbZFLMtziBGcHLawCLkrmdicA9/dpxSQA+9oHWdcih0jkuS1tWfIgs
	78rVHtNUFkT5W53VqicaxtWHizfbLJ6FMvtKrYvjXYFDqHtfq9No/glFJDk=
X-Google-Smtp-Source: AGHT+IEdx9Lxmxr6Jj4a/VtrbY6n55+AjozaESSFCcKKfyGvvRTO9hEvIbHH5Dnsj/C495VBfSOibw==
X-Received: by 2002:a05:600c:1c24:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-44c938cb1e6mr27073595e9.7.1748249927727;
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d007bbccsm5654781f8f.89.2025.05.26.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 26 May 2025 10:58:46 +0200
Message-Id: <DA5YVKW682V3.2DODRY4EDL3IW@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>,
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup
 Patel" <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Shuah
 Khan" <shuah@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
 <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
 <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
In-Reply-To: <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_015850_137282_AE7CE44D 
X-CRM114-Status: GOOD (  12.10  )
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

MjAyNS0wNS0yM1QxMTowMjoxMS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8yMy8yNSA5OjI3IEFNLCBSYWRpbSBLcsOEbcODwqHDhSB3cm90ZToKPj4g
MjAyNS0wNS0yM1QxNzoyOTo0OSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPj4+IElzIHRoaXMgc29tZXRoaW5nIGJsb2NraW5nIHRob3VnaCA/IFdlJ2QgbGlr
ZSB0byBtZXJnZSBGV0ZUIG9uY2UgU0JJIDMuMAo+Pj4gaXMgcmF0aWZpZWQgc28gdGhhdCB3b3Vs
ZCBiZSBuaWNlIG5vdCBkZWxheWluZyBpdCB0b28gbXVjaC4gSSdsbCB0YWtlIGEKPj4+IGxvb2sg
YXQgaXQgdG8gc2VlIGlmIGl0IGlzbid0IHRvbyBsb25nIHRvIGltcGxlbWVudC4KPj4gCj4+IE5v
dCBibG9ja2luZywgYnV0IEkgd291bGQgYXQgbGVhc3QgZGVmYXVsdCBGV0ZUIHRvIGRpc2FibGVk
LCBiZWNhdXNlCj4+IGN1cnJlbnQgdXNlcnNwYWNlIGNhbm5vdCBoYW5kbGUgWzE0LzE0XS4gIChX
ZWxsLi4uIHNhdmUvcmVzdG9yZSB3YXMKPj4gcHJvYmFibHkgYnJva2VuIGV2ZW4gYmVmb3JlLCBi
dXQgbGV0J3MgdHJ5IHRvIG5vdCBtYWtlIGl0IHdvcnNlLiA6XSkKPj4gCj4KPiBVc2VyIHNwYWNl
IGNhbiBub3QgZW5hYmxlIG9yIGRpc2FibGUgbWlzYWxpZ25lZCBhY2Nlc3MgZGVsZWdhdGlvbiBh
cyAKPiB0aGVyZSBpcyBubyBpbnRlcmZhY2UgZm9yIG5vdyByaWdodGx5IHBvaW50ZWQgYnkgeW91
LgoKSSBtZWFuIHNldHRpbmcgZGVmYXVsdF9kaXNhYmxlZD10cnVlIGFuZCBqdXN0IGRpc2FibGlu
ZyBGV0ZUIGZvciB0aGUKZ3Vlc3QgdW5sZXNzIHVzZXJzcGFjZSBleHBsaWNpdGx5IGVuYWJsZXMg
dGhlIGluY29tcGxldGUgZXh0ZW5zaW9uLgpXZSB3b3VsZCBibGFtZSB0aGUgdXNlciBmb3Igd2Fu
dGluZyBtdXR1YWxseSBleGNsdXNpdmUgZmVhdHVyZXMuCgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEkgZ3Vlc3Mgc3VwcG9ydGluZyAKPiB0
aGF0IHdvdWxkIGJlIHF1aWNrZXIgdGhhbiBmaXhpbmcgdGhlIGJyb2FkZXIgZ3Vlc3Qgc2F2ZS9y
ZXN0b3JlIAo+IGFueXdheXMuIElzbid0IGl0ID8KClllcy4gIFRoZSBzYXZlL3Jlc3RvcmUgZm9y
IEZXRlQgaXMgc2ltcGxlIChpZiB3ZSBkaXNyZWdhcmQgdGhlCmRpc2N1c3Npb25zKSwgYnV0IGRl
ZmluaXRlbHkgbW9yZSB0aGFuIGEgc2luZ2xlIGxpbmUuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
