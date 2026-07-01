Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BEFC43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M67nz7M7cS1lnyTQnxx2q/VRXV+KIC7yC3Q7bolqRKs=; b=WikrToAlORzs6m
	dM1/AmXVscYhuN22qWOYQrwD6GF5wWZgRDz8wt1xSLtms3rqwEOcEAcKVJ3SUAxUxYj8QxmlUbC5M
	9bWBRdLmiAHc5pHk1hfr4JYvO8Klp3tcS7JSfzaictwkAk33ADuw6SyoOlji32mXJGtYMXbLvJr91
	UTkT9cmUyYBHY24hvqGb3vyPDKSdmAwbfvVgUQ5Dd7M4rGBhjrQC5ugxCrmPGK8KSOwAhxSBnWOHs
	HQUgyTBgT5iWxcwFR/lEJxSJFMvi8F662lgYiD+cI2636MAK78dVm+15x+EGu2ReVUJWUaMImcYHE
	8jncofEs5SKUhJFcN6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqf6-000000017dE-22K6;
	Wed, 01 Jul 2026 08:51:16 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqf3-000000017bC-1NUs
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:51:14 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-37fb1883f59so46153a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782895872; x=1783500672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4ItoJsKPCJ+weEid+hr/8Hcxyk96+mNUaKglmg0mf4=;
        b=ji7OR0YXauzy1k8RfDlPawfWfty6uhKu399A7EwhIDjZuaq0AbBKNuRaBxT6HMBnkS
         l2ykTGR0FLNowBAGwCyxprdxasvdSAwnMcP9Y7/b2SibY8sn/zwW8bdzNq/Akek6g5ej
         eaazp5A5bnPWT/QVNaA694biv+fVRVvXq70Eg929Z27qFCYLww+2qe+DXX2ttmV9Zss9
         11ybzdT3JqlVjISIae6JIonabxa3QlmHTBwvoo48pKUVZ/Q9alueiScrFxPSBOz+hq3l
         I1rjYEPhlRKhDleMNPrqDShMa7UcwTj4PKkSqzDBC0Lszfl4RU16mzA3c7uoSbFtCNgT
         C6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895872; x=1783500672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4ItoJsKPCJ+weEid+hr/8Hcxyk96+mNUaKglmg0mf4=;
        b=IBa8i5UvYymRgvJA0Ju0C+s/sq7tKc3UlT4+y+YkfrADGN4qX1OwEKHyzM9JADX747
         atgN5tEh4k3tGQ+JZlFqqqDnFTkW517jpJFMaLV6lvNBi068QcV4E7vAHWFrjJd4Fhvz
         wg41jH9HAboyQ+rQLMQUY2QsShAmNi+Xe+oRQAuxGFmLeeIgLFRCw5vtrHU53t44sCiK
         x8nG0lJf+Vfs5LzWhEr4llzVpB1/HGz1suLVCd50y3Fn549D0Tfnx5ztcufvExbUkcXu
         lC5BY/u/tiBa3kDiurkqgLlEPTeMbWqsMWDpMWG4c0L6+bhBMYJfpKIGOXWIoPzf39mA
         /23w==
X-Forwarded-Encrypted: i=1; AHgh+RqPcgZx5X88AyhlXDIMvwd1PZc1pYqFmfWvqpxiwwZpIM+j0Y1Xan6cpv/knm2AVOgDDWdjXISWPYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzisKkygEWjTEFKb0h/Cz/KW3+eJv+EsJyhxOqgn4kO7fqD3c2i
	ZZEXDMmivKHnFATT29GFGhlJhmBfyGeX9dPcdSxmDphq/o1Ru3soPR4/
X-Gm-Gg: AfdE7cmV/m8fSom82Okf+Z1Mec0Onp+I3O7qhiJGTMGUspL5zsDG1D7jqAiufQjO2fm
	ybOA0nOkIg9IH4CiE0dWq0NxZIBlxYJhjj74TYpNcOXS9mJUiWsU9gEJmATMQ5o9EE50Z/cbiiR
	Ry5QwS6upDCFgis3HjlR9+rXZoQ8vPTBTE1qCldBBLw4hUntqXQXYCO5k84GKPufw43VREBe7Sj
	tQGZaQIQX3PUEQBulTcaFboxN5lWpDM8fYc9nR3vgu9xGzJIfyYRm52FNBLe/oUJoR6D8KglVKp
	srpYQErOaWhYaoj4fIovpWa5vV7XpLFeesjpyzh6WSGxf3JO9vrVvSAsG+yitOAUG6GViO+xZjG
	TZnP1H9tyiHGnoINuvVT30lgoL2BLIbP6gD4Yk2AFJ10mv68UHLbZfZy0p8p/MesOkg8q2EEXQF
	TevBYwLbe+AwxHdrVy+X0Z
X-Received: by 2002:a17:90a:d44b:b0:37c:7090:821b with SMTP id 98e67ed59e1d1-380aa0f436amr685084a91.10.1782895872388;
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Received: from wud.bbrouter ([2409:8a1e:9473:9f10:5de9:783b:c249:18c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097ba48d0sm550782a91.1.2026.07.01.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
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
Subject: [PATCH 2/2] KVM: riscv: Register ptdump with debugfs on guest creation
Date: Wed,  1 Jul 2026 04:50:30 -0400
Message-Id: <20260701085030.124579-3-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701085030.124579-1-fredwudi0305@gmail.com>
References: <20260701085030.124579-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_015113_373084_75C8C2B9 
X-CRM114-Status: GOOD (  23.38  )
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

Introduce KVM ptdump to show the guest gstage pagetables. This registers
a 'gstage_page_tables' file under the guest debugfs directory.
Userspace can now inspect the gstage layout and permissions, which
is useful for architectural debugging and memory management audits.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/kvm_host.h |   6 +
 arch/riscv/kvm/Kconfig            |  15 +++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/ptdump.c           | 178 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c               |   5 +
 5 files changed, 205 insertions(+)
 create mode 100644 arch/riscv/kvm/ptdump.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec..04129c5f8 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -322,4 +322,10 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 /* Flags representing implementation specific details */
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
+#ifdef CONFIG_PTDUMP_GSTAGE_DEBUGFS
+void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
+#else
+static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
+#endif
+
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a3..0ceb4a452 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -38,3 +38,18 @@ config KVM
 	  If unsure, say N.
 
 endif # VIRTUALIZATION
+
+config PTDUMP_GSTAGE_DEBUGFS
+	bool "Present the gstage pagetables to debugfs"
+	depends on KVM
+	depends on DEBUG_KERNEL
+	depends on DEBUG_FS
+	depends on PTDUMP_DEBUGFS
+	default n
+	help
+	  Say Y here if you want to show the RISC-V KVM gstage guest page tables
+	  layout in a debugfs file. This information is primarily useful for
+	  architecture-specific kernel developers and KVM maintainers to
+	  investigate memory mapping and permission issues. It is probably
+	  not a good idea to enable this feature in a production kernel.
+	  If in doubt, say N.
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05..0170c8c3b 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -42,3 +42,4 @@ kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
 kvm-y += vmid.o
+kvm-$(CONFIG_PTDUMP_GSTAGE_DEBUGFS) += ptdump.o
diff --git a/arch/riscv/kvm/ptdump.c b/arch/riscv/kvm/ptdump.c
new file mode 100644
index 000000000..972d45d69
--- /dev/null
+++ b/arch/riscv/kvm/ptdump.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Debug helper used to dump the gstage pagetables of the system.
+ */
+#include <linux/debugfs.h>
+#include <linux/kvm_host.h>
+#include <linux/seq_file.h>
+#include <linux/mm.h>
+#include <asm/ptdump.h>
+#include <asm/pgtable.h>
+
+static const struct ptdump_prot_bits gstage_pte_bits[] = {
+	{
+		.mask = _PAGE_SOFT,
+		.set = "RSW(%d)",
+		.clear = "  ..  ",
+	}, {
+		.mask = _PAGE_DIRTY,
+		.set = "D",
+		.clear = ".",
+	}, {
+		.mask = _PAGE_ACCESSED,
+		.set = "A",
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
+	{ .name = "PGD" },
+	{ .name = "P4D" },
+	{ .name = "PUD" },
+	{ .name = "PMD" },
+	{ .name = "PTE" },
+};
+
+struct kvm_ptdump_state {
+	struct kvm *kvm;
+	struct ptdump_pg_state parser_state;
+	struct addr_marker marker[2];
+	struct ptdump_range range[2];
+};
+
+static void kvm_ptdump_walk_level(struct ptdump_state *pt_st,
+				  unsigned long *tbl, int level,
+				  unsigned long start_addr)
+{
+	unsigned long addr = start_addr;
+	unsigned long next, virt_addr;
+	int i;
+	unsigned long step = 1UL << (PAGE_SHIFT + (4 - level) * 9);
+
+	for (i = 0; i < PTRS_PER_PTE; i++, addr += step) {
+		unsigned long val = tbl[i];
+
+		next = addr + step;
+
+		if (level == 4 || (val & _PAGE_LEAF) || !(val & _PAGE_PRESENT)) {
+			note_page(pt_st, addr, level, val);
+		} else {
+			unsigned long pa = (val >> _PAGE_PFN_SHIFT) << PAGE_SHIFT;
+
+			virt_addr = (unsigned long)phys_to_virt(pa);
+
+			kvm_ptdump_walk_level(pt_st, (unsigned long *)virt_addr,
+					      level + 1, addr);
+		}
+	}
+}
+
+static int kvm_ptdump_visitor(struct seq_file *m, void *v)
+{
+	struct kvm_ptdump_state *st = m->private;
+	struct kvm *kvm = st->kvm;
+	unsigned long *pgd = (unsigned long *)kvm->arch.pgd;
+	int start_level = 5 - kvm->arch.pgd_levels;
+	int i, j;
+
+	st->parser_state.level = -1;
+	st->parser_state.start_address = 0;
+	st->parser_state.seq = m;
+
+	for (i = 0; i < ARRAY_SIZE(gstage_pg_levels); i++) {
+		gstage_pg_levels[i].bits = gstage_pte_bits;
+		gstage_pg_levels[i].num = ARRAY_SIZE(gstage_pte_bits);
+		gstage_pg_levels[i].mask = 0;
+		for (j = 0; j < ARRAY_SIZE(gstage_pte_bits); j++)
+			gstage_pg_levels[i].mask |= gstage_pte_bits[j].mask;
+	}
+
+	read_lock(&kvm->mmu_lock);
+	if (pgd) {
+		kvm_ptdump_walk_level(&st->parser_state.ptdump, pgd,
+			start_level, 0);
+	}
+	read_unlock(&kvm->mmu_lock);
+
+	note_page(&st->parser_state.ptdump, 0, -1, 0);
+	return 0;
+}
+
+static int kvm_ptdump_open(struct inode *inode, struct file *file)
+{
+	struct kvm *kvm = inode->i_private;
+	struct kvm_ptdump_state *st;
+	int ret;
+
+	if (!kvm_get_kvm_safe(kvm))
+		return -ENOENT;
+
+	st = kzalloc(sizeof(*st), GFP_KERNEL);
+	if (!st) {
+		kvm_put_kvm(kvm);
+		return -ENOMEM;
+	}
+
+	st->kvm = kvm;
+	st->marker[0].name = "Guest IPA";
+	st->marker[0].start_address = 0;
+	st->marker[1].start_address = -1UL;
+	st->range[0].start = 0;
+	st->range[0].end = -1UL;
+
+	st->parser_state.marker = st->marker;
+	st->parser_state.pg_level = gstage_pg_levels;
+	st->parser_state.ptdump.range = st->range;
+
+	ret = single_open(file, kvm_ptdump_visitor, st);
+	if (ret) {
+		kfree(st);
+		kvm_put_kvm(kvm);
+	}
+	return ret;
+}
+
+static int kvm_ptdump_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *seq = file->private_data;
+	struct kvm_ptdump_state *st = seq->private;
+	struct kvm *kvm = st->kvm;
+
+	kfree(st);
+	kvm_put_kvm(kvm);
+	return single_release(inode, file);
+}
+
+static const struct file_operations kvm_gstage_fops = {
+	.owner		= THIS_MODULE,
+	.open		= kvm_ptdump_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= kvm_ptdump_release,
+};
+
+void kvm_s2_ptdump_create_debugfs(struct kvm *kvm)
+{
+	debugfs_create_file("gstage_page_tables", 0400, kvm->debugfs_dentry, kvm,
+			    &kvm_gstage_fops);
+}
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083fee..464ad2eaf 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -269,3 +269,8 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	return -EINVAL;
 }
+
+void kvm_arch_create_vm_debugfs(struct kvm *kvm)
+{
+	kvm_s2_ptdump_create_debugfs(kvm);
+}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
