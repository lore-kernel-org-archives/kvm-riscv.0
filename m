Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203B5C19F32
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzgeA5bNX24egiZBdxcAvs/ZiRJ7RS/jj2JDc82yDX8=; b=ogZtLzWrnjTuM5
	kioAs9wgkskNgXkM23TUIJCinTzW2aeXtIFdMpUUVTcmGBVXxG9m0a0BsM5iCIzxF+aB0KfJ88t9x
	nb55JdLuKlsV9INBKoPhWw6uJyrkybojvOVoElT4xQpYEpsp3hV1l7JfdXZjoir0GCvfqiLW9fls4
	5/uqynlHNvnnscMO10p6WruAeeASTBWtyp51S2QDV1AZWwIAMjDZQldiNGDzRi4+lSuZ2pa94eURJ
	CDDTyym/fRi5d1ft4/RM2owOYmbXUEZOynZ4KdkKdsSVK1XiCu4SadgSEK/4ysgNRgtjWDrfQTQL6
	dU2ToLYdOSBTD7u/XiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaNH-0000000ErIK-2yBz;
	Fri, 07 Mar 2025 16:16:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaMc-0000000Er2e-0PoO
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 16:15:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so17486125e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 08:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741364152; x=1741968952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=Et3YtxsRnLbctGoKXp9OUzQJEecSvs1Qffs/ZAx1Ipetfq2pd5GRucbjt6oDV9vS/+
         ZXpAx/RRwkBLvMXuF2j5nfRBA/omeV9DvIH8ZFY/wyiIHBEnF++MT+p1VODjLSAimPjH
         rsgY3nwZH0NBgS+P62WQK+7+ueoaPV5SrEgPruMnl+R6IU0Z/yNJ6TTwjBuuNVAF+HkJ
         W4EDr9GnVBsdneTPT2RcnmocA2DOxAxPZn62PoV6bJn7c1erqhdkUYmYdekPqvCIOkai
         zXp8o0A76ch88mT8K3aHnN5v8ypcLOE7cxREj53Ha5vgYm1MSrETjmTDCvcsfG7ty97v
         RI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364152; x=1741968952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=Z0WOQ9TbtRxGN/WB97vJsFYX7HWYkbrHQHMFGFCLNFhAuH7KBXaQguTc2uhyNn6m8Z
         DCBrglcNF+28ahgtU82BquSDJm1CdABl/q+bArGvrfdHqORZjO0W81Nm0qyPju8jdoMY
         u93OkP5m+fkjEWkjrD/P5MbXIzlNba2V4fAZlE9X6fhpXXzsLG1BDg26fWMgPvti7APR
         1Cr/h5ycO/wYfBxJmcglDHihM1Hr22TnKCNyvQC1usihwq65S6H3XnhHKCN4xNw/qCgd
         2kZAlSZWe6Vib1B7yGEztcCQ5pwa5xmZetrvWV815bCLZTuCb+pRPA/Hlpbo1aBfs83t
         +PuA==
X-Forwarded-Encrypted: i=1; AJvYcCWE2nKtjUDrjcqLxLVusKBj2E/gdSV6Ho2Lwcvi+fIrLVCTtDFV4F5MS/qOIokfF93/B6d+cyotHEM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtFmU4beyPYGvudClTY9bACSygObwbl7tn5mwexef/chlI/5Gz
	/JXIuP8MenJIcqju0TpQlqMMZesszyLwhjDspcSk/ZYSo0gCflD5myPOWz0qjFA=
X-Gm-Gg: ASbGncvR+tmYgf1nNcoqNKBZXnA97PBElpHRPR6kEwej4wNHZfimAD6RpC4DpIAcDey
	8RJLJbiiIyWKUGwuBLolC613SG/aEG+jqSzI74+29CZJpDyA7l4HBOu+6RySfl2M1EFoRoLH79W
	Jpoa7S6zN5PjOXa3UXlwEVo7HdOpQN05mM+MtLPTu/HMzPU/DT8Nr16z4fTnvqkSdOe8onuJ94d
	2wl1js/M9PfqqRgN3klL9WvHDFZjTFSVcrYzvhbwP/3vEkVgH/uWBbVWeRVCsm9KOovDmDKcqUk
	+yEua066jrpnvppqGSVMZwUIljjIyu0MhAWgu7Wj5q1XvA==
X-Google-Smtp-Source: AGHT+IFgUcPXSiBD5RSvWaNWhqMpYlA6SxLhZgQGPKx5eyPuJ3M5Yl0LRdylWzB/3/C6DxCmNYVAYQ==
X-Received: by 2002:a05:600c:450d:b0:439:7c0b:13f6 with SMTP id 5b1f17b1804b1-43c6872e1ffmr32499415e9.31.1741364152302;
        Fri, 07 Mar 2025 08:15:52 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8daadbsm55496245e9.21.2025.03.07.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:15:51 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v8 1/6] kbuild: Allow multiple asm-offsets file to be generated
Date: Fri,  7 Mar 2025 17:15:43 +0100
Message-ID: <20250307161549.1873770-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307161549.1873770-1-cleger@rivosinc.com>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081554_135372_647FCDA6 
X-CRM114-Status: UNSURE (   7.48  )
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
