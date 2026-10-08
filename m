Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBE0CA600D
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvVYt1/qiKgicoRdd/ez0nAdwGmJHt/+XPFJxLUB5Jg=; b=Xnly+Rp4QQVFcL
	wXVvcZ26nU9HHQX/qBe4FdouEBtxMokncdHqmQq7Ct9kupDzkKvG53zm5ZNMH+xpOIz+REXse8ckN
	51DT4aO7slCISni1kpbgaLY7KM47OoWOgqQXJ0zDaDlpwG+Jv4ogoBAstPLJbAg8zdnC46b4wVyQQ
	+c33JhGpL4a4UiEBv0yBKtDScwxe1paHKAYmj0+2Z31diH3YR+a8LmZw/3diDFU+W0H19SFKMHcxn
	8JSnv6NtMlTr4dB8n34ckst0IN2fHrCORrp3QzScXoWz/BOPHER89LfTH0lGe3nXKPClnHQ/fcLFZ
	EvwutSKWYIgtJQVI32FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofj-00000004Uxp-1Vo8;
	Thu, 08 Oct 2026 14:00:35 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofb-00000004UuH-3BcM;
	Thu, 08 Oct 2026 14:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791468023; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ZdsybsZg4gWBHS9NoCP952HDoUG/uyGaTz5zYAijfYM=;
	b=Xvx1tic4v9CqoIOByaiK+c3+B1h44FeHOpfoQ6UqSe3JE0Z1/2wppTot6andVq87WlQFSrvb+ilkSnztdb7dygJdhZQkuvXTxWd50+aKDTQfVh7TrFb4LedOyS9CLe8VAu+VIqMu9WCb5B5e4QAWFyViXa0sjOImfXdW+lwo8oY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCQTvlx_1791468021;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCQTvlx_1791468021 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 22:00:22 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	jgg@nvidia.com,
	jgg@ziepe.ca
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Thu,  8 Oct 2026 21:59:59 +0800
Message-Id: <20261008140001.94508-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
References: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_070028_562932_AD0C39A8 
X-CRM114-Status: GOOD (  15.92  )
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

IOMMU implementations without the MSI_FLAT capability translate MSI
writes through the second-stage page table, so IRQ forwarding on them
will need guest IMSIC pages mapped into the second-stage domain.

Add an xarray to the MSI table that tracks the HPA installed for each
mapped guest IMSIC GPA, and two helpers for use with the MSI table lock
held: riscv_iommu_msi_table_map_gpa() installs the initial 4 KiB
mapping, and riscv_iommu_msi_table_replace_gpa_leaf() atomically swaps
the leaf PTE's PFN when a vCPU's VS-file host page moves, rejecting
leaves that do not map the expected old HPA.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 94 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h | 12 +++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e2e77469ea3c..48fc57d6409c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -24,6 +24,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/pgtable.h>
 #include <linux/generic_pt/iommu.h>
 
 #include "../dma-iommu.h"
@@ -1217,6 +1218,92 @@ void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
 	riscv_iommu_iotlb_inval(domain, &gather);
 }
 
+int riscv_iommu_msi_table_map_gpa(struct riscv_iommu_msi_table *msi_table,
+				  dma_addr_t gpa, phys_addr_t hpa)
+{
+	struct riscv_iommu_domain *domain =
+		container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	const int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
+
+	/* Guest IMSIC GPA mapping only exists in second-stage translations. */
+	if (!domain->gscid)
+		return -EOPNOTSUPP;
+
+	return iommu_map(&domain->domain, gpa, hpa, IMSIC_MMIO_PAGE_SZ, prot,
+			 GFP_ATOMIC);
+}
+
+int riscv_iommu_msi_table_replace_gpa_leaf(struct riscv_iommu_msi_table *msi_table,
+					   dma_addr_t gpa, phys_addr_t old_hpa,
+					   phys_addr_t new_hpa)
+{
+	struct riscv_iommu_domain *domain =
+		container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	struct pt_iommu_riscv_64_hw_info pt_info;
+	u64 *root, *table, *ptep;
+	u64 old, new;
+	int top_level, level;
+
+	if (!IS_ALIGNED(gpa | old_hpa | new_hpa, PAGE_SIZE))
+		return -EINVAL;
+	if (!domain->gscid)
+		return -EOPNOTSUPP;
+
+	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
+	switch (pt_info.iohgatp_mode) {
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+		top_level = 2;
+		break;
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+		top_level = 3;
+		break;
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+		top_level = 4;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	root = phys_to_virt(pt_info.ppn << PAGE_SHIFT);
+	for (;;) {
+		table = root;
+		for (level = top_level; level >= 0; level--) {
+			unsigned int shift = PAGE_SHIFT + level * 9;
+			unsigned int index = gpa >> shift;
+
+			if (level == top_level)
+				index &= GENMASK(10, 0);
+			else
+				index &= GENMASK(8, 0);
+			ptep = &table[index];
+			old = READ_ONCE(*ptep);
+
+			if (level) {
+				/* A valid non-leaf PTE has R/W/X clear. */
+				if ((old & (_PAGE_PRESENT | _PAGE_LEAF)) !=
+				    _PAGE_PRESENT)
+					return -EADDRINUSE;
+				table = phys_to_virt(FIELD_GET(_PAGE_PFN_MASK,
+							       old) << PAGE_SHIFT);
+				continue;
+			}
+
+			/* Replace only the L0 leaf previously installed for this GPA. */
+			if (!(old & _PAGE_PRESENT) || !(old & _PAGE_LEAF) ||
+			    FIELD_GET(_PAGE_PFN_MASK, old) !=
+			    old_hpa >> PAGE_SHIFT)
+				return -EADDRINUSE;
+
+			new = (old & ~_PAGE_PFN_MASK) |
+			      FIELD_PREP(_PAGE_PFN_MASK,
+					 new_hpa >> PAGE_SHIFT);
+			if (cmpxchg64(ptep, old, new) == old)
+				return 0;
+			break;
+		}
+	}
+}
+
 #define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
@@ -1425,6 +1512,8 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_noflat_imsic *imsic;
+	unsigned long index;
 
 	WARN_ON(!list_empty(&domain->bonds));
 
@@ -1435,6 +1524,10 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	if (domain->gscid > 0)
 		ida_free(&riscv_iommu_gscids, domain->gscid);
 
+	xa_for_each(&domain->msi_table.noflat_imsics, index, imsic)
+		kfree(imsic);
+	xa_destroy(&domain->msi_table.noflat_imsics);
+
 	pt_iommu_deinit(&domain->riscvpt.iommu);
 	iommu_free_pages(domain->msi_table.root);
 	kfree(domain);
@@ -1676,6 +1769,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	raw_spin_lock_init(&domain->lock);
 	raw_spin_lock_init(&domain->msi_table.lock);
+	xa_init(&domain->msi_table.noflat_imsics);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 9852962e245b..53a368fbbdf2 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -18,6 +18,7 @@
 #include <linux/irqdomain.h>
 #include <linux/rcupdate.h>
 #include <linux/sizes.h>
+#include <linux/xarray.h>
 
 #include "iommu-bits.h"
 
@@ -74,6 +75,11 @@ struct riscv_iommu_device {
 	struct irq_domain *irqdomain;
 };
 
+/* Tracks a guest IMSIC GPA mapped into an S2 domain on IOMMUs without MSI_FLAT. */
+struct riscv_iommu_noflat_imsic {
+	phys_addr_t hpa;
+};
+
 struct riscv_iommu_msi_table {
 	/* Protects attachment, interrupt forwarding state, and MSI PTE updates. */
 	raw_spinlock_t lock;
@@ -84,6 +90,7 @@ struct riscv_iommu_msi_table {
 	u64 msi_addr_pattern;
 	const void *owner;
 	u64 required_caps; /* RISCV_IOMMU_CAPABILITIES_* required by active MSI PTEs */
+	struct xarray noflat_imsics;
 };
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
@@ -109,6 +116,11 @@ bool riscv_iommu_msi_table_check_caps(struct riscv_iommu_msi_table *msi_table, u
 void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
+int riscv_iommu_msi_table_map_gpa(struct riscv_iommu_msi_table *msi_table,
+				  dma_addr_t gpa, phys_addr_t hpa);
+int riscv_iommu_msi_table_replace_gpa_leaf(struct riscv_iommu_msi_table *msi_table,
+					   dma_addr_t gpa, phys_addr_t old_hpa,
+					   phys_addr_t new_hpa);
 
 #ifdef CONFIG_RISCV_IMSIC
 void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_device *iommu);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
