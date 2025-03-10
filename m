Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B7DC282DE
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZ2w6vxwV6PkAqXzP+hp7DU5IO8oTPdN/QNR4LdG/Ig=; b=1LnkDAVyuNzuQA
	t1edp+c6XxWezFyZEKS/TTTQtVdMezItlrCgiwV6a4etKgfSOF5Tc4cKmNvm6AWPOK83ZMyLF8GOW
	v6BFMwiL9iQsi5VFxDt56SkH3+CJLUVdrv5ZKUxNrjd46I5IcnX8Zq83mIkYcpoZ8g6lwwu1Es9Qc
	KSlVszxnSwdE7wJ4HIsP9LHtBzXbyMv+1rl6wLSSd1AFhzJt52Q72lqS86RiDHno3ab/9bllC7tB0
	lizUrUJPagelY4kaezO31FeQm8d7jk3CiT6L+/VD2XSeWQ2NRMo2+b1T8PHZQYh7IpMGx81a/EWZG
	6I8tvFgVk1zvs5XuHJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfMA-00000003GMl-1ZQr;
	Mon, 10 Mar 2025 15:47:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treqD-000000038BT-420g
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224100e9a5cso80811815ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619693; x=1742224493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l++jogwQbkZh7dICu4CyxiXIZKEwQKPb1/RHWWp03A=;
        b=gcC4aScSF1JWDAyz5OEIQPHq5k9LxwhokxZ5+GtzSkBF//n7EjmgSjU8XFmz7NsmKw
         EENWnkSxErFvYex1LvBvUyoICBapqaV99e/tm8iOmtrSnzH6bDsK3Vrkb4jwlFgjT9Yw
         8iHXrwyO8F5RHQstUo8OHcz6MbAixPl8W0u3859zAJaL8tblfhH8EN0nqGDgU0h6Zl8P
         3huhXYJVv3+7mdZ/FCCe/OWUpW8oSv+1l9sbEmB80YfuV2yJqsH1cfhnlWf5LeI9wqoU
         7rOH0OP9hQKB4IMScsydhI36JNVr/SFqWvfiLI9dbe4m+D3Qt/gSsEHTfE8FI0V27SBx
         5nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619693; x=1742224493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l++jogwQbkZh7dICu4CyxiXIZKEwQKPb1/RHWWp03A=;
        b=hq/JCzSAbAgiWAkMSrRgfH3yLAgsbE0B1vB9kRWLCsHwuHdfZukBC83SvOCXvORgRX
         iueWcpR2CuhbotlEdPyTUbJKVLyOFI1tzOxnG1KvvPoknUhol9KcdZk9KMLUU7yBw3xv
         3fxPuZlaWYRjylobkqMwKxIbJU7zX6O6BkiUP7ZMqMeKiJ/9rpSagwT94KQpxM62CsyQ
         g4GgSfihDOCly5TRPt5P5rXGsMtUP8bpkIeWIEN8u1wj2PydKYflI2gbqo1XjWiYG3Tn
         hGEt655hVx6UIXYXeBM5xKcOEaakOKIhAb8mX0w5usbwjiRO4OAkMzPUemdBFVnQRZvy
         whEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDwsiuAofKRa4+U6K06f6p3IHioHAjSGDXK6ps/z/I0LW2b7WxIF8nYgHgx08NT4+qCc0j+7MoS3g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJTcs3Lb0OXYqH6xpZR3TVGnu55gc+OdUBl6uefyes1vLV2n7D
	ZNnyTRiEaABMya+p8cjLgKv79RdSWEkz2LLMhwi0as5vVkpe/y7qoy/9+Jos1lo=
X-Gm-Gg: ASbGncts/HkeMDozBxLqV6sN811Z6mR+vZpFkrj68PhR6Xt4DWoPYM1GHjHkmNymsNY
	iJmzfZdouZJRjYNPGLvxvk6eQUWcwQwokXh799r/eGQK6wcOrNRlGCTm+oZ5MWstgV+oE7RRn1V
	hoVNxtPoLECwEIQuH4hh3spk03DAoGsRfb3jbb5tdzw/BDMbC3AoU2NCB/IJsYh5ZW3SfAaGVVe
	uA4AawozTNf9/Qcv5viWb5PsxyWrJl21FyES/GcUTM23wDAv6cuDJFzzs0Yh+D2YNLXJlP+mbfh
	EFx1MKFms/OO7Y/Jbw7RGZ4vvIyhRECYVRnM6EBl/JTLawoZIQD/cwZg
X-Google-Smtp-Source: AGHT+IGtMqipPUgghWjpfZ6ZkTy1ft1+oxAHrUN4YZ5GS8RdVCB2lFCZnqkm3CMl7QqHMx+cAywiQQ==
X-Received: by 2002:a17:902:f648:b0:220:d601:a704 with SMTP id d9443c01a7336-22428a967a4mr207702705ad.18.1741619693398;
        Mon, 10 Mar 2025 08:14:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:52 -0700 (PDT)
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
Subject: [PATCH v3 15/17] RISC-V: KVM: add SBI extension reset callback
Date: Mon, 10 Mar 2025 16:12:22 +0100
Message-ID: <20250310151229.2365992-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081453_992674_D8F2973A 
X-CRM114-Status: GOOD (  17.93  )
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
YmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggODU4ZGRlZmQ3ZTdmLi4xODcy
NjA5NmVmNDQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYwpAQCAtNTM5LDMgKzUzOSwyNyBAQCB2b2lkIGt2bV9yaXNj
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
