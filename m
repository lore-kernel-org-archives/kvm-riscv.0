Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D589BC28B2F
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOfTcRKgq07VJJF1zTXtEtdhQRxD9gkurFqyyBAcOMo=; b=yYUNYoyovH9lcj
	gTXHWoLUSXSi6Cdzmdwl0F7bf+BZ2Oahrb/gk64NHCMBWUNzsqt3yzeSxT9YoB2p8JdPFXmVgCPEw
	aS/JA0Z4x23VPS+4pRhyuAOD+RjjWhWYKQJ8Tg8opGyrw8y7efJCcq3nZSMIhIpC3gVEWz12/OXD6
	PzjPlEQChxh4MC4FmBkOhouzczftGDdGZPuzcDC3LeDTsdKp+lK8Iq3b4RN9b94Ttnk8bVFGOXcPG
	mf7VnAdXXfjMoGlbqxHlz0eD1D2EaObYwh3p39TTg7aKb+yFVvl5wOhlh4RfCmRFUVYBnGKsdNBx9
	fhS56vRWAGNAdqFFAf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Vf-0000000E3Yf-2ZxV;
	Fri, 14 Mar 2025 11:47:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Vd-0000000E3Xr-2KsZ
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:47:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2025656f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952844; x=1742557644; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzikXcMBGZjkkMXY0vzLgpXOZlJlOHrf1lUiKHrI63E=;
        b=bYX7NYu1GpB7UPMZQXY0rX86V5oD6yD95dQikUAvGwDJulDlDdDeapFVGLocie25Pq
         Ty1XkEyByqapil9gY4Xqmtp7zaRhjJSPdyvaYn1/30FoMXTakKfR2kV+6/SkAb/7/3CD
         nbMVh0uUzFoYrJA/lEPlzrXSYr91+7uWPVvSPjjfPfFpZrVXLfELMrZ3Cau9otnUyrGt
         SLLB3+6ES1i9Yn9xoYn2bboxGT/IBH0454p1ZlKphLnF60V6tNtKxh9oLnUjOygBF88p
         ciR5giuZKlvfQzQZ7IySPPt/obpaAwQ+3569SusA/ajQDXRy5JNjzsiszUrj03SGJAzE
         KMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952844; x=1742557644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzikXcMBGZjkkMXY0vzLgpXOZlJlOHrf1lUiKHrI63E=;
        b=tKBhZ5EsmZGv6xEo8ltO3dfqujlMaNz5eAR4d3m9begmx93ihKjcQ3y3z1DJ3X1xm3
         bJLJWLON8ua8dKJHNd3qXYgKa//60tQpO1o2ljXbiWThhG0AAf1P2j4O4kid6k3SP9Zd
         FR/LOgbzIjMHJmw+fHJe5fMa5ogFtkngzeBaKeI4DqHgxfEAqnLwERPnfmYqh4G9I688
         7W3n7eUp+vsauZiwD9jzcAYjUTPah08YG5E4bAjgnq0IwxevZxZpx+8wdl/RfNnn++J0
         sT6gdZrAmlXcWuOnmi63Qa/sPLizQ9TD5+LtDDBegrlaJJ00VLnPH6X2CJCl322b0DxD
         6cjg==
X-Forwarded-Encrypted: i=1; AJvYcCWyOCSpmrdtr10bwBttjMHBbg1QGV7IJIC5TVyLQWyA6FHCPGlr740b0U/Jzyb2HXfr9loB4saV7Sw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLXgMpY0lnzOwQS1HjJjVxgXsv7hvjnnGgeGcmVljOEKdpjmFl
	Mf5DK0xF5ntSTea70HCT1GwSnHr43YHlMS3BGO/oXThVnNZN8kJacngXkv+5YO8=
X-Gm-Gg: ASbGncvIcK8oubczi8itzu5Ql8/1qncLvkqGD+PVk+4BNZhiTQ7BNohn22KDMtZDnXi
	txBKQWJdfMXYckmiGbOS+V+gSlxz59+2ljBC/jht1Hiov/Muc/oEJc2ASnQvwTQElnXjbuujFzh
	GqbWwjUic3Xf5R5U+7F7t7rJM6ne3mFUJvzL9Ds5HSnpK7Pw4RX0HoISVf2iYXlzuDrO48lSf9i
	9WKOhdrL3e009YPRhpyv+KcFa1V7MU+tYuTzpUhkL65C4BOUbLxIQPAPrw8yD7Kg9OFQDWwJZDR
	1C30iGlNG3t1VtGKS0hQiOayeAevb9RHt50/+ZRz0EHGsiknYyOXNS5LaaOuMacA2G45V1zUZyx
	HdwQ5FYBwunEOIg==
X-Google-Smtp-Source: AGHT+IGtfAcAmGZVPhIyucY33egMDOBZySQ+8fr8l7lHLk072SvheDgQHi3fAYh9SVsSUmw9CF0urA==
X-Received: by 2002:a05:6000:2cf:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3971c97ba0cmr2373277f8f.17.1741952844036;
        Fri, 14 Mar 2025 04:47:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb9ccsm5371909f8f.96.2025.03.14.04.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:47:23 -0700 (PDT)
Message-ID: <f0945e93-7ac0-4217-8095-93fff303bdf2@rivosinc.com>
Date: Fri, 14 Mar 2025 12:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef for
 misaligned_access_speed
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-7-cleger@rivosinc.com>
 <20250313-a437330d8e1c638a9aa61e0a@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-a437330d8e1c638a9aa61e0a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044725_594923_696622F4 
X-CRM114-Status: GOOD (  14.33  )
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

CgpPbiAxMy8wMy8yMDI1IDE0OjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTNQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBt
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCBpcyBkZWZpbmVkIHVuZGVyIENPTkZJR19SSVNDVl9TQ0FM
QVJfTUlTQUxJR05FRAo+PiBidXQgd2FzIHVzZWQgdW5kZXIgQ09ORklHX1JJU0NWX1BST0JFX1VO
QUxJR05FRF9BQ0NFU1MuIEZpeCB0aGF0IGJ5Cj4+IHVzaW5nIHRoZSBjb3JyZWN0IGNvbmZpZyBv
cHRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMg
fCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiBpbmRleCBmZmFjNDI0ZmFh
ODguLjdmZTI1YWRmMjUzOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
Ywo+PiBAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGln
bmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICAKPj4gIAlwZXJmX3N3X2V2ZW50KFBF
UkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7Cj4+ICAKPj4gLSNp
ZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUwo+PiArI2lmZGVmIENPTkZJ
R19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAo+PiAgCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWduZWRf
YWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQ7
Cj4+ICAjZW5kaWYKPiAKPiBTdXJlLCBidXQgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9B
Q0NFU1Mgc2VsZWN0cwo+IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCwgc28gdGhpcyBp
c24ndCBmaXhpbmcgYW55dGhpbmcuIAoKSW5kZWVkLCB0aGF0IGlzIG5vdCBmaXhpbmcgYW55dGhp
bmcgKGhlbmNlIG5vIEZpeGVzIHRhZyksIGl0IGNvbXBpbGVzIGFzCmEgc2lkZSBlZmZlY3Qgb2Yg
S2NvbmZpZyBkZXBlbmRlbmNpZXMuCgo+IENoYW5naW5nIGl0Cj4gZG9lcyBtYWtlIHNlbnNlIHRo
b3VnaCBzaW5jZSB0aGlzIGxpbmUgaW4gaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoKQo+
ICJiZWxvbmdzIiB0byBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkgd2hpY2ggaXMg
YWxzbyB1bmRlcgo+IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRC4gQW55d2F5LCBhbGwg
dGhpcyB1bmFsaWduZWQgY29uZmlncyBuZWVkIGEKPiBtYWpvciBjbGVhbnVwLgoKWWVzLCBhcyBJ
IHNhaWQsIEknZCBiZSBhZHZvY2F0aW5nIHRvIHJlbW92ZSBhbGwgdGhhdCBpZmRlZmVyeSBtZXNz
LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPj4gIAo+PiAt
LSAKPj4gMi40Ny4yCj4+Cj4+Cj4+IC0tIAo+PiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
