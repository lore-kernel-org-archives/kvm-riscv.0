Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD2C0219E
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28thzMiuupqpNALC5s8w7nr2VnmpluB2BNXEqUWg4Uc=; b=bPQeGgzNUjC8SJ
	u1hildV+6N1CuFuRxqvH8DCApPNum/CMwe8Me9Wf4pDXebA5LCByvv4XZeMlfZK0/M/YSckL3YPYE
	ZkZ/Bqn8JgR+WgEvpWAxSeHco5O451IdOkMcVHb4RI3QveAcaa/DLcMWyCE0rFpOYgs4ny+72gSfy
	Dq7GmC/1zW+Ljgxl3qMerhJUepJZ0Q3ENuvfMpPAhbjrttW9JydZM1Z5qi3dAb+9p3Cse51tWUFSQ
	B8tzHkLkV5w9Hr6FrJpypuyS6wRctF9RBVzoztHzlfWLXchAsgKoXYzSJVjSVcT9g5RpteFaj1nqR
	45WXgq5/Ej6I7ersFaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrW-00000001vzt-34r9;
	Tue, 11 Feb 2025 00:10:50 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS2-00000001VU3-3WDe
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:24 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43624b2d453so56923615e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223381; x=1739828181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laF+WRFcEPhbPigMR+biZf/NV/ZYQNs3dPPw81Y/wsw=;
        b=fxR36ZxboIrccYdUHCzM/3Ghs/BhSBfhxRDYbAMeitc9TtQI+B0T+NCMeq0RUFswML
         /7NSlF+JuZx8vqJwDdMyAr7q78GDnuhA6xGy8KWgKak0CRL3AZ6mrID9RnlVtMdMP9x5
         0dyXNZ6ZLgpC9zRni5cAwcgopdk4aEkZCoVsTCHqzU/LKITojOQ4s4a35MuV53Vwlp/V
         vOm5o1r8AoEY70jWNB8baHvn+B59kYNnC2iVONogmGr17OrVtXjpXkVwXjy1f+84F1bD
         aonmxHwqMhrF+tPwqgvx3PVhQ5K9bDPulrZe2B7Us1CmlZQhLN+DaZmnSzYDeFy+wMqU
         +L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223381; x=1739828181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laF+WRFcEPhbPigMR+biZf/NV/ZYQNs3dPPw81Y/wsw=;
        b=LPU6Nm0sidv6OhUWx2cS2U4JUj+YtapLZbLmdhg1na4fxiLZCqZIKBPAOhIRfkMWOG
         ACURCuHero9OZH/LQENBolIM9Oz1Y6a1w8MeBmyN14dhnjLdnIx3CbiLyzEy+xTp2LDS
         Sl81sEa6u1L7+glLDFXr6NS/p4Xp0oB8EjlI0+gZfVGnvmdibMj4np2V9nOp7IR7HUh4
         x2Q/3k4ci7Z+FvyDkHO/Rbzgeeo8GW52bddzbtIZ6mAvyOLaN9Fc7OH6ONw4jMwfmg6N
         J7li1tTzScf16uebKxOXbFG2flIqbQtL4/3DW0EHd7ndh+CT/0/WBN3Onaxgnqnh/G9x
         EwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0xdDX3b4pX7DRNEjxyR9i7CLwPnLtI1u0PrhyYpqyIJgIK7jvLqVBJUerK3XfnNI0M0poiamfZvo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhVYGoMUS0BuB8qtFAwX86DrN4hkvLcs3xr0NiwnJ2recqWUzp
	AJhD1AjTPLrk/EjJsLY8i/7oAGbm6k+70J5dkw1/LwjTms+SA6Z6m9ukdl+UCVE=
X-Gm-Gg: ASbGncuE+Bh57juzvptxSDuHnqmz+3kUdWM7OZ1Ynv1iElrkuHTNKo/5BrcIRjc7lHM
	tT6/hz55iMxg06OVlWGM8rc4CFQQxdd6okhemVS+JYHFXMpfA4X8M8/3HWTqkEw/6mynOjdohlq
	MvQXXybzZ4a5GkPzy9Yikzo7MmKOWFAR/IPbszhRCc5+zrLr4/ddP26gfNKkrZZQU9hwh8foR+j
	XGG2hrbVgXbV//cLWE8D6RLjK5cMHCJLzR+QERzcoXIR3zjym9rloG03UpLI2STn9xvtv1sflwb
	bCTCjeuqJ1Md/Sn8
X-Google-Smtp-Source: AGHT+IFgS/HX5A+kH5PAPBrkqn8fBWMnZmlOER5QhwFIE+HweZ3IE1yWLyw44chbTe5o+iil3uYEhQ==
X-Received: by 2002:a05:600c:1c07:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4392497d041mr163575835e9.5.1739223380954;
        Mon, 10 Feb 2025 13:36:20 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:20 -0800 (PST)
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
Subject: [PATCH v2 13/15] RISC-V: KVM: add SBI extension reset callback
Date: Mon, 10 Feb 2025 22:35:46 +0100
Message-ID: <20250210213549.1867704-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133622_887997_03DEC915 
X-CRM114-Status: GOOD (  17.82  )
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

Q3VycmVudGx5LCBvb25seSB0aGUgU1RBIGV4dGVuc2lvbiBuZWVkZWQgYSByZXNldCBmdW5jdGlv
biBidXQgdGhhdCdzCmdvaW5nIHRvIGJlIHRoZSBjYXNlIGZvciBGV0ZUIGFzIHdlbGwuIEFkZCBh
IHJlc2V0IGNhbGxiYWNrIHRoYXQgY2FuIGJlCmltcGxlbWVudGVkIGJ5IFNCSSBleHRlbnNpb25z
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgfCAgMSAtCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAg
ICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfc3RhLmMgICAgICAgICB8ICAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRl
eCBjYzMzZTM1Y2Q2MjguLmJiOTNkMjk5NWVhMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aApAQCAtNDA5LDcgKzQwOSw2IEBAIHZvaWQgX19rdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogYm9vbCBrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7CiAKLXZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9IX18g
Ki8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCmluZGV4IGJjYjkwNzU3YjE0OS4u
Y2I2OGIzYTU3YzhmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKQEAgLTU3
LDYgKzU3LDcgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gewogCSAqLwogCWludCAo
KmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJdm9pZCAoKmRlaW5pdCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKKwl2b2lkICgqcmVzZXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9
OwogCiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9mb3J3YXJkKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7CkBAIC03OCw2ICs3OSw3IEBAIGJvb2wgcmlzY3ZfdmNw
dV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9ydW4gKnJ1bik7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCiAJCQkJICAgdW5zaWduZWQgbG9uZyAq
cmVnX3ZhbCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1LmMKaW5kZXggODc3YmNjODVjMDY3Li41NDI3NDdlMmM3ZjUgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTk0
LDcgKzk0LDcgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQogCXZjcHUtPmFyY2guaGZlbmNlX3RhaWwgPSAwOwogCW1lbXNldCh2Y3B1LT5h
cmNoLmhmZW5jZV9xdWV1ZSwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVlKSk7CiAK
LQlrdm1fcmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHZjcHUpOworCWt2bV9yaXNjdl92Y3B1X3Ni
aV9yZXNldCh2Y3B1KTsKIAogCS8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBob3RwbHVnIHVz
ZWNhc2UgKi8KIAlpZiAobG9hZGVkKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggNDRmNTUxMTQzNDk4Li5mODFm
MDZmODI2NTAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYwpAQCAtNTQwLDMgKzU0MCwyNyBAQCB2b2lkIGt2bV9yaXNj
dl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlleHQtPmRlaW5pdCh2
Y3B1KTsKIAl9CiB9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0g
JnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7CisJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0
ZW5zaW9uX2VudHJ5ICplbnRyeTsKKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lv
biAqZXh0OworCWludCBpZHgsIGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlf
ZXh0KTsgaSsrKSB7CisJCWVudHJ5ID0gJnNiaV9leHRbaV07CisJCWV4dCA9IGVudHJ5LT5leHRf
cHRyOworCQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKworCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0g
QVJSQVlfU0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykpCisJCQljb250aW51ZTsKKworCQlpZiAo
c2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSAhPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5B
QkxFRCB8fAorCQkgICAgIWV4dC0+cmVzZXQpCisJCQljb250aW51ZTsKKworCQlleHQtPnJlc2V0
KHZjcHUpOworCX0KK30KKwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwppbmRleCA1ZjM1NDI3MTE0YzEuLmNj
NmNiN2M4ZjBlNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKQEAgLTE2LDcgKzE2LDcgQEAKICNpbmNs
dWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KIAotdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3N0YXRpYyB2b2lk
IGt2bV9yaXNjdl92Y3B1X3NiaV9zdGFfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewog
CXZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7CiAJdmNwdS0+YXJjaC5zdGEubGFz
dF9zdGVhbCA9IDA7CkBAIC0xNTYsNiArMTU2LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3Ni
aV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3N0YSA9IHsKIAkuZXh0aWRfZW5kID0gU0JJX0VYVF9T
VEEsCiAJLmhhbmRsZXIgPSBrdm1fc2JpX2V4dF9zdGFfaGFuZGxlciwKIAkucHJvYmUgPSBrdm1f
c2JpX2V4dF9zdGFfcHJvYmUsCisJLnJlc2V0ID0ga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNl
dCwKIH07CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
