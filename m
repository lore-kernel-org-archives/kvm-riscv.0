Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE2DC531F9
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1SOvdzSKpDdivpSswCcuQUSh88D/4z3vAAeAUwQEmI=; b=3Blkpr61SzbTto
	OFUK0GPIlyLuZXDbkKR9DQOzN7mt6xB4Q73euws/iG2u6vTXg7jZvOAEOdE5Bm70gZSWjYVmX51ah
	4jWKRj7gIxCj9CvyOZntCPqkW2X+8eMhiTxIg7RD+mh5NOkv4zLDwlxFVTYfMakfFYXUP9X3MT7Zo
	QegRsIykCTqhaZT4vGJFm+ig4PZT+bIB6vAPE3eI0INHH7Dvoi8O5zcNFGyENSvnFhNaceJix7ZKa
	2t9bJ4XJ45dE2HeIVyaHKRUtbb+/8gqBVSmQQQMfD2FKnOgH0O7+eHIHAa9vO+53ANgFyDDdFR8Qe
	YZdbTKKlVZFef5LhXbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokT7-00000005naA-1EW0;
	Tue, 28 Jul 2026 16:15:49 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSp-00000005nPq-2uN5
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:15:33 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-38eca9b7114so4854a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785255331; x=1785860131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UCN+I3ADpULzhqYd4a+6tuF3R3sYs3PcoHDBOdaVaI=;
        b=UcbDpMSwA6kD1w3rh7vAXWJxQ4uTVRizBqkGcricf6YkSrpV4F4xggOaaBAlDu3GFd
         +QLn6JEV66QyvcEaKMifDU50T/CnI468N/71BzoxXJqDnE2huG86a23ylfSQp5bs0Wzv
         uqAPE9qPj6mEP0cGtgU3+FJMZaKj+If0lbTbaxdBSI4M0DgUIwCoHfycEOqbZGNgtWbS
         B9qLhR1LKiammwyCkuOnJG0jumpIsyexyvtZq8jwYYORtxu4OjfhtyzklgLoXIMhjbAa
         bZC1w+wI+7e1a97b1FQ8bEhFoo0yCwU74zKy5nKZE6o8OJv4r5DNxAO3TORyxv2Djs+A
         iA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255331; x=1785860131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UCN+I3ADpULzhqYd4a+6tuF3R3sYs3PcoHDBOdaVaI=;
        b=FsRYLRJtWeivXgYOTS+IGrPEG+qZOb4cpccFKYJzJEjrh4DgqO7YBtyC7eJi8N5XRq
         0Fdx/ocdGvrVc1WBrWib2lxjemSzxrPTWMZSl739S+TGzryCwwUhomtLOJL6tU4puYO8
         Mj1P6uRbfok2A/YEsTohAbhFCWk+33AtjC4BWeaKXexd8wYxE3J4jDcBn1oLrj6g2h+y
         m3JAwl/U3muZDkIwk9dl42oygilWSOQxYTDPuxXp7f+IPc49uoPhqKvR911MArNhi3D9
         6keZb11vj5WyNEulb8pw/ViP+PR4mY+vmJ8gqgTNFZTsnucXwxeQYKl2QF9w0eC3I4+x
         XLXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3KbHVv6r2vCWqnOXoJGxT1DdXKcuw6BfrdmLH6QF0MdReQ2IRBXii70GWVroKIlWHC2dNeuqVl6s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2PL87eszPcsxYpvhbuoBm6sqHpMMc4SI+88ck65RJoXsrMRre
	6+cwCXihlZwzqA9gnXTn2CaqjAIk4hYKCBfMesshRfnyN4+sh75a3lzA
X-Gm-Gg: AR+sD13GIIh141gpiII2fiK4MC7WKTbhO1DS7RrjYblxjsunEWGML4Iyx97/7/lXBP7
	8ZmWDuGhJzsrstSsrYtZ5QWGd/kC+sfldOz3oHWnVP6XcuS3kXF84jMCCtGg3UT3/8Zyfx/ZjGh
	7PHXJdAXa4AlUJi7LNFMnwCbo02UwfuRnyse1AokdcGxVtOC736WxnjXr015/b07YxEhlUOMZxd
	WEavq+Jt1l58dXgJvbcOtN8fGE+BC1HG35Nfe2W/fjFA/ohk3GTA/zPB7GEZ8JaLlVkLgNIKEXO
	Gmv1+8MBxsyBsaEZ29sNjNRMzSI8N57ak9E5vLGGtriJyWawVpt8P/SU4cXsTD6vMhKQEkC3XOf
	vijZ7K8enwLdFtscvQQSGgKhnMC7Z52bx/5X2S/OHy/PMZocGlPXu0auJlKsO1ElCJD21XquOSg
	gzJknn0A==
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr3205402a91.0.1785255330655;
        Tue, 28 Jul 2026 09:15:30 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm161141a91.10.2026.07.28.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:15:30 -0700 (PDT)
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
Subject: [PATCH v3 3/3] KVM: riscv: Register ptdump with debugfs on guest creation
Date: Tue, 28 Jul 2026 12:14:49 -0400
Message-Id: <20260728161449.190058-4-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728161449.190058-1-fredwudi0305@gmail.com>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
 <20260728161449.190058-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_091532_354012_A466DEEE 
X-CRM114-Status: GOOD (  21.05  )
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

Implement the gstage page table dumper for RISC-V KVM, which exposes
the guest's gstage page tables via debugfs. When
CONFIG_PTDUMP_GSTAGE_DEBUGFS is enabled, a "gstage_page_tables" file
will be created under each VM's debugfs directory.

This reuses the ptdump framework from the kernel page table dumper,
with gstage-specific attribute bits and level definitions.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/kvm/Kconfig  |  12 +++
 arch/riscv/kvm/Makefile |   1 +
 arch/riscv/kvm/ptdump.c | 177 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 arch/riscv/kvm/ptdump.c

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a3..6d62b967f 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -37,4 +37,16 @@ config KVM
 
 	  If unsure, say N.
 
+config PTDUMP_GSTAGE_DEBUGFS
+	bool "Present the gstage pagetables to debugfs"
+	depends on KVM && DEBUG_KERNEL && DEBUG_FS && PTDUMP_DEBUGFS
+	default n
+	help
+	  Say Y here if you want to show the RISC-V KVM gstage guest
+	  page tables in debugfs under each VM's debugfs directory as
+	  a file named "gstage_page_tables". This allows inspection of
+	  the second-stage address translation setup for each guest.
+
+	  If unsure, say N.
+
 endif # VIRTUALIZATION
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05..905593d6f 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -19,6 +19,7 @@ kvm-y += isa.o
 kvm-y += main.o
 kvm-y += mmu.o
 kvm-y += nacl.o
+kvm-$(CONFIG_PTDUMP_GSTAGE_DEBUGFS) += ptdump.o
 kvm-y += tlb.o
 kvm-y += vcpu.o
 kvm-y += vcpu_config.o
diff --git a/arch/riscv/kvm/ptdump.c b/arch/riscv/kvm/ptdump.c
new file mode 100644
index 000000000..f436ad48c
--- /dev/null
+++ b/arch/riscv/kvm/ptdump.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 SiFive
+ */
+
+#include <linux/debugfs.h>
+#include <linux/ptdump.h>
+#include <linux/seq_file.h>
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_gstage.h>
+#include <asm/pgtable.h>
+#include <asm/ptdump.h>
+
+enum gstage_address_markers_idx {
+	GSTAGE_GPA_START_NR,
+	GSTAGE_GPA_END_NR,
+	END_OF_GSTAGE_SPACE_NR
+};
+
+static const struct ptdump_prot_bits gstage_pte_bits[] = {
+	{
+		.mask = _PAGE_DIRTY,
+		.set = "D",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_ACCESSED,
+		.set = "A",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_GLOBAL,
+		.set = "G",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_USER,
+		.set = "U",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_EXEC,
+		.set = "X",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_WRITE,
+		.set = "W",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_READ,
+		.set = "R",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_PRESENT,
+		.set = "V",
+		.clear = ".",
+	}
+};
+
+static struct ptdump_pg_level gstage_pg_levels[] = {
+	{ /* pgd */
+		.bits = gstage_pte_bits,
+		.num = ARRAY_SIZE(gstage_pte_bits),
+		.name = "PGD",
+	}, { /* p4d */
+		.bits = gstage_pte_bits,
+		.num = ARRAY_SIZE(gstage_pte_bits),
+		.name = "P4D",
+	}, { /* pud */
+		.bits = gstage_pte_bits,
+		.num = ARRAY_SIZE(gstage_pte_bits),
+		.name = "PUD",
+	}, { /* pmd */
+		.bits = gstage_pte_bits,
+		.num = ARRAY_SIZE(gstage_pte_bits),
+		.name = "PMD",
+	}, { /* pte */
+		.bits = gstage_pte_bits,
+		.num = ARRAY_SIZE(gstage_pte_bits),
+		.name = "PTE",
+	},
+};
+
+static void gstage_note_page(struct ptdump_state *pt_st, unsigned long addr,
+			     int level, u64 val)
+{
+	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
+
+	note_page(pt_st, addr, level, val);
+
+	if (level >= 0)
+		st->current_prot = val & gstage_pg_levels[level].mask;
+}
+
+static void gstage_note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
+{
+	gstage_note_page(pt_st, addr, 4, pte_val(pte));
+}
+
+static void gstage_note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
+{
+	gstage_note_page(pt_st, addr, 3, pmd_val(pmd));
+}
+
+static void gstage_note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
+{
+	gstage_note_page(pt_st, addr, 2, pud_val(pud));
+}
+
+static void gstage_note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
+{
+	gstage_note_page(pt_st, addr, 1, p4d_val(p4d));
+}
+
+static void gstage_note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
+{
+	gstage_note_page(pt_st, addr, 0, pgd_val(pgd));
+}
+
+static void gstage_note_page_flush(struct ptdump_state *pt_st)
+{
+	pte_t pte_zero = {0};
+
+	gstage_note_page(pt_st, 0, -1, pte_val(pte_zero));
+}
+
+static int gstage_ptdump_show(struct seq_file *m, void *v)
+{
+	struct kvm *kvm = m->private;
+	gpa_t gpa_size = kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels);
+	struct addr_marker gpa_markers[] = {
+		[GSTAGE_GPA_START_NR] = { 0, "Guest Physical Address Start" },
+		[GSTAGE_GPA_END_NR]   = { gpa_size - 1, "Guest Physical Address End" },
+		[END_OF_GSTAGE_SPACE_NR] = { -1, NULL },
+	};
+	struct ptdump_pg_state st = {
+		.seq = m,
+		.marker = gpa_markers,
+		.level = -1,
+		.pg_level = gstage_pg_levels,
+		.ptdump = {
+			.note_page_pte = gstage_note_page_pte,
+			.note_page_pmd = gstage_note_page_pmd,
+			.note_page_pud = gstage_note_page_pud,
+			.note_page_p4d = gstage_note_page_p4d,
+			.note_page_pgd = gstage_note_page_pgd,
+			.note_page_flush = gstage_note_page_flush,
+			.range = (struct ptdump_range[]) {
+				{0, gpa_size - 1},
+				{0, 0}
+			}
+		}
+	};
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(gstage_pg_levels); i++) {
+		gstage_pg_levels[i].mask = 0;
+		for (j = 0; j < ARRAY_SIZE(gstage_pte_bits); j++)
+			gstage_pg_levels[i].mask |= gstage_pte_bits[j].mask;
+	}
+
+	if (kvm->arch.pgd_levels < 5)
+		gstage_pg_levels[1].name = "PGD";
+	if (kvm->arch.pgd_levels < 4)
+		gstage_pg_levels[2].name = "PGD";
+	if (kvm->arch.pgd_levels < 3)
+		gstage_pg_levels[3].name = "PGD";
+
+	ptdump_walk_pgd(&st.ptdump, kvm->mm, kvm->arch.pgd);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(gstage_ptdump);
+
+void kvm_arch_create_vm_debugfs(struct kvm *kvm)
+{
+	debugfs_create_file("gstage_page_tables", 0400,
+			    kvm->debugfs_dentry, kvm, &gstage_ptdump_fops);
+}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
