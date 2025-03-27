Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE589C36013
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc/ctCYEfpCtljvRl9ebaOAA3lrrueGSG5iNnS0yYSk=; b=rVg7FOxaXUxbVm
	f6gtd3IglkRUh8til+FdrmPOCVetjCHQ+G1jAnTpxzxGFBAcLGOcn4eFzYQcrLx1cy0SxH2X9cnZF
	md7NkeK60vaQyyuW9+rnZ55aLDHrrwC2Ckq+7+4Lxl5ogQv+ScNLCNB8wQ6Umx+TnyguHAQ3RM8mh
	PWLFerSc+gcxmjrTqjV77Z2IhAcsQuSzTwYNZqy2p+BcNtxjuoWEXmPj7wgrllEuW1cNO8S4QVC5A
	GXzRVXma9iZEvjeoQti7aXOkLP+RmiKJr4bochQWWBQfqtY5+pbuha7enHeLOKgeMss8UJ5Jd+RRN
	+RhUnfQLGpyjmdhHK/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtUx-0000000Bvj2-26JI;
	Thu, 27 Mar 2025 20:06:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1t-0000000BpsD-3rQZ
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso3964143a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104201; x=1743709001; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKAfCqQ7Qjy4MJYkAdCHV9zfU4kl+sMGOwwGVOQa3Ms=;
        b=ql+sORbg4ad08+K0hcP/WFo7pRjpRK8oLdsgEfyntrSkxgiVN6htInp8/DY5MRzTCj
         pnThLm6a1x1XHjTEFL624QEoHtaPj2yOGPGDrswlTzaE+S4hg8akF5CVnZvOHyqkDRQk
         DU+YRD7INeKacKR17m3Ap1eppa2dN1esnQ+GtCjMzY/1nnH17nFKy+NDZhFxbiKngStz
         43mzoQu4smxV2McRYTcN/dWnBmmWjLWrjBEMpLl58tPBLINK137GGw8zup3HK0PQMT4R
         0FAuAMARTsP5Fyg/pyZX3p4E3voNN3z8imJ5mtuGkjr6vkYRChrKS++JG6ler8za1c3W
         a0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104201; x=1743709001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKAfCqQ7Qjy4MJYkAdCHV9zfU4kl+sMGOwwGVOQa3Ms=;
        b=e118lQ38DdKeFpHBtu+TLL0YDRpRuMxDB2B8rgALtaACRvJwQOFMC22j6ErWhEIOAQ
         JTBzpe8+BSmIdShNiRS1B5z6ReLIpfm/slRRsjJyWggHvN30YOeJcwHwGZ6Uo7OXFwoA
         MGQxUwk2VWYHoB04BgbsEB3X8UZosSxO5sf0vIe0p+z3jxXz8ZSjoShchgzW1rgpjcrQ
         6pRQevPlISW1YW/Oq/xg1Gvqu2qyZJbJcC8w2ae8IM8JiSsEmxVaKF1tzWYxadlrAAVF
         KtgIO8gFHp+4ezlqWYL7UWGsjecymvjQF4AkU86fEKeT0kQ0rzEh6GpHDK+QLG9i+KZg
         960g==
X-Forwarded-Encrypted: i=1; AJvYcCW2D8KsGWGJAA/EJiXhBDkJn69rE+LZCIN7uCf3sEtPTCoimMHL9dX/l9F72+anD45mFkeELV+Aanw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcb2U3IpP1GsYMdybNVzvZum1cFZzv6FHAiXsl0rcrmiDXAvB
	xSHWuBzMtOCqmR/ckb8F2OYteu7PWQdcIrARcNeBbn5euW4Oq97/iDNLHA/dTN4=
X-Gm-Gg: ASbGncvo+2j4dY1k7ZGZseFHjescwPaBKMnHpfi1Tp8wGn0Jmtl2qyqKOyLzeGkPzoB
	+NUJeSQZ75OkpIEL8Kvw71RiRWUacQ9W6RwBmlA52KisAUqyuJ5yVkdg/ocWkf5NXBHWKx7fFvK
	uanYi/x1q9kAXaTzGxcPY9oIgKoKCb1Xbe50vaKBX/LlhcfbjWLNi5vMiAS0iQmSgQFRhKstH3Q
	mQyHZwm1gm2s9ATnxhZ+Kwqsgg/5lmmG4c5k3c7iC0fDBOyzXWx50zudOiRuaLYeuXTHohFcGma
	/LGVM4YLvbNHCPemVOmuuSAerQWv25M0JZp7KLsA19GP7apsv484MGtTrg==
X-Google-Smtp-Source: AGHT+IHMf2f5UBv5DVE142wh0oBPFx9moUIGj7INCFxWN59jTOUXk2pfw5aEvm/YJFqWLspysjUW3w==
X-Received: by 2002:a17:90a:dfc7:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-3051c85e607mr159363a91.3.1743104201222;
        Thu, 27 Mar 2025 12:36:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:59 -0700
Subject: [PATCH v5 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123642_043745_77285F09 
X-CRM114-Status: GOOD (  12.31  )
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
index a5150cdf34d8..0eefc844923e 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -10,4 +10,8 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
+#define QEMU_VIRT_VENDOR_ID		0x000
+#define QEMU_VIRT_IMPL_ID		0x000
+#define QEMU_VIRT_ARCH_ID		0x000
+
 #endif
diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 8a079949e3a4..cd2ac4cf34f1 100644
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
@@ -391,7 +392,42 @@ struct riscv_vendor_pmu_events {
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
