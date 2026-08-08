Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431DDC5AC67
	for <kvm-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sLQPqRSkdwUkSMW0S7fS6LjZIZJx2La0MXRPIjrJwQY=; b=vD1Vgc4OPIMDtL
	3NFp/YLuuLnUFK0iV+iSSHXMxRVEpKVqCa6ijmw7e7mRwztNHlyh7RF4P4dKsanainYuc3K6Z3Xlk
	9J4J4vybfDNcpmkMrIxgu1/iINItkal0VKcg9koxbHDZVEvzVVwf8W5+b7YgS79BT5/h0aY0V+KaR
	4Tx33EWQP9NuiVgpUzZV5VL1Z7YhV5aIJ9gLu2t2EDPVqDLSUrwDnWZe1ZT2v5CmjOmeZ4tPuuaVN
	SziVm1DO6XCeCqAkYXFMG8QCF0rjAWwShUtYs7bBio6kA5856YAKIg3PsCVbKAfMuun35opUTglKX
	SPeDEMwjnu8VOKe570ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZxm-000000094me-2TH5;
	Sat, 08 Aug 2026 05:51:18 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsZxi-000000094mF-0cS4
	for kvm-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 05:51:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemssoftware.dev;
	s=key1; t=1786168265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GkulbZmOs+Mth+//HgBbAZCXbWi5X+zveQaLFheV+3w=;
	b=Y/k1fihXWuDDMdpGfUY64PpSAcewF/r2/MdP76OvuL+IYJ6GTZLhDoSIHnKIHSGp/+pL4f
	mQ+d4l5vlfjqIWSboLoFFwknxSmjHZU5ii30uvGbiSdoNLDdm07Klg5Z0zfa/hr/kq0I8g
	s+gn5+KaUzkkWFjMzJCjB47eSNHwIAlIoWA8dioPkywMaLhMVe8qATwJifXTDR2aVwbctV
	RMW3mAoPjzQJfuAIbj1f4S9+vgg66e7czrq4Ja/W7+mWCWFqN4lTG58pQfelNYjH0dEqjv
	xv9RwGiR+11ujndZlbjyroz8SnancoE5qE2bWJYWGJS+eCTlZhqM6HNrz2Hi7g==
From: Sainath Grandhi <sainathg@systemssoftware.dev>
To: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org,
	Andrew Jones <andrew.jones@linux.dev>,
	Sainath Grandhi <sainathg@systemssoftware.dev>
Subject: [kvm-unit-tests PATCH] riscv: Add Zicboz CBO.ZERO tests
Date: Sat,  8 Aug 2026 05:50:40 +0000
Message-ID: <20260808055040.2093-1-sainathg@systemssoftware.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_225114_753469_3522E1BD 
X-CRM114-Status: GOOD (  16.28  )
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

Add a test for CBO.ZERO when Zicboz is advertised. Read the cache-block
size from riscv,cboz-block-size and allocate three aligned blocks.
Execute CBO.ZERO at multiple offsets in the middle block and verify that
the containing block is zeroed while the adjacent blocks remain
unchanged.

Skip the test when Zicboz is unavailable.

Signed-off-by: Sainath Grandhi <sainathg@systemssoftware.dev>
---
 riscv/Makefile      |   1 +
 riscv/isa-zicboz.c  | 168 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg |   4 ++
 3 files changed, 173 insertions(+)
 create mode 100644 riscv/isa-zicboz.c

diff --git a/riscv/Makefile b/riscv/Makefile
index 348a30a7..f4a97575 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -15,6 +15,7 @@ tests += $(TEST_DIR)/sbi.$(exe)
 tests += $(TEST_DIR)/selftest.$(exe)
 tests += $(TEST_DIR)/sieve.$(exe)
 tests += $(TEST_DIR)/isa-dbltrp.$(exe)
+tests += $(TEST_DIR)/isa-zicboz.$(exe)
 
 all: $(tests)
 
diff --git a/riscv/isa-zicboz.c b/riscv/isa-zicboz.c
new file mode 100644
index 00000000..76a2d209
--- /dev/null
+++ b/riscv/isa-zicboz.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Zicboz cache-block-zero instruction tests
+ *
+ * Copyright (C) 2026, Sainath Grandhi <sainathg@systemssoftware.dev>
+ */
+#include <alloc.h>
+#include <devicetree.h>
+#include <libcflat.h>
+#include <string.h>
+
+#include <asm/isa.h>
+#include <asm/processor.h>
+
+#define GUARD_BEFORE_PATTERN	0xa5
+#define TARGET_PATTERN		0x5a
+#define GUARD_AFTER_PATTERN	0x3c
+
+struct zicboz_info {
+	u64 hartid;
+	u32 block_size;
+	int property_len;
+	bool found;
+};
+
+static void find_zicboz_block_size(int cpu_node, u64 hartid, void *data)
+{
+	struct zicboz_info *info = data;
+	const fdt32_t *property;
+	int len;
+
+	if (hartid != info->hartid)
+		return;
+
+	property = fdt_getprop(dt_fdt(), cpu_node,
+			       "riscv,cboz-block-size", &len);
+	if (!property)
+		return;
+
+	info->found = true;
+	info->property_len = len;
+	if (len == sizeof(*property))
+		info->block_size = fdt32_to_cpu(*property);
+}
+
+static bool get_zicboz_block_size(size_t *block_size)
+{
+	struct zicboz_info info = {
+		.hartid = current_thread_info()->hartid,
+	};
+	int ret;
+
+	ret = dt_for_each_cpu_node(find_zicboz_block_size, &info);
+	if (ret) {
+		report_fail("failed to walk CPU nodes: %s", fdt_strerror(ret));
+		return false;
+	}
+
+	if (!info.found) {
+		report_fail("riscv,cboz-block-size is missing");
+		return false;
+	}
+
+	if (info.property_len != sizeof(fdt32_t)) {
+		report_fail("riscv,cboz-block-size has invalid length %d",
+			    info.property_len);
+		return false;
+	}
+
+	if (!is_power_of_2(info.block_size)) {
+		report_fail("invalid CBO.ZERO block size %u", info.block_size);
+		return false;
+	}
+
+	*block_size = info.block_size;
+	return true;
+}
+
+static inline void cbo_zero(void *address)
+{
+	asm volatile(".option push\n"
+		".option arch, +zicboz\n"
+		"cbo.zero 0(%0)\n"
+		".option pop\n"
+		:
+		: "r" (address)
+		: "memory");
+}
+
+static bool block_has_value(const u8 *block, size_t block_size, u8 value)
+{
+	size_t i;
+
+	for (i = 0; i < block_size; i++) {
+		if (block[i] != value)
+			return false;
+	}
+
+	return true;
+}
+
+static void test_cbo_zero_at_offset(u8 *area, size_t block_size,
+				    size_t offset, const char *name)
+{
+	u8 *guard_before = area;
+	u8 *target = guard_before + block_size;
+	u8 *guard_after = target + block_size;
+
+	report_prefix_push(name);
+
+	memset(guard_before, GUARD_BEFORE_PATTERN, block_size);
+	memset(target, TARGET_PATTERN, block_size);
+	memset(guard_after, GUARD_AFTER_PATTERN, block_size);
+
+	cbo_zero(target + offset);
+	asm volatile("fence rw, rw" ::: "memory");
+
+	report(block_has_value(target, block_size, 0),
+	       "target block was zeroed");
+	report(block_has_value(guard_before, block_size,
+			       GUARD_BEFORE_PATTERN),
+	       "preceding block was preserved");
+	report(block_has_value(guard_after, block_size,
+			       GUARD_AFTER_PATTERN),
+	       "following block was preserved");
+
+	report_prefix_pop();
+}
+
+int main(int argc, char **argv)
+{
+	size_t block_size;
+	u8 *area;
+
+	report_prefix_push("zicboz");
+
+	if (!dt_available()) {
+		report_skip("device tree is not available");
+		goto out;
+	}
+
+	if (!has_ext("zicboz")) {
+		report_skip("Zicboz is not available");
+		goto out;
+	}
+
+	if (!get_zicboz_block_size(&block_size))
+		goto out;
+
+	report_info("CBO.ZERO block size is %lu bytes",
+		    (unsigned long)block_size);
+
+	area = memalign(block_size, 3 * block_size);
+
+	/* Every address within a block must select the same containing block. */
+	test_cbo_zero_at_offset(area, block_size, 0, "block-start");
+	test_cbo_zero_at_offset(area, block_size, 1, "second-byte");
+	test_cbo_zero_at_offset(area, block_size, block_size / 2,
+				"block-middle");
+	test_cbo_zero_at_offset(area, block_size, block_size - 1,
+				"block-end");
+
+	free(area);
+
+out:
+	report_prefix_pop();
+	return report_summary();
+}
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index 9e9f58d9..30594fe5 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -22,3 +22,7 @@ groups = sbi
 [dbltrp]
 file = isa-dbltrp.flat
 groups = isa sbi
+
+[zicboz]
+file = isa-zicboz.flat
+groups = isa
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
