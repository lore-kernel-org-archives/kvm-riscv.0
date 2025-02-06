Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4470C02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy/oCs6SW6icS6yaz8jfivDtzob/WUoYpoQpX9fa1OI=; b=aP7rxfFowg6pWJ
	FZrCe87nthh5RTa7TrlKGV1nbTq6xP7ggaAkIrZ90kcWhX+7BxpPBxp553itsT5Y7oAKb8hBZDS93
	hinRzzSi/Y9sCpwqmqFIUGoDvxDXbjdvnXmDcrjuJXteKHgaJn5/kWDiP3Vx0OzUWrjwmi4nMfhoe
	GBIlLYvWM03jCNMnLkhAJX3pVMuAOZderJDCdnTqsa8RO1vk9Mp4JLODllEBeKZOgTOsVkAFa4Xp2
	6cJaq+lrw8TtJgdwtNdG27Or0GEX3C8mDoMn9G9N62gVRIVr8Jka0e89ZPvFzKlIS38AckG/gsjUK
	q7fgzgxNoA+CdEau8H4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwJj-00000005a3W-2MVL;
	Thu, 06 Feb 2025 07:28:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEO-00000005Xyx-0wAo
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f9dbd7d80dso1083081a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826604; x=1739431404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=vZmutt9f54VoYaUnb3MkhrTtoGHbCz/DmqO3QhMJc9yhhPkhuLJZr2Vy/QheIzuKOS
         cEajGZdghij8YpDVj0Jmp0uZb6otZ3pSLUHg+sE3/Fx9s72eGdmDHO8iNLTbfBsmxbtA
         I+HCnDlqvKvfhV7y7c+HjxKBWksaiyEOeQ8Fu8noPUYL++yjhWjGecgWJGBM4dFOpuFg
         9AG/W9NVo5Dlh96IS6I2b5jnXmzK6L+kVpesXYShphg1K+upLAq6idWEjSLDxcFRTqdM
         LBR9UdiozZGX6iOIcFaQpQSI8XgYNVRnYSaoIrQHVRh865PEO3rNEdHdW/UwQi+3zGzq
         20/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826604; x=1739431404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3zbGTAqHMsJs8YvOYpRy60tVdSbXNH77zwDO4GVCI=;
        b=ZC/T2yaHO7Oq10A7+kmR1oKK3f40/RzZy2PTs1SqTiRpOUDoL/0VpYmuUBnWe0LU6i
         4bRctexReATU0WMrb+JLs4VD0YIMnW3mHjlX8JowEwTFJlbFNvcOxXmHzmdNSFkiUmS8
         fAiKKajkHAgsIM/dY8+3MMMx7aRmHYcD3hwZq2KU+hsSTNVo8DMNamlwMBnQ8syx8/95
         1l923fC3aUWRSkm1gFW+LKK4Abv0MkDH1DIwtz8dbjldVjKOnRC7P+PpQ910D4/V+Slt
         5vXNZ+IEkh5Q1TFxxxUw5ESiDYOwS8Gir/J8tvybHueheGbKrpmGoF9EOOognYf+z0rI
         5Xfw==
X-Forwarded-Encrypted: i=1; AJvYcCUkfwlnrlTWbLm5M9lCOwFU74diq8Vrp6R8P0Otk0LDVfmdwsj2J0N4EsJCB5chjh211f81b2rxmhM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmq6yhzsyePtvJv3BlRnP0WsFvQuw/AYdGqtmgopawhPMvvrZE
	7osfwPpWbV6KIn4LsciNRhVl9h0W9SPaR/1uSrJHxxo7QrX490MZBEhl+KUmGzs=
X-Gm-Gg: ASbGnctvKquHn7XmV+Sg8NxRQdcEDHJ9qO/Sn/wzke6wTqSp2sEtk/YE+ayO+WXBQ/b
	Cck94Eiue0251d0iOskKLHHRnopMzB1PHhq+d4lMGLGR+a5HpJ/kB/KodTeMDmMuqCo8zTEzna1
	vmjPMf9y/rLE1XvquxHU6LBdKbfxhBNdznOpAzDFBzenvyfltUJp4LAFKhBszWliR/jEZYlYQ+w
	4Sje8Rwvm/NykIuRV3GQo4oz+WYUKDTJZ1ZIDlMsQOUoCcOffmefH1aT8ZtL3QnEL5rI/cbVkce
	79V6xHGM3MBdt+9pYzOI/HfpHyMi
X-Google-Smtp-Source: AGHT+IG32go+lZuwjCgg/zbLptZ9A9o5+Wocjk0VyZkgS2Pr3FK1vOOJ1tss0czCWnqvvWKX+hfRsQ==
X-Received: by 2002:a17:90b:4c4b:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-2f9e075fa50mr10140486a91.14.1738826603728;
        Wed, 05 Feb 2025 23:23:23 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:10 -0800
Subject: [PATCH v4 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-5-835cfa88e3b1@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232324_295516_C0FE88A8 
X-CRM114-Status: GOOD (  11.13  )
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
