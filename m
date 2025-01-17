Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8319CC02185
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HprdeuDPlkaY6vzU/Rc5fCqghkn99e1K2XAhV2EK2KU=; b=AvglKlQ7kEQMBK
	t5Hi+L2yMYw9PVyoxQ2hAlurl8pdDPld3VEc785Gvu8dnxZEFb9vinXCSEd9avlLFDjSafgbHqlba
	5r/WHaxiyGlCzl0XoiKj8rh8/alS2jylZbrmzZKIKy1hTnhRNEDLR0wmdiQczdwmhOyesfzKerLZr
	KU9UxfZi2H9FwVPXRYhy8L2+WNhIzQ7smGYmbBm+YaVcDvTOXeV/fWuBRpeXJhIncQ3nQwrAkgGxx
	WWMjbDY285WhnnX51z0glsl0uEMxDSA9h84yyWS/XbTWH9sH+wsos1wFrK/MYBI3QMpPgxymTGfwD
	+2eQLxNXq7BQ9riayepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpFb-00000000nNX-00rZ;
	Fri, 17 Jan 2025 16:31:15 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpFW-00000000nLm-476m
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 16:31:13 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3ce76b8d5bcso19166695ab.0
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Jan 2025 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737131469; x=1737736269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LgnsHnmS3fh5mDGhqIRf5OGV7HMImqUQ/i0e8Ovvcw=;
        b=BCmtuJK3he1GFJ1yw6hm2oq1k7wf0tGPRPUF69OJDqxqBkKg81vBOUlc4AN6/ulAGv
         suaeStQsLRD7GhBTpP8DyqcrdYILoVviVkaGu3eHoAU2SMelRZxanwL3EB4XHV3VfpEm
         XVZp/OZO7wWQkLqJNDZHzw/sjjQC1T08a6oiaPQAd0cINjbQLDFy9hEt8ma1ipZ3GA+k
         ddytyM0p1xCoJCLv643o8qD7tkghVrX/Oxprshaqkf0sueI7YgRAKVTBvkeRlgGMJ+bO
         qnmUp4RvmHfo0aXmPgjHgGov7YdOI2awUqj4U47ZUo8BImMZD5E7HzINiGl4gfVoDdnC
         f9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131469; x=1737736269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LgnsHnmS3fh5mDGhqIRf5OGV7HMImqUQ/i0e8Ovvcw=;
        b=pwoPt+hWuk5t2QLA2wILs5uA/v8mvF1yhWfdCPQNtdNOJwZvR8pJyLMxP8aKtii/Bz
         2cD7Xxva+jLa8ZShkFpN5qydFubrsHi2MhTMh6QazAADaXrFpcFi3wEqM5LIZbjNN3lO
         ZZ9Ie7ErxXnBR4Tuyfn7zNFSBxPFHwBK6rOmcoq3dIe47436WZLdrHWgK/KUV/3nNeWQ
         6JYJ/QKeqhjD7AZMXKNPYtYP9G66yaYMyLHEQFOESOumnbuBABF5uksY64R/VzHu9BaB
         e5w+O72Yq1JELsS2hOx3N4gCnupz2QeJLEwRGwS6ZqmInCDI/O2jatdZnREpTyWnw8bj
         VdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHng93yZV3/ueTY7dlXmuthcM66SoWyuQzQAzlB7KFH1pVW81QMhjijGOugGoyJxOVrgvcxrvmliI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDwT3UE7QvC6v1v/bmrSA8OF7XUyjzdNqJ49EP6l04B+3pZu28
	L8nN51BzUXkCukcBD14mtRLsS3+C6HKcAMqB+hFsNVqoLRRz3hjpbzAHg788EBQ=
X-Gm-Gg: ASbGncuiG4tMQsZ43ZG2gy/YZiaXO0DeBaAe3nYOanLZPHNZ3yGl6Y4BqG4I0bnWn92
	kntz9FaztMTtkvIOnzCj+P4swkIO7ihchWPGJpWgXnfGpJlTIrTI7sYwTWQpeb/CygZpY9VK2Ab
	jadQoafvGBf+2rUCzYnT7nQ3A1mcH4VrmbQlCW/akGb3JOtgJnHmmX72fHzbTMr7/RwGgqO0mZy
	6M4/jY+ppEbCaUCCbUopqueGNXR4TR+bHSQvdC+DWVOPuIdpZ2byhDbH1ScnbyllPZZiW025C8P
	+B2g
X-Google-Smtp-Source: AGHT+IFnKYDZSdNxxP6fjbNh6IOeT1lfl9g/Gyt6iEwmsb06hqBZJxurWC5Tjc8A5f2CPYlVAQFeaA==
X-Received: by 2002:a05:6e02:214d:b0:3a7:e7bd:9f09 with SMTP id e9e14a558f8ab-3cf743b447dmr25305575ab.5.1737131469361;
        Fri, 17 Jan 2025 08:31:09 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea7566e4a0sm695782173.121.2025.01.17.08.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:31:08 -0800 (PST)
Message-ID: <dff019ec-79dc-4be6-b1f4-02e48d84ebc2@sifive.com>
Date: Fri, 17 Jan 2025 10:31:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-7-cleger@rivosinc.com>
 <b3f54d34-bc77-46db-88da-70c0c602081f@sifive.com>
 <dec723d7-fc16-4edb-b684-1844b08391ba@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <dec723d7-fc16-4edb-b684-1844b08391ba@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_083111_063243_68E10F24 
X-CRM114-Status: GOOD (  22.99  )
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

SGkgQ2zDqW1lbnQsCgpPbiAyMDI1LTAxLTE3IDEwOjA1IEFNLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4gT24gMTEvMDEvMjAyNSAwMDo1NSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+IE9uIDIw
MjUtMDEtMDYgOTo0OCBBTSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4gU0JJX0ZXRlRfTUlT
QUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRvIGRlbGVnYXRlCj4+
PiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZXhjZXB0aW9ucy4gU2F2ZSBhbmQgcmVzdG9yZSBpdCBk
dXJpbmcgQ1BVCj4+PiBsb2FkL3B1dC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmMgICAgICAgICAgfCAgMyArKysKPj4+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0
LmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAgMiBmaWxlcyBj
aGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+Pj4gaW5kZXggMzQyMGE0YTYyYzk0
Li5iYjZmNzg4ZDQ2ZjUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+Pj4gQEAgLTY0MSw2ICs2NDEsNyBAQCB2b2lk
IGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4+ICB7Cj4+PiAgCXZv
aWQgKm5zaDsKPj4+ICAJc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vl
c3RfY3NyOwo+Pj4gKwlzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+YXJjaC5j
Zmc7Cj4+PiAgCj4+PiAgCXZjcHUtPmNwdSA9IC0xOwo+Pj4gIAo+Pj4gQEAgLTY2Niw2ICs2Njcs
NyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4+ICAJ
CWNzci0+dnN0dmFsID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU1RWQUwpOwo+Pj4gIAkJY3Ny
LT5odmlwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9IVklQKTsKPj4+ICAJCWNzci0+dnNhdHAg
PSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKPj4+ICsJCWNmZy0+aGVkZWxlZyA9IG5h
Y2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7Cj4+PiAgCX0gZWxzZSB7Cj4+PiAgCQljc3It
PnZzc3RhdHVzID0gY3NyX3JlYWQoQ1NSX1ZTU1RBVFVTKTsKPj4+ICAJCWNzci0+dnNpZSA9IGNz
cl9yZWFkKENTUl9WU0lFKTsKPj4+IEBAIC02NzYsNiArNjc4LDcgQEAgdm9pZCBrdm1fYXJjaF92
Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+PiAgCQljc3ItPnZzdHZhbCA9IGNzcl9y
ZWFkKENTUl9WU1RWQUwpOwo+Pj4gIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwo+
Pj4gIAkJY3NyLT52c2F0cCA9IGNzcl9yZWFkKENTUl9WU0FUUCk7Cj4+PiArCQljZmctPmhlZGVs
ZWcgPSBjc3JfcmVhZChDU1JfSEVERUxFRyk7Cj4+PiAgCX0KPj4+ICB9Cj4+PiAgCj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfZndmdC5jCj4+PiBpbmRleCA1NTQzM2U4MDViYWEuLjFlODVmZjY2NjZhZiAxMDA2
NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+Pj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+PiBAQCAtMTQsNiArMTQsOCBAQAo+Pj4gICNp
bmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4+PiAgI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9z
YmlfZndmdC5oPgo+Pj4gIAo+Pj4gKyNkZWZpbmUgTUlTX0RFTEVHICgxVUwgPDwgRVhDX0xPQURf
TUlTQUxJR05FRCB8IDFVTCA8PCBFWENfU1RPUkVfTUlTQUxJR05FRCkKPj4+ICsKPj4+ICBzdGF0
aWMgY29uc3QgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0dXJl
c1tdID0gewo+Pj4gIAlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPj4+ICAJU0JJX0ZX
RlRfTEFORElOR19QQUQsCj4+PiBAQCAtMzUsNyArMzcsNDQgQEAgc3RhdGljIGJvb2wga3ZtX2Z3
ZnRfaXNfZGVmaW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGZlYXR1cmUpCj4+
PiAgCXJldHVybiBmYWxzZTsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIGJvb2wga3ZtX3NiaV9m
d2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+Pj4gK3sKPj4+ICsJaWYgKCF1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpKQo+Pgo+PiBUaGlz
IHNlZW1zIGxpa2UgdGhlIHdyb25nIGNvbmRpdGlvbi4gUGF0Y2ggMiByZXF1ZXN0cyBkZWxlZ2F0
aW9uIHJlZ2FyZGxlc3Mgb2YKPj4gd2hhdCBwcm9iaW5nIGRldGVjdHMuIEZvciBNSVNBTElHTkVE
X1NDQUxBUl9GQVNULCB0aGUgZGVsZWdhdGlvbiBsaWtlbHkgZG9lc24ndD4gY2hhbmdlIGFueSBh
Y3R1YWwgYmVoYXZpb3IsIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGxpa2VseSBuZXZlciByYWlzZXMg
dGhlCj4+IGV4Y2VwdGlvbi4gQnV0IGl0IGRvZXMgZW5zdXJlIE0tbW9kZSBuZXZlciBlbXVsYXRl
cyBhbnl0aGluZywgc28gaWYgdGhlCj4+IGV4Y2VwdGlvbiB3ZXJlIHRvIG9jY3VyLCB0aGUga2Vy
bmVsIGhhcyB0aGUgY2hvaWNlIHdoZXRoZXIgdG8gaGFuZGxlIGl0LiBBbmQKPj4gdGhpcyBsZXRz
IHVzIHByb3ZpZGUgdGhlIHNhbWUgZ3VhcmFudGVlIHRvIEtWTSBndWVzdHMuIFNvIEkgdGhpbmsg
dGhpcyBmZWF0dXJlCj4+IHNob3VsZCBhbHNvIGJlIHN1cHBvcnRlZCBpZiB3ZSBzdWNjZXNzZnVs
bHkgZGVsZWdhdGVkIHRoZSBleGNlcHRpb24gb24gdGhlIGhvc3QKPj4gc2lkZS4KPiAKPiBOb3Qg
c3VyZSB0byBjb21wbGV0ZWx5IGZvbGxvdyB5b3UgaGVyZSBidXQgcGF0Y2ggMiBhY3R1YWxseSBk
b2VzIHRoZQo+IHJldmVyc2Ugb2Ygd2hhdCB5b3Ugc2FpZC4gV2UgcmVxdWVzdCBkZWxlZ2F0aW9u
IGZyb20gU0JJICpiZWZvcmUqCj4gcHJvYmluZyBzbyB0aGF0IGFsbG93cyBwcm9iaW5nIHRvIHNl
ZSBpZiB3ZSAoa2VybmVsKSByZWNlaXZlcyBtaXNhbGlnbmVkCj4gYWNjZXNzZXMgdHJhcHMgYW5k
IHRodXMgc2V0IE1JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVELgoKQWgsIHJpZ2h0LCB0aGF0IG1h
a2VzIHNlbnNlLgoKPiBCdXQgaWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSwgeW91IG1lYW4gdGhh
dCBndWVzdCBkZWxlZ2F0aW9uIHNob3VsZAo+IGFsc28gYmUgYXZhaWxhYmxlIHRvIGd1ZXN0IGlu
IGNhc2UgbWlzYWxpZ25lZCBhY2Nlc3Mgd2VyZSBkZWxlZ2F0ZWQgYnkKPiB0aGUgU0JJIHRvIHRo
ZSBob3N0IHdoaWNoIEkgYWdyZWUuIEkgdGhpbmsgdGhpcyBjb25kaXRpb24gc2hvdWxkIGJlCgpZ
ZXMsIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LgoKPiByZXdvcmtlZCB0byByZXBvcnQg
dGhlIGRlbGVnYXRpb24gc3RhdHVzIGl0c2VsZiBhbmQgbm90IHRoZSBtaXNhbGlnbmVkCj4gYWNj
ZXNzIHNwZWVkIHRoYXQgd2FzIGRldGVjdGVkCgpBZ3JlZWQsIHdpdGggdGhlIG51YW5jZSB0aGF0
IGRlbGVnYXRpb24gbWF5IGhhdmUgYmVlbiBlbmFibGVkIGJ5IGEgRldGVCBjYWxsLCBvcgppdCBt
YXkgaGF2ZSBiZWVuIHByZS1leGlzdGluZywgYXMgZGV0ZWN0ZWQgYnkgTUlTQUxJR05FRF9TQ0FM
QVJfRU1VTEFURUQgb3IKTUlTQUxJR05FRF9WRUNUT1JfRU1VTEFURUQuIEZvciBleGFtcGxlLCBJ
IHdvdWxkIGNvbnNpZGVyIGEgcGxhdGZvcm0gd2hlcmUgdGhlCmhhcmR3YXJlIHN1cHBvcnRzIG1p
c2FsaWduZWQgc2NhbGFyIGFjY2Vzc2VzIChNSVNBTElHTkVEX1NDQUxBUl9GQVNUKSBidXQgbm90
CnZlY3RvciBhY2Nlc3NlcywgYW5kIE0tbW9kZSBkb2Vzbid0IGVtdWxhdGUgdGhlbSAoTUlTQUxJ
R05FRF9WRUNUT1JfRU1VTEFURUQpIHRvCmJlIGRlbGVnYXRlZCBmb3IgdGhlIHB1cnBvc2VzIG9m
IHRoaXMgY2hlY2ssIGV2ZW4gaWYgTS1tb2RlIGRvZXNuJ3QgaW1wbGVtZW50CnRoZSBGV0ZUIGV4
dGVuc2lvbi4KClJlZ2FyZHMsClNhbXVlbAoKPj4+ICsJCXJldHVybiBmYWxzZTsKPj4+ICsKPj4+
ICsJcmV0dXJuIHRydWU7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0
X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+Pj4gKwkJ
CQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4+PiArCQkJCQl1bnNpZ25lZCBs
b25nIHZhbHVlKQo+Pj4gK3sKPj4+ICsJaWYgKHZhbHVlID09IDEpCj4+PiArCQljc3Jfc2V0KENT
Ul9IRURFTEVHLCBNSVNfREVMRUcpOwo+Pj4gKwllbHNlIGlmICh2YWx1ZSA9PSAwKQo+Pj4gKwkJ
Y3NyX2NsZWFyKENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+Pj4gKwllbHNlCj4+PiArCQlyZXR1
cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+Pj4gKwo+Pj4gKwlyZXR1cm4gU0JJX1NVQ0NFU1M7
Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVk
X2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+Pj4gKwkJCQkJc3RydWN0IGt2bV9z
YmlfZndmdF9jb25maWcgKmNvbmYsCj4+PiArCQkJCQl1bnNpZ25lZCBsb25nICp2YWx1ZSkKPj4+
ICt7Cj4+PiArCSp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVERUxFRykgJiBNSVNfREVMRUcpICE9
IDA7Cj4+PiArCj4+PiArCXJldHVybiBTQklfU1VDQ0VTUzsKPj4+ICt9Cj4+PiArCj4+PiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0gewo+Pj4g
Kwl7Cj4+PiArCQkuaWQgPSBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPj4+ICsJCS5z
dXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwK
Pj4+ICsJCS5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4+
ICsJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPj4+ICsJ
fQo+Pgo+PiBuaXQ6IFBsZWFzZSBhZGQgYSB0cmFpbGluZyBjb21tYSBoZXJlIGFzIGZ1dHVyZSBw
YXRjaGVzIHdpbGwgZXh0ZW5kIHRoZSBhcnJheS4KPj4KPj4gUmVnYXJkcywKPj4gU2FtdWVsCj4+
Cj4+PiAgfTsKPj4+ICAKPj4+ICBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgo+
Pgo+IAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
