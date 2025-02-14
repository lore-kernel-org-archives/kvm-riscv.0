Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2579C021A6
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzgeA5bNX24egiZBdxcAvs/ZiRJ7RS/jj2JDc82yDX8=; b=ciTvJJfmXLN8Xv
	ysDbN0FfIy0TCkdsWz114NsRolyyoZ3I1ZPdue8s/T/UB48qUESuLUPxcmOHvYDO78Epm7NNU3c5i
	F1COZjjfVmY/ayD/KfbfYJjoA8+RDd7wbU5aHY+BcQJC6xTgMTk5yevfNb+vsni52kGidK1mjoQac
	x/noPgHmwmwafwuZhr9840HiZW36BW5nsfouZFzNhUnIqxbY0Dqf7mLI0gJcFrUxU6GVffpXTLj7u
	ckAqZCH46/2LwB7Dg9TVfOejO5WnaXCTpoxQ1/UmRMV80mfIAPspCF7moJupZ8Da5XnbVOb/hAVCd
	ucG1fuCceOFeE5gEhMyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuEg-0000000Eka4-2YGk;
	Fri, 14 Feb 2025 11:51:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu7p-0000000Eiws-3JQm
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:44:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e83d65e5so21230425ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739533493; x=1740138293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=YEgr2OlO7xubPVYiKwpN05H6ZbBZpJ4Nr9/ydx1Ygh7upjurRxrq993VbZFHXEQAPM
         Gt7wqKeCX5k1X3UHj+toGKKvX7T8jVzZT3sfZLV1JKUs1OfZYr3huvZUNqPIetI3sIQy
         EG46axGccSVa1l0nCQ5/KV4t/HXhL7faJSYff8j6QCcjjNgvNA4dDT4Bzl5u7jMaf4uU
         J7Csd2MZKLJZKdOUB3vBx7uDXZQzEC0p6D+uBL6yQlV4Tw4arovKf0KuMGCGdBothzip
         NCX7zu00AyCDcPGLlGBst54wOAaJt1a6iX7NpmoId8sxuPbhOnRzEvSkIY9ucXukFcnq
         77Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533493; x=1740138293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6i1/sQFS23e0aHQ0gG/Xo3pgpweMckYvmkT9KdoCho=;
        b=kSg3bndTJ8ZprIbNLpwFxH2WJQUX8zWfEksdNzbKyuDtudI4hqISVqCQCldVFmZqVN
         Ht7nhbjGZ5AdrXE+BIjVvFecKUpuBBDkVe05IiU+L1cJjSc/h1CZa+acuD4kI7CwVywA
         hyROlAhuTJ1/YZc4ULQrVJaQeJNse/DEAbUYEFnXPHj0POWhhAn6n4i6ZYTZexz1/bkp
         /nAYtCmQrWKM/vYlr85xLbT4oviqGny+tc0WV7HP8ady3LaWT+nAhG+gdtBq4ZjFYEGX
         k7ZPXPOw9zjKMEGyf10aAo3+o4gXGDECuXklGllfjA3xPDRPDUYH+kyyUWudpjDlRh1+
         +NKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzX/v1iaXDN5JUFSJExnUyVWEa7qWVP71w5Cb2lSakMR9hOyuaiLY+x6mbjdFczjQHQo6Ewb0gFp0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw21buOhKtGkQG87Sy69hwqM20xlEr3Fp8kmkGgZKVnkZyuQLGc
	+80nTmVTbGpnrDiCeCaSGCQPudETlaIGmD0Pp79/OX2r7EVLv81BgsonfXQ82usg/JQ4nvQRoDD
	Q0W4=
X-Gm-Gg: ASbGnctKwYiNisdOjfICS4vePkXWczOz4T2sktnMY92tetZ8s0Qf3NBY6B1pYvy17kT
	tjobIVI0UV34jwSRJs+mXKvAiAYRWIhXspH+Qh6POmZs1NULHG5E6HrOIM81/53n2mlRqLv7GNQ
	b+sG0MgaKIn/5flkfXDeaKB0R8hXQXinB/65xOnaogerStKOpkSSpyUHlXw5gdpNlgy1MDkp3P2
	DDQIEf9UocKmx7KK/SAF8G4S9/dwLBbBdJX5mS5jbCtR14fGOnzFTDIGRygeBQl9P4ut1y4AAvM
	lbW/XbHXdcmjT9Ai
X-Google-Smtp-Source: AGHT+IHwonpDXPO9JOzA8b4YRNdsTxziTHeK4pyvnZYiW7iBSmkCmFUqnfBZAz1lQK7LnIfy1hz21A==
X-Received: by 2002:a17:902:dac6:b0:220:da88:2009 with SMTP id d9443c01a7336-220da8820d6mr85684385ad.45.1739533492958;
        Fri, 14 Feb 2025 03:44:52 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f6965sm4948862a91.29.2025.02.14.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:44:52 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v7 1/6] kbuild: Allow multiple asm-offsets file to be generated
Date: Fri, 14 Feb 2025 12:44:14 +0100
Message-ID: <20250214114423.1071621-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250214114423.1071621-1-cleger@rivosinc.com>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_034453_829207_9CCE96E5 
X-CRM114-Status: UNSURE (   7.32  )
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
