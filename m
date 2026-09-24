Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB3C9830D
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChrUFYnhH4YdAdOYeRcll6f/OLp+UjDlTSZSnrIsLtk=; b=g9w6TMISFr9mjo
	FQd4g1EL+jcNO9woeaDy/CQ6NlL+urNHZc9p8QMdJ9jaSW438R9QlN7f3IG4lBAT80+wlWNV82mOx
	ehS/v3+1G4xQB8KhZE6qRgf1/NQ20YpxddZLtcK//0qmLS1xkQYBS1uHnnOBIvDNcMDVXADfu0f2V
	Fo+uaY12cwOfbJ6UXJ6/CesddSGCMeVpKuui5qYVBmDCzNdtpJcs/O7cMnuIi9G1Hzb/FN5jEnr4K
	s6ozN29dN11x8nR1snf3jR6dBW5toBYWJBZVdwUsYJEvmsHBm1iggt/bgsq8wEuA8XHgDTrJZp5Kw
	VwKnUdw+aDVoRqRZ0ZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJY-00000009xYz-2ZHt;
	Thu, 24 Sep 2026 03:40:04 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJW-00000009xXQ-1LF2
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:40:03 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowADHn_OHm7Rq+07JCA--.42549S2;
	Thu, 24 Sep 2026 11:39:51 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 3/7] riscv: Add ACPI support for timer frequency discovery
Date: Thu, 24 Sep 2026 11:39:41 +0800
Message-ID: <20260924033945.176581-4-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHn_OHm7Rq+07JCA--.42549S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UCrWfCFW5Gr48Zw15CFg_yoW5Xr1xpF
	s3KF43Kry7Ja4fWwnxZrn8trn5twnY93WxKr42yry3ua1DWa4DJa15Xrn2qFyfX3yDJa9x
	Krn5GasIgr45WrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260923_204002_721900_68454CFC 
X-CRM114-Status: GOOD (  11.69  )
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

When a DT is not provided, read the system time base frequency from
the RHCT instead of aborting in timer_get_frequency().

RHCT Time Base Frequency is the ACPI equivalent of the DT
/cpus timebase-frequency property and is the same for all harts.
Keep DT as the preferred path when one is available.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/acpi.h        |  9 +++++++++
 lib/riscv/timer.c | 37 +++++++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index a905807d..2597e8ce 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -20,6 +20,7 @@
 #define MADT_SIGNATURE ACPI_SIGNATURE('A','P','I','C')
 #define SPCR_SIGNATURE ACPI_SIGNATURE('S','P','C','R')
 #define GTDT_SIGNATURE ACPI_SIGNATURE('G','T','D','T')
+#define RHCT_SIGNATURE ACPI_SIGNATURE('R','H','C','T')
 
 #define ACPI_SIGNATURE_8BYTE(c1, c2, c3, c4, c5, c6, c7, c8) \
 	(((uint64_t)(ACPI_SIGNATURE(c1, c2, c3, c4))) |	     \
@@ -328,6 +329,14 @@ struct acpi_table_gtdt {
 	u32 virtual_el2_timer_flags;
 };
 
+struct acpi_table_rhct {
+	ACPI_TABLE_HEADER_DEF
+	u32 flags;
+	u64 timebase_frequency;
+	u32 node_count;
+	u32 node_offset;
+};
+
 /* Reset to default packing */
 #pragma pack()
 
diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
index 18063b7e..2a18f0e0 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -13,24 +13,37 @@
 #include <asm/smp.h>
 #include <asm/timer.h>
 
+#ifdef CONFIG_EFI
+#include <acpi.h>
+#endif
+
 void timer_get_frequency(void)
 {
-	const struct fdt_property *prop;
-	u32 *data;
-	int cpus, len;
-
-	assert_msg(dt_available(), "ACPI not yet supported");
+	if (dt_available()) {
+		const struct fdt_property *prop;
+		u32 *data;
+		int cpus, len;
 
-	const void *fdt = dt_fdt();
+		const void *fdt = dt_fdt();
 
-	cpus = fdt_path_offset(fdt, "/cpus");
-	assert(cpus >= 0);
+		cpus = fdt_path_offset(fdt, "/cpus");
+		assert(cpus >= 0);
 
-	prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
-	assert(prop != NULL && len == 4);
+		prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
+		assert(prop != NULL && len == 4);
 
-	data = (u32 *)prop->data;
-	timebase_frequency = fdt32_to_cpu(*data);
+		data = (u32 *)prop->data;
+		timebase_frequency = fdt32_to_cpu(*data);
+	} else {
+#ifdef CONFIG_EFI
+		struct acpi_table_rhct *rhct;
+		rhct = find_acpi_table_addr(RHCT_SIGNATURE);
+		assert_msg(rhct, "Cannot find ACPI RHCT");
+		timebase_frequency = rhct->timebase_frequency;
+#else
+		assert_msg(false, "ACPI not available");
+#endif
+	}
 }
 
 void timer_start(unsigned long duration_us)
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
