Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA8C28B2E
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjceFRzyq4043WEcwNEZVHenHLzzUW5y+7KlGgsCT4A=; b=GQ9aVX8ha728ad
	zaJvLPoeXUObECeLznIel/FF7x2tvUgtC6bk71HHwMa7lIgmsiBQHyVplmHlktgi1duNkHVxEQ+oy
	896QT4ixCq6tOxhqtFsVHlhHoUqF9EWXJ0/1jMh3e6pofhKpN8lYtFa/eFDRrs1n76nACHn5oBLcS
	SbOsNb1hi8hxLojYN1pTzGZr7PGN/IcOCGPoihhjYnf9QOMYaIenemCp0G0Li/LTbRES/tbUcy+tX
	m345TzRpJmGHn9aoDac4SdMaUF32mz/85Bs1yeNIMU/64h+748X+R7OvJefQAVBEAByMtdiHyLs4a
	Otiu1mNLua00hgeQArZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGs-00000003WvU-0PtJ;
	Mon, 10 Mar 2025 17:50:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treqb-000000038Mx-0s1f
	for kvm-riscv@bombadil.infradead.org;
	Mon, 10 Mar 2025 15:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OfJ3/5A+8eTTKYRN2eD83evjq8eHQRgBJnaNQ4fOKIc=; b=BAq2HZKEJ7W3vzC17kMRUNLaw3
	FrklBQm0Xo7ZikqDcE04xXuuG4eNUEL1sMGCxH6nR6trnIsL6lIwV+LmvJOJxQ53bKO/g+PmITyth
	7ZFYXJsrLTdC+5tapqUWUOA3iR25cT7ZgbBI6isjJVsgpAS79QpUUn2XKW6pQFhvPm3zFpHw/whQg
	5mjQxQTFsluY5FXXkbfwMuSUiDNnAQIybmmcZAJibCZTOKiNKj6OKbdBCTHU93SJ8fYo/pbKejoi3
	sNldHJQv9mW0Zw9pcvFMaGEf15lQLOF48Mn9zk7xEZlFF5lXokubK8sAmggm8elA+9fK8AydH8juO
	kxZBbErw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treqY-00000001sqb-1GKq
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:15:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22438c356c8so47871575ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619712; x=1742224512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfJ3/5A+8eTTKYRN2eD83evjq8eHQRgBJnaNQ4fOKIc=;
        b=RaGZcgSuyZaRNK4dg61HdT9HjX4hr6meHTJ+jGQExnA8MoqybDS3qmzSZ9bjMWRydP
         dzsU9/9+xdi5pmJnkQWEP2hEIXjE1WLeMnpvNHsnd9/aXvVls74A3IioZyxnc9fWF+8u
         yYUYYAYhJ4xlqASg+4tgPSuhaOdvg7gNQUYZjk16yVEYGodkPCgJ+uhdBNhLlSfsnMfr
         5+B8ZGDBUZcWekg2I5qHpv/8aJrnF2enrFNnwira7tIrs2F1rCHi1bQls+0KXur/7lnR
         6U29yCFvnfHGZQXRO49X+XnrlA0NAuk1bsTg2ZO40TMSSa13axjbbsX6AjxmJ3Zyza3d
         luew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619712; x=1742224512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfJ3/5A+8eTTKYRN2eD83evjq8eHQRgBJnaNQ4fOKIc=;
        b=YbVHkRxytUTllIuzHSILecvjLezFQFBil943gKzdRTXJz95LD8gIQ2j7eQeS+1zjD/
         YBeAT98XcmbNq9Oh55JiCbd9xL0k4omFW0jHAswakfy5oWAAX+iQiAKI2m3Fed9bWhLz
         +LrXVIx7gGrK/LQftXECOU59HznQd6B9QUkYiCYPqIERQOOgg+AMDM8Nc6UAQqkXH1H/
         OChcDh8LnrIF+RsokXbJR0dIYbCcXnbdkpbgXfYsII75PV6+mw+RKoGc21WIwIrytQII
         y40g3qGCqXfEv6zvSHLAa0dobwJqXcrnVCAJxDibRD0Ee0IjqOLwq0CB1B0G+glJwyC4
         spTg==
X-Forwarded-Encrypted: i=1; AJvYcCUzCi/FjlnelarkllkCMS7uHwDDNHC+iNbdMGRT7dv2DTgqWjgSLI2ufemBLOCngpho6d9o59rlBIY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEKbv0CSbM1jWazQHy7e0WtFKyuEt6n6fVP6eExsK1/l0yaQ1d
	ibhZFrJB2XYfZ3mf+bKxVZ3Jw5kcYSfZ594mf4VEAoBOzwRSNVkX4y3nsu9yn9Q=
X-Gm-Gg: ASbGnctBcEccuMqfVst3VfFHT+j9KRBYgWhHRxeiwEv+wdh+KxzOulRc8n/GSYzWfHs
	ZRVZyR87Q2n4qdJyp123Q5E8bzAKi8fl7A6gAhD9do0/zaPM2WMq7/4tbKKzFnf+vg5Lz53C41J
	iAVuIed4GV9Sv6a3hFGVhI54mZf7Li10q4uWARUdHWOwyDpC6Mze1xl5nnL0sGVYh0KG0HHLaOY
	xrCNL8vxBoFhNw42b/O4Z9HGyiRMZaCqvZMO228gHzw60Yn3KdKqNkUvP5wRSw6GbjKf3Uzbp+q
	RxjbHCU2Qf82EPmR3ZQh7xVLBmAPWl5ZsoXjfQoCMbnP0A==
X-Google-Smtp-Source: AGHT+IFwcAES82fPdZN2juakD/f3DtxEXqN8fLDByuuUWFv0PrmjGf+tQ1Z8z/EN2hDCjCyy0IsnJg==
X-Received: by 2002:a17:903:2b0f:b0:21f:8453:7484 with SMTP id d9443c01a7336-22428a9d15dmr204592905ad.30.1741619710747;
        Mon, 10 Mar 2025 08:15:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:15:10 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v3 17/17] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Mon, 10 Mar 2025 16:12:24 +0100
Message-ID: <20250310151229.2365992-18-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_151514_427625_55915C28 
X-CRM114-Status: GOOD (  13.24  )
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
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgfCAgMyAr
KysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDM5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpp
bmRleCA1NDI3NDdlMmM3ZjUuLmQ5OGUzNzk5NDVjMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtNjQ2LDYgKzY0Niw3IEBA
IHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXZvaWQg
Km5zaDsKIAlzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7
CisJc3RydWN0IGt2bV92Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwogCiAJdmNw
dS0+Y3B1ID0gLTE7CiAKQEAgLTY3MSw2ICs2NzIsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJY3NyLT52c3R2YWwgPSBuYWNsX2Nzcl9yZWFkKG5z
aCwgQ1NSX1ZTVFZBTCk7CiAJCWNzci0+aHZpcCA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSFZJ
UCk7CiAJCWNzci0+dnNhdHAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKKwkJY2Zn
LT5oZWRlbGVnID0gbmFjbF9jc3JfcmVhZChuc2gsIENTUl9IRURFTEVHKTsKIAl9IGVsc2Ugewog
CQljc3ItPnZzc3RhdHVzID0gY3NyX3JlYWQoQ1NSX1ZTU1RBVFVTKTsKIAkJY3NyLT52c2llID0g
Y3NyX3JlYWQoQ1NSX1ZTSUUpOwpAQCAtNjgxLDYgKzY4Myw3IEBAIHZvaWQga3ZtX2FyY2hfdmNw
dV9wdXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQljc3ItPnZzdHZhbCA9IGNzcl9yZWFkKENT
Ul9WU1RWQUwpOwogCQljc3ItPmh2aXAgPSBjc3JfcmVhZChDU1JfSFZJUCk7CiAJCWNzci0+dnNh
dHAgPSBjc3JfcmVhZChDU1JfVlNBVFApOworCQljZmctPmhlZGVsZWcgPSBjc3JfcmVhZChDU1Jf
SEVERUxFRyk7CiAJfQogfQogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKaW5kZXggY2NlMWU0MWQ1NDkw
Li43NTZmZGExY2YyZTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQu
YworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKQEAgLTE0LDYgKzE0LDggQEAK
ICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+CiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3Ni
aV9md2Z0Lmg+CiAKKyNkZWZpbmUgTUlTX0RFTEVHIChCSVRfVUxMKEVYQ19MT0FEX01JU0FMSUdO
RUQpIHwgQklUX1VMTChFWENfU1RPUkVfTUlTQUxJR05FRCkpCisKIHN0cnVjdCBrdm1fc2JpX2Z3
ZnRfZmVhdHVyZSB7CiAJLyoqCiAJICogQGlkOiBGZWF0dXJlIElECkBAIC02NCw3ICs2Niw0NCBA
QCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9m
ZWF0dXJlX3QgZmVhdHVyZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK3N0YXRpYyBib29sIGt2bV9z
YmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKK3sKKwlpZiAoIW1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKCkpCisJCXJldHVy
biBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgaW50IGt2bV9zYmlfZndmdF9z
ZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkJc3Ry
dWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCisJCQkJCXVuc2lnbmVkIGxvbmcgdmFsdWUp
Cit7CisJaWYgKHZhbHVlID09IDEpCisJCWNzcl9zZXQoQ1NSX0hFREVMRUcsIE1JU19ERUxFRyk7
CisJZWxzZSBpZiAodmFsdWUgPT0gMCkKKwkJY3NyX2NsZWFyKENTUl9IRURFTEVHLCBNSVNfREVM
RUcpOworCWVsc2UKKwkJcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKKworCXJldHVybiBT
QklfU1VDQ0VTUzsKK30KKworc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRf
ZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3
ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25lZCBsb25nICp2YWx1ZSkKK3sKKwkqdmFsdWUg
PSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlTX0RFTEVHKSAhPSAwOworCisJcmV0dXJuIFNC
SV9TVUNDRVNTOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJl
IGZlYXR1cmVzW10gPSB7CisJeworCQkuaWQgPSBTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxF
RywKKwkJLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3Vw
cG9ydGVkLAorCQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24s
CisJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKKwl9LAog
fTsKIAogc3RhdGljIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICoKLS0gCjIuNDcuMgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
