Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBC606A326
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NxzXDeyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dleQar+U9uoyvjlnl/C9QuQ29w8b6LbxbEkXeUnq65o=; b=NxzXDeygqHTlLEotmCkCO1jwgr
	/2dZrVoDJlrFyx3bGTF32lFx6qYQcE7q4R5O+/smLmkFQgIh8eL1/8bk8aVby48OapO7pwlPcSxJ9
	GyH2F1s0+8dMt67yHXpxaqC6T/TulZRDmpeeOfoSEWgaFN/qfTO6NVccYSBUCghZKPzW9CTltIY0C
	ts2IqptNbCJBbCikrgIvXP5denAi31y+OxKVEj3QKkvTIF5SK5xk3QZyyV1jSFsMOrtpRhCd9r4Ss
	9J/VaiUm7lwdLe7BX/uC2BBEUOReIINlfCMPEh3ihDPPwBg2Z7Fd2Nl3N4c5gV0c6SaDr8QakyxG0
	v/URiv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiL-000000088b8-0keC;
	Thu, 05 Nov 2026 08:20:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiC-000000088Vz-2uC9
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:20:50 +0000
Received: from localhost (unknown [122.194.100.204])
	by APP-01 (Coremail) with SMTP id qwCowAAXQftYPOxqxydRAA--.3090S2;
	Thu, 05 Nov 2026 16:20:40 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 3/8] riscv: Add ACPI support for timer frequency discovery
Date: Thu,  5 Nov 2026 16:20:30 +0800
Message-ID: <20261105082035.133680-4-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAXQftYPOxqxydRAA--.3090S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4UCrWfCw13Jr45XrW7XFb_yoW5Xr1rpF
	Z3KF43Gry7ta4fWwnxZrn0qrn5tw1vkF18Kr42yrZxuF4DJa4DJa1Yqrn2qFyfX3yDJa9x
	Kr1rGa9I9r4jgrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8db1UUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002046_876568_4579B54E 
X-CRM114-Status: GOOD (  11.96  )
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
 lib/riscv/timer.c | 38 ++++++++++++++++++++++++++------------
 2 files changed, 35 insertions(+), 12 deletions(-)

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
index 18063b7e..a3af7e2b 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -13,24 +13,38 @@
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
+		const void *fdt;
+		u32 *data;
+		int cpus, len;
 
-	const void *fdt = dt_fdt();
+		fdt = dt_fdt();
+		cpus = fdt_path_offset(fdt, "/cpus");
+		assert(cpus >= 0);
 
-	cpus = fdt_path_offset(fdt, "/cpus");
-	assert(cpus >= 0);
+		prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
+		assert(prop != NULL && len == 4);
 
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
