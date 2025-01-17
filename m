Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FB7C02183
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRY4uvbrRIzh3K8jQiGcpX5yxMUYSJRc4vaF1U/k9SU=; b=yfYwGQobRo+VW4
	CH3sd1u916mQy76Evcp3fAfxNeqpkovjx64sVFTUHgKCYbeP23oMf6EzQM/4nUKIaGgewhwcBPTzY
	cch9uqp7ZilEgnvxznd6ggEY8GfU3A5F6hSWtioWWv1QTW0q7vt2I14isdhU4zxcQAk7WvGKsYW0z
	YiLlkqSMT/B7fnO9HqXKieuoeS5jhM6BggfbtM+K61LGc/8RYraSWVPGWFfVj9H0aFh3MmFb2G1Rt
	KCi/ddBz5Qfgw1IE57F6aYKvrSkP5r5MJUWplDFyfdTyqIcU+04kWctsP12jkWdV+ynqe8l1DYmKm
	dR4xYm5xyuo/T5y6JCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoc1-00000000ffk-0kDn;
	Fri, 17 Jan 2025 15:50:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYobz-00000000fez-1JM7
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 15:50:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1281600f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Jan 2025 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737129018; x=1737733818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cp/GIvJPAqb8LwPhNDqvZSb8wpAapnmNF5gAZrNXtXA=;
        b=Q8fu5wQe0m9mntEfBSlt6VzVQ7ai//0tjS+vmQVbRfyEBcYo/dilv7HGW3Gu4zh07F
         MPx7bQR7Jht/3Vi+HmQ3m8GeJ4muqvcQVDxtulIQnB7Wgsbo0H8vUDD+lHTS0axEZBlX
         kFvoFHAoHjsjJLvlNLbG074wlveQh2ilV89l9Sh9S3tcW6jvDh0TSAJHKV9uj+XsdhKO
         YmyMc1KwXWEYRC/NJBeQ3FdmkeWdbvGLT/wyt4u6CVjSrbsN3XU2zMSnnYViDqA3l3L0
         ZCqnBtv1M4cSUqG+Q5bsF0ezPqjRkbpflXfIxVoKEr6253/HxFGO/gr5p7IFFtVKd3sq
         w+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129018; x=1737733818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cp/GIvJPAqb8LwPhNDqvZSb8wpAapnmNF5gAZrNXtXA=;
        b=EcMioEo4r6rB8HxAYN1AFl+IfuxQmc4t1f/AMoXfEML+E4y0y7m4/IeR8lrqiTc2pP
         vJf6E48ybe6vBl/Zf62nPcjbJyVCHTcpcp6aIAhZ3GeFYj9xduFp+M0KuzcuaLWgP7Yv
         Nz1Dx3/xOTuVcpad86QJYfCwji4UJYPOd9S/mAT4VejrTbY+bmfYwv3fsavZrQtMbz6t
         DIXJspN+nXRsIrwDJWT/j8ki3CVMQsLJCK5rqt9Px9MTFyqnevqHjEH61+PZIXvlBsWE
         5qZkN+jO3fTGgaT+Hqm0Ig/ej+XM0VzPYD6PKw6yuhP8FD9GyjBR3ZKFCQI6FETYoJPU
         irpA==
X-Forwarded-Encrypted: i=1; AJvYcCWNseHvyvpFJiDgbfnWSmOPEdRj7s0v87Xdj4sIt8afRu5xMahJSFLReuAV7iJUE4gQAG4Vj5kONPw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFGfFMVtNpEo+EG64DcWU8mY6ZRZYAzmNDv+CWPpDFeOQufETc
	tLECUZuVdeiezLuJEHkVNHMrPyLNZ75YLyl1+Jvh0QazqUjbQH6vYk47dygw4gg=
X-Gm-Gg: ASbGncs7g7psoYHhLAkIrZNoL9jfwpR8b9qZ/N+3V2GAGIZSEfA9OKrQu3oIIeRrCZR
	9LZs+VekQCViJlENGNYzBfunMwbUR/kghEWyz2fMOeR3JhwT+NR+7r5or+SwY6uGOuyjEM5ilHU
	ywwg+7NgI297m6OkmgDLWvfUJVf/re9ELMekH4MHmW6wVspc0ElRmRv4IsBNwwdCbihr5GBYFEM
	oeSG/IudI+H4KIXXj+aHs935J0hDcUs+0A7720s4iRykAUWoypnAUT9dZUuAxSGUO9jV3DRB/ui
	LBQyQwynp8GqZtW4VUyvK6DKsw==
X-Google-Smtp-Source: AGHT+IG2hMkiEwGdkGXBgxT0aXmQV7q70JaFEOKvaBWwhUvfyCsA51xrLRzqSMURNo7XJP0BjSwJJw==
X-Received: by 2002:a5d:620f:0:b0:38b:d765:7027 with SMTP id ffacd0b85a97d-38bf57a2675mr2269669f8f.41.1737129017614;
        Fri, 17 Jan 2025 07:50:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b51bsm2860493f8f.60.2025.01.17.07.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:50:16 -0800 (PST)
Message-ID: <9fdcd0cf-334e-46f9-97c1-305f213d1ad3@rivosinc.com>
Date: Fri, 17 Jan 2025 16:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] RISC-V: KVM: add SBI extension init()/deinit()
 functions
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-4-cleger@rivosinc.com>
 <a6196a16-808e-4a69-bcec-a83d868b726f@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <a6196a16-808e-4a69-bcec-a83d868b726f@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075019_357481_7605E774 
X-CRM114-Status: GOOD (  20.71  )
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

CgpPbiAxMS8wMS8yMDI1IDAwOjQyLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBIaSBDbMOpbWVu
dCwKPiAKPiBPbiAyMDI1LTAxLTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4g
VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwo+PiBpbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBh
biBpbml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAo+PiBhbGxvd3MgdG8gZG8gc28uCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0t
Cj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDkgKysrKysrKysK
Pj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgfCAgMiArKwo+PiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICB8IDMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+PiBpbmRleCBi
OTY3MDUyNThjZjkuLjhjNDY1Y2U5MGU3MyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oCj4+IEBAIC00OSw2ICs0OSwxNCBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4
dGVuc2lvbiB7Cj4+ICAKPj4gIAkvKiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24g
Ki8KPj4gIAl1bnNpZ25lZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4+
ICsKPj4gKwkvKgo+PiArCSAqIEluaXQvZGVpbml0IGZ1bmN0aW9uIGNhbGxlZCBvbmNlIGR1cmlu
ZyBWQ1BVIGluaXQvZGVzdHJveS4gVGhlc2UKPj4gKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNC
SSBleHRlbnNpb25zIG5lZWQgdG8gYWxsb2NhdGUgb3IgZG8gc3BlY2lmaWMKPj4gKwkgKiBpbml0
IHRpbWUgb25seSBjb25maWd1cmF0aW9uLgo+PiArCSAqLwo+PiArCWludCAoKmluaXQpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7Cj4+ICsJdm9pZCAoKmRlaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KTsKPj4gIH07Cj4+ICAKPj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPj4gQEAgLTY5LDYgKzc3
LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1X3NiaV9m
aW5kX2V4dCgKPj4gIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgaW50IGlkeCk7Cj4+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7Cj4+ICB2b2lkIGt2bV9y
aXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4+ICt2b2lkIGt2bV9y
aXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPj4gIAo+PiAgaW50
IGt2bV9yaXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVu
c2lnbmVkIGxvbmcgcmVnX251bSwKPj4gIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsK
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwo+PiBpbmRleCBlMDQ4ZGNjNmU2NWUuLjM0MjBhNGE2MmM5NCAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiBA
QCAtMTgwLDYgKzE4MCw4IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wb3N0Y3JlYXRlKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPj4gIAo+PiAgdm9pZCBrdm1fYXJjaF92Y3B1X2Rlc3Ryb3koc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+PiAgewo+PiArCWt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQodmNw
dSk7Cj4+ICsKPj4gIAkvKiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KPj4gIAlrdm1fcmlz
Y3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwo+PiAgCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+PiBpbmRleCA2ZTcw
NGVkODZhODMuLmQyZGJiMDc2MjA3MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4+IEBAIC00ODYsNyAr
NDg2LDcgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCj4+ICAJc3RydWN0IGt2bV92Y3B1X3NiaV9jb250ZXh0ICpzY29udGV4dCA9ICZ2Y3B1LT5h
cmNoLnNiaV9jb250ZXh0Owo+PiAgCWNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lv
bl9lbnRyeSAqZW50cnk7Cj4+ICAJY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24g
KmV4dDsKPj4gLQlpbnQgaWR4LCBpOwo+PiArCWludCBpZHgsIGksIHJldDsKPj4gIAo+PiAgCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKPj4gIAkJZW50cnkgPSAm
c2JpX2V4dFtpXTsKPj4gQEAgLTUwMSw4ICs1MDEsMzcgQEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+ICAJCQljb250aW51ZTsKPj4gIAkJfQo+
PiAgCj4+ICsJCWlmIChleHQtPmluaXQpIHsKPj4gKwkJCXJldCA9IGV4dC0+aW5pdCh2Y3B1KTsK
Pj4gKwkJCWlmIChyZXQpCj4+ICsJCQkJc2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9Cj4+ICsJ
CQkJCUtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRTsKPj4gKwkJfQo+PiArCj4+
ICAJCXNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwo+
PiAgCQkJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQgOgo+PiAgCQkJCQlLVk1f
UklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRDsKPiAKPiBUaGlzIHdpbGwgb3ZlcndyaXRlIHRo
ZSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5BVkFJTEFCTEUgc2V0IGFib3ZlLgoKT2ggeWVz
IGluZGVlZCwgSSBzaG91bGQgYWRkIGEgImNvbnRpbnVlIiB1bmRlciB0aGUgaWYgYWJvdmUuCgo+
IAo+PiAgCX0KPj4gIH0KPj4gKwo+PiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZGVpbml0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4gK3sKPj4gKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRl
eHQgKnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4+ICsJY29uc3Qgc3RydWN0
IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICplbnRyeTsKPj4gKwljb25zdCBzdHJ1Y3Qg
a3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+PiArCWludCBpZHgsIGk7Cj4+ICsKPj4gKwlm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsgaSsrKSB7Cj4+ICsJCWVudHJ5ID0g
JnNiaV9leHRbaV07Cj4+ICsJCWV4dCA9IGVudHJ5LT5leHRfcHRyOwo+PiArCQlpZHggPSBlbnRy
eS0+ZXh0X2lkeDsKPj4gKwo+PiArCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlfU0laRShz
Y29udGV4dC0+ZXh0X3N0YXR1cykpCj4+ICsJCQljb250aW51ZTsKPj4gKwo+PiArCQlpZiAoc2Nv
bnRleHQtPmV4dF9zdGF0dXNbaWR4XSAhPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxF
RCB8fCAhZXh0LT5kZWluaXQpCj4gCj4gR2l2ZW4gdGhhdCBhbiBleHRlbnNpb24gY2FuIGJlIGVu
YWJsZWQvZGlzYWJsZWQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24sIHRoaXMKPiBzaG91bGQgb25seSBz
a2lwIGRlaW5pdCBpZiB0aGUgc3RhdHVzIGlzIFVOQVZBSUxBQkxFLgoKeWVhaCwgbWFrZSBzZW5z
ZSBhcyB3ZWxsLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKQ2zDqW1lbnQKCj4gCj4gUmVnYXJk
cywKPiBTYW11ZWwKPiAKPj4gKwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCWV4dC0+ZGVpbml0KHZj
cHUpOwo+PiArCX0KPj4gK30KPiAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
