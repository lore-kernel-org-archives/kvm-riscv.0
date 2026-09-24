Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F36DC9830D
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MP48cSL53IW/e35xhC0wv3CdNzAWWylEtVU6XsoF64=; b=E1KUQyiqV49QYH
	NPB1xM7rE34XDeTUcVPLmMuUAyicXqxkzEJNzm+RgrBA8AeLLU3Kphn8rj6qDK62GVoielNA0yDZd
	lnPT7iy51WJIdr7oV62h9gjEdvzxQPMTmOHNoRTZudvzkCRwT4rEeDpcP8aqtq2isZvFTEuUfJFEL
	mOwN4nhzNWhpwQoYFAxZR2keJVHrwDuELHmRF2Umll+RBj4mQytPM74N85xjnQsAKmFWhY+/NhZVv
	F0/PGqzQRPjwEJ3cGlo8jOFCtKrCNa3PJpcP/g74lD5JmSDLb1KgVKz3biqRq35z+W9EAOV5OWIba
	WTV9lIlWkYPq/4b8LArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJf-00000009xdN-3vkU;
	Thu, 24 Sep 2026 03:40:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJT-00000009xWH-3XOM
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:40:10 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowACHWOyHm7RqBk_JCA--.1110S2;
	Thu, 24 Sep 2026 11:39:51 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 4/7] riscv: Add ACPI support for ISA string discovery
Date: Thu, 24 Sep 2026 11:39:42 +0800
Message-ID: <20260924033945.176581-5-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHWOyHm7RqBk_JCA--.1110S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWrtw1DuFy8JrWktrWrZrb_yoWrtr1UpF
	4fK34YyrsrXa1xW34Sq3yjvw43Xry8Cr4xJrs7JaySyr4kGa4jqF4kKF13uFy5Ga95Wa1a
	vrs8Ka4jgF1UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUFksgUUUUU=
X-Originating-IP: [122.194.100.201]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_204000_254536_188F6BF7 
X-CRM114-Status: GOOD (  14.84  )
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

When a DT is not provided, walk the RHCT Hart Info nodes and parse
the referenced ISA String node instead of aborting in isa_init()
and cpu_has_extension_name().

Match the current hart by ACPI UID (DT still matches by hartid)
and feed the ISA string into the existing isa_parse() helper so
extension detection is shared by both firmware descriptions.

Rename isa_info.hartid to isa_info.id so the same iterator state
can hold either identifier.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/acpi.h      | 28 ++++++++++++++++++++
 lib/riscv/isa.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index 2597e8ce..3db382b7 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -337,6 +337,34 @@ struct acpi_table_rhct {
 	u32 node_offset;
 };
 
+#define ACPI_RHCT_NODE_HEADER_DEF \
+	u16 type;	\
+	u16 length;	\
+	u16 revision;	\
+
+struct acpi_rhct_node {
+	ACPI_RHCT_NODE_HEADER_DEF
+	char data[];
+};
+
+enum acpi_rhct_node_type {
+	RHCT_NODE_ISA_STRING = 0x0,
+	RHCT_NODE_HART_INFO = 0xFFFF
+};
+
+struct acpi_rhct_node_isa_string {
+	ACPI_RHCT_NODE_HEADER_DEF
+	u16 isa_length;
+	char isa[];
+};
+
+struct acpi_rhct_node_hart_info {
+	ACPI_RHCT_NODE_HEADER_DEF
+	u16 num_offsets;
+	u32 uid;
+	u32 nodes[];
+};
+
 /* Reset to default packing */
 #pragma pack()
 
diff --git a/lib/riscv/isa.c b/lib/riscv/isa.c
index bc1c9c72..b0257979 100644
--- a/lib/riscv/isa.c
+++ b/lib/riscv/isa.c
@@ -12,7 +12,7 @@
 typedef void (*isa_func_t)(const char *, int, void *);
 
 struct isa_info {
-	unsigned long hartid;
+	unsigned long id;
 	isa_func_t func;
 	void *data;
 };
@@ -74,7 +74,7 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
 	const struct fdt_property *prop;
 	int len;
 
-	if (hartid != info->hartid)
+	if (hartid != info->id)
 		return;
 
 	prop = fdt_get_property(dt_fdt(), cpu_node, "riscv,isa", &len);
@@ -83,32 +83,80 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
 	isa_parse(prop->data, len, info);
 }
 
-static void isa_init_acpi(void)
+#ifdef CONFIG_EFI
+#include <acpi.h>
+
+static void isa_parse_acpi(struct acpi_table_rhct *rhct, struct acpi_rhct_node_hart_info *hart_info, void *data)
+{
+	u32 offset;
+	struct acpi_rhct_node *node;
+	struct acpi_rhct_node_isa_string *isa_string;
+	struct isa_info *info = (struct isa_info *)data;
+
+	if (hart_info->uid != info->id)
+		return;
+
+	for (int i = 0; i < hart_info->num_offsets; i++) {
+		offset = hart_info->nodes[i];
+		if (offset >= rhct->length)
+			break;
+		node = (void *)rhct + offset;
+		if (node->type == RHCT_NODE_ISA_STRING) {
+			isa_string = (void *) node;
+			isa_parse(isa_string->isa, isa_string->isa_length, info);
+		}
+	}
+}
+
+static void acpi_rhct_for_each_hart(
+	void (*func)(struct acpi_table_rhct *, struct acpi_rhct_node_hart_info *, void *), void *data)
 {
-	assert_msg(false, "ACPI not available");
+	u32 offset;
+	struct acpi_table_rhct *rhct;
+	struct acpi_rhct_node *node;
+	struct acpi_rhct_node_hart_info *hart_info;
+	rhct = find_acpi_table_addr(RHCT_SIGNATURE);
+	assert_msg(rhct, "Cannot find ACPI RHCT");
+	offset = rhct->node_offset;
+	for (int i = 0; i < rhct->node_count; i++) {
+		if (offset >= rhct->length)
+			break;
+		node = (void *)rhct + offset;
+		if (node->type == RHCT_NODE_HART_INFO) {
+			hart_info = (void *)node;
+			func(rhct, hart_info, data);
+		}
+		assert(node->length >= sizeof(*node));
+		offset += node->length;
+	}
 }
+#endif
 
 void isa_init(struct thread_info *ti)
 {
 	struct isa_info info = {
-		.hartid = ti->hartid,
 		.func = isa_bit,
 		.data = ti,
 	};
 	int ret;
 
 	if (dt_available()) {
+		info.id = ti->hartid;
 		ret = dt_for_each_cpu_node(isa_parse_fdt, &info);
 		assert(ret == 0);
 	} else {
-		isa_init_acpi();
+#ifdef CONFIG_EFI
+		info.id = ti->uid;
+		acpi_rhct_for_each_hart(isa_parse_acpi, &info);
+#else
+		assert_msg(false, "ACPI not available");
+#endif
 	}
 }
 
 bool cpu_has_extension_name(int cpu, const char *ext)
 {
 	struct isa_info info = {
-		.hartid = cpus[cpu].hartid,
 		.func = isa_name,
 		.data = &(struct isa_check){ .ext = ext, },
 	};
@@ -116,10 +164,16 @@ bool cpu_has_extension_name(int cpu, const char *ext)
 	int ret;
 
 	if (dt_available()) {
+		info.id = cpus[cpu].hartid;
 		ret = dt_for_each_cpu_node(isa_parse_fdt, &info);
 		assert(ret == 0);
 	} else {
+#ifdef CONFIG_EFI
+		info.id = cpus[cpu].uid;
+		acpi_rhct_for_each_hart(isa_parse_acpi, &info);
+#else
 		assert_msg(false, "ACPI not available");
+#endif
 	}
 
 	return check->found;
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
