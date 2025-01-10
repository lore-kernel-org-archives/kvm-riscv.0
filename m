Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8583EE7719D
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAdya4ZeL/l3FBA9gZGZQvvQJOimfCnUxUB/vvvuJRE=; b=HVOW8ETMczheQ2
	G4rNaCIxrg5rrasM2BKKaeoK1g6oZOtsfBFse0RM/i3pImQ8hQqPt7WU6oLxKeNqo35BvR5h2vidC
	3VhsqGKtNnn9ZXMwCJ8aiUN+6L79XVEkOdWWMWlRvsEtkbUt5S3QYnk2p7mfjG/wdFUKZhB/sNTbA
	VZncP5b4PzAMsV8rn0W0SetOsRKRIjXUULVqpsKRmbWAZScFIII/SlJJopPYYMTJ/FxK0o0MKStu0
	nWBi5JRnazuCQMxFAsOyVhHKubfdRHTQ1AY62w/gNU2I76AW8nXBkTHWMCaiKNfkarAR/aM+1OAXi
	sx5CyadRW+TfSZ5r8lOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmK-0000000Ebky-1CoT;
	Fri, 10 Jan 2025 08:54:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmI-0000000Ebjd-1T4W
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:54:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4362f61757fso17958515e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736499240; x=1737104040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGO/tGztorN25vV6GIiTimQzrIDwqi9MKoWBwUHQcbQ=;
        b=iJcYKYQhdzXiqaxGaqDEHfpVISr6ZBPufj9gn2RF72AGZgqlFB2xg+LRphyr6WggTZ
         hMaYTmj3HlCBBWkegpuUioUO5AhM2mtQJtNMt+EE6dA4er+fmonEP90NbJI1qoKj84vD
         sJ0TXTEmm/ktslyBQ6Co9gDn2LafYZaZ+KKyAsjDIBs5bUgxKPfJS5fWzsT5v+knxMAA
         dy1DNxhhWtYdmnBIzsT+ElK0+1uXPRwo5U7myCjjjrM+PfITODQ8Sd7Dub5Yil33kCml
         H/2QMZb4v6qCGYT3BK1wa3byGDwMwVp6rl0Gqv6APUVhP3JQlBxgtjRYN+YTxM+il/av
         8L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499240; x=1737104040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGO/tGztorN25vV6GIiTimQzrIDwqi9MKoWBwUHQcbQ=;
        b=CZwrihIjJ11CU5fISFTAlos0Q34SuD6FHn/s3sLkPu1dvyxYcpZWftfsPGo2LHHxHx
         lBmYfvMNLYsWfiZadr3FoSwOOD/OMYwVeAeUg/UnhxcWxgB9NhKKHfodUuXgeI18/xFZ
         OCv/DSKBvCdT0F6xm25cvxAWZn5MqjOGybKclDmWBJVpFiJflC7kZqtud70CZpCBJ1Ga
         TWM8+UCFC1Anuht/s8cQJkyaKu2DRiBqBRFRt4PUHJlJMtJg6gscPOBthsEFyRYqJpj6
         BKrNu3/JyLxfc993NH5EswmQjV3hkCpCwsiKXv/GBUrgT5FBKrABhZNqouHKRt0e/ZhN
         L3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM9BXkKnPXEJSHtr7biY0Q55cR/Enhx2ZWaPlqSuQP2jaXi95LRI6K1wVKJlq40Pirnm/gIrpqrNg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYwwGMkvAjnOj2p1cVXgwEO4Se81/w5XFtc5Ep8jh1OnF/fM1m
	G3dDmhOSuY6zf1i6jo0pA8utHusbhyBprm6m8W2QwneMhnhohEpfsQrQ/HKzvek=
X-Gm-Gg: ASbGnct/U8qrQ+HsikXwxScES7HK3Rdm4BpWxTQoMuax6ZPxz2NAsTLk4f0tt067tVM
	YSWrk1VryX4T8CrXmnZNZGsOiSpsEc1SAG5PqR2tA6vPNxnby3vpWEWkCjCHcstuRtqpfUTenbr
	GsboTgx47oTmp1oujZHDcsa8yFumxraQtPMeGJ7vNOiQp3X6ABThs7r3AH69wII/aiV2F8/UuYd
	T6bETQqw8GdXZeMovP+simWQo/vDsAQg9caN1jSzwW8oOUfqTb3cGWKIg==
X-Google-Smtp-Source: AGHT+IGkFtGyulvVJcE2z0NXyBmacxg5ja+vqmOEfAek+wG41MTpylbPazHJQjxiTwi94Sb+FpX1HA==
X-Received: by 2002:a05:6000:1846:b0:385:fae7:fe50 with SMTP id ffacd0b85a97d-38a8730fc56mr7781270f8f.42.1736499240409;
        Fri, 10 Jan 2025 00:54:00 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm4009283f8f.94.2025.01.10.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:53:59 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v5 1/5] kbuild: allow multiple asm-offsets file to be generated
Date: Fri, 10 Jan 2025 09:51:14 +0100
Message-ID: <20250110085120.2643853-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110085120.2643853-1-cleger@rivosinc.com>
References: <20250110085120.2643853-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_005402_386136_E29E38DA 
X-CRM114-Status: UNSURE (   8.06  )
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
Ci0tIAoyLjQ3LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
