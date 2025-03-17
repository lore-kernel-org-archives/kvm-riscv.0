Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32429C35FFB
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPNjhXGM7UAIleSnovKpAO/YrD5fhYuQebmCzhQyZZk=; b=Zc7+jsufRUirkK
	HuxkyspUkBFUkkC9ScxzCm25JnIMic6btAqlrO8wt+Sc2wOOh1TiOCURsbAyrXIIgD2WQwMQ9QzBT
	JajzBGif3PRxB5u6tHk78vQnw07lTamOH9ZmxlxB6tX0Pjl4paRRoJdsJ0AEArLwvrVW8dh3DkCIe
	bkFQhlI8nFwuHeCnirPp2iS078c3/iL0WLjIcHmlvegnSw5bRs5f9+v/A+Dnvam3WnDdgDRT3rsOX
	3mt9S7qsC50VnfBsumAoS5CbAgIBFK85vG6LKXtFyZizf+LPNVC52p6kxIBLLx2whGze/leZ8EwpZ
	u40sNZJfTeE0vCrdQUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gF-000000028wL-3tjG;
	Mon, 17 Mar 2025 10:26:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zw-0000000270w-0UXd
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3995ff6b066so691111f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206814; x=1742811614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iXowGTGBn1KzgCO/uIRhcWDCtcAcoXXG4ILg2vbKIM=;
        b=Rsy8iyJtkYcEKY0UB+vcxdE2hgjxDeKcb57GFy8Z68iM9qQM5reudd9nN7ryDRAV78
         eVYXPlDp0VlBJLlRXbBH9QtQ/sRDZb9BerOfmw42Lq67gCK8R6j5ac/dxfxl4JEE4/XY
         Au+y+xItn97+cpC04sjuygjzpddDSTqNec9nqh+tH1mjrKpzgGVEYfiwA+/piNiqL3xY
         9w8eGw/r9RS48DbsIUvG3IlsLvk2aQ/XQu0iPcp3/yLL056eP3cL6EhDkD32yB4AXxrh
         ksT9FXkVvRrubBfUm3BDM+GJ8cAq3RO8aa/lQmU7BF+7nUTtAh7NGgtwi/Kq0vvEneW8
         5naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206814; x=1742811614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iXowGTGBn1KzgCO/uIRhcWDCtcAcoXXG4ILg2vbKIM=;
        b=pLHcxZPMjHUHx2w+/ZnPztfm5nPrmJKVM/zvqIn/hyvY7ST6S5eLwNulaR0qsgwPXs
         q+LomoXuArrr3QviQ9B20SGpHwvp3ZrP1sCGBernCKIaagEjyimdqbevmhTa5tC2AsCh
         okBRETarvZktaiJU7006x7yP4FTamuNVCA/bGfww+WUvLsyidQTLuO+fzdbptAZPXs3d
         cPgHJXN5SH6qxbFwaW3gNgzLrA6r6uHDb94hbQ27HDEcVrYSdhtNsxARFP+TUFp3gtV6
         LKHkQ62aAQ/2wnQVT6NHQYQj41PjOUH5x1TUXiVHZxncS+dvQ06R9aqo4MzBunGLJbeg
         crfg==
X-Forwarded-Encrypted: i=1; AJvYcCVr6CetZRIgSWiB39Z9DTpRkSgBAVcK5poSeH2XXOGHTNUKbkOTMtrhctpv3zs0zyZv8QGcGMj7U1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWU/SAep6tulEhkj95xVhpZmoftPpdPDZyE1L3LMXW22N1zhGg
	A9/z+lu2/8aajPdb3iQsyUf8gVhzPpjm+NRdkkmao5BpueyFoMQghh1yDD+FBjQ=
X-Gm-Gg: ASbGnctnAuI3qB8+fKqbncTo8oFYdJ9XGH5f5N/su9Bg8WEqdv6O9uH8ozTE55ZA9n8
	Dd0RHH4IpIg6sQYWn24AYcGB0IVFtQExPZfn8onOp3jdCVLf4uttFA2gN7LRSfuZJvoqnomfVNP
	PBrCPhPCjs37lIik6h2pcUHYL47GgERuEhBk/t7ihmUTzyPpo+NXTfgciGPOyVgXGUxndDdY/kG
	KRezGmO/E3qonoU46KnJcgrgNnXdEkhoc1VmbFf3wgw0XIPbmsRNIddwnmdbfdP5aPCXMxRpdaK
	WDlpdfrpSPBAMXXldRDMcKhPYEUFk8BDlOKo21APFBE7uA==
X-Google-Smtp-Source: AGHT+IFPBYBDODlWslIoDz1PMoZSZvMRRrso5WGvECxXn2zkBH+2lcjxyx6qxUmwSqNHHoWv7qACfQ==
X-Received: by 2002:a5d:6da2:0:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39720966395mr12658005f8f.43.1742206814442;
        Mon, 17 Mar 2025 03:20:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v10 5/8] lib: riscv: add functions to get implementer ID and version
Date: Mon, 17 Mar 2025 11:19:51 +0100
Message-ID: <20250317101956.526834-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317101956.526834-1-cleger@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032016_159138_3EEE256E 
X-CRM114-Status: GOOD (  10.82  )
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

VGhlc2UgZnVuY3Rpb24gd2lsbCBiZSB1c2VkIGJ5IFNTRSB0ZXN0cyB0byBjaGVjayBmb3IgYSBz
cGVjaWZpYyBvcGVuc2JpCnZlcnNpb24uIHNiaV9pbXBsX2NoZWNrKCkgaXMgYW4gaGVscGVyIGFs
bG93aW5nIHRvIGNoZWNrIGZvciBhIHNwZWNpZmljClNCSSBpbXBsZW1lbnRvciB3aXRob3V0IG5l
ZWRpbmcgdG8gY2hlY2sgZm9yIHJldC5lcnJvci4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBsaWIvcmlzY3YvYXNtL3NiaS5oIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBsaWIvcmlzY3Yvc2JpLmMgICAgIHwgMTAg
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvbGliL3Jpc2N2L2FzbS9zYmkuaCBiL2xpYi9yaXNjdi9hc20vc2JpLmgKaW5kZXggMTk3Mjg4
YzcuLjA2YmNlYzE2IDEwMDY0NAotLS0gYS9saWIvcmlzY3YvYXNtL3NiaS5oCisrKyBiL2xpYi9y
aXNjdi9hc20vc2JpLmgKQEAgLTE4LDYgKzE4LDE5IEBACiAjZGVmaW5lIFNCSV9FUlJfSU8JCQkt
MTMKICNkZWZpbmUgU0JJX0VSUl9ERU5JRURfTE9DS0VECQktMTQKIAorI2RlZmluZSBTQklfSU1Q
TF9CQkwJCTAKKyNkZWZpbmUgU0JJX0lNUExfT1BFTlNCSQkxCisjZGVmaW5lIFNCSV9JTVBMX1hW
SVNPUgkJMgorI2RlZmluZSBTQklfSU1QTF9LVk0JCTMKKyNkZWZpbmUgU0JJX0lNUExfUlVTVFNC
SQk0CisjZGVmaW5lIFNCSV9JTVBMX0RJT1NJWAkJNQorI2RlZmluZSBTQklfSU1QTF9DT0ZGRVIJ
CTYKKyNkZWZpbmUgU0JJX0lNUExfWEVOIFByb2plY3QJNworI2RlZmluZSBTQklfSU1QTF9QT0xB
UkZJUkVfSFNTCTgKKyNkZWZpbmUgU0JJX0lNUExfQ09SRUJPT1QJOQorI2RlZmluZSBTQklfSU1Q
TF9PUkVCT09UCTEwCisjZGVmaW5lIFNCSV9JTVBMX0JIWVZFCQkxMQorCiAvKiBTQkkgc3BlYyB2
ZXJzaW9uIGZpZWxkcyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAj
ZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTEyMyw2ICsxMzYsMTAg
QEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHNiaV9ta192ZXJzaW9uKHVuc2lnbmVkIGxv
bmcgbWFqb3IsIHVuc2lnbmVkIGxvbmcgbWkKIAkJfCAobWlub3IgJiBTQklfU1BFQ19WRVJTSU9O
X01JTk9SX01BU0spOwogfQogCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgc2JpX2ltcGxf
b3BlbnNiaV9ta192ZXJzaW9uKHVuc2lnbmVkIGxvbmcgbWFqb3IsIHVuc2lnbmVkIGxvbmcgbWlu
b3IpCit7CisJcmV0dXJuICgobWFqb3IgPDwgMTYpIHwgKG1pbm9yKSk7Cit9CiAKIHN0cnVjdCBz
YmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwKIAkJ
CXVuc2lnbmVkIGxvbmcgYXJnMSwgdW5zaWduZWQgbG9uZyBhcmcyLApAQCAtMTM5LDcgKzE1Niwy
MCBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZW5kX2lwaV9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAq
bWFzayk7CiBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZW5kX2lwaV9icm9hZGNhc3Qodm9pZCk7CiBzdHJ1
Y3Qgc2JpcmV0IHNiaV9zZXRfdGltZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSk7CiBzdHJ1
Y3Qgc2JpcmV0IHNiaV9nZXRfc3BlY192ZXJzaW9uKHZvaWQpOworc3RydWN0IHNiaXJldCBzYmlf
Z2V0X2ltcF92ZXJzaW9uKHZvaWQpOworc3RydWN0IHNiaXJldCBzYmlfZ2V0X2ltcF9pZCh2b2lk
KTsKIGxvbmcgc2JpX3Byb2JlKGludCBleHQpOwogCitzdGF0aWMgaW5saW5lIGJvb2wgc2JpX2No
ZWNrX2ltcGwodW5zaWduZWQgbG9uZyBpbXBsKQoreworCXN0cnVjdCBzYmlyZXQgcmV0OworCisJ
cmV0ID0gc2JpX2dldF9pbXBfaWQoKTsKKwlpZiAocmV0LmVycm9yKQorCQlyZXR1cm4gZmFsc2U7
CisKKwlyZXR1cm4gcmV0LnZhbHVlID09IGltcGw7Cit9CisKICNlbmRpZiAvKiAhX19BU1NFTUJM
RVJfXyAqLwogI2VuZGlmIC8qIF9BU01SSVNDVl9TQklfSF8gKi8KZGlmZiAtLWdpdCBhL2xpYi9y
aXNjdi9zYmkuYyBiL2xpYi9yaXNjdi9zYmkuYwppbmRleCAzYzM5NWNmZi4uOWNiNTc1N2UgMTAw
NjQ0Ci0tLSBhL2xpYi9yaXNjdi9zYmkuYworKysgYi9saWIvcmlzY3Yvc2JpLmMKQEAgLTEwNyw2
ICsxMDcsMTYgQEAgc3RydWN0IHNiaXJldCBzYmlfc2V0X3RpbWVyKHVuc2lnbmVkIGxvbmcgc3Rp
bWVfdmFsdWUpCiAJcmV0dXJuIHNiaV9lY2FsbChTQklfRVhUX1RJTUUsIFNCSV9FWFRfVElNRV9T
RVRfVElNRVIsIHN0aW1lX3ZhbHVlLCAwLCAwLCAwLCAwLCAwKTsKIH0KIAorc3RydWN0IHNiaXJl
dCBzYmlfZ2V0X2ltcF92ZXJzaW9uKHZvaWQpCit7CisJcmV0dXJuIHNiaV9lY2FsbChTQklfRVhU
X0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfSU1QX1ZFUlNJT04sIDAsIDAsIDAsIDAsIDAsIDApOwor
fQorCitzdHJ1Y3Qgc2JpcmV0IHNiaV9nZXRfaW1wX2lkKHZvaWQpCit7CisJcmV0dXJuIHNiaV9l
Y2FsbChTQklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfSU1QX0lELCAwLCAwLCAwLCAwLCAw
LCAwKTsKK30KKwogc3RydWN0IHNiaXJldCBzYmlfZ2V0X3NwZWNfdmVyc2lvbih2b2lkKQogewog
CXJldHVybiBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfR0VUX1NQRUNfVkVS
U0lPTiwgMCwgMCwgMCwgMCwgMCwgMCk7Ci0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
