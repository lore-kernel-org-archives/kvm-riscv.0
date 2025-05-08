Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD2C3ABC6
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gMt019k8rywKMLoIV2RuharKwwtRzu38GxYKeiaucxY=; b=mXJ0AeOAFqSZVp
	fGRoO3DfFiQcFJg/Y5hVx15mCEo0QBSfTSqhxJPndPw7UdozKqE6qJIKCAp4FdtTySkLuCzcloma0
	JVGlDUNakTFpmfGf/1toBJAVdsdtPSjrt5T4iUzeXgfVd3n1jRaPmI8mQHL5Lpa9huMbr0Knw6765
	MiXWNqZb/Na4u0nrPVtaEBLvM8xLrobiMpxQGYaCbPCUlm5hOOgozAqGQZuKrx1qzhE8xI/Mph905
	qsgXDx4M6fSl6ue/PKdANJ52xSb2J7zrGA0kynPPeIOX7lz6Du4Vazn6GW1gizOrPOXY0ojRWU8Ic
	Iic1rOtptZB+Zr4RM6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0lY-00000000gIG-3V3U;
	Thu, 08 May 2025 12:54:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0jS-00000000fpM-13Qi
	for kvm-riscv@bombadil.infradead.org;
	Thu, 08 May 2025 12:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=; b=gYjbGRV3axirn7OcjHm+4229Ys
	1b7zZvdZjGbfd9v509bMv5Uc3+PI989CfWtyOqMKltTmME1L6ykom6EBptSeNOnzIkKjiEy70m1X6
	I5SGd648ukVrCPP8zcHnAJGzZm97QQjPa3Nwk3OoZRbEPbOWgQjSI9qz5unZIIKbbFuzgqI9BGC2A
	QQg1a9rpnxvdA1heYg+t2HVMRVn4q2dbWNAsSCG/9yrTPHgKPGJOC6fd/YbXziBoC69Z+TDIa0LC7
	G3vAOj6qPG9IOhgnMlZ+ax+Rioz1UbcJkXvbF3kZgHhcFk0dmzsJRSDtFYdmB6jwFANFPAmWAz4bV
	9E1w5mRQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD0jO-0000000G2kl-3yya
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 12:52:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso78463f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746708724; x=1747313524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=QMmFlNNWcQrMRnk96P38mRBKeqA67/GLciAgX1Onp7H6YZ8WWbX2uYpiIzNXNCoWiY
         cVZkv4otquRe9/ar1mERoVX4xoBGT29SO4iLw4ahQhp0dVIJwD0SxK/7oKQpXHEWeykE
         NlAomGWYMljQkpPt2dxSOBwwN5Y4QtFM0oknFjKY+PDtGQ5qyoFppKuUpFBJp+CzCUbo
         eZJgRmwgp4hQtSxHHqAAvF+J8+i4ENdvxrVYO3Fhdj+GNtyr5aqTDlRKK6nmZuPde00T
         vP/VGtlnsYiiyXbou9Zz7iR0VRsy7zBTN1P6cDrx1xJn3MxF3LZ+/BwX45oriTiJSTIk
         IxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708724; x=1747313524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdVvIx+2NUw1S7/yaZTlAzKdxyvipEaCZdSyfI4dcfc=;
        b=nIRQSeB0YuGBbh12nJMsz4x1EiKIDFicn2JjZpoj4MxHzvpBWwpby8vj1rUl7L18eA
         CMHDY2JQJt/y49gCNdVwHudXfFv3X++zJ8r5Q2Up1R9WAmfKHshgGnRqEafiPVwrQwI8
         akxygtPgUU7tneZ2hI0OZgoaF2uhwwL68+Ri4EJZ8X5wPb3Yw0/EDhLnWEiBGWoBZfqu
         0KG+2vOVaEustHUox/pDKrPF0z//y4HcyNGj5PT+yfZYfFdbUs1yh+c6xN1naCkVVsLs
         EbR8tu0nIFMRjy4gmTqb3jnXQJAgsI5mpX4EGtnbo7MvxJdDC7qzHE3JWbs9c1q6+VSk
         XXzw==
X-Forwarded-Encrypted: i=1; AJvYcCXZyGrNRW/8dYKkY735crkzzE90L015wdmnEfOPBJ6vCRJEBeaa+xEZJPJQHOykLtsMsxs5HjejazQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBYwi2cAjtG4bBAXX738DrqXdZhi6BOo7CVpvI9q1KPHdzBfAo
	J3oQKCpJxkcfBvLFxExhA/MdX99fyDQw1mtU2Tn4QFTj5GhjfWlZp7u+q2DVUD0=
X-Gm-Gg: ASbGnctthGPVSeFWC5OThYQZ61kbpymYjkHUXM8WJak1V7bBVf/ynjNa0Rz+ukfsasQ
	q4SRIWtqgIAIZzkBGgX/KSsFFBooMddZpTWYCTR0wLpdjK39hx21rWo+uPUhlQTJCN9NBux1g9k
	O2H5U37GC3zSdMFGyj9+Y5HkJaIT1RWrH6kPuQ4rhqtyow0Vn/0eILjGaU/43+OXIUgilCDCRKb
	1+0qo8JvWbkf/xoYGqW0cuzEkDl5eh2fh3g19U6EKFUgxviYFdMghNjwuG0PkChtTwkzsdcGnfd
	hQC1m/1kA7k01gng2BKdNASjpu5iPXMKG3o80baQp9NiSmMNf+U=
X-Google-Smtp-Source: AGHT+IGVKMnGQaI/zbUmSTKxGatnQCUnEpGyEkFy3V8+2H2zyIaYBb7YrCU27l4UnVxFxrTx/IplyA==
X-Received: by 2002:adf:f18f:0:b0:3a0:aeba:47d8 with SMTP id ffacd0b85a97d-3a0b994eb78mr2407869f8f.29.1746708724035;
        Thu, 08 May 2025 05:52:04 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b6c9915csm4486425f8f.29.2025.05.08.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:52:03 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/3] Move duplicated instructions macros into asm/insn.h
Date: Thu,  8 May 2025 14:51:59 +0200
Message-Id: <20250508125202.108613-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_135207_256880_42961AC5 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20v
CgpDaGFuZ2VzIGluIHYzOgotIEZpeCBwYXRjaCAyIHdoaWNoIGNhdXNlZCBidWlsZCBmYWlsdXJl
cyAobGludXggcmlzY3YgYm90KSwgYnV0IHRoZQogIHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNh
bWUgYXMgdjIKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQotIEFk
ZCBSQiB0YWdzCi0gRGVmaW5lIFJWX1goKSB1c2luZyBSVl9YX21hc2soKSAoQ2zDqW1lbnQpCi0g
UmVtb3ZlIHVudXNlZCBkZWZpbmVzIChDbMOpbWVudCkKLSBGaXggdGFidWxhdGlvbnMgKERyZXcp
CgpBbGV4YW5kcmUgR2hpdGkgKDMpOgogIHJpc2N2OiBGaXggdHlwbyBFWFJBQ1QgLT4gRVhUUkFD
VAogIHJpc2N2OiBTdHJlbmd0aGVuIGR1cGxpY2F0ZSBhbmQgaW5jb25zaXN0ZW50IGRlZmluaXRp
b24gb2YgUlZfWCgpCiAgcmlzY3Y6IE1vdmUgYWxsIGR1cGxpY2F0ZSBpbnNuIHBhcnNpbmcgbWFj
cm9zIGludG8gYXNtL2luc24uaAoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAg
ICB8IDE5OSArKysrKysrKysrKysrKysrKysrKysrKystLS0KIGFyY2gvcmlzY3Yva2VybmVsL2Vs
Zl9rZXhlYy5jICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMTM3ICstLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9y
LmMgICAgICAgICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyAgICAgICAg
ICAgfCAxMjggKy0tLS0tLS0tLS0tLS0tLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlv
bnMoKyksIDI4NyBkZWxldGlvbnMoLSkKCi0tIAoyLjM5LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
