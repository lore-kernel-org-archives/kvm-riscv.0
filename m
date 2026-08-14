Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872F8C5B572
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9AzoG57PG9FTJeE+ten9LyIfru4v203wfcPpfiztYAA=; b=wVim/G9o9a0QrN
	0zsd6OSFF3UDd4v9+CTT99iP0oC5i7XimDAZt8jAQqKz8BMxN+BMhe4iQC/qim15WkjNku5itafPq
	0QMHPf5zh3PJT1VC+5vA9mg74nH4G6+5d6lRnII+LrVGParpm/+RT2zqRoMwT9ztuZa/+9AMLLa7d
	PrRz/M2QafBWC+0TajNbYNqUWbLztJupfThWX8XWDl7skuTiDjolGwJxN4gyZ1lS0CIFMJkbkyi5G
	OIe8CqEJlEuFTDIRhmAC7G2ZbzF+iAm4gNz7lYR0LE1s9VEwIYb1UYtbIIiCuUJvZxfgoDqX8a8Qh
	6onepY0wrD5ZXN2jz1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupc7-00000002YVA-0n4j;
	Fri, 14 Aug 2026 10:58:15 +0000
Received: from out-231.mta1.migadu.com ([2001:41d0:203:375::e7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupc2-00000002YUS-1MJo
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 10:58:13 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BN80hJUPahMuBoWkUclOUZnV69Dkfc+SFkZgjZJXao0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786705085; v=1; x=1787309885;
 b=ifNmiy6Q3Bv6W8Sy3llrNgWtYfS9IFotfXylgutWgBBeRPB28+JBYoLw24rRURDc1ed+o/d3
 1IuTtfBmD5ruma5YmlrMte9Pv/+ERChHQLbKbCVrUtMXs8plPkOOudz+HP2NPBNAOeOwwpp2z+0
 zzeIaslwLzG7NU4gkJkqlZVY=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 50b76cf9531200b1;
	Fri, 14 Aug 2026 10:58:05 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] KVM: riscv: Avoid overwriting existing G-stage tables with huge leaves
Date: Fri, 14 Aug 2026 06:57:52 -0400
Message-ID: <20260814105752.565325-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_035810_533221_B00E9644 
X-CRM114-Status: GOOD (  10.91  )
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

RISC-V KVM can overwrite an existing G-stage table entry when installing
a huge leaf mapping. If the target huge range already has a lower-level
page table, kvm_riscv_gstage_set_pte() can replace the non-leaf entry
with a leaf PTE. This disconnects the lower-level page table and can
change guest-visible mappings or leak the page-table page.

Reject replacing a valid non-leaf PTE with a leaf PTE. If huge-page
installation hits such a conflict, fall back to a 4K mapping for the
faulting GPA and leave the existing page-table structure intact.

Suggested-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/gstage.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..23cb35e36073 100644
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
@@ -211,12 +217,13 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 			      struct kvm_gstage_mapping *out_map)
 {
 	bool found_leaf;
+	phys_addr_t huge_page_offset;
 	u32 ptep_level;
 	pgprot_t prot;
 	pte_t *ptep;
 	int ret;
 
-	out_map->addr = gpa;
+	out_map->addr = gpa & PAGE_MASK;
 	out_map->level = 0;
 
 	ret = gstage_page_size_to_level(gstage, page_size, &out_map->level);
@@ -287,7 +294,18 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 	out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
 	out_map->pte = pte_mkdirty(out_map->pte);
 
-	return kvm_riscv_gstage_set_pte(gstage, pcache, out_map);
+	ret = kvm_riscv_gstage_set_pte(gstage, pcache, out_map);
+	if (ret == -EEXIST) {
+		huge_page_offset = out_map->addr & (page_size - 1);
+		hpa += huge_page_offset;
+		out_map->level = 0;
+		out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
+		out_map->pte = pte_mkdirty(out_map->pte);
+
+		ret = kvm_riscv_gstage_set_pte(gstage, pcache, out_map);
+	}
+
+	return ret;
 }
 
 static inline unsigned long make_child_pte(unsigned long huge_pte, int index,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
