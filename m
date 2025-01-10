Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED12E77188
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAdya4ZeL/l3FBA9gZGZQvvQJOimfCnUxUB/vvvuJRE=; b=Ro4SftgNsCboTx
	yK/Igj9XOM9QG4MWLkKIHz3fk5ZPd+WBfss5HSgh7OUgFpKZbKO2Wi3EIObJuZBlRcSBDE3yRowIx
	jPr04sDYaADcPyuCImz1ouyGif1DsxxKjP8An71RqeklezsRX1HEyC0+XED1UHxL4GwilmnDF47jY
	WR5jTFWPtrXYyXJ1bvqEn9Obmke4rd1yL5mD++V/TgYK+wUFWjlDNLNCX7shR1YcDLWUiAuM8+mHy
	lSpLPztS06/g7YKbcjYdeAm8rT3uZXEyi9hybQD2nyUXLFW0s+lewSjLy8gQgdyakNteBAhpSM77L
	nZudWoYWsxtRiW86x2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwr-0000000F4YN-39Ad;
	Fri, 10 Jan 2025 11:13:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwp-0000000F4WL-0IGu
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:13:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3863c36a731so1426642f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 03:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736507581; x=1737112381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGO/tGztorN25vV6GIiTimQzrIDwqi9MKoWBwUHQcbQ=;
        b=Vsl9IfopMk9kBxkr6oTKy4l2a1TsUOnAnM+JQFfsYvWOuffvaI4U1zvSQya60UvD4K
         n0xxl8ddKBQOViVCTFfAniqslBJkA1119ZVfRKIUa11AtUEnOd9rzaAmwZCiajqYlppz
         nydBcdlFOzyKTfktuvX9kBlcZEiLrKk2Nxj8C7pxlOnZKcH8jV21bo/I6RZ5AlrDpev5
         AFGZWynNA2GzrLb4ilCepma7js68FEqBY8hkcGREBHyT9AeNLGV9CWogTVl9tXcqylb8
         xo/rpk0NUNozef3jKHYsObe87SNwedSSKoDhDMhnDjQ6RsfJ3Cj3e4rRCDtBjdm65pzP
         iZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507581; x=1737112381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGO/tGztorN25vV6GIiTimQzrIDwqi9MKoWBwUHQcbQ=;
        b=tcMXhglnaW5iHjLTY476DJ5bLxNKHUVdRmhjAD67IC1XmJsEQO0cR6OgE+twjmL0TL
         ERbGJzQTKB+4WrzCneGpz+0sJIvSueJnpFIMHtHDuka77mNm8OudIi79yOevfnxx0XX/
         N51H9yYTUg+L97glqJMKB0YN1jD1/TLsZU0eWixsLYKAJGudx33ETFb7RkyzqWkNfuPA
         iyWtP9itV+etjQkwpc3vwpOJk47UGLdCWLm5l74SxwgDt/aG5QWqhTaMrUvkNukHzjBD
         onsZEgU0QiOsVBemvaTF/7X3bMTBU7PLbmNwAPl0WsWffiMRriKyWEpzBhSkXg2TKMGd
         FDkA==
X-Forwarded-Encrypted: i=1; AJvYcCXYT0FMQtgiKhh+2dLvXhbEezqkyIid/Ng0Tyf9ghM6YWnYDzz9hx6cIYjLTK1T6gBka+Ox5JCwYk0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm01TDFwR65qtso+fE0i9PbXryQ/f6tzyQSNVc5sF+4V5bm1iR
	K9PTrrswIho0X2f0JYqALUNKOYAibnYXyHIPnORhIFealvXl4J4dPqT7OKgW9IA=
X-Gm-Gg: ASbGncu5TJb20HhwZCDeJbUrzNB/1CsNZx8D4qXv42fBE+Fh8hphw3DlLbi1S69Wg2L
	7UHjBIiwotqO1nTUIZZKwZ+RsjTcDyrp55nbEAvUGP4tv4sg+03c6Y/tfC65iMJLeOi5GcqgU70
	WrcntE7VbPKYGUhLq1z/sIz+U/tk0HlQ2zIx6O1zQlZ57bxh/iz811F1Wb2GbeoemL+LZuO0T5C
	ZtMD1MCrWA4DAMtd6uGkmiEQbGdmxd5nlTlsJ5YLIBF8GYj9Kr/1MgtfA==
X-Google-Smtp-Source: AGHT+IE0cDft+UpOCMXRt5/70nsexkWe906gfO+Ck48Dw11dRtvGO7daCbmwQdosmX2SFZ7qJEVjTQ==
X-Received: by 2002:a05:6000:1a8c:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38a872fc261mr9427844f8f.10.1736507581212;
        Fri, 10 Jan 2025 03:13:01 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm4344459f8f.50.2025.01.10.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:13:00 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v6 1/5] kbuild: allow multiple asm-offsets file to be generated
Date: Fri, 10 Jan 2025 12:12:40 +0100
Message-ID: <20250110111247.2963146-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110111247.2963146-1-cleger@rivosinc.com>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031303_102382_0EC64277 
X-CRM114-Status: UNSURE (   8.15  )
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
