Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EFAC28B2F
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c3sHp42HdkrJHnFE4TJXOh+e6gIuiqKOc0sqZ9Vup4=; b=4xztHN0gl9lQrA
	rLyvw6rJ07ZtczhLRsUKZddaXxe2UkPSyQnHOEWwpvMGQxSXx2jEHZ2NxjlYi1ULvwjLnCnReswk2
	gYRkP4IeaQBAtE0X/+sIQ0/qGYZ3EKyjFXJ9R54uX5R18RBPd4Iq4y55EOqNLkUmThLDTaaMwR+xB
	AlOyn3bMmH5vfq2IQwzQe+x1C4NqMZH1Hh2/ic0j1VzSOpSXo6gpkzTHTpXZvaJTjRd8+eNHoAjYk
	qkGfYBXrLoZ7v9iXr36BhBl+to9QgSjNySQAU2hfZoYFUJ234Vo9mep7QAdctk5kCrvCuk1XOI7if
	nmXQZASaz3cfIU/a1YfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2xs-0000000DxxW-0aAH;
	Fri, 14 Mar 2025 11:12:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2w5-0000000DxTv-120X
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:10:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso18229685e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741950640; x=1742555440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=RCq2jO5zY+/x3z8p+7JTQUSGfpdcao6GW6GQ+DJY6QG6HUlk1jC4Xelcum40HSJenr
         nNwfrmxYfDhPvL8DT6ejGqMYsgCjRbZdnoMQhbzLmwmNBv9rOWNpiWhUCCV3WsvVfImY
         kiWzNNpjgYW8GgMPuSBSTOg61t2TEgMZmX/fOcrp57fwMsg8Wlq2Sd2Ys3UUEfYHVew+
         Jd9QK5hQsa7H6LRo71B1wyHV9dbSwhXaBA1s1cIecqDnyP+YPzvnaw2aeFS97tmwA3C2
         wmH0qg7Myw9p9wKaYecjgXK3P4ZgcSYcpmor8KHX8O/MMpD3ezPjc3PQ/OR8f/6u1IJ2
         JDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950640; x=1742555440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=aGcbjLit6ZrEGJn8+Sp3UG8ZjbpOJUKg7mzFSX+grx7u46UYBcEb67SQIyEpTveSzk
         EmQ36UJJTZ9n5vq1b7bKAG6w/yn1eactBb1duaQn8uCh6QdAZv5kxRoniuqXs/yL3ENd
         CGL7DZAia0xroZwKq9VRxAR6BYc44uJOOBBhMVvQXSI3Fxc0CoJ8+yAnEPrpAUo/ZeCF
         u0sZGWs1jLV/0eCoqPiHpXElxPHvFiLRTgq20PusfyJQUtlHyueY2SNrtwJ2RnbGHZQ3
         jdPGBkgti84gbKnHKcKUZ1575uiiAddW8Nid1e0+DR9xYrmqULzvvLYiFmBZL4p9pKWn
         5D5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVn2LIaluYgEljrdlcwxvRa/7OX5c3Y1maRIvGJMb6ZZhHrwLq7irFEmoMK7ASgJqYbKw8WcrhrBvI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJnBo82dFMbXOs9B9PrgbV2rs25CQsFcfGY2TLCor0kAk+ixtz
	dro8tZexEXMqrbT6C62wxSHsplzwba3WcbjOJRm74Jm4asax/BEHU5WX0bhuOGs=
X-Gm-Gg: ASbGncsFxj+IX02LeGvFK8iHu+JZ74NZ3HX/BmfM+4jpRL0v2PPkUBV9bRre9+o6zN3
	WytTX9D8D3/yBg95L4475rM8Lyk55Y8ka8vUFoxZtpDPkapbVrCAp7k9v6hiwbCcV5PxafCAv0h
	7/FO82bxCcqOn0YutcBpGNWdq5LKl8qACK6mJzM5GFufW6E/MOp44TJrRzcC0Kt6luDw02eLyBC
	y3mPmgwt78ueLmuI1Q1NVCvs+3wbfviT7zboCiDjtCM3AHOaXpj8z4EN7jeu93jy4eYMCuvLQzV
	iXa57egHOSJ2LLC/E0SrTM6AVdd1EETUuiJuwU0Yu4GxmTIM407yLhHh
X-Google-Smtp-Source: AGHT+IFLRqD0+GtRah5fmDfiMyZW0TGXXj+pDnCO6vfFUhQoxNlSBVgzIrjuEjHFwzUxpLoxa2qikA==
X-Received: by 2002:a05:6000:1acc:b0:390:f987:26a1 with SMTP id ffacd0b85a97d-3971dbe7ea7mr2951045f8f.29.1741950639774;
        Fri, 14 Mar 2025 04:10:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb3188e8sm5299203f8f.65.2025.03.14.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:10:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v9 3/6] riscv: Use asm-offsets to generate SBI_EXT_HSM values
Date: Fri, 14 Mar 2025 12:10:26 +0100
Message-ID: <20250314111030.3728671-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314111030.3728671-1-cleger@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041041_283523_3E7243FC 
X-CRM114-Status: GOOD (  13.11  )
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
