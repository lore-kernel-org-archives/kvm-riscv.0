Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D602BC83F1B
	for <kvm-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eiIX5UGRuYKm8K+yZP2Ey2l1mmIZCe73hUs7uHexTvk=; b=1Kds675R4RiJMc
	wzqhIyM8Ot3lydffNWoBhf+pnU8vqh92eBxsYsLI4hkpLWX8pj/uvJk1zq4Bm2uQaboECCWWXqCj5
	NT0Aj3qmGe1z96FgHT863GJYURr+5jytVkx6wTisY7KyZeKmg9zpCauH4LB4c1n1GjHIZZhmrGXjH
	WVIElgSEQzC4ePxAZoCMns6UjqiE54b7tXH/kKlb1cuwUdUp7oth6PsFwgO5XC0uFc1oLHHb/M8Gy
	NAmXl+lorNBNi597fR8QU8C5LgEiWDb5ZAc2ufvZhmg5RI4mtDqj5VTnnsUcbFc7I791UUI2w0Z0d
	yXbTaDGHs0RxesBiQfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG80-00000001sug-1LhU;
	Mon, 14 Jul 2025 10:09:44 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFlA-00000001pKv-2Irx
	for kvm-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:46:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3334583b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752486364; x=1753091164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dnf5JriQVpHQM4YNtZJFgadu2tM3f9E9KiPFuztXa0=;
        b=bYJgKO73wDXF4e2h1oSNr2qTOEwttlDjzfZ1tqJq/bMqUGwBtDg8yzaD2nCnq/XOFr
         g6mu9kyjRNJ9+bXYMuH8uyw8I/bKwXsE0Ow1w+k6wOQrqaqw73Vl9sYH7wgU82Z43qOI
         YYHEFQvgdoMKwsyBU8pDAnRARxv7y8MniFh/ipOkhRDdHpPRFDnDEHqriEfvUWfS5z0u
         FKAGCXYOPE7oBtUg8+jIXYBQYb3j1t1wvBQNm3qFYQiuRusxr+20xcYL2pAvWvzS+KeF
         hM7CqNLynd1jHnl8LavckiEP0GZxcyiqAWEtFAOAOTfmNCNK9dEfMnyCIEAfnF3MT5ic
         Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486364; x=1753091164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dnf5JriQVpHQM4YNtZJFgadu2tM3f9E9KiPFuztXa0=;
        b=xTMvnaJBE33H08kCvCAMJ6wkA7P4Ab/xy1h7hLZJShebXX69NES7gw0l6H8wK1ZJ4A
         tXi3fSH447BZxZJ3gbBtwZ6Yo4WZvJinqxMwmBCykDfbabAiOB4btZjp3n/oARrwkgel
         9VD1UuKBmI44VuuDHZEY6AtNHcSCiTK+lMUWtnXi6PLDH57+sGzEind8ojjkyYVo3Ya5
         Q/hMlzd76NBe+M2mPD92pX+GZjgcN7+BezMRvCjcQlx1Is5S98W+3M1/7mP38x2iAriP
         Wpb/i6wEAzmJ1MypbnJfanoH0HssHAFmZT/pdBZa5j45DeUrDt0pFNj3IccxxvMjnENQ
         vZgA==
X-Forwarded-Encrypted: i=1; AJvYcCXWnYkejRvFTh6roubgHxVN0Rw6b3rrOBzqqeG9u3U7HAKYaIZo+lPDS4c8rR+6DElJce1h84JcmRU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2hD22IT/3OrcllozEucMhFLUN8bYsUEHtQsvqzmWaEjvmf5Mx
	J4YGm64HXMsTLPtySp/j6PaDKcpzzjjCeVQfLELBRliBpZwjebkYGfwkJK05ENQ7eXE=
X-Gm-Gg: ASbGnctJRw7jQjHOAu7jmdRdloP37NiBHwSt3LwBZ19qAFkEuQPWEfjXtjAZQWniHbx
	gKmnbjh7hbcmOR7Fxvo7oBFn7xrLKj3A38uVVYaQfhrZBnNbO2UyqXKM1aMQR2eVMFqeg5opYCX
	b0Q06YP1qUqZ4WMwlKI86GLUFXtwtted8m695f5Z9MXwe9bafE2O5ujoeuhAdmjiGYYb/TS4U21
	4C4ukZAbBl5jHo/V99jB7vYH3DvPJX8kM880IHsXJpfWj15bX1gMGFwNnLIOskBrJRCOFhnaXs1
	jg9ivQGZ0bVBLHB6Sp5XxAKBBWaiwusEw+JU51xYtNLXEk6i0IusJ7zf7eqsv52btGxi2fV6BCY
	BHAIUoI1LeiSHPkceLTswQ2Ah5K6O6p7CyU3jMWLLoH7DGqsys4qRjFXtzRRNMxIY0wK4qtveeD
	4Q/bZa5RQ8aw==
X-Google-Smtp-Source: AGHT+IFF990cxBBIj5rcns4ua/Z9mSLbBzTWgWQcSkoafAxgEV/F4FcvyqoXGxjBchTkM6/hWtRe9Q==
X-Received: by 2002:a05:6a00:1992:b0:747:accb:773c with SMTP id d2e1a72fcca58-74ee2c509e7mr17413857b3a.13.1752486364023;
        Mon, 14 Jul 2025 02:46:04 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd73b7sm10201283b3a.1.2025.07.14.02.45.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Jul 2025 02:46:03 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: rkrcmar@ventanamicro.com,
	cleger@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4] RISC-V: KVM: Delegate illegal instruction fault to VS mode
Date: Mon, 14 Jul 2025 17:45:54 +0800
Message-Id: <20250714094554.89151-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024608_733089_0E865C8B 
X-CRM114-Status: UNSURE (   7.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Delegate illegal instruction fault to VS mode by default to avoid such
exceptions being trapped to HS and redirected back to VS.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counter remains undeleted so that guest can still query
illegal instruction events via sbi call. Guest will only see zero count
on illegal instruction faults and know 'firmware' has delegated it.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..3f6b9270f366a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,6 +44,7 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ILLEGAL)     | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
