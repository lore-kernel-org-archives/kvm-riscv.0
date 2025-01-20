Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C323C02188
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMrTiMo9OsOcyFK26IMNohZ/dME4PtDCgau9SClgia8=; b=FQ2sbGiCpVyu/X
	NinUOYEhmvGdXB4U5lSqfHLAKwzuhvmd/LM4YmcDseZNvDXA+Pbzc6TgU88KwGZYelezR6rY/Iqr0
	ppBouSKWKF5sNZacgEWGAiGEUdthLIRdcts8ASDQOBuZYEkdPthx7zPswc4skuqsS7Qy+QUcmU6+I
	U77SfRhjvYubrg5uB7u7MxoxHLUPVn1L5QdiZq/Gb3Lv/IVX7pUxaNRKnozwd1aDXUqed5BfuHeyo
	QoDxjyiYgcJPLFrwegaMlS+AJ7JEY+l7NrywOJRKEOOTxO82NMggUVZ/DiyL7ktRdR1SS0331zqU+
	tEkuBdpJFISZTzSbZGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZn6h-000000051NP-1vkC;
	Mon, 20 Jan 2025 08:26:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZn6c-000000051Me-2v9K
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 08:26:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385deda28b3so2590714f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Jan 2025 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737361556; x=1737966356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYI2a3QsYIeA00En1YZrm2v2A4qBik72ZkUV/Otsri0=;
        b=2EvcKjzXvmF2DIytz98T+BHfibvx/3a1Fa8SFoYRL02yjLzJfkl4Yr+1oZyHvkHgt9
         gi6O8AxP5pQMHTTHczHr013F+caUVdq0i71rbdY9Glgr7qQtlNi/RVygdJlvRe5UNUiV
         eiZY2dYwP+TpOSPgQTQ29psKetqZBvezUjS/coBNGogBJv1UDE4OVhlfLt8SXcruvtmi
         zB+63Ar3yF730R22WMuNOIP6zZALCR4v3qzD93CetfMQB6Wx2qTmMsGgmUjALfzoZIWg
         8mloJHhwPUHa5pNKm97ZDmXNdUFJqEo5sCWHgeC5its9VJP8mqitNQZ+iMSkV96RXxVn
         grdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737361556; x=1737966356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYI2a3QsYIeA00En1YZrm2v2A4qBik72ZkUV/Otsri0=;
        b=K5pMazYEWzJH2GHDRN9/ZQ2auQGfnhU3QGC46di2Cald/Ms9tTGhh2SnAgpa3toW/a
         tP1WYlRqm43GCBBj8oz0q8gsXL3AVGBmL1Hne/SE5GTF8ZMyqJpJc48Zd3PmNVNM8mZf
         PAfyft9EG2d8AdfA3JoHvk3cMrMWskAHbhQs/F3RAleg4iJSTTJWe5cgcadKfkX0aWTC
         44ivnaHXEP7N+BpjdLpBk4W0NnWXm/ct1a25V/BRNq/PrxLWVS6E7fI7kzj01BsgbuJ9
         WJoPvOUZsxOEy/wsONUA0k974Chq4RcIqkJV5NUiWtZNMgbgNERhDkAywvM/aQ/RnZ7P
         VPOw==
X-Forwarded-Encrypted: i=1; AJvYcCVqlmqhLxJWIyof4nMQZoqizXVSLVqjDT0zuKOZm+yiOaENSubkaEqHrX5lBQX+J/cQ3mhO0H9P92Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHSxXpkiBLK2wmByrMQfhmvEJRLOBfWEwQD/a+cmmn9vAQd9KV
	N+xZJ74wiiL3kodBPUqrBiDkN3Je7ly/yEmYrJH603FnH35sIjPiE+I5B2Nnsmg=
X-Gm-Gg: ASbGnctylyBseYerg/XjOFNssS7v47X212TY2/qstnlA7uolG//Caag8KTnLcObh3N8
	aqMCPHQHXiK+IeekmR874T2kMvm0i/VXdwurrODYJuUG2ggRo6eNeFCG4yAAcb+hSvhWNE3Ef/q
	yHvyJH5+SWk6b8hnMRIw2QaX0OM1jZcbB4HsrU1GHXCBzmjpST4djB3VadjPBwwfVFH51rSWLha
	B6hfsXWzi0oh/nrLkGf/Pkg99xKNzuUQVPPnDQMj33TZ3fl8YZr57msm6SdeNb33BZQI4hWjC4W
	0+ynkn8k0U80EhhARyjbkYfimtBRCXvYSat6UHw=
X-Google-Smtp-Source: AGHT+IH4TndOh+PlXJGqlB2TWiZ55c/1n03gu+vWFDOVEsEqCanQ4rIbEsNvQgPQ/XMlsmWRjDZFoQ==
X-Received: by 2002:a5d:5848:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-38bf57c0551mr10581702f8f.52.1737361556266;
        Mon, 20 Jan 2025 00:25:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b5asm9529892f8f.21.2025.01.20.00.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 00:25:55 -0800 (PST)
Message-ID: <daf2d06e-2c5a-4659-87d4-e96913bd461b@rivosinc.com>
Date: Mon, 20 Jan 2025 09:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-7-cleger@rivosinc.com>
 <b3f54d34-bc77-46db-88da-70c0c602081f@sifive.com>
 <dec723d7-fc16-4edb-b684-1844b08391ba@rivosinc.com>
 <dff019ec-79dc-4be6-b1f4-02e48d84ebc2@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <dff019ec-79dc-4be6-b1f4-02e48d84ebc2@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_002559_615637_807482C6 
X-CRM114-Status: GOOD (  24.73  )
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

CgpPbiAxNy8wMS8yMDI1IDE3OjMxLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBIaSBDbMOpbWVu
dCwKPiAKPiBPbiAyMDI1LTAxLTE3IDEwOjA1IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+
IE9uIDExLzAxLzIwMjUgMDA6NTUsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4gT24gMjAyNS0w
MS0wNiA5OjQ4IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4gU0JJX0ZXRlRfTUlTQUxJ
R05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRvIGRlbGVnYXRlCj4+Pj4g
bWlzYWxpZ25lZCBsb2FkL3N0b3JlIGV4Y2VwdGlvbnMuIFNhdmUgYW5kIHJlc3RvcmUgaXQgZHVy
aW5nIENQVQo+Pj4+IGxvYWQvcHV0Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1LmMgICAgICAgICAgfCAgMyArKysKPj4+PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICAyIGZp
bGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4+PiBpbmRleCAzNDIw
YTRhNjJjOTQuLmJiNmY3ODhkNDZmNSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4+PiBAQCAtNjQxLDYgKzY0
MSw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Pj4+
ICB7Cj4+Pj4gIAl2b2lkICpuc2g7Cj4+Pj4gIAlzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpjc3IgPSAm
dmNwdS0+YXJjaC5ndWVzdF9jc3I7Cj4+Pj4gKwlzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcg
PSAmdmNwdS0+YXJjaC5jZmc7Cj4+Pj4gIAo+Pj4+ICAJdmNwdS0+Y3B1ID0gLTE7Cj4+Pj4gIAo+
Pj4+IEBAIC02NjYsNiArNjY3LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4+Pj4gIAkJY3NyLT52c3R2YWwgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NS
X1ZTVFZBTCk7Cj4+Pj4gIAkJY3NyLT5odmlwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9IVklQ
KTsKPj4+PiAgCQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU0FUUCk7Cj4+
Pj4gKwkJY2ZnLT5oZWRlbGVnID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9IRURFTEVHKTsKPj4+
PiAgCX0gZWxzZSB7Cj4+Pj4gIAkJY3NyLT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9WU1NUQVRV
Uyk7Cj4+Pj4gIAkJY3NyLT52c2llID0gY3NyX3JlYWQoQ1NSX1ZTSUUpOwo+Pj4+IEBAIC02NzYs
NiArNjc4LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4+Pj4gIAkJY3NyLT52c3R2YWwgPSBjc3JfcmVhZChDU1JfVlNUVkFMKTsKPj4+PiAgCQljc3It
Pmh2aXAgPSBjc3JfcmVhZChDU1JfSFZJUCk7Cj4+Pj4gIAkJY3NyLT52c2F0cCA9IGNzcl9yZWFk
KENTUl9WU0FUUCk7Cj4+Pj4gKwkJY2ZnLT5oZWRlbGVnID0gY3NyX3JlYWQoQ1NSX0hFREVMRUcp
Owo+Pj4+ICAJfQo+Pj4+ICB9Cj4+Pj4gIAo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPj4+PiBp
bmRleCA1NTQzM2U4MDViYWEuLjFlODVmZjY2NjZhZiAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9md2Z0LmMKPj4+PiBAQCAtMTQsNiArMTQsOCBAQAo+Pj4+ICAjaW5jbHVkZSA8YXNtL2t2bV92
Y3B1X3NiaS5oPgo+Pj4+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+Cj4+Pj4g
IAo+Pj4+ICsjZGVmaW5lIE1JU19ERUxFRyAoMVVMIDw8IEVYQ19MT0FEX01JU0FMSUdORUQgfCAx
VUwgPDwgRVhDX1NUT1JFX01JU0FMSUdORUQpCj4+Pj4gKwo+Pj4+ICBzdGF0aWMgY29uc3QgZW51
bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0dXJlc1tdID0gewo+Pj4+
ICAJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCj4+Pj4gIAlTQklfRldGVF9MQU5ESU5H
X1BBRCwKPj4+PiBAQCAtMzUsNyArMzcsNDQgQEAgc3RhdGljIGJvb2wga3ZtX2Z3ZnRfaXNfZGVm
aW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGZlYXR1cmUpCj4+Pj4gIAlyZXR1
cm4gZmFsc2U7Cj4+Pj4gIH0KPj4+PiAgCj4+Pj4gK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9t
aXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4+
PiArewo+Pj4+ICsJaWYgKCF1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpKQo+Pj4KPj4+IFRoaXMg
c2VlbXMgbGlrZSB0aGUgd3JvbmcgY29uZGl0aW9uLiBQYXRjaCAyIHJlcXVlc3RzIGRlbGVnYXRp
b24gcmVnYXJkbGVzcyBvZgo+Pj4gd2hhdCBwcm9iaW5nIGRldGVjdHMuIEZvciBNSVNBTElHTkVE
X1NDQUxBUl9GQVNULCB0aGUgZGVsZWdhdGlvbiBsaWtlbHkgZG9lc24ndD4gY2hhbmdlIGFueSBh
Y3R1YWwgYmVoYXZpb3IsIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGxpa2VseSBuZXZlciByYWlzZXMg
dGhlCj4+PiBleGNlcHRpb24uIEJ1dCBpdCBkb2VzIGVuc3VyZSBNLW1vZGUgbmV2ZXIgZW11bGF0
ZXMgYW55dGhpbmcsIHNvIGlmIHRoZQo+Pj4gZXhjZXB0aW9uIHdlcmUgdG8gb2NjdXIsIHRoZSBr
ZXJuZWwgaGFzIHRoZSBjaG9pY2Ugd2hldGhlciB0byBoYW5kbGUgaXQuIEFuZAo+Pj4gdGhpcyBs
ZXRzIHVzIHByb3ZpZGUgdGhlIHNhbWUgZ3VhcmFudGVlIHRvIEtWTSBndWVzdHMuIFNvIEkgdGhp
bmsgdGhpcyBmZWF0dXJlCj4+PiBzaG91bGQgYWxzbyBiZSBzdXBwb3J0ZWQgaWYgd2Ugc3VjY2Vz
c2Z1bGx5IGRlbGVnYXRlZCB0aGUgZXhjZXB0aW9uIG9uIHRoZSBob3N0Cj4+PiBzaWRlLgo+Pgo+
PiBOb3Qgc3VyZSB0byBjb21wbGV0ZWx5IGZvbGxvdyB5b3UgaGVyZSBidXQgcGF0Y2ggMiBhY3R1
YWxseSBkb2VzIHRoZQo+PiByZXZlcnNlIG9mIHdoYXQgeW91IHNhaWQuIFdlIHJlcXVlc3QgZGVs
ZWdhdGlvbiBmcm9tIFNCSSAqYmVmb3JlKgo+PiBwcm9iaW5nIHNvIHRoYXQgYWxsb3dzIHByb2Jp
bmcgdG8gc2VlIGlmIHdlIChrZXJuZWwpIHJlY2VpdmVzIG1pc2FsaWduZWQKPj4gYWNjZXNzZXMg
dHJhcHMgYW5kIHRodXMgc2V0IE1JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVELgo+IAo+IEFoLCBy
aWdodCwgdGhhdCBtYWtlcyBzZW5zZS4KPiAKPj4gQnV0IGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0
bHksIHlvdSBtZWFuIHRoYXQgZ3Vlc3QgZGVsZWdhdGlvbiBzaG91bGQKPj4gYWxzbyBiZSBhdmFp
bGFibGUgdG8gZ3Vlc3QgaW4gY2FzZSBtaXNhbGlnbmVkIGFjY2VzcyB3ZXJlIGRlbGVnYXRlZCBi
eQo+PiB0aGUgU0JJIHRvIHRoZSBob3N0IHdoaWNoIEkgYWdyZWUuIEkgdGhpbmsgdGhpcyBjb25k
aXRpb24gc2hvdWxkIGJlCj4gCj4gWWVzLCB5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdC4K
PiAKPj4gcmV3b3JrZWQgdG8gcmVwb3J0IHRoZSBkZWxlZ2F0aW9uIHN0YXR1cyBpdHNlbGYgYW5k
IG5vdCB0aGUgbWlzYWxpZ25lZAo+PiBhY2Nlc3Mgc3BlZWQgdGhhdCB3YXMgZGV0ZWN0ZWQKPiAK
PiBBZ3JlZWQsIHdpdGggdGhlIG51YW5jZSB0aGF0IGRlbGVnYXRpb24gbWF5IGhhdmUgYmVlbiBl
bmFibGVkIGJ5IGEgRldGVCBjYWxsLCBvcgo+IGl0IG1heSBoYXZlIGJlZW4gcHJlLWV4aXN0aW5n
LCBhcyBkZXRlY3RlZCBieSBNSVNBTElHTkVEX1NDQUxBUl9FTVVMQVRFRCBvcgo+IE1JU0FMSUdO
RURfVkVDVE9SX0VNVUxBVEVELiBGb3IgZXhhbXBsZSwgSSB3b3VsZCBjb25zaWRlciBhIHBsYXRm
b3JtIHdoZXJlIHRoZQo+IGhhcmR3YXJlIHN1cHBvcnRzIG1pc2FsaWduZWQgc2NhbGFyIGFjY2Vz
c2VzIChNSVNBTElHTkVEX1NDQUxBUl9GQVNUKSBidXQgbm90Cj4gdmVjdG9yIGFjY2Vzc2VzLCBh
bmQgTS1tb2RlIGRvZXNuJ3QgZW11bGF0ZSB0aGVtIChNSVNBTElHTkVEX1ZFQ1RPUl9FTVVMQVRF
RCkgdG8KPiBiZSBkZWxlZ2F0ZWQgZm9yIHRoZSBwdXJwb3NlcyBvZiB0aGlzIGNoZWNrLCBldmVu
IGlmIE0tbW9kZSBkb2Vzbid0IGltcGxlbWVudAo+IHRoZSBGV0ZUIGV4dGVuc2lvbi4KCkFoIHll
YWggaW5kZWVkLCBJIGRpZCBub3QgcGljdHVyZWQgdGhhdCBvbmUgcGFydGljdWxhciBjYXNlICEK
ClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4gCj4+Pj4gKwkJcmV0
dXJuIGZhbHNlOwo+Pj4+ICsKPj4+PiArCXJldHVybiB0cnVlOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+
ICtzdGF0aWMgaW50IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwKPj4+PiArCQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAq
Y29uZiwKPj4+PiArCQkJCQl1bnNpZ25lZCBsb25nIHZhbHVlKQo+Pj4+ICt7Cj4+Pj4gKwlpZiAo
dmFsdWUgPT0gMSkKPj4+PiArCQljc3Jfc2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+Pj4+
ICsJZWxzZSBpZiAodmFsdWUgPT0gMCkKPj4+PiArCQljc3JfY2xlYXIoQ1NSX0hFREVMRUcsIE1J
U19ERUxFRyk7Cj4+Pj4gKwllbHNlCj4+Pj4gKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJB
TTsKPj4+PiArCj4+Pj4gKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+Pj4gK30KPj4+PiArCj4+Pj4g
K3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+Pj4+ICsJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpj
b25mLAo+Pj4+ICsJCQkJCXVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+Pj4+ICt7Cj4+Pj4gKwkqdmFs
dWUgPSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlTX0RFTEVHKSAhPSAwOwo+Pj4+ICsKPj4+
PiArCXJldHVybiBTQklfU1VDQ0VTUzsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0gewo+Pj4+ICsJewo+Pj4+
ICsJCS5pZCA9IFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+Pj4+ICsJCS5zdXBwb3J0
ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPj4+PiAr
CQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4+Pj4gKwkJ
LmdldCA9IGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+Pj4+ICsJfQo+
Pj4KPj4+IG5pdDogUGxlYXNlIGFkZCBhIHRyYWlsaW5nIGNvbW1hIGhlcmUgYXMgZnV0dXJlIHBh
dGNoZXMgd2lsbCBleHRlbmQgdGhlIGFycmF5Lgo+Pj4KPj4+IFJlZ2FyZHMsCj4+PiBTYW11ZWwK
Pj4+Cj4+Pj4gIH07Cj4+Pj4gIAo+Pj4+ICBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25m
aWcgKgo+Pj4KPj4KPiAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
