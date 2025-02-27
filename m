Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C051C197BF
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp/0SVg68+uoqpWUr/TbkH8Rbdx2+hR/vR58hOEFPwQ=; b=3OJXqcoyv9OYN8
	YfOh7f/HKwKgTGd0U/+dF1H/RZALCfPwuvn4OZbtNIh0SNc8GxU+66skULy3F/RALocNKoMt+R2F0
	ImnPlNJOt/A4MI3k3LG0DdeQ3+fODTEkFdLdnPsuNiaqVgMkA39D1N+xQk6ey0aBvGZNKs4Mpzv/x
	no8rAHPw2UTWhX17l3iMx9zAfePY08LdaY5rdZE+DJY0EB3OY0a//k2Vpxn8jMdi6RJIkuspHWZIZ
	JJJYhvawj8n51cnd12cO4tltojPs0VFFb7bgTYYeGCzilXBGZvG6OkbkiBbZ75dTSfochlyS1K10L
	SXxleBAvV3zv3zLPafdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh2-00000008TeS-0eBE;
	Thu, 27 Feb 2025 19:37:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf21-00000007lox-10db
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so1975072a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Feb 2025 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740667112; x=1741271912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3f5NEcChmn9ElBRKbSmT8EsB0v93vDiRdEUS8PTPaU=;
        b=lJ55HKVPu/T8Bab1q0/W/J6cKUV/N2smnRlXr7QaRIETbKzLySnm7hAQGugaujMMnV
         8RET7aOpOIzv3xM45RIfAr/FClETX8Ww1Hf3ysqG3FebtPyiv23MDBA1Q1f6Fpc0PNtw
         HstAhA2LyhSdk5M9Gfj3Q13EuZhBumXqp3jACIPHxsqMsPbo6wn6nuEu5u9XOZbUizqg
         tkg5vxwbvOEbHMRYyFb3gR+UROWLNXwSu9oluJKJkIFptTfXf0LpzWXO4+Zr0paP7wPg
         l+h39t8xqqQ5Nab6nGedI3i5KAPRD+1lNRPQUEXNDs4LPwF7ZeSQhfcj+0BumcIDgCAv
         XTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667112; x=1741271912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3f5NEcChmn9ElBRKbSmT8EsB0v93vDiRdEUS8PTPaU=;
        b=otCcAQNh9DywwWhcuZpvkNyM3/x0ULmaRKft1z0zUr71qf1BL3Z65jVSxsRrWlpkhF
         tJDgYGD37nl9uaGmzENlUZFj6QUDG4EqGcCuBnUkld7F+cX46j3Imifv9pWJkF5v06zx
         BFj34uY+MseAJw12wkhSUNmVeG1mkLhygARUIbWVEKQta9OErN4r/Jc2c6JQmxGXUuej
         /ZCTrR+6IIW4qY3rtmSy00WcXy7DRxeTJn9io8iV5IMY9lHTqb56p4xmjP0d+vi7CMFW
         VFjb1sdWElmhJEn5RcKG+2S0E0b8eQmOKN2320RA6GaAE5eaD/HGiat/FJjmmIh7/tos
         thnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpwF473CWhy+J76bjXsyuFVKSqjSLaITzaE7xQ3XIURhyzoxtxdgZv/uQ2yOspP2BexP2HMTSvA4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrdojeMhf0qcxQffCO/1Ty4uuhgvtIBlWCJ/bWu0mgzJhsHVf/
	MP+4D1rZG+e9CES6s/iGyXLepWnuCryRKdlfZyzFYALtL6d79Evyu+b8yyxA8tI=
X-Gm-Gg: ASbGncu87ORUcmQ5pqCxcSzxcLlTOv5SzTXZJQD+IqNXH+68xqlabPcxwF13YytmVjS
	cpyPjjkITujQy9D6dQrKCFN0FkVXKstGfFPN78RVrKfO4l9Oi/5JxQjQBCwk5DaU3I5lUnIAHh4
	b+vCQLZiZu/LlN3MMhbRXSBpKeBTaZLL2rzkHs3SrJZcWnpymWZDkKckCwZOgEyKVYFrimQ12ce
	6qTruJEpkhCWWomavA8SQWWkyHDd49HFJtq4YlgNJYPLFq7v0iO4pH5NRFgX4bJ+ICY2R1f0umE
	NFikuNswf4zxQv8Wusat5Hrf6sIcGwVRpVI1nkEVeejOe9Qvf+tGKe8DCde5aTdPU3zJFKY=
X-Google-Smtp-Source: AGHT+IGMOCMoXUnSk/QlZzZN7AegQ9CVjczSYDwTBsVHk7qFT5BT9LURmy4ScWu9aAkPZxAEFBYIDw==
X-Received: by 2002:a17:90b:2590:b0:2fa:d95:4501 with SMTP id 98e67ed59e1d1-2fe68ae7111mr21091874a91.18.1740667111020;
        Thu, 27 Feb 2025 06:38:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6ded68ebsm4199103a91.1.2025.02.27.06.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:38:30 -0800 (PST)
Message-ID: <671eca7f-5301-44cd-b356-75e1cbc5a3b0@rivosinc.com>
Date: Thu, 27 Feb 2025 15:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 05/11] riscv: sbi: Improve susp expected
 error output
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250227141946.91604-13-andrew.jones@linux.dev>
 <20250227141946.91604-18-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250227141946.91604-18-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_063833_294290_46AE409F 
X-CRM114-Status: GOOD (  13.18  )
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

CgpPbiAyNy8wMi8yMDI1IDE1OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gSW1wcm92ZSB0aGUg
b3V0cHV0IG9mIGV4cGVjdGVkIGVycm9yIHRlc3RzLiBXZSBkb24ndCB1c2UKPiBzYmlyZXRfcmVw
b3J0X2Vycm9yKCkgYmVjYXVzZSB3ZSdyZSBub3QgcGFzc2luZyBpbiBhbiBTQklfRVJSXyoKPiBu
YW1lIHRvIHN0cmluZ2lmeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJl
dy5qb25lc0BsaW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS5jIHwgNSArKy0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9yaXNjdi9zYmkuYyBiL3Jpc2N2L3NiaS5jCj4gaW5kZXggZGQ1Y2I2ZmEyNmJmLi5jZWVi
MGQ4ZDI3NzkgMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLmMKPiArKysgYi9yaXNjdi9zYmkuYwo+
IEBAIC0xNDMzLDkgKzE0MzMsOCBAQCBzdGF0aWMgdm9pZCBjaGVja19zdXNwKHZvaWQpCj4gIAkJ
CX0gZWxzZSBpZiAoIXBhcmFtcy5yZXR1cm5zKSB7Cj4gIAkJCQlyZXBvcnRfZmFpbCgidW5leHBl
Y3RlZCByZXR1cm4gd2l0aCBlcnJvcjogJWxkLCB2YWx1ZTogJWxkIiwgcmV0LmVycm9yLCByZXQu
dmFsdWUpOwo+ICAJCQl9IGVsc2Ugewo+IC0JCQkJcmVwb3J0KHJldC5lcnJvciA9PSBwYXJhbXMu
cmV0LmVycm9yLCAiZXhwZWN0ZWQgc2JpLmVycm9yIik7Cj4gLQkJCQlpZiAocmV0LmVycm9yICE9
IHBhcmFtcy5yZXQuZXJyb3IpCj4gLQkJCQkJcmVwb3J0X2luZm8oImV4cGVjdGVkIGVycm9yICVs
ZCwgcmVjZWl2ZWQgJWxkIiwgcGFyYW1zLnJldC5lcnJvciwgcmV0LmVycm9yKTsKPiArCQkJCWlm
ICghcmVwb3J0KHJldC5lcnJvciA9PSBwYXJhbXMucmV0LmVycm9yLCAiZ290IGV4cGVjdGVkIHNi
aS5lcnJvciAoJWxkKSIsIHBhcmFtcy5yZXQuZXJyb3IpKQo+ICsJCQkJCXJlcG9ydF9pbmZvKCJl
eHBlY3RlZCBzYmkuZXJyb3IgJWxkLCByZWNlaXZlZCAlbGQiLCBwYXJhbXMucmV0LmVycm9yLCBy
ZXQuZXJyb3IpOwo+ICAJCQl9Cj4gIAo+ICAJCQlyZXBvcnRfcHJlZml4X3BvcCgpOwoKSGkgQW5k
cmV3LAoKTEdUTSwKClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
