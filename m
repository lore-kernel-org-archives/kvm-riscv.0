Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589BCC369DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPvRv71y1KkkWFAFG2iMATMXoXT+s0Dm5SP70d8AeAs=; b=IKO2VqRkGL1yqk
	oH0rAN02t0OBX/V/tcmk1VABdaEL6w4FYU1tTcl7MkgwY9Snphecei0BhZt+Dgr/KNxt+KM1uacHf
	xZn7j7DHqpsGXSq7XJiMFL1ua5POOXy7HqmvIRW7fxhcPXxxcwiJdoz7xtixNzFaB4E3ePI6z3hxx
	XD2VCybMZ9KcYwP5loM9baCfLwhokZ7JCrxbHOkGbPdADJTmdWQO1wWQlIQP4XHhmdiYv++3AI5x5
	Tk+43gZERCRfKa9CAWOoX0gyjln3vRc23/vXPUdng1RZiomhjX9r2gR2EKb96ykXBAWO2HYhrOulM
	pypxCIXv0Cf85uCaI7jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82ca-0000000FFJv-2lU7;
	Thu, 24 Apr 2025 19:52:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80UE-0000000EvFz-3Gt2
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXzCvVqwD1xQeGWZCz1UsZh6myMoBDUQY0JAsLX+Wro=; b=BiqqI+aBXxMlhjaIhh3jIN/v7y
	OdgA8WPLPJMn/fNv9DS3dSN95y7wbQBXy38vjAEkM11js0McfiI35x/zpNqgZMbg+TcoWcNDGWV7m
	3ClBRT0JBbRpiSeCBtw8x4mxK8sNbbclRoEml/Y8fmqq4+5k/FLs1JVKa3ZEyg/0OzgeBG+7bH3vv
	4zwOQteZp1GxlBBG65aYSRPqblN/ocYSDasOnQ8el7SHymyQyJeC9SHpKR9XBXBtBqVzUxoJYsg7k
	C/z1Ljik5dJIY0zvoC58uKnIbLLEA3SgqxCNgOgHlGi5wiQcmpnUbsprg7dhfL6xGl5wTf2gGC8o+
	/mx6Ovpw==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80UC-0000000BsTI-0J6I
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:35:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227b828de00so14623215ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516143; x=1746120943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXzCvVqwD1xQeGWZCz1UsZh6myMoBDUQY0JAsLX+Wro=;
        b=O5oL41QsahZqC9rfgw5mLGN3gWrVSLYCO/69Y1ISADwZjW6bu33LR0kuwe5GOIlj+G
         zzviIj89UxQDJYZUt1+U8d1gNy8cWqNGjQTkqQ9dKq7E5TpxOZw3WUghb8+EOnOGb2M9
         SMCVhUQJZKX82/Nt3zGYwdPJKZFKGiXr9ajrcUTjFNYCgNhStrP5/3jIy8ge9YCcpbzc
         qLe7GbKP1jiRo8s+9VtpuB+XFKeUs82qXT4cMb0QOribLtydUMIMFjOZI1uyyIFaf0Pz
         luGxSLwCDX+1TVVbIOmYEe3u74KAqPrMTXZH3r3Ar6mDq0mgLY6mONer6cnILnNgHijc
         sYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516143; x=1746120943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXzCvVqwD1xQeGWZCz1UsZh6myMoBDUQY0JAsLX+Wro=;
        b=xJ/gLpbpT5DRLhoeRS7Wh2kb8tDpr9xhz0/+9HzpvTX7cbNnwEzpz6z2vFprBUGoHv
         /hduoeekmi40cWi1gqO6dScacITiLspyoiYEmHHkxsj1cwhfuxas+fw3rZ8pEyOOOQiI
         QYxoJx3gNw7cGFWWTui7kski1AyPYBF5MuB/P1xqPSld2FA7YAeICX7cBzHvgAs4Yms7
         eB0RjHHWq8JRxfdlWzUhDQlLkS3MsooCrDU/o8ljPC4c+ALEYmwPt9jiUhGLyazDocvi
         YcxwXyUtPmw3hNU3RaTVylwLahUoIeixjKZeBwKdf5EUTvH5Kud1ySD5AuoEoefa5Ki7
         94BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqtUlTInsi34UAUVyvWUnqgAlIlHP0g6kMzsFDplaJMf126wTKPk/OLf3zbDc4IRGuGZK4Zkjittg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyduuVeQgIqN9IZ7Cj9LUYrNglvL2TaxddBNTG5fXk/NnjZQV2Y
	BFCdYCbnk5heszkgNLwK/KpX2OwHd5Utk9WubT4aOnZtERhwUokYdLQ2FhzcteY=
X-Gm-Gg: ASbGncuC1uMxjbHDvRvZjps3sJxWAiIoB0531WmFfa5gWanLjx49yxT3wQfSGrKgDe/
	Uhaz8+2F92NGy7MzCCSfKAzy6blwUCZq7Mhoabpb8iznWSh8Xw3Kx/gPm584cABLEIHecZotBUH
	tZsfCvzYC1dt+DWxUIExLCijzZzbIkibvn5quwqDiFQnwUMXk0aPO9HzJ+Bw6T+JtxuRGbySYnc
	xUvjJCb+Z31jAwI4vjv3MCO3eriZMlkqrg+itR+5Zy1BCtN3NomDAZaBR6mPvk8xO3jjCK1F1dT
	8sOfirIxMnG9ldE0L7xC3wArqYT0bceNE++8/Fgzfg==
X-Google-Smtp-Source: AGHT+IFqCoNXysJ8Uz6w7sA2JzHDg11kuHB44+WTgIOUFofZxJnqgRWWiibGSTc2Np3Gu4COYQqeSg==
X-Received: by 2002:a17:902:f683:b0:220:ce37:e31f with SMTP id d9443c01a7336-22db3bdb6bemr46068695ad.17.1745516142601;
        Thu, 24 Apr 2025 10:35:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:41 -0700 (PDT)
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
Subject: [PATCH v6 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 24 Apr 2025 19:32:01 +0200
Message-ID: <20250424173204.1948385-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183544_205457_4EE5BCEC 
X-CRM114-Status: GOOD (  12.27  )
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

U0JJX0ZXRlRfTUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRv
IGRlbGVnYXRlCm1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0
b3JlIGl0IGR1cmluZyBDUFUKbG9hZC9wdXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgIHwgIDMgKysrCiBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKaW5kZXgg
NTQyNzQ3ZTJjN2Y1Li5kOThlMzc5OTQ1YzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTY0Niw2ICs2NDYsNyBAQCB2b2lk
IGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAl2b2lkICpuc2g7
CiAJc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOworCXN0
cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKIAogCXZjcHUtPmNw
dSA9IC0xOwogCkBAIC02NzEsNiArNjcyLDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWNzci0+dnN0dmFsID0gbmFjbF9jc3JfcmVhZChuc2gsIENT
Ul9WU1RWQUwpOwogCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hWSVApOwog
CQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU0FUUCk7CisJCWNmZy0+aGVk
ZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7CiAJfSBlbHNlIHsKIAkJY3Ny
LT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9WU1NUQVRVUyk7CiAJCWNzci0+dnNpZSA9IGNzcl9y
ZWFkKENTUl9WU0lFKTsKQEAgLTY4MSw2ICs2ODMsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJY3NyLT52c3R2YWwgPSBjc3JfcmVhZChDU1JfVlNU
VkFMKTsKIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwogCQljc3ItPnZzYXRwID0g
Y3NyX3JlYWQoQ1NSX1ZTQVRQKTsKKwkJY2ZnLT5oZWRlbGVnID0gY3NyX3JlYWQoQ1NSX0hFREVM
RUcpOwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IGIwZjY2YzdiZjAxMC4uZDE2
ZWU0NzcwNDJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCkBAIC0xNCw2ICsxNCw4IEBACiAjaW5j
bHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5oPgogI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9zYmlfZndm
dC5oPgogCisjZGVmaW5lIE1JU19ERUxFRyAoQklUX1VMTChFWENfTE9BRF9NSVNBTElHTkVEKSB8
IEJJVF9VTEwoRVhDX1NUT1JFX01JU0FMSUdORUQpKQorCiBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2Zl
YXR1cmUgewogCS8qKgogCSAqIEBpZDogRmVhdHVyZSBJRApAQCAtNjgsNyArNzAsNDEgQEAgc3Rh
dGljIGJvb2wga3ZtX2Z3ZnRfaXNfZGVmaW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVy
ZV90IGZlYXR1cmUpCiAJcmV0dXJuIGZhbHNlOwogfQogCitzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3
ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cit7CisJcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKCk7Cit9CisKK3N0YXRp
YyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKKwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJ
CXVuc2lnbmVkIGxvbmcgdmFsdWUpCit7CisJaWYgKHZhbHVlID09IDEpCisJCWNzcl9zZXQoQ1NS
X0hFREVMRUcsIE1JU19ERUxFRyk7CisJZWxzZSBpZiAodmFsdWUgPT0gMCkKKwkJY3NyX2NsZWFy
KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOworCWVsc2UKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJ
RF9QQVJBTTsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKworc3RhdGljIGxvbmcga3ZtX3Ni
aV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAor
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKKwkJCQkJdW5zaWduZWQgbG9u
ZyAqdmFsdWUpCit7CisJKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAmIE1JU19ERUxF
RykgPT0gTUlTX0RFTEVHOworCisJcmV0dXJuIFNCSV9TVUNDRVNTOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlIGZlYXR1cmVzW10gPSB7CisJeworCQkuaWQg
PSBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKKwkJLnN1cHBvcnRlZCA9IGt2bV9zYmlf
ZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkLAorCQkuc2V0ID0ga3ZtX3NiaV9m
d2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCisJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0
X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKKwl9LAogfTsKIAogc3RhdGljIHN0cnVjdCBrdm1fc2Jp
X2Z3ZnRfY29uZmlnICoKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
