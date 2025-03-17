Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3065C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzgeA5bNX24egiZBdxcAvs/ZiRJ7RS/jj2JDc82yDX8=; b=EkhjWVfBUR8zWs
	5QU2aAOj0Z069AUQhZ+Uv2wR5/+d3PguidAW/jH6A1ZrI1JGIcJWI8RPV4vmXSy9djwNLD1n4QvLv
	eKMJ0W+YIKzHGOO28dtnc4lwLMYtohH1+Jd2rBKGwrbNOzukkut9RICm03Kbu3O1XyTGr+kgPvlDE
	JeWY7vvYfRxQxMM0SLjWJLYM7CBSGSNZDcWAla4Us6+8atOYvm6miv4hTqgiLdbj3RqN9eKrmOVRn
	UsKEbgtgIUB+DZifoyl0xx7uWJdHoUCD7w72Ejr3yDyTpfEpD0DHzwzm4n9BPOHnPaBljyqxUmZcL
	wxTkB0tDb9UXVqG34FTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDep-00000003Owa-1eCA;
	Mon, 17 Mar 2025 16:49:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDem-00000003Oui-45bO
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-390cf7458f5so4084228f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230180; x=1742834980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=WAKOHeePBy+hDEPZ+Hyg72VsVrMIofehSd4ZsN/HUCHOXueqCU1aQ9i4j6sWEpUYg9
         HzGGtwX+m5+mVz2q50GUdkxO9jl6yi7SI1cOkFa+z04B6pmnCLhQlSJbjJ5hYG5hMpB+
         kWaVwGNn5D8gehszuxcttpMhspT+3Dlpg5x+8gnKMnl3vjHNqpmif/5E+ZGKcIPaDxMr
         8TEG1HBJkjZu/JiWVr7d72yLudjezE4dKuchl8dJgGu1x+mf4til9+DWBWGVqud+Z3DM
         8HFWr6p47DnicQaaCmBqyNGSuQr0ajphXbvIfg/enPzcXiIXicd7LpYI8SP/v523xnvh
         NJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230180; x=1742834980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=NweUmQDBcA4fV4JrlTrzme+rHbwVO76PYIa28KtDv9oy8ouraTtK4sfg18K86xP1UV
         +J45kEws8n2Eke05OL/PhPRR28bCe/5YjpwkLn+qtHqMnlG1ptCOqnotZN3kPKdvuMVf
         v0zV3PkmN5CJ1y69n6uFQ/Yx/kDrMy9jewOrabedfFAJNudoohVxF0QJRyfzbKIQ9xnI
         7HD3V5MJBJoIdtX826qVgX8XDyBkglkt4DeX7SUpuD4i4JMBpFyG92+HI0/F5KcEPoz9
         Kt6rOn4YsgmI05qLTwouA+OKrkrkEkOU43RiIa8JlMwCBjgI0C6VF3D9iCMy321Z5Drp
         8F7g==
X-Forwarded-Encrypted: i=1; AJvYcCXxJhBicpvLNMG2dqM7ZD/1ZNAcu74auNSRm9jAm1mNudc2YHfKZ7OO1xx1bI6PKm+vyJLEYhIKuTI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQqkDSyGplByF3P7YfUDO3PmvtMRKVHNxFf/ndRLLNOXtYC6RW
	pUe4owZKGqAF7kkBVWR01rQavtoxAartPezZo5C+AyKhvMjS/8b4rrab0YT8KJQ=
X-Gm-Gg: ASbGncuJiLX7BE8dM2kjbbLKLU2mnb6FA2JY8qxE1pq2aDOEYPL0qx2xwH7heWFxIcc
	jZeT97/pw5DmA1oNs2A+pqIy7cysW+1XvelD7IJs9udSCCOol0ItmCGopirQ9nkTxcP+jvza62f
	OG2/NAnF25oC/bWKKUVNK6VLW+7fGz2Z+KwQA8+ayoonEWcRLQYRNHNAzRfm+0EC/sVs7m+Qrs5
	b47wQ5lS3Olq8ViRa0LcwvNVtIyeA0NNQeAhrFwz2foOpWbUyznHIx4WHhVQRVYNdhbnfAUygOG
	GYYbiNie5qiumEbgYqt0NKokPUPccEBCKqUwcR8pAiUWlw==
X-Google-Smtp-Source: AGHT+IH/VRE0oqk+nF5fXh0d0y+OONDrtl+KSoDNKtWQp2exkgcdQUoZGpioJPiZ0qy6WGCtswBo5g==
X-Received: by 2002:a5d:6d8a:0:b0:391:255a:748b with SMTP id ffacd0b85a97d-397202a1884mr17614367f8f.39.1742230179415;
        Mon, 17 Mar 2025 09:49:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v11 1/8] kbuild: Allow multiple asm-offsets file to be generated
Date: Mon, 17 Mar 2025 17:46:46 +0100
Message-ID: <20250317164655.1120015-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094941_008154_EDFA66F2 
X-CRM114-Status: UNSURE (   7.12  )
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

SW4gb3JkZXIgdG8gYWxsb3cgbXVsdGlwbGUgYXNtLW9mZnNldHMgZmlsZXMgdG8gZ2VuZXJhdGVk
IHRoZSBpbmNsdWRlCmd1YXJkIG5lZWQgdG8gYmUgZGlmZmVyZW50IGJldHdlZW4gdGhlc2UgZmls
ZS4gQWRkIGEgYXNtX29mZnNldF9uYW1lCm1ha2VmaWxlIG1hY3JvIHRvIG9idGFpbiBhbiB1cHBl
cmNhc2UgbmFtZSBtYXRjaGluZyB0aGUgb3JpZ2luYWwgYXNtCm9mZnNldHMgZmlsZS4KClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQGxpbnV4LmRldj4KLS0tCiBzY3JpcHRzL2Fz
bS1vZmZzZXRzLm1hayB8IDIyICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMv
YXNtLW9mZnNldHMubWFrIGIvc2NyaXB0cy9hc20tb2Zmc2V0cy5tYWsKaW5kZXggN2I2NDE2MmQu
LmE1ZmRiZjVkIDEwMDY0NAotLS0gYS9zY3JpcHRzL2FzbS1vZmZzZXRzLm1haworKysgYi9zY3Jp
cHRzL2FzbS1vZmZzZXRzLm1hawpAQCAtMTUsMTAgKzE1LDE0IEBAIGRlZmluZSBzZWQteQogCXM6
LT46OjsgcDt9JwogZW5kZWYKIAorZGVmaW5lIGFzbV9vZmZzZXRfbmFtZQorCSQoc2hlbGwgZWNo
byAkKG5vdGRpciAkKDEpKSB8IHRyIFs6bG93ZXI6XS0gWzp1cHBlcjpdXykKK2VuZGVmCisKIGRl
ZmluZSBtYWtlX2FzbV9vZmZzZXRzCiAJKHNldCAtZTsgXAotCSBlY2hvICIjaWZuZGVmIF9fQVNN
X09GRlNFVFNfSF9fIjsgXAotCSBlY2hvICIjZGVmaW5lIF9fQVNNX09GRlNFVFNfSF9fIjsgXAor
CSBlY2hvICIjaWZuZGVmIF9fJChzdHJpcCAkKGFzbV9vZmZzZXRfbmFtZSkpX0hfXyI7IFwKKwkg
ZWNobyAiI2RlZmluZSBfXyQoc3RyaXAgJChhc21fb2Zmc2V0X25hbWUpKV9IX18iOyBcCiAJIGVj
aG8gIi8qIjsgXAogCSBlY2hvICIgKiBHZW5lcmF0ZWQgZmlsZS4gRE8gTk9UIE1PRElGWS4iOyBc
CiAJIGVjaG8gIiAqIjsgXApAQCAtMjksMTIgKzMzLDE2IEBAIGRlZmluZSBtYWtlX2FzbV9vZmZz
ZXRzCiAJIGVjaG8gIiNlbmRpZiIgKSA+ICRACiBlbmRlZgogCi0kKGFzbS1vZmZzZXRzOi5oPS5z
KTogJChhc20tb2Zmc2V0czouaD0uYykKLQkkKENDKSAkKENGTEFHUykgLWZ2ZXJib3NlLWFzbSAt
UyAtbyAkQCAkPAorZGVmaW5lIGdlbl9hc21fb2Zmc2V0c19ydWxlcworJCgxKS5zOiAkKDEpLmMK
KwkkKENDKSAkKENGTEFHUykgLWZ2ZXJib3NlLWFzbSAtUyAtbyAkJEAgJCQ8CisKKyQoMSkuaDog
JCgxKS5zCisJJCQoY2FsbCBtYWtlX2FzbV9vZmZzZXRzLCQoMSkpCisJY3AgLWYgJCRAIGxpYi9n
ZW5lcmF0ZWQvCitlbmRlZgogCi0kKGFzbS1vZmZzZXRzKTogJChhc20tb2Zmc2V0czouaD0ucykK
LQkkKGNhbGwgbWFrZV9hc21fb2Zmc2V0cykKLQljcCAtZiAkKGFzbS1vZmZzZXRzKSBsaWIvZ2Vu
ZXJhdGVkLworJChmb3JlYWNoIG8sJChhc20tb2Zmc2V0cyksJChldmFsICQoY2FsbCBnZW5fYXNt
X29mZnNldHNfcnVsZXMsICQobzouaD0pKSkpCiAKIE9CSkRJUlMgKz0gbGliL2dlbmVyYXRlZAog
Ci0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
