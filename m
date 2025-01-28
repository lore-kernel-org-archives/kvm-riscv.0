Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FCAC02190
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIj7Mm/L+bnAh8+vNQpFKI+sLCGlRi4DMDauDdry9Ho=; b=FSBAXelfoB9Tkh
	xYcSWw5CkumzzsBkD8pGwFmr5ISwNqpK/nYCpIp++8oX+e2qJYJ7V4BAXpTmmAu7wfI8KBfDO6cWw
	tLOnCItBWTiCK8ZwtUKgZ5Wh5NSlf4+wcCi40UzEIkVBv//6KSe3EQo4LE/Z8oIYAUwb1Ky+rUhZp
	W8VJoQP4lCV5gf4MhAFrNnY7QoJ7uHb3n/f/3KBOBD4FAt5ZEBpuR/pDyhk1VhjwL/lGG4RuBS71Q
	NAn7zBZEaRdt0wfH9O8wQ+bsT3/EH6n8lND9r5gIH05sb64WDWDSC1DxPLNLt5GkTYxvbOm9Fb61M
	W9vcwTiy2YiQoNm2KMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdo8-000000046aU-3gTG;
	Tue, 28 Jan 2025 05:06:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhd-000000044P9-49QU
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 04:59:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso6894828a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 20:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040397; x=1738645197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=MIPwWr7c3LsYDiZlez8A2xfJMqgzrW7ReQAHMoKb/4mB/yv42KC+N6kpruKDGtUMBc
         qluNllWDBHnEEcgz1eWlMq4GFamJXbJwUQqS17sCBT3TOaRq7V8zyalQJK0gEnnZhokO
         2oPG5YKw6S7vVDJVENWr/ug/yqJTJSDeJ605xuXJLO5872C7w8qd9O8XFJSxhDZiVS/s
         Y9eICp+Ab/qRgERAHufx35TzJmS9XmhPqJb51jROzL8VLo9yTnA/o8akdPxJOdvDZZxs
         WG0WLKOH8Ekqc+dh13MR0zGFzIdYlEMjs379Fc2LTp2jX5qSd2UlK5rlV8gJl0mT+xo+
         n5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040397; x=1738645197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL7HY0dEKrWKEMn+BoWLtPifTt6hhf+Eo5KcPrG96mI=;
        b=jZIWF2lYHL3xjgm5U6Icck0Q/rcWrCaNT+TKofGNsc4k87KD/Mni+Gejne877Tq745
         EYM1H0LN2qNujNx2LTVat/836MgldNn99iQ2JRg4dmBcAh/9b1Dlz5oXn3D9/kBQKzNe
         6NC/E5RRptXzeboQhyl8lWdm74ODyUEcJQszRFuwE+yR31FClyXPbxhe3SGCq6gbhLTc
         VXRXEgbYR6sm6Xk0Mj0MD5sU7Cqf86Y35t6jYwSab0Cm5W72zlCgVU4O8bA+zrOPCU9F
         T7QO2cFibMPAIivmlA8boCUZ8iV5bYvgFCLzN/llNXJuzGZCPLL+stiwV6k2aI5DrC3x
         MteQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnx7wjEW8d06lhPipK2+COnv3HzcHZaAy4olemM2JEe+C47Q3FMTXxVuE8Yqyp+4cHUmDkiOjRKu0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyrXfjf7bCZxMyr0UoeNlfCmUgCxq7L9Rio4Kc45OfYEQJUZEJ
	JuEtXiUgPoPEWiScY/BosAmm69P/3fjmnSMNwONl5S9q9hyY+70ZCDWxNJP+GeU=
X-Gm-Gg: ASbGnctx/GjqvGxH1VOariQhO5G+3KzT6CvkoXwugu1JxefVEpGnyx5/T/T0SKmMVvD
	NJeRNpC7aQhZws+E3Vnapv7igIU8YU8fPq4RmCYZrPTETPkWGgptJbjrdrNpzg2yKRNvEdoxHqS
	AH8lXMUb/LVebeTSy9jDN4IAgs7P+FMae68fGZzSoEUnvfGOSdpRojc8dMnvE0iDoT05CnZEMIa
	E6Ce6YQBqwW+yehxp/M8BPd8zNF5+A4Ie2JXdj2K6sliRjPMxbr47+PD0lKRlBCqTD61W3sxyxZ
	0Hw3lnjDzpBzPfUWdizqq+zC7VzW
X-Google-Smtp-Source: AGHT+IEydkqGnMas9EixfltXBAZwEmzDNcAGB6aZaVaiRCrDSr5UAXUAKLQCmfBM6LnRIdbwcEstgw==
X-Received: by 2002:a17:90a:da8e:b0:2ea:5e0c:2847 with SMTP id 98e67ed59e1d1-2f782d37703mr53064728a91.22.1738040397475;
        Mon, 27 Jan 2025 20:59:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:46 -0800
Subject: [PATCH v3 05/21] RISC-V: Define indirect CSR access helpers
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-5-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_205958_057775_50E1318B 
X-CRM114-Status: GOOD (  11.53  )
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
