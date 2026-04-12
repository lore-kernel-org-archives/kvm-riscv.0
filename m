Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6383F3ED6D
	for <kvm-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 02:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/U2Lk9rUlQsxqXiyuic1uQJ3fDVV7ikFlqdKm4i1ATc=; b=D8g8T6Baa+y1Ha
	x0c2zvZyTQOe/ekmjrnMD9ls0vVXtFK8oTJ8CEakN4DNe84pI102dcI5fDwYU+fIK8mAD5VKud+Nk
	ImTdYcSI11uKjT7uhTz6vsMf/apy7bRxPAWyhumKNo3SYW+NHY6rJQCmTspsomEkoEx15FwdauZJX
	rH0opQ9IWAM9Wjm6Xh0zkkiQIfQwUtdGOGeFk1gSZv/sFQOgbnveWDgXpp7dHgEtxScubJGL8Ifxj
	eyzrkOVCWAkaO1S6IedsmWojVp/4kJQ6qmLfKqmcvumu1vOvpNKZtB9Q+mdfOV2yAxVyk+zasGfPC
	3dfIJWhCA8DXjFlKooNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBkjV-0000000Dyxa-0wUg;
	Sun, 12 Apr 2026 02:39:33 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBkjR-0000000Dyx5-3m6R;
	Sun, 12 Apr 2026 02:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Y2
	OmV9s6+anmCgwu8y2A94tcUE/WvgCKrhzYIZoMaAg=; b=UCeNUcYiEjW5Bb5KoC
	o5UuW8+Km3+24/4piHwX3c+1QROHF9Lvd8ZhGVUNpWe+aC3YsyDbnUy74Cf1f/il
	78uyxm5c5Ao9/C0hZlKSt7E7f7g63jASlGrdvbS/IDhFLdMxd7C71bnghkCS6QxZ
	uVlD3UT2wNWxSDmzDqSTZvytM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCHSpClBdtp7Z4DVw--.388S2;
	Sun, 12 Apr 2026 10:38:32 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v4] RISC-V: KVM: Batch stage-2 TLB flushes
Date: Sun, 12 Apr 2026 10:38:22 +0800
Message-ID: <20260412023822.83341-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PygvCgCHSpClBdtp7Z4DVw--.388S2
X-Coremail-Antispam: 1Uf129KBjvJXoWfJFWDArWDXw4fGryfGF15Arb_yoWDKF1kpr
	4DGr93ur4fXrs7XF13tF4kZrn8Wws7W3WrAry5CF98ZFn0qrWfXr1kW34vvry5JF1rXFW3
	uFyDJF15Ar4IyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEE_M3UUUUU=
X-Originating-IP: [2408:823d:2011:11d4:e10f:2e1c:8928:c657]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC8Qm8NWnbBakY2QAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_193930_752252_18A92241 
X-CRM114-Status: GOOD (  15.62  )
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

KVM RISC-V triggers a TLB flush for every single stage-2 PTE
modification (unmap or write-protect) now. Although KVM coalesces the
hardware IPIs, the software overhead of executing the flush work
for every page is large, especially during dirty page tracking.

Following the approach used in x86 and arm64, this patch optimizes
the MMU logic by making the PTE manipulation functions return a boolean
indicating if a leaf PTE was actually changed. The outer MMU functions
bubble up this flag to batch the remote TLB flushes.

Consequently, the flush operation is executed only once per batch.
Moving it outside of the `mmu_lock` also reduces lock contention.

Tested with tools/testing/selftests/kvm on a 4-vCPU guest (Host
environment: QEMU 10.2.1 RISC-V)
1. demand_paging_test (1GB memory)
  time ./demand_paging_test -b 1G -v 4
- Total execution time reduced from ~2m39s to ~2m31s
2. dirty_log_perf_test (1GB memory)
  ./dirty_log_perf_test -b 1G -v 4
- "Clear dirty log time" per iteration dropped significantly from
   ~3.40s to ~0.18s

Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Signed-off-by: Jinyu Tang <tjytimi@163.com>
---
v3 -> v4:
Rebase to branch linux-riscv_kvm_next and retest performance

v2 -> v3:
Addressed review comments from Anup Patel:
- Removed gstage_tlb_flush() for non-leaf PTEs only set flush flag
- Removed KVM_GSTAGE_FLAGS_LOCAL check
- Used kvm_flush_remote_tlbs_range() instead of full flushes in
  kvm_arch_flush_shadow_memslot() and kvm_unmap_gfn_range() to avoid
  unnecessary global TLB flush.

v1 -> v2:
- Fixed alignment issues in multi-line function calls supported by
  Nutty Liu.

 arch/riscv/include/asm/kvm_gstage.h |  6 ++--
 arch/riscv/kvm/gstage.c             | 35 ++++++++++++++---------
 arch/riscv/kvm/mmu.c                | 44 +++++++++++++++++++++++------
 3 files changed, 60 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 9c908432b..f820c6783 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -70,13 +70,13 @@ enum kvm_riscv_gstage_op {
 	GSTAGE_OP_WP,		/* Write-protect */
 };
 
-void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
+bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op);
 
-void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
+bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 				  gpa_t start, gpa_t size, bool may_block);
 
-void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
+bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
 
 void kvm_riscv_gstage_mode_detect(void);
 
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d9fe8be2a..e020b334a 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -337,35 +337,36 @@ int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	return 0;
 }
 
-void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
+bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
 	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
+	bool flush = false;
 
 	ret = gstage_level_to_page_size(gstage, ptep_level, &page_size);
 	if (ret)
-		return;
+		return false;
 
 	WARN_ON(addr & (page_size - 1));
 
 	if (!pte_val(ptep_get(ptep)))
-		return;
+		return false;
 
 	if (ptep_level && !gstage_pte_leaf(ptep)) {
 		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
 		next_ptep_level = ptep_level - 1;
 		ret = gstage_level_to_page_size(gstage, next_ptep_level, &next_page_size);
 		if (ret)
-			return;
+			return false;
 
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		for (i = 0; i < PTRS_PER_PTE; i++)
-			kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
-						&next_ptep[i], next_ptep_level, op);
+			flush |= kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
+							 &next_ptep[i], next_ptep_level, op);
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
@@ -375,11 +376,13 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
 		if (pte_val(*ptep) != pte_val(old_pte))
-			gstage_tlb_flush(gstage, ptep_level, addr);
+			flush = true;
 	}
+
+	return flush;
 }
 
-void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
+bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 				  gpa_t start, gpa_t size, bool may_block)
 {
 	int ret;
@@ -388,6 +391,7 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 	bool found_leaf;
 	unsigned long page_size;
 	gpa_t addr = start, end = start + size;
+	bool flush = false;
 
 	while (addr < end) {
 		found_leaf = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &ptep_level);
@@ -399,8 +403,8 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 			goto next;
 
 		if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
-			kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-						ptep_level, GSTAGE_OP_CLEAR);
+			flush |= kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+							 ptep_level, GSTAGE_OP_CLEAR);
 
 next:
 		addr += page_size;
@@ -412,9 +416,11 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 		if (!(gstage->flags & KVM_GSTAGE_FLAGS_LOCAL) && may_block && addr < end)
 			cond_resched_lock(&gstage->kvm->mmu_lock);
 	}
+
+	return flush;
 }
 
-void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end)
+bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end)
 {
 	int ret;
 	pte_t *ptep;
@@ -422,6 +428,7 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	bool found_leaf;
 	gpa_t addr = start;
 	unsigned long page_size;
+	bool flush = false;
 
 	while (addr < end) {
 		found_leaf = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &ptep_level);
@@ -433,11 +440,13 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 			goto next;
 
 		addr = ALIGN_DOWN(addr, page_size);
-		kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-					ptep_level, GSTAGE_OP_WP);
+		flush |= kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+						 ptep_level, GSTAGE_OP_WP);
 next:
 		addr += page_size;
 	}
+
+	return flush;
 }
 
 void __init kvm_riscv_gstage_mode_detect(void)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024..8469ed932 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -23,13 +23,15 @@ static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 	phys_addr_t start = memslot->base_gfn << PAGE_SHIFT;
 	phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
+	bool flush;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
-	kvm_riscv_gstage_wp_range(&gstage, start, end);
+	flush = kvm_riscv_gstage_wp_range(&gstage, start, end);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs_memslot(kvm, memslot);
+	if (flush)
+		kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
@@ -82,12 +84,17 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 {
 	struct kvm_gstage gstage;
+	bool flush;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
-	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
+	flush = kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
+
+	if (flush)
+		kvm_flush_remote_tlbs_range(kvm, gpa >> PAGE_SHIFT,
+					    size >> PAGE_SHIFT);
 }
 
 void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
@@ -99,10 +106,14 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
+	bool flush;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
-	kvm_riscv_gstage_wp_range(&gstage, start, end);
+	flush = kvm_riscv_gstage_wp_range(&gstage, start, end);
+	if (flush)
+		kvm_flush_remote_tlbs_range(kvm, start >> PAGE_SHIFT,
+					    (end - start) >> PAGE_SHIFT);
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
@@ -128,12 +139,16 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
 	phys_addr_t size = slot->npages << PAGE_SHIFT;
 	struct kvm_gstage gstage;
+	bool flush;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
-	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
+	flush = kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
+	if (flush)
+		kvm_flush_remote_tlbs_range(kvm, gpa >> PAGE_SHIFT,
+					    size >> PAGE_SHIFT);
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
@@ -231,17 +246,24 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	struct kvm_gstage gstage;
 	bool mmu_locked;
+	bool flush;
 
 	if (!kvm->arch.pgd)
 		return false;
 
 	kvm_riscv_gstage_init(&gstage, kvm);
 	mmu_locked = spin_trylock(&kvm->mmu_lock);
-	kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
-				     (range->end - range->start) << PAGE_SHIFT,
-				     range->may_block);
+
+	flush = kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
+					     (range->end - range->start) << PAGE_SHIFT,
+					     range->may_block);
+
 	if (mmu_locked)
 		spin_unlock(&kvm->mmu_lock);
+
+	if (flush)
+		kvm_flush_remote_tlbs_range(kvm, range->start,
+					    range->end - range->start);
 	return false;
 }
 
@@ -557,11 +579,12 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 {
 	struct kvm_gstage gstage;
 	void *pgd = NULL;
+	bool flush = false;
 
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
 		kvm_riscv_gstage_init(&gstage, kvm);
-		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
+		flush = kvm_riscv_gstage_unmap_range(&gstage, 0UL,
 			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
 		pgd = READ_ONCE(kvm->arch.pgd);
 		kvm->arch.pgd = NULL;
@@ -570,6 +593,9 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	}
 	spin_unlock(&kvm->mmu_lock);
 
+	if (flush)
+		kvm_flush_remote_tlbs(kvm);
+
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
