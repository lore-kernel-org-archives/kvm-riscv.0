Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E591E7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nZSweCwfBLXiZDC7rY6Aka+dOY1uyAlrlkdrXaUlPw=; b=2mvQl/ZB+Ean+d
	YW2ZxBwIAFHzHD5r8GDLlZtpKAU39CiIJoz/uio5LKhFxwTc0vu7IViuaxxX1SQHdUBbOYq8+Q54C
	YuMbBcvi0Sc/GvWlE+Xuf5u94/LFvViiBfm5owxollkwDqQjQLQcJeWbFC5FW3tbstJMzxOV5IPh+
	dTHe8xLpqI6ieM1Oz+3cKZ2VNhQFXrHDO0Q3rfWlql6lm3qRw/OwF0Lb3qX5TtWzlK/d+soRqoZLB
	Tq/Gs4te2fUm46MMZNwkgPgqmK3PUbIGCxsShag1P/8dNPLDERBUt6YlxXKUEFR1cxefxqTVsC39k
	h4HYWD6mEmVedwSK786g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmO-0000000Ebny-1jzI;
	Fri, 10 Jan 2025 08:54:08 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmL-0000000EblJ-2uLm
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:54:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so976428f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736499244; x=1737104044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYths4OMC2TtlQTz0sJIMvagsGZNGflHSOzs+WkBihc=;
        b=rbZ/Pfo+6SJyFJ2+OLuwqooTyMjilxaZ4L3qoNvchUZGRBB7qd7cIX385wGvWE0Jek
         od/go0wzJRSx053U4pe94EbNkDL/MBBZGs5ETOFHhe3OC2yJu5b4psgXQAAsvR0K4mqD
         3xt09u7nA5Smjh/NfTZ/eiWbqlFBjUa3506h97F3AdqJ4GGsjX2pF8RyQW+HIBugTKg8
         abFCmKJTctNJ5qSxfy4AOCX1zdjYQGekN0yLQl54Bk0m0rj0ZSV+tilQgWYBKe3prQK5
         Aw/j1JEZeZC5INNO4GuynMnLxPkbE+M/PJtAY9GS+KnjBjkMJAWaEwhmTTrQQ1uG5n64
         Xe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499244; x=1737104044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYths4OMC2TtlQTz0sJIMvagsGZNGflHSOzs+WkBihc=;
        b=H+I69g17wGGLwZprUoE1X1WxgXhc/5A1IhZzo4crvVYAWc9bdd2jCXY6AwnX7UMvlg
         nbze5PXt5AOMINUxSK2xturF3GRJor+FQ1ew4QzF0Zih4sZVZ+cW+hhFYr1Xc//gXmF/
         NtGa4YRzkOmEllQiDOv1S3okIHVU9LAUz6Uzsq7PWpH6ee0G68yK8Z2nMu05Czz8ybJ1
         H5ML5Zc6I22ucHF1booRLJpoo6JpofPV3R4/SDvfzhPW3Ozux5js7m8uPpf346ZWMI0y
         DGFb8wBgMfXIcXznsMlMgm2YVQM450CSeannx3nnbM0GpUVFvXluqcr+lCK+6/AAZ+le
         S9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/aU/IyN/h23DNeU7cRPixFXlAX2azRzgXkKB5unwWP0jf5Lpg5GYzdzfqZ+Hvg8ZyVqZlvknV6Xk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9deGIudL8vfStSKu9LUa+nqfzrK1ECl3QoV1lNLnz/rEm2806
	c5jTRhPXjLigsipnyJH1NTU1T5e8T1IpyfTRe/p9fRFNVIBsXYzHO/Ep3U/k+70=
X-Gm-Gg: ASbGncvDgDWOJZey+UlhH2qNPqYv7vlMwWlTpgMQy311QX+GASRIjiKRlOX9BrZ4m7S
	nyYcFqnzX3LOGUGBx3VqdHlPrJc5U8FRWtSC25T7ALsABrVESP82n/g2NQJ8hRTMwXl1yauJINz
	/EF6T0WQEu4gI02hTuol1emeeROBfQhUP82Bf1MYKXa446Qsoe5NjuFTMovkoVOXouXXfF/n1gN
	HJ3tQxntkFroNWlFZvB3rhScZehuXVofTm2FrarKcjK2bH9vqXrkQZt2g==
X-Google-Smtp-Source: AGHT+IFwJqLqwRp+XoQxBs0dLbf526Lfqu8DjEu8T9JCkOVk5p2EcS8j3h9b56GpMYwQWHROSK/1FA==
X-Received: by 2002:a05:6000:1acf:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-38a87303f90mr7084185f8f.19.1736499244157;
        Fri, 10 Jan 2025 00:54:04 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm4009283f8f.94.2025.01.10.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:54:03 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v5 4/5] riscv: lib: Add SBI SSE extension definitions
Date: Fri, 10 Jan 2025 09:51:17 +0100
Message-ID: <20250110085120.2643853-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110085120.2643853-1-cleger@rivosinc.com>
References: <20250110085120.2643853-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_005405_734980_97D0327B 
X-CRM114-Status: UNSURE (   8.16  )
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
