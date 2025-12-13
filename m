Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DADAD5B154
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nCWPz2Woq0DOZvUhpLZ5+DEs/cIa6NoukHi2UwLDxw=; b=W+DEeU7MlBZN6b
	pAFtV79sORdNiXyuHeEsbZPPLBnv9N6cVFb4eTLl8w6rYgELH8gSmKVPTywnKzor3hwCV4Hto7rzx
	J94+Prjrw69QRrfEfG7P80ea126rCQaVRYQeF6AhsC81HCSEwLbYkqADs1R2KLBy9mVgn+bCm0aZ9
	iWerBKLOU5VU4TOOWL3FYenabKAdCV6BmiljAaV2kHVMirzjamTAEyNjtNjU2m1/8TsEEWx8XyRK/
	resqFOVkBsuCdGICaJ+agqHNANeFAij/mmpfcZFBG5wXpqhZWN0gnUcLbhs3bL3clbuxBx4Txftbt
	xJ8UWEMb/ce5Q5ru9f6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFG-00000001ifd-3szR;
	Sat, 13 Dec 2025 15:09:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFD-00000001ieG-0V0k
	for kvm-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 15:09:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29f30233d8aso16368555ad.0
        for <kvm-riscv@lists.infradead.org>; Sat, 13 Dec 2025 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765638554; x=1766243354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmDAR6Bn9JvT49nuZwllh+G0QriEIJ4NSotf6lGYgHk=;
        b=R17BnS+v85VmzA05bUQ1B31OqTCbdsLIFI8P4kMGuunx3NbEnYSSL//RgRdGXPvD6i
         vigW0wpvXGoKhYApO/x7OhkDIRQzf7288/C2EJergktqDEGBtw5xkctHKsOoGjjmau9X
         WBEFwpVR37iLbw6SOTpu5CfL+uI8tiEMsrPJJRPeLWiFP6j0YJLwns9fs6HCeLB7suBU
         GbvwP9VNSGA7hvZzYK96heeWthv40h5Zzhpzb7H60zxSwHEf7pe1/EYWNOqmkrJzF7PV
         +c6zYOobO69cIywklzyhzOaKoMy1s7Ixz87i32/9V1Iou7/O4/8MoHq7MLm0qAw0uTNQ
         fLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765638554; x=1766243354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmDAR6Bn9JvT49nuZwllh+G0QriEIJ4NSotf6lGYgHk=;
        b=Oa38pl5Xz5566aM7cyWtETedKVER0agLf2BKmPhOJh9uJIdJT4VsXvRvTzn0uia8aX
         dLM0DIAEwBI4MFDxlvUvTUfls/O0+IyBWK6ae/EVV/yJlXb5dnXTRmzZufvTv0ftIfUY
         Ym5mUHn7sX7iVKY36zsjHlG1zm4bf+vCCJQDl8WY1duf43O4lnl6/qTDYEh48ZfyiMqy
         Xt6CLeoYGQX1WJHlr6SRIDDqXhG9mq2wTa9AFdbbnD2MZZHDs1pOdsk4zjrHPeLm3pY6
         QvJIzQgxHRwspJBpNcEX86cIqg6Kfe3aElBUiK1EfOf1fN+aOMmuhpy+Wl3golpgsPW8
         5W9w==
X-Forwarded-Encrypted: i=1; AJvYcCWUcEBYMWlCB4u569LXPtW6p4TvXiQKX2mRr2QJ+1gujeZMqK017hCikC3jF4ECqA7uogC9vLWQ/k0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm3IioL/yPwfdUVsEItbiWYHLAeRwpXI9WtJ+OfoycQBGZlTHK
	4ZA4PvK6Fp7re3Xe1uh9pFw8UZfciTaDOXwa8TMGx75qZtuKoRJ57Y6/
X-Gm-Gg: AY/fxX4qaFBA6YIbrEjM+8OkCrmPOeJB3oeKSiOVP3ROpd+/N18AIuE8yFSP3lIdokM
	Kj7yzJTl4WL51jdyAhox+Q+L7Ckg2w7omcteasJYeXmx9HpZeekpMOXetjsSPSUngivndv0P8eE
	jpaomVR+XzPeJlDhoi8lb+SGdklPiqF+4D3kazXHrMGp8fE942U2nO5wnNqG16y7/jIjfqaBBkv
	WEoU4FHvJMMvyTHVoJ+olwhYbWSefaPA5fLHiFtSA2N18pXv+PU7ymqNLPW144rV0vdaFMU7QPE
	gL0EzJ1458sPKaXwEY4lmyueACmmvsqogfMOPSJ4OsPfz+bTGrd6WJzyoWi0NvDdJV22Na4aspJ
	nYx41y7MHyUwzIsRdsedM2P3DmylbBb0Xxrap8OSuvLOp4Fm8uHxUUGBp1hTUbIE/iF4CN9SEQL
	08zZ81CU98Tv/eyIo+
X-Google-Smtp-Source: AGHT+IFRYLtmyJngjzSbWKBjUVfP4Wi/Qy+oiDqp2kwr34xj2mRB5StpR9CMC0oxckv+BkwV32PM5w==
X-Received: by 2002:a17:902:c94a:b0:298:648a:f96a with SMTP id d9443c01a7336-29f23d409ffmr50790565ad.61.1765638554178;
        Sat, 13 Dec 2025 07:09:14 -0800 (PST)
Received: from JRT-PC.. ([111.94.32.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm85494715ad.59.2025.12.13.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 07:09:13 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [kvm-unit-tests PATCH 3/4] lib: riscv: Add SBI PMU helper functions
Date: Sat, 13 Dec 2025 23:08:47 +0800
Message-ID: <20251213150848.149729-4-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213150848.149729-1-jamestiotio@gmail.com>
References: <20251213150848.149729-1-jamestiotio@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_070915_326688_843FA981 
X-CRM114-Status: GOOD (  18.75  )
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

Add some helper macros to handle event types and codes and some helper
functions to access the FDT. These will be used by the SBI tests.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 riscv/Makefile      |   1 +
 lib/riscv/asm/pmu.h | 167 +++++++++++++++++++++++++++++++++++++++++++
 lib/riscv/pmu.c     | 169 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 337 insertions(+)
 create mode 100644 lib/riscv/asm/pmu.h
 create mode 100644 lib/riscv/pmu.c

diff --git a/riscv/Makefile b/riscv/Makefile
index 64720c38..c0dd5465 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -42,6 +42,7 @@ cflatobjs += lib/riscv/delay.o
 cflatobjs += lib/riscv/io.o
 cflatobjs += lib/riscv/isa.o
 cflatobjs += lib/riscv/mmu.o
+cflatobjs += lib/riscv/pmu.o
 cflatobjs += lib/riscv/processor.o
 cflatobjs += lib/riscv/sbi.o
 cflatobjs += lib/riscv/setjmp.o
diff --git a/lib/riscv/asm/pmu.h b/lib/riscv/asm/pmu.h
new file mode 100644
index 00000000..8bb5e3e9
--- /dev/null
+++ b/lib/riscv/asm/pmu.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_PMU_H_
+#define _ASMRISCV_PMU_H_
+
+#include <libcflat.h>
+#include <asm/csr.h>
+
+#define SBI_PMU_HW_CTR_MAX				32
+
+#define SBI_EXT_PMU_EVENT_IDX_TYPE_OFFSET		16
+#define SBI_EXT_PMU_EVENT_IDX_TYPE_MASK			(0xF << SBI_EXT_PMU_EVENT_IDX_TYPE_OFFSET)
+#define SBI_EXT_PMU_EVENT_IDX_CODE_MASK			0xFFFF
+
+#define SBI_EXT_PMU_EVENT_HW_CACHE_OPS_RESULT		0x1
+#define SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_MASK		0x6
+#define SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_OFFSET	1
+#define SBI_EXT_PMU_EVENT_HW_CACHE_ID_MASK		0xFFF8
+#define SBI_EXT_PMU_EVENT_HW_CACHE_ID_OFFSET		3
+
+#define SBI_EXT_PMU_CFG_FLAG_SKIP_MATCH			(1 << 0)
+#define SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE		(1 << 1)
+#define SBI_EXT_PMU_CFG_FLAG_AUTO_START			(1 << 2)
+#define SBI_EXT_PMU_CFG_FLAG_SET_VUINH			(1 << 3)
+#define SBI_EXT_PMU_CFG_FLAG_SET_VSINH			(1 << 4)
+#define SBI_EXT_PMU_CFG_FLAG_SET_UINH			(1 << 5)
+#define SBI_EXT_PMU_CFG_FLAG_SET_SINH			(1 << 6)
+#define SBI_EXT_PMU_CFG_FLAG_SET_MINH			(1 << 7)
+
+#define SBI_EXT_PMU_START_SET_INIT_VALUE		(1 << 0)
+#define SBI_EXT_PMU_START_FLAG_INIT_SNAPSHOT		(1 << 1)
+
+#define SBI_EXT_PMU_STOP_FLAG_RESET			(1 << 0)
+#define SBI_EXT_PMU_STOP_FLAG_TAKE_SNAPSHOT		(1 << 1)
+
+#define SBI_EXT_PMU_HPM_COUNTER_CASE(n)			\
+	case CSR_HPMCOUNTER##n:				\
+		return csr_read(CSR_HPMCOUNTER##n)
+
+enum sbi_ext_pmu_ctr_type {
+	SBI_EXT_PMU_CTR_TYPE_HW = 0,
+	SBI_EXT_PMU_CTR_TYPE_FW,
+};
+
+union sbi_ext_pmu_ctr_info {
+	unsigned long value;
+	struct {
+		unsigned long csr:12;
+		unsigned long width:6;
+#if __riscv_xlen == 32
+		unsigned long reserved:13;
+#else
+		unsigned long reserved:45;
+#endif
+		unsigned long type:1;
+	};
+};
+
+#define get_cidx_type(x) \
+	(((x) & SBI_EXT_PMU_EVENT_IDX_TYPE_MASK) >> SBI_EXT_PMU_EVENT_IDX_TYPE_OFFSET)
+
+#define get_cidx_code(x) (x & SBI_EXT_PMU_EVENT_IDX_CODE_MASK)
+
+#define get_cidx_cache_id(x) \
+	(((get_cidx_code(x)) & SBI_EXT_PMU_EVENT_HW_CACHE_ID_MASK) >> SBI_EXT_PMU_EVENT_HW_CACHE_ID_OFFSET)
+
+#define get_cidx_op_id(x) \
+	(((get_cidx_code(x)) & SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_MASK) >> SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_OFFSET)
+
+#define get_cidx_result_id(x) \
+	((get_cidx_code(x)) & SBI_EXT_PMU_EVENT_HW_CACHE_OPS_RESULT)
+
+#define set_cidx_type(x, t) \
+	((x) = ((((x) & ~SBI_EXT_PMU_EVENT_IDX_TYPE_MASK) | \
+		((((unsigned long)(t)) << SBI_EXT_PMU_EVENT_IDX_TYPE_OFFSET) \
+		& SBI_EXT_PMU_EVENT_IDX_TYPE_MASK))))
+
+#define set_cidx_code(x, c) \
+	((x) = ((((x) & ~SBI_EXT_PMU_EVENT_IDX_CODE_MASK) | \
+		(((unsigned long)(c)) & SBI_EXT_PMU_EVENT_IDX_CODE_MASK))))
+
+#define set_cidx_cache_id(x, id) \
+	(set_cidx_code((x), (((get_cidx_code(x)) & ~SBI_EXT_PMU_EVENT_HW_CACHE_ID_MASK) | \
+		((((unsigned long)(id)) << SBI_EXT_PMU_EVENT_HW_CACHE_ID_OFFSET) \
+		& SBI_EXT_PMU_EVENT_HW_CACHE_ID_MASK))))
+
+#define set_cidx_op_id(x, op) \
+	(set_cidx_code((x), (((get_cidx_code(x)) & ~SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_MASK) | \
+		((((unsigned long)(op)) << SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_OFFSET) \
+		& SBI_EXT_PMU_EVENT_HW_CACHE_OPS_ID_MASK))))
+
+#define set_cidx_result_id(x, res) \
+	(set_cidx_code((x), (((get_cidx_code(x)) & ~SBI_EXT_PMU_EVENT_HW_CACHE_OPS_RESULT) | \
+		(((unsigned long)(res)) & SBI_EXT_PMU_EVENT_HW_CACHE_OPS_RESULT))))
+
+static inline uint64_t pmu_get_cycles(void)
+{
+	return csr_read(CSR_CYCLE);
+}
+
+static inline uint64_t pmu_get_instret(void)
+{
+	return csr_read(CSR_INSTRET);
+}
+
+static inline uint64_t pmu_get_counter(unsigned long csr)
+{
+	switch (csr) {
+	case CSR_CYCLE:
+		return pmu_get_cycles();
+	case CSR_INSTRET:
+		return pmu_get_instret();
+
+	SBI_EXT_PMU_HPM_COUNTER_CASE(3);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(4);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(5);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(6);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(7);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(8);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(9);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(10);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(11);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(12);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(13);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(14);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(15);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(16);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(17);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(18);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(19);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(20);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(21);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(22);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(23);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(24);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(25);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(26);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(27);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(28);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(29);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(30);
+	SBI_EXT_PMU_HPM_COUNTER_CASE(31);
+
+	default:
+		__builtin_unreachable();
+	}
+}
+
+struct sbi_ext_pmu_hw_event {
+	uint32_t counters;
+	unsigned long start_idx;
+	unsigned long end_idx;
+};
+
+struct sbi_ext_pmu_test_ctr {
+	int ctr_idx;
+	unsigned long eid;
+};
+
+int sbi_ext_pmu_get_counters_for_hw_event(unsigned long event_idx);
+int sbi_ext_pmu_get_first_counter_for_hw_event(unsigned long event_idx);
+int sbi_ext_pmu_get_first_unsupported_hw_event(int ctr_idx);
+struct sbi_ext_pmu_test_ctr sbi_ext_pmu_get_candidate_hw_counter_for_test(void);
+void sbi_ext_pmu_add_hw_event_counter_map(u32 event_idx_start, u32 event_idx_end, u32 ctr_map, int i);
+void fdt_pmu_setup(void);
+void fdt_pmu_free(void);
+
+#endif /* _ASMRISCV_PMU_H_ */
diff --git a/lib/riscv/pmu.c b/lib/riscv/pmu.c
new file mode 100644
index 00000000..7bbd8221
--- /dev/null
+++ b/lib/riscv/pmu.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#include <alloc.h>
+#include <libcflat.h>
+#include <devicetree.h>
+#include <asm/sbi.h>
+#include <asm/pmu.h>
+
+static struct sbi_ext_pmu_hw_event *hw_event_map;
+
+int sbi_ext_pmu_get_counters_for_hw_event(unsigned long event_idx)
+{
+	int i;
+
+	if (!hw_event_map)
+		return -1;
+
+	for (i = 0; i < SBI_PMU_HW_CTR_MAX; i++) {
+		if (hw_event_map[i].start_idx <= event_idx &&
+		    hw_event_map[i].end_idx >= event_idx) {
+			return hw_event_map[i].counters;
+		}
+	}
+
+	return -1;
+}
+
+int sbi_ext_pmu_get_first_counter_for_hw_event(unsigned long event_idx)
+{
+	int i, counters = sbi_ext_pmu_get_counters_for_hw_event(event_idx);
+
+	if (!hw_event_map || counters < 0)
+		return -1;
+
+	for (i = CSR_HPMCOUNTER3 - CSR_CYCLE; i < SBI_PMU_HW_CTR_MAX; i++) {
+		if (counters & (1U << i))
+			return i;
+	}
+
+	return -1;
+}
+
+void sbi_ext_pmu_add_hw_event_counter_map(u32 event_idx_start, u32 event_idx_end, u32 ctr_map, int i)
+{
+	assert(event_idx_start <= event_idx_end);
+
+	hw_event_map[i].counters = ctr_map;
+	hw_event_map[i].start_idx = event_idx_start;
+	hw_event_map[i].end_idx = event_idx_end;
+
+	assert(get_cidx_type(hw_event_map[i].start_idx) == SBI_EXT_PMU_EVENT_HW_GENERAL
+	       || get_cidx_type(hw_event_map[i].start_idx) == SBI_EXT_PMU_EVENT_HW_CACHE);
+	assert(get_cidx_type(hw_event_map[i].end_idx) == SBI_EXT_PMU_EVENT_HW_GENERAL
+	       || get_cidx_type(hw_event_map[i].end_idx) == SBI_EXT_PMU_EVENT_HW_CACHE);
+}
+
+int sbi_ext_pmu_get_first_unsupported_hw_event(int ctr_idx)
+{
+	int i, j, k;
+	unsigned long candidate_eid = {0};
+
+	if (!hw_event_map)
+		return -1;
+
+	for (i = SBI_EXT_PMU_HW_CPU_CYCLES; i <= SBI_EXT_PMU_HW_REF_CPU_CYCLES; i++) {
+		set_cidx_type(candidate_eid, SBI_EXT_PMU_EVENT_HW_GENERAL);
+		set_cidx_code(candidate_eid, i);
+
+		if (sbi_ext_pmu_get_counters_for_hw_event(candidate_eid) < 0)
+			return candidate_eid;
+	}
+
+	for (i = SBI_EXT_PMU_HW_CACHE_L1D; i <= SBI_EXT_PMU_HW_CACHE_NODE; i++) {
+		for (j = SBI_EXT_PMU_HW_CACHE_OP_READ; j <= SBI_EXT_PMU_HW_CACHE_OP_PREFETCH; j++) {
+			for (k = SBI_EXT_PMU_HW_CACHE_RESULT_ACCESS; k <= SBI_EXT_PMU_HW_CACHE_RESULT_MISS; k++) {
+				set_cidx_type(candidate_eid, SBI_EXT_PMU_EVENT_HW_CACHE);
+				set_cidx_cache_id(candidate_eid, i);
+				set_cidx_op_id(candidate_eid, j);
+				set_cidx_result_id(candidate_eid, k);
+
+				if (sbi_ext_pmu_get_counters_for_hw_event(candidate_eid) < 0)
+					return candidate_eid;
+			}
+		}
+	}
+
+	return -1;
+}
+
+struct sbi_ext_pmu_test_ctr sbi_ext_pmu_get_candidate_hw_counter_for_test(void)
+{
+	struct sbi_ext_pmu_test_ctr test_ctr = {0};
+	int i, j, k, ctr_idx;
+
+	if (!hw_event_map)
+		return test_ctr;
+
+	unsigned long candidate_eid = {0};
+
+	for (i = SBI_EXT_PMU_HW_CPU_CYCLES; i <= SBI_EXT_PMU_HW_REF_CPU_CYCLES; i++) {
+		set_cidx_type(candidate_eid, SBI_EXT_PMU_EVENT_HW_GENERAL);
+		set_cidx_code(candidate_eid, i);
+		ctr_idx = sbi_ext_pmu_get_first_counter_for_hw_event(candidate_eid);
+
+		if (ctr_idx >= 0) {
+			test_ctr.ctr_idx = ctr_idx;
+			test_ctr.eid = candidate_eid;
+			return test_ctr;
+		}
+	}
+
+	for (i = SBI_EXT_PMU_HW_CACHE_L1D; i <= SBI_EXT_PMU_HW_CACHE_NODE; i++) {
+		for (j = SBI_EXT_PMU_HW_CACHE_OP_READ; j <= SBI_EXT_PMU_HW_CACHE_OP_PREFETCH; j++) {
+			for (k = SBI_EXT_PMU_HW_CACHE_RESULT_ACCESS; k <= SBI_EXT_PMU_HW_CACHE_RESULT_MISS; k++) {
+				set_cidx_type(candidate_eid, SBI_EXT_PMU_EVENT_HW_CACHE);
+				set_cidx_cache_id(candidate_eid, i);
+				set_cidx_op_id(candidate_eid, j);
+				set_cidx_result_id(candidate_eid, k);
+				ctr_idx = sbi_ext_pmu_get_first_counter_for_hw_event(candidate_eid);
+
+				if (ctr_idx >= 0) {
+					test_ctr.ctr_idx = ctr_idx;
+					test_ctr.eid = candidate_eid;
+					return test_ctr;
+				}
+			}
+		}
+	}
+
+	return test_ctr;
+}
+
+void fdt_pmu_setup(void)
+{
+	const void *fdt;
+	int i, pmu_offset, len;
+	const u32 *event_ctr_map;
+	u32 event_idx_start, event_idx_end, ctr_map;
+
+	assert_msg(dt_available(), "ACPI not yet supported");
+
+	fdt = dt_fdt();
+
+	pmu_offset = fdt_node_offset_by_compatible(fdt, -1, "riscv,pmu");
+	assert(pmu_offset >= 0);
+
+	event_ctr_map = fdt_getprop(fdt, pmu_offset, "riscv,event-to-mhpmcounters", &len);
+	if (event_ctr_map) {
+		len = len / (sizeof(u32) * 3);
+		hw_event_map = calloc(len, sizeof(struct sbi_ext_pmu_hw_event));
+		for (i = 0; i < len; i++) {
+			event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
+			event_idx_end = fdt32_to_cpu(event_ctr_map[3 * i + 1]);
+			ctr_map = fdt32_to_cpu(event_ctr_map[3 * i + 2]);
+			sbi_ext_pmu_add_hw_event_counter_map(event_idx_start, event_idx_end, ctr_map, i);
+		}
+		report_info("added %d hw event counter mappings", len);
+	}
+}
+
+void fdt_pmu_free(void)
+{
+	if (hw_event_map) {
+		free(hw_event_map);
+		hw_event_map = NULL;
+	}
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
