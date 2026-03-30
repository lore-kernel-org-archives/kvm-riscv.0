Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140F7F3D5E7
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIjGWGcpfdibGFZ93VBmTN0vZR7mFw/hLJXXiPx/pr8=; b=xgN2oKm1LbHjqf
	fbYgPvdhTkp/dXLpEaBrStiRSl67oKFE1aIKzCKyIX4ZczdCNbimedwSElU2+hIgZyZQ5ruEZAJds
	58o7anTPiBGKSiC2kprxpq5h2JM+lkiBBAjVXMb12rg2tPBD29Wko989z/z6jBf1DGk/nU8mHm6y3
	+r/UiPM4f8L1UdbRsctbmheX7eIVEOKrRaZKuYD9+XkDYj0zR1xXcggMA7zJb5FGUiTHOWHqI/1lV
	H0xmT9J//O59c/gogFAfRoVJ8Ciik6hn2+cHX/moUHO0fCApVRg6U0EzEPUiyq0wRLXz7zXoAJy7k
	kV+PWispeRGK1dvVg2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77ko-0000000ApCB-3FpK;
	Mon, 30 Mar 2026 08:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77km-0000000ApBv-3p3f;
	Mon, 30 Mar 2026 08:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Si/5wraTAOZ2qFub6LskIiqD5+w6RD8DbTI0lIDzVb4=; b=KlWXwKKUVaj8P44N2WkV6OJaJg
	d9ibT0U035x/yi4rZwGrO430yMBkCAogbVoia4HoI2t4k5aa/SB+clRcRm8wh5CWZBGvy1BZWWkzU
	Yc2lQqZvD3NX9QDqYYvFO6/0TkQkkLeJZO4tPGfbLzpIHxm5mA6+OI6I1jDP4hP88Z356dFGxIfqf
	aosE6309spDhZ2MK3bPGrLdmW2ObS8X9rzY6S49KD1bcom/FebC4yh87JzgIAXYRupBKOIGUBmOHK
	GVPt5MNjiXt4PSinPLUNbGrR5gf+1b/1YAFp5fZT2DL0JWts7R3o/Mlen0pkIVhh4rBESyoU8alvN
	gdY+2Naw==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77kj-0000000DHw8-0pyx;
	Mon, 30 Mar 2026 08:13:43 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fkkWw63wqz4xQXB;
	Mon, 30 Mar 2026 16:13:00 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 62U8CuS6055225;
	Mon, 30 Mar 2026 16:12:56 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 30 Mar 2026 16:12:58 +0800 (CST)
X-Zmail-TransId: 2b0469ca308a8c5-48805
X-Mailer: Zmail v1.0
Message-ID: <202603301612587174XZ6QMCrymBqv30S6BN50@zte.com.cn>
In-Reply-To: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
References: 202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn
Date: Mon, 30 Mar 2026 16:12:58 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?wqBbUEFUQ0ggdjQgMi8yXSBSSVNDLVY6IEtWTTogU3BsaXQgaHVnZSBwYWdlcyBkdXJpbmcgZmF1bHQgaGFuZGxpbmcgZm9yIGRpcnR5IGxvZ2dpbmc=?=
X-MAIL: mse-fl1.zte.com.cn 62U8CuS6055225
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 30 Mar 2026 16:13:00 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69CA308C.002/4fkkWw63wqz4xQXB
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_091341_866532_27A19796 
X-CRM114-Status: GOOD (  20.12  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

During dirty logging, all huge pages are write-protected. When the guest
writes to a write-protected huge page, a page fault is triggered. Before
recovering the write permission, the huge page must be split into smaller
pages (e.g., 4K). After splitting, the normal mapping process proceeds,
allowing write permission to be restored at the smaller page granularity.

If dirty logging is disabled because migration failed or was cancelled,
only recover the write permission at the 4K level, and skip recovering the
huge page mapping at this time to avoid the overhead of freeing page tables.
The huge page mapping can be recovered in the ioctl context, similar to x86,
in a later patch.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             | 126 ++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 595e2183173e..373748c6745e 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -53,6 +53,10 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      bool page_rdonly, bool page_exec,
 			      struct kvm_gstage_mapping *out_map);

+int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
+                                struct kvm_mmu_memory_cache *pcache,
+                                gpa_t addr, u32 target_level, bool flush);
+
 enum kvm_riscv_gstage_op {
 	GSTAGE_OP_NOP = 0,	/* Nothing */
 	GSTAGE_OP_CLEAR,	/* Clear/Unmap */
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d2001d508046..ffec3e5ddcaf 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -163,13 +163,32 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	return 0;
 }

+static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 level,
+					     gpa_t addr, pte_t *ptep, pgprot_t prot)
+{
+	pte_t new_pte;
+
+	if (pgprot_val(pte_pgprot(ptep_get(ptep))) == pgprot_val(prot))
+		return;
+
+	new_pte = pfn_pte(pte_pfn(ptep_get(ptep)), prot);
+	new_pte = pte_mkdirty(new_pte);
+
+	set_pte(ptep, new_pte);
+
+	gstage_tlb_flush(gstage, level, addr);
+}
+
 int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_mmu_memory_cache *pcache,
 			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
 			      bool page_rdonly, bool page_exec,
 			      struct kvm_gstage_mapping *out_map)
 {
+	bool found_leaf;
+	u32 ptep_level;
 	pgprot_t prot;
+	pte_t *ptep;
 	int ret;

 	out_map->addr = gpa;
@@ -203,12 +222,119 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 		else
 			prot = PAGE_WRITE;
 	}
+
+	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
+	if (found_leaf) {
+		/*
+		 * ptep_level is the current gstage mapping level of addr, out_map->level
+		 * is the required mapping level during fault handling.
+		 *
+		 * 1) ptep_level > out_map->level
+		 * This happens when dirty logging is enabled and huge pages are used.
+		 * KVM must track the pages at 4K level, and split the huge mapping
+		 * into 4K mappings.
+		 *
+		 * 2) ptep_level < out_map->level
+		 * This happens when dirty logging is disabled and huge pages are used.
+		 * The gstage is split into 4K mappings, but the out_map level is now
+		 * back to the huge page level. Ignore the out_map level this time, and
+		 * just update the pte prot here. Otherwise, we would fall back to mapping
+		 * the gstage at huge page level in `kvm_riscv_gstage_set_pte`, with the
+		 * overhead of freeing the page tables(not support now), which would slow
+		 * down the vCPUs' performance.
+		 *
+		 * It is better to recover the huge page mapping in the ioctl context when
+		 * disabling dirty logging.
+		 *
+		 * 3) ptep_level == out_map->level
+		 * We already have the ptep, just update the pte prot if the pfn not change.
+		 * There is no need to invoke `kvm_riscv_gstage_set_pte` again.
+		 */
+		if (ptep_level > out_map->level) {
+			kvm_riscv_gstage_split_huge(gstage, pcache, gpa,
+						    out_map->level, true);
+		} else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(ptep_get(ptep))), page_size) == hpa) {
+			kvm_riscv_gstage_update_pte_prot(gstage, ptep_level, gpa, ptep, prot);
+			return 0;
+		}
+	}
+
 	out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
 	out_map->pte = pte_mkdirty(out_map->pte);

 	return kvm_riscv_gstage_set_pte(gstage, pcache, out_map);
 }

+static inline unsigned long make_child_pte(unsigned long huge_pte, int index,
+					   unsigned long child_page_size)
+{
+	unsigned long child_pte = huge_pte;
+	unsigned long child_pfn_offset;
+
+	/*
+	 * The child_pte already has the base address of the huge page being
+	 * split. So we just have to OR in the offset to the page at the next
+	 * lower level for the given index.
+	 */
+	child_pfn_offset = index * (child_page_size / PAGE_SIZE);
+	child_pte |= pte_val(pfn_pte(child_pfn_offset, __pgprot(0)));
+
+	return child_pte;
+}
+
+int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
+				struct kvm_mmu_memory_cache *pcache,
+				gpa_t addr, u32 target_level, bool flush)
+{
+	u32 current_level = kvm_riscv_gstage_pgd_levels - 1;
+	pte_t *next_ptep = (pte_t *)gstage->pgd;
+	unsigned long huge_pte, child_pte;
+	unsigned long child_page_size;
+	pte_t *ptep;
+	int i, ret;
+
+	if (!pcache)
+		return -ENOMEM;
+
+	while(current_level > target_level) {
+		ptep = (pte_t *)&next_ptep[gstage_pte_index(addr, current_level)];
+
+		if (!pte_val(ptep_get(ptep)))
+			break;
+
+		if (!gstage_pte_leaf(ptep)) {
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			current_level--;
+			continue;
+		}
+
+		huge_pte = pte_val(ptep_get(ptep));
+
+		ret = gstage_level_to_page_size(current_level - 1, &child_page_size);
+		if (ret)
+			return ret;
+
+		next_ptep = kvm_mmu_memory_cache_alloc(pcache);
+		if (!next_ptep)
+			return -ENOMEM;
+
+		for (i = 0; i < PTRS_PER_PTE; i++) {
+			child_pte = make_child_pte(huge_pte, i, child_page_size);
+			set_pte((pte_t *)&next_ptep[i], __pte(child_pte));
+		}
+
+		set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
+				__pgprot(_PAGE_TABLE)));
+
+		if (flush)
+			gstage_tlb_flush(gstage, current_level, addr);
+
+		current_level--;
+	}
+
+	return 0;
+}
+
 void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
