Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF66C02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFSHQ2OKVb24zu/fx95s6htgCYhtP8lTFfHiPrdPEuY=; b=Hq1U+RFQ8YsFTG
	t9NaZ5peUEMdlRHRZ17wQYbMJ1MGC3GQe6DUyUTQN5CYuvbjqxF7vZzc9BGDdAPiEfiJfoLNaWL+r
	GRzdPrpYXEOtiv652jskaYhg0/Knqr6dKT/EiqDtsFvcQRv4j22u4GusUQ2fhKyZyis3J0cbReS6A
	2sqiEhDgb08yyN1zckHt87ANd16L5wJ3CIZ5oJA8lHfQYBVJRKiKGz+xM+9Q6S+vupNmocwzirNtu
	kDJELpIZDrshqv6GoqMEok0aU8rCpjO+LdXCsIFYZjTXMLCJSgsPKmvjh8cGHY0apZGsTlNlvqc65
	UZ/s7eaLS5rqdKi8jjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwIO-00000005ZZ7-2Roa;
	Thu, 06 Feb 2025 07:27:32 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEJ-00000005Xuj-3kAf
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:24 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so790134a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826599; x=1739431399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=sn50xTzec3uGwtF43ZkIwEvB18tlDOmxe7hIscJxuuh9zeNBySgKj/YfvVp3/BmkrL
         01mpoZNxvdgxEabh2t8Z6NiI+stb05di3nWKFNJKq6Ha7mR0HxHKoTeewu9izpgPI7Q0
         eAN3kapm0gaY46OuPPzOPKtnnXvaJb28pmtSeLzo7rKMWnmPnmugNK34/VzUiMym+9Ea
         9PSRXFcf4l7Ke+u7g1WG/Ccmo6iHeP/64hBTXrgcDRIdebdGJaalzylJHXRwl6+hNmG0
         L2Y0W4V8dr8SS1aRgrlorlcwVGlgAowpNFXFNKqVf67zOQ8zqTDky+wjayPI0ZB/k0AP
         dLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826599; x=1739431399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpU79JAmkI/euhUSjfGzozskMgtqeVAFHucAlKFsR6c=;
        b=AxRS6w8veF+3zyw5dSlCEdNmko7zQRT3/gPY3Q3dYI5l0iIZrwaCCpwSZgD6vR+J9e
         Nm9gpzO/6823MCA0+r7WQ2UAo5+FTrxgTP2hT9Snk5wF2CgsU8+PF+xDTN1w4lykkj+C
         PHiKiy0yLYVfkzLQMqzIUrvyAM6jrEg92ouRQimvnCbnmKV/iozlq8LRmecIF4qlGGJc
         ET6vTGT5s/Jaf921Jg1V6MrvZdePsy2e5IX69ZWWNaHcq6qFxYIiFsfUhW9HyvcBLa5V
         8+pTKDOp+YnoG95//u0tx9suy1T9qe08fRZJ1wHKkza1RemLaDdIihIdPkjrAL4C19jr
         gJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfClKzP5Q+xHFqKivwkcoR1bcKiERMpgUO1VV7Vlgp+booUE187F6A6JmrqLIiPuivQMtzXMoQuCc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwLJT1mbh66rVp+onfQlixExvkkQzynRAYedhX3GGN+0YAhZ7m
	ekUTHikybm4Th7+ceeisJ2o5qJ/o888cbb+L8zhXc+Wzh96MZ6YwOiSti5U/aHY=
X-Gm-Gg: ASbGncvzUbSCygIQYD68zCcAJ2l2CyJXGHB+euprWcXHHE2ABeBs5kkaeqL4SSATOEI
	YELpPFDXZILtXM0C3xtEKZ/pC3lQjGaCalQ6ZjEsTk1v8BVzu0KZ9g2E54FH/PDoWRC6CTN3Pk7
	v1Xhl/rALR/6n68aRuKY9BL6Nt2AdCL2M0sJ8hE0404D0i3biOQJg7P+LVta3loe5rlIHhaAeIr
	jqJ3p8uQ+yo8hgY+N1JvuIas11ql3x/0pNEgM5zPNAgIv8Irv1uuCDEw+WUhf/FyxHPOZRyi+s0
	/ZAl1WXWnk/k1KzOPMoyX0pq7qpH
X-Google-Smtp-Source: AGHT+IESyqIBQACISlQQVueV5obgLnnWc+HDOijngEV9yfltfz+MqhbZ4NE+KJYEXiM6dtB0C1mfdQ==
X-Received: by 2002:a17:90b:3d91:b0:2ee:d824:b594 with SMTP id 98e67ed59e1d1-2f9e083cd43mr8885048a91.31.1738826598796;
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:07 -0800
Subject: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232319_943999_0BDD65A7 
X-CRM114-Status: UNSURE (   9.56  )
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

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8..2ad2d492e6b4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -318,6 +318,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -365,6 +371,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VISREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -407,6 +421,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -452,6 +472,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -477,6 +502,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
