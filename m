Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D6DCD3442
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 May 2026 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Znx4rCsaN+5vB9VQDTFya79YXhK6Vt6F8Qu3F6YZvFI=; b=0M+ilktAFUybNz
	ZoTCU4MiqyKozNiRMtCl2dHKaXLDgNrGVR/FAbPVRg8+JSj7iIQBRqG5ax5oPs64tseBqRsU+jHUI
	8GpRK2HjjPoxEKGyQAhdkzjcZspc8NMzvavKmHJqb6F5YZDZqHrkCAEvIle/ziKlBbNI5Za1p3Zet
	GU3ahMoybt5mgfj0hKzynQgZc8yelwO63f4pjX+Fc82roc8s4oogy4REtQRK5Ygvrpm6m6CCeOWCy
	EGmulVCuULoP+Xr2b0On+Aqexk54KJ9Uf7ysmLSNpPkeqj8QEYY6BK1FG50JX/QUFgEVCHJL68DIq
	QLon7+SQswxArKV9SPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2z-00000003ewZ-2n0B;
	Thu, 07 May 2026 11:37:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2y-00000003eu1-0XLp;
	Thu, 07 May 2026 11:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QiHxRCda9Kr0q0RbsXLFQPtUw1DfSKYL9S+IOeDr3fU=; b=KxofHbvfxLK5ZKuXJx+NvFGiu0
	62S5QcCwbFiBgAd0jOkO+iZvj0wAePKMQn7ZoY4Hxqx/BZzr6q6LsA/3pwkIxuAOlURySqvvLfjjX
	NpzUGh1H/qQ0QmYw8tUCE+ygCj5lGBIevekcnmlJwMrR3g6PnpUFyZ2764XrEKTIRj6V7LxBPzmoE
	1Jo8cnZqYIzMne6mCgqvQmy1nkg3rfFj/kA5MHRQ8V7+bF/Wr9oIBurGlkcYHj5a/3JKQhqK97PZ2
	enWyxhJfCAj3hKLL8nIPX+xCjnnmZkB2I8abZJo/d0WuuVVbA49xN9dUR2aAB3MR4s+Y11aG2oJmY
	m6p9awlg==;
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2t-00000003Myr-1Gl4;
	Thu, 07 May 2026 11:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778153842; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=QiHxRCda9Kr0q0RbsXLFQPtUw1DfSKYL9S+IOeDr3fU=;
	b=ihcPbUFMt34FmREyD993f6c8tDbOAsHqM9MJrGoc5hRHUOrfivvLvQcOEbU8iE+210udDva2McbYpsCU+MMsaDyp43Khrx/ia4M0tmQRJjWCk2m3nMA6Hp9Dl0H9IBgNHIxipAsLfqUoSxs9i5+NdrJdcJsXI7bO1uypq5vhr10=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R451e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X2UVF0L_1778153837;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2UVF0L_1778153837 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 May 2026 19:37:18 +0800
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
Subject: [RFC PATCH v2 05/10] iommu/riscv: support GSCID and GVMA invalidation command
Date: Thu,  7 May 2026 19:37:01 +0800
Message-Id: <20260507113706.11400-6-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_123736_025713_F573C874 
X-CRM114-Status: GOOD (  13.32  )
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
 drivers/iommu/riscv/iommu-bits.h |  7 +++++++
 drivers/iommu/riscv/iommu.c      | 32 ++++++++++++++++++++++++++------
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 29a0040b1c32..7c440926fa23 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -716,6 +716,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 	cmd->dword1 = 0;
 }
 
+static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
+{
+	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
+		      FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
+	cmd->dword1 = 0;
+}
+
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 5b8e0072cd1a..e883ace2f4f1 100644
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
 
@@ -967,15 +972,20 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 
 		/*
 		 * IOTLB invalidation request can be safely omitted if already sent
-		 * to the IOMMU for the same PSCID, and with domain->bonds list
+		 * to the IOMMU for the same PSCID/GSCID, and with domain->bonds list
 		 * arranged based on the device's IOMMU, it's sufficient to check
 		 * last device the invalidation was sent to.
 		 */
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_cmd_inval_vma(&cmd);
-		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		if (domain->gscid) {
+			riscv_iommu_cmd_inval_gvma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd, domain->gscid);
+		} else {
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		}
 		if (end - start < RISCV_IOMMU_IOTLB_INVAL_LIMIT - 1) {
 			unsigned long iova = start;
 
@@ -1120,6 +1130,7 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1175,8 +1186,10 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
-	if ((int)domain->pscid > 0)
+	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
+	if (domain->gscid > 0)
+		ida_free(&riscv_iommu_gscids, domain->gscid);
 
 	pt_iommu_deinit(&domain->riscvpt.iommu);
 	kfree(domain);
@@ -1212,8 +1225,15 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
 		return -ENODEV;
 
-	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
-	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
+	if (domain->gscid) {
+		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
+			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
+			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
+	} else {
+		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
+		      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
+	}
+
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
