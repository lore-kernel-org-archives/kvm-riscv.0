Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5041C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LseY7bwTZbh2d48wuFpeO2uOcRIgV7cOXZrwgX8M/yM=; b=UZPQbZ51tglDS0
	HQYwbRk2Rwz6O9noeionGnq1QYlCBbHHg1t5xBBTigR3mDr9d0SH6AQVz7nnSc56KTmiynWHEaTR9
	wzfGRiK7Pyum2di+61LlyLsR51zo5yf6edZUf31Lda+06ixkhJ7WHR0Q1GOw7+nR4iPkFoQF/e9NG
	e9KaUXnf/LU1GDEF/h/e2sKpX45tqeODbCNh6WYANcpT+nL+P/d+LldwIAvdpBgB51kJNUpVdrpUF
	n/gkDgMWi878tAFmjwnWIEzDg+pwD2lrFNqOS9Q5MGzQ1mWNY5IjQfgHhdFcWrGUHtpex9PyECBVV
	w5C6pR1nVEL3Z5wYjXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z4R-0000000EbxW-1gy8;
	Thu, 24 Apr 2025 16:05:03 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wv2-0000000EEwA-1O01
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:47:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-549963b5551so1007790e87.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745502430; x=1746107230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3YD6QCvd7lsKiSV7ufRGyj+FOXkAdczCjapnA2nC9A=;
        b=Ym3JQc4WqGA2VWfkmt5rndRim31DaGqGqpXOWyW2KW+lhZ8OM0yukMOc8KlpMLGgCH
         od2mnMYgFm1dYXrUMxLi/Ofn0RGLv4vW2TEz2pnYsYJdngWj3k4MsCBpMMrxektnsjKZ
         2/REi2EyGtC3VUk6bhIRndXhtMisqe2TI1HMSdZEwL8QU+FIcd2CcF1xR2N/nUXyyqro
         F/5N7vBCFvuPGAR+ObR0iUpuyUqIqSDVg9pP9zncto7cvDlvNbEeP07NL2o3+0EQMfsY
         C9pO/iOJwMUyPItHLitaW7iPVHPWcwkGgwnKvotzXftOaRH9uFGP0w9SoJNvYg5byOe7
         pQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502430; x=1746107230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3YD6QCvd7lsKiSV7ufRGyj+FOXkAdczCjapnA2nC9A=;
        b=PpB+BWEmDy62JfahGNsrU+bD9jUdUM0kfOmJ4XjxwQndsb01njQahTnyDDDVi5Jb8G
         XIFc9kqk5J4ECFXwLe9UfpRlaAlrmVg7aphZs4UjRDJXeyXwzKFBwKYMe3cma1Fz1wB1
         csxxPL+bbxBfiR3iPlIfvPQV4x2GOIiUFTTgt5Vd7CRt4zMcbf3l1Ap+TRLc//ylaQZx
         hkQlI8Tupge/y/N0mVGvcXu0Rm2utVfi+EKgprQVOsGCZQJD7mCkPBYig/s6vSO1j3pB
         IZI5Ak+U0lBBrJ6spl2m9ZdWAM7oCasLOY++x+80pTWOQre0vVZk/+hQ8R6Q3GCvDxEV
         Mefw==
X-Forwarded-Encrypted: i=1; AJvYcCU2ND9pAVIT7RAvh1xv9csYQbqyQWAezVJLhVJgQLkDE2Ttc/ZeswR60drn21cb2TPk2vrVawm4+9E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCsghJ+FUmXmQj8Kg/vwU2IWcDBSCUpjgJPE1GD/zY4cGtJ1Hu
	TT/9iZnAA1LzNcmL330GluOLwzFs5HFarfJ+IFciaSjRCcjMK7Xft6Iks80eaPbUxwHNz1dYMWa
	Zu1w/UTX0Kv9iCU9gQx6kq50y5cmSfj+bOhnQBQ==
X-Gm-Gg: ASbGnctHbjz1Evpj/FfR5rIoRUaft/wBU7GmNPZCPfj5Q/tumT7JfxOIWIKWjk+uxMU
	4vBPpnPXS2fO8XqOTsvivbkuI5LDhv72exUojOx7F98O/WgSEL7MiEmq8uz2p9juMBW1d//s5Hc
	SAiuDjDYhL5XxLMJf7chNxR0o=
X-Google-Smtp-Source: AGHT+IGL5CKF7ZLlLOWTXNNHFd3UwB7l1rF5cmuzc7sms6njciyjq1qG2ai0cN8XyaEtFTQLti7jBl0lyb+h3lPX9I0=
X-Received: by 2002:a05:6512:1598:b0:549:8f47:e67d with SMTP id
 2adb3069b0e04-54e7c3fdbd2mr886419e87.34.1745502430166; Thu, 24 Apr 2025
 06:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-10-apatel@ventanamicro.com> <20250412-6eb18b693df1bd8959bcdfc6@orel>
 <CAK9=C2XD2Zk98KJrPYqseVQO-m_tFA97r=eXb2XXJ10vpxuk=A@mail.gmail.com> <20250424-6f042bf5e7c2433d9df6cd11@orel>
In-Reply-To: <20250424-6f042bf5e7c2433d9df6cd11@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 24 Apr 2025 19:16:57 +0530
X-Gm-Features: ATxdqUGyKgYvqFYuWeIiCm7KejgIGr1ToUBN0bphOPv_rE7-cEmyC-W0lHkvFuU
Message-ID: <CAK9=C2U35Z2Q3q9jOVK2tkvUf5FXpN0+__3E8Gi8s6CLYdVM2Q@mail.gmail.com>
Subject: Re: [kvmtool PATCH 09/10] riscv: Add cpu-type command-line option
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_064712_372015_3CB77AD0 
X-CRM114-Status: GOOD (  40.36  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNjo1OeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDY6Mjc6
MzVQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDEyLCAyMDI1IGF0
IDY6NDXigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTI6MjY6NDNQTSArMDUzMCwgQW51
cCBQYXRlbCB3cm90ZToKPiAuLi4KPiA+ID4gPiArICAgICAgICAgIWluZm8tPm1pbl9jcHVfaW5j
bHVkZWQpCj4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4KPiA+ID4gSWYg
J21pbl9jcHVfaW5jbHVkZWQnIChvciAnbWluX2VuYWJsZWQnKSBpcyBhbGwgd2UgcGxhbiB0byBj
aGVjayBmb3IKPiA+ID4gd2hldGhlciBvciBub3QgYW4gZXh0ZW5zaW9uIGlzIGVuYWJsZWQgZm9y
IHRoZSAnbWluJyBjcHUgdHlwZSwgdGhlbgo+ID4gPiB3ZSBzaG91bGQgd3JpdGUgdGhpcyBhcwo+
ID4gPgo+ID4gPiAgaWYgKCFzdHJjbXAoa3ZtLT5jZmcuYXJjaC5jcHVfdHlwZSwgIm1pbiIpKQo+
ID4gPiAgICAgcmV0dXJuICFpbmZvLT5taW5fZW5hYmxlZDsKPiA+ID4KPiA+ID4gT3RoZXJ3aXNl
IHdoZW4gbWluX2VuYWJsZWQgaXMgdHJ1ZSB3ZSdkIHN0aWxsIGNoZWNrCj4gPiA+IGt2bS0+Y2Zn
LmFyY2guZXh0X2Rpc2FibGVkW2luZm8tPmV4dF9pZF0uCj4gPgo+ID4gVGhlIGV4dGVuc2lvbnMg
cGFydCBvZiAibWluIiBjcHVfdHlwZSBjYW4gYmUgZGlzYWJsZWQgdXNpbmcKPiA+ICItLWRpc2Fi
bGUteHl6IiBjb21tYW5kLWxpbmUgb3B0aW9ucyBoZW5jZSB0aGUgY3VycmVudCBhcHByb2FjaC4K
PiA+Cj4KPiBTaG91bGRuJ3Qgd2UganVzdCBoYXZlIGEgc2luZ2xlIHBsYWNlIHRvIGNoZWNrPyBP
dGhlcndpc2Ugc29tZXRoaW5nIGxpa2UKPiB0aGlzIG1heSBub3Qgd29yayB0aGUgd2F5IHRoZSB1
c2VyIGV4cGVjdHMKPgo+ICAgLWNwdSBtaW4seHl6IC0tZGlzYWJsZS14eXoKClllcywgYWRkaW5n
ICJ4eXoiIGV4dGVuc2lvbiB0byAibWluIiBjcHUtdHlwZSBhcyBjb21tYSBzZXBhcmF0ZWQKdmFs
dWUgYW5kIHRoZW4gZGlzYWJsaW5nIHVzaW5nIC0tZGlzYWJsZS14eXogbG9va3Mgc2lsbHkgYnV0
IHRoZSBpbnRlbnRpb24KaGVyZSBpcyB0aGF0IC0tZGlzYWJsZS14eXogb3B0aW9ucyBzaG91bGQg
d29yayBtaW4gY3B1LXR5cGUgYXMgbG9uZyBhcwp4eXogaXMgaW5jbHVkZWQgaW4gbWluIGNwdS10
eXBlLgoKVGhpcyB3aWxsIGhlbHAgaW4gZnV0dXJlIGlmIHdlIGRlY2lkZSB0byBhZGQgIm1pbl92
MiIgb3IgIm1pbisrIgpjcHUtdHlwZS4KCj4KPiBTb21ldGhpbmcgbGlrZSB0aGF0IG1ha2VzIHNl
bnNlIGlmIHlvdSBoYXZlIGEgcnVua3ZtIHNjcmlwdCBsaWtlIHRoaXMKPgo+ICAgIyEvYmluL2Jh
c2gKPiAgIEJBU0VfQ1BVPW1pbix4eXoKPiAgIGxrdm0gLi4uIC1jcHUgJEJBU0VfQ1BVICRACj4K
PiBhbmQgdGhlbiB5b3UgaW52b2tlIGl0IHdpdGgKPgo+ICAgcnVua3ZtIC0tZGlzYWJsZS14eXoK
ClRoaXMgaXMgYWxzbyBhIHBvc3NpYmxlIHdheSBvZiB1c2luZyB0aGlzIGJ1dCB0aGlzIHdhcyBu
b3QgbXkgaW50ZW50aW9uLgoKPgo+ID4gPiA+ICAgICAgIGJvb2wgICAgICAgICAgICBzYmlfZXh0
X2Rpc2FibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07Cj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+
ID4gPiAraW50IHJpc2N2X19jcHVfdHlwZV9wYXJzZXIoY29uc3Qgc3RydWN0IG9wdGlvbiAqb3B0
LCBjb25zdCBjaGFyICphcmcsIGludCB1bnNldCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICAjZGVmaW5l
IE9QVF9BUkNIX1JVTihwZngsIGNmZykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ID4gPiAgICAgICBwZngsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgIE9QVF9D
QUxMQkFDSygnXDAnLCAiY3B1LXR5cGUiLCBrdm0sICJtaW4gb3IgbWF4IiwgICAgICAgICAgICAg
ICBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICJDaG9vc2UgdGhlIGNwdSB0eXBlIChkZWZh
dWx0IGlzIG1heCkuIiwgcmlzY3ZfX2NwdV90eXBlX3BhcnNlciwga3ZtKSxcCj4gPiA+Cj4gPiA+
IEkgaGFkIHRvIGxvb2sgYWhlYWQgYXQgdGhlIG5leHQgcGF0Y2ggdG8gdW5kZXJzdGFuZCB3aHkg
d2UncmUgc2V0dGluZyBrdm0KPiA+ID4gYXMgdGhlIG9wdCBwb2ludGVyIGhlcmUuIEkgdGhpbmsg
aXQgc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBuZXh0IHBhdGNoCj4gPiA+IHdoZXJlIGl0J3MgdXNl
ZC4gQWxzbywgd2UgZG9uJ3QgdXNlIG9wdC0+dmFsdWUgc28gd2UgY25hIHNldCB0aGF0IHRvIE5V
TEwuCj4gPgo+ID4gV2UgYXJlIGluZGVlZCB1c2luZyBvcHQtPnB0ciBpbiB0aGlzIHBhdGNoIHNv
IHdlIHNob3VsZCBiZSBwYXNzaW5nCj4gPiBrdm0gYXMgb3B0LXB0ci4KPgo+IE9oIHllYWgsIEkg
c2VlIHRoYXQgbm93Lgo+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Jpc2N2L2t2bS5jIGIvcmlzY3Yv
a3ZtLmMKPiA+ID4gPiBpbmRleCAxZDQ5NDc5Li42YTFiMTU0IDEwMDY0NAo+ID4gPiA+IC0tLSBh
L3Jpc2N2L2t2bS5jCj4gPiA+ID4gKysrIGIvcmlzY3Yva3ZtLmMKPiA+ID4gPiBAQCAtMjAsNiAr
MjAsOCBAQCB1NjQga3ZtX19hcmNoX2RlZmF1bHRfcmFtX2FkZHJlc3Modm9pZCkKPiA+ID4gPgo+
ID4gPiA+ICB2b2lkIGt2bV9fYXJjaF92YWxpZGF0ZV9jZmcoc3RydWN0IGt2bSAqa3ZtKQo+ID4g
PiA+ICB7Cj4gPiA+ID4gKyAgICAgaWYgKCFrdm0tPmNmZy5hcmNoLmNwdV90eXBlKQo+ID4gPiA+
ICsgICAgICAgICAgICAga3ZtLT5jZmcuYXJjaC5jcHVfdHlwZSA9ICJtYXgiOwo+ID4gPiA+ICB9
Cj4gPiA+Cj4gPiA+IEhtbSwgc2VlbXMgbGlrZSB3ZSdyZSBtaXNzaW5nIHRoZSByaWdodCBwbGFj
ZSBmb3IgdGhpcy4gQSB2YWxpZGF0ZQo+ID4gPiBmdW5jdGlvbiBzaG91bG4ndCBiZSBzZXR0aW5n
IGRlZmF1bHRzLiBJIHRoaW5rIHdlIHNob3VsZCByZW5hbWUKPiA+ID4ga3ZtX19hcmNoX2RlZmF1
bHRfcmFtX2FkZHJlc3MoKSB0bwo+ID4gPgo+ID4gPiAgIHZvaWQga3ZtX19hcmNoX3NldF9kZWZh
dWx0cyhzdHJ1Y3Qga3ZtX2NvbmZpZyAqY2ZnKQo+ID4gPgo+ID4gPiBhbmQgc2V0IGNmZy0+cmFt
X2FkZHIgaW5zaWRlIGl0LiBUaGVuIGFkZCB0aGUgY3B1X3R5cGUgZGVmYXVsdAo+ID4gPiBzZXR0
aW5nIHRvIHJpc2N2J3MgaW1wbC4KPiA+Cj4gPiBSZW5hbWluZyBrdm1fX2FyY2hfZGVmYXVsdF9y
YW1fYWRkcmVzcygpIGlzIGNlcnRhaW5seSBub3QKPiA+IHRoZSByaWdodCB3YXkgYmVjYXVzZSBp
dCBoYXMgdG8gYmUgZG9uZSBhZnRlciBwYXJzaW5nIG9wdGlvbnMKPiA+IHNvIHRoYXQgd2Ugc2V0
IHRoZSBkZWZhdWx0IHZhbHVlIG9mIGNwdV90eXBlIG9ubHkgaWYgaXQgaXMgbm90Cj4gPiBzZXQg
YnkgY29tbWFuZC1saW5lIG9wdGlvbnMuIER1ZSB0byB0aGlzIHJlYXNvbiwgdGhlCj4gPiBrdm1f
X2FyY2hfdmFsaWRhdGVfY2ZnKCkgaXMgdGhlIGJlc3QgcGxhY2UgdG8gc2V0IGRlZmF1bHQKPiA+
IHZhbHVlIG9mIGNwdV90eXBlLgo+Cj4gQ2FuJ3Qgd2UganVzdCB1bmNvbmRpdGlvbmFsbHkgc2V0
IGt2bS0+Y2ZnLmFyY2guY3B1X3R5cGUgdG8gIm1heCIgaW4KPiBrdm1fX2FyY2hfc2V0X2RlZmF1
bHRzKCkgYW5kIHRoZW4gaWYgdGhlIGNvbW1hbmQgbGluZSBwYXJzaW5nIGRldGVybWluZXMKPiBp
dCBzaG91bGQgYmUgb3ZlcnJpZGRlbiBpdCBnZXRzIHJlYXNzaWduZWQ/Cj4KPiBBY3R1YWxseSwg
ZG9lcyBjcHVfdHlwZSBuZWVkIHRvIGJlIGEgc3RyaW5nPyBJZiB3ZSB1c2UgYW4gZW51bSBmb3Ig
aXQKPiB3ZSBjb3VsZCBzYXZlIG91cnNlbHZlcyBzb21lIG9mIHRoZSBzdHJjbXAgcGFpbi4KPgoK
R29vZCBzdWdnZXN0aW9uLCBsZXQgbWUgdHJ5LgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
