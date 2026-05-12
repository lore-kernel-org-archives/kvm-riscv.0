Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A316CD4F26
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmPGGnOATqvyQk2TiP7ehPgmFmV2ldrtyOi9I+qjl2I=; b=sqXlLG4AUmY1qm
	EEtVAdQ7VXsP1J6jjYkBsscCDXiISlfIl5nVJ5sTx6/ihjVC136k7sgaZ9FwNbwjelH88POqcMWlM
	ViSUM2+4CezHVvTcGI/kWTGSCdhjR+r+mfTZ7NARGBvYLn4tycKZ9btMG0m828nm2vyGlP8LbNxpC
	V/BYnp7TVJcTyJbeo4YvtYPai/5d9cUUJ5Wek8hY/kc7aDBpRjfycCMyNSjaSM9yhPXYkCWzAoFuV
	9YxHVMYPtNbt2lm+rls9AVrgdfCq6rOOpoOYxb3lHJCDEhCildaIIi9dZWoX8rIK8BSFvt91X+Zm8
	/MfTGdEgYIfRqIm1n7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhki-0000000FxkN-43mx;
	Tue, 12 May 2026 07:42:04 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhkf-0000000FxiJ-3k3h;
	Tue, 12 May 2026 07:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778571716; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=i04ZuxIi3jt4m8VWianwNO2YFQpZ5BInIfUiKWtaoro=;
	b=opfCsCYITa20PfnCeeFY4R40+pjN8lEYQ90TEDK5CTD/T5uTi0/NaB9L2io10X9N8Wi/LKJNBybANI9OR1If/7yFLHrliCHsVRXLu4xSZR6daOiplNZfoeQFdFYdPRHqhfASPJzggzqDU6t+zvD6jXnC1Yfk8WeHMzeOtfO7w7A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X2puQMt_1778571712;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2puQMt_1778571712 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 15:41:53 +0800
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
	jgg@nvidia.com,
	nutty.liu@hotmail.com
Cc: guoren@kernel.org,
	andrew.jones@oss.qualcomm.com,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v4 1/2] iommu/riscv: Advertise Svpbmt support to generic page table
Date: Tue, 12 May 2026 15:41:41 +0800
Message-Id: <20260512074142.16356-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
References: <20260512074142.16356-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004202_405681_61B9EC38 
X-CRM114-Status: UNSURE (   8.53  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
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
