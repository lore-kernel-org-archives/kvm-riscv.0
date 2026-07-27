Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD05C53219
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6DsmPm+Hml+su+jKNfneoCSksRBZZJMmdTvaMw2p8I=; b=urti3aO+4YvgUT
	9DlyE4zWrwz0NcdryhMozjA0p9ju2a5J1NvqGiAicyDioRAAzc2D41FlweWIQY+bnzPy4LyOImIUX
	Htkd6ot6S3n1P1xTmrl4YElFyR8RjC0Ny4H8NpymiIO4eUWMePImYOPEG12jUiu5W14SikA9k2WP5
	yYILCu29RXXXFe7U/q/QDQipdwvAxxHzAZuc6LcSokzJ8ML99NP7nsXod1R06bO0m6aKC8PakQi3Y
	/b9e8Qau1L7AHeoq/y61QMbxAtJtgyvcGMPrd3E8FjnrzuMPVDO2/E84Z9L4d5iMgS4OiE2TwPlZ3
	J5N4eVRe5PJ7a4f5jQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTn-00000002i0j-1NOI;
	Mon, 27 Jul 2026 12:30:47 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTk-00000002hya-1dSk
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:45 +0000
Received: by mail-pj2-x03.google.com with SMTP id d9443c01a7336-2ccb0e85312so17154375ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155444; x=1785760244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTdBdaepYR3Npq5LgKxtOuDeDw6yKDcmDYCQg+CRMR4=;
        b=bYSJHOHHp6/7SGg4vQo+oxOle8dcEhVx8ZsjpnPG700xqSqvThKqSVx9Dnm0xhhAwY
         8xEP7qVjpfBhMZYOv79AZ+fFDlccz7ByJDAz0qZ2ikKmQcXPGo1SmvTFzuALk98Hwvoz
         T/W1JuPETRPlRgqoLEwdy42Hx5OeffaeIE6SLqWwxl0dC509Rm8zVL4AIbt5Q7Hx54CT
         4BM8GMMIID08wCcT9JEKVG7pdskJY+EEAJvS1Q0cJ8TCADj/E1T4fRWLl69y6OOIn74v
         539dIOXEj56MojJNIOnAAYlglpUwMlF74vNgKTYIP/itQUqVsLYQ6OkYA9PF4P8s5gnF
         hS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155444; x=1785760244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTdBdaepYR3Npq5LgKxtOuDeDw6yKDcmDYCQg+CRMR4=;
        b=Np/rW8X6Jn/fyZTa50KzACXClLfgruJIitZcq5CGfH1LDvzDfDZMsGU0DcRnu3nfze
         qoZjaRXPZkZbnSCyDj+KmDg9fTKOTQ93bKHAhj/LMgthslO3Tu1Znf0beQdel7b14lHg
         hpyZcyOayS60vKPmUbFl6CEBflZ4UKTCK/ClnmHGUYV9TacY5/x1+pOPLMrg84WUwLVO
         4++wnUrxtP5zy3pqs1RnJt49PHbLufW77ENMuNB3rQ7tMKyq3WGAHdOU6KnLiD/ux1Xz
         t9oM61LcliIcwQEVISpbcHsEo9UiIJicJiawtNR75Tuj6W2YBYHAvy8ogAR7qetPYDHt
         28Ww==
X-Forwarded-Encrypted: i=1; AHgh+RrPDtC2C79zTA3JeDUJydx44wUq+SeQPwnUbmgoy46wu+kM7mZ0Es6TNlPltZcnO90Agq8cUqnC8VI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHDQRAkkNN5q70HxaYBhTSVvV1tp6zp42Jej1l5Kj5HUEVgy/I
	MUp2tG0k+PA3sOnwMMEBjW9V8Bmzbv8MAOjc3598QhalWR8xqnYfILsH
X-Gm-Gg: AR+sD10OSq0sJBOo+wqriuMvkm1MEwFJekpsr8lEv8GzqeO+vqjXQ1/YJSbPINQsIwT
	mAwb7CKkRpfayrMZqwZ5gUjwiRftRJxIvQR6DbbkcxNMRGVhl0vcyO+eQAyl3iSBtR6QN2nSYHx
	8iDMEUS9viFzztOJyuYd9casIe2KQxhGABznsvnRBIxTUf00T7qjhucxS8rAbRepiFh0bzLJa12
	Xv98VV6zEF+FluTurq+yfmcIzpYJggOm2epAAKqdsOySlVHGSAjMwXk1hxJ+uzKpuDbgnyop5Gj
	HjelVztNN+2bqnY9vag/u9sagrb0zsZtZTSUBbJCf2G/ziYoM7Sh7sEPhQhM/3DZXIaHvrhQJ+z
	yxvGLnAQEmSpa0z8LKZnCm22zeh2g1688N0qPjEHp47+rtvTC15j+ZsxldHjvQUkbeXDrpKo=
X-Received: by 2002:a17:903:2284:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2cfde85fb71mr79666365ad.24.1785155441655;
        Mon, 27 Jul 2026 05:30:41 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:41 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v2 1/3] riscv: ptdump: Create ptdump.h and move declarations
Date: Mon, 27 Jul 2026 08:30:11 -0400
Message-Id: <20260727123013.118984-2-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727123013.118984-1-fredwudi0305@gmail.com>
References: <20260727123013.118984-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053044_460642_AD729ED2 
X-CRM114-Status: GOOD (  21.49  )
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

Create a new arch/riscv/include/asm/ptdump.h header file and move the
pagetable walking state structures and level definitions there. This
allows other parts of the kernel (like KVM) to reuse the ptdump data
structures.

Also export the note_page() symbol so it can be used by other kernel
components.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h | 41 ++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 60 +++++++--------------------------
 2 files changed, 53 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
new file mode 100644
index 000000000..eb9d11dab
--- /dev/null
+++ b/arch/riscv/include/asm/ptdump.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_PTDUMP_H
+#define _ASM_RISCV_PTDUMP_H
+
+#include <linux/ptdump.h>
+#include <linux/seq_file.h>
+
+struct addr_marker {
+	unsigned long start_address;
+	const char *name;
+};
+
+struct ptdump_prot_bits {
+	u64 mask;
+	const char *set;
+	const char *clear;
+};
+
+struct ptdump_pg_level {
+	const struct ptdump_prot_bits *bits;
+	const char *name;
+	u64 mask;
+	int num;
+};
+
+struct ptdump_pg_state {
+	struct ptdump_state ptdump;
+	struct seq_file *seq;
+	const struct addr_marker *marker;
+	unsigned long start_address;
+	unsigned long start_pa;
+	unsigned long last_pa;
+	int level;
+	u64 current_prot;
+	bool check_wx;
+	unsigned long wx_pages;
+};
+
+void note_page(struct ptdump_state *pt_st, unsigned long addr, int level, u64 val);
+
+#endif /* _ASM_RISCV_PTDUMP_H */
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index f4b4a9fcb..63655a9c8 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -11,6 +11,7 @@
 #include <linux/ptdump.h>
 
 #include <linux/pgtable.h>
+#include <asm/ptdump.h>
 #include <asm/kasan.h>
 
 #define pt_dump_seq_printf(m, fmt, args...)	\
@@ -25,31 +26,6 @@
 		seq_puts(m, fmt);	\
 })
 
-/*
- * The page dumper groups page table entries of the same type into a single
- * description. It uses pg_state to track the range information while
- * iterating over the pte entries. When the continuity is broken it then
- * dumps out a description of the range.
- */
-struct pg_state {
-	struct ptdump_state ptdump;
-	struct seq_file *seq;
-	const struct addr_marker *marker;
-	unsigned long start_address;
-	unsigned long start_pa;
-	unsigned long last_pa;
-	int level;
-	u64 current_prot;
-	bool check_wx;
-	unsigned long wx_pages;
-};
-
-/* Address marker */
-struct addr_marker {
-	unsigned long start_address;
-	const char *name;
-};
-
 /* Private information for debugfs */
 struct ptd_mm_info {
 	struct mm_struct		*mm;
@@ -126,14 +102,7 @@ static struct ptd_mm_info efi_ptd_info = {
 };
 #endif
 
-/* Page Table Entry */
-struct prot_bits {
-	u64 mask;
-	const char *set;
-	const char *clear;
-};
-
-static const struct prot_bits pte_bits[] = {
+static const struct ptdump_prot_bits pte_bits[] = {
 	{
 #ifdef CONFIG_64BIT
 		.mask = _PAGE_NAPOT,
@@ -183,13 +152,7 @@ static const struct prot_bits pte_bits[] = {
 	}
 };
 
-/* Page Level */
-struct pg_level {
-	const char *name;
-	u64 mask;
-};
-
-static struct pg_level pg_level[] = {
+static struct ptdump_pg_level pg_level[] = {
 	{ /* pgd */
 		.name = "PGD",
 	}, { /* p4d */
@@ -203,7 +166,7 @@ static struct pg_level pg_level[] = {
 	},
 };
 
-static void dump_prot(struct pg_state *st)
+static void dump_prot(struct ptdump_pg_state *st)
 {
 	unsigned int i;
 
@@ -240,7 +203,7 @@ static void dump_prot(struct pg_state *st)
 #else
 #define ADDR_FORMAT	"0x%08lx"
 #endif
-static void dump_addr(struct pg_state *st, unsigned long addr)
+static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 {
 	static const char units[] = "KMGTPE";
 	const char *unit = units;
@@ -261,7 +224,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 			   pg_level[st->level].name);
 }
 
-static void note_prot_wx(struct pg_state *st, unsigned long addr)
+static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 {
 	if (!st->check_wx)
 		return;
@@ -276,10 +239,10 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
 }
 
-static void note_page(struct ptdump_state *pt_st, unsigned long addr,
-		      int level, u64 val)
+void note_page(struct ptdump_state *pt_st, unsigned long addr,
+	       int level, u64 val)
 {
-	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
+	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	u64 pa = PFN_PHYS(pte_pfn(__pte(val)));
 	u64 prot = 0;
 
@@ -317,6 +280,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 		st->last_pa = pa;
 	}
 }
+EXPORT_SYMBOL_GPL(note_page);
 
 static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
 {
@@ -352,7 +316,7 @@ static void note_page_flush(struct ptdump_state *pt_st)
 
 static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = s,
 		.marker = pinfo->markers,
 		.level = -1,
@@ -375,7 +339,7 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 
 bool ptdump_check_wx(void)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = NULL,
 		.marker = (struct addr_marker[]) {
 			{0, NULL},
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
