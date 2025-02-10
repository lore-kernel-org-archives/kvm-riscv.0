Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B4CC02198
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtjzK0TetQNWN3qDSOT2YMNGomhI8HwSYmJt1mgyReM=; b=hHwJy0y0ej812a
	y/zvM0e2q4bhQgUVv6uWTxwOvydsYHsZuZrRYDZDPKamXu1XWH9RBPP4qplSQgaa+2f87i/CXx5SV
	+hN9CclhCVtKlyFhxCKDYWhdUn7o6LLd8/94V4a3Qu0iK9/ZeR41dyuO141+oCe2luLcm7sOg5dgG
	BmHUJxqUbjHlH6+tvQx82jVnO7vi1RJA3vpo6wp6ytdOdVY+bjOv04WbbPWdW8tZ2iXOAWHHodhQn
	9iausgVmZW+akV424QkoMjUlcbafCRxk1Raw2L1No7vZI3A8RCJyauHRSfcKiym97UAcXf/m1HkxY
	dMX+RNYxZtP/UUP+gXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd1-00000001u4R-3TF8;
	Mon, 10 Feb 2025 23:55:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS3-00000001VUF-0seq
	for kvm-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=; b=p7l7bhXBBVpnDDOlVDkZZAeCNv
	ol/nV9NTkrbqRnG/ATgk1n1y4ztywwzpfCRVbrpzBL48kDEf1bkxsxdDneE/c6ZuCm3OHyqBPQbPc
	shf4yii1Q7sumutw0sfRnSPkPgojny+cteaotfRRXuQtvcfDHEYRZYyV4P3T982lhTMzkiA1QecYy
	6iL0dZBRyUjxXUQhMc+FYvgEicCkcxhFgXNNXaP82Wpua75dEKfCzFzVuky5GvOTgFAjIusLIZAUs
	PGDMiQ8nEKDfVqG4wXhnspXRZuxOTWrWV/dvL/Lf7DXopk7t9hprvtkT1W5fmFmbpHkMxsvrXvF8v
	VHbFLDhw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRr-00000000I9N-13Db
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1442365f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223369; x=1739828169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=yckjVFBaDxPvJECVvBCYNXrF+7XfZ8qQoP8JjI9lmxtcpCqkx4anjf0XQEW4+0TkPk
         fHnGvEQSnnKvaNsHPegOPxMM8xns0drnkfKiDXo0WasF0yHVIgZ15YLwJ+4suKRv8DP6
         3Y5aLYX1THLKFzUrfrw4MjU286aara8qAFm4T/z9tf6j9ykrO7O3TE0pPRn+PbK0qICh
         u0tK869mlb8j7JCPrclwZY5Xs9qLitwUlyn+JKVFGkBpC1GMHURnGBFJf9c9z+hsUvHj
         qxFOHm8pxGnfwjXHqxRZFsXZrp5ocMI3eBR+Z4MpafyiqyUgsm/ULu6IThNCFtzVlcOL
         ngHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223369; x=1739828169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=YuLSY2OvYnGhEhtRAcVSqHtp2RLa5VOX+LAkJqJk0L+WFKs9LM1RSJIjjzgMUd3fRo
         j0Yd9on1edbPDHX4xVRdBMHPX6qFiPz+Gs4OcwFQU3DM9u2oG/TD2Eer1faALNkm+4Dr
         9GGkLy5UBcFWICAoypvKLAA6SX+B52rELp+2wso8lo7977F7sxVYG88MTdaha9p12t3J
         LkjHeFyanVuKeWfbWwxZpOr6UeAABGjH8u590/XeYe7Q+jVQRgqBhqE7UL98ggvNQjuE
         86uGoGx/6CH8yD9J+Co/KIcBE0nGIQfMWlcG7Dt975OXRjboKkWkDoTzCVo1CSgzIe1l
         DFog==
X-Forwarded-Encrypted: i=1; AJvYcCVkUiaYK7Z9OS33uxuqif4u6QGuEGDiLUbuQNyIYF9rYK4TX4ccLZlFdSw3NZK9Reult1c1b9tihb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKUbjOvI/TLeIK6SkGYjzuR9vdHjKXRtI5Ui/FgOP1AtHX7eVQ
	0nCD1Bviey5hw1sbkAR3ZJaHZvJeBs832Wz5zepngRhTwz5lZr1zeppNYo2oSos=
X-Gm-Gg: ASbGncvw7rbF3Igfa+qBPBpecExsSoDeNnqXSxhAJViLTTJmWWiDYBDUHH4Ages6Vxh
	OkbMtWwxHDXtyBAz8WTFF2Rx4qdQJytinQLmkq9yCE21iiZmCnr62HrfyCbGS4EOIc3LphA1H77
	uSNHq3i1AIjDIqUpyFovDj7Agbfr5dxl8Qta27tg+gOrU+4x0B0vYGr5Q/kjHvOm6bGZ5mw2wcC
	HIhSaxTdoh5UTkTQOhKJOFTmiRZgEplut6Qni+8rQCvJJz2O39mu7j1m+NWGoIWb5MItvgLEHeJ
	G8w1ITuKtwY1RaRi
X-Google-Smtp-Source: AGHT+IEE/P9vsQR8DRZBtCxEbVJartmy037BYwcdFf30+Y++Re0XNH996Xl3DeOOL//RGxNKuAEJ9g==
X-Received: by 2002:a05:6000:1562:b0:38d:da11:df3c with SMTP id ffacd0b85a97d-38dda11e134mr7050032f8f.48.1739223368915;
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 04/15] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Feb 2025 22:35:37 +0100
Message-ID: <20250210213549.1867704-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213615_957726_5F021784 
X-CRM114-Status: GOOD (  10.51  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwppbmRleCBlYjkxNTdlM2FmNzMuLjU3ZGVkN2U3NGRkOCAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlw
ZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRk
cik7CiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUworI2lmZGVm
IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAogCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFU
RUQ7CiAjZW5kaWYKIAotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
