Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F07CA6007
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5RQgMioWOhA0s08Nt3hdQFeOMakc6Pal1Yf5x+Aoyw=; b=U6g14HDNO1fi54
	1VJiBU9Qto09Pm8OMhthZpUuy79ZpADLS53KzV11HuUmgdC+LbCELUp/jSlbn3vOvKbdZX1vALiWd
	S78/0CsTYUoBloeS5naKqLY1B/qQ14bKzNPzVdywFZrblwwCqdQ9QmxIy3VdN8kjfsZHUBy+YVz9W
	SoxoJ7hwUimmHvaKAzo96aPrPbqm/Q4HPjhJFaCM+ZOtXfn2nJF7gF/0XWQUhGAhG2hteEM1tJivN
	ZoxtZvO9ML1utuRDwtUNOTiOsQsk30Qhmz/JcVrxUg2BuvPoabVoWPLbLSpEUk4QpH1ol+3oVsUPB
	bLj781zJIgXUrHjqKReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofg-00000004Uw7-3PRV;
	Thu, 08 Oct 2026 14:00:32 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEofc-00000004UuK-167m;
	Thu, 08 Oct 2026 14:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791468024; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FBuc6cEA3FSukWGLiG7pSKsJM1xn0XaUlxaBeMxT7xM=;
	b=E9DbqZePubd15kiyoibpupwl1JHanuhxa7e+NMmEo0BSlQHN1fRgq21eukhM6BzkCW3dLtQViaECmD/AjZh2B203+bYPDZ9ymmRuqmiuNU4c7tiTw8nwS57CgSdqxH55bYf/SCOM4RfEdWnpV4drlJy9QAhvaY1Pi8LgLKt9PyY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCQTvmE_1791468022;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCQTvmE_1791468022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 22:00:23 +0800
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
Subject: [RFC PATCH 2/3] iommu/riscv: Extract IRQ forwarding payload validation
Date: Thu,  8 Oct 2026 22:00:00 +0800
Message-Id: <20261008140001.94508-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
References: <20261008140001.94508-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_070028_564323_12F94DA9 
X-CRM114-Status: UNSURE (   7.89  )
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

Move the owner and MSI address mask/pattern checks from
riscv_iommu_ir_activate() into a separate helper so a second forwarding
backend can validate the same fields. No functional change.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-ir.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index b3f0a56475ed..b96baff9986d 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -104,15 +104,10 @@ static void riscv_iommu_ir_set_target(struct riscv_iommu_msipte *msipte,
 	}
 }
 
-static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
-				   struct riscv_iommu_device *iommu,
-				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+static int riscv_iommu_ir_validate_vcpu_info(const struct riscv_iommu_ir_vcpu_info *vcpu_info)
 {
 	u64 pattern = vcpu_info->msi_addr_pattern;
 	u64 mask = vcpu_info->msi_addr_mask;
-	u64 required_caps = 0;
-	size_t nr_ptes;
-	int ret;
 
 	if (!vcpu_info->owner || (pattern & mask) ||
 	    ((pattern | mask) & ~RISCV_IOMMU_DC_MSI_ADDR_MASK))
@@ -129,6 +124,21 @@ static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
 			return -EINVAL;
 	}
 
+	return 0;
+}
+
+static int riscv_iommu_ir_activate(struct riscv_iommu_msi_table *msi_table,
+				   struct riscv_iommu_device *iommu,
+				   struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	u64 required_caps = 0;
+	size_t nr_ptes;
+	int ret;
+
+	ret = riscv_iommu_ir_validate_vcpu_info(vcpu_info);
+	if (ret)
+		return ret;
+
 	nr_ptes = riscv_iommu_ir_nr_ptes(vcpu_info);
 
 	ret = riscv_iommu_ir_validate_targets(vcpu_info, nr_ptes, &required_caps);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
