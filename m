Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B1E7719D
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQ+I+zk2BF+KeClwa3Y01ZKSxupzqppF57/Vt2DycqU=; b=HPFHGeGo/Gge3G
	2WeRlEqko+qk/4ZIBv3NAL8G7XIhFCR73DPBwzhrRZS+sMe6yrbAvXJj8tKcBbYptpyjmlPjBBvYG
	A2zUOKLqLxLzYHr5NA5dCF211I32skjR2OPjrwvePJ0/XOGm60zD1WHFVXBGTQoSe5mQWDVMktuuf
	d56pk1tQnkxp/IHo5z6G6MY6lHbGK+pj51Xl8riElpuHEX4wKkNnUzFBjHcBZq1T090dyRNPBZM+B
	iIN50F5d6Q11VgVoDt/ExyCCnZo3CsEUI9UUslAY4jthB38PndeOk8dET62n5HhEbu+5z1NdozQfe
	6DfFChx5c4MwfXv8krvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCws-0000000F4Yt-0D1Q;
	Fri, 10 Jan 2025 11:13:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwp-0000000F4Wb-1fy7
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:13:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385eed29d17so1034913f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 03:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736507582; x=1737112382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnQmGsKLsnozl47n9RC0c9EPtHIieYibLLb9vAA7tl4=;
        b=G9Ha+ihQeZdFu09faDuuSGL2p+NrIJBPKS0CzNWfhylMnzKFF9fpt3zAzlUkFFlFI4
         CTVdLvku6pCPd8N38GBQ3GeCUb0IbzoVzRtxHi6Aypm+x7Rb0+8ENhisIUvWE9MDWfHa
         mu3+oPgsa8wHRljYDWKVdFntWG2LoAXzW9ohTiHzIOQi1OCGmX9utIGy1Ardrks7elDb
         I8XQqStHMCN/zf69MtVCnUDMtEDLL6oUJZdLn+Ke9sEKOycW0MuAjNu+MjeSqihcPMzw
         MGM7//5qihaGhCwPOLeoOyjAQnJ1SqY9tAaI1itSbSwzo+PinQe9//yzCe9EA/UpeI96
         gCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507582; x=1737112382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnQmGsKLsnozl47n9RC0c9EPtHIieYibLLb9vAA7tl4=;
        b=usAw/G37j+KTTMwVLS98X7eqHnuLICnh3S5cWIXJQijbmhdrM57tSxXFLa5q+HwuZv
         vje0O05YDzC7atRG1uVx8HM0CxdU++hSBVvwMiNY5Nl3xNyu4L8+O3GpRmdFT1RDJ0cK
         jiAD1bXwtdr3nYM47iDWMRGE31TVvjNcl0NTqinX7CeLQvpjVQPXVpuXqK5g6BOu+zYe
         m+5H9LDKGRd32cVuVBQQbiGKARo16JJpIc+8W22D4ki6O4PudGCIYHa9SELEju/eI/fx
         EOt47AXUt+UkBFUHBmmfeNaWq4kvznUTFUHfcMf0wzce30cI/zkX3JL3K7UHvH3G9B7L
         iO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYf4tCrbtE7O/okbR8UwT0Ij9Lhiz7w8BMml3MOkFStjty1oKdUBM/LrnQeF1abkOIb14bBpK6IDQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDm2API6AnimRX/FE73TJkO6InysN7DQ/isQJPo4077JM3SfOX
	4P1Rbycopa+8Q1fWrg7fI677Rfx7rYC8Q08x2K5PY7G8x7g0sBqjWCwlNzZGkMA=
X-Gm-Gg: ASbGncvWXLV6Fh6q+A358Ym9H+GM2zSEcvYrWqrGeDt+5GrRDeoQ835Axgy52s031FT
	tbvuuwg2b5z6YkW6JQIztiaM9TN0pc5r/RqjdqTrW57jOlS4NctGbCsKtIzRSoVabe0X7CyW5Gd
	dQP2PVREKjwestgYYWB7WK2/Q+ma3AO44qS+zx+NRst6poZOau2cXs43sIpLrLDnR80jdZuhVAo
	MuDm4nRlKZu1zWyxEGVhN6LdOYZThnbILcli50+5qhGJ12k+ZGu2X8O7A==
X-Google-Smtp-Source: AGHT+IEkbkFNmBm09O9HVeA7LH4p17JRlfw9wDP8tSTFQSoyf7fVaPj+wmIidUmNeqtb4Qih6vmYAg==
X-Received: by 2002:a5d:5848:0:b0:386:3dad:8147 with SMTP id ffacd0b85a97d-38a8731c975mr8448524f8f.32.1736507581952;
        Fri, 10 Jan 2025 03:13:01 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm4344459f8f.50.2025.01.10.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:13:01 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v6 2/5] riscv: use asm-offsets to generate SBI_EXT_HSM values
Date: Fri, 10 Jan 2025 12:12:41 +0100
Message-ID: <20250110111247.2963146-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110111247.2963146-1-cleger@rivosinc.com>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031303_429427_C58192BF 
X-CRM114-Status: GOOD (  14.08  )
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
