Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5795AE77188
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUmfS/0cqSjahVfjw+pmbhDK/bfNtWTES3e3XESg1cs=; b=fXSNWZDORrhAD8
	Zm4iMvB3m0LFAbdFCxo63EGM2fgHTlEApfT2MQbFB7MwkRHhM4wJYM+tLxPkRyvJ00whrNIxW64Ya
	2LamzJGoAzJrvStzwDTR3WTKRyg4oYdRATe8Sa08Chva+1tQar9gcBC8Jeskzn6zLXxeWz7K0bHyp
	Ng0CyRRfEvAswA06D8BE3KGxkykY5S0Jss3faoj/kBqem8MtiCHJfPri52SAaAtHBFx4Ra6MKUKTP
	4BdrBSzQD2IXtQKGiJ4NsG8PBe9q3A14L9MM0DZRHldKA+k49sOWgL0mNnFS3dX7e2r9ohXwwH+gO
	yWpbJCsXzy91Ak5jIbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBPV-0000000EkNP-0IE0;
	Fri, 10 Jan 2025 09:34:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBF0-0000000EgnI-0g3S
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 09:23:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1321393f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 01:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736501020; x=1737105820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iblOg47SqMhCepIMm1yTeFpLob2mvaxvFIUpMBZ/N44=;
        b=BL1JubvvAJ/djriyf6AyhHXx4CPxUQa9wbXdVSzlp5kD7KACwZBWBn2XoPFHnqPXN4
         8lZcX2ARkj7tu6Ea2LevTyTOxBsBwOet2ySl0z8KcoSEUc3WlBZxpkwtCDzUjWcuey6i
         8FI1o0hFhwctMh92p4/0hPrXcn8ZjkcZe4tF8V7n4PFY7jvAM5UOpgD1broqxY80IkA1
         Fj6AvirjFcCczaJEheXTIXuskdj5CZuT5PugXXZPjKQ65AJKGRg4bqSxzTbqU2RJY1L+
         0qhgQu8dhge1ezcRCxjBwTuAEXZW+6XrmN1Q/sIQHZDEXO8XCJX6DuCIePdPTDt7iNm9
         Q1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501020; x=1737105820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iblOg47SqMhCepIMm1yTeFpLob2mvaxvFIUpMBZ/N44=;
        b=eBZ8/THKTCXauJe+tYSI4ormKhumDnzr9qBXJyvlRpaQmfvZJbrNCWDHZFrhb8FTSS
         /Csn0D++jgvk/V5hktkqideDU/+fMEPj5vzf9YPz/v1BEH+egKjbVJ4VZotO0reiKS8o
         xyKj6B0yG4efv1YlcmdlMW4/VyREYnQaaaOgyaJoZaKA7iR/Ewe/hDOJzKPAGZqOIewx
         976tNNhCzr8fm14i19uOHONJ/Jjdm3UpKDvL2HyA3kyjaUwe892hTupTyBMpH0GbY8gF
         oGEf0uZAzzcRxPUOctV3DAaOa/+vynNoY6GoRTRsSvaFwerqZ3AIdJJDMylJwXyCujfG
         kNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1YqH0sLRJXVbYXVgAqPEIpTIlQELe8niNjCzhRhvOc25v2u+S1cLIzgQXYYt2RqRfxHrZzTw4gUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwigUX4q1JO9EeHohZ+oNIrNnZrshuO9n1fvhAXC9WipiXrcqMk
	0jW9hgsxgRDd3QoA2pMRGqHxCiJpAlwLxqaUqkPHc6fjXKnaWcZ/gCrNFsGDRrvivgsZRo5fa0m
	U
X-Gm-Gg: ASbGncvEkg03gwkAeHCCjARAwL9IGjTH7jx/1dqCebYMv+7MhQ8ADENTrQ1jWHOJs4A
	KuJixIIAMCdR76ty+iLjTZ8i2vcEoy68Eaie+JgdlvbTIzWM5p3P6VPhwzQEBffnjXWKoV9u9p4
	wRu1I8g8zCKS4/qAvNZZyYBlXHTkn/bl4IO/qVRzPf7ggrp0AsRvduJ54X8nKaFWhPNJDC69cnj
	4gBrTCXUyUAQMvKtPcy1CGzU1WNe7OeU4VXOrTcfbkVjLs/2EccegvcQ8gGvvIVeE3iNOyV7e8c
	wh2QzmdwnH4wKBS39KdPdEwRfA==
X-Google-Smtp-Source: AGHT+IHmPDT7lummp4HIP/KoVk1LUf7yhzdRFnEabDGyfdw44hXV+escqPFxOsyhmfs5JxEIBNTe+A==
X-Received: by 2002:a5d:64aa:0:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-38a872fc200mr8365963f8f.6.1736501020360;
        Fri, 10 Jan 2025 01:23:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c3428sm3929818f8f.87.2025.01.10.01.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:23:39 -0800 (PST)
Message-ID: <6e1e0e1c-b8e2-45f7-b4dd-2b651b994b4b@rivosinc.com>
Date: Fri, 10 Jan 2025 10:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 0/5] riscv: add SBI SSE extension tests
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250110085120.2643853-1-cleger@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250110085120.2643853-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_012342_513702_C9B2A7D2 
X-CRM114-Status: GOOD (  14.76  )
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

QWZ0ZXIgdGVzdGluZyB3aXRoIGEgY2xlYW4gYnVpbGQsIGl0IHNlZW1zIGxpa2UgYXNtLW9mZnNl
dC5oIGdlbmVyYXRpb24KaXMgYnJva2VuLgoKU29ycnkgZm9yIHRoYXQsIEknbGwgZml4IGl0IGFu
ZCBzZW50IGFub3RoZXIgdmVyc2lvbi4KClRoYW5rcywKCkNsw6ltZW50CgpPbiAxMC8wMS8yMDI1
IDA5OjUxLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gVGhpcyBzZXJpZXMgYWRkcyBhbiBpbmRp
dmlkdWFsIHRlc3QgZm9yIFNCSSBTU0UgZXh0ZW5zaW9uIGFzIHdlbGwgYXMKPiBuZWVkZWQgaW5m
cmFzdHJ1Y3R1cmUgZm9yIFNTRSBzdXBwb3J0LiBJdCBhbHNvIGFkZHMgdGVzdCBzcGVjaWZpYwo+
IGFzbS1vZmZzZXRzIGdlbmVyYXRpb24gdG8gdXNlIGN1c3RvbSBPRkZTRVQgYW5kIERFRklORSBm
cm9tIHRoZSB0ZXN0Cj4gZGlyZWN0b3J5Lgo+IAo+IC0tLQo+IAo+IFY1Ogo+ICAtIFVwZGF0ZSBl
dmVudCByYW5nZXMgYmFzZWQgb24gbGF0ZXN0IHNwZWMKPiAgLSBSZW5hbWUgYXNtLW9mZnNldC10
ZXN0LmMgdG8gc2JpLWFzbS1vZmZzZXQuYwo+IAo+IFY0Ogo+ICAtIEZpeCB0eXBvIHNiaV9leHRf
c3NfZmlkIC0+IHNiaV9leHRfc3NlX2ZpZAo+ICAtIEFkZCBwcm9wZXIgYXNtLW9mZnNldCBnZW5l
cmF0aW9uIGZvciB0ZXN0cwo+ICAtIE1vdmUgU1NFIHNwZWNpZmljIGZpbGUgZnJvbSBsaWIvcmlz
Y3YgdG8gcmlzY3YvCj4gCj4gVjM6Cj4gIC0gQWRkIC1kZXBzIHZhcmlhYmxlIGZvciB0ZXN0IHNw
ZWNpZmljIGRlcGVuZGVuY2llcwo+ICAtIEZpeCBmb3JtYXR0aW5nIGVycm9ycy90eXBvIGluIHNi
aS5oCj4gIC0gQWRkIG1pc3NpbmcgZG91YmxlIHRyYXAgZXZlbnQKPiAgLSBBbHBoYWJldGl6ZSBz
Ymktc3NlLmMgaW5jbHVkZXMKPiAgLSBGaXggYTYgY29udGVudCBhZnRlciB1bm1hc2tpbmcgZXZl
bnQKPiAgLSBBZGQgU1NFIEhBUlRfTUFTSy9VTk1BU0sgdGVzdAo+ICAtIFVzZSBtdiBpbnN0ZWFk
IG9mIG1vdmUKPiAgLSBtb3ZlIHNiaV9jaGVja19zc2UoKSBkZWZpbml0aW9uIGluIHNiaS5jCj4g
IC0gUmVtb3ZlIHNiaV9zc2UgdGVzdCBmcm9tIHVuaXRlc3RzLmNmZwo+IAo+IFYyOgo+ICAtIFJl
YmFzZWQgb24gb3JpZ2luL21hc3RlciBhbmQgaW50ZWdyYXRlIGl0IGludG8gc2JpLmMgdGVzdHMK
PiAKPiBDbMOpbWVudCBMw6lnZXIgKDUpOgo+ICAga2J1aWxkOiBhbGxvdyBtdWx0aXBsZSBhc20t
b2Zmc2V0cyBmaWxlIHRvIGJlIGdlbmVyYXRlZAo+ICAgcmlzY3Y6IHVzZSBhc20tb2Zmc2V0cyB0
byBnZW5lcmF0ZSBTQklfRVhUX0hTTSB2YWx1ZXMKPiAgIHJpc2N2OiBBZGQgIi1kZXBzIiBoYW5k
bGluZyBmb3IgdGVzdHMKPiAgIHJpc2N2OiBsaWI6IEFkZCBTQkkgU1NFIGV4dGVuc2lvbiBkZWZp
bml0aW9ucwo+ICAgcmlzY3Y6IHNiaTogQWRkIFNTRSBleHRlbnNpb24gdGVzdHMKPiAKPiAgc2Ny
aXB0cy9hc20tb2Zmc2V0cy5tYWsgfCAgIDIyICstCj4gIHJpc2N2L01ha2VmaWxlICAgICAgICAg
IHwgICAxMCArLQo+ICBsaWIvcmlzY3YvYXNtL2Nzci5oICAgICB8ICAgIDIgKwo+ICBsaWIvcmlz
Y3YvYXNtL3NiaS5oICAgICB8ICAgODkgKysrKwo+ICByaXNjdi9zYmktdGVzdHMuaCAgICAgICB8
ICAgMTIgKwo+ICByaXNjdi9zYmktYXNtLlMgICAgICAgICB8ICAgOTYgKysrLQo+ICByaXNjdi9z
YmktYXNtLW9mZnNldHMuYyB8ICAgMTkgKwo+ICByaXNjdi9zYmktc3NlLmMgICAgICAgICB8IDEw
NjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHJpc2N2L3NiaS5j
ICAgICAgICAgICAgIHwgICAgMyArCj4gIHJpc2N2Ly5naXRpZ25vcmUgICAgICAgIHwgICAgMSAr
Cj4gIDEwIGZpbGVzIGNoYW5nZWQsIDEzMDEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcmlzY3Yvc2JpLXNzZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi8u
Z2l0aWdub3JlCj4gCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
