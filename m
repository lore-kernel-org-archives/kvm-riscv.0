Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B32C369D0
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xza437YJNQOJ/FL+ww+kpJz0HgSTH/okXvUIA/ax8PE=; b=rdf8mHFjfr2Acy
	Dv2otmRPHNI2iKRjr9zIMVecfouF5trSZMzd3rqZGv9Z0WtuusCpLzbfWvbJq/sZu7xrsS21gUTJ0
	Tgab+E8Zheb9VKjYISSSgiOdtpk+RHsCjIFxSW8u1yv9JLS93XVnwwTlJ+WA2MW7/3goTzVBRtv/R
	7q/TYMLRx4d/UVmdqM0m0OyfyxUS6oflEqB1s6HCap9lvKaAo4uAkTxO+Bx1GA3bGmXiFDw+8HBGB
	9R1Rtk5tfi3BhCrGESaMxkKPf9ODpHkat1cbfVdLv9qdYckZO1hfVb9wUpNiMOxstTjTrIJTXN0Kn
	0pdjQL3HJ19YjTLwWQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTP-0000000Cz2M-36vi;
	Thu, 17 Apr 2025 12:36:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OHy-0000000CvMf-2QoH
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-227914acd20so14641655ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892658; x=1745497458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=TpQqG7jKcaTKPvg/7FFRr+TBmlVrq9B/c9HugQScC6HXVNZ91aKgVptNIff46R8B43
         P0wiYmwIKOP+jdKAEcz4hFk2aVdSmeiVxwJdv4nV8J1Qz7jI/YZL2wgvbgYw+x1x8l9e
         TFVb/ivTwJKSZGFBQgUs4Cf1auXdwhNbiwIpSDGYgJE+q5igT5AqXDkS6gdEO5TKI9Px
         n+2FJBMXBOLrmsPR7te9l2cgvxzXV4KygdeZP0tXqpISEs0xowKRi8EZYHU299OPPKzm
         1ingNali6TjWrNcY+3l6rkiRA/Pm3EF/63dbSS6M4WDp/O8/+8VDh+Amd6955jK1eqdV
         WaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892658; x=1745497458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=vIXVEDVkVa8noso5F4UnKGSIgTeXbGHfByBBUZ1lCkvlcBvFpilSxPUiCa+6O0Tvzp
         9ZBomvIg5mLC7pIgfgXvj1i40i0KRvZbnPJaixCfbKZcc/Y9yM4nE62Y1H+Q4+ihTCL1
         8J4OIgYnRqY+hHHUmFgfuAZ9DI0i5vVcgK4xPiXCCf0z6ryp/A6lSpLyR7+8M4LftpHl
         1jDG4pJuMnM1Cuz5zLXovnni35AaIlYzTqiqB6x7Yw9h/eKizaZGUS4O/rKy9JkLQdTU
         0e1tI/EVKmiWg8h6FTH3ybmMBX8nr0RQHXYbBH7kyM5pjw7c/g6b6PiYBoZlDaEIDe4U
         6Q4w==
X-Forwarded-Encrypted: i=1; AJvYcCWpYRNmN1rkuUIctOH4nuq8zqJJfFSMfsbLiL5p3Blw7YFc0arzxqfYP+SehYg84YTL8JuV4A0dJDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSY4ANIEH4JwM3y9RG8ebf9VVHuRWjy4QCp930MtK4llNUb8RI
	b6BjyCqs6VfKE1CQM1iYacEHnMGAnWBWuioB9mxDRu4QSIkZL2V2TmDo3aLDAA0=
X-Gm-Gg: ASbGncsV0YAboGTB6qnAqjpE4DsV4hLweUUqU6p+2SXYU32XQBok/Kt7YDlwmULFTBW
	d6GDj2GWSnQr7KYInxUUadgMuZo7Umc5u+23YavRnGH+3hjnw6YLWy+kEMgDEFt9Q2kqYwwWgYE
	H3Eo08wuGKyMr7nYhEey36GcnDrFwbW4xDTtQZCNZPVbfxeuykD118ksBAyqMiohiAnanWbbVyE
	WTTrFR/jCnokFArop3gK1IvUQah+br7J9BUqcWvV4tcEyD0cjh6Y6/TRVq8l3OVPHhFY0vDPpra
	8GW0Mz/hdvSVkAePPKVJnNcIYVG38Po1ayo8oMptJg==
X-Google-Smtp-Source: AGHT+IE0XjCz5TtIm1U/KycHsULkn93MfV8ZJ4DCUOeKjh64BtT2X4MD7ZC1hijUVKkaUKvQHFj5ag==
X-Received: by 2002:a17:902:f642:b0:215:9eac:1857 with SMTP id d9443c01a7336-22c4196f564mr40963855ad.5.1744892657640;
        Thu, 17 Apr 2025 05:24:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:16 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 02/13] riscv: sbi: add new SBI error mappings
Date: Thu, 17 Apr 2025 14:19:49 +0200
Message-ID: <20250417122337.547969-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052418_626167_29C1169F 
X-CRM114-Status: UNSURE (   7.32  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKaW5kZXggYmIwNzdkMGM5MTJmLi43ZWMyNDlmZWE4ODAgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaApAQCAtNTM2LDExICs1MzYsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgc2Jp
X2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKIAljYXNlIFNCSV9TVUNDRVNTOgogCQlyZXR1
cm4gMDsKIAljYXNlIFNCSV9FUlJfREVOSUVEOgorCWNhc2UgU0JJX0VSUl9ERU5JRURfTE9DS0VE
OgogCQlyZXR1cm4gLUVQRVJNOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgorCWNhc2Ug
U0JJX0VSUl9JTlZBTElEX1NUQVRFOgogCQlyZXR1cm4gLUVJTlZBTDsKKwljYXNlIFNCSV9FUlJf
QkFEX1JBTkdFOgorCQlyZXR1cm4gLUVSQU5HRTsKIAljYXNlIFNCSV9FUlJfSU5WQUxJRF9BRERS
RVNTOgogCQlyZXR1cm4gLUVGQVVMVDsKKwljYXNlIFNCSV9FUlJfTk9fU0hNRU06CisJCXJldHVy
biAtRU5PTUVNOworCWNhc2UgU0JJX0VSUl9USU1FT1VUOgorCQlyZXR1cm4gLUVUSU1FOworCWNh
c2UgU0JJX0VSUl9JTzoKKwkJcmV0dXJuIC1FSU87CiAJY2FzZSBTQklfRVJSX05PVF9TVVBQT1JU
RUQ6CiAJY2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDkuMAoKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
