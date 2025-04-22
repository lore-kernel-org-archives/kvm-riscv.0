Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C61C369C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT76kmqGStv8V1wy1ldFZfA9uiMb5sSkOfj1+Ihx7QI=; b=vlz3MuEoy1cIBtHAEDG7ovQCAW
	rlr+k5jfqKDJZuyISldoQXWXsVwroV8tVNsk905JcfJrW/xc36KlN5eLyRg6UcsuX8il4WL3HOFT2
	qPDj1sY9e2Y5FTorPwDDB2ad+6xHKJ2rpUD3YLbYZS3sKs3FVW0K7SSrZEGdZ0ELBXyGTF1S1a4Tw
	tAAkNWwQgZ9FEGIclhucCrr8aMWPoo+t2HgPU2Jto64xRBOHpWxulkLyk5S3dzHWh63MRSOihECML
	g2SQw4tJ+IItOZLAjnWJ2dzRCnPAr6Zs7AeTwlALy7ttaOaARBgrMfn9JsxEbnZKXcHGWtIffJ2V8
	67k5yvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BPg-00000006s2a-0KZd;
	Tue, 22 Apr 2025 11:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aju-00000006jDr-2U6Q
	for kvm-riscv@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=; b=estGReGCL1N4Abde2jMO8kYwny
	TBVTPQ3Bh+Bt4lpm+aKWsCevNucmqjT5ABVHThQAuCMXLzNHQZh7WI2ViNl209RW5mMwu/yciEBPl
	nDqlmcVMzBaVqO1RVWP+U0iumOseQPFzt0XdOH6RFTXAWrxuW/HW5f58LRC15UYJCrff96nGd/joY
	oALv3q2C2439xpM9HOSUO0zcPo1pu52DFyfi4yzf6dmaf3zE22xDy5HBrvpcSe4D51DsflTgBv+vY
	Jm6NTpyoYctIxxLtBcxcIg/7JyREK1L085kqRtPz01cXaxWDVMXIOK63Ne9J/z8RcLI96a0PNr6Ht
	iQTIxU0A==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Ajr-0000000BB0W-0jG1
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:20:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso4812088f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 22 Apr 2025 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317224; x=1745922024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=SgKiGlKZgyVOJyFTdOri8lQV1cdLohtitj0EpPDTsWx8VnBnS5d4tIwVpkhZQxhUCH
         dyIjxCSd6gUirbcOqgjEmZBBLRHj3yOMLpM1j7Bp+uGrabL7jr3lgH71bVN/DLCRE4vy
         hyaqgYNiuOLpotxrmsivCeCHwHRdiJrqf6dX02qY92HPtjr6pj4iSqg05uy3lLJhne85
         mpGzt7bjXU5xIXNJfbwwzX3PbsJc/roKPV7HtECp9DTT+J/0wZ3sTIOcufzi/DYvGI5O
         CxdbMNxWc8zXGqGmwHOwPOiG+CIHtT8E0EPiIkNWOEgOpOpBQnRvC552LSGhOnjnToGN
         Hs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317224; x=1745922024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=VzgBdyv8I58Ih03dPf0c2rsBnNcYtTh+2jPL2Ks+duFdI68W7+9SUp4YgMX9x0zly5
         Gxgwb4bP3q1m4xdooBGjDwt9nKjW63oK3WI7fAwqjLS774fIk7b34jIhIQ/0C+UGPbUh
         SSak6pEbpVDp+Zf5Kf+G9ZDvouJrEDB93QolYJYt6Uz5RDj4tUaFznzcpv9mmrfPEywX
         uzb78HdrcLJxvCeZgk1arGCGCiXRmao41RNJKJHf+XexUMVSD9SX4qTT1Ndwif3Z7HgS
         kC++ZyaRZdcPS+zx9GKWD64JKbl4KAEsXaPh6UQN8JtczGn5rQdvDUg+n70Mgtcy7VPI
         qJRw==
X-Forwarded-Encrypted: i=1; AJvYcCUExZqWvIetH9DYCC1wLMwL7p5ZSovGLCjuwWi282bxAKcgH2BdwZnPOLN7FGu63AA55TsPjEurqoM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq01zxfj8vFne6WQ7yogJV6OOvu2Y+QQ0VdXdabul6puo0Vavq
	fWKGvAbqFFfGMddhD1SinYDYxkqO0KLUSyAoMTJKPa+xogc4w2vdzdwbP+vsolw=
X-Gm-Gg: ASbGncsrYLpOSKrJ2DJy7Kq1IR97FRyugsoIMmpXXOTeZLB3JUrMQ0qLcesTAIPRnhB
	lrwNfQ0kA3SSSAFDh5aJM5b8uim54noQcSytivlNN0WXV4TQYMRju9vX+NVbVqzYhZMYIgF8wkr
	O5OFUfTqg1ZzLGW/0IrpGsIfR1DwyoUk/2nCF4UPAnPINaOQXu1wEnjgyNOjKXk2MzweMxuiSJJ
	6h6yRzpEvHgdTViyp/DRUYv0BFUywB/JWljgN5iUmMKN8osRmSY+/h1gZwEaA7Tt4nV+4sWiyro
	PF5DzmsyOrCnM9Z/dZmFOnvjK+zh9/3Bm5ZY1ybp/sgWDwOFOO3gBzJnLZb76E3nq08ophoXjAQ
	tCK0zV61L
X-Google-Smtp-Source: AGHT+IExxiC1/7BEDxlUOLO/mtxEuxbqvG4oZX6ER4Jw2XdzzKvzbDTjBvuvcHjBv9h1dlP2oFw8qQ==
X-Received: by 2002:a5d:6d88:0:b0:39a:d20b:5c14 with SMTP id ffacd0b85a97d-39efbad3217mr11799503f8f.36.1745317224351;
        Tue, 22 Apr 2025 03:20:24 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acc5dsm171044195e9.9.2025.04.22.03.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:20:23 -0700 (PDT)
Message-ID: <fff7f6f1-8fb6-4ff9-8f13-cf0e2a9ecb1a@linaro.org>
Date: Tue, 22 Apr 2025 12:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_112027_348150_70FAEE78 
X-CRM114-Status: UNSURE (   7.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gMjIvNC8yNSAxMDoyNSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IFNpbXBseSBmaXggYSB0
eXBvLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
