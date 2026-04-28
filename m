Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA38FF886D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txeYxQPZHPvX+nSzFdRIU6eolWGf8A8JjAszKx22ze8=; b=XG+Qz0QrvR4moF
	dZ08Vq6aXpZWVUDnhvO0cyNm1tWgqEEzc4tr9uxt1YxX2uuziM/DGUU0ZVPAkGVatkRlGnGhqis1F
	uA9320eqxCgKB1LcKdaxZnjupHFI8DKmhq3KVCwhhmHoWoZS1XgoMN/Q7iO7Cy3rHC7tmZZq1/L5l
	vIWWivjDEkkqXfABaZvrjqk2ytUOFnsreWc9umG5O9x2MIlZWVOt4KhSskQOjLKt5bV1HJxUh5BI4
	pspWbZP+hBX6Ca3sYG/1C3mzFEOk/h99UlRggiuuKsn2ZwUhxRwdNgaO5ZVkCtrkzeqRf1YMGb7EQ
	TayC5b22n1QY4YJfko6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGt-00000001VAW-1mGs;
	Tue, 28 Apr 2026 13:14:39 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGo-00000001V3A-2QuB;
	Tue, 28 Apr 2026 13:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777382072; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wDviUyznucLdHZjKk0KKSvorH0J1X46CC4BtnY6yTUA=;
	b=WZA/DBBixqgFm2LEsELE+O04ozNxRXmWrrra05ecv84KtS+ggUBzHH2oS4hW5zyvIP2Wr2M3/SwKGeOqsmm7+vXrdIRe9L5FEp7V2BHezyWJWvDLtR4M0X7ewVYL8/WbJ+XwZYRjQd5fdzaous+7z2On/TwIoFvDXdAj3gtPX84=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1ubIGy_1777382066;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1ubIGy_1777382066 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 21:14:27 +0800
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
Subject: [RFC PATCH 08/11] iommu/riscv: Add dirty tracking support for second-stage domains
Date: Tue, 28 Apr 2026 21:13:56 +0800
Message-Id: <20260428131359.34872-9-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061434_968039_7795DEE5 
X-CRM114-Status: GOOD (  15.14  )
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

Add hardware dirty tracking support for second-stage (iohgatp) domains
used in KVM VFIO device pass-through.

The RISC-V IOMMU can automatically set the dirty bit in PTEs on write
access when DC.tc.GADE is set and the hardware has AMO_HWAD capability.
Wire this up to the iommufd dirty tracking interface:

  - riscv_iommu_set_dirty_tracking(): Walks all bonds of the domain and
    sets or clears DC.tc.GADE in each device context entry.

  - riscv_iommu_dirty_ops: Exposes set_dirty_tracking and the generic
    page-table read_and_clear_dirty via IOMMU_PT_DIRTY_OPS(riscv_64).

  - domain_alloc_paging_flags: Assigns dirty_ops to second-stage domains
    when AMO_HWAD is advertised in hardware capabilities.

  - riscv_iommu_capable: Reports IOMMU_CAP_DIRTY_TRACKING when
    AMO_HWAD is present.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 84 +++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0c13430ecc7f..1f7967074492 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1247,6 +1247,84 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	return 0;
 }
 
+/*
+ * Enable or disable hardware A/D bit updates (GADE) in the device context for
+ * all devices attached to a second-stage domain. When dirty tracking is
+ * enabled the IOMMU hardware will set the dirty bit in PTEs on write access,
+ * making them visible to read_and_clear_dirty().
+ */
+static int riscv_iommu_set_dirty_tracking(struct iommu_domain *iommu_domain,
+					  bool enable)
+{
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_dc *dc;
+	struct iommu_fwspec *fwspec;
+	struct riscv_iommu_command cmd;
+	u64 tc;
+	int i;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		fwspec = dev_iommu_fwspec_get(bond->dev);
+
+		for (i = 0; i < fwspec->num_ids; i++) {
+			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+			tc = READ_ONCE(dc->tc);
+			if (!(tc & RISCV_IOMMU_DC_TC_V))
+				continue;
+
+			if (enable)
+				tc |= RISCV_IOMMU_DC_TC_GADE;
+			else
+				tc &= ~RISCV_IOMMU_DC_TC_GADE;
+			WRITE_ONCE(dc->tc, tc);
+
+			/* Invalidate cached device context entry */
+			riscv_iommu_cmd_iodir_inval_ddt(&cmd);
+			riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
+			riscv_iommu_cmd_send(iommu, &cmd);
+			riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
+		}
+	}
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+
+	/*
+	 * Reflect the active dirty-tracking state in the page table feature
+	 * flags.  When active, riscvpt_iommu_set_prot() will leave D=0 in
+	 * new mappings so that the hardware can set it on the first write,
+	 * providing accurate per-page dirty information.  When inactive,
+	 * new mappings get D=1 to avoid write faults on a D=0 PTE.
+	 */
+	if (enable)
+		domain->riscvpt.riscv_64pt.common.features |=
+			BIT(PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE);
+	else
+		domain->riscvpt.riscv_64pt.common.features &=
+			~BIT(PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE);
+
+	return 0;
+}
+
+static const struct iommu_dirty_ops riscv_iommu_dirty_ops = {
+	IOMMU_PT_DIRTY_OPS(riscv_64),
+	.set_dirty_tracking = riscv_iommu_set_dirty_tracking,
+};
+
 static const struct iommu_domain_ops riscv_iommu_paging_domain_ops = {
 	IOMMU_PT_DOMAIN_OPS(riscv_64),
 	.attach_dev = riscv_iommu_attach_paging_domain,
@@ -1325,6 +1403,8 @@ static struct iommu_domain *riscv_iommu_domain_alloc_paging_flags(
 			riscv_iommu_free_paging_domain(&domain->domain);
 			return ERR_PTR(-ENOMEM);
 		}
+		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+			domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
 	} else {
 		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
 						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
@@ -1401,10 +1481,14 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 
 static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
 {
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
 	switch (cap) {
 	case IOMMU_CAP_CACHE_COHERENCY:
 	case IOMMU_CAP_DEFERRED_FLUSH:
 		return true;
+	case IOMMU_CAP_DIRTY_TRACKING:
+		return !!(iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD);
 	default:
 		return false;
 	}
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
