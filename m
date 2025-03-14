Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC071C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzgeA5bNX24egiZBdxcAvs/ZiRJ7RS/jj2JDc82yDX8=; b=CKlgjREhO3IAQC
	d+RuaXGCo7tPX+REnrItLW6fBmA2E9nriIzwPwXh1UGUuor0wCy2bxhMFRG8SNcNMU3Ixpx2n9D81
	plY7/pMm2uN+uhn7AQzwii8Dk3An8r9Birf9hb0lL5whNh7yC3yEoFI7F8mPHPDpRToeMaWXQYv6Y
	HsLge3z+8QphBf029PTtUcICSrGbFAg05iN5N5t8Sfwy2sE655H9oWL8MHEk7zSt8xGfoFN4aVNap
	nzlzFj09jQGh7r+idMAUZjz3/7dSpfaEGbdiY17V46ROYJIMhBXZ30Hbkb/Gl2F28z/5kzneVxOOQ
	ZsUIwhX4rPhKEkU1NncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2xr-0000000Dxwi-2CWI;
	Fri, 14 Mar 2025 11:12:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2w2-0000000DxSy-2Zxj
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:10:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1261359f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741950637; x=1742555437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=uKvqJaY2GtVQsavjRbfHfo8X4aJ8hPJfU71swMR0ILUHl/SpJjY9NTF+lgxtWpp1Xc
         Vbk4ffXe86nWbgxXkg4TFzPf1FrwpofK7l1YuUJREB7SXhQb9NWHlO/6x9YKT4FgLD0y
         ui+4FhqV752mTx7pDNvQdrO1eDtBC45vu0roIsOxzLsII/1Pq6YreENDIGkUGDfRW/OY
         VqSaLNmfN3zC0x2/1m89RZrEeckBW0zdTXp6HoV0MVuZrH7N4u0R1FRYH6N9FxHQuwiv
         nEC4AJ6OtdzuHgmKoxFvvcde67KFrdL9lkbeCIj0uWG7H/XgtGUGTVl58japbwyBzFKe
         HfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950637; x=1742555437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=TkmFkZeIuiP0MMeos93xkd+1XWCVY74OKibD1kMLeHVcsS5N+9Keba81o3i/td6WWN
         gK1xWKsCMJhZkTOUmoKXUqQHuodxqItjpv8q1WAazkG+DjVdbQeZKSeinVMBwQlkec1M
         nN8YCIwJGbUj3++cEZgm5Pujmy4dZ0b5bB5OWbI4Vpn21bVsD5dxVHonLpFjYm8pXoFW
         5bTr6YJLBdesR2vp/i1LD1RZ5AswBRmU1uTJX514naXXt5SuQuw3rT3toE3EcExmc/36
         /fEZy8qWUqPWo048uYqmKvieFqtmuwT2UZrrkkAcppBDDGotJvBSZJ/fIehjzsULQ2Hy
         nrkw==
X-Forwarded-Encrypted: i=1; AJvYcCXRO2d6VCJGuKnYpyA0qVgrKSPDg3qL7KEBmSMDK7Pt+sAvKiISaP6XiHz+V7gCVHk8RotN9KXuSyw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkLWogdf0/lqFgMja00aQIFGX+748+jHmZuPz7R1W3HkYubSv9
	fuYav3GRAY5TplUELM8KAjqXQ+xr0Dw6IL5xM+Np2QFjll/QDRLZnnLD+Qv6J4M=
X-Gm-Gg: ASbGncvnMMfQR/aR+ZtVdtbwuxv1wwgQkW7I6iUmBV+p0mZqHdSCXLu6Kfe/w0cQtlg
	uATy2i6cWPHWC83OWgvbHeS5hqkEjankeSA9an37DNS0TGEDdI+ocIQSH6oKCbjkhgCvwXtZTIZ
	Kv/2xzktPo9fUKGUrgRm06O/r1WPOaL2gN8JOW84XAu3GqKPFrhoUrF/f0vITbkPE+LO6yxhuMx
	oLAmf2MOGRTfV/ftvNqIl+cbk5XQ8Tho6ccnGxKY5aJWtXtQuWEzrhGF+bxjj5bIkRRSdBofmbb
	8j/huxwmnrDH655IdnEjiopzkbvBzR2vkrtAZqovmBiP1A==
X-Google-Smtp-Source: AGHT+IFiA0hkUJPg6bO/qu3cGjt/6OITQY7GCDIoNVDviqYslOtokCwJ1H0VZcDwraWVxmXqvXyLTQ==
X-Received: by 2002:a05:6000:4009:b0:391:2e58:f085 with SMTP id ffacd0b85a97d-3971fdc2557mr2581473f8f.54.1741950636951;
        Fri, 14 Mar 2025 04:10:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb3188e8sm5299203f8f.65.2025.03.14.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:10:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v9 1/6] kbuild: Allow multiple asm-offsets file to be generated
Date: Fri, 14 Mar 2025 12:10:24 +0100
Message-ID: <20250314111030.3728671-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314111030.3728671-1-cleger@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041038_653412_BBD65DB6 
X-CRM114-Status: UNSURE (   7.24  )
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
