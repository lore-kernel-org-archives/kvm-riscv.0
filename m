Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401E9C369D5
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqUKJqubHzbN2uYprcKdhguNNq1k4gLGV35GqwUyoz8=; b=gWTf4jcLBZGqds
	OXmZ3HhprXDhX4Z/aYXtfIGaIrNx8070t/APnnm7wBdGtTkNFZkWe0Nw8hasBqfZfyCgS7CkLTFik
	fuj5tyMoXVJT3nmwq6uxhHzuKnDxkJ4KObtuQNoyn77tUHvNBvixseR/2ZsxddY94T0jyW7Id+/pT
	4sZFbGmO/+m6+gk9uLIG6l1pfHL1UNBm8kml7egE7vxh2ohfAbil26+dw4ztf2i8J5Zr2JSW/Wupv
	fspIYBD7PlecHUG718P6nJ+t+fXa6abBnQ3vLHX3Vanor1vCpQoHBhT5HRIIrKsn2yAq7YCyxPks8
	uE8rawA7YAVmQTy0+nGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTX-0000000CzDp-2gWh;
	Thu, 17 Apr 2025 12:36:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIx-0000000Cvog-0x9Z
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22438c356c8so7712105ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892718; x=1745497518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZnuSlMP6ZuwANzL9lETdaARYZp01YtNV9fLw8GSKUw=;
        b=YXZl9uM/PkAL0ltnjfMfVnBoLzbgP0HsQOBJsLnPO0bJ2cFYx5ZK46h9Cj1KcLsCEa
         cJ/KjN4lKAuSQKhiRlaPLZauiP0LiZQ1A/qyQ8806AqPw1LLdHxCMDGBTgtUbFEpWS4/
         ljqLSPKbBRYHiZvXfkwbNZVhODG380xNchpACvcVF8hCBVfrnkB33P6CeptjcR2LfFj2
         9oyQKhctrzMVgjPaOBfF9K0251wabCp9aGlbwAvKwFOi3EmlqcpMO5CzahG35LtPQ9tZ
         6M2vpVHWK5R9ekR3pCv7t9ae8VKBvmyobtUtVs+AQhyYgm24BkWTD1FMKLF2LS+Im9MH
         r3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892718; x=1745497518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZnuSlMP6ZuwANzL9lETdaARYZp01YtNV9fLw8GSKUw=;
        b=DXj+z9HjgMZQsnA+C80pRAwLWi+znqeLoT9VIS3s5UykirAgTDfwwOvpWObGKSzE1V
         kqve5+xXwdKNqP0JOsi3tzlHw/ijUzb0Tp1SoqJKAkomh4mLG3mbPWmjRjAHSYrft2dw
         DydNSzv+aLemBVdqppo3oRNyI7PUekB6mR3tjSn8aluvlGuLVRpWYOvldWaY/TM7MwKK
         zBkU5GhIkK5C6HYxO8nnssrwyRB/UVgH9fa6iSkX6LyfDY7pSjFJUhMTANJsUqSmfk/T
         sjNvRs2tFxUnjr9l9cGRRM+NkWYBtZ8kpXe9xaG0l1Tu5X4vTywV3SSnZRP/hKjzqPCO
         OJew==
X-Forwarded-Encrypted: i=1; AJvYcCVAqk3qF65hHKzPWffXXyy7i6gD0Bn4tk/16SmgsDGG6RTfRFb6ppzOvt+ANMcd/tL5PMWB5eqT7xY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzmZeAxrkiFowQaqS5k7rPY7YuAxRDQgRr6WMTbGOvS0JaKu1w
	hp4TV9/V7qgZrBPhNxplXbhPz/8oGGaNa2/HiaOF75om8JXIFCOdOlRnYJu9luo=
X-Gm-Gg: ASbGncvb5RJkqMnCADpE88DHWdjA3w3ZpfGLGAuT4aWmyMOD6AHkQNjqVncyN/0OHHK
	dWvPkl4n2DWrWGHfiZ1vAoIsB2yjjvy/kUR9GBS1pABG20ZQcfnLNQX84Gs5WKVLw+nkmqx/C/6
	tnr3bBh7GwNg5QAraTTbJ2V8ZtKSG8Cg5oLXJH94l0Zjg11dcuW8SnOffZAuBUAtLFPlTPgOa9B
	6eRLLDtkgfXtXyk6JnzzM9fnAXpFXaNZZw4Wnusoz0ycMqDfPGrLsdEZOw1E9J2SA2vsqJS2UNW
	Bs0eWY+ia+01VsAUWnzYinyatRaXdztpku1ivd4YPQGUNpNE1faf
X-Google-Smtp-Source: AGHT+IFn+UkDwIOY/e3sKBsC4N9k8AEuCmWtLw7UPdTMPKcDNDFZ5/adGOe7oxZT/yFghuiQ5DQrlA==
X-Received: by 2002:a17:902:e808:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22c358db9abmr72649025ad.18.1744892718633;
        Thu, 17 Apr 2025 05:25:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:18 -0700 (PDT)
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
Subject: [PATCH v5 09/13] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 17 Apr 2025 14:19:56 +0200
Message-ID: <20250417122337.547969-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052519_268852_80AC9F10 
X-CRM114-Status: GOOD (  11.16  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDUgKysr
KysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDE3ICsrKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBkYmU1OTcwZDRmZTYuLjNhODdm
NjEyMDM1YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTcyLDEyICs3Miwx
NyBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNw
dSk7CiAjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQpCiB2b2lkIHVu
YWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwogYm9vbCB1bmFsaWduZWRfY3RsX2F2YWls
YWJsZSh2b2lkKTsKK2Jvb2wgbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCk7CiBE
RUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOwogI2Vsc2UKIHN0
YXRpYyBpbmxpbmUgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVy
biBmYWxzZTsKIH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxl
Z2F0ZSh2b2lkKQoreworCXJldHVybiBmYWxzZTsKK30KICNlbmRpZgogCiBib29sIF9faW5pdCBj
aGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKTsKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCBhMDAwNzU1MmU3YTUuLjdmZjFlMjFm
NjE5ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNzA5LDEwICs3MDks
MTAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQodW5zaWduZWQgaW50IGNwdSkKIH0KICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX1JJU0NWX1NC
SQotCiBzdGF0aWMgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKIAorI2lmZGVmIENP
TkZJR19SSVNDVl9TQkkKKwogc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0
dXAodW5zaWduZWQgaW50IGNwdSkKIHsKIAlpZiAoc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX01JU0FM
SUdORURfRVhDX0RFTEVHLCAxLCAwKSAmJgpAQCAtNzQ4LDYgKzc0OCw3IEBAIHN0YXRpYyBpbnQg
Y3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUgX19hbHdheXNf
dW51c2VkKQogewogCXJldHVybiAwOwogfQorCiAjZW5kaWYKIAogaW50IGNwdV9vbmxpbmVfdW5h
bGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpCkBAIC03NjAsMyArNzYxLDE1IEBA
IGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQog
CiAJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUp
OwogfQorCitib29sIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCit7CisJLyoK
KwkgKiBFaXRoZXIgd2Ugc3VjY2Vzc2Z1bGx5IHJlcXVlc3RlZCBtaXNhbGlnbmVkIHRyYXBzIGRl
bGVnYXRpb24gZm9yIGFsbAorCSAqIENQVVMgb3IgdGhlIFNCSSBkb2VzIG5vdCBpbXBsZW1lbnRl
ZCBGV0ZUIGV4dGVuc2lvbiBidXQgZGVsZWdhdGVkIHRoZQorCSAqIGV4Y2VwdGlvbiBieSBkZWZh
dWx0LgorCSAqLworCXJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCB8fAorCSAgICAg
ICBhbGxfY3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpOworfQorRVhQT1JU
X1NZTUJPTF9HUEwobWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUpOwotLSAKMi40OS4wCgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
