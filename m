Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557E4C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7/1ix9dmTOscGZC11HxxAmilb6C4tnCmd4AD6FCW88=; b=s0m94iwIQMalV2
	DwHHVptNZzhKMg32J6mkB3O3PrbksVoMNHFL3ODzDs4sotg+9MXNDHV/QStxrh4swly2NQxYvmRkv
	T9yxj1fiCLujHuN7DlwYpCQmFVdjTWTbHCuzoWZnYDkKxtvcqPp/Sz0GxVl18O8l+Qml/ddGKxYVr
	9LuEghs26emMQ/g/h5ipzqYmx/quX1uJPhLHNWHemlKoxSyhfmvw0kWqXNxA59eGQxdoJsrxoTD2M
	+9ZH/G2QWdehRexdRR0Xdl9CRxATLsFbkOrpVHWUC5pTPY9C+OsCGAT/T3DYVTzM2fUqDkDlRPmIS
	/suYrNaLS6NKb9p40x4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wx4-0000000EFR0-488p;
	Thu, 24 Apr 2025 13:49:18 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vnG-0000000E3FL-08V8
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:35:07 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9163025e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745498104; x=1746102904; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNMAR2ow2m6nJc7QSxTl3I9Uc8Pm3w7ZW7eElxL9kzk=;
        b=vDMHQlydgWKLjsbiqu/rToCy74vDGuvhDOp8STyY/RP+6bsr+dPnMDKbtaXRfdA3BD
         PtuOtxhtuKDplytc6DGa1XEGvBAExlRBh/8zaGxPLeMsZwC8KpnT/bF4rhx1obagVcOm
         I2ELKXUIZc7t/rhhTWtQ4Et/fbykWpy20Q0cxJBrEC/vaOVD4hG6mfsLKJznx/tJdHLm
         s2SDUvrDADp67APXekc9vxucTYt+mA8CYg9AWZLhVSYPMiFs/xbayBqMLOcQ7PPHgR92
         Sr+XNoWeL/oaAdwse6gUMGX1AMUkHTynBNDOgHBgtXAmkwnPpwDjGPVPkusdtpcCnsTE
         3pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498104; x=1746102904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNMAR2ow2m6nJc7QSxTl3I9Uc8Pm3w7ZW7eElxL9kzk=;
        b=oIK9BXwk15BUzKI3ytuS0NAua9rRhpIfTj84+spS5qgz5GByRQ/K+5xP6V3RhZVPAv
         EVei2lyiQ08CAhhSS8VYDp3blgIpjlKqEbtMF3LmouTj56+5/rDEl7YaU0b67EFtEI1R
         XafPGxg6kU5P+w/IW0CA0Gc75D9VFLM9xJD9F4EJOu85NTV7iNSdpvAqOvu1s1ikoNBa
         GO4s+DlKz6wyx8AZwXWu8vcsHNfvEFeggdK1Jdd7nEKNDJWHHg7Zc2yTacXOa0T/KUbl
         4vqaYfODboI2MeRjJ7Ph236xnn8ik7Ign/LWPCmHiM7HOpt5IoSi1OjLmhKpPcCWmA0H
         oN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPdfXI1EpijwNLdd+Bnyy+WzdIQak3CtH3e0ma8Bqak6IqyBUcWIvoAzWZdm3RSMI3YzJTWcmu+Dw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKcZBG0a9EzfkZ0vE5UiVV6pu575YoL+jklc/JlkDDCUzw4Nu1
	msYip4LJK/OTPqG7eNxf1ITHk0q7/DLt3446Uqcr8s5hvf5e2xgO/+CuIS5V93E=
X-Gm-Gg: ASbGncsbDwqfwIQsrktejZ2mfJ76l7xanBeKNaSGVFTTbEQAcUtdh1vNfJGJHUTep8o
	tgPL5yJI+TCHZAblTFvMtMNcjXpGey9UYWFdGZAGDjduyeaXtmu7SWapBR3pVLzlwGwATgH0QOZ
	WLdv+uuQxoRPxYrP2pWXiBQ5nZV0pWZTjqzvfdtuFM3paXYNnvvqmvtHhXDB9ceBOLVgaBk+kZE
	ihsSKje0kox+tH3DSPn98mX0tSUazi/ORiC7XANj5Vl7dBxb0GofFAsn6z/x4jKDB9UClj7Rq21
	H8S//vroUZPBcjchr+keows64HvNsgGM3dIqb3qlgQU6SHWs/nXZN23MDbVOdQ6fF1xwuG0TIiQ
	e235ytOX6nw==
X-Google-Smtp-Source: AGHT+IGVtiMSUESCXxVr8lAA6TW/b8o7vs1YUH21uoFbmNmUInqOubAKtgP45r/urKl+RsY3D8dRJg==
X-Received: by 2002:a05:600c:1c8d:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4409bd1f46cmr23664385e9.17.1745498103920;
        Thu, 24 Apr 2025 05:35:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm19303745e9.16.2025.04.24.05.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:35:03 -0700 (PDT)
Message-ID: <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
Date: Thu, 24 Apr 2025 14:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c0700f89bcd29438d6d8d65c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_053506_070946_3BDDB8AD 
X-CRM114-Status: GOOD (  21.39  )
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

CgpPbiAyNC8wNC8yMDI1IDEzOjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTcsIDIwMjUgYXQgMDI6MTk6NTFQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgRldGVCBleHRlbnNpb24gY2FsbHMuIFRoaXMgd2lsbCBiZSByYXRpZmllZCBpbiBTQkkgVjMu
MCBoZW5jZSwgaXQgaXMKPj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQgdGhhdCBjYW4g
YmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gaW5kZXggMzc5OTgxYzJiYjIx
Li43YjA2MjE4OWIxODQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+IEBAIC0yOTksNiArMjk5LDggQEAgc3Rh
dGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpj
cHVfbWFzaywKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGJvb2wgc2JpX2Z3
ZnRfc3VwcG9ydGVkOwo+IAo+IEF0IHNvbWUgcG9pbnQgd2UgbWF5IHdhbnQgYW4gU0JJIGV4dGVu
c2lvbiBiaXRtYXAsIGJ1dCB0aGlzIGlzIG9ubHkgdGhlCj4gc2Vjb25kIFNCSSBleHRlbnNpb24g
c3VwcG9ydGVkIGJvb2xlYW4gdGhhdCBJJ20gYXdhcmUgb2YsIHNvIEkgZ3Vlc3Mgd2UncmUKPiBz
dGlsbCBPSyBmb3Igbm93LgoKVGhhdCBzZWVtcyByZWFzb25hYmxlIHRvIGhhdmUgYSBiaXRtYXAg
cmF0aGVyIHRoYW4gZHVwbGljYXRpbmcKKmV4dCpfc3VwcG9ydGVkLiBJZiB0aGF0J3Mgc29tZXRo
aW5nIHRoYXQgYm90aGVycyB5b3UsIEkgY2FuIHRha2UgY2FyZQpvZiBpdCBhbmQgdXNlIGEgYml0
bWFwLiBTU0Ugd2lsbCBhbHNvIGhhdmUgYSBzc2Vfc3VwcG9ydGVkIGJvb2xlYW4gYnV0CmluIGl0
J3Mgb3duIGRyaXZlciBmaWxlIHRob3VnaC4KCj4gCj4+ICsKPj4gIC8qKgo+PiAgICogc2JpX2Z3
ZnRfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIG9uIHRoZSBsb2NhbCBoYXJ0Cj4+ICAgKiBAZmVhdHVy
ZTogVGhlIGZlYXR1cmUgSUQgdG8gYmUgc2V0Cj4+IEBAIC0zMDksNyArMzExLDE1IEBAIHN0YXRp
YyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1
X21hc2ssCj4+ICAgKi8KPj4gIGludCBzYmlfZndmdF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVk
IGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4+ICB7Cj4+IC0JcmV0dXJuIC1FT1BO
T1RTVVBQOwo+PiArCXN0cnVjdCBzYmlyZXQgcmV0Owo+PiArCj4+ICsJaWYgKCFzYmlfZndmdF9z
dXBwb3J0ZWQpCj4+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4gKwo+PiArCXJldCA9IHNiaV9l
Y2FsbChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9TRVQsCj4+ICsJCQlmZWF0dXJlLCB2YWx1
ZSwgZmxhZ3MsIDAsIDAsIDApOwo+PiArCj4+ICsJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vy
cm5vKHJldC5lcnJvcik7Cj4+ICB9Cj4+ICAKPj4gIHN0cnVjdCBmd2Z0X3NldF9yZXEgewo+PiBA
QCAtMzQ4LDYgKzM1OCw5IEBAIGludCBzYmlfZndmdF9sb2NhbF9zZXRfY3B1bWFzayhjb25zdCBj
cHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAo+PiAgCQkuZXJyb3IgPSBBVE9NSUNfSU5JVCgw
KSwKPj4gIAl9Owo+PiAgCj4+ICsJaWYgKCFzYmlfZndmdF9zdXBwb3J0ZWQpCj4+ICsJCXJldHVy
biAtRU9QTk9UU1VQUDsKPj4gKwo+PiAgCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xPQkFMX0ZF
QVRVUkVfQklUKQo+PiAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gIAo+PiBAQCAtNjc5LDYgKzY5Miwx
MSBAQCB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQo+PiAgCQkJcHJfaW5mbygiU0JJIERCQ04g
ZXh0ZW5zaW9uIGRldGVjdGVkXG4iKTsKPj4gIAkJCXNiaV9kZWJ1Z19jb25zb2xlX2F2YWlsYWJs
ZSA9IHRydWU7Cj4+ICAJCX0KPj4gKwkJaWYgKChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192
ZXJzaW9uKDMsIDApKSAmJgo+PiArCQkgICAgKHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9G
V0ZUKSA+IDApKSB7Cj4gCj4gVW5uZWNlc3NhcnkgKCksIGJ1dCBJIHNlZSBpdCdzIGNvbnNpc3Rl
bnQgd2l0aCB0aGUgZXhwcmVzc2lvbnMgYWJvdmUuCgpJIGNhbiBmaXggdGhlIG90aGVyIG9uZXMg
YXMgd2VsbCBpbiBhbm90aGVyIGNvbW1pdC4KCj4gCj4+ICsJCQlwcl9pbmZvKCJTQkkgRldGVCBl
eHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwo+PiArCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsK
Pj4gKwkJfQo+PiAgCX0gZWxzZSB7Cj4+ICAJCV9fc2JpX3NldF90aW1lciA9IF9fc2JpX3NldF90
aW1lcl92MDE7Cj4+ICAJCV9fc2JpX3NlbmRfaXBpCT0gX19zYmlfc2VuZF9pcGlfdjAxOwo+PiAt
LSAKPj4gMi40OS4wCj4+CgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBCZXNpZGVzIHRoZSAoKSBu
aXQKPiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
