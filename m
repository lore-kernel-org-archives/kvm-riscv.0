Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09842606A326
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjfgAY+b;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MLsFjbi2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ddrGkCrOwVsUBSVOkAyEJdZdC8QMGTm2oWChKNdsAxk=; b=UjfgAY+bXj/4zzpcNFCV0/B0Hu
	8wIFjnczYxkMChOJMgj82EU4YSPRXoYhf7HbIC9Xv9+dJX/uSG0ZqjLSco3rMjCNNl4159XFwYm+D
	1GKQTlcwZDGRj4e6lrFcmcqoWMBW2Kmnte04Zzn+U5E/bEZrQHN2eHNOiKFBsp+ob4/O2lROIkdlR
	SZq6r46TY0JL32diJOSb/PNeU/d4/Srlaa8iA6I95C4pT00cEs3gF5bw28p8Z2Z/jNH6lNolOtb4c
	wMGuJdbMXT4+8C235h7svsUaMuFom2VwNzNsCav0sP1/EMNJT4alR09ITlVqOFZG823g0MwKR7+jD
	1N7fKgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmCY-00000005x9K-2kiK;
	Tue, 24 Nov 2026 08:48:34 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmCW-00000005x7u-37z5;
	Tue, 24 Nov 2026 08:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795510105; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=NMfXN428M3Pscdin+6iB0nBnywevrayks8T3ADwi/F8=;
	b=MLsFjbi28YKXvniDTPmwX6MXxDqvAgKkKKhSsXGcICDzHI+9SlhDeuqqVilNxYu0fT52J86rMz8JENshIkyJBlfUQZTM90pHUGNBZbWRg1U+ZiL0FTFRDvorsyfhnZS7TADDY8RETM3VtH7l/3NZ4oCJNC70a9sRnyX6it3oCF0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jinyue.li@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XFO-WoZ_1795510103;
Received: from aa8c952a0f58..(mailfrom:jinyue.li@linux.alibaba.com fp:SMTPD_---0XFO-WoZ_1795510103 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 16:48:24 +0800
From: Li Jinyue <jinyue.li@linux.alibaba.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Age the whole range in kvm_age_gfn() and kvm_test_age_gfn()
Date: Tue, 24 Nov 2026 08:48:23 +0000
Message-Id: <20261124084823.1189514-1-jinyue.li@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_004832_980825_842F9112 
X-CRM114-Status: GOOD (  15.86  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_age_gfn() and kvm_test_age_gfn() expect the MMU notifier range to
cover exactly one G-stage leaf. They warn when the size is not
PAGE_SIZE, PMD_SIZE or PUD_SIZE, and then only look at the leaf that
maps range->start.

The range is the host mapping being aged, clipped to the memslot, so
there is no such guarantee. folio_referenced_one() ages all PTEs of a
PTE-mapped large folio in one call, and a PMD-mapped THP backing a
memslot smaller than PMD_SIZE is clipped to the memslot size. In both
cases the range spans several G-stage leaves. syzkaller hit the second
case on a 6.6-based kernel with THP-backed guest memory split into
memslots of a few pages, followed by MADV_PAGEOUT. The line number
below is from that kernel; the same code in mainline is at
arch/riscv/kvm/mmu.c:362 and :382:

  WARNING: CPU: 1 PID: 7943 at arch/riscv/kvm/mmu.c:586 kvm_age_gfn+0x14c/0x20a
  ...
   kvm_age_gfn+0x14c/0x20a
   kvm_mmu_notifier_clear_flush_young+0x186/0x45c
   __mmu_notifier_clear_flush_young+0xc0/0x17a
   folio_referenced_one+0x4b8/0x81e
   rmap_walk_anon+0x400/0x9d0
   folio_referenced+0x216/0x3ae
   shrink_folio_list+0x148a/0x31c4
   reclaim_folio_list.constprop.0+0x11c/0x3a0
   reclaim_pages+0x2c6/0x420
   madvise_cold_or_pageout_pte_range+0xff6/0x16e0

Besides the warning, guest accesses to any page in the range other than
the first one are missed, so reclaim may treat recently used guest
memory as old.

Add kvm_riscv_gstage_test_clear_young(), which walks the range the same
way kvm_riscv_gstage_wp_range() does and tests or clears the accessed
bit of every leaf it finds, and use it in both handlers. arm64 had the
same problem and fixed it in commit df6556adf27b ("KVM: arm64: Correctly
handle page aging notifiers for unaligned memslot").

Found by syzkaller.

Fixes: 9955371cc014 ("RISC-V: KVM: Implement MMU notifiers")
Cc: stable@vger.kernel.org
Signed-off-by: Li Jinyue <jinyue.li@linux.alibaba.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  3 +++
 arch/riscv/kvm/gstage.c             | 30 +++++++++++++++++++++++++++++
 arch/riscv/kvm/mmu.c                | 26 ++++++-------------------
 3 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..04e6133665c2 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -82,6 +82,9 @@ bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 
 bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
 
+bool kvm_riscv_gstage_test_clear_young(struct kvm_gstage *gstage, gpa_t start,
+				       gpa_t end, bool mkold);
+
 bool kvm_riscv_gstage_wp_pt_masked(struct kvm_gstage *gstage, gfn_t base_gfn,
 				   unsigned long mask);
 
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index be70607a33ea..7cc66880acde 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -485,6 +485,36 @@ bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	return flush;
 }
 
+bool kvm_riscv_gstage_test_clear_young(struct kvm_gstage *gstage, gpa_t start,
+				       gpa_t end, bool mkold)
+{
+	int ret;
+	pte_t *ptep;
+	u32 ptep_level;
+	bool found_leaf;
+	gpa_t addr = start;
+	unsigned long page_size;
+	bool young = false;
+
+	while (addr < end) {
+		found_leaf = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &ptep_level);
+		ret = gstage_level_to_page_size(gstage, ptep_level, &page_size);
+		if (ret)
+			break;
+
+		if (found_leaf) {
+			if (mkold)
+				young |= ptep_test_and_clear_young(NULL, 0, ptep);
+			else
+				young |= pte_young(ptep_get(ptep));
+		}
+
+		addr = ALIGN(addr + 1, page_size);
+	}
+
+	return young;
+}
+
 static inline void clear_huge_mask(unsigned long *mask, unsigned long page_size,
 				   gfn_t base_gfn, gpa_t addr)
 {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6b77891d4582..26b85a0dcdb7 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -351,42 +351,28 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
-
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return kvm_riscv_gstage_test_clear_young(&gstage,
+						 range->start << PAGE_SHIFT,
+						 range->end << PAGE_SHIFT, true);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	pte_t *ptep;
-	u32 ptep_level = 0;
-	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	struct kvm_gstage gstage;
 
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
-
 	kvm_riscv_gstage_init(&gstage, kvm);
-	if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIFT,
-				       &ptep, &ptep_level))
-		return false;
-
-	return pte_young(ptep_get(ptep));
+	return kvm_riscv_gstage_test_clear_young(&gstage,
+						 range->start << PAGE_SHIFT,
+						 range->end << PAGE_SHIFT, false);
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-- 
2.25.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
