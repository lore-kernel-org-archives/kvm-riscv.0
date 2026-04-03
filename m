Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0722E85375
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TksV3pprH1Xx3imkyfm+U6+vToGJQp9zlaP8kseiEHA=; b=05zh0qOrR+IO5x
	WtEZnNf2T2WTvnONUUukeX66W4aam6kmJYGI1cu3ZyIMhdvbBi0GlE36gXPDnPUYSLy3Qhu1dzItW
	3Stb2Dq8S/I4MGTQa0HS7NHENnvQhxGxtySbFUlErl2lTsaNP/FtrmqGBOAuAxLh8U7yxvprm5g/6
	zDYbBCmAjEh3MMQI290cP4VjNXN4dRDJcsNV9wj7/W3MvawbHhiZhkd5LA6ysGMgshj7AHbC/ksDi
	/JSEsT3L4Tx2IB0Wdq1Lg/Oo2iwspTD9P1KhU1Xo9RS8bjYg2O/PrHGjUXSy+NcsiARJoHCGMqd7m
	3IjfaVTjLmtlqcrFhBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTq-00000002DHd-1n0x;
	Fri, 03 Apr 2026 15:30:42 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gTm-00000002DDO-3z6Q;
	Fri, 03 Apr 2026 15:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775230234; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=P6NbZiOMkU8cQutDdqvRtWcC03732/Yoi102kKoLQNc=;
	b=QJfZs+XNQoUpRg3MFbSSeESLy08YNh57zkKk+VapWaOrmXAbwIQlobZ5k0aFs19I5ZeCGXMnLligU/XXJs+tHt764NKM+tsIPyRGYRKI0vPpy9tFuO0olH4fn/yqd9ziP6+gUMM6nkyOwkeuJVilcs2xYGbTAXGbadwhxig1ySc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0KbxUO_1775230225;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0KbxUO_1775230225 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 23:30:26 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	skhan@linuxfoundation.org
Cc: guoren@kernel.org,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v8 2/3] RISC-V: KVM: Cache gstage pgd_levels in struct kvm_gstage
Date: Fri,  3 Apr 2026 23:30:17 +0800
Message-Id: <20260403153019.9916-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083039_241377_23DA2D78 
X-CRM114-Status: GOOD (  13.09  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Gstage page-table helpers frequently chase gstage->kvm->arch to
fetch pgd_levels. This adds noise and repeats the same dereference
chain in hot paths.

Add pgd_levels to struct kvm_gstage and initialize it from kvm->arch
when setting up a gstage instance. Introduce kvm_riscv_gstage_init()
to centralize initialization and switch gstage code to use
gstage->pgd_levels.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/kvm_gstage.h | 10 ++++++
 arch/riscv/kvm/gstage.c             | 10 +++---
 arch/riscv/kvm/mmu.c                | 50 ++++++-----------------------
 3 files changed, 25 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 5aa58d1f692a..70d9d483365e 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -15,6 +15,7 @@ struct kvm_gstage {
 #define KVM_GSTAGE_FLAGS_LOCAL		BIT(0)
 	unsigned long vmid;
 	pgd_t *pgd;
+	unsigned long pgd_levels;
 };
 
 struct kvm_gstage_mapping {
@@ -92,4 +93,13 @@ static inline unsigned long kvm_riscv_gstage_mode(unsigned long pgd_levels)
 	}
 }
 
+static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *kvm)
+{
+	gstage->kvm = kvm;
+	gstage->flags = 0;
+	gstage->vmid = READ_ONCE(kvm->arch.vmid.vmid);
+	gstage->pgd = kvm->arch.pgd;
+	gstage->pgd_levels = kvm->arch.pgd_levels;
+}
+
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 4beb9322fe76..7c4c34bc191b 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -26,7 +26,7 @@ static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
 	unsigned long mask;
 	unsigned long shift = HGATP_PAGE_SHIFT + (kvm_riscv_gstage_index_bits * level);
 
-	if (level == gstage->kvm->arch.pgd_levels - 1)
+	if (level == gstage->pgd_levels - 1)
 		mask = (PTRS_PER_PTE * (1UL << kvm_riscv_gstage_pgd_xbits)) - 1;
 	else
 		mask = PTRS_PER_PTE - 1;
@@ -45,7 +45,7 @@ static int gstage_page_size_to_level(struct kvm_gstage *gstage, unsigned long pa
 	u32 i;
 	unsigned long psz = 1UL << 12;
 
-	for (i = 0; i < gstage->kvm->arch.pgd_levels; i++) {
+	for (i = 0; i < gstage->pgd_levels; i++) {
 		if (page_size == (psz << (i * kvm_riscv_gstage_index_bits))) {
 			*out_level = i;
 			return 0;
@@ -58,7 +58,7 @@ static int gstage_page_size_to_level(struct kvm_gstage *gstage, unsigned long pa
 static int gstage_level_to_page_order(struct kvm_gstage *gstage, u32 level,
 				      unsigned long *out_pgorder)
 {
-	if (gstage->kvm->arch.pgd_levels < level)
+	if (gstage->pgd_levels < level)
 		return -EINVAL;
 
 	*out_pgorder = 12 + (level * kvm_riscv_gstage_index_bits);
@@ -83,7 +83,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 			       pte_t **ptepp, u32 *ptep_level)
 {
 	pte_t *ptep;
-	u32 current_level = gstage->kvm->arch.pgd_levels - 1;
+	u32 current_level = gstage->pgd_levels - 1;
 
 	*ptep_level = current_level;
 	ptep = (pte_t *)gstage->pgd;
@@ -127,7 +127,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			     struct kvm_mmu_memory_cache *pcache,
 			     const struct kvm_gstage_mapping *map)
 {
-	u32 current_level = gstage->kvm->arch.pgd_levels - 1;
+	u32 current_level = gstage->pgd_levels - 1;
 	pte_t *next_ptep = (pte_t *)gstage->pgd;
 	pte_t *ptep = &next_ptep[gstage_pte_index(gstage, map->addr, current_level)];
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index fbcdd75cb9af..2d3def024270 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -24,10 +24,7 @@ static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 	phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_wp_range(&gstage, start, end);
@@ -49,10 +46,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	struct kvm_gstage_mapping map;
 	struct kvm_gstage gstage;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
@@ -89,10 +83,7 @@ void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 {
 	struct kvm_gstage gstage;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
@@ -109,10 +100,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	kvm_riscv_gstage_wp_range(&gstage, start, end);
 }
@@ -141,10 +129,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	phys_addr_t size = slot->npages << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	spin_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
@@ -250,10 +235,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.pgd)
 		return false;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 	mmu_locked = spin_trylock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
 				     (range->end - range->start) << PAGE_SHIFT,
@@ -275,10 +257,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
 				       &ptep, &ptep_level))
 		return false;
@@ -298,10 +277,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
 				       &ptep, &ptep_level))
 		return false;
@@ -463,10 +439,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	struct kvm_gstage gstage;
 	struct page *page;
 
-	gstage.kvm = kvm;
-	gstage.flags = 0;
-	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage.pgd = kvm->arch.pgd;
+	kvm_riscv_gstage_init(&gstage, kvm);
 
 	/* Setup initial state of output mapping */
 	memset(out_map, 0, sizeof(*out_map));
@@ -587,10 +560,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
-		gstage.kvm = kvm;
-		gstage.flags = 0;
-		gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
-		gstage.pgd = kvm->arch.pgd;
+		kvm_riscv_gstage_init(&gstage, kvm);
 		kvm_riscv_gstage_unmap_range(&gstage, 0UL,
 			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
 		pgd = READ_ONCE(kvm->arch.pgd);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
