Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D73606A326
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1+APNp/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+eVrDySsdTYwYb7tivAKbFAFka/LMHtVPJV4fepXYYs=; b=J1+APNp/w2A4ojOgc+k9DLDEDj
	vCCms9TpBvUdp9baOz2ZhdbN09HasfEbCLXIwREnceigmJJHtUdD4HI8aTQozduWg8v6XPxKtRxWw
	3FTfKRowYzCJrhNM9eII521jyvRZRfxFaXS/lAeEzYMDN8iF8gm7sG4CeoWHRDzsszHKVmXyXU1n+
	6NcqVutNoC1q+rZad2Rd/oQodTB3VDfsCahZZ/Geiid1HpnnMa4AsvMqhsjd1neSeRsJANTspva4+
	a+meQnlLZb4Y3D4SuOSZxccyMOKc7aJcxhuPpLa/7zPkXxbSQQ2gKIwwcR16SKweUwXLY1crIJ9DH
	2uZVSaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiO-000000088ed-3NdT;
	Thu, 05 Nov 2026 08:20:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiF-000000088WX-08S3
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:20:55 +0000
Received: from localhost (unknown [122.194.100.204])
	by APP-01 (Coremail) with SMTP id qwCowABnVf9bPOxq_CdRAA--.2987S2;
	Thu, 05 Nov 2026 16:20:43 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 8/8] riscv: Add BRS SBI requirement tests
Date: Thu,  5 Nov 2026 16:20:35 +0800
Message-ID: <20261105082035.133680-9-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnVf9bPOxq_CdRAA--.2987S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gry5tFWxWw47Jw43CFWrAFb_yoWftF1DpF
	WkGF90kryrJa4xA39ayF1DGw1ayr1rWr1vgrykC34rKw42qrW5Xr1vk34Fyr4rWFWrG3y3
	uan3GFZ8uFsrWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUMKZJUUUUU==
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002049_366946_AF760E32 
X-CRM114-Status: GOOD (  23.02  )
X-Spam-Score: -4.2 (----)
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
 lib/riscv/asm/sbi.h |   2 +
 lib/riscv/isa.c     |  12 +-
 riscv/Makefile      |   1 +
 riscv/riscv-brs.c   | 265 ++++++++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg |   4 +
 6 files changed, 285 insertions(+), 2 deletions(-)
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
index 289a6a24..c92a66dc 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -45,8 +45,10 @@ enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_TIME = 0x54494d45,
 	SBI_EXT_IPI = 0x735049,
+	SBI_EXT_RFNC = 0x52464E43,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_SUSP = 0x53555350,
 	SBI_EXT_FWFT = 0x46574654,
diff --git a/lib/riscv/isa.c b/lib/riscv/isa.c
index 91c7302c..6aa27948 100644
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
index 348a30a7..7da7526f 100644
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
index 00000000..2813fa73
--- /dev/null
+++ b/riscv/riscv-brs.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  RISC-V BRS SBI requirement tests
+ *
+ * Copyright (C) 2026, Institute of Software, CAS., Xiang W <wangxiang@iscas.ac.cn>
+ */
+
+#include <libcflat.h>
+#include <devicetree.h>
+#include <asm/sbi.h>
+#include <asm/isa.h>
+#include <asm/smp.h>
+
+#ifdef CONFIG_EFI
+#include <acpi.h>
+#endif
+
+static void check_sbi_010(void)
+{
+	struct sbiret ret;
+	unsigned long major, minor;
+
+	report_prefix_push("SBI_010");
+
+	ret = sbi_get_spec_version();
+	if (ret.error)
+		report_fail("sbi_get_spec_version failed with %ld", ret.error);
+	else {
+		major = ret.value >> SBI_SPEC_VERSION_MAJOR_SHIFT;
+		major = major & SBI_SPEC_VERSION_MAJOR_MASK;
+		minor = ret.value & SBI_SPEC_VERSION_MINOR_MASK;
+
+		report(ret.value >= sbi_mk_version(2, 0),
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
+	report_prefix_push("SBI_030");
+
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC))
+		report_skip("Sstc is present, TIME is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_TIME), "TIME extension is implemented");
+
+	report_prefix_pop();
+}
+
+#define IMSIC_SLEVEL_IRQ	9
+static bool hart_has_imsic[NR_CPUS];
+
+#ifdef CONFIG_EFI
+static int acpi_collect_imsic(struct acpi_subtable_header *header)
+{
+	struct acpi_madt_rintc *rintc = (void *)header;
+	int cpu;
+
+	if (!rintc->imsic_size)
+		return 0;
+
+	cpu = hartid_to_cpu(rintc->hart_id);
+	if (cpu >= 0 && cpu < nr_cpus)
+		hart_has_imsic[cpu] = true;
+
+	return 0;
+}
+#endif
+
+static int dt_intc_phandle_to_cpu(const void *fdt, uint32_t phandle)
+{
+	int intc_node, cpu_node, cpus_node, ret, i;
+	struct dt_reg raw_reg;
+	u32 nac, nsc;
+	u64 hartid;
+
+	intc_node = fdt_node_offset_by_phandle(fdt, phandle);
+	if (intc_node < 0)
+		return -1;
+
+	/* cpu-intc -> cpu node -> /cpus */
+	cpu_node = fdt_parent_offset(fdt, intc_node);
+	if (cpu_node < 0)
+		return -1;
+
+	cpus_node = fdt_parent_offset(fdt, cpu_node);
+	if (cpus_node < 0)
+		return -1;
+
+	/* #address-cells / #size-cells live on /cpus, not on the cpu node */
+	ret = dt_get_nr_cells(cpus_node, &nac, &nsc);
+	if (ret < 0)
+		return -1;
+
+	dt_reg_init(&raw_reg, nac, nsc);
+	ret = dt_get_reg(cpu_node, 0, &raw_reg);
+	if (ret < 0)
+		return -1;
+
+	hartid = raw_reg.address_cells[0];
+	if (nac == 2)
+		hartid = (hartid << 32) | raw_reg.address_cells[1];
+
+	for (i = 0; i < nr_cpus; i++) {
+		if (cpus[i].hartid == hartid)
+			return i;
+	}
+	return -1;
+}
+
+static void dt_collect_imsic(void)
+{
+	const void *fdt = dt_fdt();
+	const fdt32_t *prop;
+	int node, len, ncells, i, cpu;
+	uint32_t phandle, irq;
+
+	node = -1;
+	while ((node = fdt_node_offset_by_compatible(fdt, node, "riscv,imsics")) >= 0) {
+		prop = fdt_getprop(fdt, node, "interrupts-extended", &len);
+		if (!prop || len < 0)
+			continue;
+
+		/* Each entry is <phandle irq>  (cpu-intc #interrupt-cells = 1) */
+		ncells = len / (int)sizeof(fdt32_t);
+		for (i = 0; i + 1 < ncells; i += 2) {
+			phandle = fdt32_to_cpu(prop[i]);
+			irq = fdt32_to_cpu(prop[i + 1]);
+
+			if (irq != IMSIC_SLEVEL_IRQ)
+				continue;
+
+			cpu = dt_intc_phandle_to_cpu(fdt, phandle);
+			if (cpu >= 0 && cpu < nr_cpus)
+				hart_has_imsic[cpu] = true;
+		}
+	}
+}
+
+static bool all_harts_have_imsic(void)
+{
+	int cpu;
+
+	memset(hart_has_imsic, 0, sizeof(hart_has_imsic));
+
+	if (dt_available())
+		dt_collect_imsic();
+#ifdef CONFIG_EFI
+	else
+		acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_collect_imsic);
+#endif
+
+	for (cpu = 0; cpu < nr_cpus; cpu++) {
+		if (!cpu_present(cpu))
+			continue;
+		if (!cpu_has_extension(cpu, ISA_SSAIA)) {
+			report_info("CPU %d (hartid %lu) has no Ssaia",
+				    cpu, cpus[cpu].hartid);
+			return false;
+		}
+		if (!hart_has_imsic[cpu]) {
+			report_info("CPU %d (hartid %lu) has no S-level IMSIC",
+				    cpu, cpus[cpu].hartid);
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static void check_sbi_040(void)
+{
+	report_prefix_push("SBI_040");
+
+	if (all_harts_have_imsic())
+		report_skip("IMSIC is present, IPI is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_IPI), "IPI extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_050(void)
+{
+	report_prefix_push("SBI_050");
+
+	if (all_harts_have_imsic())
+		report_skip("IMSIC is present, RFENCE is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_RFNC), "RFENCE extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_060(void)
+{
+	int cpu = smp_processor_id();
+
+	report_prefix_push("SBI_060");
+
+	if (cpu_has_extension(cpu, ISA_SSCSRIND) && cpu_has_extension(cpu, ISA_SSCCFG))
+		/*
+		 * TODO: OE_SBI_060_010 also requires Smcsrind and Smcdeleg,
+		 * but they are M-mode extensions and not present in the S-mode
+		 * ISA string (DT or RHCT). Revisit if BRS clarifies how to detect them.
+		 */
+		report_skip("Sscsrind and Ssccfg are present, PMU is not mandated");
+	else
+		report(sbi_probe(SBI_EXT_PMU), "PMU extension is implemented");
+
+	report_prefix_pop();
+}
+
+static void check_sbi_070(void)
+{
+	report_prefix_push("SBI_070");
+
+	if (dt_available())
+		report_skip("ACPI not available, DBCN is not mandated");
+	else {
+#ifdef CONFIG_EFI
+		struct spcr_descriptor *spcr;
+
+		spcr = find_acpi_table_addr(SPCR_SIGNATURE);
+		if (spcr == NULL)
+			report_skip("SPCR is not present, DBCN is not mandated");
+		else {
+			if (spcr->interface_type == 0x15)
+				report(sbi_probe(SBI_EXT_DBCN), "DBCN extension is implemented");
+			else
+				report_skip(
+					"SPCR interface type is %#x (not 0x15), DBCN is not mandated",
+					spcr->interface_type);
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
