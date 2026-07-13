Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812DFC44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WyMysyuO7u3Ym3NLf9yvIdctlYh6ZH7zYcS0XTj5Os=; b=M54IGKTUhZXzAL
	dYULNql3SSpEtwnopWTGDq9vn9F9RuT7ROgEBQSVnODQcx8O74TASw2W+wr8gVQOqMynosdxqwxqX
	YT+QuGDPcj9w06ZepvbSmUZGs5Zfw2JxX1gHOg6AmGYJKrhERG15fPkyKAdqspfbY/06f5JAlFUBx
	Dz9f48UgC3nwh0WbcEH/Tc+v9NK0dnzi0KWkdYqV374CHxklDYwDudih6zyjV3Rms3PJY1HdHl4P5
	pQrng2pdZYnaslLF3qLfL2Ef7CmApzSQW9GbEEl4YYBHPMRi9uQafDeN3aCmn6KFBObQGuc8+Z5yq
	EjV05vz/elV/eV4+IMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC6T-00000008b8j-0xgL;
	Mon, 13 Jul 2026 08:33:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC6P-00000008b7a-3qSm
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:33:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47df43bfb07so532885f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Jul 2026 01:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783931604; cv=none;
        d=google.com; s=arc-20260327;
        b=TsaTP+9Z2hPlPB+3v5AhOGs1diS8pXK1xrHcyQtPyR9Kz4kJL6YDXACVeD3Y5vGcN9
         +JimKdjzJZUd57kYC5AM1jKzHu49YRTjrUWNVhJCaqGfxgx4nQLbabgfc7khKVZx7LAA
         wP9opGMWySirICr6AmjCCVpV5Q8MHg6eoyN9MvnCgZ8xnAl5MK3CaeUVbp6SZkG1bBvQ
         VG1Ge0z+kPgxSDFuSNbBVoL7PgMGQxRD1hXxgt+v5zjxesP+hMTP97xXO+xdC5V3rrn9
         Tu5xWbzZ/ZK6Q355/qv9hcxrgAPuq9yBozXLcG40knBBTWd+X99/MKupfBk8Tl7ivvuV
         jMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        fh=u+noYYbhBeLi+8ZMXPFLLyn1GZOoz3+pXLtsLgHuh5o=;
        b=XaM+aPSPVNSaAPzxp+MjVP2drkC6YZZDSHoHJ+V4y3hZgKUsD9zBzBDDKGmw4fz9bf
         GK7CRryqfpuFt2OzPSpYfun4CQs0IwpfPssSoRhbHSHqE6PLsmH6gWGGC7AeydqCcBN0
         jyMVLdQHxQbdO8a59JWC5FIvKf2Bmk4nbUZRESbjgw31ZDXzcg42yo23BMpWCqJrwg+Z
         nGK4x7l6Eppx9Vig0CpVrxU/cM5P9AGuSTn63K4bwJ7R2wD06plcj3E2NzoN+YdpEJtZ
         42jBcLNni4V1H8cQbpyfNZ9q/9Gq9AWhQSaBpDn7ESLqF3TWX6xmNDpSTk6KxRtiYkvv
         oSyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783931604; x=1784536404; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=c1jchF98MeCXdykho5fJRUWft/C/yoNBip+OvxpU6NygUHaw3CNePI9xPGmig9eF/3
         OHPV3TIz5eRAr/M2X2vA7Ta1uxzHcRCnQ34y6VH9vV7Isi6qdmfBrTp+ASKFxcKE3tav
         OqcI6bqiD+NfaztstQycER3C9jCAAT/2Uc6mJ+rhDPIjjSvwXydExXeFr4s+bcSuY+xe
         JC5oHxo9hW+Eq2+0qSp7RwtUn2U21vfipbKp8J567sVCCtv1zy3I3wT8ytCwgHa8I5Zi
         Ecd+5JINb+qaowGHDxc61n9/tC9+PFRWIVriEsHWNkMIav2IZ1I7Zfg/vcEhwcWBBbwm
         0UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931604; x=1784536404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/TTX6pDKN8WM9gjZfXrDKvUiLlBJOTFwE6JKAQaNe8=;
        b=M+2BG1JXnnF13lATOirnMbdOffMgKVnkg38QPlt+hnxppHYfDKwp7+Yr3IXhwZBjuW
         Efw2QAL/GMxgBy1HSfZDnAcKGWengMMzP2VLKmMSjaMvvhuUq7UJ6ej8HosVK2FaUnWx
         4sekLmhjvwQBNXBawd+qTZD7BmbOEf/OgC86VwcQShmS4jA6Wmh08MqKF8S11gHPfHVU
         lvQtUYe3/t6YLWqmLYD7PxqApkU9swijbe4y7A2UxDcHYOXaGdUYyqhMWaMiVyYQUaL5
         79WVdcLCwPjEoB+ZujCdkO5i3btPMsJy9/8JYziI290N09zTGbqRdNx3iTWwostBRHEl
         OUew==
X-Forwarded-Encrypted: i=1; AHgh+RrvYAfVp/JkeoqzMp8oqFZ97QKdqQzJn/8qfuRl1CQUczexeX+8XvUpxyX1z2r3F7jO1Sz0XoZkRF8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiAK7u+8u+3nFPJYaI8tjqYKKDzbwLIWbi4eKWvxHOfEioC/ax
	MOr2c6JBk8+dMNwbfG4DYLeNVRm+cmt1IfbdEotaQSPAiplAHdYO20MBdyOqCIF4sLP13HURABb
	up7tKKMmIeEKO7/UeEXXs74eVut/iMUW6l+QY6OUyvw==
X-Gm-Gg: AfdE7ckBmKuCr3nWguzgzXtdmIGw2o4c/irpg/EnzMkeFk/PA4xh5jm575vchehuW1D
	bCvmwj5fKTTwtosKC4c1lVHANB4HfWeJ0Zk4a6q38fLgy8srhKSo0U4bIOE3X1aftwjK3LguM7g
	2w5Ox5nxn3S5FqLOxHEQlzjbUI/OVF2NKcv1/wLx0d04RWKLBUPspnffkNV+DRS8+Bgf6hW4G8q
	9p7rQJgg6JnTvBiTeFbcWKIO7TTkEejb0ulCRmf9MT93iAAlehEdFP/hHfMO8aE8U5ZRIAPrOmn
	JdQfI8rsKrxfEzb6OktqR/Eo6H9JDCH5yVt8iQ0X1OKiKqgiMSoX4cw62sUa0k0phstnAFzAKPC
	WWC93oFLYF1Oy+ZX4
X-Received: by 2002:a05:600c:638f:b0:493:f762:45d4 with SMTP id
 5b1f17b1804b1-493f87d9311mr77398405e9.2.1783931603573; Mon, 13 Jul 2026
 01:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260624130238.524706-1-suunj1331@gmail.com>
In-Reply-To: <20260624130238.524706-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 14:03:10 +0530
X-Gm-Features: AUfX_myLtlmicbiW4GefupawlEmm4GHGfSrV2gtz0C0tAQHCDS5effgNQRiwzOo
Message-ID: <CAAhSdy2YUuC8BLVDp53VWGnUYLShGkuWeHr87mpe5RnZx3PLSQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, cleger@rivosinc.com, ajones@ventanamicro.com, 
	skhan@linuxfoundation.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_013326_104149_0102EFEC 
X-CRM114-Status: GOOD (  15.46  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgNjozM+KAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX3NiaV9md2Z0X3NldCgpIGFwcGxpZXMgdGhlIGNh
bGxlcidzIGZsYWdzIHRvIGNvbmYtPmZsYWdzIGJlZm9yZQo+IGludm9raW5nIHRoZSBzZXQoKSBj
YWxsYmFjay4gSWYgdGhlIGNhbGxiYWNrIHJldHVybnMgYW4gZXJyb3IsIHRoZSBMT0NLCj4gYml0
IHBlcnNpc3RzIGFuZCB0aGUgZmVhdHVyZSBiZWNvbWVzIHBlcm1hbmVudGx5IGxvY2tlZCB3aXRo
b3V0IGl0cyB2YWx1ZQo+IGV2ZXIgYmVpbmcgY2hhbmdlZC4KPgo+IE1vdmUgdGhlIGZsYWdzIGFz
c2lnbm1lbnQgYWZ0ZXIgdGhlIGNhbGxiYWNrIHNvIExPQ0sgdGFrZXMgZWZmZWN0IG9ubHkKPiBv
biBzdWNjZXNzLgo+Cj4gRml4ZXM6IDZiNzJmZDE3MDU5MiAoIlJJU0MtVjogS1ZNOiBhZGQgc3Vw
cG9ydCBmb3IgRldGVCBTQkkgZXh0ZW5zaW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENo
ZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExp
bnV4LTcuMi1yY1gKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYWIzOWFjNDY0
ZmZkLi4xMzQyYWRiMzE4MGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTMyNyw5
ICszMjcsMTEgQEAgc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfc2V0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdTMyIGZlYXR1cmUsCj4gICAgICAgICBpZiAoY29uZi0+ZmxhZ3MgJiBTQklfRldGVF9T
RVRfRkxBR19MT0NLKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9ERU5JRURfTE9D
S0VEOwo+Cj4gLSAgICAgICBjb25mLT5mbGFncyA9IGZsYWdzOwo+ICsgICAgICAgcmV0ID0gY29u
Zi0+ZmVhdHVyZS0+c2V0KHZjcHUsIGNvbmYsIGZhbHNlLCB2YWx1ZSk7Cj4gKyAgICAgICBpZiAo
cmV0ID09IFNCSV9TVUNDRVNTKQo+ICsgICAgICAgICAgICAgICBjb25mLT5mbGFncyA9IGZsYWdz
Owo+Cj4gLSAgICAgICByZXR1cm4gY29uZi0+ZmVhdHVyZS0+c2V0KHZjcHUsIGNvbmYsIGZhbHNl
LCB2YWx1ZSk7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgc3RhdGljIGludCBrdm1f
c2JpX2Z3ZnRfZ2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBmZWF0dXJl
LAo+IC0tCj4gMi41Mi4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
