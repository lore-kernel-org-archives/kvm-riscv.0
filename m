Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECBAC021B8
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZIHYIkP7HtOmAbDy7hS87Sx3utRSTG02nAUf5PDTAM=; b=BPPyF1UZPqCF32
	Pv14izBYEnVbZVkS8ZgkgERdIMUEXmAoL//ynxNeiCL1kV80Pcv6mkBEEkq6modmrRVx30fwYSTRQ
	QgwdbRJny2qzZfn244bLrSIonK0vowQ/syy3rLPNmKkPucUIq/XlUHV8UIDUPu/EiFfRtyhF6WP4b
	b+PfOHR/sO0IaS0c07RMjXShhBCT1kKSFIRvxkksseDlhUX8bWDXgtnO2p0RHPz4lULYzjEdtylfF
	3Vlq8KVHwoeCWsmA5w2TdgJiKLLlmrfjKmt3bQsDjc+feXpnRL//Sak2TQgrGfUke3lnif4Ak8kf4
	wHm84BN3w8QifOYQfU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1L-00000000M5I-29nf;
	Tue, 25 Feb 2025 16:42:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwg0-0000000030q-2oMH
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 15:16:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220d398bea9so92364215ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Feb 2025 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740496612; x=1741101412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v370oVFsX1u+VB7nv12t6mgvVjfY9HOAII6dBqSUZlM=;
        b=AE+5gmoIq5g9ukRD1Rvc5OPqIllT1Q7X1NUGPDGTjIdLsmaQmQu+GuPVTQMG6iYGuu
         /GsK9PEvLuVIxWMeKo8UILqXiOczbXgKhw035FM6P0aUBLa7ImIgU8D0kJ6RUC8xTsJp
         FtQ5eWQDgChQpwrfYA7C+GxtLFYARl2q080uDT6KgRLmOfJEb4SjzaWftJa7VTC3ZH1I
         uHr9i0/0U3QUnakdtuwhUj4Ivz9WOG950F0ApTH2e+ER5c2Y46GWb33hcbhZNsrJts0O
         h+4E9XmNI0Fc4JVoN9RkQvBMOtDCK/xITfNPZIm+OcNqLnNCnRhVrr55iKLC0Ra0/rmd
         Z0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740496612; x=1741101412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v370oVFsX1u+VB7nv12t6mgvVjfY9HOAII6dBqSUZlM=;
        b=Nw0OmZgcwH+/UF1760r6/N5E9+9TO7DTdVa3PQu8nj5p6og1QQGzkPCNIIAm+59leL
         JNCJBHvytU08r/4bq2Yc9GjA2Ze1R/HPoyn0nilT4AuZANXnx4G7rJkK40A4tnl5LYQt
         j/EPZmOf2yAcs2+OHzvglLVfaxCrON1clQcE34YcEdqAkowPlnDp8svYHR2uxyQKQTVq
         +jSx3Frta8IFbwm/qi2VuE0h/ntlW06wCWq+ETcvTf0ffyZ2FTQWOqLEIjShPMB+A7yH
         fuHDTj7VDosKdTHUm6s+l9xEHLbmQ/enydg9pG+vmFizwI7bY/yLbnyrIz1WioWKODJE
         lb7A==
X-Forwarded-Encrypted: i=1; AJvYcCWSCptjgqI4+liy32w6Khcw6/UWwrG0uylad9Ksr3sK0gTm6BZsWjLk/vG3YHg/L7hyLV+AbGHY4c4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIScN3GB8f9NF8Vb8m9Em5ZG34qFXzIo8fw+kb7k/2o0cRtLED
	wk47lB9vDxdrr8swCFH7VA/T4T3CLScU4kid8PW5APLpDbz9m/60S4ndNrbEfUQ=
X-Gm-Gg: ASbGncur6ZfB1JflbvAsDK91BQ6Q+F41r5xuI0zr/v64QNprTuuFin+xCQIzmOysQjj
	bDfux1/qOIfviLkHjUWSv+e/gMnNkGEsE19op04iqHNuG4Ei2AlZq4JvyOHey7C3pDbJaeoNLHl
	9z8nvzwgcmLC1pnZM9mbh2jQDcI71bYw43RTxJ0dPemHBbn7vpfFhwGtJu1zYp0kbfebCd8LCzc
	3TD2QS3dB0II4RhMQ/JdiPWZI+5/giro0BXWtmZkm4U1uA0dlDYexmVkL1d0qCowK4BQ/LbxdRD
	Jt0PVBo6ru9pjhyPf7D65lJfKm3Xria+S9vDMOXMkcwCM2LfLElFghFsl0fupeTBhzEDuv4=
X-Google-Smtp-Source: AGHT+IE2atruAzebmyDh/fElMPYLYhhWEoLBWFjMzE8wFwa0zONzC2LjPu2hBJs9NOFo2y0RkJW/Ug==
X-Received: by 2002:a17:902:e542:b0:216:31c2:3db8 with SMTP id d9443c01a7336-221a1191947mr269912525ad.37.1740496611695;
        Tue, 25 Feb 2025 07:16:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a63a8sm15564635ad.200.2025.02.25.07.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 07:16:51 -0800 (PST)
Message-ID: <da7697a3-64ac-4ba4-aa86-e714bd4ef71f@rivosinc.com>
Date: Tue, 25 Feb 2025 16:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 08/10] riscv: sbi: Probe/skip SUSP
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-20-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250221155533.123418-20-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_071652_895069_19BA1482 
X-CRM114-Status: GOOD (  13.08  )
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

CgpPbiAyMS8wMi8yMDI1IDE2OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gQ2xlYW5seSBza2lw
IHRlc3Rpbmcgc3VzcGVuZCB3aGVuIHRoZSBTVVNQIGV4dGVuc2lvbiBpc24ndCBhdmFpbGFibGUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2
Pgo+IC0tLQo+ICByaXNjdi9zYmkuYyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9yaXNjdi9zYmku
YyBiL3Jpc2N2L3NiaS5jCj4gaW5kZXggYTBhODMzMWIwNGJkLi5lNWY2ZTFjNzJhZTYgMTAwNjQ0
Cj4gLS0tIGEvcmlzY3Yvc2JpLmMKPiArKysgYi9yaXNjdi9zYmkuYwo+IEBAIC0xNDUyLDYgKzE0
NTIsMTIgQEAgc3RhdGljIHZvaWQgY2hlY2tfc3VzcCh2b2lkKQo+ICAKPiAgCXJlcG9ydF9wcmVm
aXhfcHVzaCgic3VzcCIpOwo+ICAKPiArCWlmICghc2JpX3Byb2JlKFNCSV9FWFRfU1VTUCkpIHsK
PiArCQlyZXBvcnRfc2tpcCgiU1VTUCBleHRlbnNpb24gbm90IGF2YWlsYWJsZSIpOwo+ICsJCXJl
cG9ydF9wcmVmaXhfcG9wKCk7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiAgCXRpbWVyX3NldHVw
KHN1c3BfdGltZXIpOwo+ICAJbG9jYWxfaXJxX2VuYWJsZSgpOwo+ICAJdGltZXJfc3RhcnQoU0JJ
X1NVU1BfVElNRVJfRFVSQVRJT05fVVMpOwo+IEBAIC0xNDc5LDcgKzE0ODUsNyBAQCBzdGF0aWMg
dm9pZCBjaGVja19zdXNwKHZvaWQpCj4gIAkJCWxvY2FsX2lycV9lbmFibGUoKTsKPiAgCj4gIAkJ
CWlmICghcGFyYW1zLnJldHVybnMgJiYgcmV0LmVycm9yID09IFNCSV9FUlJfTk9UX1NVUFBPUlRF
RCkgewo+IC0JCQkJcmVwb3J0X3NraXAoIlNVU1Agbm90IHN1cHBvcnRlZD8iKTsKPiArCQkJCXJl
cG9ydF9mYWlsKCJwcm9iaW5nIGNsYWltcyBzdXBwb3J0LCBidXQgaXQncyBub3Q/Iik7Cj4gIAkJ
CQlyZXBvcnRfcHJlZml4X3BvcCgpOwo+ICAJCQkJZ290byBvdXQ7Cj4gIAkJCX0gZWxzZSBpZiAo
IXBhcmFtcy5yZXR1cm5zKSB7CgpIaSBBbmRyZXcsCgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3
ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNs
w6ltZW50CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
