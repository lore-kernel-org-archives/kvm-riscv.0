Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BE3C02183
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qo+grC0jwXz52qybmwkjn/GkLP+xfpng4oJKNYQGI7o=; b=3mbNhmTVCdcxk+
	IPhNIutAX43Fuzq+uFE5xTyIQavqYdACjkTtWaJyY/Tmx1vXFxn/c40WIrL6EMKr7tFNZ2ME95i3z
	Ch8e6jJNBcWye0QHFESexlVPfJ7QG9n57IHfl32yIAK3ZQsd/FB+/QacD3Fb4GaJWk/ilbKm0nmz5
	UO2WIDzYPqfuFmctZyM6Zo77cfBL4ZIY7t6PT5t5JLHBeZWCxM0VuDGmHh+vpyEMnex/CdNEAv+Ms
	p03VB9e2ITN+gAp8vfNY4KM7VG4bAx8o9UtZALq5zRViXeTkXorVCpSehwvANVg1P2/YrgEFCWTDg
	fEQj+Bpc2BXxd+iQfUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnyX-00000000Z0Y-46t8;
	Fri, 17 Jan 2025 15:09:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnyV-00000000Yzj-35El
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 15:09:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14975905e9.0
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Jan 2025 07:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737126569; x=1737731369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeBHQLs9jVU95ezPlxDDqu8VwoV3ld6Y4fMnADed+lM=;
        b=kuPYzz80ptYo8cYMwP1+8V4AqXoMjBKBWuFePGlHm8UwEzq6jkPqWH6gvFhSjRLezo
         Oug0HihaXQ5hNZwySunkoTikjH813O2vmlALy1RQrwPJYuKcq2CqHm8RpH4e4e8mGfMr
         aly5xuxJe/4IvL8zrgRpvVPyWn79kMb71zlc+ZxA6ZOuXvU+Tv5cjz5f6ojlorJivuun
         WJzioL+rFLhpIYlQfzKilRgdk5a3JztIlycebOHNGh+Fo9djfXdnP3YDBPU2YxOCHjp9
         diE1YAEtcEQu3kbXK99MNLxSt8afMehs4UdVefXOgxRQkvd4RwXPgfHr+jr7bFMqp7YL
         xOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737126569; x=1737731369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eeBHQLs9jVU95ezPlxDDqu8VwoV3ld6Y4fMnADed+lM=;
        b=qwiy0wU20H982Bq7jILHvXGuZPHOPsuhKaGfe0SKompcavvNaU6sSfd1Z2m5iSQMHz
         Ge9jTpf2qTSfqci6TRSmWmDn+DipGuvEgLGE5XqwQJJTLm99pSzB/AmiyXusfOsmqZr9
         +f7nml70j2zjtOG/0YW+DsqJuIWM3Lmz3A8CQ/b+8Ba54Y0AcTYeMVTppKGDhEh/RUNt
         iX+IaEB8wrCnNBCxUxVOQzJDeVIwnts8bX5g4ZI9PhxArJ7dpb5btRTa+GxblZeFm5CR
         qNizmrOXoUV7uLjYEOYvK8IZunr7Hz1GxCLQ0EAJh1bc6TwEVL3+dGyq9oDV6wrpUwPS
         v++A==
X-Forwarded-Encrypted: i=1; AJvYcCUrrE8IKDe0zsum8f7iM3IDfwx2jdmjcl07ujjawUb+74EW4cCNJBmy5s18gAyQgeEymq7vdDE14Ec=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVPRtNMXfsxWRftPTYuiONoNWwBxp2YIRMB8zxiUvcR0O/RwjF
	yY/nAnsJxj4xaqoMgcgF1uT0lpw0hdvhbeAd8lbVJNSvM3hgpd7ufU/jNZHdc8I=
X-Gm-Gg: ASbGncsvv6dA1npTeoz/PO/49ivtmK8lgSZudjydd4NUjWJKBxfqgm0fsD/yXCKCjtC
	FBf0pW5GUdVpWBuYGdxwm8Z/n3Pqdy68Rp5NAAHuyqJ9LJIQyH/fg7aMiT357QqaAmI9AoMc3TW
	ov5/QXuEJpOCFpL6p208AAgMAl68EmB34SIQ1XIbZRxOd0Eoh0TUU+bexfidwBGahnPdedN8OFh
	7kkKo8amjvxoA8UkAI+BuvtlRRNMJZ1F6spRege4Z9TyBmYDENClIyadU6UrxNM6tvspE7IeO1B
	IbLHJpICCIIO31avXGS9lE2jVQ==
X-Google-Smtp-Source: AGHT+IG1uZGUInjJmwhJbH8Ho3BFf5w1Dx39oNxBLgMYa7175SzgdXR9MqOpaXnkZP4l9hYELj4CQA==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr30286255e9.6.1737126568985;
        Fri, 17 Jan 2025 07:09:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm101555505e9.3.2025.01.17.07.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 07:09:28 -0800 (PST)
Message-ID: <24f9b863-9b88-4a58-a7a0-b562f6be56ad@rivosinc.com>
Date: Fri, 17 Jan 2025 16:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] riscv: request misaligned exception delegation from
 SBI
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-3-cleger@rivosinc.com>
 <fca2a328-f2c4-4df3-9086-06b8a12b8da4@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <fca2a328-f2c4-4df3-9086-06b8a12b8da4@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_070931_967309_5BDE3CAB 
X-CRM114-Status: GOOD (  18.69  )
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

CgpPbiAxMS8wMS8yMDI1IDAwOjM1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBIaSBDbMOpbWVu
dCwKPiAKPiBPbiAyMDI1LTAxLTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4g
Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cj4+IG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZy
b20gU0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCj4+IGV4dGVuc2lvbiBkZWZpbmVkIGluIFNC
SSB2ZXJzaW9uIDMuMC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oICAgICAgICB8ICAxICsKPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYyAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysKPj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8ICAyICsKPj4gIDMgZmlsZXMgY2hhbmdlZCwg
NjIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiBp
bmRleCA0YmQwNTRjNTRjMjEuLmNkNDA2ZmUzN2RmOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmgKPj4gQEAgLTYyLDYgKzYyLDcgQEAgdm9pZCBfX2luaXQgcmlzY3ZfdXNl
cl9pc2FfZW5hYmxlKHZvaWQpOwo+PiAgCV9SSVNDVl9JU0FfRVhUX0RBVEEoX25hbWUsIF9pZCwg
X3N1Yl9leHRzLCBBUlJBWV9TSVpFKF9zdWJfZXh0cyksIF92YWxpZGF0ZSkKPj4gIAo+PiAgYm9v
bCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpOwo+PiArdm9p
ZCB1bmFsaWduZWRfYWNjZXNzX2luaXQodm9pZCk7Cj4+ICAjaWYgZGVmaW5lZChDT05GSUdfUklT
Q1ZfU0NBTEFSX01JU0FMSUdORUQpCj4+ICB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCk7Cj4+ICB2b2lk
IHVuYWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCj4+IGluZGV4IDdjYzEwOGFlZDc0ZS4uNGFjYTYwMDUyN2U5IDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IEBAIC0xNiw2ICsxNiw3IEBACj4+
ICAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgo+PiAgI2luY2x1ZGUgPGFzbS9od3Byb2Jl
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4gKyNpbmNsdWRlIDxhc20vc2Jp
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+PiAgCj4+ICAjZGVmaW5lIElOU05fTUFU
Q0hfTEIJCQkweDMKPj4gQEAgLTY4OSwzICs2OTAsNjEgQEAgYm9vbCBjaGVja191bmFsaWduZWRf
YWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+
PiAgI2VuZGlmCj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCj4+ICsKPj4gK3N0cnVj
dCBtaXNhbGlnbmVkX2RlbGVnX3JlcSB7Cj4+ICsJYm9vbCBlbmFibGU7Cj4+ICsJaW50IGVycm9y
Owo+PiArfTsKPj4gKwo+PiArc3RhdGljIHZvaWQKPj4gK2NwdV91bmFsaWduZWRfc2JpX3JlcXVl
c3RfZGVsZWdhdGlvbih2b2lkICphcmcpCj4+ICt7Cj4+ICsJc3RydWN0IG1pc2FsaWduZWRfZGVs
ZWdfcmVxICpyZXEgPSBhcmc7Cj4+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4+ICsKPj4gKwlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAo+PiArCQkJU0JJX0ZX
RlRfTUlTQUxJR05FRF9FWENfREVMRUcsIHJlcS0+ZW5hYmxlLCAwLCAwLCAwLCAwKTsKPj4gKwlp
ZiAocmV0LmVycm9yKQo+PiArCQlyZXEtPmVycm9yID0gMTsKPj4gK30KPj4gKwo+PiArc3RhdGlj
IHZvaWQgdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24odm9pZCkKPj4gK3sKPj4gKwlz
dHJ1Y3QgbWlzYWxpZ25lZF9kZWxlZ19yZXEgcmVxID0ge3RydWUsIDB9Owo+PiArCj4+ICsJb25f
ZWFjaF9jcHUoY3B1X3VuYWxpZ25lZF9zYmlfcmVxdWVzdF9kZWxlZ2F0aW9uLCAmcmVxLCAxKTsK
Pj4gKwlpZiAoIXJlcS5lcnJvcikgewo+PiArCQlwcl9pbmZvKCJTQkkgbWlzYWxpZ25lZCBhY2Nl
c3MgZXhjZXB0aW9uIGRlbGVnYXRpb24gb2tcbiIpOwo+PiArCQkvKgo+PiArCQkgKiBOb3RlIHRo
YXQgd2UgZG9uJ3QgaGF2ZSB0byB0YWtlIGFueSBzcGVjaWZpYyBhY3Rpb24gaGVyZSwgaWYKPj4g
KwkJICogdGhlIGRlbGVnYXRpb24gaXMgc3VjY2Vzc2Z1bCwgdGhlbgo+PiArCQkgKiBjaGVja191
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkgd2lsbCB2ZXJpZnkgdGhhdCBpbmRlZWQgdGhlCj4+
ICsJCSAqIHBsYXRmb3JtIHRyYXBzIG9uIG1pc2FsaWduZWQgYWNjZXNzZXMuCj4+ICsJCSAqLwo+
PiArCQlyZXR1cm47Cj4+ICsJfQo+PiArCj4+ICsJLyoKPj4gKwkgKiBJZiBhdCBsZWFzdCBkZWxl
Z2F0aW9uIHJlcXVlc3QgZmFpbGVkIG9uIG9uZSBoYXJ0LCByZXZlcnQgbWlzYWxpZ25lZAo+PiAr
CSAqIGRlbGVnYXRpb24gZm9yIGFsbCBoYXJ0cywgaWYgd2UgZG9uJ3QgZG8gdGhhdCwgd2UnbGwg
cGFuaWMgYXQKPj4gKwkgKiBtaXNhbGlnbmVkIGRlbGVnYXRpb24gY2hlY2sgdGltZSAoc2VlCj4+
ICsJICogY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCgpKS4KPj4gKwkgKi8KPj4gKwly
ZXEuZW5hYmxlID0gZmFsc2U7Cj4+ICsJcmVxLmVycm9yID0gMDsKPj4gKwlvbl9lYWNoX2NwdShj
cHVfdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24sICZyZXEsIDEpOwo+PiArCWlmIChy
ZXEuZXJyb3IpCj4+ICsJCXBhbmljKCJGYWlsZWQgdG8gZGlzYWJsZSBtaXNhbGlnbmVkIGRlbGVn
YXRpb24gZm9yIGFsbCBDUFVzXG4iKTsKPiAKPiBUaGlzIGxvZ2ljIGRvZXNuJ3QgaGFuZGxlIHRo
ZSBjYXNlIHdoZXJlIHRoZSBkZWxlZ2F0aW9uIHJlcXVlc3QgZmFpbGVkIG9uIGV2ZXJ5Cj4gQ1BV
LCBzbyB0aGVyZSdzIG5vdGhpbmcgdG8gcmV2ZXJ0LiBUaGlzIGNhdXNlcyBhIHBhbmljIGluIGEg
S1ZNIGd1ZXN0IGluc2lkZQo+IHFlbXUtc29mdG1tdSAodGhlIGhvc3Qga2VybmVsIGRldGVjdHMg
TUlTQUxJR05FRF9TQ0FMQVJfRkFTVCwgc28KPiB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpIHJl
dHVybnMgZmFsc2UsIGFuZCBhbGwgRldGVCBjYWxscyBmYWlsKS4KCkhpIFNhbXVlbCwKCkluZGVl
ZCwgdGhhdCdzIGEgcHJvYmxlbSBhbmQgdGhlIHJldmVydCBpcyBub3QgcmVhbGx5IGNsZWFuIHNp
bmNlIGl0IGlzCmNhbGxlZCBvbiBhbGwgQ1BVcyAoZXZlbiB0aGEgcm9uZSB0aGF0IGZhaWxlZCku
IEknbGwgbW9kaWZ5IHRoYXQgdG8gdXNlCmNwdW1hc2tzIGFuZCB0aHVzIGNsZWFubHkgcmV2ZXJ0
IHRoZSBtaXNhbGlnbmVkIGRlbGVnYXRpb24gb24gQ1BVcyB0aGF0CmFjdHVhbGx5IHN1Y2NlZWRl
ZCBvbmx5LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gUmVnYXJkcywKPiBTYW11ZWwKPiAKPj4g
Kwo+PiArfQo+PiArCj4+ICt2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKQo+PiArewo+
PiArCWlmIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfRldGVCkgPiAwKQo+PiArCQl1bmFs
aWduZWRfc2JpX3JlcXVlc3RfZGVsZWdhdGlvbigpOwo+PiArfQo+PiArI2Vsc2UKPj4gK3ZvaWQg
dW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpIHt9Cj4+ICsjZW5kaWYKPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+PiBpbmRleCA5MWYxODljZjE2MTEuLjFl
MzE2NjEwMDgzNyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQuYwo+PiBAQCAtNDAzLDYgKzQwMyw4IEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19hbGxfY3B1cyh2b2lkKQo+PiAgewo+PiAgCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQs
IGFsbF9jcHVzX3ZlY191bnN1cHBvcnRlZDsKPj4gIAo+PiArCXVuYWxpZ25lZF9hY2Nlc3NfaW5p
dCgpOwo+PiArCj4+ICAJYWxsX2NwdXNfZW11bGF0ZWQgPSBjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkX2FsbF9jcHVzKCk7Cj4+ICAJYWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVkID0gY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKTsKPj4gIAo+IAoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
