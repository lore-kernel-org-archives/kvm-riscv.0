Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C6C02192
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FupqIbRnNXM9Y6UYAIrtOuc7VQhfzLgvfkc+uj6bU0=; b=mc0t7C83qyPaF+
	raNUTvSlnjc9+C8DWS7jgMFz5f4At6WFlc9AZA81rVE8mFc1IuxjmyxyM+YRtsyc9Jm4z++B3KteT
	UB4FoIHZX0gKZedlUOpFWOoKiVBXTTR28lKFiy/Cc/S/DnSP7BfRlpAQEtk0VGBGJ/TZokyJQEnmm
	zwYK/4Esn8At4UXoMKcgHowHbQbTWUqYw/GbscHeb+0RrxDu8vfr31ZsaFbF2FY8iv8/fQh/On0lR
	IKb8RwC5vv/D8bgsVh7nDIlqZX/bjIalb2cmlbnXWQy+uYjbfAdxzjR5B0kjHO2NSJoWFcujbtS+7
	sU6dw+rjv+NAqmaqtPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tce2Y-000000049EF-2hSD;
	Tue, 28 Jan 2025 05:21:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhy-000000044nK-3vOC
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so9698648a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040418; x=1738645218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5NF+IAT/KmspwMK0FGMQwrWJIha2MiTbZ1WzqIdfAY=;
        b=hVwySMqY16VfoL/yMJkbYpGkDHpMXRfiZl6qpXQs6BbHjaKszAZPqCU9X0ZzLOwAh0
         PJU9PsIgYes4ShscFI6AXez6/WwZrAzLpfKQN/4czCe8hRGa7K+JA3qVFGgU+B2gk4T2
         t/wPXFbK4yA+POsN4GIiE9ZXZMF0cpvMORRmjdyAOh3987ZHXSdLkn5iWgxh3n+3hjvy
         UVTEqT3OomneIM5zvS27P3QEYI0hDSZaq24o0C3ZIKpJB1Z/yAXVVj6jng98/Yb/VZCG
         rdtuO3yMzYSj3USaY5t7L/XxND4SHJkvbc8OfUbWINv5AU812yrMLF7DfqO7NJh6LYxr
         ckHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040418; x=1738645218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5NF+IAT/KmspwMK0FGMQwrWJIha2MiTbZ1WzqIdfAY=;
        b=Sn/2RaW5RsrrzQxBXSK81nks61BFrDsZ8aMwstlzCkJfBQG0UaXkQNIwsXXhePWdQp
         p74XETLjFiWbpz55LTeM3FXwNZZPT41wizLtSEYqiFvYnkEqXA1EQnJBRHV4bFg5hx0Z
         mP3jttsWYUpZHCBq5lix4KDF2jvWZEOf5JAkng6lKqzBrpybrM4YDwW5VGa3f62LU8c7
         2cauUpvXp3eMs/s6D4gYOogq/Pkp4YMkCTnodZl10PgKMoegrhel9MruajjFxQzDmQCh
         JyEf8+2UwCjnEh8uY+fOCT2EYgQeG22bKU8MChiyN46fvgLtIkFvrTDOsPNHk851DP41
         CQBA==
X-Forwarded-Encrypted: i=1; AJvYcCW2TRrOTAaXmtTkwBUwa2SEzihKnYd7LTYsR8fSABjCYeGr3BrS5vqUKG+kX7ufOTaWZ48Ww06qPAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkdPdKrxjgIW7Aq768K2Ln2r7+QvzykZ08HnABFL3Myxlgaso6
	LmJ5pFL8Bs36K2rBd4KWJZCwFmFYdYu1Oo4oswytZVcLn1qWem2TJyg+BUkm03w=
X-Gm-Gg: ASbGncs4xtIIyy43YduujpWqFtDCfykSODvIfSrIvrPCYFih+DFH1J9UesOtSi8ddA/
	W3j7HNNH4Ui7bVs5lZwaRrGH6EqONrKVJn/VibTsBeotHW8zyurshS9TehG14OQ0yN27Y7vY1m6
	+uJKY1ylc5h2NRmYdf3Ski0yxrR6Q2sQeqFdm0MyiN6UWumnKNVf/zvdq1YHXg6dVBvY/mbOkRs
	K6atRJ7lrH6uDkKXDQy8DiU7mFU7EQYmaUvP5fv9yNxmGDEdG90Hn0CjyFYU3vya8tI4/9VYmOD
	z0+a/6Ofzwyeru1KqcdehwyXtYSeC3jmWWt6G10=
X-Google-Smtp-Source: AGHT+IH6k4v2G1ElxeZAZKnP2qHihpfZzn6nd2gCpEPf3NHDHrL/Cp1+5uWagHMGSZOAiqHrlZzQ2w==
X-Received: by 2002:a17:90a:f950:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2f82c076328mr3187299a91.14.1738040418390;
        Mon, 27 Jan 2025 21:00:18 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:18 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:59 -0800
Subject: [PATCH v3 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-18-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210019_075769_04FCE55D 
X-CRM114-Status: GOOD (  13.19  )
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

Qemu virt machine supports a very minimal set of legacy perf events.
Add them to the vendor table so that users can use them when
counter delegation is enabled.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/vendorid_list.h |  4 ++++
 drivers/perf/riscv_pmu_dev.c           | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..ef22b03552bc 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,4 +9,8 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#define QEMU_VIRT_VENDOR_ID		0x000
+#define QEMU_VIRT_IMPL_ID		0x000
+#define QEMU_VIRT_ARCH_ID		0x000
+
 #endif
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 055011f07759..db4a61fac838 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -26,6 +26,7 @@
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendorid_list.h>
 #include <asm/vendor_extensions/andes.h>
 #include <asm/hwcap.h>
 #include <asm/csr_ind.h>
@@ -384,7 +385,42 @@ struct riscv_vendor_pmu_events {
 	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
 	  .attrs_events = _attrs },
 
+/* QEMU virt PMU events */
+static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
+	PERF_MAP_ALL_UNSUPPORTED,
+	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
+	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
+};
+
+static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
+						[PERF_COUNT_HW_CACHE_OP_MAX]
+						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+	PERF_CACHE_MAP_ALL_UNSUPPORTED,
+	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
+	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
+
+	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
+};
+
+RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
+
+static struct attribute *qemu_virt_event_group[] = {
+	RVPMU_EVENT_ATTR_PTR(cycles),
+	RVPMU_EVENT_ATTR_PTR(instructions),
+	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
+	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
+	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
+	NULL,
+};
+
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
+	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
+				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
+				qemu_virt_event_group)
 };
 
 const struct riscv_pmu_event *current_pmu_hw_event_map;

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
