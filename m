Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC97C28B2E
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S5/kcqRC/kbmtffwbRv8eQAe5PVusDqWKolGflwWeU=; b=rKpcvsAUeXT4n6
	v1wMbsOvqYHgGPrCdKFBJfwzAQr4S441SbNTs0bQp3RPBnFfoMcGineIg1DCE/FnL1/KPSkT3lLHT
	2bXun3YJZg01DwoNTcuXJif66VMG7tqkYKxtc7Yopd8ADeZJPU1C3Z+U0x1UHywiIl0MUM1UheGKx
	uUIoHobEvfisT6Zw0Xi7EEmlVlZ7+hWFnEy1e1qnbSXg/24cKwTRuRQD13Rc9VAYEE5IO50sIhuqp
	itxEIwQlyrZ4tLARGSNW1uU8LzfC9/rtG3MbyOtgbRFi2pNVgdAFVMZ/ZFgmSY4mACULZfBJD7nvK
	47bVG2VAgRf55KWCox+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLp-00000003Frp-3rKV;
	Mon, 10 Mar 2025 15:47:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoJ-000000037N0-3PMO
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:12:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22423adf751so61368975ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619575; x=1742224375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqoT5ixPEtXdLEI6ocjejwPv6xnA8RHlbYFtktGXOjg=;
        b=TGz5YLIaym6dyao/XvIh1rUWKxtgjWA2N+UbwHLIyym8Fr3XEx5UGECpOtQJ21TCxC
         xLvCewQ4Aa22eTISKrHq0A6UGBZZyywnJVR9TB4jWxpZbAn72aiTujOLoaczQ28QJQ7o
         7ehQgpGZ7Wx2hYHCdxQ7/uINUgmaVl73mVr2St7cwSG6P0BbEMTEHYqDrRm6CV0GpuyM
         HkT1KicrXJsIs6EcB7sJYNuhNm4gNU478KWUFGm3AxPXQQ8pm9LDO1vllHK3IYr8mueQ
         pywyEYTm5bbgtdQ9jQfLglNQ+2RB+13qzpoMeXdWnRzwxFWDsLI/8KeIYMHoLWmhi5iV
         PTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619575; x=1742224375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqoT5ixPEtXdLEI6ocjejwPv6xnA8RHlbYFtktGXOjg=;
        b=TMVWKsPZ507hjOyQfmqdQzg7jqghxYfFjLfGPZX/4eczE+WfuuPGZimGBPx3XqMagF
         ImYe/XzXDWKXHwjf0jafF1nsoqIxe1epCyFkH+5YUJ602NtUFV0wdgEKi9Wx8dFfifTt
         wRX1S1tbDizWOsphrj6las/4zyguEYLhYVJCstkRZUMaSv2DKbLCo5BVGKVU6D4av6uh
         T3V23QA5Wmi/TJReMTVTLSoPHUDYLVozYedtdPC4mL6KUocOD3MTpDxmaEPqEbwqaMdt
         yhVJrIiA6/pQ1DknK4DJcw+woNUcrdn2HqnpSeb+IZ3Wk6CW/m0J9eE1OWzx0WGHZD23
         YwvA==
X-Forwarded-Encrypted: i=1; AJvYcCW9lbp7kL9M/HtRHlNxUDSiPiM7sxAP5eA4JsnCS4i9/EFVzx0WUPaYIhv+s7EK67oM7A9s6zbpGW8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPlnuq1r7g2ihYEW6ysBzgUOaclv/Fzwq4VxQcX+7v5b6M1m1
	qmpNq9blItaUR0gswDueVOjM0FnHBNSFboFDqzRHKZMt3N6BScI1GCJQQFFvKvw=
X-Gm-Gg: ASbGncstufEeLqnAOfgynOzQCSsv3UpLIi1LZQXOuRMasIbFl9/inijoLnVN7UpQTKu
	FGSAw9EtP1XbztjsFbBaKQrdvJhYLf2xPmwiZV9IpGeEQoGDyiodGoh1DcrsYN32HwhKus3/hio
	OA4ZBAgIHPL+Ewxs181nsasY5i3hSalOwUgu1JntaNcB9yZL34+SZMlwebdskNs5EwXNvbNaWZ3
	8UNn4FX01wAkX43mqoPRlBWF+9yXTpU9SUMG9Fa8hf3i209TxYTXQyI0Ta36/AqrFg3MjK0Bxt5
	x6GvvXzlOCwGci8ve5rSmmyzpEJZ0diJBt3FJeqPkjq0Hw==
X-Google-Smtp-Source: AGHT+IFvzTd5QCV2TCtNaJ/EaL6UD5ar2zJmoTEAdGnVQhe1E8h+p63CvIu3O7VcRgR7VvKsoM8L/A==
X-Received: by 2002:a17:902:d483:b0:223:4537:65b1 with SMTP id d9443c01a7336-22593185c80mr2418925ad.36.1741619575178;
        Mon, 10 Mar 2025 08:12:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:12:54 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v3 01/17] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 10 Mar 2025 16:12:08 +0100
Message-ID: <20250310151229.2365992-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081255_857695_C88E913A 
X-CRM114-Status: UNSURE (   9.65  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKaW5kZXggM2QyNTA4MjQxNzhiLi5iYjA3N2QwYzkxMmYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaApAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9
IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAw
eDRFNDE0MzRDLAorCVNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50
YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VY
UEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDIsNiArNDAzLDMzIEBAIGVudW0g
c2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1goX19p
KQkJKChfX3Jpc2N2X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9T
UkVUX1hfTEFTVAkJMzEKIAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRl
bnNpb24gKi8KKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRf
RldGVF9HRVQJCTB4MQorCitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlT
QUxJR05FRF9FWENfREVMRUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEs
CisJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJ
CQk9IDB4MywKKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZU
X1BPSU5URVJfTUFTS0lOR19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURf
U1RBUlQJCT0gMHg2LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZm
LAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZX
RlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxf
UkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURf
RU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4
YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAor
fTsKKworI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJQklUKDMwKQorI2Rl
ZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQJCUJJVCgzMSkKKworI2RlZmluZSBTQklf
RldGVF9TRVRfRkxBR19MT0NLCQkJQklUKDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRz
ICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQ
RUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNApAQCAtNDE5LDYgKzQ0NywxMSBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUQVJURUQgLTcKICNk
ZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgLTgKICNkZWZpbmUgU0JJX0VSUl9OT19TSE1F
TQktOQorI2RlZmluZSBTQklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCisjZGVmaW5lIFNCSV9FUlJf
QkFEX1JBTkdFCS0xMQorI2RlZmluZSBTQklfRVJSX1RJTUVPVVQJCS0xMgorI2RlZmluZSBTQklf
RVJSX0lPCQktMTMKKyNkZWZpbmUgU0JJX0VSUl9ERU5JRURfTE9DS0VECS0xNAogCiBleHRlcm4g
dW5zaWduZWQgbG9uZyBzYmlfc3BlY192ZXJzaW9uOwogc3RydWN0IHNiaXJldCB7Ci0tIAoyLjQ3
LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
