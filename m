Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AB606ABCD
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8AZeUQX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZnTOhn4S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KL2snNOIrwVgzYgTeX/DquQfoVhRbAhNHjMEmAebPTE=; b=d8AZeUQXn88h3mYD2U0cEPKIz5
	yqADhUt+fxzvw3Wjjez8Xx3aqW3H/bYhJQF4vijYu0k42qs9tOGf71DRN4ki61jF8iHxyRjLTmgpD
	AwzGLigzTuplqwUPDv8obu2v1hapwBxgy2p2x90/N1SyB+61zPJUXwUmYzIcByZlltiWvEibm2gD2
	XD+7x3/TAsMk2RnwOAI7aQUx5WA8Tu0yDAQhOTc/+zKo6FLxUO/FI9tGswag1z1rUv5lWI3rCkU5C
	y18+GZMBpO+RCAQQL8xho6uxWVxw/7VXBHy49LmKW5uucAhQn0564SazbU/nO3t6hLgblLQKKGzjC
	4cueC6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP6j-0000000FCBL-10sa;
	Fri, 20 Nov 2026 13:56:53 +0000
Received: from out-20.mta1.migadu.com ([95.215.58.20] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP6c-0000000FC9i-3Uoq
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 13:56:50 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4XY1d+OhGR5x4v5Prl2atwh45R6+IudyppmJfV0vGaE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795183004; v=1; x=1795787804;
 b=ZnTOhn4Spuaxf1r9tHy/1Z5KsKeLK51U7Xf4u28Yj/FeW+TKNRVMC8APZ8MCHP051n42UuqK
 +ZOR7KFbdswppzTrw1T96MR5g8rIo6XMBA1IXj+9JPFs53+Y+ZLDEDYSHi4tL4GdcAshbwecBNG
 8Gv9cCsF2rLQilVlfRy+YPeE=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e35baf99532ce755;
	Fri, 20 Nov 2026 13:56:44 +0000
X-Mizu-Trace-ID: e35baf99532ce755
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH] riscv: Capture IMSIC addresses at boot time
Date: Fri, 20 Nov 2026 14:56:13 +0100
Message-ID: <20261120135613.1388647-1-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_055648_804723_70ADF1ED 
X-CRM114-Status: GOOD (  18.65  )
X-Spam-Score: -2.8 (--)
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

Tests may want to use the IMSICs for MSIs and the upcoming BRS tests
want to confirm IMSICs are present. Provide those tests the S-mode
interrupt file addresses by parsing DT and capturing them at boot time.

Cc: Xiang W <wangxiang@iscas.ac.cn>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/imsic.h     |  8 ++++
 lib/riscv/asm/processor.h |  1 +
 lib/riscv/imsic.c         | 86 +++++++++++++++++++++++++++++++++++++++
 lib/riscv/setup.c         |  2 +
 riscv/Makefile            |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 lib/riscv/asm/imsic.h
 create mode 100644 lib/riscv/imsic.c

diff --git a/lib/riscv/asm/imsic.h b/lib/riscv/asm/imsic.h
new file mode 100644
index 000000000000..c011b106da8c
--- /dev/null
+++ b/lib/riscv/asm/imsic.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_IMSIC_H_
+#define _ASMRISCV_IMSIC_H_
+#include <asm/processor.h>
+
+void imsic_init(struct thread_info *ti);
+
+#endif /* _ASMRISCV_IMSIC_H_ */
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index a3dab064691c..2c261805d181 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -15,6 +15,7 @@ struct thread_info {
 	int cpu;
 	unsigned long hartid;
 	unsigned long isa[1];
+	phys_addr_t imsic_addr;		/* S-level interrupt file, INVALID_PHYS_ADDR if none */
 	unsigned long sp;
 	exception_fn exception_handlers[EXCEPTION_CAUSE_MAX];
 	exception_fn interrupt_handlers[INTERRUPT_CAUSE_MAX];
diff --git a/lib/riscv/imsic.c b/lib/riscv/imsic.c
new file mode 100644
index 000000000000..f3e7361a79c7
--- /dev/null
+++ b/lib/riscv/imsic.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IMSIC support
+ */
+#include <libcflat.h>
+#include <bitops.h>
+#include <devicetree.h>
+#include <asm/imsic.h>
+#include <asm/processor.h>
+
+struct imsic_info {
+	unsigned long hartid;
+	phys_addr_t imsic_addr;
+};
+
+static void imsic_parse_fdt(int cpu_node, u64 hartid, void *data)
+{
+	struct imsic_info *info = (struct imsic_info *)data;
+	const void *fdt = dt_fdt();
+	int intc, node = -1;
+	u32 phandle;
+
+	if (info->hartid != hartid)
+		return;
+
+	info->imsic_addr = INVALID_PHYS_ADDR;
+
+	intc = fdt_subnode_offset(fdt, cpu_node, "interrupt-controller");
+	if (intc < 0)
+		return;
+
+	phandle = fdt_get_phandle(fdt, intc);
+
+	while ((node = fdt_node_offset_by_compatible(fdt, node, "riscv,imsics")) >= 0) {
+		struct dt_pbus_reg reg;
+		const fdt32_t *prop;
+		u64 stride, off;
+		u32 guest_bits;
+		int len, i;
+
+		prop = fdt_getprop(fdt, node, "interrupts-extended", &len);
+		if (!prop)
+			continue;
+
+		/* <phandle irq> pairs, since cpu-intc has #interrupt-cells = 1 */
+		for (i = 0; i + 1 < len / (int)sizeof(fdt32_t); i += 2) {
+			if (fdt32_to_cpu(prop[i]) == phandle &&
+			    fdt32_to_cpu(prop[i + 1]) == IRQ_S_EXT)
+				break;
+		}
+		if (i + 1 >= len / (int)sizeof(fdt32_t))
+			continue;
+
+		prop = fdt_getprop(fdt, node, "riscv,guest-index-bits", &len);
+		guest_bits = prop && len == sizeof(fdt32_t) ? fdt32_to_cpu(*prop) : 0;
+		stride = BIT_ULL(guest_bits) * SZ_4K;
+		off = (i / 2) * stride;
+
+		for (i = 0; dt_pbus_translate_node(node, i, &reg) == 0; i++) {
+			if (off < reg.size) {
+				assert(reg.size - off >= SZ_4K);
+				info->imsic_addr = reg.addr + off;
+				return;
+			}
+			off -= ALIGN(reg.size, stride);
+		}
+		assert_msg(false, "IMSIC interrupt file beyond reg regions");
+	}
+}
+
+void imsic_init(struct thread_info *ti)
+{
+	struct imsic_info info = {
+		.hartid = ti->hartid,
+	};
+	int ret;
+
+	if (dt_available()) {
+		ret = dt_for_each_cpu_node(imsic_parse_fdt, &info);
+		assert(ret == 0);
+	} else {
+		assert_msg(false, "ACPI not available");
+	}
+
+	ti->imsic_addr = info.imsic_addr;
+}
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index a30aa0c4cb80..99acb550cf32 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -16,6 +16,7 @@
 #include <on-cpus.h>
 #include <vmalloc.h>
 #include <asm/csr.h>
+#include <asm/imsic.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
 #include <asm/processor.h>
@@ -56,6 +57,7 @@ static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = regval;
+	imsic_init(&cpus[cpu]);
 
 	if (!sbi_hart_get_status(cpus[cpu].hartid).error)
 		set_cpu_present(cpu, true);
diff --git a/riscv/Makefile b/riscv/Makefile
index 348a30a77df9..f90992ab0b71 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -39,6 +39,7 @@ cflatobjs += lib/on-cpus.o
 cflatobjs += lib/vmalloc.o
 cflatobjs += lib/riscv/bitops.o
 cflatobjs += lib/riscv/delay.o
+cflatobjs += lib/riscv/imsic.o
 cflatobjs += lib/riscv/io.o
 cflatobjs += lib/riscv/isa.o
 cflatobjs += lib/riscv/mmu.o
-- 
2.56.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
