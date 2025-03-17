Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E69C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5RA7A/rgWItWiAfAV/wVxm2XIDYFVqTqPnHj//gYK0=; b=qbWc68NSlA8MCk
	d3wWl79ubBIk8zruWt2af3o+hs2gkh6G9dV5Hnm2ZpOZ7fRkhwgdTKlDOuEPkAO76qTSHuo8I0c5Y
	pjmEedIqJlIN1/7bD28J8Q9fJKdX8RXzg+PYLG+/gOFHzPztL8AGNUbwiLrLLecLttVE1TtjEAlLw
	un/PX56nYNHh/m2LEBQ/+u5WJMnKcVj4jqnbChGPSA5c2aG14TBiOXF8r9Gl+5aEsxYeMnDovxpC0
	L7YerzZBI3DCGwx0Aiqf43kMJQ5+oef/N3LQHu9AckTbpOfsOvQBFo52CA40o6OqTCc5DPnhq1Jf/
	LuBdOt2JpdTr/W8jYj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDes-00000003Ozv-2Wka;
	Mon, 17 Mar 2025 16:49:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDeq-00000003OwI-1E1m
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3965c995151so3162029f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230183; x=1742834983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6/bbJvgHdC6VrK3B/Gm9Q6mjQ3TSLFZ8q3dtucvWEA=;
        b=hXyJHzdoyDrO5teRllPRQHZ0xzYKhjT8C7fRkd3VHpmi7Ak1qbiEGcezzfhWYX17/Z
         kSnGniyl1msg0ujxnKas+o83SIiXKfZty8zumaEpJG/Hd30xnapFyOqasGGeEjXHPiHK
         4Rzuex7x/aupRF0PxxPXFQ7D6S92oLNtroYkA4+9MC80ilZSgDPMNvpNw8rrX993N/vF
         9wKe4sTLYL3BW7ZCbANjXwlhZ6jvXkeqjG5/Zx7M6ipZjxV9VnfQomrLdzbXNXkdXSbz
         P49bXhQhYIqnXsLntayO1vAueHAVuiLoVPF92avntO/+3HBCBrX+zfNq+RhN1vomF/Li
         00mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230183; x=1742834983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6/bbJvgHdC6VrK3B/Gm9Q6mjQ3TSLFZ8q3dtucvWEA=;
        b=ulVXVvqV2oBpOP5DJxOsy+fiDN+hmgcBnVd3ZPXltZeTOqeeOA7V+cUlXMSoNlpLLd
         94NggTF19i6jsw/fbk6yIkaLgJOcOcJrhq29gH+RqJdgcaQA0aQFFHwhuVJ5rMlNN6tE
         PNWcnnmFALLEiMCJ8mdTiqq8w8HncN8kDz5lZKl3Jh9ZVetRqWqsNVtk2A2EOqt7/BCK
         Ey1nVi3ec7YJ3hZ2U9fh/cp6eYRSAKjvZTDC57rpjGdCuG+O3LhL0czR27rq52DhV0Kj
         SvGXcQgcshibs2ZX9u+zB9kfIJyFp4bRIEy2ZlQLP+cNNBJxoYEIT1oj3a47tUPHTq5k
         Zwqg==
X-Forwarded-Encrypted: i=1; AJvYcCXECs9UgM+1JGA2m3ZnZE+8jY9c76YLxoxyKq+7+wDy+pCeHiamkv1Rm7HDjjD9NLjzAA+AtGwpvb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzowqhRxWAi0N058Z6dOC738HSAx4ELbQ/5iYFPmQfu4r56NbFr
	aaNiMaZ7GERUzf/RMXWXNr2ZXi3oYlJhHEtCUuRFbGz1wx+BA26twfnJE+aCN0CuiJ+Lq/EPQ9l
	qbXo=
X-Gm-Gg: ASbGnct//MZOThxqYQhDoqtCvu+zQ6clZeSIA77tzQotBrJMObiHipwpvmqzXF11JMA
	q4a19WnpJBn/dbW18WfyBnJ4wAA4d2Oy7p8/FaFYTbaJ9xS2apmgOVBmE6Mb4PtAah0sAkavIrN
	C4wvkGymKVLGOPh8u3sPzM5m8PjTA3eONdTboQcBiAGYaZ+Pbm4How8yKsWX/ZBrdj0W9ApquQ3
	QpaMvLPsH6pplPgHhPV9OrMIrbFkAu6eRhHWJGh/0ODjR+AWv1ABug0ztLW2IlLY1EBfxfBcZ6n
	5ScOECXNtKwy3hzgZpxekcMmUazbx9mQem9ZCLQv8HdLog==
X-Google-Smtp-Source: AGHT+IGlCkYjXJcY2NgqJ0dcTWubjUYgz/P8T6DyLcNDsDAF5fXtTBlLicX7RXrtkWB/h6r8kb4HEQ==
X-Received: by 2002:a5d:6d0f:0:b0:391:30b9:556c with SMTP id ffacd0b85a97d-3996b45ed95mr383147f8f.21.1742230182730;
        Mon, 17 Mar 2025 09:49:42 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v11 4/8] lib: riscv: Add functions for version checking
Date: Mon, 17 Mar 2025 17:46:49 +0100
Message-ID: <20250317164655.1120015-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094944_329900_7AC4B276 
X-CRM114-Status: GOOD (  11.06  )
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

VmVyc2lvbiBjaGVja2luZyB3YXMgZG9uZSB1c2luZyBzb21lIGN1c3RvbSBoYXJkY29kZWQgdmFs
dWVzLCBiYWNrcG9ydCBhCmZldyBTQkkgZnVuY3Rpb24gYW5kIGRlZmluZXMgZnJvbSBMaW51eCB0
byBkbyB0aGF0IGNsZWFubHkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Ci0tLQogbGliL3Jpc2N2L2FzbS9zYmkuaCB8IDE1ICsrKysrKysrKysr
KysrKwogbGliL3Jpc2N2L3NiaS5jICAgICB8ICA5ICsrKysrKystLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9yaXNj
di9hc20vc2JpLmggYi9saWIvcmlzY3YvYXNtL3NiaS5oCmluZGV4IDJmNGQ5MWVmLi5lZTlkNmU1
MCAxMDA2NDQKLS0tIGEvbGliL3Jpc2N2L2FzbS9zYmkuaAorKysgYi9saWIvcmlzY3YvYXNtL3Ni
aS5oCkBAIC0xOCw2ICsxOCwxMyBAQAogI2RlZmluZSBTQklfRVJSX0lPCQkJLTEzCiAjZGVmaW5l
IFNCSV9FUlJfREVOSUVEX0xPQ0tFRAkJLTE0CiAKKy8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRz
ICovCisjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQJMjQKKyNkZWZpbmUgU0JJ
X1NQRUNfVkVSU0lPTl9NQUpPUl9NQVNLCTB4N2YKKyNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9N
SU5PUl9NQVNLCTB4ZmZmZmZmCisjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFTSwkJKChTQklf
U1BFQ19WRVJTSU9OX01BSk9SX01BU0sgPDwgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVCkg
fCBcCisJCQkJCVNCSV9TUEVDX1ZFUlNJT05fTUlOT1JfTUFTSykKKwogI2lmbmRlZiBfX0FTU0VN
QkxFUl9fCiAjaW5jbHVkZSA8Y3B1bWFzay5oPgogCkBAIC0xMTAsNiArMTE3LDEzIEBAIHN0cnVj
dCBzYmlyZXQgewogCWxvbmcgdmFsdWU7CiB9OwogCisvKiBNYWtlIFNCSSB2ZXJzaW9uICovCitz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgc2JpX21rX3ZlcnNpb24odW5zaWduZWQgbG9uZyBt
YWpvciwgdW5zaWduZWQgbG9uZyBtaW5vcikKK3sKKwlyZXR1cm4gKChtYWpvciAmIFNCSV9TUEVD
X1ZFUlNJT05fTUFKT1JfTUFTSykgPDwgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVCkKKwkJ
fCAobWlub3IgJiBTQklfU1BFQ19WRVJTSU9OX01JTk9SX01BU0spOworfQorCiBzdHJ1Y3Qgc2Jp
cmV0IHNiaV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCiAJCQl1
bnNpZ25lZCBsb25nIGFyZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKIAkJCXVuc2lnbmVkIGxvbmcg
YXJnMywgdW5zaWduZWQgbG9uZyBhcmc0LApAQCAtMTI0LDYgKzEzOCw3IEBAIHN0cnVjdCBzYmly
ZXQgc2JpX3NlbmRfaXBpX2NwdShpbnQgY3B1KTsKIHN0cnVjdCBzYmlyZXQgc2JpX3NlbmRfaXBp
X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrKTsKIHN0cnVjdCBzYmlyZXQgc2JpX3NlbmRf
aXBpX2Jyb2FkY2FzdCh2b2lkKTsKIHN0cnVjdCBzYmlyZXQgc2JpX3NldF90aW1lcih1bnNpZ25l
ZCBsb25nIHN0aW1lX3ZhbHVlKTsKK3N0cnVjdCBzYmlyZXQgc2JpX2dldF9zcGVjX3ZlcnNpb24o
dm9pZCk7CiBsb25nIHNiaV9wcm9iZShpbnQgZXh0KTsKIAogI2VuZGlmIC8qICFfX0FTU0VNQkxF
Ul9fICovCmRpZmYgLS1naXQgYS9saWIvcmlzY3Yvc2JpLmMgYi9saWIvcmlzY3Yvc2JpLmMKaW5k
ZXggMDJkZDMzOGMuLjlkNGViNTQxIDEwMDY0NAotLS0gYS9saWIvcmlzY3Yvc2JpLmMKKysrIGIv
bGliL3Jpc2N2L3NiaS5jCkBAIC0xMDcsMTIgKzEwNywxNyBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9z
ZXRfdGltZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSkKIAlyZXR1cm4gc2JpX2VjYWxsKFNC
SV9FWFRfVElNRSwgU0JJX0VYVF9USU1FX1NFVF9USU1FUiwgc3RpbWVfdmFsdWUsIDAsIDAsIDAs
IDAsIDApOwogfQogCitzdHJ1Y3Qgc2JpcmV0IHNiaV9nZXRfc3BlY192ZXJzaW9uKHZvaWQpCit7
CisJcmV0dXJuIHNiaV9lY2FsbChTQklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfU1BFQ19W
RVJTSU9OLCAwLCAwLCAwLCAwLCAwLCAwKTsKK30KKwogbG9uZyBzYmlfcHJvYmUoaW50IGV4dCkK
IHsKIAlzdHJ1Y3Qgc2JpcmV0IHJldDsKIAotCXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0JBU0Us
IFNCSV9FWFRfQkFTRV9HRVRfU1BFQ19WRVJTSU9OLCAwLCAwLCAwLCAwLCAwLCAwKTsKLQlhc3Nl
cnQoIXJldC5lcnJvciAmJiAocmV0LnZhbHVlICYgMHg3ZmZmZmZmZnVsKSA+PSAyKTsKKwlyZXQg
PSBzYmlfZ2V0X3NwZWNfdmVyc2lvbigpOworCWFzc2VydCghcmV0LmVycm9yICYmIChyZXQudmFs
dWUgJiBTQklfU1BFQ19WRVJTSU9OX01BU0spID49IHNiaV9ta192ZXJzaW9uKDAsIDIpKTsKIAog
CXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9QUk9CRV9FWFQsIGV4
dCwgMCwgMCwgMCwgMCwgMCk7CiAJYXNzZXJ0KCFyZXQuZXJyb3IpOwotLSAKMi40Ny4yCgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
