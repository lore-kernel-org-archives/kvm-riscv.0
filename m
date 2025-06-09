Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F361AC5B552
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 05:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vKdkNlFOc75z7HuRJWCHeR6aR/TUf2aBobfYHuHz34=; b=ApPvG76/548CpR
	Fr/2sFvE8FRigLZ4g3S0fQJpYtRwFO7v6jHqgBTa7KZX39VGHz2CMnJ7QSmTEZFKd46SRfVHFaYIO
	k6BJdY65nIu8/CirCmqkHfAyljJu4CNGdLD2RolYHOOoalP6X+G1hYfnDJu0sgtwijW7nASp6JKGi
	YkA6wbZOBqDrfY8FTHkbKy1aOiyYDyXMnnLH18NIkzx9LCVaBtVTMhL1PNsFV9DmY7XvjXcw6fZEh
	PtZHQ936SDk4yM5B7Wg6BgkjrNV4wli74j76C9Wz27n3b2gtAyqsf68ikUL9GGJNZu0YM+E2Y6KuT
	MB3Vk+i90Iu/gs8iM4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUdw-00000003Rh4-1bH6;
	Mon, 09 Jun 2025 05:01:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOUdt-00000003RgI-0jyU
	for kvm-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 05:01:54 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553543ddfc7so3790751e87.0
        for <kvm-riscv@lists.infradead.org>; Sun, 08 Jun 2025 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749445311; x=1750050111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=afCCoh6updQKGT9lne4Lg9+IHFK0M5rdK2p6eZs1VF8VeO/JXDDqx2HrU++GEUuC2A
         kPBHA88S/AtWJN1XPbBERubStxUgiJK903zeGsQ4hOF2hlok5ss7PKuu5zKDXZb4EHvi
         9I5HmEKljBKdU9EoeHcnVzdqNcYXYc0ihCdiOBsmB1ZGQjy5Zp3D5r9Ctbspx6g2dXbX
         ziF2ThUWb3nxgchpG8mVJa59FWqAs7c5y1ScX53GtGrFx0G5GG1MW/DKxytqE6JP6wyx
         bBHB4421cWc/KgqOeFyldbA62jo8Dy3vX13kXWbX+IYkf0oXIyMrw5MlbeEuTHvitaxH
         chXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749445311; x=1750050111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOMcjGbCg5jsFQHyOHp8QkLmffXsMI4hIXBXUWTyrTY=;
        b=cOo/RjUA9XM9ywiVrBerdGtPkJTEcR9XG1i85/we+rMogtA+cEIH18jFNPgP/YVKWi
         FO1avc4/Q0Cs0nUP30RYX/xMnALjOS30IPoAZEoMW37LJa+GncLIM8sbi+xvhiW/BzCO
         RdHBlWUBfZ8l3xUBrwFdk8QR/fyaixKRUeU/kDVgrrAwmnYDwiPddCbWRQxxxCdqkAvQ
         ibQZFyVVeJyHt3YkZX+WOff7FRgyVK0hSU31bGlDREf3dlgkAZd7e/WduOgofCZV0zug
         LsnRS6fDeO2jNVFEqJg+P8lG5QCCfUF6yR1U4Db9JT9TFZ94iZPO3S4IY/AgnQaO/l35
         DKTg==
X-Forwarded-Encrypted: i=1; AJvYcCUMYk24u4YraSw+twlJGc5ph/NipjF9gSkGTxgBKSpZ32FtO+qlzI9b6CN9d7s5oU4mwuKg2ng0XYI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu8dBhLRf96cBR+Y1URCLZGbrabS8qrlSYkWHwZKcz9GaKiKmU
	/mxFvGte1NyHnpTCgKQ3OCHxcvbfLaKbwbIAyOkclfW26w2pnVm/W38v/9jhB7fN8TKyhAwWlWz
	HoPqY6pxi4FJVjGsiFd0epWB7RHmohBPGaPdm/OTyIRfROdYSuQY82QE=
X-Gm-Gg: ASbGnctNxT+pQZZZ83iDlBlhCq9MRt1bwbx9ZDOo/0HNNaLolVuB2drs6EFUrDXTrBj
	KutOEHsCpNGsceBg3J/65Zs+n1PGF/rqsQonGAlV453YFJKwODIs3qFfwg05xqs9B43gG2U/oA3
	mhmwd1q3F92WFFvdznh18xu4tZJrnK3U1aOQ==
X-Google-Smtp-Source: AGHT+IGNoFMBVcIkhkWIxs1T6dpBKHVyU1+GA9Sn2XOqGmubTKzpGdkqTqGYa5lWFnUt1IGgZ9ywL6/bb9mRRWona4Q=
X-Received: by 2002:a05:6512:b96:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55366c35b56mr2725861e87.55.1749445310725; Sun, 08 Jun 2025
 22:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com>
 <20250605061458.196003-4-apatel@ventanamicro.com> <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
In-Reply-To: <ed5276d8-5169-47fc-bef2-bde7b8979e7e@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 10:31:38 +0530
X-Gm-Features: AX0GCFu6khb6JAs3hfg5t5-XeCYErlLBCVttXYRvddGA_uZhl6kG6tBxdop0a2o
Message-ID: <CAK9=C2WWtOdG9aYhmrTnDNoV9f0VBYUENJ8utKd=4G9-1SyzdQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context()
 return value
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_220153_218684_E7980AED 
X-CRM114-Status: GOOD (  20.05  )
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

T24gRnJpLCBKdW4gNiwgMjAyNSBhdCA1OjQ24oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPgo+IE9uIDYvNC8yNSAxMToxNCBQTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IFRoZSBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dCgpIGRvZXMg
cmV0dXJuIGFuIGVycm9yIGNvZGUKPiA+IHVwb24gZmFpbHVyZSBzbyBkb24ndCBpZ25vcmUgdGhp
cyBpbiBrdm1fYXJjaF92Y3B1X2NyZWF0ZSgpLgo+Cj4gY3VycmVudGx5LCBrdm1fcmlzY3ZfdmNw
dV9hbGxvY192ZWN0b3JfY29udGV4dCByZXR1cm5zIC1FTk9NRU0gb25seS4KPgo+IERvIHlvdSBo
YXZlIHNvbWUgcGxhbnMgdG8gcmV0dXJuIGRpZmZlcmVudCBlcnJvcnMgaW4gdGhlIGZ1dHVyZSA/
CgpFdmVuIGlmIGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KCkgYWx3YXlzIHJl
dHVybnMgLUVOT01FTSwKdGhlIGNhbGxlciBzaG91bGQgbm90IGFzc3VtZSBhbnl0aGluZyBhYm91
dCB0aGUgcmV0dXJuIHZhbHVlLgoKPgo+IE90aGVyd2lzZSwgdGhlIGNvZGUgcmVtYWlucyBzYW1l
IGJlZm9yZSBhbmQgYWZ0ZXIuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8
IDYgKysrKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+ID4gaW5kZXggZTBhMDFhZjQyNmZmLi42YTE5MTRiMjFlYzMgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYwo+ID4gQEAgLTE0OCw4ICsxNDgsMTAgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3Jl
YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiA+Cj4gPiAgICAgICBzcGluX2xvY2tfaW5pdCgm
dmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5sb2NrKTsKPiA+Cj4gPiAtICAgICBpZiAoa3ZtX3Jpc2N2
X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSkpCj4gPiAtICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ID4gKyAgICAgLyogU2V0dXAgVkNQVSB2ZWN0b3IgY29udGV4dCAqLwo+IFRo
ZSBmdW5jdGlvbiBuYW1lIGlzIHByZXR0eSBzZWxmIGV4cGxhbmF0b3J5LiBTbyBubyBuZWVkIG9m
IHRoaXMgY29tbWVudCA/CgpZZXMsIG5vIG5lZWQgZm9yIHRoaXMgY29tbWVudC4gSSB3aWxsIGRy
b3AgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uCgo+ID4gKyAgICAgcmMgPSBrdm1fcmlzY3ZfdmNw
dV9hbGxvY192ZWN0b3JfY29udGV4dCh2Y3B1KTsKPiA+ICsgICAgIGlmIChyYykKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIHJjOwo+ID4KPiA+ICAgICAgIC8qIFNldHVwIFZDUFUgdGltZXIgKi8K
PiA+ICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX2luaXQodmNwdSk7Cj4KClJlZ2FyZHMsCkFu
dXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
