Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1146D59F76
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLQOhmMru0jX6o8emGTR3rPGo5186OuWoFdB9vPh9yo=; b=xCW7kKcSo79urV
	tL8FsN8PymgjhLiQL6HgEvl/3xxu4E13G1Ay/9+MUgRVUjcDsC3yLPutup1YDvvLZj9U0NRMlrumb
	/cQcz8Lc2zi2RwKkkwPTxUgQyeXo026fPRJ3bo4OlepMRkEBQoNcePG811Cw9aMHHl4xrEQB9+tPL
	mkNW8O+vHuALN1LuMs+NPGVcYULPb4yN4l6OY9IpeP2GCO3pIzie8h5Hmqt76j8wUi4JQ9MjhfWOt
	fzGjBxjyKXJwLavjEMLDSQA5kRNkhQqzbUZM3dzuueszlyPax+gH5y2Wv/g6N6EYh61q+AvpKUJKT
	plI2XMuJ7e/26Bqjl5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFN-00000001ihO-1IGq;
	Sat, 13 Dec 2025 15:09:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFF-00000001ifQ-1vyW
	for kvm-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 15:09:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-299d40b0845so31454225ad.3
        for <kvm-riscv@lists.infradead.org>; Sat, 13 Dec 2025 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765638557; x=1766243357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHF+94AX9IsJfwresP4VoZ0BFogumn+V5OleWUNGOrE=;
        b=jOPMY7LsdKu61DTEQEpjG3vNVhIO6zMCE06SpwzOD1iwBEETMUNq109NCN5kzCXT4L
         3vXaI6wb4wzaQKHLLuWoIoraxvvRMN30XIm637NN9T67jugAOGrnxRGDJUHx2szzundR
         I3u5eximc3bCzZHg3p2z+ygIJUuq5N4IAwOoxwbkxmF0Wm42Pp2jn9miZn6qstY+s2Fw
         tGWIcClVItfKTGFgTZItlURHRRoEfU8B7CNZ1vpvWAkIDAAYswnfMsA3AgmJKcElpaXQ
         mnPA2PuBcIe6qngwlcMkTxmyzPC5xBrcH6k/6M7P5iJzLse3HSiNIFtJghNzXko8ITVB
         E/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765638557; x=1766243357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YHF+94AX9IsJfwresP4VoZ0BFogumn+V5OleWUNGOrE=;
        b=UYeO/kcLPG9DVYf1lO3fC92cTz/P7CJzL2yWshjlLhLbb+qDprn8fa9ZZb4dsWdsUX
         uOJTqKbIcpNMuIzQvSgB63avGFoCNo2eeiTKBcx+waMCFY/VanCU7ynxxpWSfChj6fBo
         UqdSDDMOMYtdMCLmliji7DWcuSae7dYCKGZ8CsvCmcO/jTlGLrNrtj/Emmk4rf+Zbgyk
         9UoFC7uBQpKpFjsJA8uf0P4e6/iz97BV3PPqAUp/g3ub58Alx7p7e7a6pYdxVN+2jqFx
         Tr9m3YcRtrC7GolIZu5PEapqaU2HHCkiDiXrcOfoMFtmVBMXVLvAY94dRb/f3x8O0IOk
         Rscw==
X-Forwarded-Encrypted: i=1; AJvYcCXWU/02+i++lIjo4sZRI3juF5wgeOC3k1Hb/AhYP/ReJANd5aR30n/71U5HzEKONlWfVeIC1jpjWc0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3b3rcmqaIq1RioHNIuv7H8S0xKAWItymbLyC9t+a26JKAhPBc
	gFiWb7YLzhpyHO2PShA+Gn5qLJhk0USJKPkmgZDbFMYSaCSRQ4m4inqy
X-Gm-Gg: AY/fxX783kNCe5yKd0qA3cc43NoGJy7myioPBbhTxG5Cd0TASe1p/E7MM6Up81GfO6w
	8zZ/kK3Q1lLhfAsqTfn3g/U/nKKY8NXrUbQjmqTSZHRALpYrWG5c71mqmRgGMJARwZEOtYKuhaH
	TDIwC9q0Ze8mK3jDO0Yhg1oc7aNQhiehq47N/tQy/7KCUJVyujkLQiqLDvbiJFrxbftXDxFuSyj
	CQ/VrQT6o4olITiI9HuPnTFoV6gD0UTDLhHgbxPk9F0tPUPuXYpa8Ilp8FfaC71B5U7kjMs77CX
	8iq9HQINsyPvN0H5RQ1J7aUnit85Kdw4/pGzY3MleiaUcCrtrACof2QKd88HxI6XCYFSgM44oNd
	/Lb3plzBkmXLHUxLjg1S3MLIT+N5T2iwM7QeCSnkY4YrGeXN/Kv9n2FrMoy2f9zpc+OAndmaJpe
	rPdia+iorTHkTNFdvM
X-Google-Smtp-Source: AGHT+IH5SF9o/7ISeAlP3eC1if6rKolBgvqgtC65K6/yldfspYSFfs0X7lNwOIXNJqG91qWeWDYTkg==
X-Received: by 2002:a17:903:2b10:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a09ecc6b3cmr14888095ad.37.1765638556521;
        Sat, 13 Dec 2025 07:09:16 -0800 (PST)
Received: from JRT-PC.. ([111.94.32.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm85494715ad.59.2025.12.13.07.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 07:09:16 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [kvm-unit-tests PATCH 4/4] riscv: sbi: Add tests for PMU extension
Date: Sat, 13 Dec 2025 23:08:48 +0800
Message-ID: <20251213150848.149729-5-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213150848.149729-1-jamestiotio@gmail.com>
References: <20251213150848.149729-1-jamestiotio@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_070919_338360_32CFF63C 
X-CRM114-Status: GOOD (  19.67  )
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

Add the actual tests for the SBI PMU extension. Functions related to
shared memory (FID #7 and #8) are untested for now.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 riscv/Makefile    |   1 +
 riscv/sbi-tests.h |   1 +
 riscv/sbi-pmu.c   | 461 ++++++++++++++++++++++++++++++++++++++++++++++
 riscv/sbi.c       |   2 +
 4 files changed, 465 insertions(+)
 create mode 100644 riscv/sbi-pmu.c

diff --git a/riscv/Makefile b/riscv/Makefile
index c0dd5465..75a108c1 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -21,6 +21,7 @@ all: $(tests)
 sbi-deps += $(TEST_DIR)/sbi-asm.o
 sbi-deps += $(TEST_DIR)/sbi-dbtr.o
 sbi-deps += $(TEST_DIR)/sbi-fwft.o
+sbi-deps += $(TEST_DIR)/sbi-pmu.o
 sbi-deps += $(TEST_DIR)/sbi-sse.o
 
 all_deps += $(sbi-deps)
diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index c1ebf016..509ec547 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -99,6 +99,7 @@ static inline bool env_enabled(const char *env)
 
 void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo);
 void sbi_bad_fid(int ext);
+void check_pmu(void);
 void check_sse(void);
 void check_dbtr(void);
 
diff --git a/riscv/sbi-pmu.c b/riscv/sbi-pmu.c
new file mode 100644
index 00000000..5d2e034a
--- /dev/null
+++ b/riscv/sbi-pmu.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SBI PMU test suite
+ *
+ * Copyright (C) 2025, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#include <alloc.h>
+#include <alloc_page.h>
+#include <bitops.h>
+#include <cpumask.h>
+#include <libcflat.h>
+#include <on-cpus.h>
+#include <stdlib.h>
+
+#include <asm/csr.h>
+#include <asm/io.h>
+#include <asm/page.h>
+#include <asm/sbi.h>
+#include <asm/pmu.h>
+
+#include "sbi-tests.h"
+
+#define SBI_PMU_COUNTER_TEST_INIT_VALUE 0x7FFFFFFF
+
+struct sbi_ext_pmu_ctr_csr_map {
+	bool mapped;
+	bool is_fw_ctr;
+	unsigned long ctr_idx;
+	unsigned long csr;
+};
+
+static unsigned long number_of_counters;
+static struct sbi_ext_pmu_ctr_csr_map *sbi_ext_pmu_ctr_csr_map;
+
+static unsigned long get_counter_idx_from_csr(unsigned long csr);
+struct sbi_ext_pmu_test_ctr sbi_ext_pmu_get_candidate_fw_counter_for_test(void);
+uint64_t sbi_ext_pmu_read_fw_counter(unsigned long ctr_idx);
+
+static unsigned long get_counter_idx_from_csr(unsigned long csr)
+{
+	for (unsigned long i = 0; i < number_of_counters; i++) {
+		if (sbi_ext_pmu_ctr_csr_map[i].mapped &&
+		    sbi_ext_pmu_ctr_csr_map[i].csr == csr) {
+			return sbi_ext_pmu_ctr_csr_map[i].ctr_idx;
+		}
+	}
+
+	assert_msg(false, "CSR %lx not found in the map", csr);
+}
+
+struct sbi_ext_pmu_test_ctr sbi_ext_pmu_get_candidate_fw_counter_for_test(void)
+{
+	struct sbi_ext_pmu_test_ctr test_ctr = {0};
+
+	if (!sbi_probe(SBI_EXT_TIME)) {
+		test_ctr.ctr_idx = -1;
+		return test_ctr;
+	}
+
+	set_cidx_type(test_ctr.eid, SBI_EXT_PMU_EVENT_FW);
+	set_cidx_code(test_ctr.eid, SBI_EXT_PMU_FW_SET_TIMER);
+
+	/* Since any firmware counter can be used for testing, return the first one found */
+	for (unsigned long i = 0; i < number_of_counters; i++) {
+		if (sbi_ext_pmu_ctr_csr_map[i].mapped && sbi_ext_pmu_ctr_csr_map[i].is_fw_ctr) {
+			test_ctr.ctr_idx = sbi_ext_pmu_ctr_csr_map[i].ctr_idx;
+			return test_ctr;
+		}
+	}
+
+	test_ctr.ctr_idx = -1;
+	return test_ctr;
+}
+
+uint64_t sbi_ext_pmu_read_fw_counter(unsigned long ctr_idx)
+{
+	struct sbiret ret;
+	uint64_t ctr_val = 0;
+
+	ret = sbi_pmu_counter_fw_read(ctr_idx);
+	report(ret.error == SBI_SUCCESS,
+	       "expected to read lower bits of firmware counter %ld successfully, got %ld", ctr_idx, ret.error);
+
+	ctr_val = ret.value;
+
+	ret = sbi_pmu_counter_fw_read_hi(ctr_idx);
+	report(ret.error == SBI_SUCCESS,
+	       "expected to read upper bits of firmware counter %ld successfully, got %ld", ctr_idx, ret.error);
+
+	ctr_val += ((uint64_t)ret.value << 32);
+
+	return ctr_val;
+}
+
+void check_pmu(void)
+{
+	struct sbiret ret;
+	unsigned long valid_counter_info = 0, num_of_hw_counters = 0;
+	uint64_t cycle_count, instret_count, test_counter_value;
+	bool timer_counter_found = false;
+	union sbi_ext_pmu_ctr_info info;
+	unsigned long test_eid = 0, set_timer_count = 0;
+	int test_counter_idx;
+	struct sbi_ext_pmu_test_ctr test_ctr = {0};
+
+	report_prefix_push("pmu");
+
+	if (!sbi_probe(SBI_EXT_PMU)) {
+		report_skip("PMU extension unavailable");
+		report_prefix_pop();
+		return;
+	}
+
+	sbi_bad_fid(SBI_EXT_PMU);
+
+	report_prefix_push("pmu_num_counters");
+
+	ret = sbi_pmu_num_counters();
+	if (ret.error) {
+		report_fail("failed to get number of counters (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	}
+	number_of_counters = ret.value;
+
+	/* CSR_CYCLE, CSR_TIME, and CSR_INSTRET are mandatory counters */
+	if (number_of_counters < 3) {
+		report_fail("number of counters is %ld, expected at least 3", number_of_counters);
+		report_prefix_popn(2);
+		return;
+	}
+
+	report_info("number of counters is %ld", number_of_counters);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_get_info");
+
+	fdt_pmu_setup();
+
+	sbi_ext_pmu_ctr_csr_map = calloc(number_of_counters,
+					    sizeof(struct sbi_ext_pmu_ctr_csr_map));
+
+	for (unsigned long i = 0; i < number_of_counters; i++) {
+		sbi_ext_pmu_ctr_csr_map[i].mapped = false;
+		sbi_ext_pmu_ctr_csr_map[i].is_fw_ctr = false;
+		sbi_ext_pmu_ctr_csr_map[i].ctr_idx = 0;
+		sbi_ext_pmu_ctr_csr_map[i].csr = 0;
+	}
+
+	for (unsigned long i = 0; i < number_of_counters; i++) {
+		ret = sbi_pmu_counter_get_info(i);
+
+		if (ret.error == SBI_ERR_INVALID_PARAM && !timer_counter_found) {
+			/* Assume that this is the CSR_TIME counter and skip it */
+			timer_counter_found = true;
+			sbi_ext_pmu_ctr_csr_map[i].ctr_idx = i;
+			sbi_ext_pmu_ctr_csr_map[i].csr = CSR_TIME;
+			valid_counter_info++;
+			report_info("skipping CSR_TIME counter with index %ld", i);
+			continue;
+		} else if (ret.error) {
+			free(sbi_ext_pmu_ctr_csr_map);
+			fdt_pmu_free();
+			report_fail("failed to get counter info (error=%ld)", ret.error);
+			report_prefix_popn(2);
+			return;
+		}
+
+		info = *(union sbi_ext_pmu_ctr_info *)&ret.value;
+
+		if (info.type == SBI_EXT_PMU_CTR_TYPE_HW) {
+			sbi_ext_pmu_ctr_csr_map[i].mapped = true;
+			sbi_ext_pmu_ctr_csr_map[i].ctr_idx = i;
+			sbi_ext_pmu_ctr_csr_map[i].csr = info.csr;
+
+			if ((info.csr == CSR_CYCLE) || (info.csr == CSR_INSTRET))
+				valid_counter_info += info.width == 63;
+			else
+				valid_counter_info++;
+
+			num_of_hw_counters++;
+		} else if (info.type == SBI_EXT_PMU_CTR_TYPE_FW) {
+			sbi_ext_pmu_ctr_csr_map[i].mapped = true;
+			sbi_ext_pmu_ctr_csr_map[i].is_fw_ctr = true;
+			sbi_ext_pmu_ctr_csr_map[i].ctr_idx = i;
+			valid_counter_info++;
+		} else {
+			free(sbi_ext_pmu_ctr_csr_map);
+			fdt_pmu_free();
+			report_fail("unknown counter type %d", info.type);
+			report_prefix_popn(2);
+			return;
+		}
+	}
+
+	report(valid_counter_info == number_of_counters,
+	       "number of counters with valid info is %ld", valid_counter_info);
+
+	ret = sbi_pmu_counter_get_info(number_of_counters);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx == num_counters, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_config_matching");
+
+	cycle_count = pmu_get_cycles();
+	instret_count = pmu_get_instret();
+
+	set_cidx_type(test_eid, SBI_EXT_PMU_EVENT_HW_GENERAL);
+	set_cidx_code(test_eid, SBI_EXT_PMU_HW_CPU_CYCLES);
+	ret = sbi_pmu_counter_config_matching(get_counter_idx_from_csr(CSR_CYCLE),
+					      1,
+					      SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE,
+					      test_eid,
+					      0);
+
+	if (ret.error) {
+		free(sbi_ext_pmu_ctr_csr_map);
+		fdt_pmu_free();
+		report_fail("failed to configure counter (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	}
+
+	test_counter_value = pmu_get_cycles();
+
+	report(test_counter_value < cycle_count,
+	       "expected cycle count to reset (%ld < %ld)", test_counter_value, cycle_count);
+
+	set_cidx_code(test_eid, SBI_EXT_PMU_HW_INSTRUCTIONS);
+	ret = sbi_pmu_counter_config_matching(get_counter_idx_from_csr(CSR_INSTRET),
+					      1,
+					      SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE,
+					      test_eid,
+					      0);
+
+	if (ret.error) {
+		free(sbi_ext_pmu_ctr_csr_map);
+		fdt_pmu_free();
+		report_fail("failed to configure counter (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	}
+
+	test_counter_value = pmu_get_instret();
+
+	report(test_counter_value < instret_count,
+	       "expected instret count to reset (%ld < %ld)", test_counter_value, instret_count);
+
+	set_cidx_code(test_eid, SBI_EXT_PMU_HW_CPU_CYCLES);
+	test_counter_idx = sbi_ext_pmu_get_first_counter_for_hw_event(test_eid);
+
+	report_info("first counter for test hw event %ld is %d", test_eid, test_counter_idx);
+
+	if (test_counter_idx <= 0) {
+		report_skip("failed to get first counter for test hw event");
+	} else {
+		test_counter_value = pmu_get_cycles();
+		ret = sbi_pmu_counter_config_matching(test_counter_idx, 0, SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE,
+						      test_eid, 0);
+		report(ret.error == SBI_ERR_INVALID_PARAM,
+		       "expected %d when counter_idx_mask == 0, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+		report(pmu_get_cycles() > test_counter_value,
+		       "expected cycle counter to be unaffected when configuring counter %d", test_counter_idx);
+	}
+
+	test_ctr = sbi_ext_pmu_get_candidate_hw_counter_for_test();
+	test_counter_idx = test_ctr.ctr_idx;
+	test_eid = test_ctr.eid;
+
+	report_info("testing hardware counter %d with event %ld", test_counter_idx, test_eid);
+
+	ret = sbi_pmu_counter_config_matching(test_counter_idx, 1,
+					      SBI_EXT_PMU_CFG_FLAG_SKIP_MATCH,
+					      test_eid, 0);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when skipping match before configuring counter, got %ld",
+	       SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_config_matching(test_counter_idx, 1,
+					      SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE | SBI_EXT_PMU_CFG_FLAG_AUTO_START,
+					      test_eid, 0);
+	if (ret.error) {
+		free(sbi_ext_pmu_ctr_csr_map);
+		fdt_pmu_free();
+		report_fail("failed to configure counter (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	}
+	report(ret.value == test_counter_idx,
+	       "expected counter %d to be configured (%ld == %d)", test_counter_idx, ret.value, test_counter_idx);
+
+	test_counter_value = pmu_get_counter(sbi_ext_pmu_ctr_csr_map[test_counter_idx].csr);
+
+	report(test_counter_value > 0,
+	       "expected counter %d to auto-start (%ld > 0)",
+	       test_counter_idx,
+	       test_counter_value);
+
+	test_eid = sbi_ext_pmu_get_first_unsupported_hw_event(test_counter_idx);
+	ret = sbi_pmu_counter_config_matching(test_counter_idx, 1,
+					      SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE | SBI_EXT_PMU_CFG_FLAG_AUTO_START,
+					      test_eid, 0);
+	report(ret.error == SBI_ERR_NOT_SUPPORTED,
+	       "expected counter %d to be unable to monitor event %ld, got %ld",
+	       test_counter_idx, test_eid, ret.error);
+
+	test_eid = test_ctr.eid;
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_start");
+
+	ret = sbi_pmu_counter_start(test_counter_idx, 0, 0, 0);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx_mask == 0, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_start(test_counter_idx, 1, 0, 0);
+	report(ret.error == SBI_ERR_ALREADY_STARTED,
+	       "expected counter %d to be already started, got %ld", test_counter_idx, ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_stop");
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 0, 0);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx_mask == 0, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 1, 0);
+	report(ret.error == SBI_SUCCESS,
+	       "expected counter %d to be stopped, got %ld", test_counter_idx, ret.error);
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 1, 0);
+	report(ret.error == SBI_ERR_ALREADY_STOPPED,
+	       "expected counter %d to be already stopped, got %ld", test_counter_idx, ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_start");
+
+	ret = sbi_pmu_counter_start(test_counter_idx, 1, SBI_EXT_PMU_START_SET_INIT_VALUE,
+				    SBI_PMU_COUNTER_TEST_INIT_VALUE);
+	report(ret.error == SBI_SUCCESS,
+	       "expected counter %d to be started with initial value, got %ld", test_counter_idx, ret.error);
+
+	test_counter_value = pmu_get_counter(sbi_ext_pmu_ctr_csr_map[test_counter_idx].csr);
+	report(test_counter_value > SBI_PMU_COUNTER_TEST_INIT_VALUE,
+	       "expected counter %d to start with initial value (%ld > %d)",
+	       test_counter_idx, test_counter_value, SBI_PMU_COUNTER_TEST_INIT_VALUE);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_stop");
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 1, 0);
+	report(ret.error == SBI_SUCCESS,
+	       "expected counter %d to be stopped, got %ld", test_counter_idx, ret.error);
+
+	report_prefix_pop();
+
+	report_prefix_push("sbi_pmu_counter_fw_read");
+
+	ret = sbi_pmu_counter_fw_read(number_of_counters);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx == num_counters, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_fw_read_hi(number_of_counters);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx == num_counters, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	test_ctr = sbi_ext_pmu_get_candidate_fw_counter_for_test();
+	test_counter_idx = test_ctr.ctr_idx;
+	test_eid = test_ctr.eid;
+
+	if (test_counter_idx < 0) {
+		free(sbi_ext_pmu_ctr_csr_map);
+		fdt_pmu_free();
+		report_skip("no firmware counters available for testing");
+		report_prefix_popn(2);
+		return;
+	}
+
+	report_info("testing firmware counter %d with event 0x%lx", test_counter_idx, test_eid);
+
+	ret = sbi_pmu_counter_config_matching(test_counter_idx, 1,
+					      SBI_EXT_PMU_CFG_FLAG_CLEAR_VALUE | SBI_EXT_PMU_CFG_FLAG_AUTO_START,
+					      test_eid, 0);
+	if (ret.error) {
+		free(sbi_ext_pmu_ctr_csr_map);
+		fdt_pmu_free();
+		report_fail("failed to configure counter (error=%ld)", ret.error);
+		report_prefix_popn(2);
+		return;
+	}
+	report(ret.value == test_counter_idx,
+	       "expected counter %d to be configured (%ld == %d)", test_counter_idx, ret.value, test_counter_idx);
+
+	test_counter_value = sbi_ext_pmu_read_fw_counter(test_counter_idx);
+
+	report(test_counter_value == set_timer_count,
+	       "expected counter %d to be cleared (%ld == %ld)",
+	       test_counter_idx,
+	       test_counter_value,
+	       set_timer_count);
+
+	ret = sbi_pmu_counter_start(test_counter_idx, 0, 0, 0);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx_mask == 0, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_start(test_counter_idx, 1, 0, 0);
+	report(ret.error == SBI_ERR_ALREADY_STARTED,
+	       "expected counter %d to be already started, got %ld", test_counter_idx, ret.error);
+
+	sbi_set_timer(0);
+	set_timer_count++;
+	test_counter_value = sbi_ext_pmu_read_fw_counter(test_counter_idx);
+
+	report(test_counter_value == set_timer_count,
+	       "expected counter %d to have incremented (%ld == %ld)",
+	       test_counter_idx,
+	       test_counter_value,
+	       set_timer_count);
+
+	sbi_set_timer(ULONG_MAX);
+	set_timer_count++;
+	test_counter_value = sbi_ext_pmu_read_fw_counter(test_counter_idx);
+
+	report(test_counter_value == set_timer_count,
+	       "expected counter %d to have incremented (%ld == %ld)",
+	       test_counter_idx,
+	       test_counter_value,
+	       set_timer_count);
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 0, 0);
+	report(ret.error == SBI_ERR_INVALID_PARAM,
+	       "expected %d when counter_idx_mask == 0, got %ld", SBI_ERR_INVALID_PARAM, ret.error);
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 1, 0);
+	report(ret.error == SBI_SUCCESS,
+	       "expected counter %d to be stopped, got %ld", test_counter_idx, ret.error);
+
+	ret = sbi_pmu_counter_stop(test_counter_idx, 1, 0);
+	report(ret.error == SBI_ERR_ALREADY_STOPPED,
+	       "expected counter %d to be already stopped, got %ld", test_counter_idx, ret.error);
+
+	sbi_set_timer(ULONG_MAX);
+	test_counter_value = sbi_ext_pmu_read_fw_counter(test_counter_idx);
+
+	report(test_counter_value == set_timer_count,
+	       "expected counter %d to be unchanged after stop (%ld == %ld)",
+	       test_counter_idx,
+	       test_counter_value,
+	       set_timer_count);
+
+	free(sbi_ext_pmu_ctr_csr_map);
+	fdt_pmu_free();
+	report_prefix_popn(2);
+}
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 3b8aadce..fdb6a38a 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -32,6 +32,7 @@
 
 #define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
 
+void check_pmu(void);
 void check_sse(void);
 void check_fwft(void);
 
@@ -1557,6 +1558,7 @@ int main(int argc, char **argv)
 	check_time();
 	check_ipi();
 	check_hsm();
+	check_pmu();
 	check_dbcn();
 	check_susp();
 	check_sse();
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
