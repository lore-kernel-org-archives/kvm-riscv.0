Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD62CA0EE8
	for <kvm-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Mime-Version:From:Date:To:Message-Id
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jScl7mdbyfVtkmqnC0DC5gkGafJjsCTUVzJ1Ta2OZ+Y=; b=TvdENpeVt18LU7
	GpSYbes44+i26juEQ0WLPKwkZxD//zv02+n6MnfxWpxAglxgiY8+hGrB7QX6+9/O6hF3OyzHpsks5
	qv+iam69tLNbuhr18VqTE7ab5GyPWgi/kaVDevmy+PZSb1IRhlAnxRXUv0fT6PUMaHiGLr11kuS6+
	FhgBne+EBkrt4190RpUl/loyfEkvxRhNwHjjpI4BxKm8eEDDiK8voPIaDhDDonXAhhIpTG4UJKhw+
	Yzqqw0M6TOEeQvEDnm3w88mRnP36PiSyiQefqyTTD65ZI6MgeIPUEhQwAdTS+dAPxSHxsEACV0FLX
	9He+BzOBCthkTpL+rS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynud-0000000AiHh-29iw;
	Wed, 17 Sep 2025 08:53:15 +0000
Received: from sg-1-36.ptr.blmpb.com ([118.26.132.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynua-0000000AiGM-0uUp
	for kvm-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 08:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1758099181;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=h7Z/HOQPJW5/DLBofPfWPAnGx2zrqJmmsBycrRC0XrQ=;
 b=WkXgNAV/SA8uP7jnNMyoR3dKk7+6PrGMp/9HHMySUNi4e7gkpZcmuhOqKluuU8k2iSkcpJ
 p9dIJ7+5dUKz0CfO+WTijrdIukMfnq7sVTFtaebrZETwB2T2pBdEMp93gMofYfMfQSLhCU
 EEl946pF3173RHATlpgr8YZD58iqByWkfveVTvX7oYuhYpFC0m2zXzaDWWVEQDr7Fwkgsx
 1KWc8YwwTN3iAjVdVisHiDss9INHsos9tVNYts7dAsj6IlpN3RoJ6crgPek6dJe1R05/yP
 C2BpjqMd9kiM2LvGZ+tV6Lb9/2Pxa049Ii6ePaFxhtymjnYpo5fJ2koUDIj5tQ==
Subject: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-Id: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+268ca76eb+412c6f+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Received: from Bill.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Wed, 17 Sep 2025 16:52:58 +0800
To: <anup@brainfault.org>
X-Mailer: git-send-email 2.43.0
Date: Wed, 17 Sep 2025 16:52:46 +0800
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
Cc: <kvm-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <atishp@rivosinc.com>, 
	<ajones@ventanamicro.com>, 
	"BillXiang" <xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015312_622373_3C2734F2 
X-CRM114-Status: GOOD (  12.69  )
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

Move those sbi ext ids to uapi because they will be forwarded
to user space by kvm.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/include/asm/sbi.h      | 16 +-----------
 arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/sbi.h

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..e196feaabb2e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,13 +10,12 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <uapi/asm/sbi.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
 #ifdef CONFIG_RISCV_SBI_V01
 	SBI_EXT_0_1_SET_TIMER = 0x0,
-	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
-	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
 	SBI_EXT_0_1_CLEAR_IPI = 0x3,
 	SBI_EXT_0_1_SEND_IPI = 0x4,
 	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
@@ -37,13 +36,6 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
 
-	/* Experimentals extensions must lie within this range */
-	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
-	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
-
-	/* Vendor extensions must lie within this range */
-	SBI_EXT_VENDOR_START = 0x09000000,
-	SBI_EXT_VENDOR_END = 0x09FFFFFF,
 };
 
 enum sbi_ext_base_fid {
@@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_STOP_FLAG_RESET BIT(0)
 #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
-enum sbi_ext_dbcn_fid {
-	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
-	SBI_EXT_DBCN_CONSOLE_READ = 1,
-	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
-};
-
 /* SBI STA (steal-time accounting) extension */
 enum sbi_ext_sta_fid {
 	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
new file mode 100644
index 000000000000..d29ac0abeefe
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/sbi.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
+ *
+ * Authors:
+ *     BillXiang <xiangwencheng@lanxincomputing.com>
+ */
+
+#ifndef _UAPI_ASM_RISCV_SBI_H
+#define _UAPI_ASM_RISCV_SBI_H
+
+
+enum SBI_EXT_ID {
+	/*
+	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
+	* handled in kernel so they will be forwarded to userspace by kvm.
+	*/
+	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
+	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
+	/*
+	* Both SBI experimental and vendor extensions are
+	* unconditionally forwarded to userspace by kvm.
+	*/
+	/* Experimentals extensions must lie within this range */
+	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
+	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
+
+	/* Vendor extensions must lie within this range */
+	SBI_EXT_VENDOR_START = 0x09000000,
+	SBI_EXT_VENDOR_END = 0x09FFFFFF,
+};
+
+/*
+* The SBI debug console functions are unconditionally
+* forwarded to the userspace by kvm.
+*/
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ = 1,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
+};
+
+#endif /* _UAPI_ASM_RISCV_SBI_H */
\ No newline at end of file
-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
