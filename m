Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765E7CD3442
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 May 2026 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VD/b+en39tGOC7vZDlzAKM3nYzkPC/Y0xzZ9r+uqQQ=; b=JzqXqfgGM78vp8
	uCXA4C/6RnY6cytVMt6hjpzmAWSa7ktOl0y0qSd/d3OFz8TRE5UI/dY0zBZpQULb3MnUp+gLP+0+r
	euGkEtR/0oshGmbCN8Jb+5792SUmBkc5KgB0uJTgwNJib7DD15viyeMagElxQQ7QdLR7+kFQCLINi
	qoYGCDDWFmMZVjcsIp1icpeCFBcpvyHxHPRqsIqGDnAWGtrtEpO6RVusLB7t5j2g6y45CZPdteGoV
	ic48XdJAe437Q6IJsx3igiGeoUkxB5NNF3OygsGb6q+iE5JAx/B0CONwJjWmAWoDgzHKvlTTYR1TE
	21LtvB4oVsSEzE9QoRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2m-00000003efY-3Ykb;
	Thu, 07 May 2026 11:37:28 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2h-00000003ebc-2Qaj;
	Thu, 07 May 2026 11:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778153840; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F51Id+NmnokdCAoFLH+RndXo5++Xd5bwtOM8r+G9Jts=;
	b=G91RIY6cRtQbr/+1CcNVpJBxExrhtYAOsOml6uO64rOTGg5AmhM6lUTh+FvXjoSitHE2S0BxcxQZw0l1ejue0Mfz2g6oJ0KEUFggvakBkbmio2FXv8ZRFJcAQbZw8U9Jlinc+nVP8HKsHBQBTkiOw+szhRKL8ZSY3MUBL9Eo/V4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X2UVF.m_1778153836;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2UVF.m_1778153836 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 May 2026 19:37:17 +0800
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
	andrew.jones@oss.qualcomm.com,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH v2 04/10] iommu/riscv: use data structure instead of individual values
Date: Thu,  7 May 2026 19:37:00 +0800
Message-Id: <20260507113706.11400-5-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_043724_109945_2F047B36 
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

From: Zong Li <zong.li@sifive.com>

The parameter will be increased when we need to set up more
bit fields in the device context. Use a data structure to
wrap them up.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bd36e3b5d13f..5b8e0072cd1a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1077,7 +1077,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
  * interim translation faults.
  */
 static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, u64 fsc, u64 ta)
+				     struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
@@ -1116,10 +1116,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		tc = READ_ONCE(dc->tc);
-		tc |= ta & RISCV_IOMMU_DC_TC_V;
+		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
 
-		WRITE_ONCE(dc->fsc, fsc);
-		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->fsc, new_dc->fsc);
+		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1205,22 +1205,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct pt_iommu_riscv_64_hw_info pt_info;
-	u64 fsc, ta;
+	struct riscv_iommu_dc dc = {0};
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
 	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
 		return -ENODEV;
 
-	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
+	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
 	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
-	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
+	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
 
-	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 
@@ -1292,9 +1292,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
@@ -1314,8 +1317,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct riscv_iommu_dc dc = {0};
+
+	dc.fsc = RISCV_IOMMU_FSC_BARE;
+	dc.ta = RISCV_IOMMU_PC_TA_V;
 
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
+	riscv_iommu_iodir_update(iommu, dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
