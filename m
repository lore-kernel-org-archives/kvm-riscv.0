Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008ADC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy/oCs6SW6icS6yaz8jfivDtzob/WUoYpoQpX9fa1OI=; b=dBp+VNIqr3IVd9
	HZFCpwqmZ9jsCLEXxx3oy8Z+RzB81lqyait+eLktVRyY4BCjh1dFFfZboDTrZRRpwuahyckMtdoJ3
	6dSSSwUUpXZ/lHHMeTlZrBg7NXqYhgXtRuD4x5336SYPBjCJvbzvtfB5y7eBn5AqTefuUGS8Ti9eB
	z+LzR+Y0HyTGiInyR4r8hE6s2CwX8p5dlu5jNDTqBx7HqV2C8LHQImlF/c0ZunDzOIkppYnw/s1qh
	GpP3Pu+iOEE29WyJdqAeclrMyuqoNMOv2/tTKlH3GkdoXIA1vEtamHjQG+o3CrRGzUY3pIilj9q0E
	oiN/6kC6PpDe7mIHlQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8S-0000000BrW0-2zk7;
	Thu, 27 Mar 2025 19:43:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1Y-0000000BpWz-23Hw
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-223fb0f619dso31071755ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104180; x=1743708980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=WqaO09dzopwtBwzm74EUFgPm1VUqcyiBpaowUVFqZj7s8BKRy5NRjpsEwaqVs4uJ0z
         eHNFxfZFxS6zVM8e/1YMK3q1gGShosbDmYMkoD2Jf679PFfVgD+SL76PU/py0rsOhD2P
         OtJH3IwibQRcGGZpzedEmlJlyZQpdibekcF3i8C3mf82YJvd3UpTH0m5UFQKWfLaEiYR
         SZOFIYfolyE5FZ8a63iixz3yO7foSXEwPMU5DujISgFft4hb5G/QdvrgIZPj0dcsCRld
         VRFeoEIT89MclMHzlljnYzFJ4kxzEWdwj59jFMBq53E4Y32G+w0Q3+j9S4mZbSgUxzuB
         8rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104180; x=1743708980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=r3qBt2CVSgbttwwe76X4eaczZ27qcoM0j6pYQ5D1+vODpkEZxPQFo2qvCDYEEfHw87
         WVK4Us5tKuSQt/XgYagXHorJJvA7aRi55581+ZuC4bJNB3WGxUYlcMT0RvB+RWyik7rs
         cHpkszdrVT9JP9pE7mEiXZjP3p5g62b4mK1+NgQkXGPmRUVszCtdrcdFC2LqEQ3fg0w8
         jbVaziGoqW/O/AE5Np/9NZQC8n8ARRuux/v/GQf1fa65WbI6nRsIummjv2I/FtJa5ssA
         kIUm7B62X2/9wt7UbC4LgnVylIKWksrYwkQGrLpEdpZE4L9cFDnUl6fZI/iwthnb4nAz
         0amw==
X-Forwarded-Encrypted: i=1; AJvYcCUrV1IBVdydt9hzvDcJ3rq9AH+BaHcd8wzgHDjOAkhrRRrsJer1GhUBB08IXFu1y7ckbn0yeO9CEDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuqnIAuFJmL2UyIRva6QfW9Em9pz+z3pi0XmubuFg8XlJDFVAp
	3xJh54hRnfphuP3DTy7sW77WefyzmlKuZgPDcDwawo3UP1aW1yptFnvSI32OKSY=
X-Gm-Gg: ASbGnctRYb/hpG9UKwXjtdAoVjhdh7FVY+ELsyC2zxCY+b9ZmZpymzyrspNho96cKq+
	aUpTUSXmDLtkDVQYaFeUDwP9d2558PpHy1I5hlBVkpzkzELkbCn/ZS+ZdwKWDYDXmIk97KOKNOL
	6pGg2TK3u4Bh48HPeW57+vsbPXj46RMRJrKEqvoBXZlVsz10Imyfkx4O3bB9qaDp9rvTSZptfjy
	wT3feEWdCEGMlIAkl67SQNo+8WWRI4XLjBXmvyH3onZepyOkFcskeL15+qQaI8eUPQPsLbFdl+3
	HXS2+BL1T4c6a2dsM+U8vt5cBxLBnFORqZJNr46/vpl90zlxr/XLKbC23g==
X-Google-Smtp-Source: AGHT+IHpWwO+ALT63AnEQfROc0MsU9HJIU94/2wnOwykaqK6qJLji7kuLw7H0FVEp+QuB62Asb9xXA==
X-Received: by 2002:a17:90b:5827:b0:2fe:a336:fe65 with SMTP id 98e67ed59e1d1-303a7d64066mr7195102a91.10.1743104179797;
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:46 -0700
Subject: [PATCH v5 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-5-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123620_639567_03FD06BC 
X-CRM114-Status: GOOD (  11.04  )
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
