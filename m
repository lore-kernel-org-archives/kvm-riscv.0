Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8CCC83F17
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+Mbdj5b8BWXgMQntTn9uGS2O13ZjeVEiUmWzwCPz4Y=; b=bBZbEx8RWt3+c1
	EuVgHaduotEApCHh0V19dehcfofrbd2MHrW+NdOJscPu6UYXu7G4yLdxLD+wy6fFKJ6ZvJwcHuOWB
	LMIpKZnrnrtgxHPm95VLSX0bYmop72nwzpIBnjBA/cLqdK8979yBitmC5wCX8vGc1hPiEyAx9yg0U
	xE0gjDFjQJpsYNPJLA+OzDWyoDxAP+XnJiyQbxVZTTgG40fdmDIm45W49oPFWgmPVVHqAhqz5LSmc
	/JBstrTzBS57Xvm1++wElmjEkoFuL6PAHUE6Oio3rowqDvdP9xN7ruhWQEFWRAkzQFrnkkm8xmVG/
	60/8lh//WlhN+jfQC4jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaA-0000000F5pm-2TAY;
	Mon, 28 Jul 2025 17:24:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQb5-0000000ExpZ-2ZDw
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:21:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55b50590cb2so4871250e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753719666; x=1754324466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdcfVN+MxsrGTHCCym31hzeoZnEEz01BYzSO86n5f30=;
        b=I8o0p7Xu4B7w4q8OR5Ivvg2bHXp9DHpCzPkDKWImDDVhMLHobEAJMz3DJ+5tqLTSFz
         cSvm37ACp4e+y6K8AfpXye7r8vLWIKAIjvstGvf46HAuL574kkQ5GM9rgVieBdFSF0Sr
         gsgq3a8TA3quQblpDch9oYPix8PPkd9Fundy3U1cmvzQ/boNL1Aql9UEIbQ0cSroHScd
         Xm05Ax9K3SslookE5c6FEOcoRmSh52R7lIy2uoVDGFyTqSYTf2GjvN4tRdMpq7+ISVJp
         MxeSqZEnGAA4Y6DMq9jVOEkf4svDd2xCHV8QgqWeLWbFgARGC15ExaPmWjB5OBjL3Vxp
         TV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753719666; x=1754324466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdcfVN+MxsrGTHCCym31hzeoZnEEz01BYzSO86n5f30=;
        b=dK4+9DrFGq108jFpyylMFGMT9QBj66gxf5GPJg4r+JtlN3BWnPmhUVWl+tDWzi/HEV
         g6xiCb7WuR/mm+Jg4g/RYrqcBwyI3HM6xEQnUbllMS/hlsIGOHnqtv83kNC+LEaGYvyn
         8WA3SB6Ch+TF0nF7NWesv+NjuyKCO6Mc5/a7DS/gOojldJt2IbHDwNNbN0cu7MeMgOtr
         W0RDtlmnNm06epD41zWtBIFr+05EsN8do9gPMjzRSFGKYoAz1Uq9tKRcTjGDvnXBEARz
         JXCCyzkEDjw661+Shgdc5rFhpg35BLQMwA/sYRvwxXIheLRJj0iZz/TlPtoRkkZm5jQz
         +iXA==
X-Forwarded-Encrypted: i=1; AJvYcCWl/bJfFp/35C7CoxTDIqjqpnL2DAC9EweFLEOaFLw2uPT2KGCrWAJfDx3ot6TdIaZ6EsgArjd+ky8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5T/8pIf7a2rTC0Hsd+5l1hvJaS6cSAcWwjpCsevVOEmJJoU08
	GSzdBEwHBFvZFbbx4PDP+W/fZhxgFbyZ2vGv0s63y8Q55bDYWDrd4me5dZJ01v27BnJGhxHT1Sd
	l4o4fQr8G2kh8GfwOSsGroCPJVIAMRfLWEbGnktwPYQ==
X-Gm-Gg: ASbGncsK9ycQS1DFmJYu7j4MpJicD47JbNggF62U/hok62HOe0eJm+G5Lkh6jWaTcSw
	muvi4mNTF/zTLRCeLiBkk+xGWj4kR18IR5nfPOOYu+zs93T4c4JglnJNFuoMDopl2YRyjxbaTAv
	JMZth1+4vqhKimu+xHSVlLhDBXCNdlWibHCBJYWOOA/NR35/wBGRJzRHEXvO/Y/JwYrzQwQ2F59
	euk3l03BW6i2mUY3g==
X-Google-Smtp-Source: AGHT+IHPLWkIq2Hzkwnhy9Ql1/JeVtlbcWB5zYvVu9QjQS7I5BuWgmz/R499rplid2VZ9bWvtdvBHjhnVq21Gaelowo=
X-Received: by 2002:a05:6512:3c88:b0:556:2764:d1f7 with SMTP id
 2adb3069b0e04-55b5f3d5c4dmr3655639e87.12.1753719665845; Mon, 28 Jul 2025
 09:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com> <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
In-Reply-To: <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Jul 2025 21:50:53 +0530
X-Gm-Features: Ac12FXxd7LAtATGvK2Wpz-J7Et8u7nnsl8CdfP7VqiT2IgK5SUBwlBJP0RG-15Q
Message-ID: <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_092107_651448_89DACE35 
X-CRM114-Status: GOOD (  12.19  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOTo0M+KAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgNTo1NeKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
SnVsIDI4LCAyMDI1IGF0IDk6MjLigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMjowNuKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4gPiA+ICAgICAgIFJJ
U0MtVjogcGVyZi9rdm06IEFkZCByZXBvcnRpbmcgb2YgaW50ZXJydXB0IGV2ZW50cwo+ID4gPgo+
ID4gPiBTb21ldGhpbmcgaGVyZSBhdGUgUXVhbiBaaG91J3MgU2lnbmVkLW9mZi1ieSBsaW5lLCB3
aGljaCBpcyBwcmVzZW50IGF0Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvOTY5MzEz
MmRmNGQwZjg1N2I4YmUzYTc1NzUwYzM2YjQwMjEzZmNjMC4xNzI2MjExNjMyLmdpdC56aG91cXVh
bkBpc2Nhcy5hYy5jbgo+ID4gPiBidXQgbm90IGluIHlvdXIgYnJhbmNoLgo+ID4KPiA+IFRoZXJl
IHdlcmUgY291cGxlIG9mICItLS0iIGxpbmVzIGluIHBhdGNoIGRlc2NyaXB0aW9uIHdoaWNoCj4g
PiBjcmVhdGVkIHByb2JsZW1zIGZvciBtZSBzbyBJIHRyaWVkIGZpeGluZyBtYW51YWxseSBhbmQK
PiA+IGFjY2lkZW50YWxseSBhdGUgU2lnbmVkLW9mZi1ieS4KPiA+Cj4gPiBTb3JyeSBhYm91dCB0
aGF0Lgo+Cj4gTm8gcHJvYmxlbS4gQW5vdGhlciAoYW5kIG1vcmUgaW1wb3J0YW50KSBxdWVzdGlv
biwgZm9yIFNCSSBGV0ZUIEkKPiBkb24ndCBzZWUgYW55IHdheSBmb3IgdXNlcnNwYWNlIHRvIDEp
IHBpY2sgd2hpY2ggZmVhdHVyZXMgYXJlCj4gYXZhaWxhYmxlIDIpIHJldHJpZXZlIHRoZSBzdGF0
ZSBhbmQgcHV0IGl0IGJhY2sgaW50byBLVk0uIEFtIEkgbWlzc2luZwo+IHNvbWV0aGluZz8KCkN1
cnJlbnRseSwgdXNlcnNwYWNlIG9ubHkgaGFzIGEgd2F5IHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBl
bnRpcmUKU0JJIEZXRlQgZXh0ZW5zaW9uLiBXZSBkZWZpbml0ZWx5IG5lZWQgdG8gZXh0ZW5kIE9O
RV9SRUcKaW50ZXJmYWNlIHRvIGFsbG93IHVzZXJzcGFjZSBzYXZlL3Jlc3RvcmUgU0JJIEZXRlQg
c3RhdGUuIEkgYW0Kc3VyZSB0aGlzIHdpbGwgaGFwcGVuIHByZXR0eSBzb29uIChwcm9iYWJseSBu
ZXh0IG1lcmdlIHdpbmRvdykuCgpBdCB0aGUgbW9tZW50LCBJIGFtIG5vdCBzdXJlIHdoZXRoZXIg
dXNlcnNwYWNlIGFsc28gbmVlZHMgYQp3YXkgdG8gZW5hYmxlL2Rpc2FibGUgaW5kaXZpZHVhbCBm
ZWF0dXJlcyBvZiBTQkkgRldGVCBleHRlbnNpb24uCldoYXQgZG8geW91IHRoaW5rID8KClJlZ2Fy
ZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
