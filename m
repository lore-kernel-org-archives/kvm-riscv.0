Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B33DC369B2
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXBO89Jt3PZMFnP6lbGdKrPeVmDqYosvK77H1mhUfZ0=; b=nZD7OdKmSNdpAm
	yNA8M2TnSclZMdg7LqUSmHKfyDTV+1kk/ri88mD4PLpUVuXjrX/Xu3oGjM0aRUSiw1iqekWFW2Ww3
	bHqpRAZ7Aci7ShqOWpOrQBv8FIWyKTZtq9CgAreMAAooftSELVdFhoVsoSqLGuDQXOOUBw6BCn3UF
	aY8exDJKsOUpGYOc9r35QNL5cgHEdTPUmfYi4AScpf8/0qqP9XgaIvnrDc/v/fVZI3n0UKawnbmdI
	u0NJerl0I/ezqJABLzBgX5LDUtQLXINhv46yltTzzAnuq6KM1+HtnMckZib8gkWDBN6vc4Hvz1vhT
	SZGl3eMCIHqoAG81fy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTT-0000000Cz6l-0Bbd;
	Thu, 17 Apr 2025 12:36:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIO-0000000CvY6-2TY4
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224191d92e4so7404425ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892684; x=1745497484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZffLnUvyDxY5lnr7nm4ZxhnqMm5pHoMLqJFCY6yvcnE=;
        b=T3SKj5jkLCBxUFCmsbZnQU5VYnNNffmOFzHRwDfOLH51UL72+pVk4kdTbSL31dmFY2
         qfETM9d9EUHq75wKm01AxEbEeQPDKMHpSzcmnt3sV/0L0zvXuDB8LKKO0Fi4W4ZIKxZy
         F8049+ztTLm+7JRIgNreE8ynCUQGVvbHTAxs0qh2AVyaxAgfxesXSgXUUaKHJKRWI621
         d+qE12LVUAGzIR7hY0uSt6tV9krKuDvVVTnv6tJ6DefMk2nF4OPszq1TbMuRZ+yHnt5e
         E6D4ni58PkORSSH+IOWtN9dJnqLRVOi3bwoF3jIVFULsIAgKYU4jOvpCvGnypAr+09F3
         WAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892684; x=1745497484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZffLnUvyDxY5lnr7nm4ZxhnqMm5pHoMLqJFCY6yvcnE=;
        b=jkb7yGkYHoYCEGx0Y3cI3RXlwj7GPPVrVJ80Nvpzy3TQ0rVAPa4WqcTj8VgbJSVEI2
         tkPL70eeipBgEFSFN97aIqSRikvpc2rIccLenQXYD8nofYKIOcxXyw1tJJDPe2gxj6Rs
         NwlekcGtpstX73i+4Mh/cytnUUN34zOx1uOfZOEF/nTJLbgLP0VY6lSWl8oFyvNip180
         /MTGSAlD7QXyKWcfxDxzvbVXSj3xEaXwmsWDNkxRYqpFF8kqxeRqrFGd3Aq5JvDOuwHQ
         G5dLULMxbCqEEMTYsziUDIaQ3syeoGAjPIugS+Ab7SkI4FgKN/Bn5xuHX8YEk/T2NAhW
         to+w==
X-Forwarded-Encrypted: i=1; AJvYcCXGG2ClOJviSWU0/7jw1hpICYGSX8sBes5PyS6bPiQJLf5tUsCRm2cNlyAbtyXWPjgF6lC9/K4Kem8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpvN9/+cK0Ydk+tLtckB/erItkOPqnxJtMpsT+E5/WmfBqkCVH
	NL6Pmior1bxMcY9NctTi8W9JBUgi7lEcDLgCQ9+cCvQ1g53El3HYsvBijNzkXgU=
X-Gm-Gg: ASbGncuwfN8OSYi1vTEkfof8PRIyt08ar/57jxtyQ9Krd3DclK578AxoXelQ5VjbFik
	uEWPV01kioxRAom4IQpdLuODEssd53yjfw0nfIhVJZxwJiHxHddodSRWDXONf4fEp71ho/bIzvi
	Ri/dBT/NzqoKNXk4gqLCuMF52+LPi22kVvkuVGt0f2YPhJHE6flnwFT7Em4Ok9RinzP+boUaAUy
	FuS8k9Wv7C9MyjZbdJvIor39DwTVeHWzFnGynmNmHWHbrPRFZIaR1Cb5mfKq14v/eB8/xnHwIiM
	DKuad8y1H5zH80EPmFm/e+CGTFDZkZIyrhnk8S6ZYQ==
X-Google-Smtp-Source: AGHT+IGh/BYwkefJ9AAON/g15uIjE6Ad6rojhY99Eh6G81EOlK8D2lFOXm78WPt4vUtVQfXYtoHamQ==
X-Received: by 2002:a17:903:2f83:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22c358c5d8fmr81179515ad.11.1744892683747;
        Thu, 17 Apr 2025 05:24:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:43 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 05/13] riscv: misaligned: request misaligned exception from SBI
Date: Thu, 17 Apr 2025 14:19:52 +0200
Message-ID: <20250417122337.547969-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052444_637708_6660460A 
X-CRM114-Status: GOOD (  16.40  )
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

Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cm1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZyb20g
U0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCmV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJz
aW9uIDMuMC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMgKy0K
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8IDcxICsrKysrKysr
KysrKysrKysrKysrKy0KIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
YyB8ICA4ICsrLQogMyBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggZjU2YjQwOTM2MWZiLi5k
YmU1OTcwZDRmZTYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC02Nyw4ICs2
Nyw5IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKIAlfUklTQ1Zf
SVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3ViX2V4dHMp
LCBfdmFsaWRhdGUpCiAKIGJvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWRfYWxsX2NwdXModm9pZCk7Cit2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKTsKK2lu
dCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KTsKICNp
ZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKLXZvaWQgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNf
dW51c2VkKTsKIHZvaWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVu
YWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpOwogREVDTEFSRV9QRVJfQ1BVKGxvbmcsIG1pc2Fs
aWduZWRfYWNjZXNzX3NwZWVkKTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCA5N2M2NzRkN2QzNGYuLjA1OGE2OWMzMDE4MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9lbnRyeS1jb21tb24uaD4K
ICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cisj
aW5jbHVkZSA8YXNtL3NiaS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KIAogI2RlZmluZSBJ
TlNOX01BVENIX0xCCQkJMHgzCkBAIC02MjksNyArNjMwLDcgQEAgYm9vbCBfX2luaXQgY2hlY2tf
dmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAogc3RhdGlj
IGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi12b2lkIGNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNl
ZCkKK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIHsKIAlpbnQgY3B1ID0gc21wX3Byb2Nl
c3Nvcl9pZCgpOwogCWxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSk7CkBAIC02NDAsNiArNjQxLDEzIEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KQogCV9fYXNtX18gX192b2xhdGlsZV9fICgKIAkJIiAgICAgICAiUkVHX0wiICVbdG1wXSwgMSgl
W3B0cl0pXG4iCiAJCTogW3RtcF0gIj1yIiAodG1wX3ZhbCkgOiBbcHRyXSAiciIgKCZ0bXBfdmFy
KSA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKK3sKKwlsb25nICptYXNfcHRyID0g
cGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpOworCisJY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZChOVUxMKTsKIAogCS8qCiAJICogSWYgdW5hbGlnbmVkX2N0
bCBpcyBhbHJlYWR5IHNldCwgdGhpcyBtZWFucyB0aGF0IHdlIGRldGVjdGVkIHRoYXQgYWxsCkBA
IC02NDgsOSArNjU2LDEwIEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKQogCSAqLwogCWlmICh1bmxp
a2VseSh1bmFsaWduZWRfY3RsICYmICgqbWFzX3B0ciAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfU0NBTEFSX0VNVUxBVEVEKSkpIHsKIAkJcHJfY3JpdCgiQ1BVIG1pc2FsaWduZWQgYWNjZXNz
ZXMgbm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBhbGwgZW11bGF0ZWQpXG4iKTsKLQkJd2hpbGUg
KHRydWUpCi0JCQljcHVfcmVsYXgoKTsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQorCisJcmV0dXJu
IDA7CiB9CiAKIGJvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXModm9pZCkKQEAgLTY4Miw0ICs2OTEsNjAgQEAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCXJldHVybiBmYWxzZTsKIH0K
K3N0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVu
c2lnbmVkIGludCBjcHUpCit7CisJcmV0dXJuIDA7Cit9CisjZW5kaWYKKworI2lmZGVmIENPTkZJ
R19SSVNDVl9TQkkKKworc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7CisK
K3N0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBj
cHUpCit7CisJaWYgKHNiaV9md2Z0X3NldChTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywg
MSwgMCkgJiYKKwkgICAgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQpIHsKKwkJcHJfY3JpdCgi
TWlzYWxpZ25lZCB0cmFwIGRlbGVnYXRpb24gbm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBkZWxl
Z2F0ZWQpIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldHVybiAwOworfQorCit2b2lk
IHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKQoreworCWludCByZXQ7CisKKwlyZXQgPSBzYmlf
ZndmdF9sb2NhbF9zZXQoU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsIDEsIDApOworCWlm
IChyZXQpCisJCXJldHVybjsKKworCW1pc2FsaWduZWRfdHJhcHNfZGVsZWdhdGVkID0gdHJ1ZTsK
Kwlwcl9pbmZvKCJTQkkgbWlzYWxpZ25lZCBhY2Nlc3MgZXhjZXB0aW9uIGRlbGVnYXRpb24gb2tc
biIpOworCS8qCisJICogTm90ZSB0aGF0IHdlIGRvbid0IGhhdmUgdG8gdGFrZSBhbnkgc3BlY2lm
aWMgYWN0aW9uIGhlcmUsIGlmCisJICogdGhlIGRlbGVnYXRpb24gaXMgc3VjY2Vzc2Z1bCwgdGhl
bgorCSAqIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoKSB3aWxsIHZlcmlmeSB0aGF0
IGluZGVlZCB0aGUKKwkgKiBwbGF0Zm9ybSB0cmFwcyBvbiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgor
CSAqLworfQorI2Vsc2UKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpIHt9CisKK3N0
YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUg
X19hbHdheXNfdW51c2VkKQoreworCXJldHVybiAwOworfQogI2VuZGlmCisKK2ludCBjcHVfb25s
aW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQoreworCWludCByZXQ7
CisKKwlyZXQgPSBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0dXAoY3B1KTsKKwlpZiAocmV0
KQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19lbXVsYXRlZChjcHUpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZC5jCmluZGV4IDU4NWQyZGNmMmRhYi4uYTY0ZDUxYThkYTQ3IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCkBAIC0yMzYsNiArMjM2LDExIEBAIGFy
Y2hfaW5pdGNhbGxfc3luYyhsb2NrX2FuZF9zZXRfdW5hbGlnbmVkX2FjY2Vzc19zdGF0aWNfYnJh
bmNoKTsKIAogc3RhdGljIGludCByaXNjdl9vbmxpbmVfY3B1KHVuc2lnbmVkIGludCBjcHUpCiB7
CisJaW50IHJldCA9IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KGNwdSk7CisKKwlp
ZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJLyogV2UgYXJlIGFscmVhZHkgc2V0IHNpbmNlIHRo
ZSBsYXN0IGNoZWNrICovCiAJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNw
dSkgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9VTktOT1dOKSB7CiAJCWdvdG8g
ZXhpdDsKQEAgLTI0OCw3ICsyNTMsNiBAQCBzdGF0aWMgaW50IHJpc2N2X29ubGluZV9jcHUodW5z
aWduZWQgaW50IGNwdSkKIAl7CiAJCXN0YXRpYyBzdHJ1Y3QgcGFnZSAqYnVmOwogCi0JCWNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoTlVMTCk7CiAJCWJ1ZiA9IGFsbG9jX3BhZ2VzKEdG
UF9LRVJORUwsIE1JU0FMSUdORURfQlVGRkVSX09SREVSKTsKIAkJaWYgKCFidWYpIHsKIAkJCXBy
X3dhcm4oIkFsbG9jYXRpb24gZmFpbHVyZSwgbm90IG1lYXN1cmluZyBtaXNhbGlnbmVkIHBlcmZv
cm1hbmNlXG4iKTsKQEAgLTQzOSw2ICs0NDMsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBjaGVja191
bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCiB7CiAJaW50IGNwdTsKIAorCXVuYWxpZ25l
ZF9hY2Nlc3NfaW5pdCgpOworCiAJaWYgKHVuYWxpZ25lZF9zY2FsYXJfc3BlZWRfcGFyYW0gPT0g
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxBUl9VTktOT1dOICYmCiAJICAgICFjaGVja191
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKCkpIHsKIAkJY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19zcGVlZF9hbGxfY3B1cygpOwotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
