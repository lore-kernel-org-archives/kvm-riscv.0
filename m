Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4309606A32C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fxm+h1aH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DAnZA4PX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UnHLnk5enFIpFF/BAQ5RAH6Hz8Cn3mqM5NwxtZ5mhPY=; b=fxm+h1aHv0BXHwMB5lw5Wo08ik
	LT/VVqmz5jphkU23wp5aq58oK586xaEF5EKTvhBzHOPO1uxT6IwvI6AGDO9TtrSjQvIpPJU3BnZB8
	WDTy3AI7aWTzkKBHN/CR5xG9Pnhzw4zl6Wo5iYzSF1eJP4sUpf9kM+J4FAccEShCIUBb48r0c+TX4
	J3koKDfsx+3Pc/z8K2InZ/ZyMREDExI5YkyTOg48JZlG4OuXU3jKQWVo46mz3/Ro62/U6/vQRmsy3
	aMxsP65Ic71R7Tha5OLdE1uRLmDgtCWpfZBkKQoCck2645VjBRxJ8SQG5Qtvn/QWD0hZO3ZSeYPHx
	TQXlG8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23w-00000008CuT-1YLR;
	Wed, 25 Nov 2026 01:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23v-00000008CtH-1XAm
	for kvm-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 01:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bJ0DNjkGsvPoRVlTWXCehVrDZmbssgFq8zP3rn57cJc=; b=DAnZA4PX3raRdGz0RoiXXhdP9y
	DnRRJk+JRcInRDva4AtIX5pNtIpV3BNJM6c8dhKPQJtch81SWFBCouiCk85+M7k+oPFctwss5KXHJ
	vKyeNKvny9kOPOmqvZwEyrffsFUV7HV+3kILJNtiCDIuUDX1rqr19OcMbBKPXsyUVIt9Ae38bjOc9
	FuMlpvsC8JUjcIZMLpViK0mlEH6sl7+w2fnxv3Rk1S7+YevRqptyqmkh1zJ7nreFPO+faDsUiPb0C
	aPtJ/FYXeLAL1f9sEOZn7aFoLystojtlLPaVISV4Mq63ytkh+fgmb5IpC0atyvIDSynBjsfQVCjoc
	u9xEi8HQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23q-00000004jXR-0jXx
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:41 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowADH05R9PQZr4Nm8AQ--.742S2;
	Wed, 25 Nov 2026 09:44:29 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 9/9] riscv: Add BRS SBI requirement tests
Date: Wed, 25 Nov 2026 09:44:09 +0800
Message-ID: <20261125014409.79852-10-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADH05R9PQZr4Nm8AQ--.742S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8CFW5Xw1rWw1UXw1UWrg_yoW3Gw13pr
	1kCr90kr98JFyxA393AF1DGw15tr1rXwn0gr4UCw1rKw47trW5Xws7t34ayr45XFWrGr9x
	u3ZagrZ5uFsrGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjb_-PUUUUU==
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_014438_907837_BCAB4174 
X-CRM114-Status: GOOD (  19.30  )
X-Spam-Score: -2.3 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a riscv-brs unit test for the SBI rules in the RISC-V Boot and
Runtime Services specification:

  SBI_010  spec version must be v2.0 or later
  SBI_020  HSM must be implemented
  SBI_030  TIME is required unless Sstc is present
  SBI_040  IPI is required unless IMSIC is present
  SBI_050  RFENCE is required unless IMSIC is present
  SBI_060  PMU is required unless Sscsrind and Ssccfg are all present
  SBI_070  DBCN is required when ACPI SPCR Interface Type is 0x15

Parse the extra ISA names used as skip conditions, and add the RFNC
and PMU extension IDs needed to probe those extensions.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/asm/isa.h |   3 +
 lib/riscv/asm/sbi.h |   8 +-
 lib/riscv/isa.c     |  12 ++-
 riscv/Makefile      |   1 +
 riscv/riscv-brs.c   | 192 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg |   4 +
 6 files changed, 215 insertions(+), 5 deletions(-)
 create mode 100644 riscv/riscv-brs.c

diff --git a/lib/riscv/asm/isa.h b/lib/riscv/asm/isa.h
index fb3af67d..6516c869 100644
--- a/lib/riscv/asm/isa.h
+++ b/lib/riscv/asm/isa.h
@@ -13,6 +13,9 @@
  * by name not tracked here with cpu_has_extension_name()
  */
 enum {
+	ISA_SSAIA,
+	ISA_SSCCFG,
+	ISA_SSCSRIND,
 	ISA_SSTC,
 	ISA_MAX,
 };
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 289a6a24..987ea1de 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -44,13 +44,15 @@
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_TIME = 0x54494d45,
-	SBI_EXT_IPI = 0x735049,
-	SBI_EXT_HSM = 0x48534d,
+	SBI_EXT_IPI  = 0x735049,
+	SBI_EXT_RFNC = 0x52464E43,
+	SBI_EXT_HSM  = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_PMU  = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_FWFT = 0x46574654,
-	SBI_EXT_SSE = 0x535345,
+	SBI_EXT_SSE  = 0x535345,
 	SBI_EXT_DBTR = 0x44425452,
 };
 
diff --git a/lib/riscv/isa.c b/lib/riscv/isa.c
index c03bb19b..38418e3e 100644
--- a/lib/riscv/isa.c
+++ b/lib/riscv/isa.c
@@ -39,8 +39,16 @@ static void isa_bit(const char *name, int len, void *data)
 {
 	struct thread_info *info = (struct thread_info *)data;
 
-	if (isa_match("sstc", name, len))
-		set_bit(ISA_SSTC, info->isa);
+#define ISA_MATCH_AND_SET(ext) \
+	if (isa_match(#ext, name, len)) \
+		set_bit(ISA_##ext, info->isa)
+
+	ISA_MATCH_AND_SET(SSAIA);
+	ISA_MATCH_AND_SET(SSCCFG);
+	ISA_MATCH_AND_SET(SSCSRIND);
+	ISA_MATCH_AND_SET(SSTC);
+
+#undef ISA_MATCH_AND_SET
 }
 
 static void isa_parse(const char *isa_string, int len, struct isa_info *info)
diff --git a/riscv/Makefile b/riscv/Makefile
index f90992ab..8b3bb99a 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -15,6 +15,7 @@ tests += $(TEST_DIR)/sbi.$(exe)
 tests += $(TEST_DIR)/selftest.$(exe)
 tests += $(TEST_DIR)/sieve.$(exe)
 tests += $(TEST_DIR)/isa-dbltrp.$(exe)
+tests += $(TEST_DIR)/riscv-brs.$(exe)
 
 all: $(tests)
 
diff --git a/riscv/riscv-brs.c b/riscv/riscv-brs.c
new file mode 100644
index 00000000..0591d3d0
--- /dev/null
+++ b/riscv/riscv-brs.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V BRS SBI requirement tests
+ *
+ * Copyright (C) 2026, Institute of Software, CAS., Xiang W <wangxiang@iscas.ac.cn>
+ */
+
+#include <libcflat.h>
+#include <devicetree.h>
+#include <asm/sbi.h>
+#include <asm/isa.h>
+#include <asm/smp.h>
+#include <acpi.h>
+
+static void check_sbi_010(void)
+{
+	struct sbiret ret;
+	unsigned long major, minor;
+
+	report_prefix_push("SBI_010");
+
+	ret = sbi_get_spec_version();
+	if (ret.error) {
+		report_fail("sbi_get_spec_version failed with %ld", ret.error);
+	} else {
+		major = ret.value >> SBI_SPEC_VERSION_MAJOR_SHIFT;
+		major = major & SBI_SPEC_VERSION_MAJOR_MASK;
+		minor = ret.value & SBI_SPEC_VERSION_MINOR_MASK;
+
+		report(sbi_mk_version(major, minor) >= sbi_mk_version(2, 0),
+			"SBI spec version is v2.0 or later (current %lu.%lu)", major, minor);
+	}
+
+	report_prefix_pop();
+}
+
+static void check_sbi_020(void)
+{
+	report_prefix_push("SBI_020");
+	report(sbi_probe(SBI_EXT_HSM), "HSM extension is implemented");
+	report_prefix_pop();
+}
+
+static void check_sbi_030(void)
+{
+	int cpu;
+	bool has = true;
+
+	report_prefix_push("SBI_030");
+
+	for_each_present_cpu(cpu) {
+		if (!cpu_has_extension(cpu, ISA_SSTC)) {
+			has = false;
+			break;
+		}
+	}
+
+	if (has)
+		report_skip("Sstc is present, TIME is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_TIME), "TIME extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_040(void)
+{
+	int cpu;
+	bool has = true;
+
+	report_prefix_push("SBI_040");
+
+	for_each_present_cpu(cpu) {
+		if (!cpu_has_extension(cpu, ISA_SSAIA)) {
+			has = false;
+			break;
+		}
+		if (cpus[cpu].imsic_pa == INVALID_PHYS_ADDR) {
+			has = false;
+			break;
+		}
+	}
+
+	if (has)
+		report_skip("IMSIC is present, IPI is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_IPI), "IPI extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_050(void)
+{
+	int cpu;
+	bool has = true;
+
+	report_prefix_push("SBI_050");
+
+	for_each_present_cpu(cpu) {
+		if (!cpu_has_extension(cpu, ISA_SSAIA)) {
+			has = false;
+			break;
+		}
+		if (cpus[cpu].imsic_pa == INVALID_PHYS_ADDR) {
+			has = false;
+			break;
+		}
+	}
+
+	if (has)
+		report_skip("IMSIC is present, RFENCE is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_RFNC), "RFENCE extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_060(void)
+{
+	int cpu;
+	bool has = true;
+
+	report_prefix_push("SBI_060");
+
+	for_each_present_cpu(cpu) {
+		if (!cpu_has_extension(cpu, ISA_SSCSRIND)) {
+			has = false;
+			break;
+		}
+		if (!cpu_has_extension(cpu, ISA_SSCCFG)) {
+			has = false;
+			break;
+		}
+	}
+
+	if (has) {
+		/*
+		 * TODO: OE_SBI_060_010 also requires Smcsrind and Smcdeleg,
+		 * but they are M-mode extensions and not present in the S-mode
+		 * ISA string (DT or RHCT). Revisit if BRS clarifies how to detect them.
+		 */
+		report_skip("Sscsrind and Ssccfg are present, PMU is not mandated");
+	} else {
+		report(sbi_probe(SBI_EXT_PMU), "PMU extension is implemented");
+	}
+
+	report_prefix_pop();
+}
+
+static void check_sbi_070(void)
+{
+	report_prefix_push("SBI_070");
+
+	if (dt_available()) {
+		report_skip("ACPI not available, DBCN is not mandated");
+	} else {
+#ifdef CONFIG_EFI
+		struct spcr_descriptor *spcr;
+
+		spcr = find_acpi_table_addr(SPCR_SIGNATURE);
+		if (spcr == NULL) {
+			report_skip("SPCR is not present, DBCN is not mandated");
+		} else {
+			if (spcr->interface_type == 0x15) {
+				report(sbi_probe(SBI_EXT_DBCN), "DBCN extension is implemented");
+			} else {
+				report_skip("SPCR interface type is %#x (not 0x15), DBCN is not mandated",
+					    spcr->interface_type);
+			}
+		}
+#else
+		report_skip("ACPI not available, DBCN is not mandated");
+#endif
+	}
+
+	report_prefix_pop();
+}
+
+int main(int argc, char **argv)
+{
+	report_prefix_push("riscv-brs");
+
+	check_sbi_010();
+	check_sbi_020();
+	check_sbi_030();
+	check_sbi_040();
+	check_sbi_050();
+	check_sbi_060();
+	check_sbi_070();
+
+	return report_summary();
+}
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index 9e9f58d9..990f03db 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -22,3 +22,7 @@ groups = sbi
 [dbltrp]
 file = isa-dbltrp.flat
 groups = isa sbi
+
+[riscv-brs]
+file = riscv-brs.flat
+groups = riscv-brs nodefault
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
