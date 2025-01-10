Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB376E7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nZSweCwfBLXiZDC7rY6Aka+dOY1uyAlrlkdrXaUlPw=; b=qD/P/QId9EfpWp
	guHB6Tl7BA1yj4HPc4bLKID11UATnwfFWHNeCgHZ5/aTmc600FbSUssY2lIi1UlP0G5MzNTY/dyvS
	rS4egjsEs/vP9NnBpdS1naOx1Fkjctf/CjDgGxbdQ5YCMkTnZmbIZDbmWlXmmmw1ySR2tc9weuPQn
	qWWHMQbOVSljummERIogUejmds+7nRRYTlOwwP6ov/8P9qGD3CvWrpi2+BvIKpd7OYU+Sj1ymvSs9
	4Wf/ewtPisIknL8Le/SIp+pBvz0zbwAbv2LnfHg/T0Pv7Yd0l4UFeNW762mbIbTf1BHwO409NVtVT
	pQQv2uR5fZNNsdUkcktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwt-0000000F4bB-2k59;
	Fri, 10 Jan 2025 11:13:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwr-0000000F4XM-1D25
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:13:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38a88ba968aso1738788f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736507583; x=1737112383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYths4OMC2TtlQTz0sJIMvagsGZNGflHSOzs+WkBihc=;
        b=jiEscZQ2wm4Pn54MYbjWzxNtIM4ZWaWjsIPTHc6umcDgEw9e1Fyj6h8Z43s1jZi1P0
         CZrdYGkrNWLMCq4CobPgEJJUtntixqlahUVezjKDyTiuEzjF5ecnEOs3OvvQE4MMCIy1
         OOHIEJYNGEl9CQYWsU4fm+eY+0pM4Uf1F252Gx6lBZU3pmgF8GHEAV0jFVLI1PE79r8z
         bAi0Y+fJrNvKEIdNnmVsNccoGSKU6JuV2CV6NyDKmdLC2cVIo10IZIdbr6HUGVfcnL2v
         D5ReszQUBfJgeJXWoPwpvdzNX/viCbQw6v7SXkh++O9a5Bz9pnVKyXTLBEEPz615upMR
         08Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507583; x=1737112383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYths4OMC2TtlQTz0sJIMvagsGZNGflHSOzs+WkBihc=;
        b=qpBDz1HexiYeCcahe+zBvgQRQ7AsyRAMxsHqMsFqpYGZfn+e9CgfP0eHKiGyzGHX2V
         fzqHPOR6pUx0GtrqnaGZUfeMNl3L7S6GjIAaKDrbbkuKMmAIJmLPKkVSCNG8ZjU1oPki
         ktvVgzQCODpLapQMr/lxi3URl9kXRhD1pPpUv2H9zvYe6JBmyZPOu2ZPX50Z/IEbugDU
         eWNKHsrUmhr6WW83roABm/JNNURlznfb7BGPg2uR4LuWukcTPvxH1UerFGtOv6oAfVm5
         WZ5Ac7scl86ICHy8z9UFMZasZAYUhAEs8HhUN+TYn0zdsCQrYRVmR1LAfIdx/9YXLcnN
         v3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU7xf5/ln7ZIgjgwenQnJu991B8EpO0ZW024YN6KCOzKfEPihbSzZi3hVansS6itWg9SfWKfniP3lM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLNf0Vid7BpHwnOLCQDI321b5kwR04T14d9HDIWMY2+KPVOft6
	Ag62IDCXALJ3+iT7jTAS3lOyJI2NpJ/vksP1dzYGa0rm2G89deBjANLzKMlQcFw=
X-Gm-Gg: ASbGncs2VI+hQYe7ow2Kn5qCSMHrRPVrY7t+GeeyAx8nrybY2nv4ZIZvc/iMmgdjGIm
	hEx3ZIrK9mpp2d4S1visIps7uuzaIEFMNu2c4XgZy9Jy5swcPgL9m1r46gYciOVzopC+vCprHrs
	wlw8lay/qMJylq0H4l9hc/INBCqoUUQWJeJtFOJ1hrkG9XAjfTop6Pyd0LtRGKlROrHWp6d56E3
	oyGLiEIdru4PnANAEWHtrVHS8jkWCDCCXx0JcuGcrBuRXO7O0fbKpPzng==
X-Google-Smtp-Source: AGHT+IE8PSg4B0FfT66+L9M+Avs2G9SYpaFgBpFiRBxY5P4MSLDac75HUhlsHFeQx/UFuRIsOIvmmQ==
X-Received: by 2002:a05:6000:18a3:b0:38a:1ba4:d066 with SMTP id ffacd0b85a97d-38a8730de90mr9767873f8f.27.1736507583569;
        Fri, 10 Jan 2025 03:13:03 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm4344459f8f.50.2025.01.10.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:13:03 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v6 4/5] riscv: lib: Add SBI SSE extension definitions
Date: Fri, 10 Jan 2025 12:12:43 +0100
Message-ID: <20250110111247.2963146-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110111247.2963146-1-cleger@rivosinc.com>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031305_318959_47B6ADF1 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

QWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmluaXRpb25zIGluIHNiaS5oCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogbGliL3Jpc2N2L2Fz
bS9zYmkuaCB8IDg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvcmlz
Y3YvYXNtL3NiaS5oIGIvbGliL3Jpc2N2L2FzbS9zYmkuaAppbmRleCA5OGE5YjA5Ny4uODNiZGZi
ODIgMTAwNjQ0Ci0tLSBhL2xpYi9yaXNjdi9hc20vc2JpLmgKKysrIGIvbGliL3Jpc2N2L2FzbS9z
YmkuaApAQCAtMTEsNiArMTEsMTEgQEAKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX0FWQUlMQUJM
RQktNgogI2RlZmluZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRAkJLTcKICNkZWZpbmUgU0JJX0VS
Ul9BTFJFQURZX1NUT1BQRUQJCS04CisjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU0JCS05CisjZGVm
aW5lIFNCSV9FUlJfSU5WQUxJRF9TVEFURQkJLTEwCisjZGVmaW5lIFNCSV9FUlJfQkFEX1JBTkdF
CQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQkJLTEyCisjZGVmaW5lIFNCSV9FUlJfSU8J
CQktMTMKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KICNpbmNsdWRlIDxjcHVtYXNrLmg+CkBAIC0y
Myw2ICsyOCw3IEBAIGVudW0gc2JpX2V4dF9pZCB7CiAJU0JJX0VYVF9TUlNUID0gMHg1MzUyNTM1
NCwKIAlTQklfRVhUX0RCQ04gPSAweDQ0NDI0MzRFLAogCVNCSV9FWFRfU1VTUCA9IDB4NTM1NTUz
NTAsCisJU0JJX0VYVF9TU0UgPSAweDUzNTM0NSwKIH07CiAKIGVudW0gc2JpX2V4dF9iYXNlX2Zp
ZCB7CkBAIC03MSw2ICs3Nyw4OSBAQCBlbnVtIHNiaV9leHRfZGJjbl9maWQgewogCVNCSV9FWFRf
REJDTl9DT05TT0xFX1dSSVRFX0JZVEUsCiB9OwogCitlbnVtIHNiaV9leHRfc3NlX2ZpZCB7CisJ
U0JJX0VYVF9TU0VfUkVBRF9BVFRSUyA9IDAsCisJU0JJX0VYVF9TU0VfV1JJVEVfQVRUUlMsCisJ
U0JJX0VYVF9TU0VfUkVHSVNURVIsCisJU0JJX0VYVF9TU0VfVU5SRUdJU1RFUiwKKwlTQklfRVhU
X1NTRV9FTkFCTEUsCisJU0JJX0VYVF9TU0VfRElTQUJMRSwKKwlTQklfRVhUX1NTRV9DT01QTEVU
RSwKKwlTQklfRVhUX1NTRV9JTkpFQ1QsCisJU0JJX0VYVF9TU0VfSEFSVF9VTk1BU0ssCisJU0JJ
X0VYVF9TU0VfSEFSVF9NQVNLLAorfTsKKworLyogU0JJIFNTRSBFdmVudCBBdHRyaWJ1dGVzLiAq
LworZW51bSBzYmlfc3NlX2F0dHJfaWQgeworCVNCSV9TU0VfQVRUUl9TVEFUVVMJCT0gMHgwMDAw
MDAwMCwKKwlTQklfU1NFX0FUVFJfUFJJT1JJVFkJCT0gMHgwMDAwMDAwMSwKKwlTQklfU1NFX0FU
VFJfQ09ORklHCQk9IDB4MDAwMDAwMDIsCisJU0JJX1NTRV9BVFRSX1BSRUZFUlJFRF9IQVJUCT0g
MHgwMDAwMDAwMywKKwlTQklfU1NFX0FUVFJfRU5UUllfUEMJCT0gMHgwMDAwMDAwNCwKKwlTQklf
U1NFX0FUVFJfRU5UUllfQVJHCQk9IDB4MDAwMDAwMDUsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQ
VEVEX1NFUEMJPSAweDAwMDAwMDA2LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHUwk9
IDB4MDAwMDAwMDcsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E2CT0gMHgwMDAwMDAwOCwK
KwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURfQTcJPSAweDAwMDAwMDA5LAorfTsKKworI2RlZmlu
ZSBTQklfU1NFX0FUVFJfU1RBVFVTX1NUQVRFX09GRlNFVAkwCisjZGVmaW5lIFNCSV9TU0VfQVRU
Ul9TVEFUVVNfU1RBVEVfTUFTSwkJMHgzCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfUEVO
RElOR19PRkZTRVQJMgorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX0lOSkVDVF9PRkZTRVQJ
MworCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9DT05GSUdfT05FU0hPVAkJQklUKDApCisKKyNkZWZp
bmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX1NTVEFUVVNfU1BQCUJJVCgwKQorI2Rl
ZmluZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TUElFCUJJVCgxKQor
I2RlZmluZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfSFNUQVRVU19TUFYJQklUKDIp
CisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19IU1RBVFVTX1NQVlAJQklU
KDMpCisKK2VudW0gc2JpX3NzZV9zdGF0ZSB7CisJU0JJX1NTRV9TVEFURV9VTlVTRUQJCT0gMCwK
KwlTQklfU1NFX1NUQVRFX1JFR0lTVEVSRUQJPSAxLAorCVNCSV9TU0VfU1RBVEVfRU5BQkxFRAkJ
PSAyLAorCVNCSV9TU0VfU1RBVEVfUlVOTklORwkJPSAzLAorfTsKKworLyogU0JJIFNTRSBFdmVu
dCBJRHMuICovCisvKiBSYW5nZSAweDAwMDAwMDAwIC0gMHgwMDAwZmZmZiAqLworI2RlZmluZSBT
QklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMJMHgwMDAwMDAwMAorI2RlZmluZSBTQklf
U1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQCQkweDAwMDAwMDAxCisjZGVmaW5lIFNCSV9TU0Vf
RVZFTlRfTE9DQUxfUExBVF8wX1NUQVJUCTB4MDAwMDQwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9MT0NBTF9QTEFUXzBfRU5ECQkweDAwMDA3ZmZmCisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9H
TE9CQUxfSElHSF9QUklPX1JBUwkweDAwMDA4MDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xP
QkFMX1BMQVRfMF9TVEFSVAkweDAwMDBjMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFM
X1BMQVRfMF9FTkQJCTB4MDAwMGZmZmYKKworLyogUmFuZ2UgMHgwMDAxMDAwMCAtIDB4MDAwMWZm
ZmYgKi8KKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9QTVVfT1ZFUkZMT1cJMHgwMDAxMDAw
MAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BMQVRfMV9TVEFSVAkweDAwMDE0MDAwCisj
ZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUExBVF8xX0VORAkJMHgwMDAxN2ZmZgorI2RlZmlu
ZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9QTEFUXzFfU1RBUlQJMHgwMDAxYzAwMAorI2RlZmluZSBT
QklfU1NFX0VWRU5UX0dMT0JBTF9QTEFUXzFfRU5ECQkweDAwMDFmZmZmCisKKy8qIFJhbmdlIDB4
MDAxMDAwMDAgLSAweDAwMTBmZmZmICovCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9X
X1BSSU9fUkFTCTB4MDAxMDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9QTEFUXzJf
U1RBUlQJMHgwMDEwNDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BMQVRfMl9FTkQJ
CTB4MDAxMDdmZmYKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFTCTB4
MDAxMDgwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfUExBVF8yX1NUQVJUCTB4MDAx
MGMwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfUExBVF8yX0VORAkJMHgwMDEwZmZm
ZgorCisvKiBSYW5nZSAweGZmZmYwMDAwIC0gMHhmZmZmZmZmZiAqLworI2RlZmluZSBTQklfU1NF
X0VWRU5UX0xPQ0FMX1NPRlRXQVJFCQkweGZmZmYwMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
TE9DQUxfUExBVF8zX1NUQVJUCTB4ZmZmZjQwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NB
TF9QTEFUXzNfRU5ECQkweGZmZmY3ZmZmCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1NP
RlRXQVJFCQkweGZmZmY4MDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1BMQVRfM19T
VEFSVAkweGZmZmZjMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1BMQVRfM19FTkQJ
CTB4ZmZmZmZmZmYKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX1BMQVRGT1JNX0JJVAkJQklUKDE0
KQorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9CSVQJCUJJVCgxNSkKKwogc3RydWN0IHNi
aXJldCB7CiAJbG9uZyBlcnJvcjsKIAlsb25nIHZhbHVlOwotLSAKMi40Ny4xCgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
