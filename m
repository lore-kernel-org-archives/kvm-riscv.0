Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3AFE77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIj7Mm/L+bnAh8+vNQpFKI+sLCGlRi4DMDauDdry9Ho=; b=hzRGGgrYKj0AQR
	4AhvpkZWN7lUeh0fxXXGnCuDd+e3b+2peDpRVDXcuHK3AAiiwkJiwEWcBlIxCexp0M7DyeCO7JUvt
	DLSA7yGzy4rrysWySLASyd4VP/SPvKW96Uf4U9FhglqPh6+xbOr/JmTZEd2xGMoIYytgtroG2Em0t
	9qVp8cm0NcRjwBLPGMUHjd8WHAuK9wZTnIZX3jGOgd6rN9Ohoeo1o1WFvJkT1Jpnc65lrfBuFupor
	QyNl9StuwDQfxBf152fN8m4dLnnv6qsJRg2REiBki2hPQZuPp5TuA32j1cvKAA9Ux/iNFBLjtbxT5
	ewkFeZH3Q3ZU9iadMsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpxl-0000000A2A7-0Xmr;
	Tue, 14 Jan 2025 23:04:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpre-00000009zp6-3F3D
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2165448243fso131786465ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895506; x=1737500306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=jKgh3h73U3ueJBE13exDcdzjWZ06tuQQ9lFkbVtonpgn+qNqxG+YoYdg5LeoibpJ0x
         dpZhcbAtUxasBitF4sCJCPEzLaxJbC+6epS3ktbbIzCQK1u7pljMA5ceEPbOtQ2c6F8E
         BlPzhGu4ESzidXswryvWM7dm2XzM7KfL5J9EoyL+01Pvarpz18FPFepObgEwNgRsb7Ef
         HQOOmv9XHwZuUC3rcCuIAH0Kjq583Uq5OdV8M8lm31rWwbdIWAVZkAlac+8YGOZTpo7F
         MTpNvtxCu6UUXGn1pMZfzl8LWdIey+z0b0PukDP5zP9MhWPL+h127Vb8s3ehYX0Fl+Zn
         MFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895506; x=1737500306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=ETpQ9QctkGQSqdHB0+0tY/4vMlsFgf4ojLB2QW2vmfwGbus0RPqjarlvWnfpm07Lvg
         mJj7eoqKa7XMVNJaLBeBIwgSe6gKM96UOFlSobv6jdTncoRY8Dco7y5a24OurUAcmGcn
         frnHNLJIzxAZn7a1HrBXfr884jbYDwobViysY2kJnAZSCjj6NNchmLq1YSbgPTMVd0L6
         ur3Qmj+5SXYfRZAr6KuAqzUGnMIaxB2CKmOqUrU6jGFOv/PuBKs+fBc+nq/3FrUQDqUk
         qenb4WCXKmQJwmHlG7ok/OENClBT9kXDJiolprVwSFATHKNdY8IBENC6aczHUxNLamHj
         twZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0SXRmj/DuI0C+gb62rpEmVlBge9i5lH1x/Z6Hr+t2RvCCES7Dx4p5/aQ+hEydE/EZsJwRWQdfNXo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPRqRoDY1pe3tyGBJTyCglSeZeYzGoIbwKakWASXFClJKZ5eAK
	d5fiP211iaLW28ifGwEiS1Asahp3kZ0PTIV/Jt7hxeo4Na9/Wyu3kPT3kv6beXU=
X-Gm-Gg: ASbGncuDT70j5qTj02b9kLhjgR0ipfoJbe/BcCivGJPe16/ZzufH5DtTIxBofyO9BiJ
	otLhOpE1BAPp+tUdof0Oj/f50uqM11bKrc/SWIbGg7au26dtaLykKtvz1tziewz1iGYAYXyXy4+
	uLjXVrvykRer4s2aYXUFPQQOphoRGZgEU7vDjdSzOHtzCIp49PEUM01vXF66Yr/7S3ty9qzdKkk
	6FDVyyhU/VxeTWjFOYVk0fUsX2EWO6FflFZ9TiDd8r1PyNuHN95f+E62qYOep+3zu3ADA==
X-Google-Smtp-Source: AGHT+IGcOgG1DqtPgRuq87OenfYeI7iqhHkrnix8fM+hMVbZ5ICFTggWxOV4+kwRFEcps2WSmP9bRg==
X-Received: by 2002:a17:902:f685:b0:216:7761:cc36 with SMTP id d9443c01a7336-21a83fe4b6fmr435625665ad.43.1736895506247;
        Tue, 14 Jan 2025 14:58:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:25 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:30 -0800
Subject: [PATCH v2 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-5-8ba74cdb851b@rivosinc.com>
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
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145826_873403_8A2E1435 
X-CRM114-Status: GOOD (  11.36  )
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

The indriect CSR requires multiple instructions to read/write CSR.
Add a few helper functions for ease of usage.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr_ind.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
new file mode 100644
index 000000000000..d36e1e06ed2b
--- /dev/null
+++ b/arch/riscv/include/asm/csr_ind.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Rivos Inc.
+ */
+
+#ifndef _ASM_RISCV_CSR_IND_H
+#define _ASM_RISCV_CSR_IND_H
+
+#include <asm/csr.h>
+
+#define csr_ind_read(iregcsr, iselbase, iseloff) ({	\
+	unsigned long value = 0;			\
+	unsigned long flags;				\
+	local_irq_save(flags);				\
+	csr_write(CSR_ISELECT, iselbase + iseloff);	\
+	value = csr_read(iregcsr);			\
+	local_irq_restore(flags);			\
+	value;						\
+})
+
+#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	csr_write(iregcsr, value);				\
+	local_irq_restore(flags);				\
+})
+
+#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
+	unsigned long old_val = 0, value = 0;			\
+	unsigned long flags;					\
+	local_irq_save(flags);					\
+	csr_write(CSR_ISELECT, iselbase + iseloff);		\
+	old_val = csr_read(iregcsr);				\
+	csr_write(iregcsr, warl_val);				\
+	value = csr_read(iregcsr);				\
+	csr_write(iregcsr, old_val);				\
+	local_irq_restore(flags);				\
+	value;							\
+})
+
+#endif

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
