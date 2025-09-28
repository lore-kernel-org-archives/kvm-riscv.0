Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1130CCAC5B5
	for <kvm-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vZ+HnT3BhAh+AAFZWba8DhyvW+dN5qPG9tPS6eFCXWk=; b=CZy
	4f+09gCjuLgMks2v3tf2TIvBa1SGdX+sKywwlXv5h8gQnvOUiOZ+djy2tTsXobr+XP/1ysShxzsjk
	pWElilskmOwPs5Icq6DLyrnmBWB//tOyJvjTWs+wEJOiGqy5gG+s3PVjm8IwFRmBNxZLrMS/X/vKo
	loW1V5KEr1aaDGS0915e5x2Z6ywtg27VmfcVwjeu+NqVVRxHs+7S678v4vV9pdTmLolqIRis96ckq
	lv4Du9hO9kfnjT2rSyq2zVN05MSKP3ZojyPpXb2fZe6FjQYad2uzWtKDya278R3yRdzxHMIO4/YhK
	PdMGC7g8wiprt8/64MZ0lw7mdxXnfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m5k-0000000E79g-1eq3;
	Sun, 28 Sep 2025 07:45:08 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m5g-0000000E75k-3143;
	Sun, 28 Sep 2025 07:45:07 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4cZGYw5YCVz4xNt7;
	Sun, 28 Sep 2025 15:44:52 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 58S7imtK038376;
	Sun, 28 Sep 2025 15:44:48 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 28 Sep 2025 15:44:50 +0800 (CST)
Date: Sun, 28 Sep 2025 15:44:50 +0800 (CST)
X-Zmail-TransId: 2afb68d8e7723ba-ff67b
X-Mailer: Zmail v1.0
Message-ID: <20250928154450701hRC3fm00QYFnGiM0_M1No@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>
Cc: <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBSSVNDLVY6IEtWTTogVHJhbnNwYXJlbnQgaHVnZSBwYWdlIHN1cHBvcnQ=?=
X-MAIL: mse-fl2.zte.com.cn 58S7imtK038376
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Sun, 28 Sep 2025 15:44:52 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68D8E774.001/4cZGYw5YCVz4xNt7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_004505_162200_6B4AED6E 
X-CRM114-Status: GOOD (  17.27  )
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

Use block mapping if backed by a THP, as implemented in architectures
like ARM and x86_64.

Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 arch/riscv/include/asm/kvm_gstage.h |   3 +
 arch/riscv/kvm/gstage.c             | 100 ++++++++++++++++++++++++++++
 arch/riscv/kvm/mmu.c                |  12 +++-
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 595e2183173e..cc67fb2d2d42 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -69,4 +69,7 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end

 void kvm_riscv_gstage_mode_detect(void);

+long kvm_riscv_gstage_thp_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
+				 unsigned long hva, kvm_pfn_t *pfnp, gpa_t *gpa);
+
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 24c270d6d0e2..98494b4b4652 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -77,6 +77,106 @@ static int gstage_level_to_page_size(u32 level, unsigned long *out_pgsize)
 	return 0;
 }

+static int gstage_get_user_mapping_size(struct kvm *kvm, u64 addr)
+{
+	pte_t *ptepp;
+	u32 ptep_level;
+	unsigned long out_pgsize;
+	struct kvm_gstage gstage = {
+		.pgd = kvm->mm->pgd
+	};
+
+	if (!kvm_riscv_gstage_get_leaf(&gstage, addr, &ptepp, &ptep_level))
+		return -EFAULT;
+
+	if (gstage_level_to_page_size(ptep_level, &out_pgsize))
+		return -EFAULT;
+
+	return out_pgsize;
+}
+
+static bool gstage_supports_huge_mapping(struct kvm_memory_slot *memslot, unsigned long hva)
+{
+	gpa_t gpa_start;
+	hva_t uaddr_start, uaddr_end;
+	size_t size;
+
+	size = memslot->npages * PAGE_SIZE;
+	uaddr_start = memslot->userspace_addr;
+	uaddr_end = uaddr_start + size;
+
+	gpa_start = memslot->base_gfn << PAGE_SIZE;
+
+	/*
+	 * Pages belonging to memslots that don't have the same alignment
+	 * within a PMD for userspace and GPA cannot be mapped with g-stage
+	 * PMD entries, because we'll end up mapping the wrong pages.
+	 *
+	 * Consider a layout like the following:
+	 *
+	 *    memslot->userspace_addr:
+	 *    +-----+--------------------+--------------------+---+
+	 *    |abcde|fgh  vs-stage block  |    vs-stage block tv|xyz|
+	 *    +-----+--------------------+--------------------+---+
+	 *
+	 *    memslot->base_gfn << PAGE_SHIFT:
+	 *      +---+--------------------+--------------------+-----+
+	 *      |abc|def  g-stage block  |    g-stage block   |tvxyz|
+	 *      +---+--------------------+--------------------+-----+
+	 *
+	 * If we create those g-stage blocks, we'll end up with this incorrect
+	 * mapping:
+	 *   d -> f
+	 *   e -> g
+	 *   f -> h
+	 */
+	if ((gpa_start & (PMD_SIZE - 1)) != (uaddr_start & (PMD_SIZE - 1)))
+		return false;
+
+	/*
+	 * Next, let's make sure we're not trying to map anything not covered
+	 * by the memslot. This means we have to prohibit block size mappings
+	 * for the beginning and end of a non-block aligned and non-block sized
+	 * memory slot (illustrated by the head and tail parts of the
+	 * userspace view above containing pages 'abcde' and 'xyz',
+	 * respectively).
+	 *
+	 * Note that it doesn't matter if we do the check using the
+	 * userspace_addr or the base_gfn, as both are equally aligned (per
+	 * the check above) and equally sized.
+	 */
+	return (hva >= ALIGN(uaddr_start, PMD_SIZE)) && (hva < ALIGN_DOWN(uaddr_end, PMD_SIZE));
+}
+
+long kvm_riscv_gstage_thp_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
+				 unsigned long hva, kvm_pfn_t *hfnp, gpa_t *gpa)
+{
+	kvm_pfn_t hfn = *hfnp;
+
+	/*
+	 * Make sure the adjustment is done only for THP pages. Also make
+	 * sure that the HVA and GPA are sufficiently aligned and that the
+	 * block map is contained within the memslot.
+	 */
+	if (gstage_supports_huge_mapping(memslot, hva)) {
+		int sz = gstage_get_user_mapping_size(kvm, hva);
+
+		if (sz < 0)
+			return sz;
+
+		if (sz < PMD_SIZE)
+			return PAGE_SIZE;
+
+		*gpa &= PMD_MASK;
+		hfn &= ~(PTRS_PER_PMD - 1);
+		*hfnp = hfn;
+
+		return PMD_SIZE;
+	}
+
+	return PAGE_SIZE;
+}
+
 bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 			       pte_t **ptepp, u32 *ptep_level)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..f70cf721ebb8 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -337,7 +337,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
-	unsigned long vma_pagesize, mmu_seq;
+	unsigned long mmu_seq;
+	long vma_pagesize;
 	struct kvm_gstage gstage;
 	struct page *page;

@@ -416,6 +417,15 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (mmu_invalidate_retry(kvm, mmu_seq))
 		goto out_unlock;

+	/* check if we are backed by a THP and thus use block mapping if possible */
+	if (vma_pagesize == PAGE_SIZE) {
+		vma_pagesize = kvm_riscv_gstage_thp_adjust(kvm, memslot, hva, &hfn, &gpa);
+		if (vma_pagesize < 0) {
+			ret = vma_pagesize;
+			goto out_unlock;
+		}
+	}
+
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
