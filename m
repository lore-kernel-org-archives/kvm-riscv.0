Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708DBC282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYsNOyHldQgsvOfrZHuBqR2xMaK1+azHEkqfN/tsRog=; b=42lKjSrzZpbZoL
	0F6f53nGOVMSpV3db0+WVeelPIQd47RI2Tpbhw8uHlybXwFpYGuCjOoTE0wq2MtlG1EwkEXJbng8m
	DEBaG8XYIOhA8DfGJYqjFZ/ualayFcwq9Y+qpxB+wmz2bSYSqSdMOKcyTTUaAXok/oM6KzbvDm4EP
	0ZTkI6lnGMstUp3GprMS9nys+qsJTEJbDrneWoqSmQ99JhZGX5MHvglfshEEsKNoc01hjfvg74vPL
	DZ6iCckJWv7ocOBMr6RUqTVPZp+5/etpVy0WKnTsWc1RtBC0ZKhgrnHKv0rO6uoYbuqxyCyfy7y9X
	3sb2heK3RgpcGItP4JcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1Q-00000003UwN-00aj;
	Mon, 17 Mar 2025 17:13:04 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwk-00000003TQB-3H1S
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:15 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso16603165e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231293; x=1742836093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k1emOUih8WEclNZ1DDbkx/NdClZ1In2F+3XrsHVDoI=;
        b=yfnibR/2sqg/hjS1TqiOgjyd32Mo01AVE9b498yRTklo3g/8sglkv2/X1MBDozUxD2
         3nW7Lmm3Dl/LzRkk49zR5ZAytTS4uFk0hUlLL6FqyFkStS0RYWujs0Ycmf6fQmPHmwQZ
         KcxH5x8r2KVqR0fF12v8zkWs9gxz2KM8mN//ZNsmCX9A6jQF1Lux/HIEVeQwPKJGKRnK
         dT/zHfGvMFB6Vl9VOfY/3QbtyuBBRi/xz/hiKoNXAKixyp1s3MthhL+cCRtLBoquiFqU
         NyNz1l+6Zq+qj2sCLqBk/IVBGTc6eWyxQ0WcVmKmk6Pyvk7lac7GjO89lnjiG3lPjU5K
         YHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231293; x=1742836093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k1emOUih8WEclNZ1DDbkx/NdClZ1In2F+3XrsHVDoI=;
        b=D815NZSQTxQhjffyC0jYsEZo8PAklW5aNkH/NoERE7jOwfqU7XAAlzC89/z6ONbBHi
         Nn7OkXcnZVMfOiRfjYAC5BOexPdES2vO9jrgorKjk0Cf5OxPSt+q4cX7kcHWqCLhWxVI
         +/6ugPRP00/hIMx4UPX/6eKdp9/sZlxIYuHMZI8blopx53n95+StsixIa2v0+te0qNYO
         CJ9KpTlg2Mm7o2ff/+rZu5MrBANQGm6QqE6DTPBJcVpN02X3qFvrtU2e528V97tBI3LZ
         UqqfjqpkxPSaOU9sNdkxaCwlGvY7srHOD0q9k/sjjdaxUTlRmVhFgQoa+baPgRRbInAF
         gI7w==
X-Forwarded-Encrypted: i=1; AJvYcCVXTH7fnmEkmq6LbiUP0ppI779RQFgri+xxEYu/E+Zs+hCiRX+P7RGE2OEKP2u7rO/raYq8xJ4lzD8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPtFH60GAWlmTFLFkraAQS5YWCR/fiqSkxByI2RHqpl7Q18ogN
	mA1BfnrSiw3rNcZLRWRPbcj88VAu+2DqsmXWXjp3a5rPHO9IfMnHcWFEq8HU9lg=
X-Gm-Gg: ASbGncsOqjEfepTd2tie7nQHoCmjcVjegHJmHTWgOAlwk+CQ/K8SlseqXuvbJRI77oJ
	AmL6np8ymWSQRWbVNVJwXVN+WWklOSQ1kMc/6bsQ+iCK9bTJ8s8it07aDMnMEHRm0zMzFEBJA1a
	FockmInyNBX2Jv6nmY6BpFA31c3FpZZa0Rdg8g7w0Kv+U3rJu+N5Hw19j4o9+29s3b8AuNEysDx
	4yyZOPxsluGfgnFDHVUQHlK59jZcyXBPYEVtj3hfLsWWO8IOXNjpDHat2aqDV2zUgvqco5JWYd5
	36BsakTRvC5blqQWg/4tAVBiOwrYIbDPdLGtXCC+KuzwLA==
X-Google-Smtp-Source: AGHT+IGirZlNuMI7AkYZLJxITsbB2mx0iqkOoTwEVui95+l6OuB5d7SYtKlA2CI4i4rX//+fE8Z8jQ==
X-Received: by 2002:a05:600c:468a:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-43d1ed0e03dmr115529165e9.25.1742231292646;
        Mon, 17 Mar 2025 10:08:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
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
Subject: [PATCH v4 05/18] riscv: misaligned: request misaligned exception from SBI
Date: Mon, 17 Mar 2025 18:06:11 +0100
Message-ID: <20250317170625.1142870-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100814_813043_FE8F4860 
X-CRM114-Status: GOOD (  16.46  )
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

Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cm1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZyb20g
U0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCmV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJz
aW9uIDMuMC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMgKy0K
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8IDc3ICsrKysrKysr
KysrKysrKysrKysrKy0KIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
YyB8IDExICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCmluZGV4IDU2OTE0MGQ2ZTYzOS4u
YWQ3ZDI2Nzg4ZTZhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaApAQCAtNjQsOCAr
NjQsOSBAQCB2b2lkIF9faW5pdCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCk7CiAJX1JJU0NW
X0lTQV9FWFRfREFUQShfbmFtZSwgX2lkLCBfc3ViX2V4dHMsIEFSUkFZX1NJWkUoX3N1Yl9leHRz
KSwgX3ZhbGlkYXRlKQogCiBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXModm9pZCk7Cit2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKTsKK2ludCBjcHVf
b25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KTsKICNpZiBkZWZp
bmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKLXZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KTsKIHZvaWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVuYWxpZ25l
ZF9jdGxfYXZhaWxhYmxlKHZvaWQpOwogREVDTEFSRV9QRVJfQ1BVKGxvbmcsIG1pc2FsaWduZWRf
YWNjZXNzX3NwZWVkKTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA3Y2Mx
MDhhZWQ3NGUuLmZhN2YxMDBiOTViZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
YwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9lbnRyeS1jb21tb24uaD4KICNpbmNs
dWRlIDxhc20vaHdwcm9iZS5oPgogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CisjaW5jbHVk
ZSA8YXNtL3NiaS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KIAogI2RlZmluZSBJTlNOX01B
VENIX0xCCQkJMHgzCkBAIC02MzUsNyArNjM2LDcgQEAgYm9vbCBjaGVja192ZWN0b3JfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogCiBzdGF0aWMgYm9vbCB1bmFsaWdu
ZWRfY3RsIF9fcmVhZF9tb3N0bHk7CiAKLXZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKQorc3RhdGljIHZv
aWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmsgX19hbHdheXNfdW51c2VkKQogewogCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAJ
bG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1
KTsKQEAgLTY0Niw2ICs2NDcsMTMgQEAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpCiAJX19hc21fXyBf
X3ZvbGF0aWxlX18gKAogCQkiICAgICAgICJSRUdfTCIgJVt0bXBdLCAxKCVbcHRyXSlcbiIKIAkJ
OiBbdG1wXSAiPXIiICh0bXBfdmFsKSA6IFtwdHJdICJyIiAoJnRtcF92YXIpIDogIm1lbW9yeSIp
OworfQorCitzdGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCh1bnNpZ25lZCBpbnQgY3B1KQoreworCWxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigm
bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7CisKKwljaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKE5VTEwpOwogCiAJLyoKIAkgKiBJZiB1bmFsaWduZWRfY3RsIGlzIGFscmVhZHkg
c2V0LCB0aGlzIG1lYW5zIHRoYXQgd2UgZGV0ZWN0ZWQgdGhhdCBhbGwKQEAgLTY1NCw5ICs2NjIs
MTAgQEAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpCiAJICovCiAJaWYgKHVubGlrZWx5KHVuYWxpZ25l
ZF9jdGwgJiYgKCptYXNfcHRyICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1V
TEFURUQpKSkgewogCQlwcl9jcml0KCJDUFUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBub24gaG9tb2dl
bmVvdXMgKGV4cGVjdGVkIGFsbCBlbXVsYXRlZClcbiIpOwotCQl3aGlsZSAodHJ1ZSkKLQkJCWNw
dV9yZWxheCgpOworCQlyZXR1cm4gLUVJTlZBTDsKIAl9CisKKwlyZXR1cm4gMDsKIH0KIAogYm9v
bCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCkBAIC02ODgs
NCArNjk3LDY2IEBAIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1
cyh2b2lkKQogewogCXJldHVybiBmYWxzZTsKIH0KK3N0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCit7CisJcmV0dXJu
IDA7Cit9CiAjZW5kaWYKKworI2lmZGVmIENPTkZJR19SSVNDVl9TQkkKKworc3RhdGljIGJvb2wg
bWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7CisKK3N0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlf
dW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUpCit7CisJaWYgKHNiaV9md2Z0X3NldChT
QklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgMSwgMCkgJiYKKwkgICAgbWlzYWxpZ25lZF90
cmFwc19kZWxlZ2F0ZWQpIHsKKwkJcHJfY3JpdCgiTWlzYWxpZ25lZCB0cmFwIGRlbGVnYXRpb24g
bm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBkZWxlZ2F0ZWQpIik7CisJCXJldHVybiAtRUlOVkFM
OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCB1bmFsaWduZWRfc2JpX3JlcXVl
c3RfZGVsZWdhdGlvbih2b2lkKQoreworCWludCByZXQ7CisKKwlyZXQgPSBzYmlfZndmdF9sb2Nh
bF9zZXQoU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsIDEsIDApOworCWlmIChyZXQpCisJ
CXJldHVybjsKKworCW1pc2FsaWduZWRfdHJhcHNfZGVsZWdhdGVkID0gdHJ1ZTsKKwlwcl9pbmZv
KCJTQkkgbWlzYWxpZ25lZCBhY2Nlc3MgZXhjZXB0aW9uIGRlbGVnYXRpb24gb2tcbiIpOworCS8q
CisJICogTm90ZSB0aGF0IHdlIGRvbid0IGhhdmUgdG8gdGFrZSBhbnkgc3BlY2lmaWMgYWN0aW9u
IGhlcmUsIGlmCisJICogdGhlIGRlbGVnYXRpb24gaXMgc3VjY2Vzc2Z1bCwgdGhlbgorCSAqIGNo
ZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoKSB3aWxsIHZlcmlmeSB0aGF0IGluZGVlZCB0
aGUKKwkgKiBwbGF0Zm9ybSB0cmFwcyBvbiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgorCSAqLworfQor
Cit2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKQoreworCWlmIChzYmlfcHJvYmVfZXh0
ZW5zaW9uKFNCSV9FWFRfRldGVCkgPiAwKQorCQl1bmFsaWduZWRfc2JpX3JlcXVlc3RfZGVsZWdh
dGlvbigpOworfQorI2Vsc2UKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpIHt9CisK
K3N0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBj
cHUgX19hbHdheXNfdW51c2VkKQoreworCXJldHVybiAwOworfQorI2VuZGlmCisKK2ludCBjcHVf
b25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQoreworCWludCBy
ZXQ7CisKKwlyZXQgPSBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0dXAoY3B1KTsKKwlpZiAo
cmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChjcHUpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2Fj
Y2Vzc19zcGVlZC5jCmluZGV4IDkxZjE4OWNmMTYxMS4uMmYzYWJhMDczMjk3IDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCkBAIC0xODgsMTMgKzE4OCwyMCBA
QCBhcmNoX2luaXRjYWxsX3N5bmMobG9ja19hbmRfc2V0X3VuYWxpZ25lZF9hY2Nlc3Nfc3RhdGlj
X2JyYW5jaCk7CiAKIHN0YXRpYyBpbnQgcmlzY3Zfb25saW5lX2NwdSh1bnNpZ25lZCBpbnQgY3B1
KQogeworCWludCByZXQ7CiAJc3RhdGljIHN0cnVjdCBwYWdlICpidWY7CiAKIAkvKiBXZSBhcmUg
YWxyZWFkeSBzZXQgc2luY2UgdGhlIGxhc3QgY2hlY2sgKi8KIAlpZiAocGVyX2NwdShtaXNhbGln
bmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFS
X1VOS05PV04pCiAJCWdvdG8gZXhpdDsKIAotCWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQoTlVMTCk7CisJcmV0ID0gY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQoY3B1KTsK
KwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSkgPT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9FTVVMQVRF
RCkKKwkJZ290byBleGl0OworCiAJYnVmID0gYWxsb2NfcGFnZXMoR0ZQX0tFUk5FTCwgTUlTQUxJ
R05FRF9CVUZGRVJfT1JERVIpOwogCWlmICghYnVmKSB7CiAJCXByX3dhcm4oIkFsbG9jYXRpb24g
ZmFpbHVyZSwgbm90IG1lYXN1cmluZyBtaXNhbGlnbmVkIHBlcmZvcm1hbmNlXG4iKTsKQEAgLTQw
Myw2ICs0MTAsOCBAQCBzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXMo
dm9pZCkKIHsKIAlib29sIGFsbF9jcHVzX2VtdWxhdGVkLCBhbGxfY3B1c192ZWNfdW5zdXBwb3J0
ZWQ7CiAKKwl1bmFsaWduZWRfYWNjZXNzX2luaXQoKTsKKwogCWFsbF9jcHVzX2VtdWxhdGVkID0g
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwogCWFsbF9jcHVzX3Zl
Y191bnN1cHBvcnRlZCA9IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2Fs
bF9jcHVzKCk7CiAKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
