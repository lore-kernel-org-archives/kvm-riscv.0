Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DFC35FF8
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDNcVhBdQvZMPnOj/GgHgYlXcyt+ylAQLFeeQhDJOYQ=; b=sO26RI+boRZlV3
	kmH90ujAAfYsKygL7/ME0/rGU+p2fQM1sJjdlckjQTO2VpTuiveQJRXVp0lqEIQyufVtbT9uBQ6Rf
	nU4vZbv8wubrFaoR3u+cyaQaED/YRZuPwYtl35o8jqdZlttAvX5aXSkKNPuZyoPfHDuYaIeUeI7xD
	AtfTQM9uFG+H7/X/9EZJyW+/hGQEnXLP8+75zFUOzqmXrEABcGqOFImtkMfrLyjpul2s7tjNGXNQe
	m5pHnqye2g1wzQIc5JORP2XP5oeib1/PejCA5Ug0mxKDwPHMnI8j8LhH5fUGDRMIWBYWyXHQYsPHU
	hIFF9oGUDMxVhK9Mr6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1N-00000003UuF-3eDK;
	Mon, 17 Mar 2025 17:13:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwh-00000003TNx-40zh
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso22361095e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231290; x=1742836090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzyfmLdoy3J2d7N3ElT+BcY4glWrhhZZ3MI8rtjNdBk=;
        b=PC8SMDxg/39rRwF1oy1T82SRYA2SGjrhRwlzN1MOTDWf6EhinxEeepattelVs5vRsS
         dBF9AzjVS1EivyFXbQ8QVkKgM/phpL2JX5k3Tk76Us4kBqj7ebyBSAXz3Q9+NLAXEtTK
         jfspf0XDaMHsz4FzzFIG/1d50kic6VbkFAC2717M2C3D3tsKEZwxetGv+A+BmX+2H1Fb
         36fDXAbn79rBcBxy+zni/kmQjJwEvvuQwlSGl2w2yxnOose072tPUhEC7qJZhqhS7i5I
         5k1xS1BkIBoJ1Ja9ItyNqmiQN+WMx4hgDLW/x/lnDMVviBBxQdeJS7P5XnN7K/C+xMeY
         V4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231290; x=1742836090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzyfmLdoy3J2d7N3ElT+BcY4glWrhhZZ3MI8rtjNdBk=;
        b=qrCYkxasxMxDLpitWpiZ7dIJZLebBYwMpBPmmp1+/6x6aeJOH9EMddk4nve6dqVXzE
         8wZPw/T1q0abjCzfkHS85aSS/X6u3fhz2Cbptaf1CUsiuoGlrgUbxWS/+3nrRM3WApLa
         h1bek06oVNe2esdmDJVIurSTxix0bVYrb6Tnu+YaoUr5fO+5IWBaW5R6dwSULepwzlNn
         Mn9CuJOsOslfoGlGtmy/neq6GZSUtk1R/brU2D8o0i4xuK7g7fhb87R5y2eZTj9MiHxg
         IkBxS4pO8yvULQsr/LHJWiz7o9wCVJ7Ka06FZcSvNykBmqwm5lzZrDzECnZlDQ5rTzjw
         cVoA==
X-Forwarded-Encrypted: i=1; AJvYcCVv1S9geXVaeBOjy/Tw1Sm7i/ng4hiXYyZfrMyITCK1L96a+WOYXhqv5lXqJHezgld08r9SDnvIgzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyihOu2R0qBuBXl/OU3t6ZjYOqa45niJ+Hvd7K2Qa5lfiITtPxl
	E9J7zWawR1a8OX4jvb6u7BCZ0Sy829BX+xAHoYTzKxkA+r48OUMfar/gzi0JwWA=
X-Gm-Gg: ASbGncucBlnSjvwdDMeEdJ10nrWU3XeoqkA0HseMWxxe3O/BNGEsbNzFLlD71GNea9D
	k31bWebjNuqWEx9BqiOHV+7uCk7M1W/fC2UKt5YiRd8vK3uUlcrZLrV5F5NjSvQHi+Fg4Do2WUA
	0i6NUi7zF7YUjakeP7Lchi2nt0wfVi+UQKEd3T6k34nzXTR01TJ6tv5YDycLKVRgp88zg1XhpkD
	ndVdSUSTrtTwqWNbpJerwaS8tccBOwNqLyGFXr6Iupi4zBLEdXPU30mvbNt8duW0p6jIcVKhWGi
	BydfS4ewThpeBCHGdcl1m0jiazW5vSmEpMLzv1Tzs3E4Pg==
X-Google-Smtp-Source: AGHT+IEXtMD53rpT5+I6qBlek794Ca+55Nd9V0KPjs7YD1xcg1pmEqFLjYcNNVWjDAHYDrYaGY3dSQ==
X-Received: by 2002:a05:600c:3c89:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43d1ecd7adfmr118223885e9.21.1742231290211;
        Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:09 -0700 (PDT)
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
Subject: [PATCH v4 03/18] riscv: sbi: add FWFT extension interface
Date: Mon, 17 Mar 2025 18:06:09 +0100
Message-ID: <20250317170625.1142870-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100811_993583_AE59462C 
X-CRM114-Status: GOOD (  13.74  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRv
IHNldCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKbWFzayBhcyB3ZWxsIGFzIGZv
ciB0aGUgb25saW5lIGNwdSBtYXNrLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAy
MCArKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDY5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggZDExZDIyNzE3YjQ5Li4xY2VjZmE4MmMyZTUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaApAQCAtNTAzLDYgKzUwMywyNiBAQCBpbnQgc2JpX3JlbW90ZV9o
ZmVuY2VfdnZtYV9hc2lkKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAkJCQl1bnNp
Z25lZCBsb25nIGFzaWQpOwogbG9uZyBzYmlfcHJvYmVfZXh0ZW5zaW9uKGludCBleHQpOwogCitp
bnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrLCB1MzIg
ZmVhdHVyZSwKKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZs
YWdzKTsKKy8qKgorICogc2JpX2Z3ZnRfbG9jYWxfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIG9uIGFs
bCBvbmxpbmUgY3B1cworICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIHRvIGJlIHNldAorICogQHZh
bHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0dXJl
IHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51
eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9md2Z0
X2xvY2FsX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwKKwkJCQkgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzKQorIHsKKwkgcmV0dXJuIHNiaV9md2Z0X2xvY2FsX3NldF9jcHVt
YXNrKGNwdV9vbmxpbmVfbWFzaywgZmVhdHVyZSwgdmFsdWUsCisJCQkJCSAgIGZsYWdzKTsKKyB9
CisKK2ludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKTsK
K2ludCBzYmlfZndmdF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2ln
bmVkIGxvbmcgZmxhZ3MpOworCiAvKiBDaGVjayBpZiBjdXJyZW50IFNCSSBzcGVjaWZpY2F0aW9u
IHZlcnNpb24gaXMgMC4xIG9yIG5vdCAqLwogc3RhdGljIGlubGluZSBpbnQgc2JpX3NwZWNfaXNf
MF8xKHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NiaS5jCmluZGV4IDE5ODliOGNhZGUxYi4uZDQxYTU2NDJiZTI0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
YmkuYwpAQCAtMjk5LDYgKzI5OSw3NSBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50
IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwogfQogCisv
KioKKyAqIHNiaV9md2Z0X2dldCgpIC0gR2V0IGEgZmVhdHVyZSBmb3IgdGhlIGxvY2FsIGhhcnQK
KyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBiZSBzZXQKKyAqIEB2YWx1ZTogV2lsbCBj
b250YWluIHRoZSBmZWF0dXJlIHZhbHVlIG9uIHN1Y2Nlc3MKKyAqCisgKiBSZXR1cm46IDAgb24g
c3VjY2VzcywgYXBwcm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2lu
dCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQoreworCXJl
dHVybiAtRU9QTk9UU1VQUDsKK30KKworLyoqCisgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBhIGZl
YXR1cmUgb24gdGhlIGxvY2FsIGhhcnQKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBi
ZSBzZXQKKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBw
cm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2ludCBzYmlfZndmdF9z
ZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
Cit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCitzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKKwl1
MzIgZmVhdHVyZTsKKwl1bnNpZ25lZCBsb25nIHZhbHVlOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
CisJYXRvbWljX3QgZXJyb3I7Cit9OworCitzdGF0aWMgdm9pZCBjcHVfc2JpX2Z3ZnRfc2V0KHZv
aWQgKmFyZykKK3sKKwlzdHJ1Y3QgZndmdF9zZXRfcmVxICpyZXEgPSBhcmc7CisJaW50IHJldDsK
KworCXJldCA9IHNiaV9md2Z0X3NldChyZXEtPmZlYXR1cmUsIHJlcS0+dmFsdWUsIHJlcS0+Zmxh
Z3MpOworCWlmIChyZXQpCisJCWF0b21pY19zZXQoJnJlcS0+ZXJyb3IsIHJldCk7Cit9CisKKy8q
KgorICogc2JpX2Z3ZnRfbG9jYWxfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIGZvciB0aGUgc3BlY2lm
aWVkIGNwdW1hc2sKKyAqIEBtYXNrOiBDUFUgbWFzayBvZiBjcHVzIHRoYXQgbmVlZCB0aGUgZmVh
dHVyZSB0byBiZSBzZXQKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBiZSBzZXQKKyAq
IEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6IEZXRlQgZmVh
dHVyZSBzZXQgZmxhZ3MKKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBwcm9wcmlhdGUg
bGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2ludCBzYmlfZndmdF9sb2NhbF9zZXRf
Y3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAorCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJc3RydWN0IGZ3ZnRf
c2V0X3JlcSByZXEgPSB7CisJCS5mZWF0dXJlID0gZmVhdHVyZSwKKwkJLnZhbHVlID0gdmFsdWUs
CisJCS5mbGFncyA9IGZsYWdzLAorCQkuZXJyb3IgPSBBVE9NSUNfSU5JVCgwKSwKKwl9OworCisJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCisJCXJldHVybiAtRUlO
VkFMOworCisJb25fZWFjaF9jcHVfbWFzayhtYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVxLCAx
KTsKKworCXJldHVybiBhdG9taWNfcmVhZCgmcmVxLmVycm9yKTsKK30KKwogLyoqCiAgKiBzYmlf
c2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KICAq
IEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hv
dWxkIGZpcmUuCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
