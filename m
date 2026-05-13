Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B882ECD37B6
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1dSBxjbXUflovUQCa83kqk1exIT98fA1rMbdB25Cg8=; b=zdKaZtrD8M9Ob6
	HmTTzgzS+UzpFGo/O0kFjLgcOeKIcc8a5K9CXUtrlapnJ6F+HaKU94B9pc3B2ohss812wktt4A+55
	giRrvHwKgO1JguYulCindfHRA1VcBYNde8qAuVQkFdYGSkHMT4sP/5/l8JfDDtzVdZuiMSjLwNrL8
	Ur5lt56gCadSFlYmcBS58LXMkvUxSg1kwlLGJ0Q0epTto1D996DwQim64+5zXA9NCTTybm1nTPsZ+
	07XAiiCn2DozYBTQUUp56JaqJcZO+Wqe8Kph7fltH5qqeo1uBlHBKaU0g4vu7wu+xtrTpKCdIRUqT
	+i5AssuVpnU/m73a4LjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Lx-00000001dyT-23fO;
	Wed, 13 May 2026 07:50:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Lw-00000001dwl-1NeH;
	Wed, 13 May 2026 07:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rn52hAxb+SO6eBf1Gqgkp9Rd8rVLgeMlI/rMNiVCVxc=; b=OjPdSzwn0ZACo7T6c+nXhNtheo
	ww8171ypboPPqlG+ViZnkbjey0DKvtBl37c3wYeadEw2Vwu8jursJZOkPIP3P1UrCSDUYvUrYIH70
	sTB3+zbRMgDoOdOdAKCnA47ATHsLc9kwvPYtLPpXDLEAYv3pxUB4UEHMeDb7RujLDiP9oOcoNmf0h
	839AtBAe2x/QjzQbk1eZxAHopTbhXZHHOMo9V1vV30nIx0wxy/BH6yC+V2XUue8VBV7ymhzQ6c/lO
	7bJX95PbpBXPslyGUuvG9wzuqFp4wGZAQL0EnKMqSlSv9vubmJJxuiyyyU9AZiGzQVtanFFf/8TNU
	86hanIlA==;
Received: from mxct.zte.com.cn ([58.251.27.85])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Ls-0000000BEYb-0xVs;
	Wed, 13 May 2026 07:49:58 +0000
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gFlmP6NB4zW8L;
	Wed, 13 May 2026 15:42:29 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4gFlln0dBqz54hSd;
	Wed, 13 May 2026 15:41:57 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFllL0ctXz8Xs6v;
	Wed, 13 May 2026 15:41:34 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 64D7fMim055036;
	Wed, 13 May 2026 15:41:22 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 13 May 2026 15:41:25 +0800 (CST)
X-Zmail-TransId: 2b036a042b2582b-ace00
X-Mailer: Zmail v1.0
Message-ID: <20260513154125023xfKNqfea7TklqO9_RRrkt@zte.com.cn>
In-Reply-To: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn>
References: 20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn
Date: Wed, 13 May 2026 15:41:25 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDIvNF0gUklTQy1WOiBLVk06IFNwbGl0IGh1Z2UgcGFnZXMgd2hlbiBkaXJ0eSBsb2dnaW5nIGlzwqBlbmFibGVk?=
X-MAIL: mse-fl1.zte.com.cn 64D7fMim055036
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.35.20.165 unknown Wed, 13 May 2026 15:42:30 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A042B64.000/4gFlmP6NB4zW8L
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_084957_285981_C09FBA46 
X-CRM114-Status: GOOD (  10.00  )
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

Split huge pages eagerly when enabling dirty logging. The goal is to
avoid doing it while faulting on write-protected pages, which
negatively impacts guest performance.

The benefits of eager page splitting are the same as in x86 and arm64,
added with commit a3fe5dbda0a4 ("KVM: x86/mmu: Split huge pages mapped
by the TDP MMU when dirty logging is enabled") and commit e7bf7a490c68
("KVM: arm64: Split huge pages when dirty logging is enabled")

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/mmu.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 85a3fb2622a4..14c558ee5f15 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -90,6 +90,50 @@ void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 	spin_unlock(&kvm->mmu_lock);
 }

+static bool need_topup_split_caches_or_resched(struct kvm_mmu_memory_cache *cache,
+					       int count)
+{
+	if (need_resched())
+		return true;
+
+	return kvm_mmu_memory_cache_nr_free_objects(cache) < count;
+}
+
+/* the caller must held mmu lock */
+static void kvm_riscv_split_huge_pages(struct kvm_gstage *gstage,
+				       phys_addr_t start, phys_addr_t end,
+				       bool flush)
+{
+	struct kvm *kvm = gstage->kvm;
+	struct kvm_mmu_memory_cache *pcache = &kvm->arch.split_page_cache;
+	int count = gstage->pgd_levels;
+	phys_addr_t addr = start;
+	int ret;
+
+	while (addr < end) {
+		if (need_topup_split_caches_or_resched(pcache, count)) {
+			spin_unlock(&kvm->mmu_lock);
+			cond_resched();
+
+			ret = kvm_mmu_topup_memory_cache(pcache, count);
+			if (ret) {
+				kvm_err("Failed to toup split page cache\n");
+				spin_lock(&kvm->mmu_lock);
+				return;
+			}
+			spin_lock(&kvm->mmu_lock);
+		}
+
+		ret = kvm_riscv_gstage_split_huge(gstage, pcache, addr, 0, flush);
+		if (ret != 0) {
+			kvm_err("split huge page for addr(0x%llx) failed %d\n", addr, ret);
+			break;
+		}
+
+		addr += PMD_SIZE;
+	}
+}
+
 void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 					     struct kvm_memory_slot *slot,
 					     gfn_t gfn_offset,
@@ -136,6 +180,23 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	spin_unlock(&kvm->mmu_lock);
 }

+static void kvm_riscv_split_memory_region(struct kvm *kvm, int slot)
+{
+	struct kvm_memslots *slots = kvm_memslots(kvm);
+	struct kvm_memory_slot *memslot = id_to_memslot(slots, slot);
+	phys_addr_t start = memslot->base_gfn << PAGE_SHIFT;
+	phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
+	struct kvm_gstage gstage;
+
+	kvm_riscv_gstage_init(&gstage, kvm);
+
+	spin_lock(&kvm->mmu_lock);
+	kvm_riscv_split_huge_pages(&gstage, start, end, false);
+	spin_unlock(&kvm->mmu_lock);
+
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
+}
+
 void kvm_arch_commit_memory_region(struct kvm *kvm,
 				struct kvm_memory_slot *old,
 				const struct kvm_memory_slot *new,
@@ -150,6 +211,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
 		mmu_wp_memory_region(kvm, new->id);
+		kvm_riscv_split_memory_region(kvm, new->id);
 	}
 }

-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
