Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6217FE77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq6avZ4uR5rBZRIb3Ovs0iGKhCGHPk9lb0piQylpVVs=; b=2CBvNUJcGQuTto
	k/bkkOzxlyEzBV0M/6QIAD4yVK83Rka/7fCzzKuGFkp0aGs0OMIBdrAIxdQuovTxLBZGhSkMNVlS5
	zx4XMQ87Zg0AKfbwV06j9jIbVqr78wJDp8HPMZvqG490pFjWQfSSA3A5rmfXTEdTjkZIkIfN9DuD4
	8mD6496pWzCpv3Jakr8eMuXe7MmWmx4OJ1EA4priFO4v8XCMQpaGz+Vq5M2x/MiyugAaW8jHvGTdF
	KVWB1j2HTWwHVybpvKWNJa9LYohIKUelNK96nNIgyGVA+i+L1OxLFtSXszbGm8XMiRXFly+UAXMHf
	o4vaBOlcpcEoEhFxmBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNe-00000001qX9-0P5e;
	Mon, 06 Jan 2025 15:51:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpM6-00000001q69-45QW
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so27188995ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178566; x=1736783366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxBjx4Pwy3s9wNFrCu0QzGcTxzWHmeeGktVNtPbGFVU=;
        b=yrBXisn9kLaZDUsi+ru2LW7uTx/o035pO1LasK5ueTllt3JBljp42ALy9Noe5lixaA
         flzp7Mq79rfQazp3jrSeBpqWJBv0Iqpy87LAdSyj1UyYF+olPP9UqdYb133AyCiS/xZG
         bmtMVlKD7dwW7wEsoZBoT4I5z8QBO4K/kflHMSl51a0QURAB/NMWcirPENvXwBgFuAoF
         PJj7/vcE0m7ZC5EyDSA8c0liCViPuPv5BG9TLjsKuL2QCMdoe0HZxAMLY4ntukkcSBrs
         HVjC0SWSLp2LfUTlkMEuU/MPDdZAwniM9WU9iGphzifPmBiRaxMkwNFCNdgrT12eFmjs
         pRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178566; x=1736783366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxBjx4Pwy3s9wNFrCu0QzGcTxzWHmeeGktVNtPbGFVU=;
        b=ivhxsRZkXIwjfmZwfMZy15k8nBzt9t2P19VxM4pP6Uu7mOq/CIob7SntdxWOQJhgY0
         /ZqK8cphQAMNN+6aOIbVJ7GhAUWIEvAbufovYKYqY9clHkfC3pFNfWrpK3OR2T6Dzmsr
         4rLxLl3MQ1+n49iPceZdx0hsKuzpAfWhxWNyAricQIaalnVDdrtF4JGnrG+Rb5Nw0aaK
         E+vsF9Wey0NLE266mwVH1N+PVKhXBDzN8JxSXDoDjrLp1H4ZxvfYOurHHvJmSRDcx+Co
         FSbBZHJs2ShuRBbiISOYlggP7ZWQEkUw3rQghvMmpH8Dth5xqmF4LInjhFKwcIGe+4Tb
         0VhA==
X-Forwarded-Encrypted: i=1; AJvYcCVe3fXngjS6pI0A7t5x1SM+OemP7o57BQzMnJrcaV4gwgEYj9GXhZBgR8qHCHy8YHlH/myouEkUGlI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcvhlAS5u7NH2eqVdepDySYujdx9/U2NWP9MYbmQkjmVs6l20a
	1gjlEc1tA8qHaspB432EUOHzogoRgWGZO2qCLBzh3hEdJXMcANxlC5XI2dsiZ8M=
X-Gm-Gg: ASbGnctEynygpaTT0rLL4sHXJ6149wrf8GHjkAbOHLAUxVUc4m3ZGDbtAQn4jCQLbQC
	gaRreYSxFiWUdIKW2tEGG/Y/IIX2B75Hqiix95zsgtvbcccXN+CbpC9Yp5qblZhFLWKGTmRXe1h
	Xqde/kU2KBn1FRdKKC77vpiIaNE4ZVF54ByyTumcrpfU1fWSq3EzMr9e/t8XDaHnllnhq62W9sX
	Yu+ryWCnxYODeu4Jh6C+39H/Vx3qdO4cz04yJbfK/8WYAScL2riJ6jvpQ==
X-Google-Smtp-Source: AGHT+IFBFcio9MaUGZCTb/Jg2857ywT0hQvVtOg6GlbEZCyc6I2hLialdck8Jevr/BDDD1XTJo/mLA==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr872299045ad.26.1736178564924;
        Mon, 06 Jan 2025 07:49:24 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:24 -0800 (PST)
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
Subject: [PATCH 3/6] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon,  6 Jan 2025 16:48:40 +0100
Message-ID: <20250106154847.1100344-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074927_010379_41B0ADCB 
X-CRM114-Status: GOOD (  16.15  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysrCiBhcmNoL3Jpc2N2L2t2bS92
Y3B1LmMgICAgICAgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMg
ICAgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hh
bmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oCmluZGV4IGI5NjcwNTI1OGNmOS4uOGM0NjVjZTkwZTczIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKQEAgLTQ5LDYgKzQ5LDE0IEBAIHN0cnVjdCBr
dm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHsKIAogCS8qIEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBm
dW5jdGlvbiAqLwogCXVuc2lnbmVkIGxvbmcgKCpwcm9iZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKKworCS8qCisJICogSW5pdC9kZWluaXQgZnVuY3Rpb24gY2FsbGVkIG9uY2UgZHVyaW5nIFZD
UFUgaW5pdC9kZXN0cm95LiBUaGVzZQorCSAqIG1pZ2h0IGJlIHVzZSBpZiB0aGUgU0JJIGV4dGVu
c2lvbnMgbmVlZCB0byBhbGxvY2F0ZSBvciBkbyBzcGVjaWZpYworCSAqIGluaXQgdGltZSBvbmx5
IGNvbmZpZ3VyYXRpb24uCisJICovCisJaW50ICgqaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKKwl2b2lkICgqZGVpbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogfTsKIAogdm9pZCBr
dm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBr
dm1fcnVuICpydW4pOwpAQCAtNjksNiArNzcsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2Jp
X2V4dGVuc2lvbiAqa3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAogYm9vbCByaXNjdl92Y3B1X3N1cHBv
cnRzX3NiaV9leHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlz
Y3ZfdmNwdV9zYmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAq
cnVuKTsKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
OwogCiBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdW5zaWduZWQgbG9uZyByZWdfbnVtLAogCQkJCSAgIHVuc2lnbmVkIGxvbmcgKnJlZ192
YWwpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCmluZGV4IGUwNDhkY2M2ZTY1ZS4uMzQyMGE0YTYyYzk0IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCkBAIC0xODAsNiAr
MTgwLDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3Bvc3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQogCiB2b2lkIGt2bV9hcmNoX3ZjcHVfZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
CiB7CisJa3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdCh2Y3B1KTsKKwogCS8qIENsZWFudXAgVkNQ
VSBBSUEgY29udGV4dCAqLwogCWt2bV9yaXNjdl92Y3B1X2FpYV9kZWluaXQodmNwdSk7CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaS5jCmluZGV4IDZlNzA0ZWQ4NmE4My4uZDJkYmIwNzYyMDcyIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAg
LTQ4Niw3ICs0ODYsNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKIAlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZj
cHUtPmFyY2guc2JpX2NvbnRleHQ7CiAJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5z
aW9uX2VudHJ5ICplbnRyeTsKIAljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAq
ZXh0OwotCWludCBpZHgsIGk7CisJaW50IGlkeCwgaSwgcmV0OwogCiAJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUoc2JpX2V4dCk7IGkrKykgewogCQllbnRyeSA9ICZzYmlfZXh0W2ldOwpAQCAt
NTAxLDggKzUwMSwzNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKIAkJCWNvbnRpbnVlOwogCQl9CiAKKwkJaWYgKGV4dC0+aW5pdCkgeworCQkJ
cmV0ID0gZXh0LT5pbml0KHZjcHUpOworCQkJaWYgKHJldCkKKwkJCQlzY29udGV4dC0+ZXh0X3N0
YXR1c1tpZHhdID0KKwkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFOwor
CQl9CisKIAkJc2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9IGV4dC0+ZGVmYXVsdF9kaXNhYmxl
ZCA/CiAJCQkJCUtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19ESVNBQkxFRCA6CiAJCQkJCUtWTV9S
SVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEOwogCX0KIH0KKwordm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVf
c2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7CisJY29uc3Qg
c3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5ICplbnRyeTsKKwljb25zdCBzdHJ1
Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0OworCWludCBpZHgsIGk7CisKKwlmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsgaSsrKSB7CisJCWVudHJ5ID0gJnNiaV9leHRb
aV07CisJCWV4dCA9IGVudHJ5LT5leHRfcHRyOworCQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKwor
CQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlfU0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykp
CisJCQljb250aW51ZTsKKworCQlpZiAoc2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSAhPSBLVk1f
UklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRCB8fCAhZXh0LT5kZWluaXQpCisJCQljb250aW51
ZTsKKworCQlleHQtPmRlaW5pdCh2Y3B1KTsKKwl9Cit9Ci0tIAoyLjQ3LjEKCgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
