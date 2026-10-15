Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9E1CC6B3A
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KigpH3+eyOfKYR5uhdyfYbO3OZc6F2q/hYa2Nn4BrV8=; b=rCzuk/GVxYy55H
	28WM8s9Qg4wFDKA74zJj/pApWm8C5MVkW5jv9K1jabPGXpqH/cJ1EK+wGr0s8i4GYAC1qmvUt6eJr
	57bI4NVLToCPufQ807wUwJT4VIYZsjsqRw3y1l2vxqctyyUWFC7NtZ2EDkhxurMA2Qbxyw/dgzXNZ
	fofT7GTYYTNTN/fs9l12zpLFIe4ss4E/rt0ws+x19Xkn5xK9z3FjGsAq6sf55Cz9AjwrI6H9R0ulK
	We75Se160WVXsWvU7tfLKrPAUjEJO+ubS4LkCHkznYyjbYBpBDfjbWWTGHIC6BolUSvvX+Q+vs8sT
	NIKhsy1dyTvrnRn5AaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKp-0000000Gy8y-3pwN;
	Thu, 15 Oct 2026 06:53:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKl-0000000Gy54-3CPX;
	Thu, 15 Oct 2026 06:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kmZyoG4EH/4f7Z8UxCBISAjq0efxYPUIeqF+lfWJDQk=; b=Gps5AXjQJ7OnpLa3ien2S7Pflr
	K7UbnX08IiOt/fU+UpsjVZNBETCYGGdb64FXrGlfLSS4Nx5CmcrLO8Nl7KCp9oT6XI1Zju2mvAIkq
	KncgKslXpLzPQjEFuEnuiUcpZWJ1yDiXDGPsjvd40IC1BeUPb/1Nzl7rUVzrVoLVVAD5f9PlbBPYf
	BMbh9mq4zdA1KUBkMf/LaIK4R/XrPYnnyU1ASzTC63rX98gywuNlMpm8p0QzIiuuMDLCZIZNGqTRm
	j0LiDVN46Uxa8qiSHFMcMSpXs51elO+niPw7CucX3OoJ0mCJDes4DuzhDknOxCla40Cj18XVkwRyC
	fublxuIw==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFKg-0000000HXxc-34HP;
	Thu, 15 Oct 2026 06:52:58 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4j4zKV156Wz5B14q;
	Thu, 15 Oct 2026 14:52:46 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 69F6qduG019086;
	Thu, 15 Oct 2026 14:52:39 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 15 Oct 2026 14:52:41 +0800
X-Zmail-TransId: 3e816ad07838024-55505
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH 04/12] iommu/riscv: Add vIOMMU object support
Date: Thu, 15 Oct 2026 14:52:24 +0800
Message-ID: <20261015065232.604503-5-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69F6qduG019086
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 15 Oct 2026 14:52:46 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD0783E.000/4j4zKV156Wz5B14q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075255_505379_57B904B0 
X-CRM114-Status: GOOD (  14.82  )
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

From: Wu Fei <wu.fei9@sanechips.com.cn>

Implement the vIOMMU ops so user space can allocate a RISC-V IOMMU
vIOMMU on a stage-2 parent domain and query the size to allocate for
it. The object keeps the parent domain and the GSCID the parent was
allocated, which the nested domain and cache invalidation support added
on top of it will need.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 60 +++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index dd97c2731d95..bf02cd984d86 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,6 +19,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
+#include <linux/iommufd.h>
 #include <linux/iopoll.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
@@ -862,6 +863,7 @@ struct riscv_iommu_domain {
 	struct mutex mutex;		/* serialize domain state updates */
 	int pscid;
 	int gscid;
+	bool nest_parent;
 	struct riscv_iommu_msi_table msi_table;
 };
 PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
@@ -1497,6 +1499,20 @@ static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
 	return false;
 }
 
+static bool riscv_iommu_supports_s1(struct riscv_iommu_device *iommu)
+{
+	return (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) ||
+		(iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) ||
+		(iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39);
+}
+
+static bool riscv_iommu_supports_s2(struct riscv_iommu_device *iommu)
+{
+	return (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4) ||
+		(iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4) ||
+		(iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4);
+}
+
 static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
 				       struct riscv_iommu_device *iommu,
 				       struct riscv_iommu_info *info)
@@ -1734,6 +1750,7 @@ riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 			ret = -ENOMEM;
 			goto err_free;
 		}
+		domain->nest_parent = !!(flags & IOMMU_HWPT_ALLOC_NEST_PARENT);
 
 		/*
 		 * Capture the current number of MSI PTEs now since it must remain
@@ -1906,6 +1923,47 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+struct riscv_viommu {
+	struct iommufd_viommu core;
+	struct riscv_iommu_device *iommu;
+	struct riscv_iommu_domain *s2_parent;
+	int gscid;
+};
+
+static const struct iommufd_viommu_ops riscv_viommu_ops = {
+};
+
+static size_t riscv_iommu_get_viommu_size(struct device *dev,
+					  enum iommu_viommu_type viommu_type)
+{
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
+	if (viommu_type != IOMMU_VIOMMU_TYPE_RISCV)
+		return 0;
+
+	if (!riscv_iommu_supports_s1(iommu) || !riscv_iommu_supports_s2(iommu))
+		return 0;
+
+	return VIOMMU_STRUCT_SIZE(struct riscv_viommu, core);
+}
+
+static int riscv_viommu_init(struct iommufd_viommu *viommu,
+			     struct iommu_domain *parent_domain,
+			     const struct iommu_user_data *user_data)
+{
+	struct riscv_viommu *rv_viommu = container_of(viommu, struct riscv_viommu, core);
+	struct riscv_iommu_device *iommu =
+		container_of(viommu->iommu_dev, struct riscv_iommu_device, iommu);
+	struct riscv_iommu_domain *s2_parent = iommu_domain_to_riscv(parent_domain);
+
+	rv_viommu->iommu = iommu;
+	rv_viommu->s2_parent = s2_parent;
+	rv_viommu->gscid = s2_parent->gscid;
+	viommu->ops = &riscv_viommu_ops;
+
+	return 0;
+}
+
 static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
 {
 	struct iommu_resv_region *region;
@@ -1930,6 +1988,8 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
 	.domain_alloc_paging_flags = riscv_iommu_domain_alloc_paging_flags,
+	.get_viommu_size = riscv_iommu_get_viommu_size,
+	.viommu_init = riscv_viommu_init,
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
