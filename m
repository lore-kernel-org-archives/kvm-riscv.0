Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EA4C5AD49
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhOuI9ET7ryEniHGue7IZ/tOkMDjJz2Ugw7F99P//lM=; b=DB2iUWwX8ByvAb
	n3fwycxubQnlxtsuRf85QuR75dlcKMek4TcPCOIhG86O+PblChnUZjLyjqf8in90Ghojnp2GNYpch
	JNA6f7RZsaEq/jw2Hgrz71/9Qqw9TYDhioaDgZ2RGtOLBVkfdCK4GzkUzsg3GrHUB2J2apo5ME868
	1t7W+UZTEWcmnPfHwyVM5Vrngp9XrNuvkFoy8Vc7Ui5L46PVIoN7aYKfQg8tcuYFjvdc8nVM0nVs9
	badasU9ndnH1yy1YMTQT/XhdLa4bywv17jncJ/PWyqK56Mdq+LacgdW8pa5XLdXiOwTaVcWrMbi8m
	lpL4ak5LJLlmHb8jyLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMSB-0000000AD9k-0dCu;
	Tue, 03 Jun 2025 07:52:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMS7-0000000AD8B-3yTO
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 07:52:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4957842f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Jun 2025 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748937174; x=1749541974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m61OCXyKK9ERb/2rZMaZqgh2bdpfeXzO3x02hpwKUck=;
        b=P7uJjLJjtOdu//ukeI3Q4R885O35owi+gKdIklayO1eTlfvLep9c8jm2RRPIFFLtYM
         YI8bENoidskzIyvoN9S1NSiY+ygvWFzrLkL3Qvh4TDZDmF8GmWhQEwCZdbypf0yEde7B
         5hk99g/O9iL4vqfhACbXCQriDjITB3oBZJuUnZEJgQVtM2Cs36wapGiWI7kauP7qyF73
         q3RkzfeaFpVolnSXOJVO68I/cRN83gUeY1BE5PFzoqAHbOPh7nesj2I7QJ/0IdKaNYzy
         Z6rpfCNI8X3uyA0LFuMfPT80ANkm99Rx+atwjuNzPMwYbNcDC9pZZlKF5uTiSfBqDGny
         NTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748937174; x=1749541974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m61OCXyKK9ERb/2rZMaZqgh2bdpfeXzO3x02hpwKUck=;
        b=WHnRJnhbpe7dYLamqeMUeDx0yVgHEYKlwvaQ8rRyo4LeKBzY6O+kW9U/FuMXtwRkyR
         26akfY+gCFt9sPdjggoDN3vHnUG6rIZum9KQGJHNWmEIbWh4+24bFAsqlx0OMb4IK2qm
         3M+N6wbWJzANMvDLxD/KdIudLtlI4f95kBVh6+YWXs4Q2/JdWemnyBo4HgCupFtvDU3k
         jBYe3HCaLiKOIT0i9CQpwghQrKnvaJo6fhSMBXynKbbzabG5xA2RgatDGoPrfsfQhHZT
         7hKLSkrR2zvQkBcam/tMBISr5eZ2F+QtLDFLTYuWqverW2IG0qmLarWA3jDxqbt3Ogxp
         EfOA==
X-Forwarded-Encrypted: i=1; AJvYcCU55Lu5rOCt1TpIHtRvWVIar8icFGCfQVmcyPPu7qCnSwwkkrkN+pvuYGDhjM0GH54WZ88j9az59MY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzPIcCunaNviUkV4lXlHM+Ta99/bcBuwrZfAQnbq+KnuU0yEwP
	OEcerOifemyDvHTcSh118d9/p4Xt4PxCEsSuX4vthqSeiWQJfnr71Ax1jpOyFKaxBbnlBbuAtac
	pt0v21v0=
X-Gm-Gg: ASbGncuJEdo8+8mzC3FOjSfhYMyl4811CwxArE9OhTnBkUsIaEUc6mwQk8hCzpg9iJb
	mTdhncg7hlL+6VTEVGEqhN4EDP4tVXVfl2b0TQpRA+MuIBsTrgzOiY2aQaaLfS7rwnpc69vEHi0
	bzpab24/XigsehTw1jjfGjQB7xuaNWafmRTMV84AZ6Bsnsxx2oMKwukfOaozv07rW/OxuvTivZu
	QIvIa29l7uxXQsS3BvelGXwijVqTgIYXgVBfxBJRqOJyntFPxEipdPf1P3+H0pdUVzTGjTn0WCO
	VeJ9aiIWRwVFxP9pjduSI6pEjfvgoiQMSd64BGnyDuPZ6pvHJMP+1C1A4+09dJ+cvG87CyBbcYJ
	Ob2x5H+pbdIRIqbR5HhmqxkqU8tQbCdE=
X-Google-Smtp-Source: AGHT+IFj56gQIXjUxeVgr0DLD4EJHkF+7gB6PKwFHaTHu2meToVlvesVdcLfH9ZFmhcZfcce+aitmg==
X-Received: by 2002:a05:6000:40ca:b0:3a3:655e:d472 with SMTP id ffacd0b85a97d-3a4fe395a08mr8455530f8f.47.1748937174316;
        Tue, 03 Jun 2025 00:52:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73ee0sm17254343f8f.46.2025.06.03.00.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:52:53 -0700 (PDT)
Message-ID: <9fbee56b-988d-4557-a8c5-e0c85d146a39@rivosinc.com>
Date: Tue, 3 Jun 2025 09:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: Add double trap testing
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
 <20250603-ae5b10c63b6ac83d206343fa@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250603-ae5b10c63b6ac83d206343fa@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_005255_988746_B29938A9 
X-CRM114-Status: GOOD (  15.85  )
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

CgpPbiAwMy8wNi8yMDI1IDA5OjEwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gCj4gSGkgQ2xlbWVu
dCwKPiAKPiBZb3UgbWF5IHdhbnQgdG8gYWRkIGZvcm1hdC5zdWJqZWN0cHJlZml4ID0ga3ZtLXVu
aXQtdGVzdHMgdG8geW91ciBnaXQKPiBjb25maWcsIHNpbmNlIGl0J3MgbWlzc2luZyBmcm9tIHRo
aXMgc2VyaWVzLgoKSGkgRHJldywKClllYWggc29ycnkgZm9yZ290IHRoZSBwcmVmaXggIQoKPiAK
PiBPbiBGcmksIE1heSAyMywgMjAyNSBhdCAwOTo1MzowN0FNICswMjAwLCBDbMOpbWVudCBMw6ln
ZXIgd3JvdGU6Cj4+IEFkZCBhIHRlc3QgdGhhdCB0cmlnZ2VycyBkb3VibGUgdHJhcCBhbmQgdmVy
aWZ5IHRoYXQgaXQncyBiZWhhdmlvcgo+PiBjb25mb3JtcyB0byB0aGUgc3BlYy4gQWxzbyB1c2Ug
U1NFIHRvIHZlcmlmeSB0aGF0IGFuIFNTRSBldmVudCBpcwo+PiBjb3JyZWN0bHkgc2VudCB1cG9u
IGRvdWJsZSB0cmFwLgo+Pgo+PiBJbiBvcmRlciB0byBydW4gdGhpcyB0ZXN0LCBvbmUgY2FuIHVz
ZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQgdXNpbmcgYW4KPj4gdXBzdHJlYW0gdmVyc2lvbiBvZiBP
cGVuU0JJOgo+Pgo+PiAkIHFlbXUtc3lzdGVtLXJpc2N2NjQgXAo+PiAJLU0gdmlydCBcCj4+IAkt
Y3B1IG1heCBcCj4+IAktbm9ncmFwaGljIC1zZXJpYWwgbW9uOnN0ZGlvIFwKPj4gCS1iaW9zIDxv
cGVuc2JpPi9md19keW5hbWljLmJpbiBcCj4+IAkta2VybmVsIHJpc2N2L2lzYS1kYmx0cnAuZmxh
dAo+IAo+IFlvdSBjYW4gYWxzbyBkbwo+IAo+ICQgUUVNVT1xZW11LXN5c3RlbS1yaXNjdjY0IEZJ
Uk1XQVJFX09WRVJSSURFPTxvcGVuc2JpPi9md19keW5hbWljLmJpbiAuL3Jpc2N2LXJ1biByaXNj
di9pc2EtZGJsdHJwLmZsYXQKCk9oIHllYWggSSBldmVuIHVzZWQgdGhhdCBhcyB3ZWxsLi4uCgpU
aGFua3MsCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwo+IAo+Pgo+PiBDbMOpbWVudCBM
w6lnZXIgKDMpOgo+PiAgIGxpYi9yaXNjdjogZXhwb3J0IEZXRlQgZnVuY3Rpb25zCj4+ICAgbGli
L3Jpc2N2OiBjbGVhciBTRFQgd2hlbiBlbnRlcmluZyBleGNlcHRpb24gaGFuZGxpbmcKPj4gICBy
aXNjdjogQWRkIElTQSBkb3VibGUgdHJhcCBleHRlbnNpb24gdGVzdGluZwo+Pgo+PiAgcmlzY3Yv
TWFrZWZpbGUgICAgICB8ICAgMSArCj4+ICBsaWIvcmlzY3YvYXNtL2Nzci5oIHwgICAxICsKPj4g
IGxpYi9yaXNjdi9hc20vc2JpLmggfCAgIDUgKysKPj4gIGxpYi9yaXNjdi9zYmkuYyAgICAgfCAg
MjAgKysrKysKPj4gIHJpc2N2L2NzdGFydC5TICAgICAgfCAgIDkgKystCj4+ICByaXNjdi9pc2Et
ZGJsdHJwLmMgIHwgMTg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4+ICByaXNjdi9zYmktZndmdC5jICAgIHwgIDQ5ICsrKystLS0tLS0tLQo+PiAgcmlzY3Yv
dW5pdHRlc3RzLmNmZyB8ICAgNSArKwo+PiAgOCBmaWxlcyBjaGFuZ2VkLCAyNDAgaW5zZXJ0aW9u
cygrKSwgMzkgZGVsZXRpb25zKC0pCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3YvaXNhLWRi
bHRycC5jCj4+Cj4+IC0tIAo+PiAyLjQ5LjAKPj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
