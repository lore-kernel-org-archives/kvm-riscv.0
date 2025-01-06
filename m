Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEFDE7719B
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WlRPbbK29ZtupXLillKaNSCx2MCn8pMQ5ytYPormFA=; b=XdIEoHKD+nm5NW
	386JZIEvojMNxRI8jmccBESDzA3ONNwOYS8R2IE3VWHroeccNySFBf2QdtgFvEJrGbAkJldoxcc+o
	vQXKxPNEhCJD/VZCA6OvHtPhVmTAFNr23Zpg8TZxymY10GGhj+6x7RkfbsuVBUVXBX9uKRY1No/aH
	gCV2PIFaZ8e9EBEc2BEnIMv1OAtymwN8IYKbrEpmdBa4I5DbTSHF7TkjnIDdpoTnXcWPQWGz7bqEE
	heQjqCeawsmUD6QdA+o42GAD+T0bnQ/9sZyy4V2f0a1nKCf2QwIa0a3chSvMPuk4NgAfgjzf0KkBC
	SF+mcXxjypLOXAJumN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNi-00000001qe7-0iZy;
	Mon, 06 Jan 2025 15:51:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpMO-00000001qAs-2VYn
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21644aca3a0so27195315ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178584; x=1736783384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZted/4cRJuHwsNYAobqssxEi0f1evq9XJsjrZaPJkE=;
        b=qE09TAerULb2Uj/U+3abDvmMdeiN+gxMokDgR22KtWwj3jLhHSLBSq7JKPE0BEtnYC
         tdkGdH98Y4xiDBnss4ZQYZSukZYYq5Do3pDghRwn14Hh9afUc5t4Z1a/JENzhTo4z7Bc
         RA2gd1+xP7uA3w7WAaxyiYfG9cGzOpJjhuJmsFEMTtRcpKD8X7BtaMwsmuO6jh7xO+Ub
         13tWwMhthoCkjytNsYMU4WlBkmwkxqdekHtq0KC6u3zoitfmkMPKh9ooqMhVOHhOKF+Q
         Y6huWmVLLKIxYZaS+Y2lqZjWPlrp6qFGJOqoGXchUBrtiB7Qb2ICPg6k6JkpOFq536K7
         1BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178584; x=1736783384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZted/4cRJuHwsNYAobqssxEi0f1evq9XJsjrZaPJkE=;
        b=MKKR+uA/5RyjrifqE8ldTCfUdN3cY5EDihauGH9RFC6qvS/Td9KF4u4wns8cDWzpAc
         tUhMeSrDZIA8hGm+rTxYSOS/iGvVfdlFoJ4ej4e43SFK4bmrnPzKz9UQLvsQ3IzTROue
         Jct6um3rrH1lCNzr37P6PY4TV+KIxzU4iDWxg740XM4t0DKMSp87b0e0cpGAzgCM1k+N
         7HrOdGqvlqt2K0K9fNvhgVixb06k3KwLQMblIHBrEW4qijxo70VkD+dEBx+hx0BM48hA
         oTzl5mkn2vM79FIRUmVwN4Y5PrlanoAFzb4qhT1gP2nnefmWOpCs5yEWt86gzm5+b+XR
         4+/A==
X-Forwarded-Encrypted: i=1; AJvYcCV1vDC1Vp+D6QMUV9i7CB6QaS74sBSMWJuy4CNJGWGTa3PTbqikzni8OsRPEBaSSbUY6CckpYKEFcs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLwnTGTqNhLnKRvLgbXicbBbsId/5yLvYUqYlcaJG4a66IFnKd
	EfvHC9EXQOnhRi02Psh8qThml782T7RgZvnrM3EOn0Jm38MGS5f25CSCoiJx2Ro=
X-Gm-Gg: ASbGnctjWKZCS1hDml0B3W+G1Naxxhw/wjwDPMlOxew6GLO/TcM+E/oXNEScfL0x1xX
	zKVStDdJonhJLuOq0FICyxhM/kbHgI6FlVPvsFBBc4nodeGC9qRt1yhQ4WbacQAJiulFd1uE3/v
	Sy5UQnBTq+qtJX1xWFszExYcFBAqSBUzw+zzmoC4ok2cxCpxyB6h+HTYCG5gOcdZLKJQxYsIuNt
	tAeuSZ3Mh5Teb+NYkt1ez3xON7yp55v1SxvbsIYA3WRQlg0jv5c46NGPQ==
X-Google-Smtp-Source: AGHT+IEOmk52vJbM/lir6EnXzGo8rHZx0c8SdsX59VoQTeStIErxbb+u7Tg8JzB4+OJAm4+54IkSXg==
X-Received: by 2002:a17:902:e886:b0:216:5e6e:68cb with SMTP id d9443c01a7336-219e6e9fd95mr868563935ad.16.1736178584085;
        Mon, 06 Jan 2025 07:49:44 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:43 -0800 (PST)
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
Subject: [PATCH 6/6] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Mon,  6 Jan 2025 16:48:43 +0100
Message-ID: <20250106154847.1100344-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074944_640113_6043172D 
X-CRM114-Status: GOOD (  12.80  )
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
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAg
ICAgIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAzOSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1LmMKaW5kZXggMzQyMGE0YTYyYzk0Li5iYjZmNzg4ZDQ2ZjUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTY0MSw2
ICs2NDEsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IHsKIAl2b2lkICpuc2g7CiAJc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2gu
Z3Vlc3RfY3NyOworCXN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNm
ZzsKIAogCXZjcHUtPmNwdSA9IC0xOwogCkBAIC02NjYsNiArNjY3LDcgQEAgdm9pZCBrdm1fYXJj
aF92Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWNzci0+dnN0dmFsID0gbmFjbF9j
c3JfcmVhZChuc2gsIENTUl9WU1RWQUwpOwogCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFkKG5z
aCwgQ1NSX0hWSVApOwogCQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU0FU
UCk7CisJCWNmZy0+aGVkZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7CiAJ
fSBlbHNlIHsKIAkJY3NyLT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9WU1NUQVRVUyk7CiAJCWNz
ci0+dnNpZSA9IGNzcl9yZWFkKENTUl9WU0lFKTsKQEAgLTY3Niw2ICs2NzgsNyBAQCB2b2lkIGt2
bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJY3NyLT52c3R2YWwgPSBj
c3JfcmVhZChDU1JfVlNUVkFMKTsKIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwog
CQljc3ItPnZzYXRwID0gY3NyX3JlYWQoQ1NSX1ZTQVRQKTsKKwkJY2ZnLT5oZWRlbGVnID0gY3Ny
X3JlYWQoQ1NSX0hFREVMRUcpOwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IDU1
NDMzZTgwNWJhYS4uMWU4NWZmNjY2NmFmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9md2Z0LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCkBAIC0xNCw2
ICsxNCw4IEBACiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5oPgogI2luY2x1ZGUgPGFzbS9r
dm1fdmNwdV9zYmlfZndmdC5oPgogCisjZGVmaW5lIE1JU19ERUxFRyAoMVVMIDw8IEVYQ19MT0FE
X01JU0FMSUdORUQgfCAxVUwgPDwgRVhDX1NUT1JFX01JU0FMSUdORUQpCisKIHN0YXRpYyBjb25z
dCBlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCBrdm1fZndmdF9kZWZpbmVkX2ZlYXR1cmVzW10gPSB7
CiAJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCiAJU0JJX0ZXRlRfTEFORElOR19QQUQs
CkBAIC0zNSw3ICszNyw0NCBAQCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1
cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAK
K3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVk
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAoIXVuYWxpZ25lZF9jdGxfYXZhaWxhYmxl
KCkpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgaW50IGt2
bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKKwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJCXVuc2lnbmVk
IGxvbmcgdmFsdWUpCit7CisJaWYgKHZhbHVlID09IDEpCisJCWNzcl9zZXQoQ1NSX0hFREVMRUcs
IE1JU19ERUxFRyk7CisJZWxzZSBpZiAodmFsdWUgPT0gMCkKKwkJY3NyX2NsZWFyKENTUl9IRURF
TEVHLCBNSVNfREVMRUcpOworCWVsc2UKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsK
KworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKworc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfZ2V0
X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJCXN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25lZCBsb25nICp2YWx1ZSkK
K3sKKwkqdmFsdWUgPSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlTX0RFTEVHKSAhPSAwOwor
CisJcmV0dXJuIFNCSV9TVUNDRVNTOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlf
ZndmdF9mZWF0dXJlIGZlYXR1cmVzW10gPSB7CisJeworCQkuaWQgPSBTQklfRldGVF9NSVNBTElH
TkVEX0VYQ19ERUxFRywKKwkJLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2Rl
bGVnYXRpb25fc3VwcG9ydGVkLAorCQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVk
X2RlbGVnYXRpb24sCisJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdh
dGlvbiwKKwl9CiB9OwogCiBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgotLSAK
Mi40Ny4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
