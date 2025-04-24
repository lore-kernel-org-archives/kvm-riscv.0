Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB9C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id7RifxX/IdRWImsSU7/+UwCbrL8i0mjpCsqmgevS7s=; b=gZNxFPXkkPGoM8
	XkJu80uS+2A6uK+PyCPRRrHWnklNGG8dSyNAiYkwHoM3hkOZwRlMq9hPB3FbN6/IVN+tMM4HL0QL/
	7+kgXwI2fAZW/Ju2ggp6UYxDcXv/ztfYFbdKAPwI+819hjwW/OBJD+xZ48aTLCIFEtXIMNT0lDlTT
	F3oqqPN61fRCIuy3SZNWKW4bFDOpSw85ubAg1JOc+eiUBGtAHRQjYw6cCtET2uTYk1fGDK4HuLiru
	ZwA4XILURX+1awEwhYqaL5Mcf2WP0+0RL/nBCRwQt56WhFY8keVwpSoANMCQFGBlhgLHQQXKNlO4D
	KW1EeMPTD5RRhpRCiCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TP-0000000EutX-0YXB;
	Thu, 24 Apr 2025 17:34:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TO-0000000Eust-0Bxk
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=we6/kXNuYG+zbvuEeQnBBO4wnOzYcP3bTDt7ONOTsDY=; b=HxJP07waxstjWBplDMhTUzdgyY
	6SNKrbJy87iFUGRirToGPrX73Gx5icJEp+Qj7dEkQ4UhGL3h/KZ4lLY4YQnb8GAdiAorkQXumv6bB
	8TJkIAjjIF45jSKyH6zxbOauow1OCREFO6GnXRbwrQWPtQr2lEEZuLbqfdqz1tWUl00e2JJakcwEW
	5++m53H2Vnr6cxEwm1kfzpYu7ukFqN6DoT1jUswF1L8Zhd1hlViUdQ4+g4G4ThdQ8WY4p6ZNAQbVz
	Vpa7kYCrk3MPJVQbNQDl95fZ1LrznWIOFGu5hTysLHxQWfqRdYMe/p0i4i1SnWyd4xkcVa+jRw3cR
	aszWnuUQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80TL-0000000BsI0-0LVU
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22c3407a87aso21273355ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516088; x=1746120888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=we6/kXNuYG+zbvuEeQnBBO4wnOzYcP3bTDt7ONOTsDY=;
        b=0z4OvaGLu5PNactLspycGAt/ZFf78HGfv+dvzeB9O6V4s0WMw6Q9l7BwhA1nFefDt7
         Lmu1Do17SJLgNul7GLCem5HYxPfYNUHm3WPp0OutGe/Om35p0pOveoqTvafMqev9ExB5
         rvkNF3evq9Z1f5xYCeYcN3zLS9AYxQUlGtTr2U5c7lAMWkmuiDXNwZEQUy8eaeRWJO4S
         WJiJ4AoV3jyg86o/qrHPZjjpZroxrxmFlmEk01Sp9cgeVOhty2ZwL7d5eTXZHykGfBSj
         KgXcyiyPDgjp2s7VykJQ1hmfsQZsgmsKgrC5l/EScqim5ii8Js2pc0BlQ3Ag9AuCiBYh
         EnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516088; x=1746120888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we6/kXNuYG+zbvuEeQnBBO4wnOzYcP3bTDt7ONOTsDY=;
        b=Q3/pLvzbrhI51u5PDoy0p3kZiRZYJX6RCSzmLKUrzCCH4RHCcnaCBtGyVoIT1WDmsg
         cyNmloxDjJIQN/gNQvtRIeWlRhu0LLY/z8CcPssa9in4BiKDv1bAbqLG2ijbpAJNWHpP
         PlE6UJmY3JwLOHXGFwzjTUfVGzkJ6p7qhS8hUtnhkI/NRZFvO7LJzGjlpSMLfikBgZFG
         H1mbQOyUPtYkTdjHqOK+QWerg4my5leYHLhtAZvjpivWKqZKN55eFC6rllSrFkJG5ruu
         KndgalyBZYzj0HUWv0qPpgrRw4UNXouszDpbf6p4GaSpGCyK5EwdW1bZsd+CYpkSdzL+
         Vv3g==
X-Forwarded-Encrypted: i=1; AJvYcCWThJxpuZM6L+ghWqpkALrRj2Xqy+N+UjxxZQ5qUpPLykIowioToaEpFueGTgi34HNtSRve7bTXjnY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQv2cjnn2GGW/dSm2kdsy2T7JBCmcFQDodJ3D+i0iehG+jlfI5
	fySVWoP5xlTRNQGOoE8cNM5uZvhBJbcY0AVO0+bQxlV89ej8yt5vSXFWHJvLN8A=
X-Gm-Gg: ASbGncuWjysklTcGp8xxiPAEX4BZyo3Ai6nn6uX2XDSE2BznuJSCCoKTi0mqvWyRNIW
	WJpya4iC0Lb4nkRlt1+i46aiNTQU18e2yeTS7Xn7j8MBjEShX5ls/tyGBcqnZMxD17XfAffpdoB
	7K9m0d8OZL3hTA0L0OgwdQkeIYWZ8UI0UGfZqqfjfhSUH2zXmk8lMm/BkCleVUrmirDoEoY6EHx
	hnVnRS+h9KWVI0in0ycQuJKb34O9apCHnn6V9Hk9pj6yEirzp1/aBEsNPxh3X93tfCbfDNfEg6p
	mc0HB0HIG8ckVsaOWyM7wWUSvASH48A1zu7wCGKYaQ==
X-Google-Smtp-Source: AGHT+IH/QMJyzwx6cGAw+XwgapY2Ztj34NBA/q3W1YmtI9wSx+YU+sJYTDmY372LJ5cZOrin5uzqng==
X-Received: by 2002:a17:90b:5144:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-309f5533ac7mr921807a91.14.1745516088230;
        Thu, 24 Apr 2025 10:34:48 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:47 -0700 (PDT)
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
Subject: [PATCH v6 08/14] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 24 Apr 2025 19:31:55 +0200
Message-ID: <20250424173204.1948385-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183451_251844_29B4F683 
X-CRM114-Status: UNSURE (   9.96  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggZTFmZTM5Y2M2NzA5Li5lMDJlOWI0YjBmYzUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2Miw3ICszNjIsNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
