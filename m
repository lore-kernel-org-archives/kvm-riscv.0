Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8581EC88E53
	for <kvm-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 03:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBD0mxiDn14w6Kn/P6iQZOc9oxDF5avrkxlFQDTUjBU=; b=df9KqYkz53bvLc
	k7Vpf4vXHff16YzGyQVMEO//IJfcOyhCmSKGw28JgdA+jgjKqGR9sC8MuXMKmAQlLvyRmg0OhZorM
	R6aPcUKqTjX/af4A9j0MvDFC2LQnQloy16AB3bunp0r8+7XeOpdnwDzqvMukE/FGb6VWA29YXESPG
	nvwmnjiv/qHIMOceZXSwt9IcfwparILFTIZfM5rbttGsDXRhNBEZN7CgL4loOpewWr1lgfYxAXCwN
	JcVFrmxZOLUaV5xT5uBczJ3prTrfruYfcUQhg5mO0A2BNSITtVgsYsgwR8C2oRPusuNZ0I2RQs4OO
	2Aeb/P4cgO8W+n7LFH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jqh-000000057RI-43Ud;
	Tue, 15 Sep 2026 03:28:47 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jqf-000000057ML-3WEA;
	Tue, 15 Sep 2026 03:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789442924; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=iJuM/I3QzzZ29IqRau9ZBf+7q6zMX3YoOle6ur78Bj0=;
	b=vcyA5fzDffMje1pUhZT/do+XPpr7So1dKAo8OmPthPnXWxfh+rdJjX7LYV/x78hthpNa8soG0QM9az8JH2Fz1I+ilkVYxJy47u+WcEkwO/m6qitGL8Stz8YdxLIJFc0Kk5gSq9Th8nAUSOYNzvgZ7h/ewhGS9PhMl82AnViXHFk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XB.uvQP_1789442921;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XB.uvQP_1789442921 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 11:28:42 +0800
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
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v4 05/10] iommu/riscv: support GSCID and GVMA invalidation command
Date: Tue, 15 Sep 2026 11:28:24 +0800
Message-Id: <20260915032828.11250-6-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
References: <20260915032828.11250-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_202846_036124_953A299B 
X-CRM114-Status: GOOD (  14.57  )
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

This patch adds a ID Allocator for GSCID and a wrap for setting up
GSCID in IOTLB invalidation command.

Set up iohgatp to enable second stage table and flush stage-2 table if
the GSCID is set.

The GSCID of domain should be freed when release domain. GSCID will be
allocated for parent domain in nested IOMMU process.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-bits.h |  7 ++++
 drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index f2ef9bd3cde9..65d1f2250011 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 	cmd->dword1 = 0;
 }
 
+static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
+{
+	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
+		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
+	cmd->dword1 = 0;
+}
+
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c5b6214ee672..99f05f1db35b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -48,6 +48,10 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+/* IOMMU GSCID allocation namespace. */
+static DEFINE_IDA(riscv_iommu_gscids);
+#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -819,6 +823,7 @@ struct riscv_iommu_domain {
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
 	int pscid;
+	int gscid;
 };
 PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
@@ -981,7 +986,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
 }
 
 static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
-					  int pscid,
+					  int pscid, int gscid,
 					  struct riscv_iommu_tlbi *tlbi)
 {
 	bool use_nl = tlbi->non_leaf &&
@@ -989,8 +994,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 	struct riscv_iommu_command cmd;
 	unsigned int i;
 
-	riscv_iommu_cmd_inval_vma(&cmd);
-	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
+	if (gscid) {
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
+	} else {
+		riscv_iommu_cmd_inval_vma(&cmd);
+		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
+	}
 
 	/*
 	 * If non-leaf entries were changed and the IOMMU doesn't
@@ -1074,7 +1084,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
+		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, domain->gscid, &tlbi);
 		prev = iommu;
 	}
 
@@ -1208,6 +1218,7 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1258,16 +1269,19 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
-	if ((int)domain->pscid > 0)
+	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
+	if (domain->gscid > 0)
+		ida_free(&riscv_iommu_gscids, domain->gscid);
 
 	pt_iommu_deinit(&domain->riscvpt.iommu);
 	kfree(domain);
 }
 
-static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_mode)
+static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu,
+				      int mode)
 {
-	switch (pgd_mode) {
+	switch (mode) {
 	case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
 		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39;
 
@@ -1280,6 +1294,22 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 	return false;
 }
 
+static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
+					  int mode)
+{
+	switch (mode) {
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4;
+	}
+	return false;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1292,11 +1322,21 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
-	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
-		return -ENODEV;
+	if (domain->gscid) {
+		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
+			return -ENODEV;
+
+		dc.iohgatp =
+			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
+			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
+			FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
+	} else {
+		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
+			return -ENODEV;
 
-	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
-	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
+		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
+			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
+	}
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
