Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E073CCD1AA
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+LGy8VK7Q4+ej8q94avffb3glgm29fjaRqWNrAYPjl4=; b=Pip6sZuUMh984D
	yByPVO4jWdDjXmg2KbHt8BXHuJ23TYDBbRBAZa3MtIeWFwZx70BMaSfJKRG23hhbJL0CR8dbKPkaG
	W2Ukn6omWjs+j3mqv0CJiJAG5pxcsp4//ere6knKpMIIFhUaUkvlEqLyerGFl5Imp9qHU59eh/aeu
	79aw/XfnD8xZhIN1FlzxObZ7YMXp2IioGNs4dLlvfNwozOBCAnonPPkMfRv5C2AbeRCvmVidn08g6
	onUOFhd+CnGkSNLB/LAJJHc2UZlRNbPREf+ZIHxTVc6bxUoO2rABpmVzo/XBDDHXYArl2gDRViBBr
	A5aZUssLQRgD/ymZShoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDFH-0000000HIo9-3guG;
	Tue, 21 Oct 2025 14:21:51 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDFF-0000000HIkt-26b3;
	Tue, 21 Oct 2025 14:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761056503; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=bcvGo8vZx1GTax8WxbQQMp+Ghln0kxNOs/BCW6mwRY4=;
	b=vWeaxktoPKrjjG7yOSis9Lv1ymySi32RHXnvJlyZAFW4uSFIbev5x8TWxYXNcsgjqd6k5dB3oQ0jEGeETAw4eEbf4Pk3sPLJVFbm1jesiRY/oIC5r0MagvwwiFFkh82SW/9lgdDF9OL8DejCWZHevLjqf+OFoPbyUUkMEtC3F2U=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WqjBICH_1761056493 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 21 Oct 2025 22:21:35 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	jiangyifei@huawei.com
Cc: guoren@kernel.org,
	dbarboza@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
Date: Tue, 21 Oct 2025 22:21:31 +0800
Message-Id: <20251021142131.78796-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_072149_694786_0BE5A9B9 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
regions. Using vma->vm_pgoff to derive the HPA here may therefore
produce incorrect mappings.

Instead, I/O mappings for such regions can be established on-demand
during g-stage page faults, making the upfront ioremap in this path
is unnecessary.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

---
Changes in v2:
- Fixed build warnings.
---
 arch/riscv/kvm/mmu.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 525fb5a330c0..58f5f3536ffd 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -171,7 +171,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				enum kvm_mr_change change)
 {
 	hva_t hva, reg_end, size;
-	gpa_t base_gpa;
 	bool writable;
 	int ret = 0;
 
@@ -190,15 +189,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	hva = new->userspace_addr;
 	size = new->npages << PAGE_SHIFT;
 	reg_end = hva + size;
-	base_gpa = new->base_gfn << PAGE_SHIFT;
 	writable = !(new->flags & KVM_MEM_READONLY);
 
 	mmap_read_lock(current->mm);
 
 	/*
 	 * A memory region could potentially cover multiple VMAs, and
-	 * any holes between them, so iterate over all of them to find
-	 * out if we can map any of them right now.
+	 * any holes between them, so iterate over all of them.
 	 *
 	 *     +--------------------------------------------+
 	 * +---------------+----------------+   +----------------+
@@ -209,7 +206,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	 */
 	do {
 		struct vm_area_struct *vma;
-		hva_t vm_start, vm_end;
+		hva_t vm_end;
 
 		vma = find_vma_intersection(current->mm, hva, reg_end);
 		if (!vma)
@@ -225,36 +222,18 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		}
 
 		/* Take the intersection of this VMA with the memory region */
-		vm_start = max(hva, vma->vm_start);
 		vm_end = min(reg_end, vma->vm_end);
 
 		if (vma->vm_flags & VM_PFNMAP) {
-			gpa_t gpa = base_gpa + (vm_start - hva);
-			phys_addr_t pa;
-
-			pa = (phys_addr_t)vma->vm_pgoff << PAGE_SHIFT;
-			pa += vm_start - vma->vm_start;
-
 			/* IO region dirty page logging not allowed */
 			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 				ret = -EINVAL;
 				goto out;
 			}
-
-			ret = kvm_riscv_mmu_ioremap(kvm, gpa, pa, vm_end - vm_start,
-						    writable, false);
-			if (ret)
-				break;
 		}
 		hva = vm_end;
 	} while (hva < reg_end);
 
-	if (change == KVM_MR_FLAGS_ONLY)
-		goto out;
-
-	if (ret)
-		kvm_riscv_mmu_iounmap(kvm, base_gpa, size);
-
 out:
 	mmap_read_unlock(current->mm);
 	return ret;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
