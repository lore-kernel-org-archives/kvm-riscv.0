Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B9C3ABC5
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdK8usYYqxPj5cRmdXw2es1OLLWTNTUgi363EyJ+nqQ=; b=K3KMF2XvLwaBhD
	FgsFSWEXbXYhnYCn7xKSHhzgAnwu6Kq1JRd1GOJHu4nbh8NzIz94QFAql4fX/rYYWxW+WrC/PJbWZ
	1710T3hISqqjjD2EWaSxBeXCk+Ui6KrO4CxG4TOKrbhJ/GbsYD/Ss54esb6AmJK0pljuWj9Mliu1U
	lB6zEiQJWBB2Wuv3TSGF3pqAX0XmaVL7PeX5Ya51qE91on5tNxTS3qI7ZFPJXbhTlHXY+vjlptH7e
	S0dSXP0B5b5Xl9xfu9JncnlMo1Ry8C5LjGV6xPIw56Msu35wjNbgdUR7x1lWnm3UzEchhksaUfbjK
	BHKQ8VMx1KvbXZl3qn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0lZ-00000000gIY-0asE;
	Thu, 08 May 2025 12:54:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0kM-00000000g1d-3JU3
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:53:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so14906715e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746708785; x=1747313585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=BsOgDsUtkZz+QCUvXEm1xCy9OnCkeN3Jw55ukCbkkSIfmsl612MPD6BTwJ+0AYXqGD
         syd3ci9PjA85NHF8FW9TtXH7sq3UM9mg3DlLHHdnVHkX6tnJqTn/TqReKCzvBmSXAkWg
         gcGo4O1ripv8n7O31ZJp0Oa4xFOl/4ki0sVZE6kcF36jcdF8mBOEYUreCcV1iyDFACPg
         MI88CkZ30oQq7MdZTKMnhzGPFmAxozjtKFuyNVK7v/psEvct1ic0Ccnl84UmJOxz5+nH
         nzFnFHzLDIpc+pKhuHeCRIs+MKOUqxOqisM0lcq7DtU0izG/LrRwIFirPkJryLgyk6XN
         latQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708785; x=1747313585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=DXmb1nc5Lda7PVgID4VSAi825oFJ2BJbP3M+kQIke4zrZOLJKYlHY9ZHNPOcbL/yrg
         ZBEwhZ5A0iMpXrY2DMKSgOWMC+VXxoKkZTIrYuk2bwNXhOM290H1m5nLj5z8v8RvvYJB
         nNYlMOGEvBjSXolhj++cjJYBL+TWoQHT5kJfCf59t7lnekRRwr51JbwTqQrquIv7RFg4
         gvVUm4BZ64hdHywBV47LWXxEHWet8fbGkDDfqVYSCBYhNA78tDgfI0QcPNr2CyM+zEXl
         q3CLI5NEUjOes5KdlBYUrb6cMYRypVLO4nbkHlrh5froJ8NtqcvkL6zqoameByPd2/rb
         USOA==
X-Forwarded-Encrypted: i=1; AJvYcCXo5MbxnUqgTkgRgLk3kHlvOY6Qq/iBq8QssBUfIp+/xdFEFONzdDGw6A5FMMtvRKIb6qnjvgUWsFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCCTkYa3nyza3hG541c8keJYoAJpuZrQVSNBvFlus4LUY0XTCS
	gop3uvqj3l2zzDsVOP9gvmVnXYg8XVj3jkF3jCbYUfgiSY7HVdlJJqX2lfBhRWg=
X-Gm-Gg: ASbGnctjJwnztSVxMidb16QIUxXgq/49K2QbpRskzAeObmzRh91v+0m0/X+gx/IJtLx
	+kNM2IQblvvoC+A24cKPKJZ0YjI2GOa7KesvB+j4yGvfHHQw0XynG0AycmYlNWgtuczYkMtRWlP
	3PxaY/x5LM8hjlpfgBZeHsYSzDvjcOiPXll4aqPOojNdbSf3iU11BdfGHZ651815oH4VgM3sgTc
	Psyuh0b0NTDYlzrf8caMNJ6cSKYrWslJ1Zsa5MvpMbxKL7u2GX2mMNBSXMnNy5gTrnDujGweHpn
	4QEskiyxj0u+N2kAgQtzCeunnNWC0RJnvHE8qrnkXtzAzEalsQs=
X-Google-Smtp-Source: AGHT+IFR8QCSoAU+f4KSrfc+O+GL0KH+EcLDchKk/zyNXpj2HtkBA6LUoeVtjpf2wnryhRhOk+2CgA==
X-Received: by 2002:a05:600c:3150:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-442d02ef128mr29446975e9.12.1746708785138;
        Thu, 08 May 2025 05:53:05 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f238sm36021615e9.11.2025.05.08.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:53:04 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Thu,  8 May 2025 14:52:00 +0200
Message-Id: <20250508125202.108613-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250508125202.108613-1-alexghiti@rivosinc.com>
References: <20250508125202.108613-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_055306_820369_B3BBB564 
X-CRM114-Status: GOOD (  10.78  )
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

U2ltcGx5IGZpeCBhIHR5cG8uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDA5
ZmRlOTVhNWU4Zi4uMmE1ODlhNThiMjkxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaApAQCAtMzUyLDcg
KzM1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9pbnNuX2lzX2NfamFs
cih1MzIgY29kZSkKIAkoe3R5cGVvZih4KSB4XyA9ICh4KTsgUlZfWCh4XywgUlZGRFFfRkxfRlNf
V0lEVEhfT0ZGLCBcCiAJCQkJICAgUlZGRFFfRkxfRlNfV0lEVEhfTUFTSyk7IH0pCiAKLSNkZWZp
bmUgUlZWX0VYUkFDVF9WTF9WU19XSURUSCh4KSBSVkZEUV9FWFRSQUNUX0ZMX0ZTX1dJRFRIKHgp
CisjZGVmaW5lIFJWVl9FWFRSQUNUX1ZMX1ZTX1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNf
V0lEVEgoeCkKIAogLyoKICAqIEdldCB0aGUgaW1tZWRpYXRlIGZyb20gYSBKLXR5cGUgaW5zdHJ1
Y3Rpb24uCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IDE4NGY3ODBjOTMyZC4uOTAxZTY3YWRmNTc2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYwpAQCAtOTMsNyArOTMsNyBAQCBib29sIGluc25faXNfdmVjdG9yKHUzMiBpbnNu
X2J1ZikKIAkJcmV0dXJuIHRydWU7CiAJY2FzZSBSVlZfT1BDT0RFX1ZMOgogCWNhc2UgUlZWX09Q
Q09ERV9WUzoKLQkJd2lkdGggPSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKKwkJ
d2lkdGggPSBSVlZfRVhUUkFDVF9WTF9WU19XSURUSChpbnNuX2J1Zik7CiAJCWlmICh3aWR0aCA9
PSBSVlZfVkxfVlNfV0lEVEhfOCB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lEVEhfMTYgfHwKIAkJ
ICAgIHdpZHRoID09IFJWVl9WTF9WU19XSURUSF8zMiB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lE
VEhfNjQpCiAJCQlyZXR1cm4gdHJ1ZTsKLS0gCjIuMzkuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
