Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ADAC282DE
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucp4gjnc59NmFzdQm7+UAtDZy6jzTNuMkqljtyAJjSM=; b=xFbtjG+Iq9qTGj
	bJLLeVV/5isaLU0kHn25u/ECAxZ6Ep3NeQjqmPJYB0RYxvV3s/e5KWFHhlufUslwCiKixkTQef82o
	1HKWf5r+kpoDL/aAJ5bExN9pp0Yy8IoH9U5Wl6T6ZeJrWPtqknphnTJh0G2oqvdArC6hUSx9FHxzv
	uh8OSU1ntzQLJJ0zmbD/pcIMGBItHiafY31OAOTOj4GHLnebJMOFnETdpooanx5UPJgZkXYUu7a9q
	/cpArZaTpxobXopk0NxRa4V7rD85F4ZlK0rJm9FmeTWWLHSruONWxZt+1L166dJBNiscqk+VD15po
	RV8BXjByvKkPOOIJRPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaNI-0000000ErIl-1EuP;
	Fri, 07 Mar 2025 16:16:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaMd-0000000Er3H-2IKx
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 16:15:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bcc04d4fcso12821575e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741364154; x=1741968954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCReb3cvg707HPbBwZSbIVzyvT4c2UyWOl9p1yzcaUg=;
        b=N7gDtRBJiB/ceJW3PjZXtz/JB8YonZfVvhPl2MgSTxpOT+N3RXb+ZXI0PArJJ+hsqM
         oHDnNdFok81m051TjDNa51l5yZYnLvluVgJHqfPj46xVtLYXpeUdvIj8idgKcvvYjiqJ
         jgi0c2YeqoIu5+E8cMaYnhu2SMWd+TOmC/fUkVErTgptRUdPP9EF1A8VpdzY8vBDUETb
         gWQTIZ24aE2xubSz1HZcqz3lW+AJEqdM+SCc+VqA7wWhgIEmZ9p46osImHwq95DdSJAt
         9CKcSEvrFLFHPPvdjYNEJfYPXd/LLDXdzUuDTLzTmCupQsfepQu1uOVFJPZesYioRTfu
         5Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364154; x=1741968954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCReb3cvg707HPbBwZSbIVzyvT4c2UyWOl9p1yzcaUg=;
        b=i3wGNux4g6cFv6wSC6pbOLqjdU/udL+VGtt54QM+FbRtOC537Uh56+conuRuRBC9BP
         HLLO532OVKTcraR7rQLCF7GGq5Tn9SOKwA1mFEqRCApjQBVqZ/qdGdGUAzjjcjfaVfy+
         UekoGtnCpX17E1Oyo/z7PYXL/jyWnDPbLCZ+6Z3tPED6NC5ILik2QPFKO888RXAj3aTs
         vvcWI2lXFpFFTsBM4fhTdvPTftBCfSpDUa9GeclPWytsPfli3kWiu9rAuhuOp3R72m1k
         wYZ3b6DfFmdt6m0ZFyplljkdeQX5K6MDXcoOMqxcSkyLPzV+GBrAX5Ck8zDwgqKJk4Pr
         qF2w==
X-Forwarded-Encrypted: i=1; AJvYcCX0FqWDKUvE7FgPK+bhNdhUb6vNHOUrqVVLufdmPm3KASxgdlA5LF9lUvH83/WRBZB4S6SGZelQrZc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTjE9uDLCSIjjYIrwVq5AqVYCvQQ7Qb5mWP8BNdcECqt8xlZZ9
	ICsxzLbJux9QZE7sPIL7F0wxLc+2jP2nQOVnN+FujGOON/DVEu9tYyWC20GkJaE=
X-Gm-Gg: ASbGncu0uIa7TpUWaxzRdCt2ioY35t6glruCH6+BNVSbFbQjFDo7B7mM5qQobDM0OHi
	y0Fc7epghZMho4w7k4BWJLZH28gd318yJGkNwXeIOs/MNTp74nR+1vY3mH48G32Rfo4iMJlNrAb
	1FQUmvlRcrLLvriFu22YO2ffQnMa8OwLopb0l0a+smBeyC9QYrEddGNVGxEp86+xaZHhHCooITp
	/KJ1r6NnS6WST+RKFvYmGY6eOTuJlhNxV3p4c/06cbATdsW/5DMuw/K4NsKSJMrmYLW+5rnEYzp
	+bmZ5u6uo2y15adCYE19BMaT0dgh4wTbRdODhg/N39qyGw==
X-Google-Smtp-Source: AGHT+IG9PL3mSCAWphM76+/MO36a6gjgduMu7busd7CtSobZbrw6wfyMhJnicGa7Y/w+ulU7H5lAKQ==
X-Received: by 2002:a05:600c:198b:b0:439:b7e3:ce56 with SMTP id 5b1f17b1804b1-43c687027f5mr28095125e9.29.1741364153686;
        Fri, 07 Mar 2025 08:15:53 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8daadbsm55496245e9.21.2025.03.07.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:15:52 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v8 2/6] riscv: Set .aux.o files as .PRECIOUS
Date: Fri,  7 Mar 2025 17:15:44 +0100
Message-ID: <20250307161549.1873770-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250307161549.1873770-1-cleger@rivosinc.com>
References: <20250307161549.1873770-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081555_586605_C4812F57 
X-CRM114-Status: UNSURE (   8.22  )
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

V2hlbiBjb21waWxpbmcsIHdlIG5lZWQgdG8ga2VlcCAuYXV4Lm8gZmlsZSBvciB0aGV5IHdpbGwg
YmUgcmVtb3ZlZAphZnRlciB0aGUgY29tcGlsYXRpb24gd2hpY2ggbGVhZHMgdG8gZGVwZW5kZW50
IGZpbGVzIHRvIGJlIHJlY29tcGlsZWQuClNldCB0aGVzZSBmaWxlcyBhcyAuUFJFQ0lPVVMgdG8g
a2VlcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgotLS0KIHJpc2N2L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxlCmlu
ZGV4IDUyNzE4ZjNmLi5hZTljZjAyYSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysrIGIv
cmlzY3YvTWFrZWZpbGUKQEAgLTkwLDYgKzkwLDcgQEAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9s
aWIgLUkgJChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgogYXNt
LW9mZnNldHMgPSBsaWIvcmlzY3YvYXNtLW9mZnNldHMuaAogaW5jbHVkZSAkKFNSQ0RJUikvc2Ny
aXB0cy9hc20tb2Zmc2V0cy5tYWsKIAorLlBSRUNJT1VTOiAlLmF1eC5vCiAlLmF1eC5vOiAkKFNS
Q0RJUikvbGliL2F1eGluZm8uYwogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1E
UFJPR05BTUU9XCIkKG5vdGRpciAkKEA6LmF1eC5vPS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChB
VVhGTEFHUykKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
