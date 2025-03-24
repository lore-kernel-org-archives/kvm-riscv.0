Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D8C36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24yyJsXQxZC89Iq8O53Pr6HfHftbBAyub7s7gIPXcOE=; b=3z5bgwWT6QUszv
	BJ4dupZBgigqHxNv92+TjQql9M5n8pIJc7XmWI2fWnfktNzl4R/AVvI+O6L09WL7/smIml5qKm8OZ
	VIgfE74Uxdfdch+FdMhkX+MpOep4NMotG90AARF6eboMlA7Wte4tIOucW+hwp+4dC5eWlLHiWXs/4
	5SYBu/Z/8gwQyLvqHUA1mzMdmtK93lxB5XjADSGkZ0mG+Y7jIYjwwyf3/s3h+9GGshUb2soMJf/tJ
	mVItUMgyd1FUin3yAiXHFB1pafdMnGHKpxk31FLwHrsRDZW6ZqVg04ehUkL2F9L/VW3gafHUJ3KCx
	CiVEeInsc2he+3X+Wy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdBv-00000002aJe-0moW;
	Mon, 24 Mar 2025 08:29:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdBr-00000002aI1-2ztj
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:29:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22435603572so69527035ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742804986; x=1743409786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qMUlDAaek7Ax30c0AGSTiyhNrDt/tYOpdl5MsMoLow=;
        b=MVaSNac9UlP+ef8uLH8xwQ0DV1ZWtxK5uXUA3IhVI46E5lKvrsmwRrhGdafWvtA64m
         jhYxRE1wbdyAqLSiUtdqev5LTwyg0P8gHNAEPp8Ijv42/a7oommg5a7HWzp0oMC8Pc4h
         kFlANAZp97fvx7heWaZ5Y1gS1X4wcZIyd0QCHyF7L3BLn7Sz7s3Yd1tXAaa+6XHhNUCC
         IkjRWqgwAVSLH+JY7JT0pDJ61AJ3tKJYbPHZN5q8qVoHb9yUs3/VxBFAtAh8bZ4fycXN
         3qucPkKEZa86UB4QIUMB/t5LxB+QHTIC3mFkN3I2FrnI4izbTacVUzLcq92hyUUDn/zu
         Odsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804986; x=1743409786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qMUlDAaek7Ax30c0AGSTiyhNrDt/tYOpdl5MsMoLow=;
        b=FVX5SiVxSuExntUczVeHjI4ifiIKXSIQoTe1nDNHI+ejcE77TkrLuZZ5BHUqurWss1
         8npZPcp6pzgvE/L/EJi3Ffmk/HQY9ZPywRK+vj6UVKPUJsM8fgT14cb5k3VsEpRVDeJM
         CMr9tRNtvYgb8khzcVERjduG911QmqakDP72EPnTRxmusxmfoeIh+OJ5YKRy2Skl+UHZ
         HFRgOryvPtJI9ckB9KmoEPa3oIa18ULK1IEd6dnYhlBLrGB+tm9NPinr8QnCTav/kHYA
         Z5yh9VqTW0et7gQD3N4rct/r/SAaluhytXrPA7DAeBRCgWt5BIhQPe1DnCxhVIykstE3
         aF0w==
X-Forwarded-Encrypted: i=1; AJvYcCUjiImtjraAJxIIpWt7saOoxK2Erk9teh8w4LoZ/g/SRhtTWZPAGlNzrdXvrFkNyDH4/GZOmiRQlcg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Vsm4aUvKACP43HEv9EL4KyBoYB7ntxmj4mrylB2fPafmUTHr
	/UtvwkiQVMETgHKWCn4+5992nwsOjJKuD8kv519ePDhwOrkcZJzkgK6CN7uT3NM=
X-Gm-Gg: ASbGncsLqKRJAY1wys8c/2RgTWDsJlYzohlTMxBPtwaDvux+LadZNkLlwaVxBP+qfr0
	JYkCjoR4v3zHAbE290wZgYjNrpYrGvNoYDXydcSk4Y8yW9WKQeseVVWTg2HmzCJOmnVN7SR85uK
	rY1CL9YM9eSNa14JXVHoQ7vLfmWNF1szD68mxEssn9mAEfxLtrwAatPaiBFtXkYA11bSqmi2ujM
	402FgZVGBw1FTM7yJID6t4QD1SzS5ikopxdAJI5y27NHNPoh6Lwfc9VqZK6tzjP3gcYtgfqK5zs
	3adrnhnv4ktELukrQpl3TfenEjKCh8/fwcTtcXtXgiCUKi1TXAeBZI/BKy/lqREtGJqlSc8Di3L
	a1xhQR+ONpep5kw==
X-Google-Smtp-Source: AGHT+IE/svKRMr10qo5TWA29tMIKA3okBWKKu6uK4vQbAlDiEPBzS0bf2OPavcRs7sE+zsZm2iXV3g==
X-Received: by 2002:a05:6a20:a109:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-1fe433193c6mr24677051637.37.1742804986196;
        Mon, 24 Mar 2025 01:29:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4747bsm6509935a12.68.2025.03.24.01.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:29:45 -0700 (PDT)
Message-ID: <779c137d-5030-4212-b957-3d2620448ea9@rivosinc.com>
Date: Mon, 24 Mar 2025 09:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
 <20250322-cce038c88db88dd119a49846@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250322-cce038c88db88dd119a49846@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_012947_881762_EBA18F61 
X-CRM114-Status: GOOD (  15.28  )
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

CgpPbiAyMi8wMy8yMDI1IDEzOjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTcsIDIwMjUgYXQgMDY6MDY6MDhQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
IGZldyBuZXcgZXJyb3JzIGhhdmUgYmVlbiBhZGRlZCB3aXRoIFNCSSBWMy4wLCBtYXBzIHRoZW0g
YXMgY2xvc2UgYXMKPj4gcG9zc2libGUgdG8gZXJybm8gdmFsdWVzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDkgKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+PiBpbmRleCBiYjA3N2Qw
YzkxMmYuLmQxMWQyMjcxN2I0OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+IEBAIC01MzYs
MTEgKzUzNiwyMCBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfZXJyX21hcF9saW51eF9lcnJubyhp
bnQgZXJyKQo+PiAgCWNhc2UgU0JJX1NVQ0NFU1M6Cj4+ICAJCXJldHVybiAwOwo+PiAgCWNhc2Ug
U0JJX0VSUl9ERU5JRUQ6Cj4+ICsJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NLRUQ6Cj4+ICAJCXJl
dHVybiAtRVBFUk07Cj4+ICAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06Cj4+ICsJY2FzZSBT
QklfRVJSX0lOVkFMSURfU1RBVEU6Cj4+ICsJY2FzZSBTQklfRVJSX0JBRF9SQU5HRToKPj4gIAkJ
cmV0dXJuIC1FSU5WQUw7Cj4+ICAJY2FzZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzoKPj4gIAkJ
cmV0dXJuIC1FRkFVTFQ7Cj4+ICsJY2FzZSBTQklfRVJSX05PX1NITUVNOgo+PiArCQlyZXR1cm4g
LUVOT01FTTsKPj4gKwljYXNlIFNCSV9FUlJfVElNRU9VVDoKPj4gKwkJcmV0dXJuIC1FVElNRTsK
Pj4gKwljYXNlIFNCSV9FUlJfSU86Cj4+ICsJCXJldHVybiAtRUlPOwo+PiAgCWNhc2UgU0JJX0VS
Ul9OT1RfU1VQUE9SVEVEOgo+PiAgCWNhc2UgU0JJX0VSUl9GQUlMVVJFOgo+PiAgCWRlZmF1bHQ6
Cj4+IC0tIAo+PiAyLjQ3LjIKPj4KPiAKPiBJJ20gbm90IGEgaHVnZSBmYW4gc2JpX2Vycl9tYXBf
bGludXhfZXJybm8oKSBzaW5jZSB0aGUgbWFwcGluZ3Mgc2VlbSBhIGJpdAo+IGFyYml0cmFyeSwg
YnV0IGlmIHdlJ3JlIGdvaW5nIHRvIGRvIGl0LCB0aGVuIHRoZXNlIGxvb2sgcHJldHR5IGdvb2Qg
dG8gbWUuCj4gT25seSBvdGhlciB0aG91Z2h0IEkgaGFkIHdhcyBFMkJJRyBmb3IgYmFkLXJhbmdl
LCBidXQgbmFoLi4uCgpZZWFoIEkgYWxzbyB0aGluayBzb21lIG1hcHBpbmdzIGFyZSBhIGJpdCBv
ZGQgZXZlbiB0aG91Z2ggSSBza2ltbWVkCnRocm91Z2ggdGhlIHdob2xlIGVycm5vIGxpc3QgdG8g
ZmluZCB0aGUgYmVzdCBwb3NzaWJsZSBtYXBwaW5ncy4gSSdkIGJlCmhhcHB5IHRvIGZpbmQgc29t
ZXRoaW5nIGJldHRlciB0aG91Z2guCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAKPiBUaGFua3MsCj4g
ZHJldwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
