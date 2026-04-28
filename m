Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B5FF8868
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTmBeMTf9UudHOb9I8RyuRSWHeVb42+nmNTZ4+7eJq0=; b=gPXxVXKxoTHEpI
	nmjfBJQRkTcOwOmU3cew4ZWwFGYi04gHkdDpf6J/KSKBoJ2SFuKnWvMlLoUqM8Ed6hlmn8J2eX5tt
	PhxJ+i2X3sgOF7sjb//cvMjN7jCbKpbzQY3ZgoYQ0FDbv37+A6Bw3lX6ywHe9sgDd1hQ87TCN9hK4
	A2CmYDJ38PxK2/uTjVHkiPZKjusOD4axivsEqf2d0YC+sbzlT4zVXuQxEIxOisPjPFP/1Ldn2/wOa
	nqWk47BfNKmcocDKEpFBB4xceOjx12vqNqUBgmvOU5IngRFyuXGmWRilDKWcxtyEXjp2Oq22O/yIb
	Lc3QRmdZ9qRI6njhkMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGn-00000001V3k-3gRK;
	Tue, 28 Apr 2026 13:14:33 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGj-00000001Uyc-3wGc;
	Tue, 28 Apr 2026 13:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777382065; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Qsv/5zq52oNQKyoYl2cE2fHq6XjpzP4W+zUJu/N+63k=;
	b=ZfS8a9z3NVCZNAyt8G5hcKma8DzaFJdle7Q0tFKRq/YsW6CnhcQPxILrS0pi+Oi+oTysQqfqOff6+P16h6y3zNHibMm9PwIb4sUmY6rWzfwGni93Nsiw3c/yJkoqrkgJ1cULnB+TMfmnvT2Gh4TI/cxDKs6AZc9DYa7yIMlfakk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1ubIFt_1777382062;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1ubIFt_1777382062 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 21:14:23 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tjeznach@rivosinc.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	vasant.hegde@amd.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	skhawaja@google.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 06/11] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain
Date: Tue, 28 Apr 2026 21:13:54 +0800
Message-Id: <20260428131359.34872-7-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061430_144760_D8D14EBF 
X-CRM114-Status: GOOD (  12.63  )
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

Replace .domain_alloc_paging with .domain_alloc_paging_flags so callers
can pass allocation flags to select the appropriate page-table type.

When IOMMU_HWPT_ALLOC_NEST_PARENT or IOMMU_HWPT_ALLOC_DIRTY_TRACKING is
set in @flags, allocate a second-stage (iohgatp) domain.

When @flags is 0 the behaviour is identical to the previous
domain_alloc_paging: first-stage (iosatp) domain.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 66 ++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 5dadf6d09139..0c13430ecc7f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1255,23 +1255,50 @@ static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
 	.flush_iotlb_all = riscv_iommu_iotlb_flush_all,
 };
 
-static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
+static struct iommu_domain *riscv_iommu_domain_alloc_paging_flags(
+		struct device *dev, u32 flags,
+		const struct iommu_user_data *user_data)
 {
+	const bool second_stage = flags &
+		(IOMMU_HWPT_ALLOC_NEST_PARENT | IOMMU_HWPT_ALLOC_DIRTY_TRACKING);
 	struct pt_iommu_riscv_64_cfg cfg = {};
 	struct riscv_iommu_domain *domain;
 	struct riscv_iommu_device *iommu;
 	int ret;
 
+	if (user_data)
+		return ERR_PTR(-EOPNOTSUPP);
+
 	iommu = dev_to_iommu(dev);
-	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
-		cfg.common.hw_max_vasz_lg2 = 57;
-	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
-		cfg.common.hw_max_vasz_lg2 = 48;
-	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
-		cfg.common.hw_max_vasz_lg2 = 39;
+
+	if (second_stage) {
+		/*
+		 * Second-stage (iohgatp) page table for KVM VFIO device
+		 * pass-through and dirty tracking. The GPA space is 2 bits
+		 * wider than the corresponding first-stage VA space (x4 root
+		 * page table), so hw_max_vasz_lg2 values are 41/50/59.
+		 */
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4) {
+			cfg.common.hw_max_vasz_lg2 = 59;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4) {
+			cfg.common.hw_max_vasz_lg2 = 50;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4) {
+			cfg.common.hw_max_vasz_lg2 = 41;
+		} else {
+			dev_err(dev, "cannot find supported second-stage page table mode\n");
+			return ERR_PTR(-ENODEV);
+		}
 	} else {
-		dev_err(dev, "cannot find supported page table mode\n");
-		return ERR_PTR(-ENODEV);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
+			cfg.common.hw_max_vasz_lg2 = 57;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
+			cfg.common.hw_max_vasz_lg2 = 48;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
+			cfg.common.hw_max_vasz_lg2 = 39;
+		} else {
+			dev_err(dev, "cannot find supported page table mode\n");
+			return ERR_PTR(-ENODEV);
+		}
 	}
 	cfg.common.hw_max_oasz_lg2 = 56;
 
@@ -1291,11 +1318,20 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	domain->riscvpt.iommu.nid = dev_to_node(iommu->dev);
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
-	domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
-					RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
-	if (domain->pscid < 0) {
-		riscv_iommu_free_paging_domain(&domain->domain);
-		return ERR_PTR(-ENOMEM);
+	if (second_stage) {
+		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
+						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
+		if (domain->gscid < 0) {
+			riscv_iommu_free_paging_domain(&domain->domain);
+			return ERR_PTR(-ENOMEM);
+		}
+	} else {
+		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
+						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
+		if (domain->pscid < 0) {
+			riscv_iommu_free_paging_domain(&domain->domain);
+			return ERR_PTR(-ENOMEM);
+		}
 	}
 
 	ret = pt_iommu_riscv_64_init(&domain->riscvpt, &cfg, GFP_KERNEL);
@@ -1439,7 +1475,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-	.domain_alloc_paging = riscv_iommu_alloc_paging_domain,
+	.domain_alloc_paging_flags = riscv_iommu_domain_alloc_paging_flags,
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
