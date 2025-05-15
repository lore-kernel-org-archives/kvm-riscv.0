Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF01C2D0CD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oaJTzVE+tHNdgzbOnFF26Ml+XHxzpixE1kG3rKnULY=; b=q2Jc0DMTfK/k69
	+NDNuh81x4DwILX4ikuVvif3gtcOIlIGiS6snhRC/SzMyUnz8p9+7Oqrc6//dtw7GfBPcSW/Mey/z
	iloWQFT+BS1DPZ8fhxecjxkv5d0htK+7MEjWAw/7yQy+JDvtwpPt+CGqSqqbBHarehc3dHG673vt2
	oU5N3zlQRZaPdtTWKSi8XDVfiTLIyPZskW+hHPlAbMAIUvSQXilnpOlPi/bO/LgnaMeORFTG1fozk
	6OXxCYizwxW8ymOcAzvIM8ObwDBAzZhwtunmJU2IBsACTiFJacpnj7tHV/lu3phhG95isPVaOTLN+
	v7ey7uoT0nqHMioXe0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyB-0000000HXgo-1TpM;
	Thu, 15 May 2025 08:29:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsZ-0000000HVfl-0RK7
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so4148365e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297426; x=1747902226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=dnBCLscNfpDJtjHxaiWRpBQU0xZvZuIQkQitcBsybvLPmEYPK+ZZ+7WQ4JqOo+QKH7
         jVKr2aRHR4wNrr/1vhmABqPAeXhN0/UgcyQeWHZPI3N1utdiSs1oHP5jaJAoY9gsKKfJ
         GQXFnrLCD89o57c2kUxXcQFh6bD6AOTSXB1+s43uQWOTW1huGYaB/3qkB640TCRWq2V6
         YoUokOIhmjqm5E7H4mlEB1+PvEpbg0/lZOSPlFqem3TvK/TaU3H9TqcUFGQhW5eNNWn1
         ZEZmdriTefQvZyfCShoYw3UQVQ2KFDju/iqPlUepEuha2NS782X54y14DquTqMTv0b7/
         k79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297426; x=1747902226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=bk3yf419Uo59ECx8pvPZAs/KsQtogK3VmtLJN2Q/Uy20ZapJhwLBkTZ0mns1UroXeR
         r92UIBdn4v1PC3f0rTgKTTUenKaqo3fPxVnQeeuYgaOj5kkKhB457MNw5FcYE42QueGc
         uyUx1DKu/2q9IrPlhQEvVCjURO1Rdffq3SQJ4z8HLiYyT3YU1zuqyK/pWhQpxJt7UtUg
         Rmt4KhLDeG9cN2izqQZaIMz1kjqIed/xYugLfk9m/zRRpRxaEsku5v1oZ8GeLNFgK1VF
         HhXqXvVqFyacMeGiweF7B4Lg+zXyXLuOhgeE21qGQB9TB++ya5f2yhY0VnvPg3QmV15O
         GmOg==
X-Forwarded-Encrypted: i=1; AJvYcCVHy03CLQcmB4I5wG9MhOJKLuxKYFTuWzmA4PFitFWjG826lu39rVoTKFbtj3P4eubpoomt5bpcGPA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbrYyizeoB6rTvQY4BFngvFycJptL32/L8X8mzLx7glgocHWzU
	IQe3OBkbbvaBEJXmx8IelLmOUlitS8VQnGm+iXGMd3Mq9uOJMkW417vhU8m8dfMN98g=
X-Gm-Gg: ASbGnctRoNRLy1WMSsDWkHoD8fg38z8qvDnQYXVjTRP+mMPHmuYG6kNqS+e7kaGHus3
	QXYYi2RtjltJdpTdORFmVxN7ogLEsZTxjzqwObEtlUR1Z28ebed0kPegyWBBt+t8R/5jtX4Pp9y
	qXNOki6D9zphHhVcre/wwR8CX9fgyokbeFx18EHzHCnj3q4jhG/M7ZsJ9gdstCMKJ7FAnjaMRb9
	A1X7vi7O7JjbOoWGlwraOTkPU/2Aw0NSxGuF6dtUeXvWOChurNEPOb9WEr8NwxxGuEB5fX+5s5d
	uItDBNLr5IeGmH5E3UdfhFztOtNym36MUxJcuBfz5l3i5wMuI1wzhvFiEFE+OA==
X-Google-Smtp-Source: AGHT+IEf/m3FG8FRM27DD2c+gtkesEWRNvfkiivPTHatSmLHF+9dpAc024hgwxzmnfOdGRF2n1iTFw==
X-Received: by 2002:a05:600c:46c9:b0:442:f8f6:48e5 with SMTP id 5b1f17b1804b1-442f8f6494fmr16827155e9.8.1747297425789;
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 15 May 2025 10:22:03 +0200
Message-ID: <20250515082217.433227-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012347_142948_7238CAD0 
X-CRM114-Status: GOOD (  10.26  )
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
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5Yjhj
YWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2MDksNyBAQCB2b2lkIF9f
aW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlfcmZlbmNlCT0gX19zYmlf
cmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNp
b24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDAs
IDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfU1JTVCkpIHsKIAkJCXBy
X2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlwbV9wb3dlcl9vZmYg
PSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAgdm9pZCBfX2luaXQgc2Jp
X2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0eSA9IDE5MjsKIAkJCXJl
Z2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25iKTsKIAkJfQotCQlpZiAo
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpICYmCi0JCSAgICAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJaWYgKHNiaV9zcGVjX3Zl
cnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNiaV9wcm9iZV9leHRlbnNp
b24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBk
ZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9
Ci0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
