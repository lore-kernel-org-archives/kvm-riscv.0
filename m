Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F6C02198
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1P1LzvanUuLNad2ZHgMtJMhMN+Ed/zuIcwAvKdJB1Lk=; b=FUu4B1xVVOk/z6
	a+aC/Feip0Ro0qrcCPpfx6oR60UtDc3azeNXGx9UelE86+srUprUcbnce81DEqlTK9dbVf+Yg0Ry7
	P2dFslgM0hKwIO08SSckvU7dhXp2ePEOhm+8ailel7iY74cd8ZH9W4g4hPZWZIPOLsZxxA6d6AW2g
	OKK5K90yxm/ISyUAE3T5x/Ud6nk6Ow3mszFzVaaV6sqXlR8gE+u9SdU7GSiGkgF9W8M3uwCXobeEJ
	A/OR6tH6Zldzkkmmt1AnoWCz6mgOq19DQK3sWWXD6zQIryrlGH1UJ820mUKgUFUfk12FyQzZkv1Vn
	EyZTic/oKbK5JVELWDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrV-00000001vzQ-3WFZ;
	Tue, 11 Feb 2025 00:10:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS3-00000001VUO-27mu
	for kvm-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t9JWUPguvJXyATshOaEX8SYplIWPzd3JQCRzjjvJvmU=; b=Pcgxi1gLarEa5PKkGJUazxBaN7
	npDYKPZpw7OS3QGXXT/SFj3cAx7K+1BbV0b4F76wjEEN/zffTTEMmQYyh6Vx5RyjSjIruW1j1H8g4
	RfHF3QlKCbeAVT9hMBi1qhfSmKLd8/FdJpx3bmPQPCqZAxBcH0A0cW7p0yZIDqP+owacZhDp1fqYC
	m4sAZrFLZOSmca4vIDGOUbV3WOmFdD73tFNFrL2BVYt4AMQtpDOngNScnGsCu4txeIEZ4buX2/UYx
	N+14i9r/nV4zpp/VZ69jqSf8ln3/tc7Lu9qlspFsKDZPrHGH0l5MZj7ch4tk2HeFAxodg7v3zPJ/V
	NrwJ6BPw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRp-00000000I9L-1LQ0
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436249df846so33001905e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223366; x=1739828166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9JWUPguvJXyATshOaEX8SYplIWPzd3JQCRzjjvJvmU=;
        b=wgGoD7klAEYdjrepDN/YTGlSkbvyh5Xn62zsH0Rr41ADIrYho0ZGntqEoSK2d6G59m
         m/pthErX3nrDgYMFsc1MWt6SYCcZjxuFxBqHsZ2RbBUYTYRAgr7A/lzqjknk2d4QPuAX
         zQ4nGZ4MrI6T3ccOSdfNd7L6mGL9SEU71LIj6qaCSmG3UejjAZAKr5o6BUNkxSlwrFYS
         J2CpKe1z02/awcRHZp5mUAgRfWCrxWqkETxsLo/CgiFUa+wH5E6uhc/kIdPy3rRfEZoE
         RugU1RKK1YaTOstiqS+vJhLM9RArV/AY6Sl6X9LwEwcOvqgXCcxFdCzakz7h7z28738r
         z/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223366; x=1739828166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9JWUPguvJXyATshOaEX8SYplIWPzd3JQCRzjjvJvmU=;
        b=TBApJNgMJt4/+QfAM2pjJ8XR2a+R0j9RD3QPequLXlgPGSQfXzC+ZStBUwC2Y0n6om
         RxVOA0W6w9C7zOnlnjLUp+9a7zR5a855E4jeC5YvhkXIftI4DWzI6fWEOiZTxIt8oRKn
         UGsyXQUtDPn1QMmNUZ76OwJcBTKJyDeHi1mX3bvggqOZpETrfxMyHbQBwrKgsGWzxzOY
         +hmo3TnS7Q7wB2dZbNoOhk7Lm7DaZfriK1wpQlEnCYI3WRzombvSDc59EUCJOpm6c8Xg
         2ylpb74rYf15ILqdIEQSw4jAKJ6So9yvB239q9E3TyTtm+w0R35Dn11Fj5POC4pXJuMj
         plXw==
X-Forwarded-Encrypted: i=1; AJvYcCWLd3Z5sU6ENhXBUHP9xXRfCAYYggwZn2lzkrGVZlJLlOaR0hS3vtQd1+GqmFv+VsMGDqLW3VYqplc=@lists.infradead.org
X-Gm-Message-State: AOJu0YznZw9MJ/zJW9VGZwgMBw40TpjsDtQuTiW+AAi/y8su4ZaxjvZv
	Kuuh0Qi/wVi2MT0dBrfZE2l77TTLwFz9XHoPYxytigMX6wNnVnXvw+BQOcM2uq8=
X-Gm-Gg: ASbGncsUTgAeVlX1vIpW4rnEVgdgc0fMfmA0EWQh5VBiwbQ2tejymdQ9kNItkj4Sdz2
	jK8tsgK+vXRIjIf7H3Wy6Lo0kAAlV7Rie76anzLUQuktSP7jpU/EgDx5YRnmP0fCLL2rp30IOIw
	BERnlCCltzrGpvlNNHaJ8x/eQKavN5dAEHMmp2F44fAnaBtFcXjzU/jZrUuLipY2QN9PwvOJ3yh
	zm6GJAM7S87lfzVmQZtUmYLZYYEAOB1U65vWdwyQtARmgl3mbeRv0Ia4ElwKSt68wuu3SXKFt5g
	YUVvQ7s0ekGjnRDX
X-Google-Smtp-Source: AGHT+IFCUBo5ZJUEfRAM++W2IWKipAW2usGjFmvIL0zfj471rainYZRPFDdB0RmyHu2I/2e1UVroug==
X-Received: by 2002:a05:600c:1d86:b0:439:4499:54de with SMTP id 5b1f17b1804b1-439449955c6mr51321255e9.31.1739223365934;
        Mon, 10 Feb 2025 13:36:05 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:05 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/15] riscv: misaligned: request misaligned exception from SBI
Date: Mon, 10 Feb 2025 22:35:35 +0100
Message-ID: <20250210213549.1867704-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213616_253917_464CDEDF 
X-CRM114-Status: GOOD (  17.50  )
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
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgfCAg
MyArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jICAgICAgIHwgOTYgKysr
KysrKysrKysrKysrKysrKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19z
cGVlZC5jIHwgMTEgKystCiAzIGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggNTY5MTQwZDZl
NjM5Li5hZDdkMjY3ODhlNmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1
ZmVhdHVyZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC02
NCw4ICs2NCw5IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKIAlf
UklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3Vi
X2V4dHMpLCBfdmFsaWRhdGUpCiAKIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZF9hbGxfY3B1cyh2b2lkKTsKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpOworaW50
IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpOwogI2lm
IGRlZmluZWQoQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEKQotdm9pZCBjaGVja191bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191
bnVzZWQpOwogdm9pZCB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCh2b2lkKTsKIGJvb2wgdW5h
bGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCk7CiBERUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxp
Z25lZF9hY2Nlc3Nfc3BlZWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4
IDdjYzEwOGFlZDc0ZS4uNjZlZWYzOThiYWQ0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgog
I2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+CiAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KKyNp
bmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogCiAjZGVmaW5lIElO
U05fTUFUQ0hfTEIJCQkweDMKQEAgLTYzNSw3ICs2MzYsNyBAQCBib29sIGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAKIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKIAotdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBfX2Fsd2F5c191bnVzZWQpCitzdGF0
aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yayBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQo
KTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVk
LCBjcHUpOwpAQCAtNjQ2LDYgKzY0NywxMyBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIAlfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoCiAJCSIgICAgICAgIlJFR19MIiAlW3RtcF0sIDEoJVtwdHJdKVxu
IgogCQk6IFt0bXBdICI9ciIgKHRtcF92YWwpIDogW3B0cl0gInIiICgmdG1wX3ZhcikgOiAibWVt
b3J5Iik7Cit9CisKK3N0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCit7CisJbG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVf
cHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsKKworCWNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWQoTlVMTCk7CiAKIAkvKgogCSAqIElmIHVuYWxpZ25lZF9jdGwgaXMgYWxy
ZWFkeSBzZXQsIHRoaXMgbWVhbnMgdGhhdCB3ZSBkZXRlY3RlZCB0aGF0IGFsbApAQCAtNjU0LDkg
KzY2MiwxMCBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIAkgKi8KIAlpZiAodW5saWtlbHkodW5h
bGlnbmVkX2N0bCAmJiAoKm1hc19wdHIgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9FTVVMQVRFRCkpKSB7CiAJCXByX2NyaXQoIkNQVSBtaXNhbGlnbmVkIGFjY2Vzc2VzIG5vbiBo
b21vZ2VuZW91cyAoZXhwZWN0ZWQgYWxsIGVtdWxhdGVkKVxuIik7Ci0JCXdoaWxlICh0cnVlKQot
CQkJY3B1X3JlbGF4KCk7CisJCXJldHVybiAtRUlOVkFMOwogCX0KKworCXJldHVybiAwOwogfQog
CiBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKQEAg
LTY4OCw0ICs2OTcsODUgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2Fs
bF9jcHVzKHZvaWQpCiB7CiAJcmV0dXJuIGZhbHNlOwogfQorc3RhdGljIGludCBjcHVfb25saW5l
X2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKK3sKKwly
ZXR1cm4gMDsKK30KICNlbmRpZgorCisjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQorCitzdHJ1Y3Qg
bWlzYWxpZ25lZF9kZWxlZ19yZXEgeworCWF0b21pY190IGVycm9yOworfTsKKworc3RhdGljIGlu
dCBzYmlfcmVxdWVzdF91bmFsaWduZWRfZGVsZWdhdGlvbih2b2lkKQoreworCXN0cnVjdCBzYmly
ZXQgcmV0OworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NF
VCwKKwkJCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLCAxLCAwLCAwLCAwLCAwKTsKKwor
CXJldHVybiBzYmlfZXJyX21hcF9saW51eF9lcnJubyhyZXQuZXJyb3IpOworfQorCitzdGF0aWMg
Ym9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKKworc3RhdGljIGludCBjcHVfb25saW5l
X3NiaV91bmFsaWduZWRfc2V0dXAodW5zaWduZWQgaW50IGNwdSkKK3sKKwlpZiAoc2JpX3JlcXVl
c3RfdW5hbGlnbmVkX2RlbGVnYXRpb24oKSAmJiBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCkg
eworCQlwcl9jcml0KCJNaXNhbGlnbmVkIHRyYXAgZGVsZWdhdGlvbiBub24gaG9tb2dlbmVvdXMg
KGV4cGVjdGVkIGRlbGVnYXRlZCkiKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJu
IDA7Cit9CisKK3N0YXRpYyB2b2lkCitjcHVfdW5hbGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRp
b24odm9pZCAqYXJnKQoreworCXN0cnVjdCBtaXNhbGlnbmVkX2RlbGVnX3JlcSAqcmVxID0gYXJn
OworCisJaWYgKHNiaV9yZXF1ZXN0X3VuYWxpZ25lZF9kZWxlZ2F0aW9uKCkpCisJCWF0b21pY19z
ZXQoJnJlcS0+ZXJyb3IsIDEpOworfQorCitzdGF0aWMgdm9pZCB1bmFsaWduZWRfc2JpX3JlcXVl
c3RfZGVsZWdhdGlvbih2b2lkKQoreworCXN0cnVjdCBtaXNhbGlnbmVkX2RlbGVnX3JlcSByZXEg
PSB7LmVycm9yID0gQVRPTUlDX0lOSVQoMCl9OworCisJb25fZWFjaF9jcHUoY3B1X3VuYWxpZ25l
ZF9zYmlfcmVxdWVzdF9kZWxlZ2F0aW9uLCAmcmVxLCAxKTsKKwlpZiAoYXRvbWljX3JlYWQoJnJl
cS5lcnJvcikgPT0gMCkgeworCQlwcl9pbmZvKCJTQkkgbWlzYWxpZ25lZCBhY2Nlc3MgZXhjZXB0
aW9uIGRlbGVnYXRpb24gb2tcbiIpOworCQltaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCA9IHRy
dWU7CisJCS8qCisJCSAqIE5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIHRvIHRha2UgYW55IHNwZWNp
ZmljIGFjdGlvbiBoZXJlLCBpZgorCQkgKiB0aGUgZGVsZWdhdGlvbiBpcyBzdWNjZXNzZnVsLCB0
aGVuCisJCSAqIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoKSB3aWxsIHZlcmlmeSB0
aGF0IGluZGVlZCB0aGUKKwkJICogcGxhdGZvcm0gdHJhcHMgb24gbWlzYWxpZ25lZCBhY2Nlc3Nl
cy4KKwkJICovCisJfQorfQorCit2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKQorewor
CWlmIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfRldGVCkgPiAwKQorCQl1bmFsaWduZWRf
c2JpX3JlcXVlc3RfZGVsZWdhdGlvbigpOworfQorI2Vsc2UKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vz
c19pbml0KHZvaWQpIHt9CisKK3N0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3Nl
dHVwKHVuc2lnbmVkIGludCBjcHUgX19hbHdheXNfdW51c2VkKQoreworCXJldHVybiAwOworfQor
I2VuZGlmCisKK2ludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBp
bnQgY3B1KQoreworCWludCByZXQgPSBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0dXAoY3B1
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tf
dW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jCmluZGV4IDkxZjE4OWNmMTYxMS4uMmYzYWJhMDczMjk3IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCkBAIC0xODgsMTMg
KzE4OCwyMCBAQCBhcmNoX2luaXRjYWxsX3N5bmMobG9ja19hbmRfc2V0X3VuYWxpZ25lZF9hY2Nl
c3Nfc3RhdGljX2JyYW5jaCk7CiAKIHN0YXRpYyBpbnQgcmlzY3Zfb25saW5lX2NwdSh1bnNpZ25l
ZCBpbnQgY3B1KQogeworCWludCByZXQ7CiAJc3RhdGljIHN0cnVjdCBwYWdlICpidWY7CiAKIAkv
KiBXZSBhcmUgYWxyZWFkeSBzZXQgc2luY2UgdGhlIGxhc3QgY2hlY2sgKi8KIAlpZiAocGVyX2Nw
dShtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfU0NBTEFSX1VOS05PV04pCiAJCWdvdG8gZXhpdDsKIAotCWNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWQoTlVMTCk7CisJcmV0ID0gY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2lu
aXQoY3B1KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJaWYgKHBlcl9jcHUobWlzYWxp
Z25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkgPT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9FTVVMQVRFRCkKKwkJZ290byBleGl0OworCiAJYnVmID0gYWxsb2NfcGFnZXMoR0ZQX0tFUk5F
TCwgTUlTQUxJR05FRF9CVUZGRVJfT1JERVIpOwogCWlmICghYnVmKSB7CiAJCXByX3dhcm4oIkFs
bG9jYXRpb24gZmFpbHVyZSwgbm90IG1lYXN1cmluZyBtaXNhbGlnbmVkIHBlcmZvcm1hbmNlXG4i
KTsKQEAgLTQwMyw2ICs0MTAsOCBAQCBzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nf
YWxsX2NwdXModm9pZCkKIHsKIAlib29sIGFsbF9jcHVzX2VtdWxhdGVkLCBhbGxfY3B1c192ZWNf
dW5zdXBwb3J0ZWQ7CiAKKwl1bmFsaWduZWRfYWNjZXNzX2luaXQoKTsKKwogCWFsbF9jcHVzX2Vt
dWxhdGVkID0gY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwogCWFs
bF9jcHVzX3ZlY191bnN1cHBvcnRlZCA9IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2Vt
dWxhdGVkX2FsbF9jcHVzKCk7CiAKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
