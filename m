Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DF7CC6B1A
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5RQgMioWOhA0s08Nt3hdQFeOMakc6Pal1Yf5x+Aoyw=; b=B2WB2chnHPfT1Z
	Ymzv0sY/gUOKIh54yw26j1ZuOvZF/xgjAQH8YX5Cp4Cb/rgUirpwAmDAd5yfmNZ6Gn40H12m6DI9o
	/7tCOc7RXV/3LRBg4OaWXWtyOBh9MGv/UlAPk3WIWM9uiSjaNG+1i0RsBfRIoOZ9KZE1idwqyzFqf
	/ANMmjnJ+QnPigodNpnuvzB9xjxNFGoVHskCXoZcioME5IGar/IL/6rZzciIT7qiHUVIWVSqrd7AP
	Ub8ufzDPr5A607EJGfoYuggis3DX+M5q/wAt7ix1C1REmgeZ8EeRwURbLxa/Gi3mw4dqnxOrK3n8Q
	j/WFgcR5Bbb29YGYZk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi5-0000000FgiV-3XJ1;
	Wed, 14 Oct 2026 14:12:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi5-0000000Fghg-0McL;
	Wed, 14 Oct 2026 14:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FBuc6cEA3FSukWGLiG7pSKsJM1xn0XaUlxaBeMxT7xM=; b=aSDrPUR+8ymKpNneZgWoY3XzNT
	uQvaTd0BM+igvCkhzdqy3OJ1ngs0BjuraYlClkph9od0KIxhwnG7HiZmjKSbd1NF+jPZOl28bGRM1
	dJ8AXlSyDlx/yEaCrCo+mmn1Ry3GTvX/k/MBsdeTclqfXmnbEF2K8M7qfSvc0P4GK0AQc/9E+s9Bb
	EFDguYomRxFSSQO78K9yBKsMtwdY33hZPh+hVfP68zgj+6c5U30XNNjvtd2XuOC3Rz+fHvxw9uG4p
	RaTAHYhVbT/ygctbZ9kEm/ASrbE8xyG9LWbbvXCpll5CfDFA4tvvFBApDDxmRdxj390nf4UNVCeMy
	pDdCu0Qw==;
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzhz-0000000GriH-3NKo;
	Wed, 14 Oct 2026 14:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987098; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FBuc6cEA3FSukWGLiG7pSKsJM1xn0XaUlxaBeMxT7xM=;
	b=unBlJneq3li3zTCJIT7x5Oc8Jc89lNCoQkhbHUtS1IDpGUhZJqTbG2e8MEECaxS/dLONTaeAt6c1d2cVF7kBT1eRTEOiYEOsFN8xQCpFWXCHdCKaGg0K7Xd8nqqY6oGaSg8ESHMsJi0Jv6VLOdi3V30AhlpKjg7QUExxxrGqC78=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp41.L_1791987096;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp41.L_1791987096 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:37 +0800
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
Subject: [RFC PATCH v2 2/4] iommu/riscv: Extract IRQ forwarding payload validation
Date: Wed, 14 Oct 2026 22:11:22 +0800
Message-Id: <20261014141124.48569-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
References: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_151157_594609_E49E73D7 
X-CRM114-Status: UNSURE (   9.10  )
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
