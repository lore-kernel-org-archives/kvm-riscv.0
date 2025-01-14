Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E09C02183
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMvbAPBEwDecFmRwRN7gHYAcEnKuWiogljMyvoFEzag=; b=JVLmwaFsvfy2Bj
	+uzVZ18jOrbx1UXIjVUhV5J0im7ji5M6qs1s80ykYVeiwrqsVD9s+NgWGrfRZj7Qyd8F+96dQVWyv
	RT12JF0ciz6EGGpt8kQEp1AmXpz432PNfzRPfzubEIty+UAZ1t2Mv9DdJG2rUhDPkEpi2lQqCU9aQ
	S2JIeO43AW90DwkWUdB14SGCumWDQlQvaPE1oXwIWVzGY/YUPY57TAT1geONoLG4xNuG+n5yGvj8M
	aUkegOQpjrKpgdmFoZ6l0+pWCjah0WpgiqQT0ZQ+YKb+K4E4V7jfGKtjELDGPjLUuCuVYw7HOVltc
	KiuuTvtKvoxA+l1lkj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpyy-0000000A2aP-3IPk;
	Tue, 14 Jan 2025 23:06:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprg-00000009zqm-2Ynj
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21634338cfdso100826145ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895508; x=1737500308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=FanSwtMliTUckS014TfgwSB3jySv6NHGLmUGehdoTa55BdR9e7Wi2ejYmj/L0ovW6L
         uQGvTSOBdQDCBYjHFvD4w5RRDkpODnPNqGMUPbdyi4EOIY0wYrrXzvo5h+DwvIxxyPJq
         pnxmUF68hBVY/fq1IsayR+av99TqDeV7Z1lOO2PP3VreDHEf49/x8jNmL8ZNOrgOmOvj
         ROJHIsnCfEo60lqGeq4P9GKg3h02d+fvqmXUnvwouqnZ71cnSc1Rg5tMeB/ehLFjCq4g
         mxfrogw8WgWsp+NxtZg8ugwfanfw/uommTPK0uG2EtW82ln4wPLzJoGcZTjzqlbROoyW
         sBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895508; x=1737500308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=Ka+uvoOTc542n48hPQWsG7wokV5cP4PZKLjFnJZIela0sUdC1tvLa9s+IyxAs4igLz
         QYTSDYmD0HXYdwkn8vFNyktFS6PF+rN1hhFN+be4teMRK7bTCNn9CQQ2GLb39xjbnCzY
         NAWJYfTyuxGUDePpl7TiNTD6htXIzM46wEjFwuSzcWquM8cAy/flC0jNPmcKsq9aa/Bf
         XOGhPbDArpOvQ/QQmuTAVNgLZ+8STrOZugj2Ddu7SlJIawtqXBVCx0PPjx+8UO/0PMRa
         d7vzh238PsU3q1ln2n08sd82BasyquTytNqlGc6Qe7CJYR7Kk2rNrmnFe9MXO6EF3Tyh
         gdKw==
X-Forwarded-Encrypted: i=1; AJvYcCWcQcmLEgewtBMH1/+47OOeFtXZDewTYisbhuKpwnG9WLOagR4rJwDm1D7BUPgRcQWFllx//O8rIrY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx09PDnYe8p/a98me2wJhwRuJe0obOY52kHLuV6/HgPkj2b4JSu
	cszpBmPt2LknkZbBFSfvcccrmsMAUDDRq7KF5uLoSa3GYmQLlAa/+TxwXCM0a9q+j87Ng/P1ruH
	H
X-Gm-Gg: ASbGncunvyRFGVHUF7s3/+WPAr1PEB8HLvhWp4nU6gQ6N9iVRDCZfsHB1jsoSr7uGA5
	05oJjzpmRtg/32CgjSXyD/xPboYg+FBUTi5mTdMtzC8kzqR9OwWpbc4JJXX6DQWyjMRkCWsC1ya
	6JCBuLT9izPG5uM9pjcH4GeHeJ8gLR0FDXSb2I+mj+7/3i7FNmGHP1zw7eFeQIMsxQC9f/uSaa7
	v6P1Ojvob2SO8fyhCyK+1U3jCPfIeLxlknM3EYiTrmSygZyNvKNfF/ZN8IHMPlcSoTHMA==
X-Google-Smtp-Source: AGHT+IF/AABCTddporckIjUOKN96hiQBtfgegSha8GUyPdUbW6ovhlFLWrya9o4NBU/v7Wam3y7MPQ==
X-Received: by 2002:a17:902:db0e:b0:216:3d72:1712 with SMTP id d9443c01a7336-21a83fdf36emr438120255ad.48.1736895508081;
        Tue, 14 Jan 2025 14:58:28 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:31 -0800
Subject: [PATCH v2 06/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-6-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145828_651024_EE2E66FA 
X-CRM114-Status: UNSURE (   9.71  )
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the scountinhibit CSR definition and S-mode accessible hpmevent
bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
counters directly from S-mode without invoking SBI calls to M-mode. It is
also used to figure out the counters delegated to S-mode by the M-mode as
well.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ad2d492e6b4..42b7f4f7ec0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -224,6 +224,31 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
+#ifdef CONFIG_64BIT
+#define HPMEVENT_OF			(_UL(1) << 63)
+#define HPMEVENT_MINH			(_UL(1) << 62)
+#define HPMEVENT_SINH			(_UL(1) << 61)
+#define HPMEVENT_UINH			(_UL(1) << 60)
+#define HPMEVENT_VSINH			(_UL(1) << 59)
+#define HPMEVENT_VUINH			(_UL(1) << 58)
+#else
+#define HPMEVENTH_OF			(_ULL(1) << 31)
+#define HPMEVENTH_MINH			(_ULL(1) << 30)
+#define HPMEVENTH_SINH			(_ULL(1) << 29)
+#define HPMEVENTH_UINH			(_ULL(1) << 28)
+#define HPMEVENTH_VSINH			(_ULL(1) << 27)
+#define HPMEVENTH_VUINH			(_ULL(1) << 26)
+
+#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
+#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
+#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
+#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
+#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
+#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
+#endif
+
+#define SISELECT_SSCCFG_BASE		0x40
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
@@ -305,6 +330,7 @@
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
 #define CSR_SSTATEEN0		0x10c
+#define CSR_SCOUNTINHIBIT	0x120
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
