Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA0C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmYugAEomPPRxSR1VbSPX64rwI82NKoYkglBuGm6RNo=; b=J+bGBuvT0uBOM8
	kP03FMR2F0btlqnVIE0V9AKTOgCjrhP5fYjERUvi9gVyayq2MbOJw5LVaMXTkrGsjEcLbytDRn6hv
	PcDH27ouaSsEoZkn1jmOvsTgLJgDuiFMOxSuDFEE4ZOZ0MViiNyuA1kOHtoGN7nzav9i0q37lKJLV
	S4PNkvTgt+yZzUsgwT2FvuZqNLXYAeF/YI9RnDrHeOmwpHGhMqxeSQBQ79lA85UAPkUaK9hLXbUqI
	yX7VGa8OIR00eLPZG6KsIValT/ysPhopSRLVr+KhtvuMUECEE0TylK7Q/7ozsFDI8oYGRBa+xDgT5
	fAINhtKB+zIlzp38cOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1W-00000003V8C-2xzr;
	Mon, 17 Mar 2025 17:13:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwo-00000003TU4-1Zst
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13878445e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231297; x=1742836097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goQPfqUUhZrDcxyWXuqyDL1Ho5AqcAiizxxMLq8C+LA=;
        b=RRB2GAS4pT4TAS9+BLMWuAaxwz9n4UnENwCVxdPJtH/POVRI5HKIG2/r1qsbMB/LKq
         aEXWJzyrFvJbpCzMBILUEYzH4neWeKQsFDFVo8PhjaxWxN2HGSNIntharY98YqnadzeV
         gH1KJHY9237AA+sCLExpDSM72GT5W0TFxs3K1YYhB5otbnfEiW/5KZ6RFpeJ7fip0tMl
         eHGqvM4lW927aPj5ChKSKQWjP61WupUXG7ot8SrQuskvmoR+LvbUxL0/HxPV/6RwYCKE
         hZXgDXBBUiJo598NZ8Due1aT1rPzBw45syJCZFtWuwJiNLchE9DcXVd+wKFb/im1DiZH
         hJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231297; x=1742836097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goQPfqUUhZrDcxyWXuqyDL1Ho5AqcAiizxxMLq8C+LA=;
        b=lWkr4WYVizpJBwwV9sZH4AIPXPhg7G30/OT9hrNe9Wb0tafyrM0zMmc8+aBcYkWKAc
         joTSBbOQCokxwuAnq9pHR6RgT8/0RA7e2lJ1eEoRTT/TlPaWx3aoyaW1LMCDihIRpShs
         CLq2UT6ytspPIydc5eCBz81KXJSsTlBEn5HCvzoXmQtc7ORWOj229ThIhTvAywQ7ibzD
         +svF6rp39G0ioWiGsq0PMHgxmX2XkrV0or7sbm2O9S4H88vmzJobvf/dF3oAvSHPKmvX
         q7F4/IS50gKNLG17A52t7h0VUEvEiWsrm+dkG3QnFYH+JhMTerigs/D1e4733S+HRsyi
         tO8A==
X-Forwarded-Encrypted: i=1; AJvYcCVE7ZNzcIyOeIdCsm9OWJ2tSME0p7jDJib/TA9L8882cxIx1qWR3bLHsC/bEeOpcsX7JjzNNlZFy/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdsLa3BFkFZXFM6cgPlUL++p0g/xkVhZy+l87uQJy7nDD6rY5J
	HPN4/PbiNMYtYox23/TOZeQwWwYw6hmMeHRevBMxXclm3mmK4KRZ95eFQKMccI0=
X-Gm-Gg: ASbGncuTXcT8hJTNqIwihlCyDQxYLR4B/aXyR3s8mGm9ZDkAUJeBdmVHB8c2iKzyhqz
	fY1E+jPTb47aQq2BU/gAGF1LWRK26tHc8SDKr+7j/s6ket8GQMsOoPuXehTvrPJmVCC+94oH4No
	3kHqreMZX9vm95G4GHogsCYV+je5df535Rxqihtc+IH+FI5QJjW+q1dVHAQ/guf5p7pFnrik7ca
	uA4O5TyjxOyw2RrbfXsOKVkBPAqi+ZNltGOmkbOxQEr/OppU2tWSu2RKx3M+TGvxcgIVxpXlXug
	z9tTBnyCkt8WqS6fzPMhSAeAUEVuyVxT/SKFyGsrfsugSQ==
X-Google-Smtp-Source: AGHT+IFputIgv6zhtm+v7+MGBN3nI7X+BtRN1fT5rRbozYZS+RzAoNXF9CqISuMs9K5H8TPGERcLdQ==
X-Received: by 2002:a05:600c:4e51:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43d38f72af6mr2448325e9.2.1742231296757;
        Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
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
Subject: [PATCH v4 09/18] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 17 Mar 2025 18:06:15 +0100
Message-ID: <20250317170625.1142870-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100818_428459_E9E269ED 
X-CRM114-Status: GOOD (  11.36  )
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
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBhZDdkMjY3ODhlNmEuLjhiOTdj
YmE5OWZjMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTY5LDEyICs2OSwx
NyBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNw
dSk7CiAjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQpCiB2b2lkIHVu
YWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwogYm9vbCB1bmFsaWduZWRfY3RsX2F2YWls
YWJsZSh2b2lkKTsKK2Jvb2wgbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCk7CiBE
RUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOwogI2Vsc2UKIHN0
YXRpYyBpbmxpbmUgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVy
biBmYWxzZTsKIH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxl
Z2F0ZSh2b2lkKQoreworCXJldHVybiBmYWxzZTsKK30KICNlbmRpZgogCiBib29sIGNoZWNrX3Zl
Y3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpOwpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IDNjNzdmYzc4ZmU0Zi4uMGZiNjYzYWMyMDBmIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC03MTUsMTAgKzcxNSwxMCBAQCBz
dGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh1bnNp
Z25lZCBpbnQgY3B1KQogfQogI2VuZGlmCiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCi0KIHN0
YXRpYyBib29sIG1pc2FsaWduZWRfdHJhcHNfZGVsZWdhdGVkOwogCisjaWZkZWYgQ09ORklHX1JJ
U0NWX1NCSQorCiBzdGF0aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cCh1bnNp
Z25lZCBpbnQgY3B1KQogewogCWlmIChzYmlfZndmdF9zZXQoU0JJX0ZXRlRfTUlTQUxJR05FRF9F
WENfREVMRUcsIDEsIDApICYmCkBAIC03NjAsNiArNzYwLDcgQEAgc3RhdGljIGludCBjcHVfb25s
aW5lX3NiaV91bmFsaWduZWRfc2V0dXAodW5zaWduZWQgaW50IGNwdSBfX2Fsd2F5c191bnVzZWQp
CiB7CiAJcmV0dXJuIDA7CiB9CisKICNlbmRpZgogCiBpbnQgY3B1X29ubGluZV91bmFsaWduZWRf
YWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNwdSkKQEAgLTc3MiwzICs3NzMsMTUgQEAgaW50IGNw
dV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpCiAKIAlyZXR1
cm4gY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGNwdSk7CiB9CisK
K2Jvb2wgbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCkKK3sKKwkvKgorCSAqIEVp
dGhlciB3ZSBzdWNjZXNzZnVsbHkgcmVxdWVzdGVkIG1pc2FsaWduZWQgdHJhcHMgZGVsZWdhdGlv
biBmb3IgYWxsCisJICogQ1BVUyBvciB0aGUgU0JJIGRvZXMgbm90IGltcGxlbWVudGVkIEZXRlQg
ZXh0ZW5zaW9uIGJ1dCBkZWxlZ2F0ZWQgdGhlCisJICogZXhjZXB0aW9uIGJ5IGRlZmF1bHQuCisJ
ICovCisJcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfZGVsZWdhdGVkIHx8CisJICAgICAgIGFsbF9j
cHVzX3VuYWxpZ25lZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKCk7Cit9CitFWFBPUlRfU1lNQk9M
X0dQTChtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSk7Ci0tIAoyLjQ3LjIKCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
