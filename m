Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66413C35FF3
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UU5iys6OURWFI7/yVvkCsS8PlXOzbi7PeWbVQAF9nQ=; b=10AegfxlI2YiXP
	5zfqwaeCqMJLwrd84jhtb7FJbKOzLfY0WffXqb70i1mtLfMfX0oQViR3HU1ldqRGJAcSNgicilD3+
	jIEk+Exj7k8DNSDM/riQ53S4Vc063vhcGN0jwszKq57aOUW8ILOKmVGanbMtUEunAYEDXRonl+kes
	9cPvRIeyQJXsAtvbFYTYSoxFbQPpTWNAc0ks6ohuiTf9hNd2OWUBDfsFSz1/FyBJOpmghTKI8TUj4
	OyfVTsiCTTFQBFbRS+n7vC3iOySMRLKcy7Yp2bRnAsKnjTKv+59mBEBKGtb8mUjRZTcXfvRjxcoWn
	qXCRelZ/NlMT0wJwXApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDeu-00000003P1i-0XHC;
	Mon, 17 Mar 2025 16:49:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDer-00000003Owu-0gZw
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39130ee05b0so4555489f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230183; x=1742834983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfmWlxkCqA/TGxSraCRrSpkfyPy1M1BQ3u35DJOeMtk=;
        b=whGAqCf1bksms8a+msulHyvvQmYhl2F2znB7Ktc80/VLHX0aBFy5FHBsPHT4eLVmn7
         QTKRC4d31RfIuyQmM9H0AjFfeltneD3hJhNgh2iYZEOVdUksEuHYJAmljx6KF4L3LSPS
         emvaE0gyZQLf0Bx/AhZgEOV/GG/cYlf4ot0FvodVP2xgzvwY+e2ZReehBOCkq2wd6r1v
         68M7IbBT/3Ndt3juMNa6IW9JhrvwQ6B7XP5n8aNVpF2+Jo5cyFGzieE5NCSdXx+ErnXa
         ySexpGJvCt/olPx5zV+l5Ol5gFmjT4IKoxONxBIHhhT80vAys1DzOzwypnhmifqwY2zG
         5EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230183; x=1742834983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfmWlxkCqA/TGxSraCRrSpkfyPy1M1BQ3u35DJOeMtk=;
        b=kvTyhAbtN1kz5ze0iMowmn/XYX7p1RCu9VLRXpnCmJRvSiw8BCd4tAw8Qd1OzQDc/8
         MbXUZo8McbDBiwN6YZjUXZO7+MNhqH9Y8rO7rINpEvy2Qk/aybOXqot2IYGkMB7e76ZC
         JfSdPR9BqQYRggQvbqrnPFvUO2HwMk41nq9nI43OCyzg5c4NVU1hU4V5ayd5UMoLC6QJ
         vrGkxy5cK8YwZ1G2WF+76qNY2yLA6I8Ixvk+7+ZObNmuLMXZ1p37abeAaDKcBN1x3iHf
         Ny8vF1YWnQdFL3HVIO5FRC/GObTE33qXksT0aILS7/SXRLEeBRVfe1tj3+AoZZk+Jz1C
         L3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUomqhASyIte7fLn7BDdWp/iHxgDsFNsnqPIs51ykCYGjoY3vGYuDqtCbY41INqAgcyvXuRBq2pZ74=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp4bYo3zvRPkb/kGx8g213tFPOrGsmdzwDXRugnOTLkHzpL+SW
	4Xudm83qo3eTJBmLfkJGVi8lQi43qZk7PmNzxTA69K/ne1SGBUAh41Qx/0rpBzE=
X-Gm-Gg: ASbGncs+wGb2Sy/At1McqkkIY3IQFCorl0MWfAiwH0ZxCxjW3km2HzrDCf948JqsXFj
	QRLvn9H2zTORCidy8ROHQdulBVavHUwh6IVAFeqfz+YRjNgxCw7/gbwIQDA8wHkxZSM1uEVGdDF
	2Im1A5cwr2oOgF0kkykaLJdOb8piuP9AR/UkOJd4+D03Lz4TGm9ptYmdr5KsqPwYUFrf4Qm+FlR
	F7adNsbedmiH0lIWknRIyHjP5R/ZlQLq30c0dqdSX4Howm1Zgrf4xffY45mqAMKpkpseq6VOyFf
	E35+EsZA/89Lksdzs/eJRwXtHNVoke9n0iPjlDtt/6BNKw==
X-Google-Smtp-Source: AGHT+IF5e60EIooJ6SAI+LPIypiIi6vs4+A+3ui5JNTqeRWZqwGkmhdB30foCmneaGDf8Boyvvzr7Q==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3971f9e7813mr13298142f8f.47.1742230183615;
        Mon, 17 Mar 2025 09:49:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v11 5/8] lib: riscv: Add functions to get implementer ID and version
Date: Mon, 17 Mar 2025 17:46:50 +0100
Message-ID: <20250317164655.1120015-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094945_205386_1E8FEB6A 
X-CRM114-Status: GOOD (  10.19  )
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

VGhlc2UgZnVuY3Rpb25zIHdpbGwgYmUgdXNlZCBieSBTU0UgdGVzdHMgdG8gY2hlY2sgZm9yIGEg
c3BlY2lmaWMgT3BlblNCSQp2ZXJzaW9uLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGxpYi9yaXNjdi9hc20vc2JpLmggfCAyMCArKysr
KysrKysrKysrKysrKysrKwogbGliL3Jpc2N2L3NiaS5jICAgICB8IDIwICsrKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9s
aWIvcmlzY3YvYXNtL3NiaS5oIGIvbGliL3Jpc2N2L2FzbS9zYmkuaAppbmRleCBlZTlkNmU1MC4u
OTAxMTE2MjggMTAwNjQ0Ci0tLSBhL2xpYi9yaXNjdi9hc20vc2JpLmgKKysrIGIvbGliL3Jpc2N2
L2FzbS9zYmkuaApAQCAtMTgsNiArMTgsMTkgQEAKICNkZWZpbmUgU0JJX0VSUl9JTwkJCS0xMwog
I2RlZmluZSBTQklfRVJSX0RFTklFRF9MT0NLRUQJCS0xNAogCisjZGVmaW5lIFNCSV9JTVBMX0JC
TAkJMAorI2RlZmluZSBTQklfSU1QTF9PUEVOU0JJCTEKKyNkZWZpbmUgU0JJX0lNUExfWFZJU09S
CQkyCisjZGVmaW5lIFNCSV9JTVBMX0tWTQkJMworI2RlZmluZSBTQklfSU1QTF9SVVNUU0JJCTQK
KyNkZWZpbmUgU0JJX0lNUExfRElPU0lYCQk1CisjZGVmaW5lIFNCSV9JTVBMX0NPRkZFUgkJNgor
I2RlZmluZSBTQklfSU1QTF9YRU4JCTcKKyNkZWZpbmUgU0JJX0lNUExfUE9MQVJGSVJFX0hTUwk4
CisjZGVmaW5lIFNCSV9JTVBMX0NPUkVCT09UCTkKKyNkZWZpbmUgU0JJX0lNUExfT1JFQk9PVAkx
MAorI2RlZmluZSBTQklfSU1QTF9CSFlWRQkJMTEKKwogLyogU0JJIHNwZWMgdmVyc2lvbiBmaWVs
ZHMgKi8KICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAogI2RlZmluZSBT
QklfU1BFQ19WRVJTSU9OX01BSk9SX01BU0sJMHg3ZgpAQCAtMTI0LDYgKzEzNywxMSBAQCBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgc2JpX21rX3ZlcnNpb24odW5zaWduZWQgbG9uZyBtYWpv
ciwgdW5zaWduZWQgbG9uZyBtaQogCQl8IChtaW5vciAmIFNCSV9TUEVDX1ZFUlNJT05fTUlOT1Jf
TUFTSyk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBzYmlfaW1wbF9vcGVuc2Jp
X21rX3ZlcnNpb24odW5zaWduZWQgbG9uZyBtYWpvciwgdW5zaWduZWQgbG9uZyBtaW5vcikKK3sK
KwlyZXR1cm4gKCgobWFqb3IgJiAweGZmZmYpIDw8IDE2KSB8IChtaW5vciAmIDB4ZmZmZikpOwor
fQorCiBzdHJ1Y3Qgc2JpcmV0IHNiaV9lY2FsbChpbnQgZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBs
b25nIGFyZzAsCiAJCQl1bnNpZ25lZCBsb25nIGFyZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKIAkJ
CXVuc2lnbmVkIGxvbmcgYXJnMywgdW5zaWduZWQgbG9uZyBhcmc0LApAQCAtMTM5LDYgKzE1Nyw4
IEBAIHN0cnVjdCBzYmlyZXQgc2JpX3NlbmRfaXBpX2NwdW1hc2soY29uc3QgY3B1bWFza190ICpt
YXNrKTsKIHN0cnVjdCBzYmlyZXQgc2JpX3NlbmRfaXBpX2Jyb2FkY2FzdCh2b2lkKTsKIHN0cnVj
dCBzYmlyZXQgc2JpX3NldF90aW1lcih1bnNpZ25lZCBsb25nIHN0aW1lX3ZhbHVlKTsKIHN0cnVj
dCBzYmlyZXQgc2JpX2dldF9zcGVjX3ZlcnNpb24odm9pZCk7Cit1bnNpZ25lZCBsb25nIHNiaV9n
ZXRfaW1wX3ZlcnNpb24odm9pZCk7Cit1bnNpZ25lZCBsb25nIHNiaV9nZXRfaW1wX2lkKHZvaWQp
OwogbG9uZyBzYmlfcHJvYmUoaW50IGV4dCk7CiAKICNlbmRpZiAvKiAhX19BU1NFTUJMRVJfXyAq
LwpkaWZmIC0tZ2l0IGEvbGliL3Jpc2N2L3NiaS5jIGIvbGliL3Jpc2N2L3NiaS5jCmluZGV4IDlk
NGViNTQxLi5hYjAzMmUzZSAxMDA2NDQKLS0tIGEvbGliL3Jpc2N2L3NiaS5jCisrKyBiL2xpYi9y
aXNjdi9zYmkuYwpAQCAtMTA3LDYgKzEwNywyNiBAQCBzdHJ1Y3Qgc2JpcmV0IHNiaV9zZXRfdGlt
ZXIodW5zaWduZWQgbG9uZyBzdGltZV92YWx1ZSkKIAlyZXR1cm4gc2JpX2VjYWxsKFNCSV9FWFRf
VElNRSwgU0JJX0VYVF9USU1FX1NFVF9USU1FUiwgc3RpbWVfdmFsdWUsIDAsIDAsIDAsIDAsIDAp
OwogfQogCit1bnNpZ25lZCBsb25nIHNiaV9nZXRfaW1wX3ZlcnNpb24odm9pZCkKK3sKKwlzdHJ1
Y3Qgc2JpcmV0IHJldDsKKworCXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0JBU0UsIFNCSV9FWFRf
QkFTRV9HRVRfSU1QX1ZFUlNJT04sIDAsIDAsIDAsIDAsIDAsIDApOworCWFzc2VydCghcmV0LmVy
cm9yKTsKKworCXJldHVybiByZXQudmFsdWU7Cit9CisKK3Vuc2lnbmVkIGxvbmcgc2JpX2dldF9p
bXBfaWQodm9pZCkKK3sKKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKKworCXJldCA9IHNiaV9lY2FsbChT
QklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfSU1QX0lELCAwLCAwLCAwLCAwLCAwLCAwKTsK
Kwlhc3NlcnQoIXJldC5lcnJvcik7CisKKwlyZXR1cm4gcmV0LnZhbHVlOworfQorCiBzdHJ1Y3Qg
c2JpcmV0IHNiaV9nZXRfc3BlY192ZXJzaW9uKHZvaWQpCiB7CiAJcmV0dXJuIHNiaV9lY2FsbChT
QklfRVhUX0JBU0UsIFNCSV9FWFRfQkFTRV9HRVRfU1BFQ19WRVJTSU9OLCAwLCAwLCAwLCAwLCAw
LCAwKTsKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
