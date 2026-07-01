Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740EAC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLAe4k0jeGtgQJAuqE2loQ5RJ3myPVWOPZvQEfkGbpc=; b=AMzy0YVV6Xvjqb
	mSs/zd9WYaVxIf/5Ay+ybHnJmkPEn7UDLdPUpreWjVtqfseJZXTt10CPOWiADEVM7FTQehN7Sx1zq
	d0hK8CrrgiWR0GuqDfV0luCb5pkZmwRzmHQR1TCj5aLmDLW/YKx+sAfgeNuu8Wh4ToNtmc9QVazjI
	gvTrK0hOG3IMhps2h03eXB066S6X4FyP1g22ihAyh0HPtUPDll82J0z24ZsWO1EuMzlLsXvbyiCxd
	2JnukH5esN38/bh0b7AUCSBiw3II7f+LE/1MNP3Q5sdUewtLERod/t9VUMawS23WwxJR/LBoyXYYc
	kTTmJMQ4Z0OQvhbs9QFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqf0-000000017a4-0bo9;
	Wed, 01 Jul 2026 08:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqez-000000017ZX-1rQ1
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EHr0PdDJXi6QKtc3/lV/35MnBQo9rJrsZa0CT7ri5ow=; b=gQdUyjurF7Rdh86pQcC3H7v1a9
	9XE7Aheq2lFr9kti3A+WqDiNX9v2SVkMkJQjg4dSZRYrAFuy9iJ1PyVLPixQH9f6HMgZSvOI5V5YK
	cje5m+NmDyE3/YeWTw4HEic7PgqmjKSz/DE8rrhCT+BDm37cDzZl0XWVXAjt6WEcN3+qs0zeRj8HF
	SFtP8jQ4i8nTU+YhB+eSPlPcm8kzyoJ5je/JFANYFUm9jp26v4N/t+eP5Lm81O+lgnF30YTzSMbwl
	HIeXlYAmPJnDdwvhsYxWhBWvzxqLkcZfsk8qgkrb6FmVnl7WAZRIKXWiesiq5zouxEbr9lpCDcyZ/
	AJNrn6xw==;
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqev-00000002XEh-2kQS
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:51:08 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-37d77008a28so172058a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895863; x=1783500663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHr0PdDJXi6QKtc3/lV/35MnBQo9rJrsZa0CT7ri5ow=;
        b=IIbIfSrtiLqlC38nEKKkEHvh3I9ku3etaZInYkJBsxviUghFmULRvcGNC/jFGgd/V7
         l4dI3t63oTTH9YPVp5MnklBZ//qhOv90ADTYR2KJCI0hpjSlAaYJhYlnVP2GtMSdXhso
         F4ZQCCnZ3pL3DF2Jl0u/lRkv5pc5GUmhLWpdWP26q4nX10AdnzYKax4ZX+u025QTFd5v
         raRcZTiI9ySu3SZ0X/UVS1c+yp+f8R9NT9dV3iydWXAXxuFM9Kdz/eiujdXXfC5BevjB
         bsJxYExm9RtgpTEtWPKfCX0v+9VJNevPs/w7WS2ro0S6wwSKrHNbjRpbNJyMfQW9aiUS
         84Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895863; x=1783500663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHr0PdDJXi6QKtc3/lV/35MnBQo9rJrsZa0CT7ri5ow=;
        b=BohCDHuK5FymshSwndpDB5RtK9tFJhHkbEuVpb3iJ2tK/VzOVQo9CUW+c/viwtE6lB
         5uPqeQygnz2cdHqTWyNyF6881gOKzx+/26Bn3Q9v0Khw0RtDcyTGV2XQB5IAlR/g+TDV
         DIOdYTZWh9wHFxKK9otaoTnTxX4sGupAZLJk/Udm9ZmYOZOfXzBoK8aFaam9QeyKbFaG
         Ykz1BNvugJoTq11pGWy9OCzl2zJdpiiPhOnu6aiUWPgc9GEcISPORP9VU/nvYx5sdiLG
         8mMM+FnCONSt/05UfqG/sESnurzEGTb9YxAhx4Ej4yU/zhOZN16BdMLB7wIda0K7rZ3k
         F68A==
X-Forwarded-Encrypted: i=1; AHgh+RrXw3l/Ok+tBHF6oFwx89/+r84azWs4pAXcHjyiAkNTYWY+gIQEVRR1c2XU12qNS0Z7ZWGuTyeAylY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61QmJtOEEct1kyjRMjnurOdLrqQ8HRIXT8W5kTG5lrB1Ghk+u
	3TExO0r6aL2ygrcmStVW7cWzT2SlaOZZxmPFYbwFcHOaSeCfREMrsdRs
X-Gm-Gg: AfdE7cktdm6DlSaJ2TONnrSZ5WsagJ4GpzwYXh8qkAjtQn4GmJyEa04YYHsZlVF5YQv
	y6az+CfFKff8MaABjjplTYorRTSgNVZ3kZ9pIt50nyY6TH12xk2slWHwqwYuPgSKZHjLinfWFsB
	Zt3WPxDr6cOh8GvdGtWtbrj6zG6hCCgmtH9vT/yTrOKV/x5Gqc5dZVZlKBN1NRhEW02Z4of9pSi
	o63T2SFZVGSBQwZjIbUnCcA8kP7q9xdbRH7IzoJ7GogykGNurzlQJLdgJvPOjIJLX0EYdI+2D7c
	LLyRy0oymW/BvYB33PFqTpEuXi4j0nCl2fC/A3CSSCkUkeDE+TEm5OO9EIpDnIfkUCIYoFvNUuF
	muCKGYeePL86EharNpPsY8SmemyQ0C+8rxJpPTC1fKZcJ1qfGUhNU2R0O3C9V037ziP8SkETfnr
	XbaNbx9FCreHsqKJ20I8pl
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr827599a91.14.1782895863350;
        Wed, 01 Jul 2026 01:51:03 -0700 (PDT)
Received: from wud.bbrouter ([2409:8a1e:9473:9f10:5de9:783b:c249:18c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097ba48d0sm550782a91.1.2026.07.01.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:51:03 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: ptdump: Move pagetable definitions to common header
Date: Wed,  1 Jul 2026 04:50:29 -0400
Message-Id: <20260701085030.124579-2-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701085030.124579-1-fredwudi0305@gmail.com>
References: <20260701085030.124579-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095105_920930_8F2DED3A 
X-CRM114-Status: GOOD (  26.43  )
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

Move the pagetable walking state and level definitions to a new
arch/riscv/include/asm/ptdump.h header. This allows other parts
of the kernel (like KVM) to reuse the ptdump attribute parsing
logic.

To support different pagetable types (like G-stage), the attribute
parsing logic in dump_prot() is updated to use attribute bits
defined within the pg_level structure rather than a global array.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h |  42 +++++++++++++
 arch/riscv/mm/ptdump.c          | 102 +++++++++++---------------------
 2 files changed, 77 insertions(+), 67 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
new file mode 100644
index 000000000..9173910fa
--- /dev/null
+++ b/arch/riscv/include/asm/ptdump.h
@@ -0,0 +1,42 @@
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
+	const struct ptdump_pg_level *pg_level;
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
index f4b4a9fcb..7e55656cb 100644
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
@@ -183,52 +152,48 @@ static const struct prot_bits pte_bits[] = {
 	}
 };
 
-/* Page Level */
-struct pg_level {
-	const char *name;
-	u64 mask;
-};
-
-static struct pg_level pg_level[] = {
+static struct ptdump_pg_level kernel_pg_levels[] = {
 	{ /* pgd */
 		.name = "PGD",
 	}, { /* p4d */
-		.name = (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
+		.name = "P4D",
 	}, { /* pud */
-		.name = (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
+		.name = "PUD",
 	}, { /* pmd */
-		.name = (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
+		.name = "PMD",
 	}, { /* pte */
 		.name = "PTE",
 	},
 };
 
-static void dump_prot(struct pg_state *st)
+static void dump_prot(struct ptdump_pg_state *st)
 {
 	unsigned int i;
+	const struct ptdump_pg_level *lvl = &st->pg_level[st->level];
+	const struct ptdump_prot_bits *bits = lvl->bits;
 
-	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
+	for (i = 0; i < lvl->num; i++) {
 		char s[7];
 		unsigned long val;
 
-		val = st->current_prot & pte_bits[i].mask;
+		val = st->current_prot & bits[i].mask;
 		if (val) {
-			if (pte_bits[i].mask == _PAGE_SOFT)
-				snprintf(s, sizeof(s), pte_bits[i].set, val >> 8);
+			if (bits[i].mask == _PAGE_SOFT)
+				snprintf(s, sizeof(s), bits[i].set, val >> 8);
 #ifdef CONFIG_64BIT
-			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
+			else if (bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "NC");
+					snprintf(s, sizeof(s), bits[i].set, "NC");
 				else if (val == _PAGE_IO_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "IO");
+					snprintf(s, sizeof(s), bits[i].set, "IO");
 				else
-					snprintf(s, sizeof(s), pte_bits[i].set, "??");
+					snprintf(s, sizeof(s), bits[i].set, "??");
 			}
 #endif
 			else
-				strscpy(s, pte_bits[i].set);
+				strscpy(s, bits[i].set);
 		} else {
-			strscpy(s, pte_bits[i].clear);
+			strscpy(s, bits[i].clear);
 		}
 
 		pt_dump_seq_printf(st->seq, " %s", s);
@@ -240,7 +205,7 @@ static void dump_prot(struct pg_state *st)
 #else
 #define ADDR_FORMAT	"0x%08lx"
 #endif
-static void dump_addr(struct pg_state *st, unsigned long addr)
+static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 {
 	static const char units[] = "KMGTPE";
 	const char *unit = units;
@@ -258,10 +223,10 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 	}
 
 	pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
-			   pg_level[st->level].name);
+			   st->pg_level[st->level].name);
 }
 
-static void note_prot_wx(struct pg_state *st, unsigned long addr)
+static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 {
 	if (!st->check_wx)
 		return;
@@ -276,15 +241,15 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
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
 
 	if (level >= 0)
-		prot = val & pg_level[level].mask;
+		prot = val & st->pg_level[level].mask;
 
 	if (st->level == -1) {
 		st->level = level;
@@ -317,6 +282,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 		st->last_pa = pa;
 	}
 }
+EXPORT_SYMBOL_GPL(note_page);
 
 static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
 {
@@ -352,9 +318,10 @@ static void note_page_flush(struct ptdump_state *pt_st)
 
 static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = s,
 		.marker = pinfo->markers,
+		.pg_level = kernel_pg_levels,
 		.level = -1,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
@@ -375,12 +342,13 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 
 bool ptdump_check_wx(void)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = NULL,
 		.marker = (struct addr_marker[]) {
 			{0, NULL},
 			{-1, NULL},
 		},
+		.pg_level = kernel_pg_levels,
 		.level = -1,
 		.check_wx = true,
 		.ptdump = {
@@ -446,12 +414,12 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
-	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
-	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+	kernel_pg_levels[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	kernel_pg_levels[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
 
-	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
+	for (i = 0; i < ARRAY_SIZE(kernel_pg_levels); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
-			pg_level[i].mask |= pte_bits[j].mask;
+			kernel_pg_levels[i].mask |= pte_bits[j].mask;
 
 	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
 			    &ptdump_fops);
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
