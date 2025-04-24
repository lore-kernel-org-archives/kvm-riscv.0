Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD33C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhwHC+6y1nht65UtPaBH4NLiGa6PEiDQ/voxWpKSmAs=; b=zHdmCVyl4UvLUr
	y1I2EP7sFHGKTHm/S8kkXfL7NYB7V5aIVYPeQP3zALG93YN53RQvrPb92Lzi/qvmZqIFstTL7x3Ib
	Hj+3G+/9Q/ZUlqWL8niEcTZlIuZJ5t81C2++YLVIkEn+nvw8RWWBBWPak/1oJYQpkZ7d0f2jBhleM
	PhIpUa5NrOYXvt+DFYy4BFBqu5njHU66pzD8XqKlvB6SNZQUAW/Y9GYKcWfzSlnru49WgfJBJUV3N
	3TPwTiQL7O9GBih9E9phX7RpAEXUrXV7J99T2TXh8qHko39vSwjM6MpMup0Rv1y3txabPsLmg+DoQ
	Ss/8k+U6OuloTJVPwcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80ST-0000000EuN3-3vyK;
	Thu, 24 Apr 2025 17:33:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SR-0000000EuL3-0vg2
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:33:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c33e4fdb8so14776765ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516034; x=1746120834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=QHd62u7ZRS72yW3FWEYpPe0V5SYDvZPVqhVXrhOdVX/jvj9I9oq8FMO5nI13DbAPZV
         q+YhIWyo4GkWt1eDGfZA6WbCgBjJ5+sahS1opRuQ3HUgzlAoSTHHSus7he5+YpxD4Fyb
         FnjzKFZZKEYgs211cyUbUAT6byyTUi0cNIi+gouvUOUvzk8fYux8BeC4KVfVLmXCD5ZH
         LIiw6+pGfCRf14/mT+WCFuONK2fZb92arbx7rwcOqyCigBQkBgTFd4WV9L7onEGhtH6M
         E2OHCfS84Gx/9Fb+cy5qOibO6RPlRojxS0RHoCSyzjCaYF2Ks/ahIsXHaOnfy35op8gf
         jV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516034; x=1746120834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=KlW0k1N3dMo7ZlAZRpKuzGLRFQOKlBEbJGeDczbyNL31nhaUkj2MY3YAGFu6XGZyxL
         i7kHSlwK6wYG56MQx2r/Qm6totQBW0pH5xMyx0WXHyfZKs9TRWvgbL7HixMAEn41Cb4R
         DQ/rXDWaZwvAsHKoeJGmPDXexQzoSeOichm+ryoknns7iVxXf0lhElVrjDdhjOuwdHuZ
         c4dSsD66hf3J/vwVRM9rdFHTpOk+Cm3+7Ut70tvPFDPevcDuhKxgxBxi0Cl/3maf3ngt
         DwNjPK+bMQG54FRNhbCCoPjwRD1qkS3+XtHwpUyNlxhM7dKZJUn7Xr+o82/MoN8c4sYv
         AKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/8coxj/cnwjwy/dbfoYpd/Li6+5hI9ZcbdRn0U+L8dgmT2aroJTuS8LGHJQhF7cNux50M3T4T5iE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2waHxSWWVG9zn8vIyWi5CQhE/Z2hkx1uFqVbgXyhbmBdV+Z6U
	KB/Zmx0GZ4ZmN6Jj8ldxoD+/A2xvIFkM7CuTGMxGHWLeZUpu8JpQJLnLg/hIOX4=
X-Gm-Gg: ASbGncvf54F2+UPFFjAjz5ZVgVLWMqa9J2lKzw0V2GeRrQok6xt7X2/W31X6AMyI/xr
	dwyNky65MpGeQfkRVoorBqIp+t5Qv0e/+wIh37EdyOn07uWW1ryqAC3M0/Z4Gb0E3aGOhSjHyH+
	qSvXOVBoSjDvyESetAglz9dovtFwFHybvVQtpfjdBYOUyaRXjepW+INUbsGgcr3vpeVecLw8G3Y
	j93g+aOzP2rGvGGtArfT85Mmr0KJ4SSNbzIxhMaFKZFbvPuX4uw4gY1/bPkomdHt/BW3zm3RykA
	oQfBSQ00dgNc2e8ly9GLRbnpHw8B76Ok4XZA7EHXwQ==
X-Google-Smtp-Source: AGHT+IHaM8bzJfRRvw0MkUxc3QW2tm+twyY3rgnrMs/7xPlJBt/0WAycPUEFxVys/K0zq71dkmTO4g==
X-Received: by 2002:a17:902:d489:b0:22d:b243:2fee with SMTP id d9443c01a7336-22dbd415915mr4178995ad.13.1745516034428;
        Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:33:53 -0700 (PDT)
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
Subject: [PATCH v6 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 24 Apr 2025 19:31:49 +0200
Message-ID: <20250424173204.1948385-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103355_377211_E784AD0D 
X-CRM114-Status: GOOD (  10.00  )
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

QSBmZXcgcGFyZW50aGVzaXMgaW4gY2hlY2sgZm9yIFNCSSB2ZXJzaW9uL2V4dGVuc2lvbiB3ZXJl
IHVzZWxlc3MsCnJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YwppbmRleCAxOTg5YjhjYWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2
MDksNyBAQCB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlf
cmZlbmNlCT0gX19zYmlfcmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24g
Pj0gc2JpX21rX3ZlcnNpb24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNi
aV9ta192ZXJzaW9uKDAsIDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRf
U1JTVCkpIHsKIAkJCXByX2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJ
CQlwbV9wb3dlcl9vZmYgPSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAg
dm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0
eSA9IDE5MjsKIAkJCXJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25i
KTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkp
ICYmCi0JCSAgICAoc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJ
aWYgKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNi
aV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBE
QkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFi
bGUgPSB0cnVlOwogCQl9Ci0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
