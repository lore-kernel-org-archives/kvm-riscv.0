Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B99FE77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ3S2YkC9J9Shxjr4BcLfLy0mk3Idj1v1OlEAlJ7Tcg=; b=p50FdHVEefwbxd
	HcO12Rh/fPwg1l3HxabUu3ntu88yGPEQCdWwkHeR4vVjAOn61PoiJ9U1LZ7KZURJsuHPyrZFF7FQu
	jYUGyG2BhMDupWBHDRoG/N2JBV0aTxG/bYdKW+yNRrim4miA8GDMowUlCiupsCadXb5pvSKKKXP81
	ztlwLLHKXLunovJkyC+0w+TAAalximJKNwYbAK4DlakbPnJgOEZe89hBAoaKMQENp57V+RLCv+Jc/
	SieaQajLkneW3J6pb9/5++2v3wcqRRsfSEHweFUqCdscxOYYnUTd0ZfHovn+Yjwr5JwDpMBgKmdJj
	4bFTMxwQPiOOHU/fpRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKh-0000000ACv2-16R0;
	Wed, 15 Jan 2025 00:32:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps2-0000000A0BK-1l8L
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2163dc5155fso111553465ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895530; x=1737500330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qntZYbhhaPOyc0opQ/xzbCXT2UPDrjgDrjtXnzGv1Lc=;
        b=yel4Nch0JsHvpgFFT0JMkev+v/SDgwjxVtbKeQDWvaW4ACzvKai5WxT86tzjEaK0j9
         qGh9hDNDbJU+HkU+bE5UlS4e00LCBPMrRUAa0je31dwXQEGNUDwPbQ8nbLUZ5EbGwSvd
         Uqz7JonKdc3XGhBnXCk+qwXL+Yg4j6t8F5EKnlA0qhNA/sM69XkUn1rs/v9HlxDNBgp1
         sduHHD+04IRt0kXu1Rgsl9D+e2Bp/+o5jsIDGZekzVX5RYtQCsSGC0tnh15UPNzz/WCX
         o6KW/HJxJEwO9uvDaBPqd2sSqjQ3Pky3AV0F/cjpFI+z34CMBLiG6JiGZoEDaxXwgaIV
         v3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895530; x=1737500330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qntZYbhhaPOyc0opQ/xzbCXT2UPDrjgDrjtXnzGv1Lc=;
        b=NZQT29ZI69bYKaCddV1Kd+KOEVqYNUpmlaGIcjtKCXXLl5I4EDNjzwgK09dkTnIwyU
         QRn0j5zuhl+flqLvEPkU9LpwuEuLMs+rl3w7sxysIIdLRRKMT9YgI4hEEQhufopib8hi
         OhW3g0JS7vEHJ7iPeHZxipzDDaZA4jZGwdOGqqwlk54ZvT33U2qI/Uy38RE0DLLmoKGG
         HXucDUk579cLaxxIpB5k7/5YexClUNk8JKAco8mdZhDyvM1fEZziOyslD1sYAsuq52Sc
         4yK2qLt0Kz+oshkrpmMnVZe4ZCzb5Rq03BKhzAwq8LbKDH3qBDgZrYsd9c+I3nn8PM3z
         SxTg==
X-Forwarded-Encrypted: i=1; AJvYcCXOLqxZSwK0KdqUfoRfYV4HQCQfmYVYrL6VxBzGefTJr7hg6BGJmpjEqSu5y2uIfYX3yLibtjI2OWs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDJ5ob5bs9I2P4CIPs1asVTvM2H5cCoPNK1zZ888tE+gGgz+vT
	c5l7X5wb15eppDGtBFx1RDmO9gpvgzFFAD1UsSgnSY7lPdGlcJgnv/ws6GMBDRI=
X-Gm-Gg: ASbGncuPxhEI36AtQZAG95W3P1ewfMHUtVTi+8ZxItHafSste1V+86PkBSHnMeXHfI4
	8D/xWJHnnVw2PrUby+6XgB7cWmErDtorQ1+5z2WOr/kfA+h7QNYKLnKqwLuzUoeZ8VDSayGC5TR
	/zXTAZUr/4Pgx2zjcqRs6zNo/OBHQAQZsLsjjRmTde5L8vA/BstcE9JhfZMUbL2NqC6knJwIOpC
	rWFHVOor+rUA0UkiaMh496mCtqnPPj9NOXuh9I1nhCm8IUx6DrAnkVHlp7ZxQZKzJAyQQ==
X-Google-Smtp-Source: AGHT+IGvBxZa4fPYf8i5v/l3b33jLbUOvTwVMUDT5oDU8+c/I1Eb7QvrJXcdFBnuK94wX8xRhTTgmw==
X-Received: by 2002:a17:902:ecc5:b0:216:45eb:5e4d with SMTP id d9443c01a7336-21a83f4b29dmr369677175ad.6.1736895529901;
        Tue, 14 Jan 2025 14:58:49 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:49 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:43 -0800
Subject: [PATCH v2 18/21] RISC-V: perf: Add Qemu virt machine events
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-18-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145850_546986_BF315254 
X-CRM114-Status: GOOD (  12.72  )
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
index 8c5598253af0..d28d60abaaf2 100644
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
