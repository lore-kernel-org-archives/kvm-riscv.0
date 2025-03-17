Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC24C35FF9
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzgeA5bNX24egiZBdxcAvs/ZiRJ7RS/jj2JDc82yDX8=; b=JmQDJfoBy78epU
	k35da2fk/quEzfiRukjLHayEpcJklSET5KqppqDkFHz9+usSp+uBSQDWuLT0ghA5mu5aoU9yUIDnL
	efeIHd9g45KqaNU7U6fSaChmaxgJ2oFP6vcfzxVwUxmqO05l/6niiJ8CstbJAEFytG4QoP0q6ryMB
	huRxU7cGn1uALL9luql7fKUYwr8+XY9NPdWMSeoxi6j2XzjQSM8m0HAZdc7MZFbNiYIndIu0FZcZT
	HqPxuVG13GRxsnoX0NmQ3hmE+6aV/MXp/Vb5vsk96EB0jb34+Vr47Fbetsl/p6BcpZuarxXCKaGiO
	bb88vV0r4+xTc0holiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gE-000000028uu-2hxw;
	Mon, 17 Mar 2025 10:26:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zs-000000026xu-3JmT
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-399672634beso276533f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206811; x=1742811611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=qCtNd/DJm8+E4LhVTdhxCkNU1xssCN10ylCrh6G/DMDENt7PMvUKkLHAfpT4dpobrS
         EAClPSzYoRmdA/h3tmRcg22VQrB1YE3jB3dx4vJP2mAjZw6yAZVuSzajMyWVu9necN2l
         zvU8Z+aYMWA2KU6rQ5bWNDNMyuvrFKukgzLCcD4z7zbOVNlgl+LmrNeUhxR5wV2zAmWp
         wIaiCln3bsdXfJVLMqHnKtb+qnB0HRAuyEW2Yd2PL8tb+s4aZH99Goq6U16hh38RS8tu
         +N2H4r7B82Nq0vqhfoj0xsKHdtprcf18t1UKeeIovPLuTtm/zfWjHfZgGKmZ87whMrmL
         kXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206811; x=1742811611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=cyvroyewp9TzGhfRMpCbd5DBP6zYZ5mjqaaRzNfWE83rNpQxo9sKbRSakZSu+4UkyR
         t79v0oAOymxeQ12K61EaQFkWfJu13cXGDSDFuqqZbS9kWs6aTWclk6f38AVHsq51iHzy
         YFZLAiP68NyonlmYnfpRfa7V46mtSvueneS9GDVEPe9XRrsIUlqKL96R69Z5A3LQQGKZ
         ycz4NRwspoaLW1js0gh+VOc8X3BZhZRcjx5ybywhmoLhXy5SDxVi99j21C4J2EoNgGbe
         4FvaO7FTwceQT4QZPhUUykfuEpb3wqI6ZvSRVHXbpcQSmbS40UKFi5yA+w3mvtY2cVFG
         0iUw==
X-Forwarded-Encrypted: i=1; AJvYcCUmAlkDXH0oG2fHh1D7Jxh7uqG4jA4Y8MNMMCSJgqVVONFeWNhoe0n8QaKf4MG1xJPCAPWq2TozBYg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+FxP9QbCoIsw51xuVMi7mLDVuU8ofF+y6fJ+DfJ+u9S6aociP
	zD/Xk3VTP3cxbNx2maBKSiGN7ZhZYCud2E+SApAlA+S4CA6ucHTF+seuESr7B+fytNyAZomGmjF
	pc3M=
X-Gm-Gg: ASbGncuYpK23ICWLLDor9GF5jQqEUBtnUxxrbmC9XapzEUyF8sOPI3BaXSUwDCZCqCW
	7OiqGWJkTgnLVqrvNwRy2AnX4uzIba1COhnr0HHh4JjKGswaqwCZrEPX/Co2HCawZRmAnyIoBvn
	10NOOprLV7vneqNpewowXqCI35z+pHjD6TsRz9KE3qTKPg9dv4KY6XPBfPFLVXQCsgorDjfZCmM
	Iw/5LNuWk5Y0DDk8JZX03qXW6405o2ouJLrMbgQUSUbJp8y7bO3LB9/aNZNRmnP9X9UiYURAGPX
	K1DZEPyjZv4kSg4x7CXz0CGX7LN+ZasrIgncXFh6TD7qdw==
X-Google-Smtp-Source: AGHT+IGDY43fIbNPI+eDp6uGNSAHL24CsaAqA3U9H4YEe3hgki36AbrGX2ncH3+N9QFzno7weniSDQ==
X-Received: by 2002:a05:6000:1acd:b0:38d:b8fd:591f with SMTP id ffacd0b85a97d-395b70b7a80mr13350336f8f.5.1742206811108;
        Mon, 17 Mar 2025 03:20:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v10 1/8] kbuild: Allow multiple asm-offsets file to be generated
Date: Mon, 17 Mar 2025 11:19:47 +0100
Message-ID: <20250317101956.526834-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317101956.526834-1-cleger@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032012_824506_1BE78531 
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
