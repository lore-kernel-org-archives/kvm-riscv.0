Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC6C0219D
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3k6NYrIiJfedvpaMmQc3qLUFtiA3AUJrD/QnMphbFQ=; b=pbZZmIHlraNaYV
	k+YrC3GCVpBtn65is8GzsnASPtyf1/336zEKMl+BcpI0aoseC7pgWeFqZhOhVZ78gwdtKeqJ5RYq5
	iSId2QXobI2KY6mDv5QG+tcaeqtixN//2UWROiKPqLS42F6aJ9VT/vdBrQK9IKRof1zclFEG02EKj
	Kj71S6bXkT+I0I85ViFlUStTCpmXp/IwNIV0PrVndyV48UmI2AhXI53lEpUGod+kFIDSJGYX1cxSh
	axWdqyBomvCisx3LQBRN0xrTMsyO78wcE2xRKOph4odbjDllkHIg+rUFhI15JoA678+bBVXzoNYBS
	wU+2EdkckSQ/2R1rBpGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbb0-00000001YO7-4A3k;
	Mon, 10 Feb 2025 21:45:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRt-00000001VOh-16Z6
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so11954335e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223371; x=1739828171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=dg58qYlT3aNYwONXAxBBhYfBEj31nVCWyNVEFUKKxZSIPPR4NE5+2C521eW7yrnf63
         9L37+0MuuxjtGkfh7vIWFCnXK0L/w+Ulj5nnW+SSnAxT8Qy/rtV2cGZ8xfHs3aXJvo8e
         mWR5zScQw0TiKNRUCTrXYjTgYk0eST1/sEzmHnR4T8z3kEfEyPROixYjV5B//4e12uKb
         R6lXPAlmV2DDzKJKxHxTzBkqo1WCWnsUfMScN9EpVlkTADQKovTDOaZVCPg8CiNu6st9
         ZvyrcPZmFMBMEXRzo/FrjFTdCZ1UxvzwvGz9fK/63oTwf1xNvj5LO/30/InyLj9YTZRC
         0JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223371; x=1739828171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=YLLT3ngZMUQiXSg2/exHP97gV0W17FHdOHPDRokK/vtgAkd+8piyVyhEYI3haN7Dxq
         wtTkjXCLluNzlzDxLTSRPRmVfpC5H+m2h/8UW+rbaWV7edJ9L08k9b49FKIhk8CxkW/k
         yfpJDUUcJZ95AGMlX4LuDLLAPLxJ3sC43307Fhi7jshI6VFEWYUL+MR+KiBlix347skw
         jfhBubYnkbCV6Ks0S4OzXQk6qv4HebRQhwqX4mnHhkcYuXtLEU2s5PgqQe0jonm1ZJnN
         Du7zDvNeH9ajWsV0MCZTVS23fTLVrI3rWBjkegpvc04my26P/lhkRhHTo//qUC52OjE/
         o5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUqsIQ0qsqg0LRu6ieZffT7LlT4ssgMYWicXfXYu1fx/qhCNoOkHqQ9NBUa+tw8zxLLN+SuSNOJc/k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5hHJJo1Izje9XasfT9j90Hf0hGWRP0hJvOzfoi2SQRHpT+Oaa
	s+Bw6DlZ+tg9Z8HiMmZFK5uImyViA3YWJxvQnbyl5loBCO17xvYjarS4yKAB1jU=
X-Gm-Gg: ASbGncvyzcUYH1dmxpw+FOMxeRlQe+xUXjROtQWISVKTu402Ffz9EMmQa/1nE80ROhk
	dZ9Tcde+80lGBFj8o++1xX5HplPOrmos5rGChY0EWFQD/8Pd8M7Sx9Tg/FpUdvsFWzKXTdK8vZj
	0nedV8pSDIoImRRbUnDOoB52ztcPB5tUASiao5Rwfbfzkwxb1bgwy0XPpZt1YLrB7ESfaiKmTxi
	yDX0C2craCkCfF3T2ENdLqu1UrYZB87Na+EMcCb1GKf8j3otlobakmsmHGaiioxuq13AI4pdNm+
	PWpR1hbBK+1Jtdt9
X-Google-Smtp-Source: AGHT+IEW4IwiVYF//YV32GNZdcYc01vxx73uhLVhCiMW8eGAxNPBu731uRffpK0oYRexJJNizE9I8g==
X-Received: by 2002:a05:600c:510c:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-4394c847ad4mr11919565e9.24.1739223371617;
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
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
Subject: [PATCH v2 06/15] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 10 Feb 2025 22:35:39 +0100
Message-ID: <20250210213549.1867704-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133613_302028_0C0FD33D 
X-CRM114-Status: GOOD (  11.99  )
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
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgfCAg
NSArKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMTcgKysrKysr
KysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCmluZGV4IGFkN2QyNjc4OGU2YS4u
OGI5N2NiYTk5ZmMzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaApAQCAtNjksMTIg
KzY5LDE3IEBAIGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBp
bnQgY3B1KTsKICNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKIHZv
aWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVuYWxpZ25lZF9jdGxf
YXZhaWxhYmxlKHZvaWQpOworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KTsKIERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7CiAjZWxz
ZQogc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCiB7CiAJ
cmV0dXJuIGZhbHNlOwogfQorc3RhdGljIGlubGluZSBib29sIG1pc2FsaWduZWRfdHJhcHNfY2Fu
X2RlbGVnYXRlKHZvaWQpCit7CisJcmV0dXJuIGZhbHNlOworfQogI2VuZGlmCiAKIGJvb2wgY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggN2Q2MTg1ZGVlYTMzLi4xZDUyM2NmOTZm
ZjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTcxNiw2ICs3MTYsOCBA
QCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh1
bnNpZ25lZCBpbnQgY3B1KQogfQogI2VuZGlmCiAKK3N0YXRpYyBib29sIG1pc2FsaWduZWRfdHJh
cHNfZGVsZWdhdGVkOworCiAjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQogCiBzdHJ1Y3QgbWlzYWxp
Z25lZF9kZWxlZ19yZXEgewpAQCAtNzMyLDggKzczNCw2IEBAIHN0YXRpYyBpbnQgc2JpX3JlcXVl
c3RfdW5hbGlnbmVkX2RlbGVnYXRpb24odm9pZCkKIAlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhf
ZXJybm8ocmV0LmVycm9yKTsKIH0KIAotc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxl
Z2F0ZWQ7Ci0KIHN0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2ln
bmVkIGludCBjcHUpCiB7CiAJaWYgKHNiaV9yZXF1ZXN0X3VuYWxpZ25lZF9kZWxlZ2F0aW9uKCkg
JiYgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQpIHsKQEAgLTc4Miw2ICs3ODIsNyBAQCBzdGF0
aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cCh1bnNpZ25lZCBpbnQgY3B1IF9f
YWx3YXlzX3VudXNlZCkKIHsKIAlyZXR1cm4gMDsKIH0KKwogI2VuZGlmCiAKIGludCBjcHVfb25s
aW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQpAQCAtNzkyLDMgKzc5
MywxNSBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50
IGNwdSkKIAogCXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQoY3B1KTsKIH0KKworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lkKQor
eworCS8qCisJICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQgbWlzYWxpZ25lZCB0
cmFwcyBkZWxlZ2F0aW9uIGZvciBhbGwKKwkgKiBDUFVTIG9yIHRoZSBTQkkgZG9lcyBub3QgaW1w
bGVtZW50ZWQgRldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZCB0aGUKKwkgKiBleGNlcHRpb24g
YnkgZGVmYXVsdC4KKwkgKi8KKwlyZXR1cm4gbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQgfHwK
KwkgICAgICAgYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQoKTsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsKXCBObyBu
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
