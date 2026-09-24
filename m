Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373AC98314
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmxbzkQ72PtaHuI2n9Wg5jEb9XQcS5Vawq+CMPNejEM=; b=bf8FXvDlTAbzdq
	Uo2oowN11kmzoYGvYbMsQLST9/6K8cPptXzfuIpqTmqzmeRCIC7XtK0227SDqf83rckdj4jdClEVM
	rRUQ133WzePpyXLCS8OX3StrMMwkT7LfSSRXwK9AADnrU4qFkcj0FoutVrgK7RGuMydMwqTlGxwF0
	cNgYLYiUS4gW3K06x8h/Amp8c93EBX74aDwcyLWK6o5Eb+sAunqkwIjKvSV3tCucP3fscIS34njdl
	L4XNim+AFX9NF59WPR3xRv+TmVgBHHDnk8HFzqTLFLe8k31CDyPumSM1ApGxuJloT+xECj9zvVswz
	CVN/GQbhft40MsqijN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJa-00000009xah-39nP;
	Thu, 24 Sep 2026 03:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJZ-00000009xYu-0L8D
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 03:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cJ4LQFSFjx/J9YKcdB+Bx/Lyi/mZxOvRFAXrACjKfu4=; b=AxxuCOzK9cIbi+0xmSrIyjnGte
	6IcQp1F3S+0bEJ+S8sGsZFUKytalh4yUWgUXRWpwoGwbi6EuwwzdYNrbbvU50g0FcQlOfZ7RNRsFB
	Nm1djGRW1WkbNq4ssw8+VfLoZ9BkjXAaMRiMagSbJQ+0o5bYU7sgdnPVyAhHGoOxl/QGt0z+rbVNi
	K8tT0W29T0mONeE7gF5o79P7CknXOnmepuq/E1WMRCPuj7zcWKVb6fqN+zutQHT3gGpnAo42Wq9eb
	vvxTLMyQZBPFNrAgZHkq2Zqabz+Krv70e+3zqSyPftiNfYzYANwRnVQTTQDENvvDjXx5/TBW7Jza/
	jtlYiiXg==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9aJR-0000000FVSu-28VH
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:40:02 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowAAH3fCGm7Rq+k7JCA--.41215S2;
	Thu, 24 Sep 2026 11:39:50 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 2/7] riscv: Add ACPI support for CPU initialization
Date: Thu, 24 Sep 2026 11:39:40 +0800
Message-ID: <20260924033945.176581-3-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAH3fCGm7Rq+k7JCA--.41215S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyxXr13Xw18Kr15Cr4UJwb_yoWrXF4kpF
	Wqgw4rJrZ8uFWSq3sxJFWUJ34fJF4Syr1xXrs3G34fXF47GryDXFWkt34Utr9xXay8Xay3
	ZFZYgry8ua13Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUwL05UUUUU=
X-Originating-IP: [122.194.100.201]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043958_864043_DB3847E3 
X-CRM114-Status: GOOD (  14.03  )
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

When a DT is not provided, discover harts from the MADT RINTC
subtables (ACPI 6.6 type 24) instead of aborting in cpu_init_acpi().

Parse each RINTC entry for hart_id and ACPI UID, record them in
thread_info, and mark the CPU present only if it is Enabled in
the RINTC flags and SBI reports the hart as available.

Also add the RINTC MADT structure and the MADT types introduced
after GENERIC_TRANSLATOR so the RISC-V interrupt controller
entries can be identified.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/acpi.h                | 30 +++++++++++++++++++++++++++++-
 lib/riscv/asm/processor.h |  1 +
 lib/riscv/setup.c         | 28 +++++++++++++++++++++++++++-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index a62cd3a9..a905807d 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -226,6 +226,22 @@ struct acpi_madt_generic_translator {
 	u32 reserved2;
 };
 
+/* 24: RISC-V Interrupt Controller (RINTC) Structure (ACPI 6.6) */
+struct acpi_madt_rintc {
+	u8 type;
+	u8 length;
+	u8 version;
+	u8 reserved;		/* reserved - must be zero */
+	u32 flags;
+	u64 hart_id;
+	u32 uid;
+	u32 ext_intc_id;
+	u64 imsic_addr;
+	u32 imsic_size;
+};
+
+#define ACPI_RINTC_FLAGS_ENABLED	1
+
 /* Values for MADT subtable type in struct acpi_subtable_header */
 
 enum acpi_madt_type {
@@ -245,7 +261,19 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_GENERIC_MSI_FRAME = 13,
 	ACPI_MADT_TYPE_GENERIC_REDISTRIBUTOR = 14,
 	ACPI_MADT_TYPE_GENERIC_TRANSLATOR = 15,
-	ACPI_MADT_TYPE_RESERVED = 16	/* 16 and greater are reserved */
+	ACPI_MADT_TYPE_MULTIPROCESSOR_WAKEUP = 16,
+	ACPI_MADT_TYPE_CORE_PIC = 17,
+	ACPI_MADT_TYPE_LIO_PIC = 18,
+	ACPI_MADT_TYPE_HT_PIC = 19,
+	ACPI_MADT_TYPE_EIO_PIC = 20,
+	ACPI_MADT_TYPE_MSI_PIC = 21,
+	ACPI_MADT_TYPE_BIO_PIC = 22,
+	ACPI_MADT_TYPE_LPC_PIC = 23,
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_IMSIC = 25,
+	ACPI_MADT_TYPE_APLIC = 26,
+	ACPI_MADT_TYPE_PLIC = 27,
+	ACPI_MADT_TYPE_RESERVED = 28	/* 28 and greater are reserved */
 };
 
 /* MADT Local APIC flags */
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index a3dab064..5a1df355 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -14,6 +14,7 @@ typedef void (*exception_fn)(struct pt_regs *);
 struct thread_info {
 	int cpu;
 	unsigned long hartid;
+	unsigned long uid;
 	unsigned long isa[1];
 	unsigned long sp;
 	exception_fn exception_handlers[EXCEPTION_CAUSE_MAX];
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 8c22120d..72de2145 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -48,6 +48,29 @@ uint64_t timebase_frequency;
 
 static struct mem_region riscv_mem_regions[NR_MEM_REGIONS + 1];
 
+#ifdef CONFIG_EFI
+#include <acpi.h>
+
+static int cpu_set_acpi(struct acpi_subtable_header *header)
+{
+	int cpu = nr_cpus++;
+	struct acpi_madt_rintc *intc = (void *)header;
+
+	assert_msg(cpu < NR_CPUS, "Number cpus exceeds maximum supported (%d).", NR_CPUS);
+
+	cpus[cpu].cpu = cpu;
+	cpus[cpu].hartid = intc->hart_id;
+	cpus[cpu].uid = intc->uid;
+
+	if (intc->flags & ACPI_RINTC_FLAGS_ENABLED) {
+		if (!sbi_hart_get_status(cpus[cpu].hartid).error)
+			set_cpu_present(cpu, true);
+	}
+
+	return 0;
+}
+#endif
+
 static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 {
 	int cpu = nr_cpus++;
@@ -63,7 +86,11 @@ static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 
 static void cpu_init_acpi(void)
 {
+#ifdef CONFIG_EFI
+	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, cpu_set_acpi);
+#else
 	assert_msg(false, "ACPI not available");
+#endif
 }
 
 static void cpu_init(void)
@@ -226,7 +253,6 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 
 #ifdef CONFIG_EFI
 #include <efi.h>
-#include <acpi.h>
 
 extern unsigned long exception_vectors;
 extern unsigned long boot_hartid;
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
