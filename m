Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D804606A321
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WN+rFaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fVo6SGyjCOMqlW7Myx6wNq+kMXDut1YNz4Hxcq/90iM=; b=2WN+rFaAVucT+bJtmSj4q7fYRk
	ErMOFg1bceKMlJjfMSgsXIPCm9IEozSuvAgesCnO9RL0VNKhQF6I+Hlmvk3rfGHxMW33oLV62rnkw
	VrSpIUUzxaePLPEnN3ytZZdRv/oKWZQR3DoJrLHsnhCps6Guz4AOUPi0dEUXCYFkZ32ahSrHExQ1K
	9vzWl7sfsuG3tzY2DFN4prriu6OYQ4Ywi7BX6BdbX/OQdaNxGHbKdahgDZ63c7HyUvFOfYyiPreJx
	2kvolxfLg9H26O7CnPY+/1j8etbcZMWc9XUMJJF3rQLYPXspZ81S2Xv/cyJMVZfTpkKZYZ7O2qXgJ
	PE0l76Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23k-00000008Cob-3aFX;
	Wed, 25 Nov 2026 01:44:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23h-00000008CnC-3T5W
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:31 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowABncJF6PQZrrtm8AQ--.760S2;
	Wed, 25 Nov 2026 09:44:26 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 2/9] riscv: Add ACPI support for CPU initialization
Date: Wed, 25 Nov 2026 09:44:02 +0800
Message-ID: <20261125014409.79852-3-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABncJF6PQZrrtm8AQ--.760S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFyxXr13Xw18uw4UJF47Arb_yoWrXry3pF
	yqg3yrJrW5uFWSq3sxJFyUJw1fJF4Syr1xXrs3G34fXF47GryDXFWkt34Utr9xXay8Way3
	Zan5Kry8ua13Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUe_MaUUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_174430_239835_FC1AFEE5 
X-CRM114-Status: GOOD (  14.21  )
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
 lib/acpi.h                | 27 ++++++++++++++++++++++++++-
 lib/riscv/asm/processor.h |  1 +
 lib/riscv/setup.c         | 28 +++++++++++++++++++++++++++-
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index a62cd3a9..f6c92d28 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -226,6 +226,19 @@ struct acpi_madt_generic_translator {
 	u32 reserved2;
 };
 
+/* 24: RISC-V Interrupt Controller (RINTC) Structure (ACPI 6.6) */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
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
 /* Values for MADT subtable type in struct acpi_subtable_header */
 
 enum acpi_madt_type {
@@ -245,7 +258,19 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_GENERIC_MSI_FRAME = 13,
 	ACPI_MADT_TYPE_GENERIC_REDISTRIBUTOR = 14,
 	ACPI_MADT_TYPE_GENERIC_TRANSLATOR = 15,
-	ACPI_MADT_TYPE_RESERVED = 16	/* 16 and greater are reserved */
+	ACPI_MADT_TYPE_MULTIPROC_WAKEUP = 16,
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
index 8c22120d..f1121573 100644
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
+	if (intc->flags & ACPI_MADT_ENABLED) {
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
