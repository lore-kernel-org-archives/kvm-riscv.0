Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044AC3ABDD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viPg7vEowet7Fw3ZRvoA9dM/uUh2cdhsgXe23PycXKE=; b=rImpRdY/4ighxI
	tJ4uLxM32DdakoXcZhb4vV6OYOL9wx53pvO2fo5w3SWj9XqsFm0qe2lag8sXyAjBvvstpuiyXCPIj
	VHlL4wZuwMECw7ZvLrkGSCTtiN95fxVTbZaVOV1e9HFFKIbuZWyKFzQW6iqy1rcDR9i0z1uUDBp06
	Lh+DGT5fakiuYYYtM6/di7Uaw0Im3ITsI4oHeujSaElJJMb8/jlUA3cwB56XKJ0C6vuXvQFwfpX9k
	J+ztsQJ3+YRbWRWUrwcFzOfuVSP+H9guHIdAE4luN7/YjrgeLQfmmoVfUOiRAKP16+IDDWfJ1FFUf
	j53CXSHkANfbk/LR+A2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyG-0000000HXoL-1bcd;
	Thu, 15 May 2025 08:29:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsg-0000000HVk6-0v01
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a0be321968so326410f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297432; x=1747902232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=ONEdG7eWS21YmAmUEEDiwyrV97/appiwy5qr3GccyI8cSzwCfXS21F+68hDa9GBbIv
         9j0qDgTGLqlBSwBOYiClKMFtCEu6+12KxTw5p0uR2wux4o4YIT/t1v9vCAOZhUIeDOtY
         kbDoH00oKnnRIzjExoixVIKgTdKZkNaxlFVfp8kWHKIFP35HHStTxMVJzvGjCM5Ls/qM
         +xeVRV3q0F2lTwbpcjvvsl9bA/+xqhLAOxdS2npeXiDo1LzJ2B50/mz1fEo7BZX+lZEe
         b+RBIBzxAGSGertZsZqGYHzwkXFC+XZMS2y95kf1LsOOOaPg274d517gkwxaPuJqHisx
         1wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297432; x=1747902232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=eoVSLnKc5pCrUi4u+wf6+FIdrBFcpOr7EcbtAH3rE4LVw2nhkGv6239fMeH3s70QRJ
         WX+rtbw9tccc+y4i+bsNKdCqjoC2o+oOif1inIrcqRBpkI2068CmZIxkoC1szrjR57yE
         S6cQrXaBS4Lt30ZsI2pLcyO7MCt22rqj7OQifNZAl2dxm/Gj2oHO04DQWFs2JphgkTNr
         Ug/v9sDM4o5FCt5zBHSlG1MidfY6aPGRNsisL6k2rIlXMoJHVK3+j6FnUopoK9Cev7Z5
         17UOCzxAv+2lqIdlfp4ZazdAqaRVyTYbp6K755YUpwT7rR63ylqknWnwdOfhodwEep2R
         uLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVxYnl2AS7PgAWUnD7mG7excjXsUom21L6qPYOTXGTGvqYy0f152R/ucNG6fTcfdh1XjGzz/KqjR28=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdcYkFE+NYz8HwUMa4Cl/5RKH+GKaphNb/JaXM/hhvSk/4dtPU
	miFM1VIG90rBMRfwLtksunrYcnKKiirUpLmro/dw0mwwDAYCJNKTJY3obNb9fVw=
X-Gm-Gg: ASbGncskYzI972JLZiyU3WVs4EQrWqzSYdmwgqXkc9jiqw8vsgw0p/xdcYVwwizGwi8
	Fnn4GtQPmypqSf79QpOCes977R/yIrvg/b9gC3/uR0rE2wGX2Uy1RHbEPrFC2659ibBx9x+rMe8
	RLGhDljMrSufhr/ct3hO2fowL5KBjProCQniIq/M796PhliN6FDQSoKEuEjJwtqEOSZmFctGtT4
	0uciXLDEWlsPaG/5D8jap9SmLHGGoTfl0bJf+2YEPfje53RJkmwGofKQYthLn1IItB8FyPizwPi
	Bx4KQ7/XF8Af34HwkZnxEDBVtQCnQdPzK/UwjUxTS8HVa6QQG8WgXnahqw05Pg==
X-Google-Smtp-Source: AGHT+IG/sxfuxXzoVLJQzgwnpP2BoJhjD/oKnctxBNP0O5v4fRD4OfvNOZerKN94X8y7ctt3mQZ17w==
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id ffacd0b85a97d-3a349694ac7mr5405960f8f.7.1747297432412;
        Thu, 15 May 2025 01:23:52 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 15 May 2025 10:22:08 +0200
Message-ID: <20250515082217.433227-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012354_264134_CD2AE6AF 
X-CRM114-Status: GOOD (  11.97  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCA1OTJiMWEyOGU4OTcuLjM0YjRhNGU5ZGZjYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtNjI3LDYgKzYyNywxMCBAQCBib29sIF9faW5pdCBjaGVja192ZWN0b3JfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCWludCBjcHU7CiAKKwkv
KgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVsZV9vbl9l
YWNoX2NwdSgpIGlzIHVzZWQgc2luY2UKKwkgKiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0
cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpCisJICovCiAJc2NoZWR1bGVf
b25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQpOwogCiAJ
Zm9yX2VhY2hfb25saW5lX2NwdShjcHUpCkBAIC02NDcsNyArNjUxLDcgQEAgYm9vbCBfX2luaXQg
Y2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAog
c3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi1zdGF0aWMgdm9pZCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBf
X2Fsd2F5c191bnVzZWQpCitzdGF0aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHZvaWQgKmFyZyBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNz
X3NwZWVkLCBjcHUpOwpAQCAtNjg4LDcgKzY5Miw3IEBAIGJvb2wgX19pbml0IGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRl
ZCBzaW5jZSB0YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAq
IENQVS4KIAkgKi8KLQlzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKTsKKwlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
LCBOVUxMLCAxKTsKIAogCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdSht
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
