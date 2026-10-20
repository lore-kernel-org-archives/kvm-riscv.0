Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3ED60A2630
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2L2BJ6Hb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Zz2Dw9yS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erkIin/gFrjf2ATUxyOjpUPHL9gbR1LpCmcSFF6hDf8=; b=2L2BJ6Hblxdeh6
	iKQhyEOYAJ4J4cQo9rt0wxZDwhfOvq1gmUlxWwmKI7fUbESEFWNoeeqNEXe/ucyhlABP3Jo7SOEoq
	mpzdednASfr87bzDKAO3rosED/yQELWGK5ALZQ/ga/3U19x8UIxRJTNAxalYtLMPTk2gsUvlm8X5I
	PWauY+Uf/YAqcHFyv/ygkGHsOEm+6hZbZNacHx0UOuQ4cGnHcFW2uQz1nqUAIkjNvtvD50Gzuk+Il
	7V+nDq0D6PFpk9apbKCJPVUYJe/GbPasl7OWDSzzFAWsTbKiZZvXZ1vxAtlh+Oz4CNIe/n0rbXjAx
	G+odPlpGlUKzIbPklK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Lu-00000009LRI-2W0j;
	Tue, 20 Oct 2026 09:41:50 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Lm-00000009LKN-45Gt;
	Tue, 20 Oct 2026 09:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792489301; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9s0bIlJ2piSguoXe1yWtoTyK6ceFUCEG2mwvMKkau2U=;
	b=Zz2Dw9ySvp2V44hyUhJ2Esrn0VYLeJbeghzcFx/ARJQmzUmFH5nQBefqQ5VESBZpLnpck+oLaJgHqC8EIJTc5c5LAs3ys+kOZpkuMi5KMHu1eTX6Oc3nGtN8tXWmYpOzvnc8/etrjPmrEUvB45sVdnuTsFowlBdBi1mvlMp46tY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDCspcv_1792489296;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDCspcv_1792489296 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 17:41:39 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v5 07/10] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain
Date: Tue, 20 Oct 2026 17:41:03 +0800
Message-Id: <20261020094106.92722-8-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024143_186705_A4B1D54C 
X-CRM114-Status: GOOD (  14.53  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Replace .domain_alloc_paging with .domain_alloc_paging_flags so callers
can pass allocation flags to select the appropriate page-table type.

When IOMMU_HWPT_ALLOC_NEST_PARENT or IOMMU_HWPT_ALLOC_DIRTY_TRACKING is
set in @flags, allocate a second-stage (iohgatp) domain.

When @flags is 0 the behaviour is identical to the previous
domain_alloc_paging: first-stage (iosatp) domain.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 94 +++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c31fb4c52205..debce1b4201c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1380,25 +1380,21 @@ static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
 	.flush_iotlb_all = riscv_iommu_iotlb_flush_all,
 };
 
-static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
+static struct iommu_domain *
+riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
+				      const struct iommu_user_data *user_data)
 {
 	struct pt_iommu_riscv_64_cfg cfg = {};
 	struct riscv_iommu_domain *domain;
 	struct riscv_iommu_device *iommu;
 	int ret;
+	const u32 supported_flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
+				    IOMMU_HWPT_ALLOC_NEST_PARENT;
 
-	iommu = dev_to_iommu(dev);
-	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
-		cfg.common.hw_max_vasz_lg2 = 57;
-	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
-		cfg.common.hw_max_vasz_lg2 = 48;
-	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
-		cfg.common.hw_max_vasz_lg2 = 39;
-	} else {
-		dev_err(dev, "cannot find supported page table mode\n");
-		return ERR_PTR(-ENODEV);
-	}
-	cfg.common.hw_max_oasz_lg2 = 56;
+	if (flags & ~supported_flags)
+		return ERR_PTR(-EOPNOTSUPP);
+	if (user_data)
+		return ERR_PTR(-EOPNOTSUPP);
 
 	domain = kzalloc_obj(*domain);
 	if (!domain)
@@ -1406,12 +1402,13 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
+	iommu = dev_to_iommu(dev);
+	cfg.common.hw_max_oasz_lg2 = 56;
 	/*
 	 * 6.4 IOMMU capabilities [..] IOMMU implementations must support the
 	 * Svnapot standard extension for NAPOT Translation Contiguity.
 	 */
-	cfg.common.features = BIT(PT_FEAT_SIGN_EXTEND) |
-			      BIT(PT_FEAT_FLUSH_RANGE) |
+	cfg.common.features = BIT(PT_FEAT_FLUSH_RANGE) |
 			      BIT(PT_FEAT_RISCV_SVNAPOT_64K) |
 			      BIT(PT_FEAT_DETAILED_GATHER);
 	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SVPBMT)
@@ -1419,19 +1416,66 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	domain->riscvpt.iommu.nid = dev_to_node(iommu->dev);
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
-	domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
-					RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
-	if (domain->pscid < 0) {
-		riscv_iommu_free_paging_domain(&domain->domain);
-		return ERR_PTR(-ENOMEM);
+	switch (flags) {
+	case 0:
+		cfg.common.features |= BIT(PT_FEAT_SIGN_EXTEND);
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
+			cfg.common.hw_max_vasz_lg2 = 57;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
+			cfg.common.hw_max_vasz_lg2 = 48;
+		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
+			cfg.common.hw_max_vasz_lg2 = 39;
+		} else {
+			ret = -ENODEV;
+			goto err_free;
+		}
+		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
+						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
+		if (domain->pscid < 0) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+		break;
+	case IOMMU_HWPT_ALLOC_NEST_PARENT:
+	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING:
+	case IOMMU_HWPT_ALLOC_DIRTY_TRACKING | IOMMU_HWPT_ALLOC_NEST_PARENT:
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
+			ret = -ENODEV;
+			goto err_free;
+		}
+		domain->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
+						RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
+		if (domain->gscid < 0) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+		cfg.common.features |= BIT(PT_FEAT_RISCV_S2);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto err_free;
 	}
 
 	ret = pt_iommu_riscv_64_init(&domain->riscvpt, &cfg, GFP_KERNEL);
-	if (ret) {
-		riscv_iommu_free_paging_domain(&domain->domain);
-		return ERR_PTR(ret);
-	}
+	if (ret)
+		goto err_free;
 	return &domain->domain;
+
+err_free:
+	riscv_iommu_free_paging_domain(&domain->domain);
+	return ERR_PTR(ret);
 }
 
 static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
@@ -1566,7 +1610,7 @@ static const struct iommu_ops riscv_iommu_ops = {
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
