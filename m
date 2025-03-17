Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C85C28B28
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c3sHp42HdkrJHnFE4TJXOh+e6gIuiqKOc0sqZ9Vup4=; b=AQL5PFiQ6VKOnY
	zKsZDtnLSHHsz4y2QjCH3NdNowq8ks93lr056WwZXsTOf9QS8Qgjk2PfujiblVWDJ9lEiIMamf2r8
	eZUXUqNGSHj17wssLIpJNuY6FOnoLq6ZxTLyZfe+kcMYbl2qf6KkBjQ+lOitq9xQuyoKj2GqXORGN
	njt8sg5Z94rqB2JonrgeOVDSSNLtlv9M8rerQXvOTHnn0kCMhJvCjAmzvLWfE46K3kE3GvuKo9P87
	5Ze0V6iA08dr8BfzzHrQeg0Se4PSP7VHYuKsh8yCD+GtVHQ4+qKNtl7ipQc1jrv2ka+vZx12DaRF+
	FHat8SWmwTmbllJH/30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gF-000000028vj-1DWT;
	Mon, 17 Mar 2025 10:26:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zu-000000026yw-14kT
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso3575672f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206813; x=1742811613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=pzrovhtzfg+LKxHm0i7SSnDZGqSe9J08uuHAMB8GuyMhaTP1/e/QYS/nIJR7JkF4hH
         2rp/imgx8+48fv/+dmX0gVXcRAJKvp1iVmDUlafLK17j9lUFhf0djgFwMk1VB6TwcZ20
         gpEQUt85U0KUHC6yfrRu6eJWLGQuG9P7GvnlVxKo/TdN4jIPRMOuplTsYlUMsfd90hKA
         UrgWWn8bjlVGVAHsOxGZjKN0WAp3G5laXK93IU5JNW1djRVGeLr+rNK9W+Ta8oHvzqTg
         oCNZAPZ6Zd+cXAO4CKh20xXjBrMsqJlpRO4n+7r7iCVnFQVK9cVS9GSydY/gIeymlih7
         JFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206813; x=1742811613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=fMhhUmwKcD4LbJ6gEpgxr8lsNq98it5pmYKwXwLO9Xm3dVE9J1WviY6byZ8pYgugfq
         eiUpXXhv+8m/Y5uIqLxg0C5ggQkXnfWyrMGogVzm+RbHe4IbK3QaUJUB65RnKoogQNxg
         0KcG7zm+HCSfSgac4Yob1gxuhEXwFNj9+pMTzZxNarIKt+mr7A/nIXMDYsN9uM5/mHu5
         bxn9BNxcmvUdEma5L9pjCa/YfgoSKNsRLORsZzr9X6nusc2Fjo9Z9nEUSvqHimWoVgwO
         DlOdJ8865h4AE0K7UIh7FsE8C5sE570wBDBAMHKp5FeZIb0++cuabKceKXb8fcXwTXXS
         xocQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw1GF1MurfiSunwSNXUPpSo2SERtNbhcwISvBRWDdc96AmRY6h/tActq4NMMo8qNhoXUFDmEXiaUI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuwG9dWp7vwyva60aPi5ksabIjQ9wAAE/h3DUEtkg2gyCompb8
	owJOTphctLijTNfjU9PZPfi7uSy7J2lB8SWoP7csi+sZTliuTLIhK4++vLLrfN8=
X-Gm-Gg: ASbGnctpxjZySlwYeZ/ezlTUhXlPBc7L7W6Q/u+FXYUnKpD9IroXMh5DPxVPggXdEjX
	arnqqvsEtSvzhzR9Hd3vmSLnZ2x75q5gMi718vONHYg7F+qMHBWpB2coVZty57Kpd4zGKVbXHkS
	Nm9jyDcTonmCV43YhPDjJat7Q1/OhWICaL/aFd4OuPPw/dc609WN9GmZpnBIOTGwl+C/z09macc
	e9XBBvM0QPMLFDLp+I4cd3+qJpwgHLF30nkslYR3su2707j9e6UZInDbj122lK6QIv+Ombz1DoQ
	GhoUP5v3YgZRClxsMRIpjiuTT/6BR5tH1WcsuHkCiVF8wg==
X-Google-Smtp-Source: AGHT+IE1tnKk23bs7U1cBOzZ5UV8PPIvISwJJiu/cnj0iy9O6xIhdVEiKXt/ZRtS1QnYe/wW2RNarA==
X-Received: by 2002:a5d:64a1:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-3971cd573fbmr12375367f8f.6.1742206812782;
        Mon, 17 Mar 2025 03:20:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v10 3/8] riscv: Use asm-offsets to generate SBI_EXT_HSM values
Date: Mon, 17 Mar 2025 11:19:49 +0100
Message-ID: <20250317101956.526834-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317101956.526834-1-cleger@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032014_287477_BE4DFDC6 
X-CRM114-Status: GOOD (  13.08  )
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

UmVwbGFjZSBoYXJkY29kZWQgdmFsdWVzIHdpdGggZ2VuZXJhdGVkIG9uZXMgdXNpbmcgc2JpLWFz
bS1vZmZzZXQuIFRoaXMKYWxsb3dzIHRvIGRpcmVjdGx5IHVzZSBBU01fU0JJX0VYVF9IU00gYW5k
IEFTTV9TQklfRVhUX0hTTV9TVE9QIGluCmFzc2VtYmx5LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVz
IDxhbmRyZXcuam9uZXNAbGludXguZGV2PgotLS0KIHJpc2N2L01ha2VmaWxlICAgICAgICAgIHwg
IDIgKy0KIHJpc2N2L3NiaS1hc20uUyAgICAgICAgIHwgIDYgKysrKy0tCiByaXNjdi9zYmktYXNt
LW9mZnNldHMuYyB8IDExICsrKysrKysrKysrCiByaXNjdi8uZ2l0aWdub3JlICAgICAgICB8ICAx
ICsKIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IHJpc2N2Ly5naXRpZ25vcmUKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2
L01ha2VmaWxlCmluZGV4IGFlOWNmMDJhLi4wMmQyYWMzOSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFr
ZWZpbGUKKysrIGIvcmlzY3YvTWFrZWZpbGUKQEAgLTg3LDcgKzg3LDcgQEAgQ0ZMQUdTICs9IC1m
ZnJlZXN0YW5kaW5nCiBDRkxBR1MgKz0gLU8yCiBDRkxBR1MgKz0gLUkgJChTUkNESVIpL2xpYiAt
SSAkKFNSQ0RJUikvbGliL2xpYmZkdCAtSSBsaWIgLUkgJChTUkNESVIpL3Jpc2N2CiAKLWFzbS1v
ZmZzZXRzID0gbGliL3Jpc2N2L2FzbS1vZmZzZXRzLmgKK2FzbS1vZmZzZXRzID0gbGliL3Jpc2N2
L2FzbS1vZmZzZXRzLmggcmlzY3Yvc2JpLWFzbS1vZmZzZXRzLmgKIGluY2x1ZGUgJChTUkNESVIp
L3NjcmlwdHMvYXNtLW9mZnNldHMubWFrCiAKIC5QUkVDSU9VUzogJS5hdXgubwpkaWZmIC0tZ2l0
IGEvcmlzY3Yvc2JpLWFzbS5TIGIvcmlzY3Yvc2JpLWFzbS5TCmluZGV4IGY0MTg1NDk2Li41MWY0
NmVmZCAxMDA2NDQKLS0tIGEvcmlzY3Yvc2JpLWFzbS5TCisrKyBiL3Jpc2N2L3NiaS1hc20uUwpA
QCAtNiw2ICs2LDggQEAKICAqLwogI2luY2x1ZGUgPGFzbS9hc20uaD4KICNpbmNsdWRlIDxhc20v
Y3NyLmg+CisjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+CisjaW5jbHVkZSA8Z2VuZXJhdGVk
L3NiaS1hc20tb2Zmc2V0cy5oPgogCiAjaW5jbHVkZSAic2JpLXRlc3RzLmgiCiAKQEAgLTU3LDgg
KzU5LDggQEAgc2JpX2hzbV9jaGVjazoKIDc6CWxiCXQwLCAwKHQxKQogCXBhdXNlCiAJYmVxegl0
MCwgN2IKLQlsaQlhNywgMHg0ODUzNGQJLyogU0JJX0VYVF9IU00gKi8KLQlsaQlhNiwgMQkJLyog
U0JJX0VYVF9IU01fSEFSVF9TVE9QICovCisJbGkJYTcsIEFTTV9TQklfRVhUX0hTTQorCWxpCWE2
LCBBU01fU0JJX0VYVF9IU01fSEFSVF9TVE9QCiAJZWNhbGwKIDg6CXBhdXNlCiAJagk4YgpkaWZm
IC0tZ2l0IGEvcmlzY3Yvc2JpLWFzbS1vZmZzZXRzLmMgYi9yaXNjdi9zYmktYXNtLW9mZnNldHMu
YwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uYmQzN2I2YTIKLS0tIC9kZXYv
bnVsbAorKysgYi9yaXNjdi9zYmktYXNtLW9mZnNldHMuYwpAQCAtMCwwICsxLDExIEBACisvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisjaW5jbHVkZSA8a2J1aWxkLmg+
CisjaW5jbHVkZSA8YXNtL3NiaS5oPgorCitpbnQgbWFpbih2b2lkKQoreworCURFRklORShBU01f
U0JJX0VYVF9IU00sIFNCSV9FWFRfSFNNKTsKKwlERUZJTkUoQVNNX1NCSV9FWFRfSFNNX0hBUlRf
U1RPUCwgU0JJX0VYVF9IU01fSEFSVF9TVE9QKTsKKworCXJldHVybiAwOworfQpkaWZmIC0tZ2l0
IGEvcmlzY3YvLmdpdGlnbm9yZSBiL3Jpc2N2Ly5naXRpZ25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAuLjBhOGM1YTM2Ci0tLSAvZGV2L251bGwKKysrIGIvcmlzY3YvLmdp
dGlnbm9yZQpAQCAtMCwwICsxIEBACisvKi1hc20tb2Zmc2V0cy5baHNdCi0tIAoyLjQ3LjIKCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
