Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28D1C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFCURE43BQYIWDxNgDB0kegOhVSMORWk/k0AQV1DyJ4=; b=eumGong3x12ncZ
	DH9VK71HUbmkRL+NbuIMcqcDvF11MKtHu5ATj2LEl92vOqAU7xyyz25SzZSigwo7iW7m85sVQ3rp7
	A+sJtEQtnVsGGu2Q/fNYiK49eL8IXdZW7NL7q/9U/d0lIX3a/K/1s5gP+zKhNQO3x1mv1NSmTZ20N
	CAs4/UUovlqU2NT1NsGlGXo4ayBfH0VqoyKVyl1UpirPdyU4F6fo7GZ9YoGyUtNuvqqrixG3Vbbeq
	4rEX1eL9r6DGl8WRgYhoJt1ADMjkN+fZdBmG/aJ6JFQFIj0alrlLdrAKr853qbxjLKYZFUmdDxyxi
	UJa7VeRPNNCF7X6Wo6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3v-0000000EbAH-2KY6;
	Thu, 24 Apr 2025 16:04:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wFK-0000000E8ND-3tPf
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:04:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso8900965e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745499845; x=1746104645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlenUvh61lykgI0moQ4b5m5MpD7H2yqiNR9KiWkzX9o=;
        b=uSWA5oUXL+Rx8fUZvzxx63yaYKhNQ92s3bnnW7w1W0BPnZ9rwleoN1NgaS50o63o9H
         +LIlueRtCPIvMpUDO/6ByIVjwbIfCb87q22QyCc8+ih2eHk3UBf0TPJ/sXB8V05YdSP2
         3youTikaKrkpcJRbiL6PyJ0Y1GyaVPWyjCBD720h1NgZhqnt58hPpxD+NxmJozWdTS45
         RqWZRfrRVGYmomLrXCLq2KF8f6CZ++0kdMu/28gOS8bEss9wua6HvpQdfbuav+c4wK/s
         erLXgm1GQS2yUlfqfa1sWP04b/mzLuoxwgXr5wRgSwp6OryRhHiNgoE+zojIivndw16c
         K9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499845; x=1746104645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlenUvh61lykgI0moQ4b5m5MpD7H2yqiNR9KiWkzX9o=;
        b=sz8U5f5x6UsCTcyVOx78NRYw3cnvwrwaZ9uyMDGl1orwZf+3Mf0/YW8F4Rq1/hXYbG
         BRZL8p3DUK/3spVN7cN/OxS/rIryBVzuA7ePt+KzKUWZ9AYwMNtiaw1bkAC8stZEzAed
         hYHgjH3bpfzMvlLMGmDyKRXenyzj3K/WNe4oALX9jKuuxUKr5fhZCWeowsG5KiGcqYnW
         cy2JihZFsOyGWDNJMsMP2gnTYgQ2TVHG+mYj0fL+JOngEMbyc/kImO+MbggnDoyPSVcC
         poZRyscSQqZenB4XZ6QL0Cub2QTl5WIvszIPXWg21tMub5ydtfdsfUHuFzkQDT/KwB02
         O7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVnzl9rFroUCNp2WFaOO4G+5puDs+aT2S4M/5jB6uVdD2XXYN7vS4DHKaJkxcrh0Bu4thDtBJ5DrSI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQltjt7y4RcwpzmQozx1KDIPaC+OZnziKqiVhWahBDbWkIImD
	1Nj2H5ixMIGerx2nSu+DESk6UkPBS3UMqrzOSZnmbHRhppXIyylppWpGmzeOY2s=
X-Gm-Gg: ASbGncv5e0kSn38UxZWh5rGhTQgREgX84UOtDuSbj9tPhb5at5mvp+XjJSxfzC8PLRL
	pZlx6M2B6tDpoXA2DyCS1euk3LuDRNGVS6ELmGixORorNABduuaWfzmuELOHJ1SraOrui24NXqY
	Ib7MakS37QGzh67F0FfnWPRYZboaj7FOGNa4802zR+sx6wM2e4k2TNvxOIFMb6axijal860lXCh
	4C/9fYeMTZQC7+aqw5ugh4xmu7B8Yv/LIC/BBdzCnZKJoNROM4Fyo1rulpWdJogeVnw7R+VAvgk
	dC4KV19LrmfmjJWxtHzauvqsPdKm7/K+W/pxomwdXR4oY+U+tCMZb3gFIFFzkacGi17thtYGmDJ
	u4L+PtF3c2A==
X-Google-Smtp-Source: AGHT+IFY/zQrAFYpl1F/wfq7qZKx4PChEo3rOT9RvUxXUgDej0UjL+OvlI8WpktqulU98FccnhbKpQ==
X-Received: by 2002:a05:600c:5110:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-4409bd20ab9mr23814095e9.13.1745499844890;
        Thu, 24 Apr 2025 06:04:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2acf8dsm20366545e9.23.2025.04.24.06.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:04:04 -0700 (PDT)
Message-ID: <8c7c1632-ced2-491a-92a3-8b98de655b4a@rivosinc.com>
Date: Thu, 24 Apr 2025 15:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
 <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
 <20250424-27a672c1da15353051b52c59@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-27a672c1da15353051b52c59@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_060406_963164_7898389C 
X-CRM114-Status: GOOD (  13.72  )
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

CgpPbiAyNC8wNC8yMDI1IDE0OjU5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MjQsIDIwMjUgYXQgMDI6MzU6MDJQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyNC8wNC8yMDI1IDEzOjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBUaHUs
IEFwciAxNywgMjAyNSBhdCAwMjoxOTo1MVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gQWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4g
U0JJIFYzLjAgaGVuY2UsIGl0IGlzCj4+Pj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQg
dGhhdCBjYW4gYmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
Ywo+Pj4+IGluZGV4IDM3OTk4MWMyYmIyMS4uN2IwNjIxODliMTg0IDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMKPj4+PiBAQCAtMjk5LDYgKzI5OSw4IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihp
bnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4+Pj4gIAlyZXR1cm4gMDsK
Pj4+PiAgfQo+Pj4+ICAKPj4+PiArc3RhdGljIGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOwo+Pj4K
Pj4+IEF0IHNvbWUgcG9pbnQgd2UgbWF5IHdhbnQgYW4gU0JJIGV4dGVuc2lvbiBiaXRtYXAsIGJ1
dCB0aGlzIGlzIG9ubHkgdGhlCj4+PiBzZWNvbmQgU0JJIGV4dGVuc2lvbiBzdXBwb3J0ZWQgYm9v
bGVhbiB0aGF0IEknbSBhd2FyZSBvZiwgc28gSSBndWVzcyB3ZSdyZQo+Pj4gc3RpbGwgT0sgZm9y
IG5vdy4KPj4KPj4gVGhhdCBzZWVtcyByZWFzb25hYmxlIHRvIGhhdmUgYSBiaXRtYXAgcmF0aGVy
IHRoYW4gZHVwbGljYXRpbmcKPj4gKmV4dCpfc3VwcG9ydGVkLiBJZiB0aGF0J3Mgc29tZXRoaW5n
IHRoYXQgYm90aGVycyB5b3UsIEkgY2FuIHRha2UgY2FyZQo+PiBvZiBpdCBhbmQgdXNlIGEgYml0
bWFwLiBTU0Ugd2lsbCBhbHNvIGhhdmUgYSBzc2Vfc3VwcG9ydGVkIGJvb2xlYW4gYnV0Cj4+IGlu
IGl0J3Mgb3duIGRyaXZlciBmaWxlIHRob3VnaC4KPiAKPiBVcCB0byB5b3UuIFdlIGNhbiBhbHdh
eXMgZG8gaXQgbGF0ZXIuCgpJIHdpbGwgbGV0IHRoYXQgZm9yIHRoZSBuZXh0IGV4dGVuc2lvbiBi
ZWluZyBhZGRlZCB0aGVuIDspCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
