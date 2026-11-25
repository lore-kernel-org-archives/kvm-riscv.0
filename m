Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F353606A323
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FZZyIoQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wDViGRIt4poHhrCIXWWmwfpEPl8UlVJWjaanpSSGj7Q=; b=FZZyIoQ2Nfy5LIF74F6p7oJDcT
	cS0WjUAK4mnQYUeNi9CcB1SCVU6OekbEBr+l6K/5C/TNeDd3f322T/30kpBr6ceNSkXc49xwqFl7U
	uYH0I/kEEl+UpeZnlRt6Fiyujo/TRah/oC1HcPMFkzqmob2VazgdhWjNUId90zoxBwblgBQZhphos
	5eVwxrcOPqB8dj5CytX5iXZeGPywx4ZTwvEg647VZyIdCsPxIN/Amv1B9/KeoiXVTRs2ZQLbAX9m3
	tSWo/2sXdyvhSYRsEWl0m+RcFaTXXlv4J0rh/jw7b1rD63eJiuqR6iFk2ocXFataNPU/ZiY9YswSt
	Pq0akAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23k-00000008Cof-3mWs;
	Wed, 25 Nov 2026 01:44:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23i-00000008CnD-45zD
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:32 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowABXYZJ6PQZrudm8AQ--.23020S2;
	Wed, 25 Nov 2026 09:44:26 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 3/9] riscv: Add ACPI support for timer frequency discovery
Date: Wed, 25 Nov 2026 09:44:03 +0800
Message-ID: <20261125014409.79852-4-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXYZJ6PQZrudm8AQ--.23020S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UCrWfCw13Jr45XrW7XFb_yoW5Gw43pF
	s3KF43Jry7ta4fWwnxXrn8trn5tw1vkF18Kr42yrZxuF4DJa4DJa1Yqrn2qFyfX3yDAay3
	Kr1rGFZIgr4YgrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20261124_174431_411920_307F7539 
X-CRM114-Status: GOOD (  11.73  )
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

When a DT is not provided, read the system time base frequency from
the RHCT instead of aborting in timer_get_frequency().

RHCT Time Base Frequency is the ACPI equivalent of the DT
/cpus timebase-frequency property and is the same for all harts.
Keep DT as the preferred path when one is available.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/acpi.h        |  9 +++++++++
 lib/riscv/timer.c | 35 +++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index f6c92d28..0589669b 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -20,6 +20,7 @@
 #define MADT_SIGNATURE ACPI_SIGNATURE('A','P','I','C')
 #define SPCR_SIGNATURE ACPI_SIGNATURE('S','P','C','R')
 #define GTDT_SIGNATURE ACPI_SIGNATURE('G','T','D','T')
+#define RHCT_SIGNATURE ACPI_SIGNATURE('R','H','C','T')
 
 #define ACPI_SIGNATURE_8BYTE(c1, c2, c3, c4, c5, c6, c7, c8) \
 	(((uint64_t)(ACPI_SIGNATURE(c1, c2, c3, c4))) |	     \
@@ -325,6 +326,14 @@ struct acpi_table_gtdt {
 	u32 virtual_el2_timer_flags;
 };
 
+struct acpi_table_rhct {
+	ACPI_TABLE_HEADER_DEF
+	u32 flags;
+	u64 time_base_freq;
+	u32 node_count;
+	u32 node_offset;
+};
+
 /* Reset to default packing */
 #pragma pack()
 
diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
index 18063b7e..4400b6dc 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -12,25 +12,36 @@
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
+#include <acpi.h>
 
 void timer_get_frequency(void)
 {
-	const struct fdt_property *prop;
-	u32 *data;
-	int cpus, len;
+	if (dt_available()) {
+		const struct fdt_property *prop;
+		const void *fdt;
+		u32 *data;
+		int cpus, len;
 
-	assert_msg(dt_available(), "ACPI not yet supported");
+		fdt = dt_fdt();
+		cpus = fdt_path_offset(fdt, "/cpus");
+		assert(cpus >= 0);
 
-	const void *fdt = dt_fdt();
+		prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
+		assert(prop != NULL && len == 4);
 
-	cpus = fdt_path_offset(fdt, "/cpus");
-	assert(cpus >= 0);
-
-	prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
-	assert(prop != NULL && len == 4);
+		data = (u32 *)prop->data;
+		timebase_frequency = fdt32_to_cpu(*data);
+	} else {
+#ifdef CONFIG_EFI
+		struct acpi_table_rhct *rhct;
 
-	data = (u32 *)prop->data;
-	timebase_frequency = fdt32_to_cpu(*data);
+		rhct = find_acpi_table_addr(RHCT_SIGNATURE);
+		assert_msg(rhct, "Cannot find ACPI RHCT");
+		timebase_frequency = rhct->time_base_freq;
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
