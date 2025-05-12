Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B444FC3ABC3
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnkSZmEmabg4hEz3buvK/PYOYauWeQ0nEWh3d2IGwNE=; b=YPF1ENdHDCl1Eu
	mKVsgmv2n1+8WSlCGUz/5zSmU5dkyqjZV52ONK/gt28kj3/7DzP2uOC5Vq+iRe+d0Nlka0HrPIsQO
	R36kmJy9S5izjcgFekVEkIYqGfoHoluekkgFl8djBoHyQk1tuJ4Nad1/aSYxG3ypIf3xT0F2Rl/1o
	9troIBClUzcaQk/tfAGPYbE+8I5ao75ga3/RgM/9YVuR4TIInOKBTgL3AhTrnXWXmbwG+Uob7GGWe
	kbZQfNILh+Pxm5+FspQaf1rfss8OiCd9dnrAWDMIOZudJZtT7LdMQEXXxSGZItUzulAeWcKkcI42U
	IEVkqc9jal2MqLy4KizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOb2-00000008lTI-1NYf;
	Mon, 12 May 2025 08:33:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOW4-00000008kUW-0z32
	for kvm-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:28:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b9625662so3346640f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 12 May 2025 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747038482; x=1747643282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GHu16VagS4Zo0QZx5ctfJMlX1e+tH9PDkYdamiUkNk=;
        b=1zxHXBx0HYLmiTCfDXi8mIKmKHvQltDxwyCPQweIWG3UgHyYg7U43yeh45WnBj1GOm
         VfvL2qBTg6mTfjoHRZDE63cYVnme7G0+1kNAzhDEIuB8FyuksHXuMciCbBEv6chG4gvA
         B5aVakIZwhB3n7wEPUcqkB8biiO24sgosyQ3YLauCIp/XSgLHBGwSU7krzUsLfQZa69l
         YWjiTFwvccyJ3Q+efZvJuQBE9d6GlRLRuS1lsmbg0/Q5AxHEYKZs7PR+e5OIwT9Jx9cV
         XKN+55dSfyGIVw6syLyePklapf31Mo7S9pU8cQ6zKyaoi51diXrvhZH6j13ywaarLZhu
         qAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038482; x=1747643282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GHu16VagS4Zo0QZx5ctfJMlX1e+tH9PDkYdamiUkNk=;
        b=uV4UN5T6N/0hWdk/4JCHzKSDnvKyVoCICxOm1lAvI4fSW/RTUgAIzBarA2QJ4W9hUg
         Q+PCYnI4i6kxt0yPB4imnk17CEH2a8xTUJBZomEhbM1Tvm3aFzCUvH8nvFbxDaAijYDK
         RMVvMbznpqeqdtO8iWdxuiE9s4y4APDHPrRJZmHd/W87Mxz/Do2yin4bYN0R0FyXNQAa
         8IUZKG5cj9fBOKtBCQdOXVAWzdo5/6/YsgDPYFg2nHKwDGXe8RQSBkcINJPcsrfKY9lq
         GxYznxPakA1gefLI5845zShV5nDkSyY/awqCoaRVhU6MAIIuZ74mWJkCtgi/gF7ZHoDL
         04MA==
X-Forwarded-Encrypted: i=1; AJvYcCV61zmkpb1gn4Ov0oWAI4LDAiU0BV1P9G6N97HHWIENV3UDYH/ePGSE44IDVH4s1q1v5Sc86+KUXus=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPSnKFXmV/GvLPbRRCbt+e66B1zfr2A7CCxqXXPeC6DJnABB2
	VUd6/f3XnuP4hd2vzfGAnDuvN86leoAesSOQ0SY3DGhfzKCOXwG7gpRy5DDfuGI=
X-Gm-Gg: ASbGncszjbfvuW5x9+ZlWQak9JwTypjMPHltrnnqd9gIVhejzRFqxFXoMPmfrlJ67dR
	UrQ4of4Fe3sBAs8l/MuQNNSz3ApinnMq8YX4upp7sItqgVmgK709MaAT4HIrSd21hOTdVkZ87sS
	nx+hRQ1pEdCRBBjlDGy2DZjlKNptwh+9nuxT+Pr+Nsic8cc/Y4MYRDnMTqopg9nK8Vym8jX54b3
	/cawx1AmsgbiVjVVgQ+Wwm8kUGHzh6UhwuncchHoWlHb779m62lvm0t5QErGGmMws0fFgwnNiJS
	Sm9lmw9LCUXAzlL+bjfwcnfFX2J/qPsXriZZ1GVL7qo/Q0Br66PGsnvwyjEX6dze2RdVNXcitdx
	u4ho2HURDCAG8XUeGeaQU
X-Google-Smtp-Source: AGHT+IF3cuftk1+itln34hyUlsyO+lAZrtrkx94Wsxfu0ogw4IibSZyT4oEk1i1ctGEF1Ke0Xxw6Ig==
X-Received: by 2002:a05:6000:2410:b0:3a0:7a5d:96f6 with SMTP id ffacd0b85a97d-3a1f64b5850mr10211716f8f.38.1747038482577;
        Mon, 12 May 2025 01:28:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2ab2sm11460379f8f.46.2025.05.12.01.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:28:02 -0700 (PDT)
Message-ID: <67896719-5cbc-4bf6-8b00-3b785940952f@rivosinc.com>
Date: Mon, 12 May 2025 10:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-15-cleger@rivosinc.com>
 <87b2eade-acda-428e-81af-d4927e517ebe@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <87b2eade-acda-428e-81af-d4927e517ebe@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012804_509176_155DF357 
X-CRM114-Status: GOOD (  17.17  )
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

CgpPbiAwOS8wNS8yMDI1IDIwOjA5LCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiA0LzI0LzI1IDEw
OjMyIEFNLCBDbMODwqltZW50IEzDg8KpZ2VyIHdyb3RlOgo+PiBTQklfRldGVF9NSVNBTElHTkVE
X0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8gZGVsZWdhdGUKPj4gbWlzYWxp
Z25lZCBsb2FkL3N0b3JlIGV4Y2VwdGlvbnMuIFNhdmUgYW5kIHJlc3RvcmUgaXQgZHVyaW5nIENQ
VQo+PiBsb2FkL3B1dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZv
c2luYy5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzICsrKwo+PiDCoCBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwg
MzkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4+IGluZGV4IDU0Mjc0N2UyYzdmNS4uZDk4ZTM3OTk0
NWMzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4+IEBAIC02NDYsNiArNjQ2LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCB2b2lkICpu
c2g7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2gu
Z3Vlc3RfY3NyOwo+PiArwqDCoMKgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1
LT5hcmNoLmNmZzsKPj4gwqAgwqDCoMKgwqDCoCB2Y3B1LT5jcHUgPSAtMTsKPj4gwqAgQEAgLTY3
MSw2ICs2NzIsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnN0dmFsID0gbmFjbF9jc3JfcmVhZChuc2gs
IENTUl9WU1RWQUwpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT5odmlwID0gbmFjbF9jc3Jf
cmVhZChuc2gsIENTUl9IVklQKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNhdHAgPSBu
YWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNmZy0+aGVk
ZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7Cj4+IMKgwqDCoMKgwqAgfSBl
bHNlIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNzdGF0dXMgPSBjc3JfcmVhZChDU1Jf
VlNTVEFUVVMpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT52c2llID0gY3NyX3JlYWQoQ1NS
X1ZTSUUpOwo+PiBAQCAtNjgxLDYgKzY4Myw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3NyLT52c3R2YWwgPSBj
c3JfcmVhZChDU1JfVlNUVkFMKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+aHZpcCA9IGNz
cl9yZWFkKENTUl9IVklQKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNzci0+dnNhdHAgPSBjc3Jf
cmVhZChDU1JfVlNBVFApOwo+PiArwqDCoMKgwqDCoMKgwqAgY2ZnLT5oZWRlbGVnID0gY3NyX3Jl
YWQoQ1NSX0hFREVMRUcpOwo+IAo+IENhbiB3ZSBhdm9pZCBzYXZpbmcgaGVkZWxlZyBpbiB2Y3B1
X3B1dCBwYXRoIGJ5IHVwZGF0aW5nIHRoZSBjZmctCj4+aGVkZWxlZyBpbiBrdm1fc2JpX2Z3ZnRf
c2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbi4KPiAKPiBXZSBhbHJlYWR5IHVwZGF0ZSB0aGUgaGVk
ZWxlZyBpbiB2Y3B1X2xvYWQgcGF0aCBmcm9tIGNmZy0+aGVkZWxlZy4KPiBJZiB0aGUgbmV4dCB2
Y3B1IGRpZCBub3QgZW5hYmxlIGRlbGVnYXRpb24gaXQgd2lsbCBnZXQgdGhlIGNvcnJlY3QKPiBj
b25maWcgd3JpdHRlbiB0byBoZWRlbGVnLgoKWWVhaCB0aGF0IG1ha2Ugc2Vuc2UsIEknbGwgbW9k
aWZ5IHRoYXQuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBUaGlzIHdpbGwgc2F2ZSB1cyBhIGNz
ciByZWFkIGNvc3QgaW4gZWFjaCBWTSBleGl0IHBhdGggZm9yIHNvbWV0aGluZwo+IHRoYXQgaXMg
cHJvYmFibHkgY29uZmlndXJlZCBvbmNlIGluIGd1ZXN0IGxpZmUgdGltZS4+Cj4+IMKgwqDCoMKg
wqAgfQo+PiDCoCB9Cj4+IMKgIGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS8KPj4gdmNwdV9zYmlfZndmdC5jCj4+IGluZGV4IGIwZjY2
YzdiZjAxMC4uZDE2ZWU0NzcwNDJmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9md2Z0LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+IEBA
IC0xNCw2ICsxNCw4IEBACj4+IMKgICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4+IMKg
ICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaD4KPj4gwqAgKyNkZWZpbmUgTUlTX0RF
TEVHIChCSVRfVUxMKEVYQ19MT0FEX01JU0FMSUdORUQpIHwKPj4gQklUX1VMTChFWENfU1RPUkVf
TUlTQUxJR05FRCkpCj4+ICsKPj4gwqAgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlIHsKPj4g
wqDCoMKgwqDCoCAvKioKPj4gwqDCoMKgwqDCoMKgICogQGlkOiBGZWF0dXJlIElECj4+IEBAIC02
OCw3ICs3MCw0MSBAQCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51
bQo+PiBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFs
c2U7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2Rl
bGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdAo+PiBrdm1fdmNwdSAqdmNwdSkKPj4gK3sKPj4gK8Kg
wqDCoCByZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKPj4gK30KPj4gKwo+
PiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3Ry
dWN0IGt2bV92Y3B1Cj4+ICp2Y3B1LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZhbHVlKQo+PiArewo+
PiArwqDCoMKgIGlmICh2YWx1ZSA9PSAxKQo+PiArwqDCoMKgwqDCoMKgwqAgY3NyX3NldChDU1Jf
SEVERUxFRywgTUlTX0RFTEVHKTsKPj4gK8KgwqDCoCBlbHNlIGlmICh2YWx1ZSA9PSAwKQo+PiAr
wqDCoMKgwqDCoMKgwqAgY3NyX2NsZWFyKENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+PiArwqDC
oMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07
Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBsb25nIGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1f
dmNwdQo+PiAqdmNwdSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4+ICt7Cj4+ICvCoMKg
wqAgKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAmIE1JU19ERUxFRykgPT0gTUlTX0RF
TEVHOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+PiArfQo+PiArCj4+IMKg
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsK
Pj4gK8KgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTQklfRldGVF9NSVNBTElHTkVE
X0VYQ19ERUxFRywKPj4gK8KgwqDCoMKgwqDCoMKgIC5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPj4gK8KgwqDCoMKgwqDCoMKgIC5zZXQg
PSBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gK8KgwqDCoMKgwqDC
oMKgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4gK8Kg
wqDCoCB9LAo+PiDCoCB9Owo+PiDCoCDCoCBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25m
aWcgKgo+IAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
