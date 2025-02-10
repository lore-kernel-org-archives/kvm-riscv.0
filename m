Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663EC021A3
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRyNunYalImduzplpNG0/RZ3y2FRgAx2vt3vFrVmkdo=; b=PDn1EebhSa3She
	m4/gU9qezUmRoQDVsKU6hp+ItTG0MQ8xWmqKfYOuPAsfx4gyfrhNIvyi2TXSeT/3aTYTlNg9VsXwb
	9xxT/XPZFtKZqkhOrsHnw4RjTPw78Mf1k2ysVfPJMEZaOqjoEuGIy1M9U568peH2VMVC9wrRNyYq5
	RNFCGuOUF68I3oLQWM2EtowHL3c54tCVQ6MSIjqwAoko8fjMSUJCyM/5LHJjLtb90HQxKIxDUJNOJ
	mUvJv+dDqqSfHhoElak+sDvdb55QCRLIXRZUn8GCpp3gqdU8dXZFDDevA8+Qx0sYFBJ9KZ9UR9K9I
	eKGo6XkPKo//+jE3tv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcgw-00000001kej-3AzM;
	Mon, 10 Feb 2025 22:55:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS9-00000001VWr-3AJl
	for kvm-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=YLemH8ynfgSfPvc/FNbZdwEa9OOsaEqx6lRijihbbR8=; b=oaGHdhdEyOKEfEHPOXSyvVkuNP
	YFXNlyD1zYWpm78+V2c42gVqqWga/UhN/HyEPLnwfqRgqiClUbhlA9Dsp77E9jr/pfHSJzhnX8LIj
	QQ+g1DPYNUPI0twji7oBpY5pmBUlWkTl1slC266zWwfDJBMMh0LdW/GFQTye39EvBDSNVlwbRF1P3
	xSMds/vpznavVnuTP+3VehdT38yrIcAazxmym97H+vecNmzzO7p2BddlRWiKiOfgorfYUBUXgJLdx
	2tz18HVoBu20H4/Kk4nvC0lM9ubxig2iP7ypNzRnHwXcF9CFpCIt3v66g9tuHMJk/klNOJFAfn1Ac
	7bWFYl6w==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS5-0000000GoST-41EY
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so2080185f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223383; x=1739828183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLemH8ynfgSfPvc/FNbZdwEa9OOsaEqx6lRijihbbR8=;
        b=WTp7hm6BtoF38h/0Q1noY5l4R8Ysa/DEmJixoqjO8sQxPyOQlkjAD9vV3Cm4cd++CQ
         EKZDNSQfA7hhSOTHYbTQHmMpZ9sTcBEX2LmyzcpIx9DxCt16uo0Dw0lYzOLGe9qMBT/B
         MzCgx5FVwXPGtAkDZQiz8FqRdIwA8DIBUsnpNorib6I9TOiZ9ST28I/FYnNmTI6n4oqp
         QFlhNfX1pSSX1NyHlPi2Qw3RTWA+KjU3ZY5uB8LVeAt7G9qOCghOMNnX7q8BI0Uh0nR9
         JnqIsKfI81sDS8Ocp2ZT0EAplUjLP9kUxkFLa/BkHrobj+pZofVFqw6NszshvodcJsnB
         rwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223383; x=1739828183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLemH8ynfgSfPvc/FNbZdwEa9OOsaEqx6lRijihbbR8=;
        b=S5OtlbJeozVquN0Zi9373k3+d8EVpGITjABFNAfp5PHer9pegdluLRmyIp0facT/Ux
         1C5vGFcA3pI18Klj8uRwc0DuutyXAu9APuytyYgCqJNCnO5PHC5i8TLXGcVkls6IXwHB
         lPDmpsWSFCS+vbvHS29eWfz/SzvIAUMezHzJEdxk3btREzD3PJmBfert7Ycuwy6JrTcD
         myM/x5XSoGbv0XwyCm3b+N1UFoujgpEF0ikR6RXe0DtIwm4vmz5putsVdchNDFx99g7e
         JetN/L3hk5uCIUY/QSPuHcWLWUX9yDrKfE6ql5IHVIrOz2FH2vm9pb4hdGpxinPeYtnt
         Q4cw==
X-Forwarded-Encrypted: i=1; AJvYcCVDFDYyBXz8Dqrd5BzbN3ItvOx13UAPbtj58CgOCTCXma70N2M80zvWA4xbckuWcEpCzYwvKsoFvyE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc6qGUn6v++g3rBKWwUyPTSDkmxHOdC5V4Z7MXzw3QLSgaJDL7
	cC/8HBONUs2/dyM6Bjvtx5+i07J2v92d/yGHLWmSlWNKS0Ui7rPm0NLYaNbeY2c=
X-Gm-Gg: ASbGnctlllhXxchrr+Ep2YIwG9+ElmShoNm0Lm3KhWPCod3mx1mhtkoaD9HcZlcT0mW
	bXMILee3Ktg5BQJs6J+afn6vy5Jj31n7MbyPyZXGmZW1RtgnK0NzXjDF/DAkkWFKYotKaTkbHor
	dlLrLmT8KLSF2t5GIjI/mWSJnvcOYkbvNLu4qyUmQU7TR7fI4xIymZmXwvtLoexIN1zFlwEJt3/
	jMQi55XpXdXEy5gLqm2D93KR6bKKVIY63Z3tKwOyzt9PezeRcATYzW0OEEgbIwUEtHzqs5Iy6Xt
	vRcixCQGny87Eefn
X-Google-Smtp-Source: AGHT+IH2dlYi1O5kUCZJxtYlgHXa+ws9BLhvD6mC+8NX+JeSXuC2kr9vlNuO+zXUNjOhcWWHcNo08w==
X-Received: by 2002:adf:efc4:0:b0:38a:4b8b:c57a with SMTP id ffacd0b85a97d-38dc93509damr12435434f8f.44.1739223383507;
        Mon, 10 Feb 2025 13:36:23 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:22 -0800 (PST)
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
Subject: [PATCH v2 15/15] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Mon, 10 Feb 2025 22:35:48 +0100
Message-ID: <20250210213549.1867704-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213626_308101_3F865207 
X-CRM114-Status: GOOD (  13.25  )
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
bS92Y3B1LmMKaW5kZXggNTQyNzQ3ZTJjN2Y1Li5kOThlMzc5OTQ1YzMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTY0Niw2
ICs2NDYsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IHsKIAl2b2lkICpuc2g7CiAJc3RydWN0IGt2bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2gu
Z3Vlc3RfY3NyOworCXN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNm
ZzsKIAogCXZjcHUtPmNwdSA9IC0xOwogCkBAIC02NzEsNiArNjcyLDcgQEAgdm9pZCBrdm1fYXJj
aF92Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWNzci0+dnN0dmFsID0gbmFjbF9j
c3JfcmVhZChuc2gsIENTUl9WU1RWQUwpOwogCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFkKG5z
aCwgQ1NSX0hWSVApOwogCQljc3ItPnZzYXRwID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9WU0FU
UCk7CisJCWNmZy0+aGVkZWxlZyA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSEVERUxFRyk7CiAJ
fSBlbHNlIHsKIAkJY3NyLT52c3N0YXR1cyA9IGNzcl9yZWFkKENTUl9WU1NUQVRVUyk7CiAJCWNz
ci0+dnNpZSA9IGNzcl9yZWFkKENTUl9WU0lFKTsKQEAgLTY4MSw2ICs2ODMsNyBAQCB2b2lkIGt2
bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJY3NyLT52c3R2YWwgPSBj
c3JfcmVhZChDU1JfVlNUVkFMKTsKIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hWSVApOwog
CQljc3ItPnZzYXRwID0gY3NyX3JlYWQoQ1NSX1ZTQVRQKTsKKwkJY2ZnLT5oZWRlbGVnID0gY3Ny
X3JlYWQoQ1NSX0hFREVMRUcpOwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IGZl
NjA4YmYxNjU1OC4uMjM1YTQ2ZDU1M2Q0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9md2Z0LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCkBAIC0xNCw2
ICsxNCw4IEBACiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5oPgogI2luY2x1ZGUgPGFzbS9r
dm1fdmNwdV9zYmlfZndmdC5oPgogCisjZGVmaW5lIE1JU19ERUxFRyAoMVVMIDw8IEVYQ19MT0FE
X01JU0FMSUdORUQgfCAxVUwgPDwgRVhDX1NUT1JFX01JU0FMSUdORUQpCisKIHN0YXRpYyBjb25z
dCBlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCBrdm1fZndmdF9kZWZpbmVkX2ZlYXR1cmVzW10gPSB7
CiAJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCiAJU0JJX0ZXRlRfTEFORElOR19QQUQs
CkBAIC0zNSw3ICszNyw0NCBAQCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1
cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAK
K3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVk
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAoIW1pc2FsaWduZWRfdHJhcHNfY2FuX2Rl
bGVnYXRlKCkpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMg
aW50IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKKwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJCXVu
c2lnbmVkIGxvbmcgdmFsdWUpCit7CisJaWYgKHZhbHVlID09IDEpCisJCWNzcl9zZXQoQ1NSX0hF
REVMRUcsIE1JU19ERUxFRyk7CisJZWxzZSBpZiAodmFsdWUgPT0gMCkKKwkJY3NyX2NsZWFyKENT
Ul9IRURFTEVHLCBNSVNfREVMRUcpOworCWVsc2UKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9Q
QVJBTTsKKworCXJldHVybiBTQklfU1VDQ0VTUzsKK30KKworc3RhdGljIGludCBrdm1fc2JpX2Z3
ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJ
CXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25lZCBsb25nICp2
YWx1ZSkKK3sKKwkqdmFsdWUgPSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlTX0RFTEVHKSAh
PSAwOworCisJcmV0dXJuIFNCSV9TVUNDRVNTOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGt2
bV9zYmlfZndmdF9mZWF0dXJlIGZlYXR1cmVzW10gPSB7CisJeworCQkuaWQgPSBTQklfRldGVF9N
SVNBTElHTkVEX0VYQ19ERUxFRywKKwkJLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9taXNhbGln
bmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkLAorCQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNh
bGlnbmVkX2RlbGVnYXRpb24sCisJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRf
ZGVsZWdhdGlvbiwKKwl9LAogfTsKIAogc3RhdGljIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmln
ICoKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
