Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BEC606A31B
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dwaQ8nO4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P7tujs9qO7ZNKxFY0Sbo6IZPogSlsK9eNb0xVsXvmlY=; b=dwaQ8nO4bMYGiiCdzna5XC0bj8
	rw/mBfd0PjvbFGLE2Vipq80soBkd2ZkdTsZhEgDOcc2XnU4nwkwLJb4PiPentvGAeR4Hle8WgqD9x
	ioE28GuWS7ymKICRyB5IjoD2sXyfPHL/ytoCBRtQiRgkEtIC7BKj7ImJ/fMdPj+BNKYY+kirhR/+L
	3ix+S0yX6nH6uE2kJYWQzhfw4lTJitlfBXCsDnRnHfNyhrT+Lg4VgsE9dNH9cdF5H+wAuoyij00+l
	7gaZh77dMKmO76EWR8/y9HNPR0ydV1YzTvZTWNib66DxrBN0YNvc+/x3k2UQlHFnMq0Vt5YrYsOax
	bjEllR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiX-000000088jE-3iYm;
	Thu, 05 Nov 2026 08:21:06 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiH-000000088Xx-2ijK
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:21:01 +0000
Received: from localhost (unknown [122.194.100.204])
	by APP-01 (Coremail) with SMTP id qwCowABXgvxZPOxq0idRAA--.3359S2;
	Thu, 05 Nov 2026 16:20:41 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 4/8] riscv: Add ACPI support for ISA string discovery
Date: Thu,  5 Nov 2026 16:20:31 +0800
Message-ID: <20261105082035.133680-5-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABXgvxZPOxq0idRAA--.3359S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWrtw1DuFy8JrWktrWrZrb_yoWrtw1fpF
	4fK34YyrsrJa1xW34Sq3yjvw43GrykCr4xtrs3JaySyw4kGa4jqF4kKF1rZFyrJan5Wa1a
	vrs8KayjgF1UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8a9aDUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002050_067691_57546C52 
X-CRM114-Status: GOOD (  15.58  )
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
 lib/acpi.h      | 28 +++++++++++++++++
 lib/riscv/isa.c | 81 ++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/lib/acpi.h b/lib/acpi.h
index 0589669b..d5e238a9 100644
--- a/lib/acpi.h
+++ b/lib/acpi.h
@@ -334,6 +334,34 @@ struct acpi_table_rhct {
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
+	ACPI_RHCT_NODE_TYPE_ISA_STRING = 0x0,
+	ACPI_RHCT_NODE_TYPE_HART_INFO = 0xFFFF
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
index bc1c9c72..91c7302c 100644
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
@@ -83,32 +83,92 @@ static void isa_parse_fdt(int cpu_node, u64 hartid, void *data)
 	isa_parse(prop->data, len, info);
 }
 
-static void isa_init_acpi(void)
+#ifdef CONFIG_EFI
+#include <acpi.h>
+
+static void isa_parse_acpi(struct acpi_table_rhct *rhct,
+			   struct acpi_rhct_node_hart_info *hart_info, void *data)
 {
-	assert_msg(false, "ACPI not available");
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
+		if (node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
+			isa_string = (void *) node;
+			isa_parse(isa_string->isa, isa_string->isa_length, info);
+		}
+	}
+}
+
+static int acpi_rhct_for_each_hart(void (*func)(struct acpi_table_rhct *,
+						 struct acpi_rhct_node_hart_info *,
+						 void *), void *data)
+{
+	u32 offset;
+	struct acpi_table_rhct *rhct;
+	struct acpi_rhct_node *node;
+	struct acpi_rhct_node_hart_info *hart_info;
+
+	rhct = find_acpi_table_addr(RHCT_SIGNATURE);
+	if (rhct == NULL)
+		return -1;
+
+	offset = rhct->node_offset;
+	for (int i = 0; i < rhct->node_count; i++) {
+		if (offset >= rhct->length)
+			return -1;
+
+		node = (void *)rhct + offset;
+		if (node->length < sizeof(*node))
+			return -1;
+
+		if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO) {
+			hart_info = (void *)node;
+			func(rhct, hart_info, data);
+		}
+
+		offset += node->length;
+	}
+
+	return 0;
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
+		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
+		assert(ret == 0);
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
@@ -116,10 +176,17 @@ bool cpu_has_extension_name(int cpu, const char *ext)
 	int ret;
 
 	if (dt_available()) {
+		info.id = cpus[cpu].hartid;
 		ret = dt_for_each_cpu_node(isa_parse_fdt, &info);
 		assert(ret == 0);
 	} else {
+#ifdef CONFIG_EFI
+		info.id = cpus[cpu].uid;
+		ret = acpi_rhct_for_each_hart(isa_parse_acpi, &info);
+		assert(ret == 0);
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
