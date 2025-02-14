Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84190C021A7
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvULgldNaP3gHpsfg7pdLqtwy0XhIrj0Kx3S+tadrfM=; b=vypzTICDY/KEGA
	mpR4BZJJQmLySmgsGyQcQDvHz3y/NsKc3XabyF0ox1oFQp717EQFp1CcQe991l95dG6ok4VEbqxTH
	ZMVp+BArW++Oy8P/4m+qEnKs0Nu3t1p/jHtiFobJPE8Oi79DCGCJxPuK0nyoD81L+roxkl8XBNG8e
	+DHlhcZNrBOjtGtLFdVIxAuyErxCUIYmi+VWCIYbb0ncm7PFoXXD4el94CfUBNSDU1WNbTlBsf2FL
	Vu4D3gOiYtIQIDQUKmEak3KbbTOU3onZLf6Ms+aAnyS8ujKy1QFVyDhZ6quLeYi+5VEbCsySfP1xT
	SCB1mvXcnP/HvTnFrC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuEh-0000000Ekao-15a5;
	Fri, 14 Feb 2025 11:51:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiu80-0000000Ej0C-3BHv
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:45:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso3002511a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739533504; x=1740138304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnpsu3rpbhtzK9fRBX2NuscB3adm2w2G1CT7Bnabr1k=;
        b=UvPa4jxaTCCASWWiypiC5MF0gPzgRihwlup8GGWBbdXa98G+881SRlkQPUPO5GlOLo
         LohKwAhPxLMRGBcFQbTiTuSyxfUqLRyx7EBFa1EY2gw+Tmjp2nncT9LdJiR8opskHX7r
         eGgPH7t2zycarTDkSyFyQY8XCvqsxoMpd3g4+F0BLL19aCVa5hhA4F/WE2mLxgpHGktI
         dPZpuGegFskoWGiXnDUjzKuNXw5PJGhQ+7FPWMzefk/TBAS/w6xK40ImEoIu0ZqtV5ro
         KT0HiBVTH71xJW97fAnG0Yy3BKdYEv20SLT+yjDmfaDijxE7wnJIGvHbFZEqMNMcFHfz
         +4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739533504; x=1740138304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnpsu3rpbhtzK9fRBX2NuscB3adm2w2G1CT7Bnabr1k=;
        b=q/x1jiqR3FMW05xxg2v05u2WQ5eN2XUIvEghmIEw7j8KjoSWbxCxgEAyEhhKq8H4uI
         Dr+wPIVhOSrY8XcD3Qe+1BoVo8ebLA4n+9EocnnD/3jFIUC6kZQGpa7835ee4FBm4QZf
         0zvbz8cVUazvY3U0bmarAMvu4tq6vnMKC2mubC/YjS27h12N6i5w4/oltAdOdl46HfQH
         bqgz6ZibG+hmrTCErpB+QZmKySsOZb19/kHYDEsOTxeSPJBgX921/PAhxXKBUw9HbXqi
         wgYfY5IjgUV3qCzXpN3qUcWDEPXlrXQN41T5rV9Tuo0FDxgDNIi5qZjFKak2TJS4Wv54
         6ASg==
X-Forwarded-Encrypted: i=1; AJvYcCXEkm1AcOQNvAceYaqdLV4OtH/xMdEuYnkKJjiiPowmDcpPUzoO9PKqoB5fqlrSRPk7DtCz64jSX5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNtbphSayj8te8YZq4nFuENGTNTkJ9oLRUttd+3Y58wtjW2lQ5
	WQzH52sHwA5rj+NHJhqKmGF9eUonHXokJ9+PVJitcQronrNRr9HXmEtHhL+Gd8E=
X-Gm-Gg: ASbGncth3/MNjuOdYFfCmzxWwKAeKWm+hIcFxGIuF/0WWPWjoP8TAZut2j7z+L7xiti
	58yYrC4Xu6R8LgkEQiaVZmFP+71WdYvEn15no8gf1cGOVlk50bYau90yWzf6mceilznI4o2A+R8
	TAKfsIETlmtYdUN78f+zof0zH3Ox6FiQ0b2GD7txF0J3+7OxwmCJM5P1eDkpbvsJdb4l6o0kjnf
	fpmk+LXF8YIFEC0+NHwTiaUUuiJmbZvPIqh/bJ571wrSzcePDizPB8dfRbqFQ1/MXZayIhlngGb
	ErF0UK8N9oBSgGAH
X-Google-Smtp-Source: AGHT+IHYqW+LJNTSPKwDmeiUyv2ngUOWTNa0uKhxLL7k8MS4eH7mOePBRxvn5882RLh1iBoh21bgZQ==
X-Received: by 2002:a17:90b:4a42:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2fc0fbf8185mr10461571a91.5.1739533503377;
        Fri, 14 Feb 2025 03:45:03 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f6965sm4948862a91.29.2025.02.14.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:45:02 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v7 3/6] riscv: Use asm-offsets to generate SBI_EXT_HSM values
Date: Fri, 14 Feb 2025 12:44:16 +0100
Message-ID: <20250214114423.1071621-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250214114423.1071621-1-cleger@rivosinc.com>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_034504_803201_8F2C8D2F 
X-CRM114-Status: GOOD (  13.21  )
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
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVz
IDxhbmRyZXcuam9uZXNAbGludXguZGV2PgotLS0KIHJpc2N2L01ha2VmaWxlICAgICAgICAgIHwg
IDIgKy0KIHJpc2N2L3NiaS1hc20uUyAgICAgICAgIHwgIDYgKysrKy0tCiByaXNjdi9zYmktYXNt
LW9mZnNldHMuYyB8IDExICsrKysrKysrKysrCiByaXNjdi8uZ2l0aWdub3JlICAgICAgICB8ICAx
ICsKIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IHJpc2N2Ly5naXRpZ25vcmUKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2
L01ha2VmaWxlCmluZGV4IGFlOWNmMDJhLi4wMmQyYWMzOSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFr
ZWZpbGUKKysrIGIvcmlzY3YvTWFrZWZpbGUKQEAgLTg3LDcgKzg3LDcgQEAgQ0ZMQUdTICs9IC1m
ZnJlZXN0YW5kaW5nCiBDRkxBR1MgKz0gLU8yCiBDRkxBR1MgKz0gLUkgJChTUkNESVIpL2xpYiAt
SSAkKFNSQ0RJUikvbGliL2xpYmZkdCAtSSBsaWIgLUkgJChTUkNESVIpL3Jpc2N2CiAKLWFzbS1v
ZmZzZXRzID0gbGliL3Jpc2N2L2FzbS1vZmZzZXRzLmgKK2FzbS1vZmZzZXRzID0gbGliL3Jpc2N2
L2FzbS1vZmZzZXRzLmggcmlzY3Yvc2JpLWFzbS1vZmZzZXRzLmgKIGluY2x1ZGUgJChTUkNESVIp
L3NjcmlwdHMvYXNtLW9mZnNldHMubWFrCiAKIC5QUkVDSU9VUzogJS5hdXgubwpkaWZmIC0tZ2l0
IGEvcmlzY3Yvc2JpLWFzbS5TIGIvcmlzY3Yvc2JpLWFzbS5TCmluZGV4IDkyM2MyY2VjLi5iOWMy
Njk2ZiAxMDA2NDQKLS0tIGEvcmlzY3Yvc2JpLWFzbS5TCisrKyBiL3Jpc2N2L3NiaS1hc20uUwpA
QCAtNyw2ICs3LDggQEAKICNkZWZpbmUgX19BU1NFTUJMWV9fCiAjaW5jbHVkZSA8YXNtL2FzbS5o
PgogI2luY2x1ZGUgPGFzbS9jc3IuaD4KKyNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KKyNp
bmNsdWRlIDxnZW5lcmF0ZWQvc2JpLWFzbS1vZmZzZXRzLmg+CiAKICNpbmNsdWRlICJzYmktdGVz
dHMuaCIKIApAQCAtNTgsOCArNjAsOCBAQCBzYmlfaHNtX2NoZWNrOgogNzoJbGIJdDAsIDAodDEp
CiAJcGF1c2UKIAliZXF6CXQwLCA3YgotCWxpCWE3LCAweDQ4NTM0ZAkvKiBTQklfRVhUX0hTTSAq
LwotCWxpCWE2LCAxCQkvKiBTQklfRVhUX0hTTV9IQVJUX1NUT1AgKi8KKwlsaQlhNywgQVNNX1NC
SV9FWFRfSFNNCisJbGkJYTYsIEFTTV9TQklfRVhUX0hTTV9IQVJUX1NUT1AKIAllY2FsbAogODoJ
cGF1c2UKIAlqCThiCmRpZmYgLS1naXQgYS9yaXNjdi9zYmktYXNtLW9mZnNldHMuYyBiL3Jpc2N2
L3NiaS1hc20tb2Zmc2V0cy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwLi5i
ZDM3YjZhMgotLS0gL2Rldi9udWxsCisrKyBiL3Jpc2N2L3NiaS1hc20tb2Zmc2V0cy5jCkBAIC0w
LDAgKzEsMTEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKyNp
bmNsdWRlIDxrYnVpbGQuaD4KKyNpbmNsdWRlIDxhc20vc2JpLmg+CisKK2ludCBtYWluKHZvaWQp
Cit7CisJREVGSU5FKEFTTV9TQklfRVhUX0hTTSwgU0JJX0VYVF9IU00pOworCURFRklORShBU01f
U0JJX0VYVF9IU01fSEFSVF9TVE9QLCBTQklfRVhUX0hTTV9IQVJUX1NUT1ApOworCisJcmV0dXJu
IDA7Cit9CmRpZmYgLS1naXQgYS9yaXNjdi8uZ2l0aWdub3JlIGIvcmlzY3YvLmdpdGlnbm9yZQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uMGE4YzVhMzYKLS0tIC9kZXYvbnVs
bAorKysgYi9yaXNjdi8uZ2l0aWdub3JlCkBAIC0wLDAgKzEgQEAKKy8qLWFzbS1vZmZzZXRzLlto
c10KLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
