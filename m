Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CB7C8303C
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEh6iy2nF4oVrgqiJzSs8blk8oqjL1zyWJCXffLXMLs=; b=DQaKVLDRhOGS7A
	xhUXku5fO81TFrzYSVZBftUeZtjbZKu7Idxrq7UHUOIlTnFtqBbdv+WelR0+9ouarZ4P4fyTeOtzx
	WbRAiRot1440/RSY8Fxrskz4mUJpUg1/uXP5x8cvs3Spf11BT6pYpzjX4Wz2591SUWMUD7uakTJPZ
	eqdpUHTIv0NDsYCl26FpSa7P/HfXWUejIgkGh1IGk53s/orbvQ3P9HwZQZ7CxBWE751ymbksuVljg
	CYBrMrP1sZAqJj0wJGPrEnpMgJIUAwCJHwyqkAcdttYc2zW7Xe+WGvQ05NND0DeNDp4O4b+KJFm5P
	UAanBXVeUsN7TxLCnd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoKW-00000002xsf-3lqo;
	Mon, 07 Jul 2025 16:04:32 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoE2-00000002wcf-0SZN
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 15:57:52 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5331f409ed2so1048487e0c.2
        for <kvm-riscv@lists.infradead.org>; Mon, 07 Jul 2025 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751903869; x=1752508669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2E5cIdhxg/ojvcvXGJB1lbbv+v+IiFh5kTQm4LE4vM=;
        b=xR+UziZ2j7/ww8zJiIpRyPHFknrD0ApDoSuov3wcq2hCDNzEi+3EfxVEYEuN1AJbO9
         uhvLVxBr1p0N0p67TbqbiZkqKNLEeFbeaTBRLzRlbjBR5MvTmFTQK3CIz8XPbqU9PMvv
         m5Hyv6eBm4m+5TWzuEQy9BMOLwF+6xP7aZE99qX3CqZ6izyC/uCsqIBaqOUhnEoFjP2F
         b2d4tDMVPuRQajYwV0yRYh/bUa7IplHtvrEpUSzC+dknRdpYv6kEkQm760SfWFsfy2y/
         nupROngaDeMAUa3mjvUxLZ2kIx7uo4PxoWetVwCFPld9Tk5IBBdUln7jVXX2o9hoBc+1
         +zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903869; x=1752508669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2E5cIdhxg/ojvcvXGJB1lbbv+v+IiFh5kTQm4LE4vM=;
        b=g7m2Zsym6yE8ZRKTpe3TcJ6NPMKol+FwUdQGF+fJgjp+ZcnboZ+rG+5uP002mxmBhB
         ZUfEvbk2yc7Y3pQ89FBuSZ4MsDLDB+WuXGgWtQfIJIJslTt62gAU2C+8hJKrMMIefrkQ
         nuaTx0xoXLvT3A8bwlJZ0PwZOQ1VMs6AYfq+BS5k0vYsD6PHPLuIZaEw0k/t7J8A4P5r
         FT1YRpUht2B52I/XUqGuK/oFRwtnO/t6OYlHh1RQteQ0p6hiZmgFt2WFI+9fj1lz0IPn
         02MIB3JVzPqn6m5OQj8wsfueHehg9cOTRV5qswgAmwvrSv0k1Whl2mc9vFnPlgEblSzZ
         rNVA==
X-Forwarded-Encrypted: i=1; AJvYcCXPxK3HKt31p6PFBAzCgAiXTkzVc/5DkWwYCik5pD27jSqmbmCCZHy4VeWYCW9IkxZlfggr3sK4TW0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcsk+qUbsazEgKND3hgXsA0/Fvj5fvzwnbAgjTzMxko1gauNbC
	hqTI/50HqtERz6denbEF1840mLXksHqZ7eVTZTKIt7oyMM02Ii5lLfg0rY3cXzWl8HAK8p0etfe
	8IjqyOG+ImcchmY6dHh3YsnADY1VLDYnjhHWc1aCO8w==
X-Gm-Gg: ASbGncuOliR/wJCPyM+zJrweCBgkFpyIykVVuXlE4kx6HQqxJlFXSBCHltpH0bhg7IB
	igHrRfuI7kj9qqZiY/V+yNRLw2QLd3czKLNLDsWKq/zjb5sCPQGgezUePdwaVPtrGW1JPZ4hTAd
	GVBFEhqlbppPE9N0s+5w0WfdvW9/kS15TumQJzQnPItf0V
X-Google-Smtp-Source: AGHT+IG83OaC97fyeBUFVcKnhoVFbQwxYmxWEbEawOKd8uVSosvhYb1MRRCRVFBcwLwnoYO9V/PkMpf2ALbHn8DuLnc=
X-Received: by 2002:a05:6102:ccd:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4f305a51b80mr4786381137.9.1751903869005; Mon, 07 Jul 2025
 08:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250703133601.1396848-1-jesse@rivosinc.com> <20250704-d2ca01be799a71427b5163f9@orel>
In-Reply-To: <20250704-d2ca01be799a71427b5163f9@orel>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 7 Jul 2025 08:57:37 -0700
X-Gm-Features: Ac12FXxNTb7nbFaguHzid07JIa3WSqwBPgoV0EUNKkJ16t72IZytygu-yOOQ0OE
Message-ID: <CALSpo=bieq=T8DZR9u=MeEs4w+6_fAshYcpVj4zC-zRhKkc6OA@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH] riscv: lib: Add sbi-exit-code to configure
 and environment
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, James Raphael Tiovalen <jamestiotio@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Cade Richard <cade.richard@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_085750_155199_64A3080E 
X-CRM114-Status: GOOD (  33.82  )
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCAxOjE34oCvQU0gQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9u
ZXNAbGludXguZGV2PiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDAzLCAyMDI1IGF0IDA2OjM2OjAw
QU0gLTA3MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+ID4gQWRkIC0tW2VuYWJsZXxkaXNhYmxlXS1z
YmktZXhpdC1jb2RlIHRvIGNvbmZpZ3VyZSBzY3JpcHQuCj4gPiBXaXRoIHRoZSBkZWZhdWx0IHZh
bHVlIGRpc2FibGVkLgo+ID4gQWRkIGEgY2hlY2sgZm9yIFNCSV9QQVNTX0VYSVRfQ09ERSBpbiB0
aGUgZW52aXJvbm1lbnQsIHNvIHRoYXQgcGFzc2luZwo+ID4gb2YgdGhlIHRlc3Qgc3RhdHVzIGlz
IGNvbmZpZ3VyYWJsZSBmcm9tIGJvdGggdGhlCj4gPiBlbnZpcm9ubWVudCBhbmQgdGhlIGNvbmZp
Z3VyZSBzY3JpcHQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgY29uZmlndXJlICAgICAgfCAxMSArKysrKysrKysrKwo+
ID4gIGxpYi9yaXNjdi9pby5jIHwgMTIgKysrKysrKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZSBiL2NvbmZpZ3VyZQo+ID4gaW5kZXggMjBiZjUwNDIuLjdjOTQ5YmRjIDEwMDc1NQo+
ID4gLS0tIGEvY29uZmlndXJlCj4gPiArKysgYi9jb25maWd1cmUKPiA+IEBAIC02Nyw2ICs2Nyw3
IEBAIGVhcmx5Y29uPQo+ID4gIGNvbnNvbGU9Cj4gPiAgZWZpPQo+ID4gIGVmaV9kaXJlY3Q9Cj4g
PiArc2JpX2V4aXRfY29kZT0wCj4gPiAgdGFyZ2V0X2NwdT0KPiA+Cj4gPiAgIyBFbmFibGUgLVdl
cnJvciBieSBkZWZhdWx0IGZvciBnaXQgcmVwb3NpdG9yaWVzIG9ubHkgKGkuZS4gZGV2ZWxvcGVy
IGJ1aWxkcykKPiA+IEBAIC0xNDEsNiArMTQyLDkgQEAgdXNhZ2UoKSB7Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzeXN0ZW0gYW5kIHJ1biBmcm9tIHRoZSBVRUZJIHNoZWxs
LiBJZ25vcmVkIHdoZW4gZWZpIGlzbid0IGVuYWJsZWQKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFuZCBkZWZhdWx0cyB0byBlbmFibGVkIHdoZW4gZWZpIGlzIGVuYWJsZWQg
Zm9yIHJpc2N2NjQuCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoYXJtNjQg
YW5kIHJpc2N2NjQgb25seSkKPiA+ICsgICAgICAgICAtLVtlbmFibGV8ZGlzYWJsZV0tc2JpLWV4
aXQtY29kZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRW5hYmxlIG9yIGRp
c2FibGUgc2VuZGluZyBwYXNzL2ZhaWwgZXhpdCBjb2RlIHRvIFNCSSBTUlNULgo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRpc2FibGVkIGJ5IGRlZmF1bHQsIHJpc2N2IG9u
bHkpCj4gPiAgRU9GCj4gPiAgICAgIGV4aXQgMQo+ID4gIH0KPiA+IEBAIC0yMzYsNiArMjQwLDEy
IEBAIHdoaWxlIFtbICRvcHRubyAtbGUgJGFyZ2MgXV07IGRvCj4gPiAgICAgICAtLWRpc2FibGUt
ZWZpLWRpcmVjdCkKPiA+ICAgICAgICAgICBlZmlfZGlyZWN0PW4KPiA+ICAgICAgICAgICA7Owo+
ID4gKyAgICAgLS1lbmFibGUtc2JpLWV4aXQtY29kZSkKPiA+ICsgICAgICAgICBzYmlfZXhpdF9j
b2RlPTEKPiA+ICsgICAgICAgICA7Owo+ID4gKyAgICAgLS1kaXNhYmxlLXNiaS1leGl0LWNvZGUp
Cj4gPiArICAgICAgICAgc2JpX2V4aXRfY29kZT0wCj4gPiArICAgICAgICAgOzsKPiA+ICAgICAg
IC0tZW5hYmxlLXdlcnJvcikKPiA+ICAgICAgICAgICB3ZXJyb3I9LVdlcnJvcgo+ID4gICAgICAg
ICAgIDs7Cj4gPiBAQCAtNTUxLDYgKzU2MSw3IEBAIEVPRgo+ID4gIGVsaWYgWyAiJGFyY2giID0g
InJpc2N2MzIiIF0gfHwgWyAiJGFyY2giID0gInJpc2N2NjQiIF07IHRoZW4KPiA+ICAgICAgZWNo
byAiI2RlZmluZSBDT05GSUdfVUFSVF9FQVJMWV9CQVNFICR7dWFydF9lYXJseV9hZGRyfSIgPj4g
bGliL2NvbmZpZy5oCj4gPiAgICAgIFsgIiRjb25zb2xlIiA9ICJzYmkiIF0gJiYgZWNobyAiI2Rl
ZmluZSBDT05GSUdfU0JJX0NPTlNPTEUiID4+IGxpYi9jb25maWcuaAo+ID4gKyAgICBlY2hvICIj
ZGVmaW5lIENPTkZJR19TQklfRVhJVF9DT0RFICR7c2JpX2V4aXRfY29kZX0iID4+IGxpYi9jb25m
aWcuaAo+ID4gICAgICBlY2hvID4+IGxpYi9jb25maWcuaAo+ID4gIGZpCj4gPiAgZWNobyAiI2Vu
ZGlmIiA+PiBsaWIvY29uZmlnLmgKPiA+IGRpZmYgLS1naXQgYS9saWIvcmlzY3YvaW8uYyBiL2xp
Yi9yaXNjdi9pby5jCj4gPiBpbmRleCBiMTE2MzQwNC4uMGU2NjYwMDkgMTAwNjQ0Cj4gPiAtLS0g
YS9saWIvcmlzY3YvaW8uYwo+ID4gKysrIGIvbGliL3Jpc2N2L2lvLmMKPiA+IEBAIC0xNjIsOCAr
MTYyLDE4IEBAIHZvaWQgaGFsdChpbnQgY29kZSk7Cj4gPgo+ID4gIHZvaWQgZXhpdChpbnQgY29k
ZSkKPiA+ICB7Cj4gPiArICAgICBjaGFyICpzID0gZ2V0ZW52KCJTQklfUEFTU19FWElUX0NPREUi
KTsKPiA+ICsgICAgIGJvb2wgcGFzc19leGl0ID0gQ09ORklHX1NCSV9FWElUX0NPREU7Cj4KPiBU
aGlzIGlzIHRoZSBmaXJzdCBjYXNlIG9mIHdoYXQgbWF5IGJlY29tZSBtb3JlIGNvbW1vbiAtIGEg
Y29uZmlnIHZhcmlhYmxlCj4gd2hpY2ggYWxzbyBoYXMgYW4gZW52IG92ZXJyaWRlLiBJIHRoaW5r
IGl0IG1heSBiZSBnb29kIGNvbnZlbnRpb24gdG8KPiBuYW1lIHRoZW0gdGhlIHNhbWUsIGkuZS4g
dGhlIGVudiBuYW1lIHdvdWxkIGFsc28gYmUgQ09ORklHX1NCSV9FWElUX0NPREUsCj4gdW5sZXNz
IHlvdSB0aGluayB0aGF0IHdvdWxkIGJlIGNvbmZ1c2luZyBmb3Igc29tZSByZWFzb24/CgpJIGNo
YW5nZWQgdGhlIG5hbWUgYmVjYXVzZSB0aGUgY29uZmlndXJlIG9wdGlvbiBzZWVtZWQgdmVyeSBs
b25nLgpJIHdpbGwgbWFrZSB0aGVtIGJvdGggU0JJX0VYSVRfQ09ERS4gU2hvdWxkIEkgYWRkIGEg
bWFjcm8gdG8gc2ltcGxpZnkKZnV0dXJlIHVzZXMKb2YgYSBjb25maWcgdmFyaWFibGUgd2hpY2gg
YWxzbyBoYXMgYW4gZW52IG92ZXJyaWRlLgoKPgo+ID4gKwo+ID4gICAgICAgcHJpbnRmKCJcbkVY
SVQ6IFNUQVRVUz0lZFxuIiwgKChjb2RlKSA8PCAxKSB8IDEpOwo+ID4gLSAgICAgc2JpX3NodXRk
b3duKGNvZGUgPT0gMCk7Cj4gPiArCj4gPiArICAgICBpZiAocykKPiA+ICsgICAgICAgICAgICAg
cGFzc19leGl0ID0gKCpzID09ICcxJyB8fCAqcyA9PSAneScgfHwgKnMgPT0gJ1knKTsKPgo+IFdl
IG5vdyBoYXZlIHRoaXMgbG9naWMgaW4gZm91ciBwbGFjZXNbMV0uIEkgdGhpbmsgaXQncyB0aW1l
IHdlIGZhY3RvciBpdCwKPiBhbmQgaXQncyBjb3VudGVycGFydCAiIShzICYmICgqcyA9PSAnMCcg
fHwgKnMgPT0gJ24nIHx8ICpzID09ICdOJykpIgo+IGludG8gYSBjb3VwbGUgaGVscGVyIG1hY3Jv
cy4gSSdtIG5vdCBzdXJlIHdoZXJlIHRoZSBiZXN0IHBsYWNlIGZvcgo+IHRob3NlIG1hY3JvcyB0
byBsaXZlIGlzLCB0aG91Z2guIEkgZ3Vlc3MgbGliY2ZsYXQuaCwgYnV0IHdlIHJlYWxseQo+IG91
Z2h0IHRvIHNwbGl0IHRoYXQgdGhpbmcgYXBhcnQgc29tZWRheS4uLgoKSXMgbGliL2FyZ3YuaCBh
biBvayBwbGFjZT8KZ2V0ZW52IGlzIGRlZmluZWQgaW4gbGliL3N0cmluZy5jIHdoaWNoIGlzIGlu
dGVyZXN0aW5nLiBJIHdvbmRlciBpZiBpdApjb3VsZCBiZSBtb3ZlZCB0byBsaWIvYXJndi5jPwoK
VGhhbmtzLApKZXNzZSBUYXViZQo+Cj4gWzFdCj4gIC0gdHdpY2UgaW4gbGliL2VycmF0YS5oCj4g
IC0gb25jZSBpbiByaXNjdi9zYmktdGVzdHMuaGEKPiAgLSBhbmQgbm93IGhlcmUKPgo+ID4gKwo+
ID4gKyAgICAgaWYgKHBhc3NfZXhpdCkKPiA+ICsgICAgICAgICAgICAgc2JpX3NodXRkb3duKGNv
ZGUgPT0gMCk7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHNiaV9zaHV0ZG93bih0
cnVlKTsKPgo+IG5pdDogY2FuIGJlIHdyaXR0ZW4gbW9yZSBjb25jaXNlbHkgYXMKPgo+ICBzYmlf
c2h1dGRvd24ocGFzc19leGl0ID8gY29kZSA9PSAwIDogdHJ1ZSkKPgo+ID4gICAgICAgaGFsdChj
b2RlKTsKPiA+ICAgICAgIF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpOwo+ID4gIH0KPiA+IC0tCj4g
PiAyLjQzLjAKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
