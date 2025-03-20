Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FAAC28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFtSndjeLq4zdfmAsl5ksbs2wMa6ed7OAwqDBwLIGXA=; b=pVtN9SOmlgBa37
	WEeri6ZzQ3HJZeP88oy0vzPFAVUgLNW39vf+34BTOmO/wIKl+5cyzp+gUVBJa1Hl5SiL9xPkwNKu/
	y52b7UzU5dQLeYr3pQ/z15yc1lpLpvzu8hQnVEyIshnJfPm7wvLMmBDm+kHmUWmDT6a0mXWCXywrA
	eozUYHsmTPxRKGEmUkWABQX+VC2J8YWP+zw0RDyKGTR2kmbQOwZZc6NejSNzMe+jG5b9q+3YAehWu
	78rhDXwFP2nFha84TDvT/uXvLqL42cTREJawByt7A8oaA9JgdmEhLlYlcd9rSUVsEtLW9+vxthKjt
	6NCxWIkochsNJqh++VEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGI4-0000000CIAi-07jk;
	Thu, 20 Mar 2025 13:50:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGI2-0000000CIAM-1FxH
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 13:50:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso8017445e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Mar 2025 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742478629; x=1743083429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuPoJfes2OtJ2RBwmkn+k7W/PYQswwEeCRSMmHPYtkM=;
        b=phio/Kin0qeBEtp20obU5qMqONX7uRqOvwQpy8fJPFrZYRkf3YDqV3IbRw8PIV7MCN
         wor+pDsIbJd+X/NKyesojuxnZDRSnwSNfH47LtApfQpWv/oFomQuiiLZwczo670fQsgu
         ZOmxZri+aY1x1n5Y12V53dRbqxoQK75bg64X2i9GFelcMetvGN77btf/xq6ZWvlHB0XB
         ZgrAA5vB1M63Yt7t6nUcKfABeRAkK+Dt0NKKN9dLAELziNzIWo3WRchxOC/0WoS4u51F
         0hzm638Fqgi7bUjbZsn/oz9ry78utjrvfdpxHDZRY7RCg5/OW+5j/lYGZYHl4VDFaTRm
         h0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478629; x=1743083429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuPoJfes2OtJ2RBwmkn+k7W/PYQswwEeCRSMmHPYtkM=;
        b=t8evwt+ANmg3lliL9fuq4W2Fdt29H5xeUW3+k4PhnfMX4gb0moptZUq1pvu5ElclU5
         i6W98Nm6gb985zDBtSGT9qraYD679gBj3ovtmOri+o2WD9PbqDYMQEaum8nvxLhrTNSX
         TNG2uFzkTGYF6mFVGlXdchIFmtEvjuPJUoPzQxkOvmDo9im3OsTD+ExO5YhgJhNDr1+P
         A2XABNRGBj8VA86dQpvjsOP/gQQuaknhkTnSsFTTWwCQ9SAhm7v13A1DTRdA6B3bXdII
         09hm+5ZKWc4szaTjbVQXtWg3b8SmSDbwRx0YqrnjRtGFIgLu9TH6Qwvdlh7xjjVijXQA
         ytXg==
X-Forwarded-Encrypted: i=1; AJvYcCXhX2TYkXyyHwL7TH/agBpUEIr/q+MbC4QYSjnkef1236AQcjZCcvSyc7E4bl9GxzjIwqOLiXMr/90=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHxdRxk6VwuYcoLoo++a5PJOyy2eD8pu9Kn/IUK0dth815LjLo
	0BP6FHltg0V6kibcmN1JBYSb5h69q6NJqMmBl9IJrBaNCcp1wXiGSQWnDkuamE89fIjQWprSPxN
	7sYY=
X-Gm-Gg: ASbGncui0vUfRGHPXavYDZ474B6ASajCVB/Qo8GX8jG6BmBQoZXNeXLEMk1zX4H4xGO
	XdLLxE12SQm0jhmvJtepQstCEU3t0BDuVCkcavYol5MgRIqm93iId+KnbEa5+ywZCjyvu4DO2KZ
	7uCkUH1YJp8CUy5fb0iBGfj71T4kNG4YfS66XQc2HOmKqmfO8Sf52ZFjLaHwSlUYZiiPmfOnckr
	QtktYCBCc0Znd8aj/xbBCej5UaxVH2KhTn/Uq0wcaJLulGMaP7ayIuQXubpvGwzRe305yKqORI+
	SokThn5m1ZAcHmTWOSTrWhL6sXlLVfEloIk9wlOWlfNc+BQtlxEGX7Cot67uilvTPj/G84u6tAg
	9RKzNP+tvniqnzg==
X-Google-Smtp-Source: AGHT+IHqUiP0O9w6v3bEaXNMY8vIoRS85WaGhkOLXmI7IvrJnv/wq3DzqnlZ9QwRdbEFGXaXrcqpRQ==
X-Received: by 2002:a5d:64e7:0:b0:390:e2a3:cb7b with SMTP id ffacd0b85a97d-39973afaca8mr5207870f8f.34.1742478628789;
        Thu, 20 Mar 2025 06:50:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318aa1sm24479712f8f.64.2025.03.20.06.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 06:50:28 -0700 (PDT)
Message-ID: <78fc8b1a-6dfb-44a4-bbec-fe25b1cc4af8@rivosinc.com>
Date: Thu, 20 Mar 2025 14:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v11 8/8] riscv: sbi: Add SSE extension
 tests
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel
 <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-9-cleger@rivosinc.com>
 <20250320-48e2478cb96a804bfb1008e3@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250320-48e2478cb96a804bfb1008e3@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_065030_337024_74885C94 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMC8wMy8yMDI1IDE0OjQ2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gLi4uCj4+ICtjbGVh
bnVwOgo+PiArCXN3aXRjaCAoc3RhdGUpIHsKPj4gKwljYXNlIFNCSV9TU0VfU1RBVEVfRU5BQkxF
RDoKPj4gKwkJcmV0ID0gc2JpX3NzZV9kaXNhYmxlKGV2ZW50X2lkKTsKPj4gKwkJaWYgKHJldC5l
cnJvcikgewo+PiArCQkJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfU1VDQ0VTUywgImRp
c2FibGUgZXZlbnQgMHgleCIsIGV2ZW50X2lkKTsKPj4gKwkJCWJyZWFrOwo+PiArCQl9Cj4+ICsJ
Y2FzZSBTQklfU1NFX1NUQVRFX1JFR0lTVEVSRUQ6Cj4+ICsJCXNiaV9zc2VfdW5yZWdpc3Rlcihl
dmVudF9pZCk7Cj4+ICsJCWlmIChyZXQuZXJyb3IpCj4+ICsJCQlzYmlyZXRfcmVwb3J0X2Vycm9y
KCZyZXQsIFNCSV9TVUNDRVNTLCAidW5yZWdpc3RlciBldmVudCAweCV4IiwgZXZlbnRfaWQpOwo+
PiArCWRlZmF1bHQ6Cj4gCj4gSSBoYWQgdG8gYWRkIGJyZWFrIGhlcmUgdG8gbWFrZSBjbGFuZyBo
YXBweSAoYW5kIHNhbWUgZm9yIHRoZSBvdGhlciB0d28KPiBkZWZhdWx0cyB3aXRob3V0IHN0YXRl
bWVudHMpLgoKT2suIE5vdCBkaXJlY3RseSByZWxhdGVkIGJ1dCBJIGNvdWxkL3Nob3VsZCBoYXZl
IGFkZGVkICIvKiBwYXNzdGhyb3VnaAoqLyIgY29tbWVudHMgb24gdGhlIHR3byBjYXNlcyBhYm92
ZSB0aG91Z2guCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
