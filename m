Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC2C3ABDD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Dn/65Fug814bjDb36EoU/9FDmVxMvQHazKH89Y9riw=; b=27yGoV/iznbvoP
	w7pSwOe5TLFIAHP/AmZstzVBkl26CYAqUWNA401AKBGPa+Z5pXdW5oY0vFCm28EWhQvCoFEyLm4bV
	ZPsbdmi6s7NGBMRQoWySwxMx/YipiBWtP/q92cS9yV3jJiJkpP6izXQobKIymtL7EzLDCzWbNVwwK
	aSLMWhhvjXocc/lmCfnPH9Xpwt+d+QDtA6DKN6kgTWI6gK0RPCxnlLmNH70suPqg5RxEB84PW3+mg
	R/j51oPxE6OucC2R/iqj5eglgV5hbjt3nDh8xo3Gc8ywoNZQ5mIyCla6Kucraqys/Pe8ynp+9jILs
	xMFOaboR8rTbzSjfJatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyA-0000000HXfU-0iG5;
	Thu, 15 May 2025 08:29:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsY-0000000HVfA-2DxX
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so7911585e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297425; x=1747902225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=J6U2o3W/eLKprPusdqLDa4+/W8vlsyLKq+eoeP3TzDIgxcibtxhuMD8lWMxdF9icbC
         vyyTkdW8r8UDYqHQDzGEUUXTj7/7ZYFASfOr2DdsVeXGN2womR37tNAo+zipi8msRLVE
         eIGfDw6l55K/H4cRlY+iBxUbtr01OtXFGK348AzJ+XgD/MO2MG+zN1fmy1w8hMm2t5pw
         9kbIGW40QJ8TpD+H4EZoiUscrTUe9Wt5cWd9+w4k2J60LeCSDfnuocal6ttZz6xKBu5U
         b8fLioobye3hkvqGrgQUoEoxjZn1NUZNb3GbkGuIAnDkehp4MJi/SNLdkBWaL9iuj1aU
         laZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297425; x=1747902225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=mTEFfLPVW40c4enQOE+fj9rfMGSj4GU9zE9LGM/Ff5zBFbOm6vfVzgsrnTCpD0LXN6
         S2VDJyuF/g2V5bVtQaYt2Z2Y4Tjoh55AcIsct6++rtafXj6ltuwr3ex4qiknXFwEQH+m
         AqXxzihj8dmO7UpzrBDeY3hTob1Ye6PY+3gQi53zqgXxKzoIhFPy1p7M9DKRuf2R9VEZ
         Do5hm3ovAcXQ1toDwyIVgMhZ8hsqdcbHvxzVk5Sz0EJrGNZRF6Yx+zc3viUlNTZEh9Oa
         +maFZ2n3b0f4c0kztwT37UA7gzBqfA5/mL3W4vcWxgrRB2yaiyzKe0uVhF1ok+ETlSXm
         C1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV2fwscf2TqAD4nj6bBNMEE0UCeg8+Cv3AH4Km/uSKWj8yf28UFHYQE9gzXc2mLxxCZmL3yp/sNAh0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqh5pB1jDW8AEXyhmf0ZTTxvytrocf0K4UFtSzGc9Yd46bKuay
	z1evBvy/LIB9L82+vfoAKDt8Pl8C/yDxIviZ1Cnk2tR+0Em4pomMx/Jx7RuTuVI=
X-Gm-Gg: ASbGncvmOzLbcsdneV+CaoQzVcGt+JMIuupP2KU5/mP5IJ4vAcnuyMUwngZPny9o2Jc
	N1Dzh1v251AuBqfYK2zt9dnlKjW1eraFqeuSoYg3PSPniE2QOu2CdRQfROMp9258GQAT1Eu1AiJ
	vAsDRua1Sedpg/yBk3QrD2tA8QFej1l3V/1JaqIOiLH8oq20P70ovfC1warOmho6c0EOXZVloiT
	aPD2dRP0wbXlQ14nJM3RDRD68zXXXmRzKd8owVMlzWfKuN6/Rn//RL4DXurdNJ2Udn3I7utSTf0
	vi8ja/bodXY4dZUfLoIzml78s3oPisLQpDp8yazcMrDIr8e8+1U=
X-Google-Smtp-Source: AGHT+IH7x3YD3rfJ1K3d7RT3c2JHqxBPnyHoNq9PzYlNLe+gbgjdmPJmhvvDoyxbPRh62T/5hHxcIw==
X-Received: by 2002:a05:600c:c09:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-442f2168c29mr50336365e9.23.1747297424728;
        Thu, 15 May 2025 01:23:44 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:44 -0700 (PDT)
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
Subject: [PATCH v7 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Thu, 15 May 2025 10:22:02 +0200
Message-ID: <20250515082217.433227-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012346_593907_B6047A44 
X-CRM114-Status: UNSURE (   9.20  )
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
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KUmV2aWV3
ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmggfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXgg
M2QyNTA4MjQxNzhiLi5iYjA3N2QwYzkxMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAtMzUsNiAr
MzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJ
U0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAorCVNC
SV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMg
bXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFS
VCA9IDB4MDgwMDAwMDAsCkBAIC00MDIsNiArNDAzLDMzIEBAIGVudW0gc2JpX2V4dF9uYWNsX2Zl
YXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1goX19pKQkJKChfX3Jpc2N2X3hs
ZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1hfTEFTVAkJMzEK
IAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZp
bmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQor
CitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVM
RUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hB
RE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklf
RldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZUX1BPSU5URVJfTUFTS0lO
R19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg2LAor
CVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZXRlRfTE9DQUxfUExBVEZP
Uk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJ
CT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfRU5ECQk9IDB4YmZmZmZm
ZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJ
X0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAorfTsKKworI2RlZmluZSBT
QklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJQklUKDMwKQorI2RlZmluZSBTQklfRldGVF9H
TE9CQUxfRkVBVFVSRV9CSVQJCUJJVCgzMSkKKworI2RlZmluZSBTQklfRldGVF9TRVRfRkxBR19M
T0NLCQkJQklUKDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNC
SV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpP
Ul9TSElGVAkyNApAQCAtNDE5LDYgKzQ0NywxMSBAQCBlbnVtIHNiaV9leHRfbmFjbF9mZWF0dXJl
IHsKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUQVJURUQgLTcKICNkZWZpbmUgU0JJX0VSUl9B
TFJFQURZX1NUT1BQRUQgLTgKICNkZWZpbmUgU0JJX0VSUl9OT19TSE1FTQktOQorI2RlZmluZSBT
QklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCisjZGVmaW5lIFNCSV9FUlJfQkFEX1JBTkdFCS0xMQor
I2RlZmluZSBTQklfRVJSX1RJTUVPVVQJCS0xMgorI2RlZmluZSBTQklfRVJSX0lPCQktMTMKKyNk
ZWZpbmUgU0JJX0VSUl9ERU5JRURfTE9DS0VECS0xNAogCiBleHRlcm4gdW5zaWduZWQgbG9uZyBz
Ymlfc3BlY192ZXJzaW9uOwogc3RydWN0IHNiaXJldCB7Ci0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
