Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C7C369A0
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkg3tqnPbaEEjQPrcleV3Vqx1UaufolHLUVtZm6XE/E=; b=jihYVcnefgnYcc
	K9Y1i8n2S+/1VnUK4eglGKR50j69KmR0/pscbdKmrRE0YgnIStp+QdnJfEt8Q9IpfWvjZnoGC7/nX
	9XdrKDtf1rTO+Pt68GzSQaBKq+GXHFq43m9gLkP6L2pEOLrFY2QiwabJ5BuM9reRwtRCnhFZXdgKX
	HYIvaXj+9o8LC+UhGi1B08Kl9huw/ZrcyZkVtjS6oQD9rW7wfHuw0BBTwzi8XBXS3/bzOKeWD7teU
	LUW1c6H92fQ+Evuo5bN4ZMUfbSjfjU+7bH4XL9AOnG+Hkc6iv5vkQvXI+v3k+A1LuTPwKGvdZcPJD
	B+OoXYl0mgIDx5BSLElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItD-00000008jTB-3uy0;
	Thu, 03 Apr 2025 11:37:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Inv-00000008iSX-1IZ7
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso734775e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679933; x=1744284733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBJFdG3z/8VkLDYY4XL1oPtAwDow6ej1t0aXVg/kRKM=;
        b=AAyw2tVPqvFvGlKZdvzvF7zb86fc9q1PamjOVMCJtS5uccYwOEQntUxPrHm1VUwW53
         d9Y7YsNq2vsx9PwqqjetBx+OwEylvn7RhBc3faQ0LObUfThqGODvxlnHicvPuEmGmuUY
         PHibHzjITS2EQvryndq8CbXPLUEpu2ckO4Y7l0PXpdCP7FYwxXqBvdxhB6z38gO05bIf
         1twx4TlJJwA/GfVI3JD41isEGhxIDmuUEid9xuL2aEcsc8eYnqpMe0fRPZ+tuSZJUT1F
         Nmw5VaOprnmNO7/DdQi/Bgy54Hs5FLqQHVNfqKzJ5DUEWD+cXQQO6k57KU90VOrc77+q
         tHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679933; x=1744284733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBJFdG3z/8VkLDYY4XL1oPtAwDow6ej1t0aXVg/kRKM=;
        b=Q7KKN7OhrhCM95dhJ0DjVjW/Djr7b1QLPtTYb/UCd55bou20HoJ6pGo7EvM+HM7fuR
         3394V0OlQQFf46uoBxU+aO+TVBWuCos6bmJHoPFMIncr+hrIiBDdzRrWyPIzb+lNizk/
         dwRRhIMdXNYayKyRddO2V4EWxPAtBRX/SrC0bDNB/73ogAax/HZtbVIa6Mmx++VX3JdE
         bCl7+uhHYU+G5pAU29F6MFaSk4zSJlKN3szPYgJVob70S9ftfAp/3ZeNCNqpYCiO3d4d
         KmNrNjHyX6/XCqquUXrf+/ycE3ukO/v0/FGIU7e1Nev8Q87tKOD0uIvV79yOohuqsvod
         06Zg==
X-Gm-Message-State: AOJu0YxWWlT333ir1EcN4MhbcQVChPSh71wZo35baTfIeZb4+GUo4XEx
	o2Fv48kmm0HWkd9bWG4AIT5mI8J/5PqUXOkDLLmaD/GhkY+vbfsX+bmZrEg4ovQiV7TXy9+9ep4
	R
X-Gm-Gg: ASbGncvFVfmy8qiCejnze+tL01pXbpB3S7UGMK/V9F1Bn3bC1w1lgqqXDslj4xwJh0C
	S1LAe2wnovX2Jyn1o1ir/9SRUvl4FdM43/8prpm7g7c6fxUqRJQ1wzcKH7n3sd2QDuEJkxb+nNf
	YDhJNSaX1B5MN/y7TI4em5OG8j/i1QxLOEkT5B/bes5shf9hQU6IectiG7pp6K+M36ziucUbf/t
	xfomNi+6ibsSuCM0LCAmoXf5i4y2W+4/ya6djUmB6Lw3H+Pa+axxy56xQn00n1Wv8+UFWliyZzu
	6y1bYi+QogPpeNRSv2P7ngZCvMSVIRoouZSSGEtiEH1iLgnYF9ba9kyPlA+uSk56CvLwm2+cpnJ
	BRw==
X-Google-Smtp-Source: AGHT+IEmT1nc0GRaKk4V5Lw6Y+h94knU+oKxuBtmIqWaoagUJp23E2laTFWN8HrLfDImIKVCRKrM7g==
X-Received: by 2002:a05:600c:3510:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-43ea93540demr38321015e9.3.1743679933409;
        Thu, 03 Apr 2025 04:32:13 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm16500145e9.7.2025.04.03.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:13 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Date: Thu,  3 Apr 2025 13:25:21 +0200
Message-ID: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043215_351605_C8195909 
X-CRM114-Status: GOOD (  12.26  )
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

VGhlIHNhbWUgY29kZSBpcyB1c2VkIHR3aWNlIGFuZCBTQkkgcmVzZXQgc2V0cyBvbmx5IHR3byB2
YXJpYWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFu
YW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwg
IDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAxMiArKysrKysr
KysrKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jICAgICAgICAgfCAxMyArLS0tLS0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyAgICAgIHwgMTAgKy0tLS0t
LS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAppbmRleCA0ZWQ2MjAzY2RkMzAuLmFh
YWE4MTM1NTI3NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9z
YmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCkBAIC01NSw2
ICs1NSw4IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N5
c3RlbV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgICBzdHJ1Y3Qga3ZtX3J1
biAqcnVuLAogCQkJCSAgICAgdTMyIHR5cGUsIHU2NCBmbGFncyk7Cit2b2lkIGt2bV9yaXNjdl92
Y3B1X3NiaV9yZXF1ZXN0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYywgdW5zaWduZWQgbG9u
ZyBhMSk7CiBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JldHVybihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwogaW50IGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfc2Jp
X2V4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgY29uc3Qgc3RydWN0IGt2bV9vbmVf
cmVnICpyZWcpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggZDFjODNhNzc3MzVlLi5mNTgzNjhmN2RmMWQgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmkuYwpAQCAtMTU2LDYgKzE1NiwxOCBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9z
eXN0ZW1fcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJ1bi0+ZXhpdF9yZWFzb24gPSBL
Vk1fRVhJVF9TWVNURU1fRVZFTlQ7CiB9CiAKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVl
c3RfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBjLCB1bnNpZ25lZCBsb25nIGExKQoreworCXNw
aW5fbG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOworCXZjcHUtPmFyY2guZ3Vlc3Rf
cmVzZXRfY29udGV4dC5zZXBjID0gcGM7CisJdmNwdS0+YXJjaC5ndWVzdF9yZXNldF9jb250ZXh0
LmEwID0gdmNwdS0+dmNwdV9pZDsKKwl2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQuYTEg
PSBhMTsKKwlzcGluX3VubG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOworCisJa3Zt
X21ha2VfcmVxdWVzdChLVk1fUkVRX1ZDUFVfUkVTRVQsIHZjcHUpOworfQorCiBpbnQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX3JldHVybihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVu
ICpydW4pCiB7CiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY3AgPSAmdmNwdS0+YXJjaC5ndWVz
dF9jb250ZXh0OwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwppbmRleCAzMDcwYmIzMTc0NWQuLmYyNjIwN2Y4
NGJhYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKQEAgLTE1LDcgKzE1LDYgQEAKIAogc3RhdGljIGlu
dCBrdm1fc2JpX2hzbV92Y3B1X3N0YXJ0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKLQlzdHJ1
Y3Qga3ZtX2NwdV9jb250ZXh0ICpyZXNldF9jbnR4OwogCXN0cnVjdCBrdm1fY3B1X2NvbnRleHQg
KmNwID0gJnZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dDsKIAlzdHJ1Y3Qga3ZtX3ZjcHUgKnRhcmdl
dF92Y3B1OwogCXVuc2lnbmVkIGxvbmcgdGFyZ2V0X3ZjcHVpZCA9IGNwLT5hMDsKQEAgLTMyLDE3
ICszMSw3IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9oc21fdmNwdV9zdGFydChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCiAJCWdvdG8gb3V0OwogCX0KIAotCXNwaW5fbG9jaygmdGFyZ2V0X3ZjcHUtPmFy
Y2gucmVzZXRfY250eF9sb2NrKTsKLQlyZXNldF9jbnR4ID0gJnRhcmdldF92Y3B1LT5hcmNoLmd1
ZXN0X3Jlc2V0X2NvbnRleHQ7Ci0JLyogc3RhcnQgYWRkcmVzcyAqLwotCXJlc2V0X2NudHgtPnNl
cGMgPSBjcC0+YTE7Ci0JLyogdGFyZ2V0IHZjcHUgaWQgdG8gc3RhcnQgKi8KLQlyZXNldF9jbnR4
LT5hMCA9IHRhcmdldF92Y3B1aWQ7Ci0JLyogcHJpdmF0ZSBkYXRhIHBhc3NlZCBmcm9tIGtlcm5l
bCAqLwotCXJlc2V0X2NudHgtPmExID0gY3AtPmEyOwotCXNwaW5fdW5sb2NrKCZ0YXJnZXRfdmNw
dS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwotCi0Ja3ZtX21ha2VfcmVxdWVzdChLVk1fUkVRX1ZD
UFVfUkVTRVQsIHRhcmdldF92Y3B1KTsKKwlrdm1fcmlzY3ZfdmNwdV9zYmlfcmVxdWVzdF9yZXNl
dCh0YXJnZXRfdmNwdSwgY3AtPmExLCBjcC0+YTIpOwogCiAJX19rdm1fcmlzY3ZfdmNwdV9wb3dl
cl9vbih0YXJnZXRfdmNwdSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3N5c3RlbS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMKaW5kZXggYmMwZWJi
YTg5MDAzLi4zNTliZTkwYjBmYzUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3N5c3RlbS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jCkBAIC0xMyw3
ICsxMyw2IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfc3VzcF9oYW5kbGVyKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKIAkJCQkgICAgc3RydWN0IGt2bV92Y3B1
X3NiaV9yZXR1cm4gKnJldGRhdGEpCiB7CiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY3AgPSAm
dmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0OwotCXN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKnJlc2V0
X2NudHg7CiAJdW5zaWduZWQgbG9uZyBmdW5jaWQgPSBjcC0+YTY7CiAJdW5zaWduZWQgbG9uZyBo
dmEsIGk7CiAJc3RydWN0IGt2bV92Y3B1ICp0bXA7CkBAIC00NSwxNCArNDQsNyBAQCBzdGF0aWMg
aW50IGt2bV9zYmlfZXh0X3N1c3BfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBrdm1fcnVuICpydW4sCiAJCQl9CiAJCX0KIAotCQlzcGluX2xvY2soJnZjcHUtPmFyY2gucmVz
ZXRfY250eF9sb2NrKTsKLQkJcmVzZXRfY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2Nv
bnRleHQ7Ci0JCXJlc2V0X2NudHgtPnNlcGMgPSBjcC0+YTE7Ci0JCXJlc2V0X2NudHgtPmEwID0g
dmNwdS0+dmNwdV9pZDsKLQkJcmVzZXRfY250eC0+YTEgPSBjcC0+YTI7Ci0JCXNwaW5fdW5sb2Nr
KCZ2Y3B1LT5hcmNoLnJlc2V0X2NudHhfbG9jayk7Ci0KLQkJa3ZtX21ha2VfcmVxdWVzdChLVk1f
UkVRX1ZDUFVfUkVTRVQsIHZjcHUpOworCQlrdm1fcmlzY3ZfdmNwdV9zYmlfcmVxdWVzdF9yZXNl
dCh2Y3B1LCBjcC0+YTEsIGNwLT5hMik7CiAKIAkJLyogdXNlcnNwYWNlIHByb3ZpZGVzIHRoZSBz
dXNwZW5kIGltcGxlbWVudGF0aW9uICovCiAJCWt2bV9yaXNjdl92Y3B1X3NiaV9mb3J3YXJkKHZj
cHUsIHJ1bik7Ci0tIAoyLjQ4LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
