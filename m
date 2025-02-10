Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65425C021B2
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EphbibLLwD3HYCn3QST3MMuZOZIOeLIqbfQ9d2oTQ1E=; b=ADZabtbojwc5xi
	TXQT4N3hBwSUAppk9QQnQUrz7wyflkyZOiq8fjHO7h5NIZv81/KGqmZfPMzfuHAAfR1CHiOYDAEpE
	HqEG4be1xB9p0Mdnn5EDrPZspnPeN4xgDpdJ39QYzn6J1Ws/8h3T/JQgmYhqYRALsHr11puPYLTfJ
	BxTntTOR9rL1LNSzYtrswLHbuitraaBSC5jua8h3GZHUWZA2xs/UXqcJZf3Kv0W0vdc/SEx3SlAKA
	JeiINzTD+P8rQN0hCJXkPoxRfITtLMvNfuiCUheFQo6nZaM89FJugqbAZlsEXKECxP7V2qOo2XvWa
	MohyluudY0Cs9/4sUn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcgv-00000001kdm-3BnT;
	Mon, 10 Feb 2025 22:55:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS9-00000001VWn-2nPe
	for kvm-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=; b=MIbNfhhRJCsTLJwUNRhcDizpR/
	riP+0361caaSrdEGuRaOYPJnHoSOR+ptEzVuaQsPGROn/ZjspD+eBpOMTKX07qM9e6xUxN2z1MpjN
	PkZu00Bn97PVFmZHuLq0KcxcsOfZOHZ9wJTS6tEbw6qXS0TNajh07GqkilSTUBZS5qC8NHsJJkdSL
	MEx9uGxATnerjCRQ2jk6q2hTZTR/Xm2mpiRX0WwYIxiuDId3UXtG4sDCLoFdSPVzDrVC11RqChRMJ
	TKLrOQdu9hUSwjquJ46+3XzB4MNf6s6X4CJN+j4wwhB0YeawdJhLZ0GcDQ1ew6D+dQsCfn7EUN5Ye
	6MPMwzcw==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS0-00000000IAn-1csD
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2137538f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223377; x=1739828177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=t7q+s4vx1KmOCHWUvc+fsjebneFvruK1UrdYDdjxz9mdK+PhERmW3env7/vv074wo8
         u9WZY+cA0Tx1+8npCtaQDaEqxp63qfwgJ/p3yXcT3akAbUGtLzFzLhC/1iTzu1RuNr22
         eK6Ghkj+rssSsC+YhimZy2oRju2dhmdhBLs7EegWJgI7vkEPlYubZphm0WuJKkcgcvxi
         rB1HpU9dbmuowAZhdGErA3eoKJGgcw6DqsXRzYQ66ChPOYWaXHNrSEcIalpYxCs0BSDR
         bflvsgo71BlkTqGPWK4ctrTOKouK+vchRG/1M+rZxTa7CbXzga4WzX1+rXRwduqJRfzi
         FsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223377; x=1739828177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=OZHL6wX01KfetY6sLGG5kFrfZsA/ZPC3xUwGxNotDq6zWuc/W4y0U4/rnvigwzOBe/
         9T5R4vXNYfE4KezysJsThPS+wRX51eghxZ2Ii27ohS65susbUAqIMx8E/dFzccWZrs2q
         paaJHTKiapK+Ca1owosluwwkvYmgRbbdM3dzwASH605X628H8Qwj0LnmghzkdymTEFxt
         hj7IH1C9vJsdhLn1cS36Kk6o2EX3U8xvRHWiwmz2X5kZCQpMyG2ro4Ro8cZCu4CcDqEN
         tY0kN0Brc6m916adxSpElinSbPvmVIh5Qig2pXxaxNPn27HJw90xkDk9GQNdMo92G7gf
         eGRA==
X-Forwarded-Encrypted: i=1; AJvYcCUzIoVkNteAUGuXrJYeCat4jhtZvoJCmGFWkJVVK0fVH5QoqheeVCXP2f3Oc2UEkkL511fsl7kvt08=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHRtIdQGRUTtLldtQ3vYa4LQBiMQyUKG4caitPYYY6NGOdLXSj
	tadTOrzuBxG9QwdpYofFX0myX5sfyRX0GbghTJqm9CX/1xgDVImvq7hMQX4eGGI=
X-Gm-Gg: ASbGnctK2fSZEko+Nu88GcPqwoXYYVMwa1FHqxTOt48gT5gmbvZe4zcK5fTmGSvMUrr
	jSXw0BYEFoDOXov3BwUTjbL5S5qQkhMuXSpkhn+Kb2zkkPMerjCDb4JwOw9+hVNw+1acxddgBv7
	YZWYaZQgTmRexwCR6n/jeczGgF5DqpqgUjIMfzieCnb1npVNS6NCOR1mmkaCgFflnSqGq55J7Vc
	39KbND5ihsJuWUXIBsu7AU7LphlDbXIkDt88kbXlkuCWhaMup4DAls/HbfjaEWf/pXgCibpYbGI
	1fnwity/A68zxaZH
X-Google-Smtp-Source: AGHT+IHl9RCIMbw69DzrfNCBQKqxgwJyioxKnKZwfd1pCQSELzIBzuIUeEudhJAZ8urQjlYc1+XZZg==
X-Received: by 2002:a5d:64c4:0:b0:38d:c0c0:b3da with SMTP id ffacd0b85a97d-38de438e603mr681026f8f.2.1739223376894;
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:16 -0800 (PST)
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
Subject: [PATCH v2 10/15] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Feb 2025 22:35:43 +0100
Message-ID: <20250210213549.1867704-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213622_534587_1B99BD41 
X-CRM114-Status: GOOD (  10.67  )
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

cmlzY3Ygc3VwcG9ydHMgdGhlICJ1bmFsaWduZWQtdHJhcCIgc3lzY3RsIHZhcmlhYmxlLCBhZGQg
aXQgdG8gdGhlIGxpc3QKb2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBhNDNiNzhiNGI2NDYuLmNlM2YwZGQzNjY2ZSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTg0
LDggKzE1ODQsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
YWxpZ25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMg
c3VwcG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRs
eSwKLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0
aGVyIHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2Yg
ZmFpbGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2
YGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11
bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGln
bmVkIGFjY2Vzc2VzLgotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
