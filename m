Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC0C3ABDD
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aisnFl1pmTk3Qctb1VCPBHfk/Qi/w8yuN9YcwVgYkDU=; b=EURoRnLkv7yRhN
	cOi17ikHAAP0DGHuah95oa+1rZMAs6lyy+o013XAsANE8diFeFf3H9VO/7+MBxRk8XRAo0W5pqeg0
	BZradzjmFPxUMgfQ299ABUld5Sh+wDig7fTbd9HsNXR8fI1qRBOx97PVHWbVsC/5xdxBvkPVir6E1
	FBAsn2kzEicWh77yR8DicGVM4A3n2HL0OvGVuqsKYcrt3JXNRDDL4asTure2wCypBwW/3rjZ+SRz3
	42GFiY4Iul7W6RFvDecGE28VxEbArSj1PAyfrS6UWzWTAvumbIvBVoobvL1cH0IOEou8DMW+HNi2s
	HsGgJxzXzm47oMuXtglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyJ-0000000HXtt-3qyP;
	Thu, 15 May 2025 08:29:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsj-0000000HVnA-0gra
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6863865e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297436; x=1747902236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKxcqBU2nPIooApXHLbhnyTkcGwztZCP22EVNBbws9Y=;
        b=pUWbTsLQXUdRErq7DJhTZACihzA8hJXEUJE4YfXgW128QyEXyO/WfoxveBOSCxBgyH
         LCuPvCiWeR4gP9vhGFth4f1rKj4TF/ghPRV4BW4s9a+gmOrnv4+sJJkfMD38fdD1wjs8
         szPHcTrKkNusXaGA+CfPLw2iZs3taHHKWig3XSN/AmQDOkCuKNxTbEuUYqwDday47ek3
         25UCngHU3WHLqu3Jhl0jPPcOpZQVgIQoFbcCcOaMWPeBmV3TUHafGeD7Wg/x/eo+nQ11
         DKzYAxXLWWXBmqXlRpm32ipFeyvK5e4Bs872msgWT8VQx7V8/Je7iNPRkDGJBu2SoOam
         azBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297436; x=1747902236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKxcqBU2nPIooApXHLbhnyTkcGwztZCP22EVNBbws9Y=;
        b=XOlS6sCZ8TztaJ3N0yr5COfeIhS1hutmW4XafnoTJe0RdNK2u6MmmsGWxExWttJsZN
         DDLCsy0GST8+59cRBtz/qLFa5bCwD0yS0yWeNmrkTBBaAnHa4aynSftwOVGGJIbvZcOd
         xlDL2HAilzqgfIV/4i3k926TSrfyUD0ntq6wWg12S+/npWhEgPpoPw/avWqA5ySWM/vr
         /dsxlAJsXEPRKvrXUkwXarYieNx3dZ/9sfXNF45iN+M+wHMOplBQFrAdo955BrLu4FCL
         6tHN/zhokyaW2OIvy47otiqcRISWLidZJisZHJ0sUFwhrzU87GP4BwiG/+/drYZocGML
         bUHw==
X-Forwarded-Encrypted: i=1; AJvYcCVs9WbmLBh8I6jdaCbj0wlsY0PCMc5WIj+WRPfToZkOcvx0ytH2YI3OSgLs1Cf0UmqnaWs3NxtAOEQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhFuBOwleyeQChVgrYBgrm7rhsopYkkfRWFdsF8LcaLMGkpsA7
	bG6U07HjADohtGz2mnD7FpJ6PNNHDh564slujaFVi8anlSWFbr8wiezByA6rqxU=
X-Gm-Gg: ASbGncsYNd+ahE7GGUrKCRTCjoAB5uPupmhUxciBGQRBcNoXf1u471YmjRYvS6HGD0u
	1Svdp+M46ymSVkMM/h7vLUoE2a/XVjLkl3TIzYJU9aXGoG3HBkOcer427x9j0Ybepwa5biGwtPK
	UyKqGmtMd7Q9sjFw1NXOy9da0yLlvhMuuaapYCKnadeDXq18gziddiRdc8XEt7JpGTEWmwcOsdt
	U5LCcd08eEsteZGk3lf1kooDwuHC85MCENUojywT2DlCjd19JVATaxPVFZDdUQg8UBcNLR7JpeD
	c9cZoIoTglaB3Srgpf0c47M4QaJgU+zmPgN3oES6ulsPnltP0bo=
X-Google-Smtp-Source: AGHT+IFz0FuSTvvFeV+6j/dLoSAMMI6plfd/uGaDa29QeKBmVTFM4URBXIUM54FLKxq4unv6VMcljA==
X-Received: by 2002:a05:600c:1c88:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-442f210d5d0mr60501515e9.19.1747297435883;
        Thu, 15 May 2025 01:23:55 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:55 -0700 (PDT)
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
Subject: [PATCH v7 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 15 May 2025 10:22:11 +0200
Message-ID: <20250515082217.433227-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012357_211229_3D539098 
X-CRM114-Status: GOOD (  11.98  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDkgKysr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxNyArKysrKysr
KysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggZGJlNTk3MGQ0ZmU2Li4w
OWE1MTgzMzQ1ZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC04MCw2ICs4
MCwxNSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCkK
IH0KICNlbmRpZgogCisjaWZkZWYgQ09ORklHX1JJU0NWX01JU0FMSUdORUQKK2Jvb2wgbWlzYWxp
Z25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCk7CisjZWxzZQorc3RhdGljIGlubGluZSBib29s
IG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCit7CisJcmV0dXJuIGZhbHNlOwor
fQorI2VuZGlmCisKIGJvb2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2Vt
dWxhdGVkX2FsbF9jcHVzKHZvaWQpOwogI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX1ZFQ1RPUl9N
SVNBTElHTkVEKQogdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKTsKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzX21pc2FsaWduZWQuYwppbmRleCAyODdlYzM3MDIxYzguLmYzYWI4NGJjNDYzMiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNzI2LDEwICs3MjYsMTAgQEAgc3RhdGlj
IGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQg
aW50IGNwdSkKIH0KICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX1JJU0NWX1NCSQotCiBzdGF0aWMg
Ym9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKIAorI2lmZGVmIENPTkZJR19SSVNDVl9T
QkkKKwogc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0dXAodW5zaWduZWQg
aW50IGNwdSkKIHsKIAlpZiAoc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RF
TEVHLCAxLCAwKSAmJgpAQCAtNzY1LDYgKzc2NSw3IEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9z
YmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUgX19hbHdheXNfdW51c2VkKQogewog
CXJldHVybiAwOwogfQorCiAjZW5kaWYKIAogaW50IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vz
c19pbml0KHVuc2lnbmVkIGludCBjcHUpCkBAIC03NzcsMyArNzc4LDE1IEBAIGludCBjcHVfb25s
aW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQogCiAJcmV0dXJuIGNw
dV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUpOwogfQorCitib29s
IG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCit7CisJLyoKKwkgKiBFaXRoZXIg
d2Ugc3VjY2Vzc2Z1bGx5IHJlcXVlc3RlZCBtaXNhbGlnbmVkIHRyYXBzIGRlbGVnYXRpb24gZm9y
IGFsbAorCSAqIENQVXMsIG9yIHRoZSBTQkkgZG9lcyBub3QgaW1wbGVtZW50IHRoZSBGV0ZUIGV4
dGVuc2lvbiBidXQgZGVsZWdhdGVkCisJICogdGhlIGV4Y2VwdGlvbiBieSBkZWZhdWx0LgorCSAq
LworCXJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCB8fAorCSAgICAgICBhbGxfY3B1
c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpOworfQorRVhQT1JUX1NZTUJPTF9H
UEwobWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUpOwotLSAKMi40OS4wCgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
