Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39BBC35FFC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpvPFpeXc6/mBGzJIzfp8Z5ePqgHuzYoBg9s+kd7MPs=; b=tQhnuomuGwxHD7
	RcH7iWMjSls1je9ptDn1misq80jt9UFTv9WQUvS2wgIntg2UeLHP3QjvCeJZ7ChfCDcFtokOrweas
	Ed5KDRtB5XW0pjKlaEWJU8xCbdukYEa06TJzkyhrOiJQdf9S3SOX+EUEAydEQtDOxVA5CU5Ls+I0E
	zLLB8hY5nsehMQuqQi/T+zvKWAnegFA83elSFH4NVKBtbv5pCC/oqAyhxiE4WEw9RLoWXCIWAnOJg
	NVxqa125C8y9oX2h0OtAtXrJQRbdm1Vo61gi4mpi5Z3BR4BAUm/1V+QBtwPWEB6OJ6S1SGrlXyBpA
	V7Bt+EVD9wIFegQbimlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gF-000000028w3-2WFS;
	Mon, 17 Mar 2025 10:26:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zv-000000026zo-0V4o
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso12917595e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206813; x=1742811613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x65kZaxSIijsZG5VBXjklrs/7EqQHDlN3oWwpF6Pt8I=;
        b=GiuA7FCMv7Aft+LZ7azDp427a9f9wre4hbjsJ8ataDZfVqktWGW8MrVTnrWu2/f8Je
         d+zzmDcad5RrX5XdFw6RkyNPdLclZwg7JUoM6wA4bVMEVeatyBeLinYKnaUWu4yxx01K
         QAtc0peox6RwkKJIu5Z16gUNfqUeMPDNLRgpuetx0r06ym0Cg/dy4MWjBfX/lnkIgBs+
         EzmFtnyvO+/bVWuKuxDowcDwtDACDcuRngfEggAB1+lHIl9Q5qqN2IRn0il3SHOU2JEd
         Prro3qsUlBpRFPwPgjMNr7XNsXPtUTwLFR/9JCvsly1FWLQxOqB7QrXvwXy+J0XQJz/G
         Ek0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206813; x=1742811613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x65kZaxSIijsZG5VBXjklrs/7EqQHDlN3oWwpF6Pt8I=;
        b=kErdacYeoECYPszCeYc62hN3E/6Idt5Tw/LY9tJ2RHd7/DmekZHwWLztp6uEEcYuye
         mklrUhbd7YjulvwmA/bVZNHGAmuCdlv2QRg5reO15Ef4GqKGq/B+WS1FFB0+wC0c4rT/
         ktObnMnL+8OqSxTHqJ7GT0W3q5C9pOoPgrp9K0c8kz6+qbKEGv+7E6+Djik0WEM71zkz
         ElBetqymnZlt4lGMD8eHsoaT4CUSL21uYG2y7JvU3kh7HQG5sgEH/vAtttGJNYR85SEM
         uVpK+Z2Tv/3h7pL06LWE7mkhVpSEhJHuOWl8TFkmoBQMt4TJ7L23MQ+wk7hX5GvtM0IX
         ykEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEcafAo2IIdK7ssNDYK++001B1jlex5uMDmSGP4GmCGR7AFx64k5TsqcEPb6B4C1GLOUk0zovn47Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAd06HLL9x/u1ehNx5vRxNEsNe4wUk3As0wqDt4O3QNKEDNX+3
	rh8Kd0B6ESt44l8xWCDpM9FnMjPQQc9HS1OvZ/TfWFw0xi3rwv9Mf8btQQC879o=
X-Gm-Gg: ASbGncsRbeAx/2WhrODlk7yC+/zYuYLHxXaeveGOSUsZb63MUkZ17Z64dkki9lndpzQ
	rBnjwN/h7toeIv4zyIsv6C8HTceLcS+qmJM2kPO19gYZparRtG0VOaTbkhlOOHPtAkM9BDGZyeH
	4LhvMFt/Pv3FIu+3G36BrIzXfH4SY2lwO9lwyrXJLK0DQIZVKjRqNSiJUEewtzx8dsW2gMcENa8
	owUE/odzugWzxL8bc4yWnfJ0EU6P/+djug/DMQRFB8AXCsh/pT+OvLya601Kbz6CE+kvupvKzZh
	whCTDDsJsxX8qCujhUHwtfX1cTmLBDlhl1h1+xRLYbEiBg==
X-Google-Smtp-Source: AGHT+IEbcyQe7XpHejxjDOXGd+NqRN+5zlpUdzS734x8KqDMINCTJIPGWCi6CEfM2jEoc6GpaLiKBA==
X-Received: by 2002:a5d:5f93:0:b0:38f:355b:13e9 with SMTP id ffacd0b85a97d-3971d42ae27mr14801518f8f.15.1742206813611;
        Mon, 17 Mar 2025 03:20:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v10 4/8] riscv: sbi: Add functions for version checking
Date: Mon, 17 Mar 2025 11:19:50 +0100
Message-ID: <20250317101956.526834-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317101956.526834-1-cleger@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032015_161873_ACA7147D 
X-CRM114-Status: GOOD (  10.89  )
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

VmVyc2lvbiBjaGVja2luZyB3YXMgZG9uZSB1c2luZyBzb21lIGN1c3RvbSBoYXJkY29kZWQgdmFs
dWVzLCBiYWNrcG9ydCBhCmZldyBTQkkgZnVuY3Rpb24gYW5kIGRlZmluZXMgZnJvbSBMaW51eCB0
byBkbyB0aGF0IGNsZWFubHkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Ci0tLQogbGliL3Jpc2N2L2FzbS9zYmkuaCB8IDE1ICsrKysrKysrKysr
KysrKwogbGliL3Jpc2N2L3NiaS5jICAgICB8ICA5ICsrKysrKystLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9yaXNj
di9hc20vc2JpLmggYi9saWIvcmlzY3YvYXNtL3NiaS5oCmluZGV4IDJmNGQ5MWVmLi4xOTcyODhj
NyAxMDA2NDQKLS0tIGEvbGliL3Jpc2N2L2FzbS9zYmkuaAorKysgYi9saWIvcmlzY3YvYXNtL3Ni
aS5oCkBAIC0xOCw2ICsxOCwxMiBAQAogI2RlZmluZSBTQklfRVJSX0lPCQkJLTEzCiAjZGVmaW5l
IFNCSV9FUlJfREVOSUVEX0xPQ0tFRAkJLTE0CiAKKy8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRz
ICovCisjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKKyNkZWZpbmUgU0JJX1NQ
RUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAorI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX01BSk9S
X01BU0sJMHg3ZgorI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX01JTk9SX01BU0sJMHhmZmZmZmYK
KwogI2lmbmRlZiBfX0FTU0VNQkxFUl9fCiAjaW5jbHVkZSA8Y3B1bWFzay5oPgogCkBAIC0xMTAs
NiArMTE2LDE0IEBAIHN0cnVjdCBzYmlyZXQgewogCWxvbmcgdmFsdWU7CiB9OwogCisvKiBNYWtl
IFNCSSB2ZXJzaW9uICovCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgc2JpX21rX3ZlcnNp
b24odW5zaWduZWQgbG9uZyBtYWpvciwgdW5zaWduZWQgbG9uZyBtaW5vcikKK3sKKwlyZXR1cm4g
KChtYWpvciAmIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfTUFTSykgPDwgU0JJX1NQRUNfVkVSU0lP
Tl9NQUpPUl9TSElGVCkKKwkJfCAobWlub3IgJiBTQklfU1BFQ19WRVJTSU9OX01JTk9SX01BU0sp
OworfQorCisKIHN0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2ln
bmVkIGxvbmcgYXJnMCwKIAkJCXVuc2lnbmVkIGxvbmcgYXJnMSwgdW5zaWduZWQgbG9uZyBhcmcy
LAogCQkJdW5zaWduZWQgbG9uZyBhcmczLCB1bnNpZ25lZCBsb25nIGFyZzQsCkBAIC0xMjQsNiAr
MTM4LDcgQEAgc3RydWN0IHNiaXJldCBzYmlfc2VuZF9pcGlfY3B1KGludCBjcHUpOwogc3RydWN0
IHNiaXJldCBzYmlfc2VuZF9pcGlfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2spOwogc3Ry
dWN0IHNiaXJldCBzYmlfc2VuZF9pcGlfYnJvYWRjYXN0KHZvaWQpOwogc3RydWN0IHNiaXJldCBz
Ymlfc2V0X3RpbWVyKHVuc2lnbmVkIGxvbmcgc3RpbWVfdmFsdWUpOworc3RydWN0IHNiaXJldCBz
YmlfZ2V0X3NwZWNfdmVyc2lvbih2b2lkKTsKIGxvbmcgc2JpX3Byb2JlKGludCBleHQpOwogCiAj
ZW5kaWYgLyogIV9fQVNTRU1CTEVSX18gKi8KZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9zYmkuYyBi
L2xpYi9yaXNjdi9zYmkuYwppbmRleCAwMmRkMzM4Yy4uM2MzOTVjZmYgMTAwNjQ0Ci0tLSBhL2xp
Yi9yaXNjdi9zYmkuYworKysgYi9saWIvcmlzY3Yvc2JpLmMKQEAgLTEwNywxMiArMTA3LDE3IEBA
IHN0cnVjdCBzYmlyZXQgc2JpX3NldF90aW1lcih1bnNpZ25lZCBsb25nIHN0aW1lX3ZhbHVlKQog
CXJldHVybiBzYmlfZWNhbGwoU0JJX0VYVF9USU1FLCBTQklfRVhUX1RJTUVfU0VUX1RJTUVSLCBz
dGltZV92YWx1ZSwgMCwgMCwgMCwgMCwgMCk7CiB9CiAKK3N0cnVjdCBzYmlyZXQgc2JpX2dldF9z
cGVjX3ZlcnNpb24odm9pZCkKK3sKKwlyZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRfQkFTRSwgU0JJ
X0VYVF9CQVNFX0dFVF9TUEVDX1ZFUlNJT04sIDAsIDAsIDAsIDAsIDAsIDApOworfQorCiBsb25n
IHNiaV9wcm9iZShpbnQgZXh0KQogewogCXN0cnVjdCBzYmlyZXQgcmV0OwogCi0JcmV0ID0gc2Jp
X2VjYWxsKFNCSV9FWFRfQkFTRSwgU0JJX0VYVF9CQVNFX0dFVF9TUEVDX1ZFUlNJT04sIDAsIDAs
IDAsIDAsIDAsIDApOwotCWFzc2VydCghcmV0LmVycm9yICYmIChyZXQudmFsdWUgJiAweDdmZmZm
ZmZmdWwpID49IDIpOworCXJldCA9IHNiaV9nZXRfc3BlY192ZXJzaW9uKCk7CisJYXNzZXJ0KCFy
ZXQuZXJyb3IgJiYgcmV0LnZhbHVlID49IHNiaV9ta192ZXJzaW9uKDIsIDApKTsKIAogCXJldCA9
IHNiaV9lY2FsbChTQklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9QUk9CRV9FWFQsIGV4dCwgMCwg
MCwgMCwgMCwgMCk7CiAJYXNzZXJ0KCFyZXQuZXJyb3IpOwotLSAKMi40Ny4yCgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
