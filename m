Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C127C369D7
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHkdHh2XYhVFS1IUzpr+PJWu21tpnCSuLlwBhjyFytw=; b=QfOwjO5rpzL4JS
	lan+GoJ1zRsArRU0vhaM6j96mqof0ChZ0MK24tc31su0Wd6nLi7U9rL5+4dIhtLNsGeLELJCn+2xM
	Xn5SUaCrYkToUhNFDt1bkE1yTVEWgjhPJFuzQ5aJX+7+ZR9Tzd7ctRxOOkNu7gH9XUlPuOi5VTKDF
	SGGZo9SGtxQT8xg787jSJF11BH4JzYwHoakANoseuwkDhPnudaWYo/5c59oJ1J5eUV6xLC+w5gOKh
	+qcZ3Vgn/gLEA1si9zr6Tnom1I/USLQA6MSoMfGdl1MqeqMMca/zcj77pEOGpkFanxNXnGYHWXvvf
	ozA69Z2Pj42mvoUfI3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82cW-0000000FFE2-0SlB;
	Thu, 24 Apr 2025 19:52:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Te-0000000Ev1s-2BqT
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=; b=KoxA8j/B5+nGsrk7T10VdXXT97
	sgf57jszX2zb9Zf1SeVhMiFHr+WVa/EG6Ng3VmSS06CvUdWsskzzcTrGbfSUCgpsmmDJeBWzeUfaa
	UaIYvGNzl972VBWn9TzI4QM2Zf4ea6eL3li9UEC9P44IHsjQpEV9DTLl5vRCcS3lfV6+dRO382KGo
	/F4jcVw8ybRFM6Lb4VB6U/2j5LDclZrrIOeeKZKS0/OG7wB8n5k6AqMxJez9aJdt/2viZDtKCHevA
	57QwIGqC+uW3Q7tDZyT71i6Pje77aN4TQbXvy0GMIoph35oefVRbi7RnpAmuix8kyEDlNtalALmPq
	5M/y0oFw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80Tb-0000000BsMN-3HHP
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:35:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so15642995ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516106; x=1746120906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=JMS/iDE3OSJPTGc7Gdgf13oesPjpBsF/GaJVWnZPidlHV0/iJEpAfawJZy1ESqdzqf
         thoqMjysg0E/IatXo0XxEMqC2a7YfkPZPt5xiUNGv+PTHzKum8G7kklB2mA9fT2eAtJ6
         17clEv0KKTfJ2dR3QmDCu4F8YMrjFnaWQQPU1PxyrVv40I29KLNuyUeoukAda28gmazk
         tKv732t3TsRC7cM3ZBAv47dZ/5cS/jIbU1bqBUuXcDHxfUKgYio2HXbcA8A7comCxJUI
         z4Dpf58TWTRfZJxJrOC2QpNRHS9+wSp+a/yjJ7uZlVPT13vJxS8/gduqCpnlFR/27nuq
         EdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516106; x=1746120906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=pUgtn+uq3aZYNNOvki/GH720S31GlJSPAoMPtkCCZ438toGA3kSnS7YteGcDVUUamo
         adu8WfGuNuBfRm4yT0Mk45wu+A66NKd3M6ZP/h14TTk6er0Pi6poGwgcRz+BW5nCiuWu
         AIlBPxQszaZ/LN747megHlTs00UIxeYO+D5CN3bNVTgU+HXVVYn9DaHn3tvkjkCQqmVa
         pA870cGjBcNuYYzSZAcYtjbznunZ8bKfebuI/5a2xo0Bu7Qx6VdL6JchHzd2DBkVWVpW
         GYxBWactRYO29cZchT32eqaDJPo8ErYQe5WjlNhv6Ger2LUQaqx7lR4wo1Qmhr1YfVcB
         meVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzeMPLXYVhZp+7f+smsJk9NZWmlQ24QUVZOkTspfiKAgfMx4L6K7aVNPFCH/adu/Er2YGYhe/bnoU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgzSRXjctQtsVlcix8Ipd0huZMk2RQloRRExmbRNLBCZibk0Dk
	0OMeze5laLmZ74ptylHI2AsIACH5mRqXwVZZaAPHmtDjIqRrDT/1KP7mMo7TJbU=
X-Gm-Gg: ASbGncvD5QWmzfiW11uve237csc3KfRU9DJl7lNJpUp5eeMlXnUel2SLgTxeTugcKrv
	A26Q+cwcF7qxP76OhM49ui0zWTX2rb386YgG6sSlzBTGOMWqPP/9YOF7f5/qKABzNmQYoF3vL72
	AvXmjMcq/HHXpCM3jiq4WjThdT01KvtcnDS6vNEb8X/syqovQaFte71jeSx/TH/TfAkwkAezdQB
	RiCPK190a7uN0UoLI0bmRbfiLWGVTp+cOdOjt2IKdm8N5z9tIOnuX4mqKIH7WTRl0lKfCjwJCEi
	40Kx+yNxWGD1CgLj15c86hdhhvyM3/VvrdtwXsUHF6amP3Bz7/Fa
X-Google-Smtp-Source: AGHT+IHgoxOdSwMCR3g5IpOqeK6qLMj0uu2JqSy/m/IXPMpoioHfXGrM09vCJDVNOdL1X/GrKu4d3A==
X-Received: by 2002:a17:902:e74b:b0:224:160d:3f54 with SMTP id d9443c01a7336-22dbd469727mr4368305ad.31.1745516106262;
        Thu, 24 Apr 2025 10:35:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:05 -0700 (PDT)
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
Subject: [PATCH v6 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 24 Apr 2025 19:31:57 +0200
Message-ID: <20250424173204.1948385-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183507_948408_0663F43E 
X-CRM114-Status: GOOD (  11.28  )
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
by5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDUgKysr
KysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDE3ICsrKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBkYmU1OTcwZDRmZTYuLjNhODdm
NjEyMDM1YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTcyLDEyICs3Miwx
NyBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNw
dSk7CiAjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQpCiB2b2lkIHVu
YWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwogYm9vbCB1bmFsaWduZWRfY3RsX2F2YWls
YWJsZSh2b2lkKTsKK2Jvb2wgbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCk7CiBE
RUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOwogI2Vsc2UKIHN0
YXRpYyBpbmxpbmUgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVy
biBmYWxzZTsKIH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxl
Z2F0ZSh2b2lkKQoreworCXJldHVybiBmYWxzZTsKK30KICNlbmRpZgogCiBib29sIF9faW5pdCBj
aGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKTsKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA0MTBiMmUwZTA3NjUuLjFkM2JlOTk5
MjIwZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNzA5LDEwICs3MDks
MTAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQodW5zaWduZWQgaW50IGNwdSkKIH0KICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX1JJU0NWX1NC
SQotCiBzdGF0aWMgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKIAorI2lmZGVmIENP
TkZJR19SSVNDVl9TQkkKKwogc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0
dXAodW5zaWduZWQgaW50IGNwdSkKIHsKIAlpZiAoc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX01JU0FM
SUdORURfRVhDX0RFTEVHLCAxLCAwKSAmJgpAQCAtNzQ4LDYgKzc0OCw3IEBAIHN0YXRpYyBpbnQg
Y3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUgX19hbHdheXNf
dW51c2VkKQogewogCXJldHVybiAwOwogfQorCiAjZW5kaWYKIAogaW50IGNwdV9vbmxpbmVfdW5h
bGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpCkBAIC03NjAsMyArNzYxLDE1IEBA
IGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQog
CiAJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUp
OwogfQorCitib29sIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCit7CisJLyoK
KwkgKiBFaXRoZXIgd2Ugc3VjY2Vzc2Z1bGx5IHJlcXVlc3RlZCBtaXNhbGlnbmVkIHRyYXBzIGRl
bGVnYXRpb24gZm9yIGFsbAorCSAqIENQVVMgb3IgdGhlIFNCSSBkb2VzIG5vdCBpbXBsZW1lbnRl
ZCBGV0ZUIGV4dGVuc2lvbiBidXQgZGVsZWdhdGVkIHRoZQorCSAqIGV4Y2VwdGlvbiBieSBkZWZh
dWx0LgorCSAqLworCXJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCB8fAorCSAgICAg
ICBhbGxfY3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpOworfQorRVhQT1JU
X1NZTUJPTF9HUEwobWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUpOwotLSAKMi40OS4wCgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
