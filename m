Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C35FC6160
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGIi8F5Es3zzDthenlUO6Duagh3eaF/K0HCz+YerSho=; b=WWEZWr183XutRX
	cmWh9L4YPoWxBOTht3AqDKWCJW6fgKRGMPvlU/0HfNBCLNeDlk5knN+GYF/cIfvYe6nEx2eNoI+Ro
	FvWRQQ1Bv8j/sDoV1SGx/JTqcylUDhH3XoGJL4JHTyi2BnYwtMMTXKZXpau+yOZq1hzegqMbArR6K
	h42FgosB/OFSyyuHLCqqhX8XuN/4Q/y/5l4XaTEFPP+QUWyXzoz1eABtwsJqizhwDLgCvnw/7RyTE
	TfojJj8ChEKiRJc+lRyAABLnFMVchI/51dCGTxK1TBl21WYhi/uY+t6BErbMJII1y9OrIBvVr+NUA
	+Q04bX5kiHnUd/zEjbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2tY-00000009PiV-0QGl;
	Sat, 03 Jan 2026 14:46:20 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2tT-00000009Phe-06MT
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 14:46:17 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso115739081fa.1
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767451572; x=1768056372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rNP0amHfQZI+Bt5JBFPQlAXbRaSEgN4u2DbQlN2RHg=;
        b=eHASoHJgzyILoi/y112aIBLjOCUVmPgLUJw2BqFkcA5lIX3FvsgyJcDSaDbtyFgrnP
         iXXRwRQq9MrAAcXb1WKPFjYhNcAWcUC7hHTXYfk7v8asUCakbxCxtxEcb1xeVe+nRwuA
         G+K5KIoYruyXP5K7/z64VgsZTMDhRxVSK9Xnt+iLzRAqdmlDYQL1MuT5E2ynk0i72anu
         QSowZtp27FJM7LFayxPKWIMsFSGr16OzFkH84MWI6X5YNwoDAUHm4dLQQX+dVlqt7Lya
         pUnRUOZQ7nPVNkA6ANThHtZacBxOlQnqKEcxrv69hsF4sWgp7UXZ545gneJr/BOPwTV5
         zTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767451572; x=1768056372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1rNP0amHfQZI+Bt5JBFPQlAXbRaSEgN4u2DbQlN2RHg=;
        b=d6M2A2SF4aa8bcdjb1079VfjZsD9+1217V1mWtxpaxyzDpi3ARsovRrHsJdfxXyJgY
         /qHXt0yiudvr4Ah9bg7WCzjO1LjGYK5wWIKv+av6njYl1hQv4+VjL68mbOiscqHmJjSF
         RAlYkxsKEbJg/veDRol7pKBWW+n9O8y+aEIPuFqi18MRob41n2iWiSn4twgfXyC4+cCM
         Szvcy/zvZbomFMsNsNPJdxJ7TnYGacqCG3kl0JQ1DYFSiunJs2qqQ168qBxYxD2K143u
         INw/EDRMmS5mjyf4QVSrE2T+HEXV+0Y86zDU428f0/RfObAHcpjTfvzBvCqzKWbIMjqA
         PXpA==
X-Forwarded-Encrypted: i=1; AJvYcCXWvPc2dJBHjmlXvP6ecrSAIDQjpQbI48JwxsjCg0lrV1RyeumnViTntT0LAJ7uf4KwkKFezKR3Z1Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxPjoQ/Ex9SGqABl5WV2W/n2/p+ndHH1JQiLyujj1hS+RoYXGK
	Mw/olLbbU5cMLKNAnSjcUgTBcgIJVhglyMcq2uoqF2reYqFbfss3brM3Z9uFUeosY78LYwjFqoQ
	bbdgmiIsLTLzfHPuEL4c00mjf1Waq0fe2n/VcsRAdnlJSrd0yeU3cf5s=
X-Gm-Gg: AY/fxX5tDdkqGsc6FWGVIAAj6wWGH/1QmowQzWjRWPFbdKDQjtmwpntvTbhmzUSfZhQ
	BvuiDZqCwllPEmMFrmtS4e9wBd6e4t9iSwACvXfg6XcGgId9si8ru9joQmL141Ugsf7mGeyubLK
	AKxVG87ZCjowcE5yk3z1vkUgb5zc/70Cc0+MCWr3SEqiAwa2SYjrVMP1F/shX/jXpUJcsWUhwMV
	FAvlapL9urWgvMp1yC3lhLrCcLl6GAZcrUVLCRkM1yANJngaSd3iy8Qi+5JUCFW3jmoWkhfvkQA
	zxjxargRLpssOc4K7oihhNG3BDxI
X-Google-Smtp-Source: AGHT+IF7eF6cn+HX5XYXj+oXYPZdeoxSmdOgiJeCygugV4mMTsAnlrOB1uBjUgSKh5J2mzU4hEupTp4yBLk/voocWR4=
X-Received: by 2002:a2e:a883:0:b0:37b:8d78:e4bf with SMTP id
 38308e7fff4ca-381216747bemr111199151fa.43.1767451571724; Sat, 03 Jan 2026
 06:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com> <20260103094501.5625-2-naohiko.shimizu@gmail.com>
In-Reply-To: <20260103094501.5625-2-naohiko.shimizu@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Jan 2026 20:16:01 +0530
X-Gm-Features: AQt7F2r6vAqM7C6IoN6U2-LtJjI5r5Bvxkcv5JqaaOeR5ZkwLpMsZJFGBVlH8g0
Message-ID: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_064615_073028_E7C73A9D 
X-CRM114-Status: GOOD (  11.95  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCAzOjE24oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKClBsZWFzZSBhZGQgYSBkZXRhaWxlZCBjb21taXQg
ZGVzY3JpcHRpb24gYWJvdXQgd2h5IHRoZQpuZXcgd2F5IG9mIHByb2dyYW1taW5nIHN0aW1lY21w
IGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgp3aGF0IHRoZSBjdXJyZW50IFByaXYgc3BlYyBzYXlz
IGluIHRoaXMgY29udGV4dC4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW9oaWtvIFNoaW1penUgPG5h
b2hpa28uc2hpbWl6dUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItcmlzY3YuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBpbmRleCA0ZDdjZjMz
ODgyNGEuLmNmYzRkODNjNDJjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBA
QCAtNTAsOCArNTAsOSBAQCBzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQodW5zaWdu
ZWQgbG9uZyBkZWx0YSwKPgo+ICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNj
dl9zc3RjX2F2YWlsYWJsZSkpIHsKPiAgI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+IC0gICAg
ICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZG
KTsKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUCwgVUxPTkdfTUFYKTsK
PiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIG5leHRfdHZhbCA+PiAz
Mik7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfdHZhbCAm
IDB4RkZGRkZGRkYpOwo+ICAjZWxzZQo+ICAgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NU
SU1FQ01QLCBuZXh0X3R2YWwpOwo+ICAjZW5kaWYKPiAtLQo+IDIuMzkuNQo+Cj4KClJlZ2FyZHMs
CkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
