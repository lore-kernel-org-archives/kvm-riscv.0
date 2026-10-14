Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4C1CC6B2C
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+4KtIHrO1Oone0T+uopJ4j4H+OHwg7D6AAAT5yADpc=; b=d4KXXlOT+4gXJe
	Oq66OSCUckcvFIIyJc5uRy84BDpNROAWGt361b96EktsWi/yaco+NZT+EtQyT2Mztsdj2mq4MQWGQ
	AsA8OA/ZOzfbfy4pZmqXZTGqbs57F4VybwsKkOgcXyoeXW5r9b8PX4CiNW+X/Uf2+0BqJJCGd9jGb
	munEEWsXDNfHQYipDeD/33oOPEIqzPoCflx5UlZWUrsHpYb9+g/5jbNCA16tBtzDPjSSDEHfAbSdq
	DgDQ5WBLuIVDJ52Pe71BrmjTk+MLDwibexf1XUlTU+rUuwXkAEunqd3MlQzkuT1GvDuFmohU4Mx9S
	BlpP42bYyL6uIlXfqPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi9-0000000FglP-1gYb;
	Wed, 14 Oct 2026 14:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi6-0000000FgjE-3aR1;
	Wed, 14 Oct 2026 14:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WMi+Mbcr4YFWc7b54ioO0gfFc35PTsSr6VOsGv6IvoY=; b=FMWTGTVAhiuY/ypeJu11ikBQT2
	s4g/ksu20PNLiHjjd9IKP01FnBUzBd/nL6fvCzXb06ndzEK0cUVQ7z1nrkD8XLapxymORJBzJm2LJ
	iMSA1hTjXzbNJEndQ1PwmPHN9VgVuvt4rdPD1kMNSI4hcoX4HuSAEUO6Ooyf+PQLmoYXgz80Pz4/9
	Irv+WasINjtMhr4e0m8WQSkKBPl1X3X8dMuRWeCUqSdzSg4S8OB1nKVAReXQnGE9IYlwZw//8vjjy
	hbir+hZDsyMK+05r0SXnm78eVaUQ2uIUPaoBC0hMuZ3UyAkroHw+IaHjM1zRHEsh6WOqcKgio/7b6
	IJ5eerkQ==;
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzhz-0000000GriK-3Lg0;
	Wed, 14 Oct 2026 14:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987100; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=WMi+Mbcr4YFWc7b54ioO0gfFc35PTsSr6VOsGv6IvoY=;
	b=kBtzXzrxeAj0RiRrHMMckIQ9zciiY+TLEG2p9iK3dXqLiF4mOAxu6z5wZktagJEGmcbtlY6yWT019n9yFlr3C542PsZmMKEfnPvmGOnpYZdmTprfqLIP+G92iRqdJe3v4HF1dNb/Dae9x3wtT4+njuuQEjSxWWzBTrNkt77lEbo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp410D_1791987098;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp410D_1791987098 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:39 +0800
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
	jgg@ziepe.ca,
	gsh517025@gmail.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Wed, 14 Oct 2026 22:11:23 +0800
Message-Id: <20261014141124.48569-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
References: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_151157_585936_1CDD7A11 
X-CRM114-Status: GOOD (  14.50  )
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
mapping, and riscv_iommu_msi_table_replace_gpa() repoints the leaf PTE
when a vCPU's VS-file host page moves, using the generic page table
replace_leaf op instead of walking the table in the driver.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h | 12 +++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e2e77469ea3c..88e131ce96c1 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1217,6 +1217,42 @@ void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
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
+int riscv_iommu_msi_table_replace_gpa(struct riscv_iommu_msi_table *msi_table,
+				      dma_addr_t gpa, phys_addr_t old_hpa,
+				      phys_addr_t new_hpa)
+{
+	struct riscv_iommu_domain *domain =
+		container_of(msi_table, struct riscv_iommu_domain, msi_table);
+	int ret;
+
+	/* Guest IMSIC GPA mapping only exists in second-stage translations. */
+	if (!domain->gscid)
+		return -EOPNOTSUPP;
+
+	ret = pt_iommu_riscv_64_replace_leaf(&domain->domain, gpa, old_hpa,
+					     new_hpa);
+	if (ret == -EAGAIN) {
+		/* The leaf changed concurrently; the caller revalidates. */
+		return -EADDRINUSE;
+	}
+	return ret;
+}
+
 #define RISCV_IOMMU_FSC_BARE 0
 /*
  * This function sends IOTINVAL commands as required by the RISC-V
@@ -1425,6 +1461,8 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_noflat_imsic *imsic;
+	unsigned long index;
 
 	WARN_ON(!list_empty(&domain->bonds));
 
@@ -1435,6 +1473,10 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	if (domain->gscid > 0)
 		ida_free(&riscv_iommu_gscids, domain->gscid);
 
+	xa_for_each(&domain->msi_table.noflat_imsics, index, imsic)
+		kfree(imsic);
+	xa_destroy(&domain->msi_table.noflat_imsics);
+
 	pt_iommu_deinit(&domain->riscvpt.iommu);
 	iommu_free_pages(domain->msi_table.root);
 	kfree(domain);
@@ -1676,6 +1718,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	raw_spin_lock_init(&domain->lock);
 	raw_spin_lock_init(&domain->msi_table.lock);
+	xa_init(&domain->msi_table.noflat_imsics);
 	mutex_init(&domain->mutex);
 	iommu = dev_to_iommu(dev);
 	cfg.common.hw_max_oasz_lg2 = 56;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 9852962e245b..8d5f44de2688 100644
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
+int riscv_iommu_msi_table_replace_gpa(struct riscv_iommu_msi_table *msi_table,
+				      dma_addr_t gpa, phys_addr_t old_hpa,
+				      phys_addr_t new_hpa);
 
 #ifdef CONFIG_RISCV_IMSIC
 void riscv_iommu_ir_irq_domain_remove(struct riscv_iommu_device *iommu);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
