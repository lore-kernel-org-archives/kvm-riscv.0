Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B443CC5CFC1
	for <kvm-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kpapRCTvjSrjI8Uj+XhW6JNuWh4XYnF9Bk5BrVhaMc=; b=Gt+xkDZZYyYx6b
	gkbR+SlU9Fed/0h7tfFQA5fJdn2RMg4eVM6A358gmpEkSmNWlFWOL9tV7sXRS1XYjE6jkMYhJLzbn
	48PsQ/13YmTLXo2aIaHFTX3Ju8zvGkNKr6jSkqOxl2ksrKmpyoFZCXR3folurecCwknHh6M1+8h+B
	NoitBes73EAcFEjjhwfqavQw86y5w8kzNCNNjkkixoNCtHiIS2wtp0ikRpbG0BGYQQnH7AT1VF7co
	7U6k8r2r66A/Xu6xmPzG+8ASWXqJH637/unXoxPdImmz0R4E2wai2m9svvJwvbnKD7Qo/EkRUVCn9
	8UzyKsvc5XK1oltVTijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBft-00000003kAv-1ikJ;
	Sat, 15 Aug 2026 10:31:37 +0000
Received: from out-194.mta0.migadu.com ([2001:41d0:1004:224b::c2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBfq-00000003kAV-2ZcO
	for kvm-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:31:35 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yH/agCXDCZtwBki0zGE0wtxh6FsJiZ2Vyl/5PTnHoLo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786789892; v=1; x=1787394692;
 b=bmPAWIyUEvqCdZe9lURu/v+Y6PCJl223KdRPJ4HbjN68UsfZXWfSts67mMZa4Pa2B/pGI4gh
 CA3iAQwp5iV/cwgP74LiUFC2Aj16FGPLQ31xybKjZCI014OIk+3Q6RuZpIQEk2AQwLV7GMYZeFm
 ajHPmcHjgW0ROGemr2tug8hc=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 2aea94ff0226619a;
	Sat, 15 Aug 2026 10:31:32 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH v4 RESEND 1/5] KVM: riscv: Avoid overwriting G-stage tables with huge leaves
Date: Sat, 15 Aug 2026 06:31:23 -0400
Message-ID: <20260815103123.864738-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815102833.864330-1-jinyu.tang@linux.dev>
References: <20260815102833.864330-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_033134_791336_E8742D0C 
X-CRM114-Status: GOOD (  12.29  )
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

RISC-V KVM can overwrite an existing G-stage table entry when
installing a huge leaf mapping. If the target huge range already has a
lower-level page table, kvm_riscv_gstage_set_pte() can replace the
non-leaf entry with a leaf PTE and disconnect the lower-level page
table.

Reject replacing a valid table entry with a leaf PTE. If huge-page
installation hits such a conflict, fall back to a 4K mapping for the
original faulting GPA in the MMU fault path, where the original GPA and
HFN are still available.

Suggested-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/gstage.c |  6 ++++++
 arch/riscv/kvm/mmu.c    | 24 +++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..54d45addf18f 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -174,6 +174,12 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 
 	if (pte_val(*ptep) != pte_val(map->pte)) {
 		bool was_invalid = !pte_val(*ptep);
+
+		/* Avoid replacing an existing lower-level table with a leaf mapping. */
+		if (!gstage_pte_leaf(ptep) && !was_invalid &&
+		    gstage_pte_leaf(&map->pte))
+			return -EEXIST;
+
 		set_pte(ptep, map->pte);
 		if (gstage_pte_leaf(ptep) &&
 		    !(was_invalid && riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)))
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6035b5ec9503..bfd6168ebe30 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -625,10 +625,11 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		      struct kvm_gstage_mapping *out_map)
 {
 	int ret;
-	kvm_pfn_t hfn;
+	kvm_pfn_t fault_hfn, hfn;
 	bool is_hugetlb;
 	bool writable;
 	unsigned int vma_pageshift;
+	gpa_t fault_gpa = gpa;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
@@ -709,6 +710,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	}
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
+	fault_hfn = hfn + ((fault_gpa >> PAGE_SHIFT) - gfn);
 
 	/*
 	 * If logging is active then we allow writable pages only
@@ -734,9 +736,29 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
 						vma_pagesize, false, true, out_map);
+		if (ret == -EEXIST) {
+			/*
+			 * Retry at 4K granularity for the original faulting GPA
+			 * when a huge leaf cannot replace an existing table.
+			 */
+			ret = kvm_riscv_gstage_map_page(&gstage, pcache, fault_gpa,
+							fault_hfn << PAGE_SHIFT,
+							PAGE_SIZE, false, true,
+							out_map);
+		}
 	} else {
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
 						vma_pagesize, true, true, out_map);
+		if (ret == -EEXIST) {
+			/*
+			 * Retry at 4K granularity for the original faulting GPA
+			 * when a huge leaf cannot replace an existing table.
+			 */
+			ret = kvm_riscv_gstage_map_page(&gstage, pcache, fault_gpa,
+							fault_hfn << PAGE_SHIFT,
+							PAGE_SIZE, true, true,
+							out_map);
+		}
 	}
 
 	if (ret)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
