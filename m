Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BEAC021B2
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlZH4pSLbwbg1GGfhl8KdC5h6ZT41sNVrP4IdmV9Ix8=; b=hux5lNF3Vdtj+G
	+zwzV5qDOElKOBd8AjCxrtCCNx0pZm728zqPH4zFB2w1Mkx4wbUN619HMusz1oi4G9vu2aEtHIai0
	NLAfHtf6WC/lQotaX5zEFmtoxOnvk6BPhBMguySQUzA8vcgcf5pIuZjLWc8+l191igpd30H9VlWp/
	RtF7SALdFvQnEstotLAdsxRDY2yKZZsHYNYg7P0+l1K9GuvMAqF3KvkmLPS7h/AV0l3MA6H3eZj4K
	quD/cC7Y7O7/XE7lLTttbFgeQmWUSX/mdpHaYnI3pEmJJ91Pw+g5VcDYLhmF3uumblpSYirSpcDWe
	lNjh3/JQqm09ZVNmkSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsbG-0000000GunA-3VDd;
	Tue, 25 Feb 2025 10:55:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrxF-0000000GmOB-2AfY
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 10:14:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fcc940bb14so7933593a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 02:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740478460; x=1741083260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbX9Pu/WeNm22SYUGxmz8Ldnyc8CoEX0CwsWzQhitxo=;
        b=P2gmA7rddE/Lh98TXmh6gKgOTBhHXHzZ0W2zdTrQbzLNVaa+de6SiJZZ2K0Vzk+HDm
         RG1Pr7iBnGxZF1mHnsRLTPImFZEIBi+M1yroRI2TCMGYCcoFHy+P3zmsEgCbiHmL778k
         auw10DkPLzF6b7woik/g6kgzZypepmE4/zjndAf2lNs3Y4htW7OvN/vGycpKksHLOJQf
         Yp5DF9T6Zlzp60Zbu3VV18YvCnTNrhyx5F1ZuSOOUXWMoa1qUtPPgMgpI5UODO3Z4rSh
         W8s8DzUlR6HW7fiHuxaDC2gOFuv44BZ/UrQsnmZNynR9jSqMaQGgy/eURPJV09L/EIv1
         bt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478460; x=1741083260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbX9Pu/WeNm22SYUGxmz8Ldnyc8CoEX0CwsWzQhitxo=;
        b=qTOWcRfweOb4WAyIudtAvUnz0REyHMioKJWAw+n+v6erhvamFWGdzrXwhzKisV1/Z7
         oLXEFXCTuFcnQogCpk3UtcslQ+S6uR/Q1HQ//Yoy+XygF0rkVfNninHVxr0sKfyHP+/k
         8GWYOgQxXWcj5X9xMGtNtvyhxg1YIznC4O0ZmeRt8KaKG5O1BS+zFG9DKM9TzAZxlRoa
         /NsXW63ypMRxbQMeWynKeWgMGApmKxkQXIFjTEPssVte9n73WWbEMcB3AcqGurmYZQyc
         kjgpiWVVhmNmLIQ5MEjT+L8gF5MrzwhJ0PcpA9fzupanKBAe9JzbsYbFQAXlNt+/QurV
         lPkg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ah19vPHlC2jm0fW848iGPZVqhZNobsLSEWleVgOa7ROHmTXL9hO3pG6xkZ31FX1+26eFmfhLy3I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2Aoo23molOsWuqS7tZn2DbnBXWXr6EIi0K6eH4WYD1TDZPAf
	ILcb0yTtGrlhmCxM8DKnwNR4ix2+Q03+ZaHwPghZZN80yttj8BK/oPyumj+5NT+wMyqJ7AtvDws
	E
X-Gm-Gg: ASbGncv8D27Yu+fvHx/247l5hyJHfpJb4Bk7oPKDSxc6f0zSaJZyKGd2qQYnInWqiBy
	8jI5l4+I1jr/y61orzZAv+j41EgMKShnNVHXFJYeXHMqRwdpqA/FecBO0qvsgd1RuKNsDseP0k/
	0TaAslaRyyTDLrDoiC/ttcTsD8mKmIuWLs+Wm4WyfitSXaK2kkhzpQ8yznAWsOWeZKWb2CG7qYR
	x87/rR0OeXKbFLpQ7E/TCa6zWRa/mtCD4X/UDWC9Gb2KH3SW7LhtrYmw436OHwN7W9efGzD0Odl
	42z1nGl5RyGH53Dtv0EoL3mVjjPiRp2JmnO0S0Qwqj3Maa8nCWMsG9jZJjGHtnQGq6rbKJI=
X-Google-Smtp-Source: AGHT+IFbSw14Nhtw0A5+qQmlA5ez2iHqt7dRaRgYFFARjl6pYOx6MEbJedtd/BzvVA51Q+UEOenjbg==
X-Received: by 2002:a17:90b:2792:b0:2f4:465d:5c94 with SMTP id 98e67ed59e1d1-2fce78a33cfmr29290662a91.11.1740478460601;
        Tue, 25 Feb 2025 02:14:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3dccf9sm1313689a91.18.2025.02.25.02.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:14:19 -0800 (PST)
Message-ID: <1bc65c8e-4d36-4ed4-8f9e-b7a14c09c08a@rivosinc.com>
Date: Tue, 25 Feb 2025 11:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft failures
 as kfails
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250221155533.123418-13-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021421_566334_064C7ABC 
X-CRM114-Status: GOOD (  14.95  )
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

CgpPbiAyMS8wMi8yMDI1IDE2OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVW50aWwgd2UgZml4
IG9wZW5zYmkgbWFyayB0aGVzZSBrbm93biBmYWlsdXJlcyBhcyBrZmFpbHMgc28gd2UgY2FuCj4g
cGFzcyBDSS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bs
aW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS1md2Z0LmMgfCAxNSArKysrKysrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3Jpc2N2L3NiaS1md2Z0LmMgYi9yaXNjdi9zYmktZndmdC5jCj4gaW5kZXgg
YjEwYzE0N2YyMmRkLi4xOTM0MGQ2YmI0OGMgMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLWZ3ZnQu
Ywo+ICsrKyBiL3Jpc2N2L3NiaS1md2Z0LmMKPiBAQCAtNjMsMTEgKzYzLDE3IEBAIHN0YXRpYyB2
b2lkIGZ3ZnRfY2hlY2tfYmFzZSh2b2lkKQo+ICAJCXN0cnVjdCBzYmlyZXQgcmV0Owo+ICAKPiAg
CQlyZXQgPSBmd2Z0X2dldF9yYXcoQklUKDMyKSk7Cj4gLQkJc2JpcmV0X3JlcG9ydF9lcnJvcigm
cmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gKwkJaWYgKHJldC5lcnJvciA9PSAwKQo+ICsJ
CQlyZXBvcnRfa2ZhaWwodHJ1ZSwgZmFsc2UsICJnZXQgZmVhdHVyZSB3aXRoIGJpdCAzMiBzZXQg
ZXJyb3I6IFNCSV9FUlJfSU5WQUxJRF9QQVJBTSIpOwo+ICsJCWVsc2UKPiArCQkJc2JpcmV0X3Jl
cG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gIAkJCQkgICAgImdldCBm
ZWF0dXJlIHdpdGggYml0IDMyIHNldCBlcnJvciIpOwoKCkhleSBBbmRyZXcsCgpJJ20gYWN0dWFs
bHkgYSBiaXQgY29uZnVzZWQgaGVyZS4gQXMgcmFpc2VkIGJ5IEFudXAsIHRoZSBzcGVjIHN0YXRl
cyB0aGF0OgoKIkV2ZXJ5IFNCSSBmdW5jdGlvbiBzaG91bGQgcHJlZmVyIHVuc2lnbmVkIGxvbmcg
YXMgdGhlIGRhdGEgdHlwZS4gSXQKa2VlcHMgdGhlIHNwZWNpZmljYXRpb24gc2ltcGxlIGFuZCBl
YXNpbHkgYWRhcHRhYmxlIGZvciBhbGwgUklTQy1WIElTQQp0eXBlcy4gSW4gY2FzZSB0aGUgZGF0
YSBpcyBkZWZpbmVkIGFzIDMyYml0IHdpZGUsIGhpZ2hlciBwcml2aWxlZ2UKc29mdHdhcmUgbXVz
dCBlbnN1cmUgdGhhdCBpdCBvbmx5IHVzZXMgMzIgYml0IGRhdGEuIgoKRG9lcyB0aGlzIG1lYW5z
IDY0IGJpdHMgdmFsdWUgYXJlIHRydW5jYXRlZCB0byAzMiBiaXRzID8KClRoYW5rcywKCkNsw6lt
ZW50Cgo+ICAKPiAgCQlyZXQgPSBmd2Z0X3NldF9yYXcoQklUKDMyKSwgMCwgMCk7Cj4gLQkJc2Jp
cmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gKwkJaWYgKHJl
dC5lcnJvciA9PSAwKQo+ICsJCQlyZXBvcnRfa2ZhaWwodHJ1ZSwgZmFsc2UsICJzZXQgZmVhdHVy
ZSB3aXRoIGJpdCAzMiBzZXQgZXJyb3I6IFNCSV9FUlJfSU5WQUxJRF9QQVJBTSIpOwo+ICsJCWVs
c2UKPiArCQkJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0s
Cj4gIAkJCQkgICAgInNldCBmZWF0dXJlIHdpdGggYml0IDMyIHNldCBlcnJvciIpOwo+ICAJfQo+
ICAjZW5kaWYKPiBAQCAtMTY3LDcgKzE3MywxMCBAQCBzdGF0aWMgdm9pZCBmd2Z0X2NoZWNrX21p
c2FsaWduZWRfZXhjX2RlbGVnKHZvaWQpCj4gIAlyZXQgPSBmd2Z0X21pc2FsaWduZWRfZXhjX3Nl
dCgwLCBTQklfRldGVF9TRVRfRkxBR19MT0NLKTsKPiAgCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJl
dCwgU0JJX1NVQ0NFU1MsICJTZXQgbWlzYWxpZ25lZCBkZWxlZyBmZWF0dXJlIHZhbHVlIDAgYW5k
IGxvY2siKTsKPiAgCXJldCA9IGZ3ZnRfbWlzYWxpZ25lZF9leGNfc2V0KDEsIDApOwo+IC0Jc2Jp
cmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0xPQ0tFRCwKPiArCWlmIChyZXQuZXJyb3Ig
PT0gU0JJX0VSUl9ERU5JRUQpCj4gKwkJcmVwb3J0X2tmYWlsKHRydWUsIGZhbHNlLCAiU2V0IGxv
Y2tlZCBtaXNhbGlnbmVkIGRlbGVnIGZlYXR1cmUgdG8gbmV3IHZhbHVlOiBTQklfRVJSX0xPQ0tF
RCIpOwo+ICsJZWxzZQo+ICsJCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX0VSUl9MT0NL
RUQsCj4gIAkJCSAgICAiU2V0IGxvY2tlZCBtaXNhbGlnbmVkIGRlbGVnIGZlYXR1cmUgdG8gbmV3
IHZhbHVlIik7Cj4gIAlyZXQgPSBmd2Z0X21pc2FsaWduZWRfZXhjX2dldCgpOwo+ICAJc2JpcmV0
X3JlcG9ydCgmcmV0LCBTQklfU1VDQ0VTUywgMCwgIkdldCBtaXNhbGlnbmVkIGRlbGVnIGxvY2tl
ZCB2YWx1ZSAwIik7CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
