Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA058E7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQ+I+zk2BF+KeClwa3Y01ZKSxupzqppF57/Vt2DycqU=; b=xhQLh+9Ae1jsTY
	FbMLNS5Cd4Wn+IRuXu2oCwfYTqq4aw74MHLQ7+mUUxpphham6/zphW5rsaaHexcmANf6x2xzFqgrH
	KN3CJKQktcqxHOep432TTumJQ1j7gV4PnzWdspPOgXeJBa0EOUCunKxyhuhXW7m8R5/2nLKmVKhEB
	Ur+rOfENg3xOHWzKs7Vh+WDemi2T1c4QkAPsFBxRB89vSEzbVsDEuFSRnw0nOQPPTFowR2pzfnXKa
	CJQMf0SDR2tNMdlIPzB2gUD6yt/RFL/l2AthlTuNr2IZsX6wawjv0+JJ24xKV3CDFpV7OTyKe8Oka
	ApY9tMFR0Tcl1SrlVCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmL-0000000Ebli-2Rmn;
	Fri, 10 Jan 2025 08:54:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmJ-0000000Ebju-1UVH
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:54:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so13560025e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736499241; x=1737104041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnQmGsKLsnozl47n9RC0c9EPtHIieYibLLb9vAA7tl4=;
        b=YsWktbxZE0j5sXSqDulTl2/PojfjeIIB51txZkOspvuIAk7n6gHo9GLbNZUfsFA9Yg
         ANMC6tV4tk0+FuVEVD+908J/Uneuq7GT8AmhfRGjJNbQYVdiG3E5ru+qTSg5E3e5hzRI
         3yPzA32hCprhtzH3OO8PAXS5JeTDKoLN7fngaSCtGynv5OSL780DdyNdGfb27+oeU8I8
         Hpg0i+d2H1eAtqfbsY24UtP819TzRme94y5Jp2ffzS+7QcYpQjy1RTzqHuBde4a6muQM
         AKhixXD2nILtT1w5vQvjZM+3bGdZEtr4QpMFXd0ihkMGBguWDBiTFkuiWQ5vdm9+pajT
         NtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499241; x=1737104041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnQmGsKLsnozl47n9RC0c9EPtHIieYibLLb9vAA7tl4=;
        b=YLB2joCNh2owVf7Iy/RRr4zc/hVb/jp6WXkRtBgXS2D3YizVdDTrZCH0uBKS4k/WtH
         Js1AS4WA/PaEroXsCgH77fCGbaEFw/zw/DJ+08gtyd6+1DXBv9b6JtcjVBqbd7mpC6Z8
         5d2YAOdLBa1sQgSfQOkivHVscuTn8IzfrTGTpW/Ip0XgxB1Mo30OM0TNW0M5WB8L+ki9
         R+oN4rr4MSWgr7JkoO2KhjOzOofHfU5nnnXCx9AFk4U1sr7JlpZt+11Lkne7rv+c/uYD
         ZyTgRy/TE3sL0ho0hvVQTlFJih74LjuwvfPsvjrrh1kH/daoM0W9yhKYXbHaP/CsHqd0
         /yXw==
X-Forwarded-Encrypted: i=1; AJvYcCVsWkAq0zJwenC9LaR6TDTFFvYgnJnB0s7u35LuQDuo8xLCPBfSM0zFkUTpKS7xu6Tp88EzcNJd1Qw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDDhceQzQbsYs2ky0v/91Ahe9QBXPPuRywjjSpxn9awUwBTJIK
	rx8YsX+Ing6l2Fr7RCOaOR6klNqNEJwDC2CJ1kjyxLHNEKsHi5h8Gki9xW/OqdZUUVV6c3pAKac
	u
X-Gm-Gg: ASbGncsYFusLY3JEwOJb77BSyW6Qhoq1lK+xImbngpmvDf6Mf8AkgVBgbL1Gg9FVLXF
	yI3x46fRWLf8vMIWhXD475guwWCCoGcwLHj2hV5tiPjgm2EGCFmWRDAtfRYDRAnvT76K3qB4+j7
	pIyNIbulQRjm1DOaFQUb8orCMqs0Kgg7vbYxVOE9VSCZogRvvXPwMs859uUn3v5ceaifwqToZxZ
	NWe3Bhnhu4eKi7Yg1CtR/EDcnhEAyQFWUpdTKa6tIu3c/LUsQXTTj/GMQ==
X-Google-Smtp-Source: AGHT+IHSp7thkaO0ix4+jtdZrrUsOh51aI7hC2kJTrlaApqKho08Ju5UKyE6qqhDE4L/4LmleDyhNw==
X-Received: by 2002:a05:600c:a01:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-436e269715amr91208755e9.13.1736499241614;
        Fri, 10 Jan 2025 00:54:01 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm4009283f8f.94.2025.01.10.00.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:54:00 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v5 2/5] riscv: use asm-offsets to generate SBI_EXT_HSM values
Date: Fri, 10 Jan 2025 09:51:15 +0100
Message-ID: <20250110085120.2643853-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110085120.2643853-1-cleger@rivosinc.com>
References: <20250110085120.2643853-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_005403_392369_B51017C3 
X-CRM114-Status: GOOD (  13.90  )
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

UmVwbGFjZSBoYXJkY29kZWQgdmFsdWVzIHdpdGggZ2VuZXJhdGVkIG9uZXMgdXNpbmcgc2JpLWFz
bS1vZmZzZXQuIFRoaXMKYWxsb3dzIHRvIGRpcmVjdGx5IHVzZSBBU01fU0JJX0VYVF9IU00gYW5k
IEFTTV9TQklfRVhUX0hTTV9TVE9QIGluCmFzc2VtYmx5LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIHJpc2N2L01ha2VmaWxlICAgICAg
ICAgIHwgIDIgKy0KIHJpc2N2L3NiaS1hc20uUyAgICAgICAgIHwgIDYgKysrKy0tCiByaXNjdi9z
YmktYXNtLW9mZnNldHMuYyB8IDEyICsrKysrKysrKysrKwogcmlzY3YvLmdpdGlnbm9yZSAgICAg
ICAgfCAgMSArCiA0IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yvc2JpLWFzbS1vZmZzZXRzLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCByaXNjdi8uZ2l0aWdub3JlCgpkaWZmIC0tZ2l0IGEvcmlzY3YvTWFrZWZpbGUg
Yi9yaXNjdi9NYWtlZmlsZQppbmRleCAyOGIwNDE1Ni4uYWY1ZWU0OTUgMTAwNjQ0Ci0tLSBhL3Jp
c2N2L01ha2VmaWxlCisrKyBiL3Jpc2N2L01ha2VmaWxlCkBAIC04Niw3ICs4Niw3IEBAIENGTEFH
UyArPSAtZmZyZWVzdGFuZGluZwogQ0ZMQUdTICs9IC1PMgogQ0ZMQUdTICs9IC1JICQoU1JDRElS
KS9saWIgLUkgJChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgog
Ci1hc20tb2Zmc2V0cyA9IGxpYi9yaXNjdi9hc20tb2Zmc2V0cy5oCithc20tb2Zmc2V0cyA9IGxp
Yi9yaXNjdi9hc20tb2Zmc2V0cy5oIHJpc2N2L3NiaS1hc20tb2Zmc2V0cy5oCiBpbmNsdWRlICQo
U1JDRElSKS9zY3JpcHRzL2FzbS1vZmZzZXRzLm1hawogCiAlLmF1eC5vOiAkKFNSQ0RJUikvbGli
L2F1eGluZm8uYwpkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLWFzbS5TIGIvcmlzY3Yvc2JpLWFzbS5T
CmluZGV4IDkyM2MyY2VjLi5iOWMyNjk2ZiAxMDA2NDQKLS0tIGEvcmlzY3Yvc2JpLWFzbS5TCisr
KyBiL3Jpc2N2L3NiaS1hc20uUwpAQCAtNyw2ICs3LDggQEAKICNkZWZpbmUgX19BU1NFTUJMWV9f
CiAjaW5jbHVkZSA8YXNtL2FzbS5oPgogI2luY2x1ZGUgPGFzbS9jc3IuaD4KKyNpbmNsdWRlIDxh
c20vYXNtLW9mZnNldHMuaD4KKyNpbmNsdWRlIDxnZW5lcmF0ZWQvc2JpLWFzbS1vZmZzZXRzLmg+
CiAKICNpbmNsdWRlICJzYmktdGVzdHMuaCIKIApAQCAtNTgsOCArNjAsOCBAQCBzYmlfaHNtX2No
ZWNrOgogNzoJbGIJdDAsIDAodDEpCiAJcGF1c2UKIAliZXF6CXQwLCA3YgotCWxpCWE3LCAweDQ4
NTM0ZAkvKiBTQklfRVhUX0hTTSAqLwotCWxpCWE2LCAxCQkvKiBTQklfRVhUX0hTTV9IQVJUX1NU
T1AgKi8KKwlsaQlhNywgQVNNX1NCSV9FWFRfSFNNCisJbGkJYTYsIEFTTV9TQklfRVhUX0hTTV9I
QVJUX1NUT1AKIAllY2FsbAogODoJcGF1c2UKIAlqCThiCmRpZmYgLS1naXQgYS9yaXNjdi9zYmkt
YXNtLW9mZnNldHMuYyBiL3Jpc2N2L3NiaS1hc20tb2Zmc2V0cy5jCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwLi4xMTZmZTQ5NwotLS0gL2Rldi9udWxsCisrKyBiL3Jpc2N2L3Ni
aS1hc20tb2Zmc2V0cy5jCkBAIC0wLDAgKzEsMTIgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkKKyNpbmNsdWRlIDxrYnVpbGQuaD4KKyNpbmNsdWRlIDxhc20vc2Jp
Lmg+CisjaW5jbHVkZSAic2JpLXRlc3RzLmgiCisKK2ludCBtYWluKHZvaWQpCit7CisJREVGSU5F
KEFTTV9TQklfRVhUX0hTTSwgU0JJX0VYVF9IU00pOworCURFRklORShBU01fU0JJX0VYVF9IU01f
SEFSVF9TVE9QLCBTQklfRVhUX0hTTV9IQVJUX1NUT1ApOworCisJcmV0dXJuIDA7Cit9CmRpZmYg
LS1naXQgYS9yaXNjdi8uZ2l0aWdub3JlIGIvcmlzY3YvLmdpdGlnbm9yZQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMC4uMGE4YzVhMzYKLS0tIC9kZXYvbnVsbAorKysgYi9yaXNj
di8uZ2l0aWdub3JlCkBAIC0wLDAgKzEgQEAKKy8qLWFzbS1vZmZzZXRzLltoc10KLS0gCjIuNDcu
MQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
