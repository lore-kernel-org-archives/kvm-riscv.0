Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D955F436AD
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbjKVRKNaMMOzO39mO0rnGkltR2/yGwZOAPt55tb0uA=; b=aHymv19KAHxerv
	lmMMudNzMnZem+CaV4ffxmGilE+PiwU/7R+gDdWdFA5ujBQTj1una13yRVnCtY85Fy/KY9fEga06w
	wCSXz6pF6TV98LOIyk3gLJx3M8VR+AAgBCYvXpHQU4FWYkElcWJNBHLNaL5zrPSLedgSLPhslPUTI
	zel4aSTERCRMU/wbP8JLc53P18HeGIBO4T6MpjEYWzamuUfi4LtELhI/coKZk822w3rz6IIj+ev6K
	hUKGk60xIv4YGePoktbPME3YSmEfmdqIHU1Oc8BtBxuCcoZ1VG5KKHJLtu+NuWuNqVPtbdXO65SJb
	oIS/uAPSmQUgQ9fd6AJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrr-000000046tD-1Isv;
	Fri, 17 Apr 2026 14:08:23 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrl-000000046p4-1bIC;
	Fri, 17 Apr 2026 14:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776434888; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eRBiDugkSgMWef5zGsxjLEV8tSokc5DBUdZvmJMWCbw=;
	b=bi85NgeOFEBKBmEbJQyi5yZh5gHB1hv5ASTy0SB+P7DxwfISU7mltMvi3pOV3D7sQLXzNJD4X8eYQkcsG3jY6xuElCsxXoqt5v0qt5iTWdQezPkxNmfYt07CI4kQnTCFRXxLnPKLNSPXk3zdKytRH3oAoOGI9vj8+1zP4oErY3M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X1BSP9G_1776434883;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1BSP9G_1776434883 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Apr 2026 22:08:04 +0800
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
	nutty.liu@hotmail.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 1/2] iommu/riscv: Advertise Svpbmt support to generic page table
Date: Fri, 17 Apr 2026 22:07:45 +0800
Message-Id: <20260417140746.97817-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260417140746.97817-1-fangyu.yu@linux.alibaba.com>
References: <20260417140746.97817-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_070818_530028_801FC998 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

The RISC-V IOMMU can optionally support Svpbmt page-based memory types
in its page table format. When present,the generic page table code can
use this capability to encode memory attributes (e.g. MMIO vs normal
memory) in PTEs.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/riscv/iommu.c       | 2 ++
 include/linux/generic_pt/common.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index a31f50bbad35..6c324f9fdc53 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1268,6 +1268,8 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	cfg.common.features = BIT(PT_FEAT_SIGN_EXTEND) |
 			      BIT(PT_FEAT_FLUSH_RANGE) |
 			      BIT(PT_FEAT_RISCV_SVNAPOT_64K);
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SVPBMT)
+		cfg.common.features |= BIT(PT_FEAT_RISCV_SVPBMT);
 	domain->riscvpt.iommu.nid = dev_to_node(iommu->dev);
 	domain->domain.ops = &riscv_iommu_paging_domain_ops;
 
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index fc5d0b5edadc..2683e5b38998 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -188,6 +188,10 @@ enum {
 	 * Support the 64k contiguous page size following the Svnapot extension.
 	 */
 	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
+	/*
+	 * Support Svpbmt extension: encode page-based memory type (PBMT) in PTEs.
+	 */
+	PT_FEAT_RISCV_SVPBMT,
 
 };
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
