Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7F1C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LPxYfekRiqiCcOXQ6j1Gz1DgQkB7Bg0Ux1N9bcPQ+M=; b=lsZjYuUZ/qOcYv
	dKQspo3LrtvkecVznNXHBcEDibpL8ywjnIPIpnIYhjpLgXAp+7m4p7gGSnaWb8h0FvTL6r/ge6RQv
	Dzyfm5tdSJfJ1aqGYbflwZMZ6hUAmnVlcKTGmrWG0MPYyJK47dsw0BhXbEdx03r96xDbZZFZ2AXO2
	FqnXe56+7tmVag5eVmV2Ip0QnJ5fu6/wXtY5+VvhfXmgkxecVt1v/3RfWxybC/qJk6dutEv4faUEV
	KFEq9h1cu0faFbxydp4RrLmeYAldCVs3/T62EsEgL0qk0w8wkmD/yjzT5x6J6wC3FRJFydJu7t63w
	9LmJMidnSLvbA3lnr4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1r-00000003Vhn-1rnB;
	Mon, 17 Mar 2025 17:13:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwz-00000003Td1-23CL
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso17350635e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231308; x=1742836108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8A8Qnnc9KJsjMpibTJNoHdSMni25LFd1e2ExEX8AcE=;
        b=BWhp6/ImpS4nu5/EQtMUzRa5W4y8onwS2kO3MR8IW+QmaN5L/dQ9wmQP0qZ3QzeEOU
         zlpLi4zuo10yC9yOv0Tf5r+4X5+yLwpbE+G0Vz1wC9Uai+Qmf0EPb6eGiDeB3vfYRmmo
         77IeiRj0aypqkOqaxsIscOSi9XIRnjM7XxlGC9B1x9PuRbHSC4UbnG5zhYZ+PeQOsesC
         LcqvTPxBuEZfDAGIhhCCZfqGFtwfS4aVlFLgU5PQHR26QD6gIFPzpnmCuF0znKDphSQn
         v/NHbHu5vMFUKhJNoN88UMtCwUMABZqMeRI0Uh6xQaP74ZneytEUQaIH28dz6gbueqdd
         cNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231308; x=1742836108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8A8Qnnc9KJsjMpibTJNoHdSMni25LFd1e2ExEX8AcE=;
        b=Va7ULBxjmzT0ZUAT1cda16HO/mHJ8vE7krLCbccujAB05kqhhIyy9Jhfm3K28NPLti
         PPlbpJGawwPJ9hJhPUmW9UD+IvMMsLWc13YNy9ZzoCeOQke3pJM9XiMMzkMdCLgsI+WA
         ZpvVeKKzv632EvT/4vrY9Btpg3+ITKYT3+Sj10O34y18K5E1gdmR4vtu56Ma563+UfQi
         TKNH04jU5TGxnfYPL3kMEK6OToQrBilmqmnaefn08oax+lA3dB2tz+kDF6otNaoMgrsb
         A+NasbM4E2MBOullhhXr/zmuqkFdQMTyrsMhJss13gaogkRkGO7t7XR3LoR1T6QwPs85
         5YlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmBeJ6P6/J/LUk5KEE+moT82dkx6aK62GWMI3bp0fk86sPTyQJW6Uqsdluj6xfACiWrRWIeZb1gk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm/dmyWd9vqoVFqlC3WBgDQK7XYLPFo0p73AJSS8YNUuUM9tGt
	VCam9kZBwO8fsftyWTemtEtxV040EScBaXzFgPjEA9UVYW8vpFtFzUfsaTdLS64=
X-Gm-Gg: ASbGncsOVw71nRM9weKMBMy9yAeSXadRTJGXyd7yHtw7bSqJoOv2s0HbwSwJmkS26fr
	yWJsuyf+gPPr7Wq/9yZLH9d+wBGyKCn3eUzOQAPkthiIrOz7si+uWOo+Yb9m6l5VIjg+sShhyR5
	/hwgFzOMuDv6teU5p0XsrBM6Es7xljdD4j+DsjG1jmu3mvxozPlIyE6bblwKXGihpDIWzLkKJ+Q
	EUUqVBC0tavPrgeaNSUA6uyEWYT+W2+XUSa3tsGhJKqUgf/8wvjrpp0czddpl+5oUXruCzMaGpB
	LcJ5PngtodnFVt/iIV7Li29N54c8hTfIk83B0ybFKls7Gw==
X-Google-Smtp-Source: AGHT+IGdYqlnvEy/PawZt8Sx5CxSE5paeIGe9C/m17bEJMfGQaAbMdJsnw0bGmy+W1Inh7nCACydaQ==
X-Received: by 2002:a05:600c:4f0f:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43d1ec8632dmr150023255e9.15.1742231308146;
        Mon, 17 Mar 2025 10:08:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:27 -0700 (PDT)
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
Subject: [PATCH v4 18/18] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Mon, 17 Mar 2025 18:06:24 +0100
Message-ID: <20250317170625.1142870-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100829_564573_34700DCD 
X-CRM114-Status: GOOD (  12.45  )
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
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IDhhN2NmZTFmZTdhNy4uYjA1
NTZkNjZlNzc1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKKysr
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
RykgIT0gMDsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0geworCXsKKwkJLmlkID0gU0JJX0ZX
RlRfTUlTQUxJR05FRF9FWENfREVMRUcsCisJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlz
YWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKKwkJLnNldCA9IGt2bV9zYmlfZndmdF9zZXRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAorCQkuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGln
bmVkX2RlbGVnYXRpb24sCisJfSwKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2Nv
bmZpZyAqCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
