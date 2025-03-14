Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D1C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALf+OIvF7nNPi4fvoYlGQGrAk2TLDO8v2V8PJ5pGIP8=; b=aV9KxOex8pfh6t
	TXt3cJi9cE4f8InnKPUKKMBbLa9zAOqxoqjqO0Cd8n6haVNjwK1Wn/RMSWJ/kxzdAFMuHOJleghEt
	BFKPMYH4iyfIQqTdI0bqsuXbg8TqdWri685GUcCMw9sBUcqlHab0Oi7smYqXSCGU09VGnS1s4gXhI
	DUkZLQHbm1JLeVMcCT0S9lLMLyF1asJGzNV5TlU/Z08G3yK+GR6+mvkdDK7jILiohWnlCs0tYL22J
	Ed47Rr0fBdyWo8jFns0XANGi9SiRGayPh2um6+YtZRoa+wLD3NcCUeevaf2N6hor1qgswSgWu/VMR
	DDkSanSvNWpP5u2Ywrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5wu-0000000EOQi-0FDe;
	Fri, 14 Mar 2025 14:23:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5wr-0000000EOPX-25BO
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:23:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38f2f391864so1267484f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741962220; x=1742567020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lb8jB3tZVhj1VGb1r3eSYUdMFkU+qvZg8Yqngtmhcpw=;
        b=TagqfAvz3VBQ181+lBcnDit4MNAIZexSZ393cI2rD1MJ2J3PxuHFuzO8cl5kv7Mqs1
         BZu9rUi26a0CgPO/4Rn04BTu6usWA9B4CikjFCzljN9vWZ1oE818yeXb/wB0ymOzSJzd
         Xln72omY5UjdRgwLsSJO2Kw1JnGunDPgb1ZOoOhqfHfJNPgLf2VD7fhcR6op4yXipsId
         Q105OryE0Lpx0p5vsrcxTLkNJOrA7W0q8amnvZr1uCghYm9678uWS2PVRRNLcG+tvjM/
         e/nfwCoabM7PeAvIDQ3LnqSUxfPA1YgFza7sgPRBSKAkMTHQ9AJ44824ocqbR4KaPFxl
         HslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962220; x=1742567020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb8jB3tZVhj1VGb1r3eSYUdMFkU+qvZg8Yqngtmhcpw=;
        b=nT6l5gdkz4T4+VLkJRJHUL3/ImzaD/vOgoFXnEBYTjfYhQUBlWa0cNTNvytvnpWQ70
         /4NL+ExPOWoHb7wn4F5lr4ABq7YkoKFsDSfn4X6BfxM2D0mWEQpdFIB3PCNtlBeI0E3v
         +j5evTYZ4V4vuU85rwNEuB3U1nct/k5NW4ALrF7jXpm+F/EHXXLmZ/Qor3vnGw6BGDgK
         D8WGfdKxwst/LHv7wHsInPVLiadvKHquSPSPSIZBujIA+mqz7444+BKj62KTU6tAJyYJ
         R75Cx4sJ7cv4+Xb3HFfXp7OlIjj6JksBXurTPIwVeOJ4/cYCerVn7JpTPXIbtZWUVuYZ
         ut6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3w0AnSPHIk5MxlCn210ju/i9VA8CU9RDXlbZPHv/yEDV7Bzdp9npbYC4kwqDPpakdHVhMLzEFf3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJlag1ZAQkQaxD44RvWyjZNck6er777pIMjSlL27q2VOV2V90u
	yRSdtM2wLMpCYMeDeuDnMUvN/wXt4sQjazjLbFuQc7HpFHaYKLgFa6Ywozwf1NY=
X-Gm-Gg: ASbGncv3wBlETAnpRjDkzau9FPjYRLPOSsIXhlhH6opIEZancvUxn1EQGGD/8utpMjk
	CX7OuA9yMopX+OuZGHH83EGlHxdhaU+G3dIx7IW/wCV66fTSn+d+aA1wwna76Uvjs4bEgobbQAr
	NZLBxQgT5Nv/Kh8GNDNSaMvjI/y86Kfbyyk2yOjBKwGcwpsLhBkMeJaDXVPNhf7qXYvqjQAHp1N
	7XwUnJuwZl2vIweww3Y92AdO2g8yUl+vPsPOz2R0Bm3bl47zNAl2Pr0X4Qo6K01bhueT07UsQBM
	3rOxJFcKJOp/oO3Xc+w4NKACMubGlhIygS3o7xEhmXtR0v4f3Niy6/yqe4kfzhzBPdzDb7GEoBP
	PXKyc74B/AwlufA==
X-Google-Smtp-Source: AGHT+IFYg4LjWh5txKo3LZf8ZSZWkKoHLuS9DuFJjCF4JXWiQnv/UzyjdE5CaArqASIFKFfGR+2mvg==
X-Received: by 2002:a05:6000:178c:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-3971d9f1c77mr3591221f8f.21.1741962219826;
        Fri, 14 Mar 2025 07:23:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf95sm18771065e9.14.2025.03.14.07.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 07:23:39 -0700 (PDT)
Message-ID: <eaf88dbb-39bb-4755-830a-7c801099c790@rivosinc.com>
Date: Fri, 14 Mar 2025 15:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 0/6] riscv: add SBI SSE extension tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314-eb8cf0b719942c912e254ab2@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250314-eb8cf0b719942c912e254ab2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_072341_554934_72B578C0 
X-CRM114-Status: GOOD (  12.99  )
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

CgpPbiAxNC8wMy8yMDI1IDE1OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBNYXIg
MTQsIDIwMjUgYXQgMTI6MTA6MjNQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBU
aGlzIHNlcmllcyBhZGRzIHRlc3RzIGZvciBTQkkgU1NFIGV4dGVuc2lvbiBhcyB3ZWxsIGFzIG5l
ZWRlZAo+PiBpbmZyYXN0cnVjdHVyZSBmb3IgU1NFIHN1cHBvcnQuIEl0IGFsc28gYWRkcyB0ZXN0
IHNwZWNpZmljIGFzbS1vZmZzZXRzCj4+IGdlbmVyYXRpb24gdG8gdXNlIGN1c3RvbSBPRkZTRVQg
YW5kIERFRklORSBmcm9tIHRoZSB0ZXN0IGRpcmVjdG9yeS4KPiAKPiBJcyB0aGVyZSBhbiBvcGVu
c2JpIGJyYW5jaCBJIHNob3VsZCBiZSB1c2luZyB0byB0ZXN0IHRoaXM/IFRoZXJlIGFyZQo+IGN1
cnJlbnRseSA1NCBmYWlsdXJlcyByZXBvcnRlZCB3aXRoIG9wZW5zYmkncyBtYXN0ZXIgYnJhbmNo
LCBhbmQsIHdpdGgKPiBvcGVuc2JpIHYxLjUuMSwgd2hpY2ggaXMgdGhlIHZlcnNpb24gcHJvdmlk
ZWQgYnkgcWVtdSdzIG1hc3RlciBicmFuY2gsCj4gSSBnZXQgYSBjcmFzaCB3aGljaCBsZWFkcyB0
byBhIHJlY3Vyc2l2ZSBzdGFjayB3YWxrLiBUaGUgY3Jhc2ggb2NjdXJzCj4gaW4gd2hhdCBJJ20g
Z3Vlc3NpbmcgaXMgc2JpX3NzZV9pbmplY3QoKSBieSB0aGUgbGFzdCBzdWNjZXNzZnVsIG91dHB1
dC4KClllYWggdGhhdCdzIGR1ZSB0byBhNi9hNyBiZWluZyBpbnZlcnRlZCBhdCBpbmplY3Rpb24g
dGltZS4KCj4gCj4gSSBjYW4ndCBtZXJnZSB0aGlzIHdpdGhvdXQgaXQgc2tpcHBpbmcva2ZhaWxp
bmcgd2l0aCBxZW11J3Mgb3BlbnNiaSwKPiBvdGhlcndpc2UgaXQnbGwgZmFpbCBDSS4gV2UgY291
bGQgY2hhbmdlIENJIHRvIGJlIG1vcmUgdG9sZXJhbnQsIGJ1dCBJJ2QKPiByYXRoZXIgdXNlIGtm
YWlsIGluc3RlYWQsIGFuZCBvZiBjb3Vyc2Ugbm90IGNyYXNoLgoKWWVzLCB0aGUgYnJhbmNoIGRl
di9jbGVnZXIvc3NlIG9uIGdpdGh1YiBjYW4gYmUgdXNlZDoKCmh0dHBzOi8vZ2l0aHViLmNvbS9y
aXZvc2luYy9vcGVuc2JpL3RyZWUvZGV2L2NsZWdlci9zc2UKCkknbSB3YWl0aW5nIGZvciB0aGUg
c3BlY2lmaWNhdGlvbiBlcnJvciBjaGFuZ2VzIHRvIGJlIG1lcmdlZCBiZWZvcmUKc2VuZGluZyB0
aGlzIG9uZS4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
