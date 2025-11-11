Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21589CCFA18
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 04:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OdoNX851NcdiCjCGHAd2pWXiUw+2MqwloLp4RZmovFA=; b=Xoy
	dDnohYisHQPA5kV/zNrSOmdgDEXZBmkLSS4WR1zG0aRxDY+D6UNZtOKOtLOKdzq1Nxz1YhvgI/wpk
	1qLLCpKt1Ji81pYA2ZawtESXpEDVTiMxiuwh2Jd0gm4fdioRSCPFvBxxATHcGAMwHxE9eZUOYwXjW
	pSxm7Bx7u1tzaDo907pDlIyJ5DVQPzynZsyOIawFLWBVNvoBS3FOA+DkAx3cnmRdNmfcwTJMyVFPs
	EfiEK+wiaW/8P8y5AcZkYHUwz5bCIDlBGxD0f0oN85s/d3NqStwJySuZQ5mwipYRyXF+0A0K2mjHK
	NSUDAq1xisl3UdR8MQJRkdYPnwi72bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIgKC-00000006WVP-2OdN;
	Tue, 11 Nov 2025 04:49:48 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIgK9-00000006WUj-2aYm
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 04:49:47 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4d5DbL6hlKz8Xs72;
	Tue, 11 Nov 2025 12:49:34 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 5AB4nVsH024286;
	Tue, 11 Nov 2025 12:49:31 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 11 Nov 2025 12:49:32 +0800 (CST)
Date: Tue, 11 Nov 2025 12:49:32 +0800 (CST)
X-Zmail-TransId: 2afa6912c05c6ac-e258e
X-Mailer: Zmail v1.0
Message-ID: <20251111124932618qn9qbBbeaZrOZ3UDg7jed@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <atish.patra@linux.dev>, <alex@ghiti.fr>, <anup@brainfault.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <inux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYzXSBSSVNDLVY6IEtWTTogVHJhbnNwYXJlbnQgaHVnZSBwYWdlIHN1cHBvcnQ=?=
X-MAIL: mse-fl1.zte.com.cn 5AB4nVsH024286
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 11 Nov 2025 12:49:34 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6912C05E.000/4d5DbL6hlKz8Xs72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_204945_967836_D0742A35 
X-CRM114-Status: GOOD (  17.12  )
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
Changes in v3:
- Changed prototype of gstage_get_user_mapping_size to
  kvm_riscv_gstage_get_mapping_size.
- Relocated the remaining functions from gstage.c in v2 to mmu.c and
  renamed them.

 arch/riscv/include/asm/kvm_gstage.h |  2 +
 arch/riscv/kvm/gstage.c             | 15 +++++
 arch/riscv/kvm/mmu.c                | 97 ++++++++++++++++++++++++++++-
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 595e2183173e..006bbdb90df8 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -69,4 +69,6 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end

 void kvm_riscv_gstage_mode_detect(void);

+int kvm_riscv_gstage_get_mapping_size(struct kvm_gstage *gstage, gpa_t addr);
+
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..a63089206869 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -357,3 +357,18 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
 }
+
+int kvm_riscv_gstage_get_mapping_size(struct kvm_gstage *gstage, gpa_t addr)
+{
+	pte_t *ptepp;
+	u32 ptep_level;
+	unsigned long out_pgsize;
+
+	if (!kvm_riscv_gstage_get_leaf(gstage, addr, &ptepp, &ptep_level))
+		return -EFAULT;
+
+	if (gstage_level_to_page_size(ptep_level, &out_pgsize))
+		return -EFAULT;
+
+	return out_pgsize;
+}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..1457bc958505 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -323,6 +323,91 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return pte_young(ptep_get(ptep));
 }

+static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot, unsigned long hva)
+{
+	gpa_t gpa_start;
+	hva_t uaddr_start, uaddr_end;
+	size_t size;
+
+	size = memslot->npages * PAGE_SIZE;
+	uaddr_start = memslot->userspace_addr;
+	uaddr_end = uaddr_start + size;
+
+	gpa_start = memslot->base_gfn << PAGE_SHIFT;
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
+static long transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
+					unsigned long hva, kvm_pfn_t *hfnp, gpa_t *gpa)
+{
+	kvm_pfn_t hfn = *hfnp;
+
+	/*
+	 * Make sure the adjustment is done only for THP pages. Also make
+	 * sure that the HVA and GPA are sufficiently aligned and that the
+	 * block map is contained within the memslot.
+	 */
+	if (fault_supports_gstage_huge_mapping(memslot, hva)) {
+		struct kvm_gstage gstage;
+
+		gstage.pgd = kvm->mm->pgd;
+		int sz = kvm_riscv_gstage_get_mapping_size(&gstage, hva);
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
 int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		      gpa_t gpa, unsigned long hva, bool is_write,
 		      struct kvm_gstage_mapping *out_map)
@@ -337,7 +422,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
-	unsigned long vma_pagesize, mmu_seq;
+	unsigned long mmu_seq;
+	long vma_pagesize;
 	struct kvm_gstage gstage;
 	struct page *page;

@@ -416,6 +502,15 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (mmu_invalidate_retry(kvm, mmu_seq))
 		goto out_unlock;

+	/* check if we are backed by a THP and thus use block mapping if possible */
+	if (vma_pagesize == PAGE_SIZE) {
+		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
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
