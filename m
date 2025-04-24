Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1338C369D8
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPU6uLCpD0yzOC3SM5qlzNX0PanilN4sS16vPyUcItc=; b=t+q2VykluGX0H6
	s0Z8iM/lvUgTpXNWmNeanzJsxlRSHYHpnQW93sbhDolGlMF89nfp9OqhdO9ngAg47WixBXLuuBXBN
	zXG5ChixdoMszCuPIK0Bmje9WE7EHk4CoTLidw1lkzMlxnT2Fm8wzV/baxGtAXadHCSO+dRXyhwx+
	waMq0xaCiJ1579z3U7x6A1YeusiyBjqlXAVwVIcZllQzI2Xb071aaEdWd9Irh7REaULkpTBK+NgLZ
	QiZvIFxbLtHmU2Z+sD+z7zR4w3tC7CXC5OWqTEiqR/W9kRN72hu5ENn1obGTcAU1v4W0Qpk/FE2hJ
	j2m+MLDHGObrQZ6RDRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82cW-0000000FFEU-1xXA;
	Thu, 24 Apr 2025 19:52:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Tk-0000000Ev58-0Vog
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:35:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-224019ad9edso18907955ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516115; x=1746120915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KHThPTp9HBECdAqxs4JY6wN99GqOifsmOPr7rqjaok=;
        b=DcqOxFCy2tnrGrKgRFN311iXxu5K1bB/p5PahAnnUgLGj/BwM7RyK2RMN3j6MdcIyV
         wgcxdJB4EvhMyKCAvBFPRTYuo+3+hxk3IUP8ZPye6SkM+SCBoNX8XroaP9Cfoo9ri9I/
         4R+W5dKNShfuDh6UzJ2YKpKDY6qqWSlOC2HMv0mgiz70DWQ/I1NOg0uKxgGBNgvQxEWl
         xNRlwR33cy5ojImeTYPUyUBhYfC/fjmyxBKDMhO2EajhE/CZ5O6FgI4gmwkms7f5+Hdg
         /LPTRBDBVqCDuTbfxDcMp1jPQ/2JJVBxVzzDPq2JidWxgfXhmVNbdUHwmGzTr6Ogp1e/
         HW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516115; x=1746120915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KHThPTp9HBECdAqxs4JY6wN99GqOifsmOPr7rqjaok=;
        b=RXKpSLsBDVVzUEpd+XbMgxc6ovYP5LA7N39VVUxlXawMbsIipnJ3f9XhDgPFC3+RJ4
         +uDHgWpI7qfhwNmMU+MrsDpnqgO/Ewxy1CAcQtFSeCmKwopp6Ef3D+h6djRyQHmVc00G
         f32sUe1VqXOVYXq3EtzN4JOEjYV98fOVaYghPw8lu8UWOq80R+/kVIFNIx6AJv8Gr6de
         iZYMN8VDBCt/j9C6/vm0p0Yw2G6o+PKtfyAhDnkZJv7t840NK5St5BEEiCFlGTEqVqCV
         a+Pa0B4vaSZMaiZ/cWLRjaWFANsEtV/fnGqEsM3asEleamydxpmJt2Bd+ghKmW0/mg/t
         JwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5FMvYttjdT1QxGMbEEi9X19i7cWyCX3MQy7Q39OUdFpRZuZq3Kc0iJlElu84StwHnEMf8jfShavQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz/X1CHzWOTElse9XjNTN1yeBL4129y21LDANT1svNcOiO1dNU
	shiqqic9kGvmIJt04zSMck4iY84CUGw+CI45wlhb/YfGdomcCpKHNeQiglnUe5M=
X-Gm-Gg: ASbGncv/qaqnwqmFN8s+Dkkh0ZNLLmdjJitDGsmu1J+cDQiJ8j8vllRy7wI50AgIHDc
	qH3KwgMbtVctG4akhBuu4mMwhBBZmhcCx58MYA4uqJWFlsEOYCAn7ez8t50drvuEqqdgv4h/wia
	ap0EWySaencMYFbb5KMO7218SfIE3zg3V8XLNimRLG0f/VaxLuYNIE1h25p9Ejh4UbkCXO70yxu
	OFXJvhtWjDDpiFVJzKSqAJDVW5qNnEJXo5d3l4ziaqodjhFNLWjzzeLxBTZQClTdr8MIK3Zm9U/
	gNNkgxzIs/VKKCBOflRsrQmH1Fqyza0pMJ3iuoHG3Q==
X-Google-Smtp-Source: AGHT+IHk7ifeDzXStWRadJ48a4Rbu1GdvPFHAeWe+THKzkAyDqtofKTCbTRnNG+8lnQC3H+eIm6QNA==
X-Received: by 2002:a17:902:d489:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22db3d71b30mr52646935ad.38.1745516115638;
        Thu, 24 Apr 2025 10:35:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:14 -0700 (PDT)
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
Subject: [PATCH v6 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Thu, 24 Apr 2025 19:31:58 +0200
Message-ID: <20250424173204.1948385-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103516_161735_DE801E8B 
X-CRM114-Status: GOOD (  13.54  )
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
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgOSArKysrKysrKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyAgICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAppbmRl
eCA0ZWQ2MjAzY2RkMzAuLmJjYjkwNzU3YjE0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oCkBAIC00OSw2ICs0OSwxNCBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lv
biB7CiAKIAkvKiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gKi8KIAl1bnNpZ25l
ZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisKKwkvKgorCSAqIEluaXQv
ZGVpbml0IGZ1bmN0aW9uIGNhbGxlZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVzdHJveS4gVGhl
c2UKKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNCSSBleHRlbnNpb25zIG5lZWQgdG8gYWxsb2Nh
dGUgb3IgZG8gc3BlY2lmaWMKKwkgKiBpbml0IHRpbWUgb25seSBjb25maWd1cmF0aW9uLgorCSAq
LworCWludCAoKmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisJdm9pZCAoKmRlaW5pdCko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Zv
cndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKQEAgLTY5
LDYgKzc3LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2bV92Y3B1
X3NiaV9maW5kX2V4dCgKIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7CiB2b2lkIGt2bV9yaXNj
dl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bV9yaXNjdl92
Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogaW50IGt2bV9yaXNjdl92
Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
cmVnX251bSwKIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCA2MGQ2ODRj
NzZjNTguLjg3N2JjYzg1YzA2NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCisr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtMTg1LDYgKzE4NSw4IEBAIHZvaWQga3ZtX2Fy
Y2hfdmNwdV9wb3N0Y3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAogdm9pZCBrdm1fYXJj
aF92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogeworCWt2bV9yaXNjdl92Y3B1
X3NiaV9kZWluaXQodmNwdSk7CisKIAkvKiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KIAlr
dm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwppbmRleCBkMWM4M2E3
NzczNWUuLjMxMzlmMTcxYzIwZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCkBAIC01MDgsNSArNTA4LDMxIEBAIHZv
aWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlzY29u
dGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gZXh0LT5kZWZhdWx0X2Rpc2FibGVkID8KIAkJCQkJS1ZN
X1JJU0NWX1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEIDoKIAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX0VOQUJMRUQ7CisKKwkJaWYgKGV4dC0+aW5pdCAmJiBleHQtPmluaXQodmNwdSkgIT0g
MCkKKwkJCXNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFU
VVNfVU5BVkFJTEFCTEU7CisJfQorfQorCit2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1fdmNwdV9zYmlfY29udGV4dCAq
c2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKKwljb25zdCBzdHJ1Y3Qga3ZtX3Jp
c2N2X3NiaV9leHRlbnNpb25fZW50cnkgKmVudHJ5OworCWNvbnN0IHN0cnVjdCBrdm1fdmNwdV9z
YmlfZXh0ZW5zaW9uICpleHQ7CisJaW50IGlkeCwgaTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHNiaV9leHQpOyBpKyspIHsKKwkJZW50cnkgPSAmc2JpX2V4dFtpXTsKKwkJZXh0ID0g
ZW50cnktPmV4dF9wdHI7CisJCWlkeCA9IGVudHJ5LT5leHRfaWR4OworCisJCWlmIChpZHggPCAw
IHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250ZXh0LT5leHRfc3RhdHVzKSkKKwkJCWNvbnRpbnVl
OworCisJCWlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID09IEtWTV9SSVNDVl9TQklfRVhU
X1NUQVRVU19VTkFWQUlMQUJMRSB8fAorCQkgICAgIWV4dC0+ZGVpbml0KQorCQkJY29udGludWU7
CisKKwkJZXh0LT5kZWluaXQodmNwdSk7CiAJfQogfQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
