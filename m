Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5D9C88E40
	for <kvm-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmHxnhvZsQ7Y+y4nVFDpAIyNE+149xsJ0vSaoWZew84=; b=PanCzzCwdrnkN5
	yjaQixYOHYrCwLfTbvT3z7XtT3piTggSX4releSxouk9xkiqLY80gkjftXch+DABUcpstWiVbwSRk
	gHfayuJtNP7J26p3IoYBCwKtiK6muRra7bO8Epij3V+uqoT1gb1wk2PUBcTtNak9pLYfdov78SD+I
	vRzO9fX9x+Mn6SZWhZ8Riu80eGn64sQVZmjPLAPY8VKCPeLYNNM8K/uYcrdOx0OV8SmmJ0hSlXSG6
	ve09rndw768L7DKfQFtwhZYnr8b7JzFYng5Gkx/3wmcee4cmqFBuFESoyISvu2ffz/Rnf+HEgdO7W
	aQZngw8dDww3bMveghHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNH-00000001Thi-3nYd;
	Sun, 13 Sep 2026 07:11:39 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNE-00000001Tgg-0ZAJ;
	Sun, 13 Sep 2026 07:11:38 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjKFw0Zwgz5B12h;
	Sun, 13 Sep 2026 15:11:32 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 68D7BRXe059926;
	Sun, 13 Sep 2026 15:11:27 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Sun, 13 Sep 2026 15:11:29 +0800
X-Zmail-TransId: 3e816aa64ca101c-64950
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v4 2/2] RISC-V: KVM: Recover gstage huge page mappings during disable-dirty-log
Date: Sun, 13 Sep 2026 15:03:46 +0800
Message-ID: <20260913070352.3626956-3-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260913070352.3626956-1-wang.yechao255@zte.com.cn>
References: <20260913070352.3626956-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 68D7BRXe059926
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 13 Sep 2026 15:11:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA64CA4.000/4hjKFw0Zwgz5B12h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_001136_499394_AC4DCDBD 
X-CRM114-Status: GOOD (  21.56  )
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

When dirty logging is enabled, the gstage mappings are split into
4K pages to track dirty pages. If the migration fails or is canceled,
in order to keep the VM's performance consistent with that before
dirty logging was enabled, the gstage huge page mappings are recoverd
when dirty logging is disabled.

With this patch, dirty_log_perf_test shows a decrease in the number of
vCPU faults:

$ perf stat -e kvm:kvm_page_fault \
./dirty_log_perf_test -s anonymous_hugetlb_1gb -v 1 -e -b 1G

Before: 1,574,460    kvm:kvm_page_fault
After : 788,048      kvm:kvm_page_fault

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             |  67 +++++++++++++++
 arch/riscv/kvm/mmu.c                | 127 +++++++++++++++++++++++++++-
 3 files changed, 197 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77a..6dd0a96b336f4 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -68,6 +68,10 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 				 struct kvm_mmu_memory_cache *pcache,
 				 gpa_t addr, u32 target_level, bool flush);
 
+bool kvm_riscv_gstage_recover_huge(struct kvm_gstage *gstage, gpa_t addr,
+				   unsigned long target_page_size,
+				   unsigned long *page_size);
+
 enum kvm_riscv_gstage_op {
 	GSTAGE_OP_NOP = 0,	/* Nothing */
 	GSTAGE_OP_CLEAR,	/* Clear/Unmap */
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef1..b9414a62c3e04 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -369,6 +369,73 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	return need_flush;
 }
 
+static inline unsigned long make_huge_pte(unsigned long child_pte, int index,
+					  unsigned long child_page_size)
+{
+	unsigned long huge_pte = child_pte;
+	unsigned long child_pfn_offset;
+
+	child_pfn_offset = index * (child_page_size / PAGE_SIZE);
+	huge_pte -= pte_val(pfn_pte(child_pfn_offset, __pgprot(0)));
+
+	return huge_pte;
+}
+
+bool kvm_riscv_gstage_recover_huge(struct kvm_gstage *gstage, gpa_t addr,
+				   unsigned long target_page_size,
+				   unsigned long *page_size)
+{
+	u32 current_level = gstage->pgd_levels - 1;
+	pte_t *next_ptep = (pte_t *)gstage->pgd;
+	u32 target_level, out_level;
+	pte_t *ptep, *child_ptep;
+	unsigned long huge_pte;
+	bool recovered = false;
+	int ret, i;
+
+	out_level = 0;
+	ret = gstage_page_size_to_level(gstage, target_page_size, &target_level);
+	if (ret)
+		goto out;
+
+	while (current_level >= target_level) {
+		ptep = (pte_t *)&next_ptep[gstage_pte_index(gstage, addr, current_level)];
+
+		out_level = current_level;
+		if (!pte_val(ptep_get(ptep)))
+			goto out;
+
+		/* The mapping is already a huge page mapping. */
+		if (gstage_pte_leaf(ptep)) {
+			recovered = true;
+			goto out;
+		}
+
+		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+		current_level--;
+	}
+
+	for (i = 0; i < PTRS_PER_PTE; i++) {
+		child_ptep = (pte_t *)&next_ptep[i];
+		if (!gstage_pte_leaf(child_ptep))
+			continue;
+
+		huge_pte = make_huge_pte(pte_val(ptep_get(child_ptep)),
+					 i, target_page_size / PTRS_PER_PTE);
+		set_pte(ptep, __pte(huge_pte));
+		gstage_tlb_flush(gstage, target_level, addr);
+		put_page(virt_to_page(next_ptep));
+		recovered = true;
+
+		break;
+	}
+
+out:
+	gstage_level_to_page_size(gstage, out_level, page_size);
+
+	return recovered;
+}
+
 bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6035b5ec95039..8e76187abd89a 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -19,6 +19,8 @@
 static bool __read_mostly eager_page_split = true;
 module_param(eager_page_split, bool, 0644);
 
+static void mmu_recover_huge_pages(struct kvm *kvm, int slot);
+
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
 	struct kvm_memslots *slots = kvm_memslots(kvm);
@@ -241,17 +243,44 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
+	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+
 	/*
 	 * At this point memslot has been committed and dirty pages will be
 	 * tracked while the memory slot is write protected.
 	 */
-	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+	if (log_dirty_pages) {
+		if (change == KVM_MR_DELETE)
+			return;
+
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
+
 		mmu_wp_memory_region(kvm, new->id);
 
 		if (READ_ONCE(eager_page_split))
 			mmu_split_memory_region(kvm, new->id);
+
+	} else {
+		/*
+		 * Only when change == KVM_MR_FLAGS_ONLY, this branch handles the
+		 * disable-dirty-log case. For other changes (KVM_MR_CREATE,
+		 * KVM_MR_DELETE, KVM_MR_MOVE), there is no need to recover
+		 * huge pages.
+		 */
+		if (change != KVM_MR_FLAGS_ONLY)
+			return;
+
+		/*
+		 * Recover huge page mappings in the slot now that dirty logging
+		 * is disabled, i.e. now that KVM does not have to track guest
+		 * writes at 4KiB granularity.
+		 *
+		 * Dirty logging might be disabled by userspace if an ongoing VM
+		 * live migration is cancelled and the VM must continue running
+		 * on the source.
+		 */
+		mmu_recover_huge_pages(kvm, new->id);
 	}
 }
 
@@ -810,3 +839,99 @@ void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
 	if (!kvm_riscv_gstage_vmid_bits())
 		kvm_riscv_local_hfence_gvma_all();
 }
+
+static unsigned long mmu_recover_huge_pages_range(struct kvm_gstage *gstage,
+						  unsigned long page_size,
+						  gpa_t range_start,
+						  gpa_t range_end)
+{
+	phys_addr_t start = range_start;
+	phys_addr_t end = range_end;
+	unsigned long out_sz = 0;
+	bool recovered = true;
+
+	/*
+	 *  Recover 2MB hugepages mapping within the range.
+	 */
+	while (start < end) {
+		recovered &= kvm_riscv_gstage_recover_huge(gstage, start,
+							   PMD_SIZE, &out_sz);
+		start += out_sz;
+	}
+
+	/*
+	 * If 1GB hugepages are desired, try to recover the whole range
+	 * as one 1GB hugepages mapping.
+	 */
+	if (recovered && (page_size == PUD_SIZE)) {
+		start = range_start;
+		kvm_riscv_gstage_recover_huge(gstage, start, PUD_SIZE, &out_sz);
+	}
+
+	return out_sz;
+}
+
+static void mmu_recover_huge_pages(struct kvm *kvm, int slot)
+{
+	struct kvm_memslots *slots = kvm_memslots(kvm);
+	struct kvm_memory_slot *memslot = id_to_memslot(slots, slot);
+	unsigned long hva = gfn_to_hva(kvm, memslot->base_gfn);
+	phys_addr_t start = memslot->base_gfn << PAGE_SHIFT;
+	phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
+	phys_addr_t addr = start;
+	struct kvm_gstage gstage;
+	unsigned long page_size;
+	unsigned long out_size;
+	phys_addr_t range_start;
+	phys_addr_t range_end;
+
+	if (!(fault_supports_gstage_huge_mapping(memslot, hva, PMD_SIZE) ||
+	    fault_supports_gstage_huge_mapping(memslot, hva, PUD_SIZE)))
+		return;
+
+	kvm_riscv_gstage_init(&gstage, kvm);
+
+	write_lock(&kvm->mmu_lock);
+
+	while (addr < end) {
+		/*
+		 * If a very large memslot is mapped exclusively with
+		 * 4KB host pages, or too many hugepages need to recover,
+		 * release the kvm->mmu_lock to prevent starvation and
+		 * lockup detector warnings.
+		 */
+		cond_resched_rwlock_write(&kvm->mmu_lock);
+
+		if (!kvm->arch.pgd)
+			break;
+
+		hva = gfn_to_hva(kvm, addr >> PAGE_SHIFT);
+		page_size = get_hva_mapping_size(kvm, hva);
+		if (page_size == PAGE_SIZE) {
+			addr += page_size;
+			continue;
+		}
+
+		range_start = ALIGN_DOWN(addr, page_size);
+		range_end = range_start + page_size;
+
+		/*
+		 * Make sure the recover range [range_start, range_end)
+		 * is within the slot range.
+		 */
+		if (range_start < start || range_end > end) {
+			addr = range_end;
+			continue;
+		}
+
+		out_size = mmu_recover_huge_pages_range(&gstage, page_size,
+							range_start, range_end);
+
+		if (out_size > page_size)
+			page_size = out_size;
+
+		addr = range_start + page_size;
+	}
+
+	write_unlock(&kvm->mmu_lock);
+}
-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
