Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF8CCCF9FE
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 06:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=knda4WqH7SN+9WsOA0VNimR03u9bW8TpPJYqGXbrWvQ=; b=zb9Eh1sNmunokz
	G9uBFlB+8Fw9jit2E9jRuXXYI/DsLc4wVrwwMOPYAKX491LF5sfm/cdisduN0DjgSzzvUnzbK7dma
	AxyLkUanEiW2pGvyn3w1dZCr0nGCZYjkphLKd+NqPG3rm8TXGN3mAXDFy5J/qVAFDyEY7FMx3Lz27
	mu9c2crJkFmwK7mDLeOxZYy6iemQgZdunXaz8kdgtMv42GwFXkKGn3DEI2p68dfJiJg8CdBaKjUvQ
	AvNyCT0Smn79BqS4ivoF9bmqfgzbV7PvpL/JaomEbyjyEpkJXahgwSxCkYOiyq+aCXn0aeCRYjfy5
	UdL9GV0OV5gDESIE63Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo3V-00000009IeO-2yvg;
	Mon, 03 Nov 2025 06:28:41 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo3T-00000009IdP-03ny
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 06:28:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-27c369f8986so41280995ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 02 Nov 2025 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151318; x=1762756118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzWLA6lM7306PSkRpZwBsCJQbgLVcWr7Jb7jPn8ULYQ=;
        b=lprfn7tYTh2GbhHilzO9O7ui+jrSL8wzdY/GYO1rd12fJ0dwUr/62CskHPn8hKSSyr
         UWwNgaZJa1IPy+v2cm1zx+E9N/dqGeJ1uMac3+/D7rnPv5gIbzei1BseS1qVzeG9W2U9
         RIGLJ6XyDejJc/d8zzu1t6+dcn8yhLESvko8hwt8PpVnm220AfjoFPFmY+o+MQOGYn0p
         8OZGocGijSkvFUEkBv7l+Jsp1UfpQidzvKTrGhETVP6Egj7aSsClb8OufsMF/rg2bMie
         F3YHwRAc1Hd5zvC0oKvlTYGJDVCoHoKtROKYVWNJ6dQd5LGg/Z5sMglGoUnkyaLYMdpz
         CtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151318; x=1762756118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzWLA6lM7306PSkRpZwBsCJQbgLVcWr7Jb7jPn8ULYQ=;
        b=LSOI/TwxaQRMhWXO0JXC0v3vUne+0FSf7JbRFbUBXp0k3+XUcAQMlsDr5gwg2W/QfL
         v1EIAiF2xmcuR3MHkAuAM+GkDXqR240YBw9ywEYJrEJnmUsHSHQHxsEiyq9XKw7aJjz8
         Iv/WcrM3rh4vggu5AIS8f2yw7UsdaFc7TjFyIvr5B4h+ZcRVEz6vJ3P5dgMvjBIl1vty
         d6Z7257il2k91kPNIbmMKOeTbMeibpNcdbzM33CYfb6z+gDoD9P9fsuYz5CJjolxTVMF
         R+IbvHYUObi2Kb3Czur2a91qN545ehYznluRFY+JX0AwI5IyVh3dSYPINXW8KDTmxlB9
         yZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa+Ycac9ms4e6XkQFBZpCK+cbBAl+CBAi0pfzj58OlzYEpPgO5p7B3b31C+5rOsKo51F4X6fZSRfk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhZ/UcsWtS2aWBjlDKvVOFTqZHhcQ5gYvkqJCUC5oMev4en7xX
	6SRnUj0+XO4rDYSO7nODrozwHX4d87Dh8Q8Rs6JvDgHr+R3Ffls+ayI/
X-Gm-Gg: ASbGncuRxugeRYZakEV2METZc7qQn1/08gh93HPdaZO9JOv8JRsgNbsWeuQr+TMiS+L
	0K37mr+k4V9WfFABsHlQVMiqsm8JemKPGCgDY/1ouxamlUqpg0VhWAk37s+Jpy5+ZLVVAmMh+1/
	WXcelz3/hqshFEUMFgF31bp9pI9JcR5Mah6hr6aajZ1lW0MBoW82o3KR4vVwM6C9NCw2WZmzwIR
	FO+AE2L8ay/JzjMWqANt4Qeyo5GobxvfWQBBH6UhJ8Gl4HZ9f6tQFnSk6r2iF2MZJwfa65dqLpx
	FpcMX8wpMVBtlLddwauy3k7oBPugZKiIzk4149PeCyfdRikADBaEq6QDTv3xidcRc7QRfwGnCZW
	uoywD6mV4YS+2nHVZzlv56zLIgLWYhMk61oFeIMxCwI+7dLzzPbAkfKB0KaOIrJDPyJMbdal3go
	rqjRas+02TQ8ZRCbi5VcNU
X-Google-Smtp-Source: AGHT+IGieiNu6B5gkgyoDggtQ7uHFE1tUXXst+2hCFavgg4oBRkDQVMrd9IkdCDUo5boIWBJw2G0nw==
X-Received: by 2002:a17:902:c407:b0:295:57f6:76b with SMTP id d9443c01a7336-29557f60d3bmr68472355ad.7.1762151317697;
        Sun, 02 Nov 2025 22:28:37 -0800 (PST)
Received: from days-ASUSLaptop.lan ([110.191.181.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c482sm108155595ad.80.2025.11.02.22.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:28:37 -0800 (PST)
From: dayss1224@gmail.com
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Dong Yang <dayss1224@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] KVM: riscv: Support enabling dirty log gradually in small chunks
Date: Mon,  3 Nov 2025 14:28:25 +0800
Message-Id: <20251103062825.9084-1-dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_222839_068502_1706CA5C 
X-CRM114-Status: GOOD (  15.53  )
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

RnJvbTogRG9uZyBZYW5nIDxkYXlzczEyMjRAZ21haWwuY29tPgoKVGhlcmUgaXMgYWxyZWFkeSBz
dXBwb3J0IG9mIGVuYWJsaW5nIGRpcnR5IGxvZyBncmFkdWFsbHkgaW4gc21hbGwgY2h1bmtzCmZv
ciB4ODYgaW4gY29tbWl0IDNjOWJkNDAwNmJmYyAoIktWTTogeDg2OiBlbmFibGUgZGlydHkgbG9n
IGdyYWR1YWxseSBpbgpzbWFsbCBjaHVua3MiKSBhbmQgYzg2MjYyNiAoIktWTTogYXJtNjQ6IFN1
cHBvcnQgZW5hYmxpbmcgZGlydHkgbG9nCmdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3MiKS4gVGhp
cyBhZGRzIHN1cHBvcnQgZm9yIHJpc2N2LgoKeDg2IGFuZCBhcm02NCB3cml0ZXMgcHJvdGVjdCBi
b3RoIGh1Z2UgcGFnZXMgYW5kIG5vcm1hbCBwYWdlcyBub3csIHNvCnJpc2N2IHByb3RlY3QgYWxz
byBwcm90ZWN0cyBib3RoIGh1Z2UgcGFnZXMgYW5kIG5vcm1hbCBwYWdlcy4KCk9uIGEgbmVzdGVk
IHZpcnR1YWxpemF0aW9uIHNldHVwIChSSVNDLVYgS1ZNIHJ1bm5pbmcgaW5zaWRlIGEgUUVNVSBW
TQpvbiBhbiBbSW50ZWzCriBDb3Jl4oSiIGk1LTEyNTAwSF0gaG9zdCksIEkgZGlkIHNvbWUgdGVz
dHMgd2l0aCBhIDJHIExpbnV4ClZNIHVzaW5nIGRpZmZlcmVudCBiYWNraW5nIHBhZ2Ugc2l6ZXMu
IFRoZSB0aW1lIHRha2VuIGZvcgptZW1vcnlfZ2xvYmFsX2RpcnR5X2xvZ19zdGFydCBpbiB0aGUg
TDIgUUVNVSBpcyBsaXN0ZWQgYmVsb3c6CgpQYWdlIFNpemUgICAgICBCZWZvcmUgICAgQWZ0ZXIg
T3B0aW1pemF0aW9uCiAgNEsgICAgICAgICAgICA0NDkwLjIzbXMgICAgICAgICAzMS45NG1zCiAg
Mk0gICAgICAgICAgICAgNDguOTdtcyAgICAgICAgICA0NS40Nm1zCiAgMUcgICAgICAgICAgICAg
MjguNDBtcyAgICAgICAgICAzMC45M21zCgpTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3Vx
dWFuQGlzY2FzLmFjLmNuPgpTaWduZWQtb2ZmLWJ5OiBEb25nIFlhbmcgPGRheXNzMTIyNEBnbWFp
bC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0ICAgIHwgMiArLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKIGFyY2gvcmlzY3Yva3ZtL21t
dS5jICAgICAgICAgICAgICB8IDUgKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0v
YXBpLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAppbmRleCA1NzA2MWZhMjll
NmEuLjNiNjIxYzNhZTY3YyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGku
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdApAQCAtODAyOCw3ICs4MDI4
LDcgQEAgd2lsbCBiZSBpbml0aWFsaXplZCB0byAxIHdoZW4gY3JlYXRlZC4gIFRoaXMgYWxzbyBp
bXByb3ZlcyBwZXJmb3JtYW5jZSBiZWNhdXNlCiBkaXJ0eSBsb2dnaW5nIGNhbiBiZSBlbmFibGVk
IGdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3Mgb24gdGhlIGZpcnN0IGNhbGwKIHRvIEtWTV9DTEVB
Ul9ESVJUWV9MT0cuICBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgZGVwZW5kcyBvbgogS1ZN
X0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgKGl0IGlzIGFsc28gb25seSBhdmFpbGFi
bGUgb24KLXg4NiBhbmQgYXJtNjQgZm9yIG5vdykuCit4ODYsIGFybTY0IGFuZCByaXNjdiBmb3Ig
bm93KS4KIAogS1ZNX0NBUF9NQU5VQUxfRElSVFlfTE9HX1BST1RFQ1QyIHdhcyBwcmV2aW91c2x5
IGF2YWlsYWJsZSB1bmRlciB0aGUgbmFtZQogS1ZNX0NBUF9NQU5VQUxfRElSVFlfTE9HX1BST1RF
Q1QsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaGFkIGJ1Z3MgdGhhdCBtYWtlCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmgKaW5kZXggNGQ3OTQ1NzNlM2RiLi44NDhiNjNmODcwMDEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTU5LDYgKzU5LDkgQEAKIAkJCQkJIEJJVChJUlFfVlNf
VElNRVIpIHwgXAogCQkJCQkgQklUKElSUV9WU19FWFQpKQogCisjZGVmaW5lIEtWTV9ESVJUWV9M
T0dfTUFOVUFMX0NBUFMgICAoS1ZNX0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgfCBc
CisJS1ZNX0RJUlRZX0xPR19JTklUSUFMTFlfU0VUKQorCiBzdHJ1Y3Qga3ZtX3ZtX3N0YXQgewog
CXN0cnVjdCBrdm1fdm1fc3RhdF9nZW5lcmljIGdlbmVyaWM7CiB9OwpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwppbmRleCA1MjVmYjVhMzMw
YzAuLmExOTRlZWUyNTZkOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKKysrIGIv
YXJjaC9yaXNjdi9rdm0vbW11LmMKQEAgLTE2MSw4ICsxNjEsMTEgQEAgdm9pZCBrdm1fYXJjaF9j
b21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCiAJICogYWxsb2NhdGVkIGRpcnR5
X2JpdG1hcFtdLCBkaXJ0eSBwYWdlcyB3aWxsIGJlIHRyYWNrZWQgd2hpbGUKIAkgKiB0aGUgbWVt
b3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgogCSAqLwotCWlmIChjaGFuZ2UgIT0gS1ZNX01S
X0RFTEVURSAmJiBuZXctPmZsYWdzICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpCisJaWYgKGNo
YW5nZSAhPSBLVk1fTVJfREVMRVRFICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVNX0xPR19ESVJUWV9Q
QUdFUykgeworCQlpZiAoa3ZtX2RpcnR5X2xvZ19tYW51YWxfcHJvdGVjdF9hbmRfaW5pdF9zZXQo
a3ZtKSkKKwkJCXJldHVybjsKIAkJbW11X3dwX21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsK
Kwl9CiB9CiAKIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3RydWN0IGt2bSAq
a3ZtLAotLSAKMi4zNC4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
