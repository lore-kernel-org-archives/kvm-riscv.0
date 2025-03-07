Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B8DC28B26
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c3sHp42HdkrJHnFE4TJXOh+e6gIuiqKOc0sqZ9Vup4=; b=CNlaqT+JV02qn/
	WQOuLnRwaqN2VFLCfKWALbbBr9eiZUVJb/lcBSWCFB0yAXWINV+qQGDEfrGx+mMYK+pQmaC5n9JDx
	D1faLYouBTjMQ9vhtINLOf+IqgBNycVc+5detKRg5NOB8Cqo0qDrbcktrxK6Y+q99eyf++zHIqUZ+
	zUwPj+ZqgjXLRkPs0klO+fB9X85Jm64w9v6WQZMiPjo640GaYtzJTad/DT/YYme77APxWrTwSUhRH
	ajGGrJdQ0qqc51iPukZ3lWFtXuVRlbhFj9vwJ7DnWZpjdfdyWIMYugbvx2WYr6CsJwG+9QmLD5oNf
	pRgPpwhzbi51eFmeE1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaNI-0000000ErJ1-2VIm;
	Fri, 07 Mar 2025 16:16:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaMe-0000000Er3U-20hE
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 16:15:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-391342fc148so575597f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 08:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741364155; x=1741968955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=NReVL0cHYwmfNoyAj/hItd3hHxQYQPY1Qx1L1k+1vyszGptnn+gT2jNbeO3xMPbOgn
         E/9bBaKwQpq9OS8Fank7BNT8KZnwNFgYov3Vk4RWPCSziBh5p+489tAAWBlT9oYHCydU
         AsyMOba5dd2rwb+nR8im6YIixur+Qq+qIi7DP+BThAX7Nj8SALL0oaTDnXS2EL3dEK81
         eajwkGeaoU9owq24Eh85b7v8WwttJ65h+2QrV6+zxoYr0njqjG843mqeCPcuA/ipx9FG
         Fa8JcWiSB4BO1YWoV5PBSNfRukAaOPYRavi0b2XbeuyW3klAjC2A11fIA5mWshOIO1np
         vUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364155; x=1741968955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=TpJhO2clWsUXx44BRamW0QRcbpfRIjhcHvhhUOOskMlyQz/puzbjgjjZR6ss/g8C1P
         nzE7N1kZ+LJgI1tM6HjD8EIISKwlxU54VOpHNEdBBHNsr+5JE5yARUT3cCAnQhtEielK
         CZSW3t8bjJbFu/DL6kMfbsRZIUhzDSnMUzAAM+Sr7GnO63nJN9jUvY6eBRkgp1Fx8FmX
         A58iPG7Ea1vikIagOjZN+PNXq1uQA9z61jjSpc6Yt1ENRTX6YCUoslL/0nc3a0jbkc6D
         qpxFqO1Uf0xrXbAnxnQFRJ5bs+ASBwzrMoXZj6X8Tiy3hHvGnmna/5jvA9wd7bzol5Df
         lLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI44L557rw9IhIr+D9D8eLHmQTWYSVS68USn3l+vSOSnQTr17553BGgFN1KRc7kL84TrBVCdwa8ho=@lists.infradead.org
X-Gm-Message-State: AOJu0YybDiNmePYbl0v0BviKQOFg9ETwADBt4INqKl6V/r/8PYSdvzDC
	ZFtErCHyBeb1P+Hv8sAhb1rr+i5lR/tPPakq4Orr1HX0myWG50C0Q1dasKfDIivF101hMKPgG+H
	l
X-Gm-Gg: ASbGncvCnWnOui33Odkqbrkmi/Yp2kCcBjpLWWm5BGRUGwqdS4JjhWUkTzSVTExK+ep
	4YgFdFp0WMi2/vAcb7JII35BVezB0HKidkOLmA9UAA4z9oF8SXt/urjcXwWFGkBuFKlVZErDZUz
	csMOT9EeqQQzeA7Fpc0d+rq6vkr5Q1jRSANNb9JO88X2U0llMqkNINqgcJmPJcwSdX29IyoVjha
	bkvu2rKSK1d5myKpYUJRQH9Sn4sf1EOtgFj5fEcEpfCn4GZ10x55x6wrUo9ctxFt0VGCPcS39De
	c45H6jqE9mm+pTI8L9tQw4YFt5dojMFYnPP7bA+Jw2nUYg==
X-Google-Smtp-Source: AGHT+IHcCwpTjyAXPFIzNs53K4MT0tBUVdvPSgrXuPHtlFQbJxcUjhD9AItXnHJoW1cpUE6dZm8oGQ==
X-Received: by 2002:a05:6000:178d:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-39132dd6b75mr2305650f8f.42.1741364154679;
        Fri, 07 Mar 2025 08:15:54 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8daadbsm55496245e9.21.2025.03.07.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:15:54 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v8 3/6] riscv: Use asm-offsets to generate SBI_EXT_HSM values
Date: Fri,  7 Mar 2025 17:15:45 +0100
Message-ID: <20250307161549.1873770-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307161549.1873770-1-cleger@rivosinc.com>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081556_522245_9471A95B 
X-CRM114-Status: GOOD (  13.62  )
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
