Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9130C5B552
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 04:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtyRFahehYGRczS5aN0hwHC0Q7ypKigBPrfzD7GErHY=; b=l3SELcacd8FM1v
	elgtC3ynRAA+DkWbPdfUbYzoj+Vj4O86sV0rNS/FnzN/Ys5+OEe5zeUWLrjerVbeoDzwY5zRqo8Ik
	rmC13pZcIgKP3D9Nl3oDnPLEXVOtReJzthrrJu9UVeKSoMVDNhItszFNAH6FltRxjX0w1s3tGuPcB
	xOLO+KXxEU+6yxdxQqG5keqX9qIiPK6IMWMS4d+POGDTp2nHtoeXqBVw24SluWnrQ2vN87F8pIYUu
	64MtMQLfPSO6laelY957mNW3+u/kRfIxishedKRGkRcqK1thPUIb6mNroH4TUQqiTG3spvsNZdecU
	HYbpm4xFuDmepTV1xrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUMF-00000003QVS-2ZT1;
	Mon, 09 Jun 2025 04:43:39 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUMD-00000003QUe-1vZZ
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 04:43:38 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso12693085ab.2
        for <kvm-riscv@lists.infradead.org>; Sun, 08 Jun 2025 21:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749444216; x=1750049016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQQ7TbohytoS1WSMjMWeTE196VOLo8ZyRtVEZ0jt55Q=;
        b=YiF+7w3yQ2DmTJvcn9q+FCm7v0r6h17J3UTkoghas9UyPVoUbarQBmCQTLwJaA2Rko
         ues2tsXEdvpUzH8t/ubH0PspTp4LeMMI8MiAlPVPbMLxjJqABR3Wk6jsAh3p6N9Ud5jP
         gHuVv9k2fqrtDU/iFpR7aFC8jtPOLAIKvx80z8/V4vPQ2pYIlkrM16mBxgoE90pI01AO
         3UVqZIf2mWTeGfngnD2QpD4z63qSWv14Y8MI6qHwIIFR5l7CoGub4KIwxO160/DbryQQ
         dhUIKNXGV5z3y6PT3P6iBSjRr3RgCPhmJHocxxjoXuADz/cW4eh5viBWyqF5OM47TB6u
         NREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749444216; x=1750049016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQQ7TbohytoS1WSMjMWeTE196VOLo8ZyRtVEZ0jt55Q=;
        b=YnaHm+7RmactBF4aMkKZEz1W7uC8jjwxN41PsArDH8IZyVpRyrHm9DcrupoicBMiQm
         qBUmSleaiquSvWfvYfWJ+x5TBb+XejBUSDh/26f992fDLGYFPFqjpYVlOILZgx6Y6dBe
         k8A2zLP+NMA9XlxQ85uZFEbCN12ZMjzY11Pkx45SMbDudLc9S8VRcDKnJl7J3bQZ34u9
         F4h9WJ8W0SzKal+KxnQN//DalshQTK/5GyVykHC9Y9aaqElxx2yA+w5z8vTkX4jolDKE
         FRM0L/2O2NsfwLa6zGj/7pbepJc1iTEQR37F8M4cc1ImJeVIkGgGbVEJ1h2IjaqJouxl
         OUCA==
X-Forwarded-Encrypted: i=1; AJvYcCXeBWQBk4cGXUwlK0kErtQdF+FsW6ZNEZzjXSYTP7OimKHOYkeapf5SFhuGwwm7PokI07ZanL1WrsU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhPjV+8RtWJIGPjTeRcs1RIVaCDMKTH1OzkiA84JGiEXVaPQCv
	CjYER1GfrzZeHijJ0opRUgBi0aqYF5kK4yJcp1zgRzGqwf6qYG+MsNFpLppxx878Y59YUBKqdFA
	3UiqMtIfTebskgiMcJpIGPpasmcwSyb6e+cE6uMuyiQ==
X-Gm-Gg: ASbGncsaeyBbBdmRl7uRcmrtv438JUSo1HZ5mumMY7UVzY1/QEGH/dYwXMSEtTDuN5D
	oF5na/sjO1QQUTCD46F/rWSiaUiub6LA11GXy3T7asT1IJSdu2tudgEWrYsi7s7GpmH8TMkYaSh
	EGez+JJXU2sqZALGCbVaM7VF2opHDbPg3L3OEyqxdqlaYxO68GOPy7hdaAroViy8QCpd9O3Uyam
	/xojg9WIn/VZEY=
X-Google-Smtp-Source: AGHT+IEiT5Sw29VzR06/mvnFI1yGklPp8h7VXnxBQ4Lmq6+VmwASCk+pP5VvhvXXqY9B0VYHEp/vir28r/BOWJ/SLPw=
X-Received: by 2002:a05:6e02:16c8:b0:3dd:b726:cc52 with SMTP id
 e9e14a558f8ab-3ddce3cd206mr114422245ab.5.1749444216566; Sun, 08 Jun 2025
 21:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-3-apatel@ventanamicro.com>
In-Reply-To: <20250605061458.196003-3-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jun 2025 10:13:24 +0530
X-Gm-Features: AX0GCFt1fzaaBq3Mt6tIzl8UPp0uXSKLfg_c9BLRPnyCkszfqY1Fzs_Sfg2tTEM
Message-ID: <CAAhSdy1kRHEBoKMSd2OYWj6fHZHU1HQq+68-H3=cJGNTF=5WLg@mail.gmail.com>
Subject: Re: [PATCH 02/13] RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_214337_494994_3472E93D 
X-CRM114-Status: GOOD (  14.01  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMTo0NeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgc3BlY2lmaWNhdGlvbiBjbGVhcmx5IHN0
YXRlcyB0aGF0IFNCSSBIRkVOQ0UgY2FsbHMgc2hvdWxkCj4gcmV0dXJuIFNCSV9FUlJfTk9UX1NV
UFBPUlRFRCB3aGVuIG9uZSBvZiB0aGUgdGFyZ2V0IGhhcnQgZG9lc27igJl0Cj4gc3VwcG9ydCBo
eXBlcnZpc29yIGV4dGVuc2lvbiAoYWthIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBpbi1jYXNlCj4g
b2YgS1ZNIFJJU0MtVikuCj4KPiBGaXhlczogYzdmYTNjNDhkZTg2ICgiUklTQy1WOiBLVk06IFRy
ZWF0IFNCSSBIRkVOQ0UgY2FsbHMgYXMgTk9QcyIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgYXMgYSBmaXggZm9yIExpbnV4LTYu
MTYKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxh
Y2UuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2Uu
YyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IGluZGV4IDk3NTJkMmZmZmY2
OC4uYjE3ZmFkMDkxYmFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Jl
cGxhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IEBAIC0x
MjcsOSArMTI3LDkgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4KPiAgICAgICAgIGNhc2UgU0JJ
X0VYVF9SRkVOQ0VfUkVNT1RFX0hGRU5DRV9WVk1BX0FTSUQ6Cj4gICAgICAgICAgICAgICAgIC8q
Cj4gICAgICAgICAgICAgICAgICAqIFVudGlsIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBpcyBpbXBs
ZW1lbnRlZCwgdGhlCj4gLSAgICAgICAgICAgICAgICAqIFNCSSBIRkVOQ0UgY2FsbHMgc2hvdWxk
IGJlIHRyZWF0ZWQgYXMgTk9Qcwo+ICsgICAgICAgICAgICAgICAgKiBTQkkgSEZFTkNFIGNhbGxz
IHNob3VsZCByZXR1cm4gbm90IHN1cHBvcnRlZAo+ICsgICAgICAgICAgICAgICAgKiBoZW5jZSBm
YWxsdGhyb3VnaC4KPiAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9
IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKPiAgICAgICAgIH0KPiAtLQo+IDIuNDMuMAo+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
