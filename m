Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DDEC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyLsqCrKhEcFRT2xFEhDmFaz9ZgV1p3bmk57+KKAe18=; b=QiMpkJxDeGq53H
	Ns/CgGdphdNTYj3Hl1PspKjWgB/CqsF+sKymvD1Q2q98mS3R0/I2DR6xxFvJ14kxM2txCuwhFNWyd
	GeWtyzXrPrp6ejF6aTNg4spr3QXDX7z9PFaNYlm43SdSK7KgDlPhjcxuf8PpJpkog+Mur/cU0VU3f
	mqglx6bMfVzJ77kCojqzjb9Z2zKGqwzUZd9xZhuB243v+2Pv2rre7/F1nuTwqGqdR1uRx2Q4Ttet2
	GnPcXqxqmuBA7gRrsrgKoT0qshXVdx0Y77WR5UUsNWgusjJ06D4987ORZimC5FzpEVhwVbzHPN1gt
	HKI6uiALmF0nl5On8l3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRfL-00000003p15-3Y56;
	Fri, 23 May 2025 12:38:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPYQ-00000003aRV-1vBS
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:23:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso8607594b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995785; x=1748600585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jL4iC9TbsUd0FaNofW/nJkV1WGoug0A9XRZElPbt0BQ=;
        b=fA3/6vJz805lqf6W7+YkLm5giIW/YScOZkdPdaUW7UAC2tKwhGgdOmtpSGjjuSPNRN
         82CZScyymUoVKAGutgCrjH8dabnHwwATcElbSvGB5Y0yvOPpSxfklgloVgdp2xRo/24U
         wrWdA0fbOtQjNidMYii6LSwTP66AbyWe2RUhWQCXXMUYl51xbOwFoJDQBbHG1dKpddSS
         efUxj2cM1Dc13O8OtI5b+pAp1Y5zRHhlPM9Uoc0KO6q4tkJX1zoCwGFjUSqejqcLQ9pg
         skG0fd2Qx5ZKxStiQJaqJT/Tpq1XkWC9raQBWOoFPO40LvP1C0yv4cwhVwp460kDLKYK
         r6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995785; x=1748600585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL4iC9TbsUd0FaNofW/nJkV1WGoug0A9XRZElPbt0BQ=;
        b=ux8CvzfAY8LtW2W47+MEx8qW7KHSWsVkX9tgHMW2vY1na/DDLCOW7WinjelGLLcYKy
         APPzXALiWWRvj+M+X//IYrXut2m6T3CvufTX6yZ2V2sPCVd2/FcbxuhvoVlI/ujd9DCb
         Y416rvd1GGfpTwvQ8F5tCR+YyBUJ5jrhb3+pkFFo5mZsjQ/U5/cYOOUDDy0pqZJXbqD+
         2Tr3dh7WBsCTE3vU0Kgz4Bdn9TrzrEAKoVcjUJoVJM7kRg2CJI2epIT056eR8+EMQTS0
         KkrSAkjEL8+oEMCr1R6cJR1+00pEGflnh093nnslar/vUWS7N83Y0V3wbIhQE3KM6Y6C
         cqnA==
X-Forwarded-Encrypted: i=1; AJvYcCWpRxHw5UAuuZ+IwJ70IWG4GPHSP7salYFNX5EwY+ed090BvUO3pxpvPFrBFbJfiNw+iUDiP0WQg/w=@lists.infradead.org
X-Gm-Message-State: AOJu0YygdCTmYhw5f9a5V/W87uvnHXNOGGEuOU4Tgt9zWlt430xkdXCR
	iOZXMfmRk1CTX5QJm/K32DoPUeZsgIVvewmOVtEZMXDTX7hT1vIz40njbfJB2tceoSw=
X-Gm-Gg: ASbGncuuCeCgK2O+gAZxZlDJEklEnL07e/TiYAct+uYvbHN8Ijdu6loC2pKnRxJ2mFP
	pcu1o7JaJwIGvkLGfb5ZNdWkg2x/tkoWXjVT3Ji3DLqvJTfNi6m6xu3PheX7O4yzfd7BV6e1Mi5
	cxbgffurc5jhcdu/ydUKi4zPEhUlcbljFv8Ntt0sF9mdQO/kcDc4BCXdT9Yk44HdvqyJinCXQxD
	YhBTr5Si+gDAyVMlVQoAjwpeNL4OnFFAFx0lHEOks+8XsU17sR2ZYqAKGjD0JUEX6Dn0VCL20lt
	e18LRCVdC2uIvEUhAfHQu15kH9SqU8eT7vV7Xv1Me+D1VKFYusCB
X-Google-Smtp-Source: AGHT+IEbv4B8UCIzN6nDmsaNwoV85BuQ6Mp+F2TMaxmDctRPfjMepLlOopoKzZHjGeALummtngi9+Q==
X-Received: by 2002:a05:6a00:98d:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-745ed8f5d5bmr3385811b3a.15.1747995785079;
        Fri, 23 May 2025 03:23:05 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:23:04 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Fri, 23 May 2025 12:19:31 +0200
Message-ID: <20250523101932.1594077-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032306_490405_A0A945D9 
X-CRM114-Status: GOOD (  11.87  )
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

U0JJX0ZXRlRfTUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRv
IGRlbGVnYXRlCm1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0
b3JlIGl0IGR1cmluZyBDUFUKbG9hZC9wdXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX2Z3ZnQuYwppbmRleCBiMGY2NmM3YmYwMTAuLjY3NzBjMDQzYmJjYiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCisrKyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX2Z3ZnQuYwpAQCAtMTQsNiArMTQsOCBAQAogI2luY2x1ZGUgPGFzbS9rdm1fdmNw
dV9zYmkuaD4KICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaD4KIAorI2RlZmluZSBN
SVNfREVMRUcgKEJJVF9VTEwoRVhDX0xPQURfTUlTQUxJR05FRCkgfCBCSVRfVUxMKEVYQ19TVE9S
RV9NSVNBTElHTkVEKSkKKwogc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlIHsKIAkvKioKIAkg
KiBAaWQ6IEZlYXR1cmUgSUQKQEAgLTY4LDcgKzcwLDQ2IEBAIHN0YXRpYyBib29sIGt2bV9md2Z0
X2lzX2RlZmluZWRfZmVhdHVyZShlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCBmZWF0dXJlKQogCXJl
dHVybiBmYWxzZTsKIH0KIAorc3RhdGljIGJvb2wga3ZtX3NiaV9md2Z0X21pc2FsaWduZWRfZGVs
ZWdhdGlvbl9zdXBwb3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXJldHVybiBtaXNh
bGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSgpOworfQorCitzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3
ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJ
CXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25lZCBsb25nIHZh
bHVlKQoreworCXN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsK
KworCWlmICh2YWx1ZSA9PSAxKSB7CisJCWNmZy0+aGVkZWxlZyB8PSBNSVNfREVMRUc7CisJCWNz
cl9zZXQoQ1NSX0hFREVMRUcsIE1JU19ERUxFRyk7CisJfSBlbHNlIGlmICh2YWx1ZSA9PSAwKSB7
CisJCWNmZy0+aGVkZWxlZyAmPSB+TUlTX0RFTEVHOworCQljc3JfY2xlYXIoQ1NSX0hFREVMRUcs
IE1JU19ERUxFRyk7CisJfSBlbHNlIHsKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsK
Kwl9CisKKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cit9CisKK3N0YXRpYyBsb25nIGt2bV9zYmlfZndm
dF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkJ
c3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJCXVuc2lnbmVkIGxvbmcgKnZh
bHVlKQoreworCSp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVERUxFRykgJiBNSVNfREVMRUcpID09
IE1JU19ERUxFRzsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKwogc3RhdGljIGNvbnN0IHN0
cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0geworCXsKKwkJLmlkID0gU0JJ
X0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCisJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKKwkJLnNldCA9IGt2bV9zYmlfZndmdF9z
ZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAorCQkuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNh
bGlnbmVkX2RlbGVnYXRpb24sCisJfSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
X2NvbmZpZyAqCi0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
