Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB9C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IL4wcrnUvy9lnyVzW5S/OEKDjmA9wcKrwvnYyRdK/u0=; b=StJXIX3Eg0eByq
	eC24W6QgsWc4dUTayfq8uZW7soKRnyROMAQ1MKWjcbRrRJbFGPkDqDfseKdxaPtDjBsJf3ZfEXlZo
	YGRg22LAic8oKTc/wW6d+VsgfuJHvSq3KmxiNyntvfZGTFCljgWeUKaSHwifoox4oeImq5pIruOu1
	jj/qUTy/Jysl3YpRugkiQjwvvlvFNVIR24nYCzU0CCsw/1S4PpSH3EiqqSX1nz+Fl+o1lCZs/3GC5
	WRTW5zITukXrvu87bTAEQ7sMOHuoghArNQlJyqFKJosDpBLv7Vj25MIfGxhG7B0DepTte5Q5VnZi/
	TN33HvRZ9xXSFPKa3llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TU-0000000EuwT-1m6F;
	Thu, 24 Apr 2025 17:35:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80TR-0000000Euuy-3D5f
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-227914acd20so21698225ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516097; x=1746120897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=Pt4pnkKZ/VGWnXnyGpZMkLC5i8IuqW5qRlsnsi7xUOiy5Y4T1gojQryfD1o8z9lX/D
         YrNgM0wo9vj57+MhMvZfq5rOy9CuH3dDLKIW/d6HSJ5+olly4HIY46bXyqkutPoim+Ji
         fRKzg261/rwz57MZVgBENkSZ2CuTK543CtO8osnaQ8hYVyUl5J+/74OG8WuKdee11LfQ
         DXI9unDwaYhY3LZVWDopD6P0Se6NATkcY8GjmKXvrPhNb2KKKbap1yqPOx2oOGOOv8Nr
         dq6nGsTdbiTRdB3gbr18EcCLTYGWwjHYfruVOms/i33sVPiZrW+XGdvpj13Wb86ZUovG
         YXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516097; x=1746120897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9V9rr9KXScjB209CCQhOyL2xY7TO+2YEqW9Zt14WVs=;
        b=VHW1vxdPKdsZQbGq3pJPy+lG0Pw5Sk77xAqIXMNglhAyUahkjLL9xuuWCIVDV04It0
         N59RkJPk3ljE88drvu2CEQ5I2af46iNc3FygMyEXY46y0SSc5dcnMiADP3Hnzbnh5+9Y
         0g1AnSfZGlZqRtDvds8oEmi/UlbigXaG20vjRaJg402VLZ59Z3WiJORGb1EWXHchWRac
         GR6Sb/u8Nax8dlclXBdyyGc9o7sL+4q07JshNFvymqlVhP8U9fVSrDjjh+5mi2j7j0gu
         64WfwAdMaplmqEoox+LiZvSWgw9NxIJLcRGv/LXJIrW+2aReRx9+WKlfyYYHYNFr8ypj
         B6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVRZ8911bnHEvgYXMGkD+pOiuTgxcMyd3OAl/TIXmACAMTscshz50EbywC+D1GV01LiBj5Jtb/glWI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0jwJwIejb0FCuc0u3tmNHL8vvtQ6e01YsGTxlgArOJKAlWYdV
	3E0tdQzDf/ulwvoY8afLF3o2tluquUDh3RBqNEQHAgUiGm6uP/IiYlhOhAZz8as=
X-Gm-Gg: ASbGncvyZLojx3A/zSZObxlHXPbrU2+y3qnNeuDYH34ZVMlUI9ZyJr/ntw2i362SM99
	ci17+H6G9IRUH51QQVRhj/kXiEj1KXx0IwDpsN6p+rTiY72fL8u7suWfm/O4+SIyFF7BaHVZzoi
	RU71h4tcXgXwBz3QYDACJ1nElSoTl3LMB7WSfuxg1HUJkQgZX5XSg3W1/GN25BLj3jaWhxm0xBq
	JUEe5JZDZUAgvCyO93bCRR36Fws6lIwvwM60mzd9qxd+qGFKyBLnTAJRjnXUL4cibqEdx+G836d
	IQZTGcGA2FfIUMP4Q88V1Q7Ou6PVym4rj6+pDjncNCIdyy+exOK5
X-Google-Smtp-Source: AGHT+IGAQrQw/KilPGjWcs2DXTqeGJNePUSlT3bxzRIay4dKTLJvYkpcmDxPXRgdgSxGOsYJ0V1TjQ==
X-Received: by 2002:a17:903:14b:b0:223:607c:1d99 with SMTP id d9443c01a7336-22db46a3332mr45750265ad.0.1745516097242;
        Thu, 24 Apr 2025 10:34:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:56 -0700 (PDT)
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
Subject: [PATCH v6 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 24 Apr 2025 19:31:56 +0200
Message-ID: <20250424173204.1948385-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103457_803911_9C7120BF 
X-CRM114-Status: GOOD (  11.29  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCBlMDJlOWI0YjBmYzUuLjQxMGIy
ZTBlMDc2NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNjY2LDEwICs2
NjYsMjAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKIAlyZXR1cm4gMDsKIH0KIAotYm9vbCBfX2luaXQgY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQorc3RhdGljIGJvb2wg
YWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKIHsKIAlpbnQg
Y3B1OwogCisJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCisJCWlmIChwZXJfY3B1KG1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9CisJCSAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0NBTEFSX0VNVUxBVEVEKQorCQkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisK
K2Jvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9p
ZCkKK3sKIAkvKgogCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBp
ZiBhbGwgQ1BVcyBoYXZlIG1pc2FsaWduZWQKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0
YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQpAQCAtNjc3LDEwICs2
ODcsOCBAQCBib29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9j
cHVzKHZvaWQpCiAJICovCiAJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCwgTlVMTCwgMSk7CiAKLQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKLQkJaWYgKHBlcl9j
cHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKLQkJICAgICE9IFJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQpCi0JCQlyZXR1cm4gZmFsc2U7CisJaWYgKCFhbGxf
Y3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpKQorCQlyZXR1cm4gZmFsc2U7
CiAKIAl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKIAlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDkuMAoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
