Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A06E77199
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sFZUAV/avNRNHCFI8utBsgo31u8Cp0IgKR6cgsvAjo=; b=a6pM8onYPpHTVi
	UFzNLc7gv0a5ltImFaFgmc5cNEL6UZ7rhkmi5nRNL1G29hky1rgTY2jP9Jn+lKN75mAigCtSfHaUh
	FI7Hum3wEiPg414Y/9ezAv4wLg+i/mT3sb74FXr7hGWXIxCnhWJw6FSavJf7hMjsodAdbUxoDpPHd
	536F/X98e0mOlfih9E1CnqDKkcHMEogMdytaQybO9DR5OjTAwW8OutJVZmtTgxsGLInspRsbAhYEs
	XuEtID2FaLWtLFs1bbVpdDt5nu9LYNpk5rn10fz99rEot2ynPZ6ZdBi8RmwT97mjIu8QFpLg1+1qJ
	DbrcZGPiYoZ+WaTXwpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNb-00000001qTz-3twQ;
	Mon, 06 Jan 2025 15:50:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpLs-00000001q3O-3Jkg
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216634dd574so138617115ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178552; x=1736783352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWWbvbVWcBkTLDmBWRGuP/373zfHHQD7CsE6sYbpx+8=;
        b=diT2LbjAvHbiJHI9xCsx8SmO1nchaDK44rsGe8POikAH21PRAJcpeXpV5cSyKo4ccW
         C2/6iKIGHXefbOMLbY233WfURKVRpEcvWH/bhz10LZ/DKp0nqnKrVxHCnL4RiXKSZhhU
         um9xrEmt15bjzmYpKoKG/SgXblkstr0/YYmvfZlq+BaHdc77KQHytAqAsPKR193WlfDP
         zFq7uK/xRYmkQfcv2yqf82/DYfn1Ajvnbg+3SxRce/CkjcoebMIonzGFfLqKpUKiSiLV
         eoVpSU7Fw59uV4SCFQiI8lJk4J7c/ZWLOG++Iv6dG51ZU/bVYJCmLJEIpElhkWwGyW2u
         khkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178552; x=1736783352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWWbvbVWcBkTLDmBWRGuP/373zfHHQD7CsE6sYbpx+8=;
        b=AAtWTFq2h4hQCloL0yDWEkZwJVSkx83Ib0IBRiOSQrIWgbeF9DI/hqXVPY20H+RevA
         Kokz1NsqVNZjkaewItWE3awuWKCYxyJ57RRgHYbrmO3AoiAeLaidtSru9uO1DsxAwAV8
         38u+bWolPSMUCyElU8DTX0+6SA/+gFIurj2dI/MrdWWUA85JssjvEZOGIvzypaVrlfbS
         Kx40guACoOBMFX5ehwZmxQE2FeWMp25Of5/rtgoftiMOz3ThMUt5JGb74ea+k/9MOQIF
         dDQ5FmWU7bVi7NnrLFg0iowOJ8k1coXrv2TlJ3ekKxsda/cgzQLw+5frjvvhcwhPtXYn
         aMTA==
X-Forwarded-Encrypted: i=1; AJvYcCVqR0Q2wmFUhLsIA5NAjmPeT7hR1ffBO7oKkW6p5tX/bujqKhyOKM5M91jsxNaC8BekkRLdQBS6QzM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Dy1IkyF1iVjfwG3lgdYKljlbiBjrlajRbpVF9szw9GwOXw0F
	/cWDcUvYiCxSaFY30P6gB2Z43yXKyruKIgBLBx4UOalPhG4RsOIaCUFIr85dGOA=
X-Gm-Gg: ASbGncuex9k4TB7chfLNAp8b85CHs50zmI758goSRSS+WKRIr7q9Pu6Jqqx9Cvobtc6
	5cElcf1b5ZLY3/22/QUTpffnVCaKA1vzXZCKdiQRLP1y9GHDPCI3+EjdZefonSGrMnGtM9gIXQa
	QhfgBgl31FMXWUejXiA4Z0pgCHKQ3mDt7FOC6X1NVOOvluDwbh0WZveq+Kf2NkHpkNmBAGJv4WN
	yzlNiWdlbgk+nwwW9iazR8iTmR9WMTYa9zbLxWcIa7riDXYibQMSUUtAQ==
X-Google-Smtp-Source: AGHT+IFsrR++da94vh57i8gZG2YCIfCJlCqOllnoSuVQjwf/TtLCIaXs8yZigKmfjKjyX3pC2+VXhQ==
X-Received: by 2002:a17:902:d2c7:b0:216:5448:22a4 with SMTP id d9443c01a7336-219e6e89a6dmr805222645ad.10.1736178552138;
        Mon, 06 Jan 2025 07:49:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 1/6] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon,  6 Jan 2025 16:48:38 +0100
Message-ID: <20250106154847.1100344-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074912_826369_71C9F82E 
X-CRM114-Status: UNSURE (   9.14  )
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
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKaW5kZXggNmM4MjMxODA2NWNmLi5lYzc4ZGUwNzFlMGUgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9F
WFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhU
X05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBF
eHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlT
QklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDMz
IEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9T
UkVUX1goX19pKQkJKChfX3Jpc2N2X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFD
TF9TSE1FTV9TUkVUX1hfTEFTVAkJMzEKIAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVh
dHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5l
IFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJ
X0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFE
CQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9V
QkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAor
CVNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxf
UkVTRVJWRURfU1RBUlQJCT0gMHg2LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAw
eDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAs
CisJU0JJX0ZXRlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldG
VF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxf
UkVTRVJWRURfRU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NU
QVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZm
ZmZmZmZmLAorfTsKKworI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJKDEg
PDwgMzApCisjZGVmaW5lIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVAkJKDEgPDwgMzEpCisK
KyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwkJCSgxIDw8IDApCisKIC8qIFNCSSBzcGVj
IHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEK
ICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAotLSAKMi40Ny4xCgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
