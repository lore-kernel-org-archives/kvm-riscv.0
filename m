Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613DFC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Dn/65Fug814bjDb36EoU/9FDmVxMvQHazKH89Y9riw=; b=49ERys+0dOKdMP
	RaeOp7yJjiyupa+l9b/Nqbn6VGyPb6kgqTLU0RuhLsPP8X/kB2pZvs3mNnwLU9x8AEBoMcQSxE/dq
	RDPEKqY5S8tGZTEJLArlVe7eHfUYGdPc0KCgm/dLVlajYF7K0fOZ4myLw7TOgbXUY0yga6/fmBb2u
	Tt/OTyrdG8zQ1uiMNZxXoWzKr911/luqs34gxgYQ0fW/U82dOHtSuTK2sRKSTuvY7wMgnkNKNEPWW
	rBYXVr8dGE8NSL7QFmh6GSN7z5A1tx/kz5KqOztqzpFxzfX/MBWfUx7eBhWkhA/kpOx3V11iXWiZw
	44+Emw/Dyuy2pdJbrc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWN-00000003Z9z-0dD6;
	Fri, 23 May 2025 10:20:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWK-00000003Z91-48ko
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:20:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7426c44e014so8615717b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995656; x=1748600456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=Cjjj/Rg3jXBNJhlN6dTKEwOMSFWs07YK97rL6/fDT3WKGJ5oRiIlJdWQuoMcmL8RdQ
         T9KlWvIklXNE4Fxz2yJxCfxevB6yjU7yXomV/ZwY+7EH5WOpH+YWrmyVrtajRDgF8ZWR
         q7n2JTZbqLyJ7mlZLbCiBK/aW+L64pJcNrtCA+i0PAOt2+mKIJdQrvjgmS/NILxekeio
         nkXSvz5yvfO97S+PDWULzAzNamqXzlyEweWguKkUfP40ZxBXn1jtr+cpv0z2rnkGrN6h
         TK/PiE3seWZxRVR/dkmG3ejSSh66D1V+Do47b1ArKlZsmwmw45+3ty+w7Xx1F8IY5UVj
         gozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995656; x=1748600456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GthJpHk7CYaw8f95HNVaUdqkaGIjKWsbIYnr+62Txtw=;
        b=rl0h5vuwYCNVfktwim9ef0xXEUmpcnPxJOc4KFc1N8oZWubvoFLwd5p11zsgqf+3Qp
         QVbgoqFCGijSWsem7BPsu7HdAgC6YbgI/J298hMiL9Qcb59IC3b12GaOgHnpu0kvPoi7
         eXp6FJ+Wg90uTsNpN2dU9+gc0fWEitMx6ZGcQwsd0E4fZ5dpOfwZt1t2qYjPeX/Jok3n
         IhZbG2v8FU2blfLb1Km2he2faOlzE5vk9awsnFhlrhpFeEFP0olp638ix5gkw+T9C9AK
         /04s95O2kF1/YpTDYu/wkjovgvKQe19szhM8rIDUhZeLN4nJZrp59Itm1e6qbwvlAIhI
         sqZA==
X-Forwarded-Encrypted: i=1; AJvYcCWB8Vnd23u9tLqA//FrjMJpU8yeeS2BEB5wM06kvgnirvLC9wZ90X6NIFuxgz5Jj1R06YOxWOWU8bw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFIOBFOXPMbRNzR+eQamsgKNGjDfclHmV0cE35CyYlL+2eVMux
	XEz6wVACFBrhsuIOwavmGJ70gPuNX/keskJdQAuLa5WOb5kdm0RgHgU90n2AoKyzJrc=
X-Gm-Gg: ASbGncvSwoPcsdAeNwzlHEux3h2D2kt/d32sj6RYYohP9CI7QWeicSpeJVPfN5+Uw5L
	9HmK360ORgi1YzvW0w0fTvwRCtYsNu/G5P32kqVQnKEFGlctIWkBcRXVyd0zNuWHHL9MkxtgEQ2
	/OY7jXoj9FthMndmSgrDApJAdJ11Wdzs6MwouZ0t7PGCwktuPogEwQb4tovWCxTpB2atiRE84ZW
	vwgagOzirW+XrUemQcJdHinG04XYotJXELDQXgBHc6dt//ROPmaiSULSYd1mLuFFtIZyHA35X1F
	8AXwNl2nsYN6vG4m109lZoAIX7MLBUc8u+IR1JXRz3SZqZjxw2UpzhRnrGjGLEM=
X-Google-Smtp-Source: AGHT+IGNn5Ze7RmeDktlCW0T183bymn1C862lKIDtG+J3J1vY1Fk8ZeY7B6o/JkpGeXA+XwUMijVpg==
X-Received: by 2002:aa7:888e:0:b0:742:39fa:13df with SMTP id d2e1a72fcca58-742a98a2520mr39921026b3a.19.1747995656125;
        Fri, 23 May 2025 03:20:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:20:55 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
Date: Fri, 23 May 2025 12:19:18 +0200
Message-ID: <20250523101932.1594077-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032057_025333_5F646913 
X-CRM114-Status: UNSURE (   9.38  )
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
