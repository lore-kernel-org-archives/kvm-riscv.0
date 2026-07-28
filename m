Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF15C531F9
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbVwypUCa1fV1nCnt07kLu5G8MTSLb09ZERn0UwwMC4=; b=T45hDpDjYvG6h9
	RjXhEtWpamcQNPSt+ELOGF21JTyA2oWVM9KnAi5Hpt9F2zHA7DHWFSqD6Aw5vFA875gMix45vhhaH
	arHjf+PWaj+o6QKWVglQUCkOymKRHjXcVjubUWQyH8M6Px25NklhRvBszMJ/6hsFHu9DRClAgWie5
	YpyfWXU48XGnNXSDtc6XY8/p+dWOpuZ9bwof2G61mB+zggppeZqXTuSEFILZrG7ikvz/yhgmEh5yv
	eymbW4/JtTxIlPl5MVWem4Ef/4ZS5uGDmG+ocvop0T/6yEMSZaPsmQfjdLVi8qsMmFEKhEmjAMpoP
	OMYDunijOPiOOalS12Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSk-00000005nNm-2qfW;
	Tue, 28 Jul 2026 16:15:27 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSg-00000005nM5-2ymv
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:15:25 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3859292bb51so204275a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785255322; x=1785860122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upXRv+tWWPrMoVucIXngMrJVs24x1WlX2PUogXgOPbc=;
        b=d5j2bF7NJR3bSGnpuYXyIXAzC4aWMFAWLsbpfHsYdH/jxBn38ojyipYUNQ9ZmqT2Sf
         ggBBEF4diLbKNjJDzFsZnXylsd8Q9Kp9bJXbvZ7PoFW/UowRj5+FFjviwKG463BZFsjp
         PySHleGyJswUA1weWoT5B1illAnwQVQCbFDq74sa7irHS/WtMD7KoHD5zLYm4SuDoob6
         TtdwXuCKxWEHzBdsw9kUAJBGCFPpLSa2H2WAR+M+194WRxT2cQzE6f16MqcNfiqYjoMW
         vpnHsFX99jj2y2BmuBsBuB5cjlFPXe9aVzLLvu7BIWDExyGv+1IjRk/BuFtgh7m5+tAv
         XC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255322; x=1785860122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upXRv+tWWPrMoVucIXngMrJVs24x1WlX2PUogXgOPbc=;
        b=CCPKKQsEv7yxTmEUQFSKW79LOuvrPHCmFapoLPlpC7StVuqSg8MqON+Zjj6QDnZ6kX
         8dqH8+8wI2HoAuWdM8/ZoiH2S2cnoxjoD3Hwepjcbz/tRtCbJaa77VrH8Xhjy4ieUxgP
         kRHhzYyBKC7Hy6Fc3oJ9u1kg5XCMbZVhaf3KU7a+jjJ6a5VBNLB//c8RZeoT3P0smSPH
         ks0oK0thW3TF6oYb+bKHxSK3w6eHy/ajXUcN5C3GkLZC0z7FVPEplJskBfnU42z99hvr
         wmNDd6iwk/21CDU3g32miLOyGtzzEYEtpb11UNiBeIGeZ8qi6/9ke85GmvhaVFiezPGb
         7f8w==
X-Forwarded-Encrypted: i=1; AHgh+RpZ/7rX6u6cjmlObMVUpWlw/t2j4b1NaAGE8sQNhYVKBWDPyxlYQgwi0xgZj1WekNRBfN1QwrLEJGk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw508Pfqd8VqSqzAZw/RPomfMTIj/oC540EpAzzB4XdxFWbj2Rm
	SMtprcpzeFiuKfHdZL5TB8kZA2EF9qzMKATJQgJuPfkdLsxtt8R7/7Rt
X-Gm-Gg: AR+sD12WvHjB0MMcsVm+C6gqShnULirjmfqDD7NByX/peyoti0bA6XeBFcne88SaVu6
	c4ERPPsZCXDqa7H7sgERPMlSdveGv2nZK9ZUEAugpbApASDUvZ5XschMKp5rRXVsGUwbdTZsVOL
	vXQYLi6jJrr3XD6T4MvhgXcQsAn2hpbWZmGYEi8GCjoIcAyaOzBoqcj2I+wzdZuR2ioqSaiZ5MG
	Dy9DRyzWAqHTzIlK47Ui8+YRP3P5w781zOgPwBq2dTbcEuhwej8C7XGL1CWrbRG7rhcgcKd2GCt
	SECq6zcRlQeZBH/t6Y4Hnbe4K/6Q4TzdzXscHvijebf+z9M6SAa1rqsb//WCJhW4Ky8PXMLEry6
	cCD3Sa3DKQr0ZLlO3NjRw0DwQR3dFx7nN3vgfgfW3ULwPLQU6aTGw5fRYOsGB8LsA9JbDMNzEQO
	oIV5V8/w==
X-Received: by 2002:a17:90b:3ccf:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38f6a30cf0bmr3139540a91.11.1785255321550;
        Tue, 28 Jul 2026 09:15:21 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm161141a91.10.2026.07.28.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:15:21 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: paul.walmsley@sifive.com,
	pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 1/3] riscv: ptdump: Create ptdump.h and move declarations
Date: Tue, 28 Jul 2026 12:14:47 -0400
Message-Id: <20260728161449.190058-2-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728161449.190058-1-fredwudi0305@gmail.com>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
 <20260728161449.190058-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_091524_094348_2BA5680D 
X-CRM114-Status: GOOD (  20.46  )
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

No functional changes - structures are moved verbatim.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h | 40 ++++++++++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 44 +++------------------------------
 2 files changed, 44 insertions(+), 40 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
new file mode 100644
index 000000000..90dce9f64
--- /dev/null
+++ b/arch/riscv/include/asm/ptdump.h
@@ -0,0 +1,40 @@
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
+struct prot_bits {
+	u64 mask;
+	const char *set;
+	const char *clear;
+};
+
+struct pg_level {
+	const char *name;
+	u64 mask;
+};
+
+struct pg_state {
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
+void note_page(struct ptdump_state *pt_st, unsigned long addr,
+	       int level, u64 val);
+
+#endif /* _ASM_RISCV_PTDUMP_H */
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index f4b4a9fcb..d9a955b8a 100644
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
@@ -126,13 +102,6 @@ static struct ptd_mm_info efi_ptd_info = {
 };
 #endif
 
-/* Page Table Entry */
-struct prot_bits {
-	u64 mask;
-	const char *set;
-	const char *clear;
-};
-
 static const struct prot_bits pte_bits[] = {
 	{
 #ifdef CONFIG_64BIT
@@ -183,12 +152,6 @@ static const struct prot_bits pte_bits[] = {
 	}
 };
 
-/* Page Level */
-struct pg_level {
-	const char *name;
-	u64 mask;
-};
-
 static struct pg_level pg_level[] = {
 	{ /* pgd */
 		.name = "PGD",
@@ -276,8 +239,8 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
 }
 
-static void note_page(struct ptdump_state *pt_st, unsigned long addr,
-		      int level, u64 val)
+void note_page(struct ptdump_state *pt_st, unsigned long addr,
+	      int level, u64 val)
 {
 	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
 	u64 pa = PFN_PHYS(pte_pfn(__pte(val)));
@@ -317,6 +280,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 		st->last_pa = pa;
 	}
 }
+EXPORT_SYMBOL_GPL(note_page);
 
 static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
 {
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
