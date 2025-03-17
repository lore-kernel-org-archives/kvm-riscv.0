Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862DEC35FFA
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c3sHp42HdkrJHnFE4TJXOh+e6gIuiqKOc0sqZ9Vup4=; b=0Cyr3NnrgmuHry
	aCPp2a6m0IXHgpHCh/ME0wDSqtNuS42FeAjvah1lLJdVSsQPZNNpTai79rx2uBeWMCIjQYi/XQNZr
	9HYgJ+WuVrSfbYPwmSIllB4is94W1C0n6YpxSxOVPiSBGVoUj5dopO3URLVSpGwrDYnPxJUar7w6O
	EcIaFJv49c21432Q7jNChQ1hZCRzXSOnq4eC+l1Hsk9WAnvEPwhQulU/1DdJsBTVYDbP4C67dBSlP
	H7akSs9Xt001yBX5sp8vxws6jXmPux75Jjh9mf9Tm3wdYr/hXzziKqOG/Fqfz5mMlHcIvSmCI6jwb
	Ohd9jdwMwuuaxhP9cVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDer-00000003Oy0-10lw;
	Mon, 17 Mar 2025 16:49:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDep-00000003Ove-1LAc
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so11375555e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230182; x=1742834982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=lu0Iy4gXCNidX+mxrXQm5oWBnp8L/lDNX5rHZ4uC/51L18b/CY1wd4FscimnTCbvP+
         A/kOXzVfIFcZR/wIo6kXkJN5huTU2GWy/ogtoCVhdiiSN6VTzufxYWwfu+y7Ikix8C5B
         guNWLCHKoW1IoY8uMGo6M2YMTeZBNIF0pMP7BSSS1EKWBgI0IiDKLg0clIgbOxB2B/7V
         DgupmjsILVYoeAHiPj+n/YfjxfiLNvlGsLNCM07hTwH2t/Ir0YijAAeA5H6ImIIIZ/7B
         TMSwu6p3cRiIg740po02gF2e1i32ugLGW+35MVrDK5xbXhXDTmlmllkJezfr4Oz+6yXO
         sCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230182; x=1742834982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6xs0cTjWqrdDwyk7E4bpCxTQMeqygyQS+ITTTaO07U=;
        b=p/cHubjl3LxRWi+++xuTikT6GBYEChr0N3PAZyjO49djhNeomG/B6ybZN9dBJNY0D6
         KixvRG2VMVna44+PRu6ttCEb+0c51exN3pWjhaIFowcKn3nVqmaL3chlhSis9Vd/86xQ
         cOpXlhTpZr+bxht/uR+mQDEzEC3ib3MaRH5FEU4j4w/6YBFCt4VqI56m17fsN03Vbl9N
         Oz5X1GNkFortYxFIf/GJO8/7fumqI2gJlpkVDnjpHD7EJ1GPNQ2w4rz1wFBj5qtGCZiw
         oCYiMzdFBrTibbgmjAQXxt9Q2rUh+LEiQFygkVnsDzRg1TpQ8hfOegWDqv1hn+APk5Jw
         5D3A==
X-Forwarded-Encrypted: i=1; AJvYcCWXRZD8vr+/MVShyYN8EnEcQXWhBZzTRf6A4Pwue1Xple0RsaweDotiyNHzqP8AurKxBt036Bwro+0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5vFTYwgA9Q9w4ogqAv90jqlx3a9MZJrojeFmQ0Llhb7bHGWE9
	gvaXH+gjaL0DgXYlxecl4B6ADIU7BvwJrutc80jNDOJqKglehkZB2cvLKTTPQKk=
X-Gm-Gg: ASbGncsG2rbhAyY5FSdv4dd+K58SGYu5XdBB3cCysuQqlIr8q3POEpKesiQm1N/Ucb6
	yhH2OI6v8aw5Cg9IBW0WU8bdVy9ns/STZJ8PI9Y/YQrbTbzUkF5JdS7SY37M/X/phGh/q8vJ7uJ
	lZ09Wj0cZc/P8LYg8AtciQXvM0U4b2Ush/qiUEVyAZP+I8CcGCeK0ttO2b0c6+Kzy8Zojo6fr/x
	9crP4sXgTVnjfFm9mWMc2PFS7f9VqjK5t2JqJtGszmcFNzcPOo5mO7BGvK9SjNPFQp4cD4/clD3
	LO0p1AKvdtdyPQjENQNvMvbuSfLGwKhn5ajJwdU/sXetwH5/RpS7rUXP
X-Google-Smtp-Source: AGHT+IEAxLxzcY52gpupthD5Y5Q/p40zCmUKAOB8WbkcvABnVkxA7cVybicWHwMktPXdkOmQxbzVxw==
X-Received: by 2002:a5d:64a9:0:b0:390:fd7c:98be with SMTP id ffacd0b85a97d-3971d9f0df7mr17970539f8f.19.1742230181810;
        Mon, 17 Mar 2025 09:49:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v11 3/8] riscv: Use asm-offsets to generate SBI_EXT_HSM values
Date: Mon, 17 Mar 2025 17:46:48 +0100
Message-ID: <20250317164655.1120015-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094943_350947_AA123CEE 
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
