Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A2C35FF8
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YipELAsfgruIWbIZQgUyMJDpJWHgv6kH0m1eg8/0pk=; b=pcOPMxTDESDDYE
	90eIL3gkU8SYae99uax4zBfoxW7V3RhN4lSv11o0YxO2KiAMpzGgr4JPFIoOPOUHTPaq754XpW2Fo
	KPnfaZvQXV8XoVP2Hoq2+IZWq5FbWZcWfaKdkT1sZs3RPE/5pcbOX6Pv5ZFhK3bfpDy/WghWiT9Vp
	RkNOM43H+tscUyinB3yUrc6r+xoUNy1zILifyIUv3zzzJzd+yET2IJKM0Jzm5cjZpFuIsbN8zkFhA
	Z22XDcXESEREgcoO7JA5PuX3bx4tc6L3zdX0Gbj6aAuuR3E3chD8hLyDArra6oqEXej34TBEJBrrx
	vIepRH0FjuGggGfJtRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1Z-00000003VCt-2G1W;
	Mon, 17 Mar 2025 17:13:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwq-00000003TW1-1xjA
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so15080135e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231299; x=1742836099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=FIMICZKJ8UUIIQ5NAmeV84+1xIiECkOb9RPCS+u+UB0GQ7UzVdyWFdMsaTlGQ6SXds
         942oKskxCKT8UUTsKZv6a0QTp75Z5k+YeKFaubKBc6ZP4gXjv+fu/cwcejRwt+RGLUhD
         tZNfwvylWtatjNvongD3B0Kw8G3HwBocB9+Qu3dRO25OOXWrR7zHq+4fTdKAXeJ5d4Dp
         hWm4M5FI24c/vJCUGtuvVToBoz64ABHJUKz9Ndh2hxPgfXrM0KZIDCcV8bAV0T9d7fKN
         uknyeihFhbdWZBN1WP+G13sEh62tejn/QWAIpqUVZosXKunS7FNUeWaEUVHFTbhLBhJJ
         TrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231299; x=1742836099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=igWy4aDLdgRe3dKd5xNoQ6N+OMzKXRC4J3WhD27yavcZy+f9iPaVJw020pPZA1AAgm
         W6oAUWzIsJghyyylsRrEbPGmrDqbYaylJnVzmDh0VSTkk9UVv0EUedUUBMHcz11MRB5C
         Hfrk8jHzaHzn3uy5UFEPH7nFgCUFCjuudTbll/30AMkU8d46C/JWvZ9Xpho+KMn2aSmi
         9l7Zdhez5jfRtpdElwQqgiR/sNId4atyqs2IIorVWyCEynpWoKzKJx5nzhR/yre9BY1t
         sa0oCWA2NGydBetgDB1rivayyFKhV5uzbO+9j5FKy29UoL8SUOnVdMbtjRSLkT3V8+Rc
         512Q==
X-Forwarded-Encrypted: i=1; AJvYcCXR+YFHFKKaRWXJ0kku8NLxcp7XfrhEniAw3yobPfvkEUQ8DagL5wFfo9IU6Zvi0C05oEZXhn5zYVs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUEtyLxDxQysXNPoVxkWnrTqYJtdZslFn5WM3DMNwDfbT0kGWq
	kOHvydM6Wb+RhgVg5wMTucV6tr4TMzu+YkzMLNdq8Lvz9d7xqDFT91F5dC9ApCE=
X-Gm-Gg: ASbGncvKq3s4fePw/JGAQCmqYm+Zcn7gRM4xLndJvfOZMpK0rKkxMakBypt6WRyFMO4
	7VWKXIX4NsZATQ2p/tvjv08Z0fSu0E2ULhJBGdi6nYunu77oPLLKrkOeEOowcW9yciVIDMaHMDL
	DzP3E9bNlH3yYfz2RxaB/Jaz0TX1X4CfEFtE/0VL/7LctGU5DCsolzzAcg6X1GD8C/+4aSvj4nB
	B1ftxIIxDVUtrzSR5gNet+fefX6X1jXuMPnBWZTHV+CuTWMrpjHo183z84t9n1HzMHC3mkKAFC8
	8zRBNVNRG17hydoz/dC0fGO0grXgQhQnvwGowsHNY7uh9A==
X-Google-Smtp-Source: AGHT+IF/jPZgtuKO9F2UOB0NNJAFXUmhCJVLus67Lul9R3bvXGZReu7Tw2V0Z3eVtQhps9kA5NlJfg==
X-Received: by 2002:a05:600c:4451:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43d1ec8a44cmr134590325e9.17.1742231299101;
        Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 11/18] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 17 Mar 2025 18:06:17 +0100
Message-ID: <20250317170625.1142870-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100820_499688_B01A771F 
X-CRM114-Status: GOOD (  10.03  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2VlY2MyYWRkYzQxIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHsKIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGly
cWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxlX2lycXMgPSAhcmVnc19pcnFzX2Rpc2Fi
bGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVwdHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQg
aW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJaWYgKGVuYWJsZV9pcnFzKQorCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FEKSB7CiAJCWlm
IChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpAQCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRy
ZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5hYmxlX2lycXMpCisJCWxvY2FsX2lycV9k
aXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKIH0KIAotLSAKMi40Ny4y
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
