Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FB606B1DA
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbKzkWvg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qUOK0Pjb2ptoLLdKneGeftm+ctgBgc5ME2D00SME6xQ=; b=qbKzkWvgzsfQSTopJVietcutqa
	uUc8Z6cOuAR+P8boUWovz3SIUnaDByzE2w42Gzyd1qYYLVIeuWfy0402O4P1A+YyrI2Fb14UsWKkl
	jTN5P4P4XC6c80QfTnbPiK6Cd2dm2T6WDpVrFQmjzKVxJglnTlsw7h6pEBvjhAMQyMs0Rus1mlNWC
	bnrj/Bz8RnXniIR2QeqwzpaOVYjekBp95eRWH6auqjCbpGEY6WMJYX35vqTx4La7lm4wjQmnozN9e
	LTdJNNm68DNKGl3kuY9rnGVPS5+loVCqCC6QOL9FrOH+ws8X0MeLwnWbDBVFa7HOuRTa3FwVrWXed
	FbII6FXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BU-0000000C2PL-3qqH;
	Thu, 19 Nov 2026 13:28:16 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BO-0000000C2Iy-0HWh;
	Thu, 19 Nov 2026 13:28:16 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jVfRN2K35z8Xrrb;
	Thu, 19 Nov 2026 21:28:00 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 6AJDRqkO086401;
	Thu, 19 Nov 2026 21:27:52 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:55 +0800
X-Zmail-TransId: 3e816afef95a02f-564b4
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
        Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: [RFC PATCH v3 04/10] iommu/riscv: Add vIOMMU object support
Date: Thu, 19 Nov 2026 21:27:38 +0800
Message-ID: <20261119132744.396426-5-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6AJDRqkO086401
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 19 Nov 2026 21:28:00 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF960.000/4jVfRN2K35z8Xrrb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052810_437746_FBD75B3D 
X-CRM114-Status: GOOD (  15.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wu Fei <wu.fei9@sanechips.com.cn>

Allow iommufd to allocate a RISC-V vIOMMU when the physical IOMMU
supports both translation stages.

Nested translation needs to associate guest-owned stage 1 contexts
with a host-owned stage 2 parent domain. A vIOMMU provides this
association and owns a dedicated GSCID so that guest PSCIDs cannot
alias address spaces belonging to another vIOMMU.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 77 +++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index f6e92b086c12..f2305b953f71 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,6 +19,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
+#include <linux/iommufd.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -856,6 +857,7 @@ struct riscv_iommu_domain {
 	spinlock_t lock;		/* protect bonds list updates. */
 	int pscid;
 	int gscid;
+	bool nest_parent;
 };
 PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
@@ -1342,6 +1344,20 @@ static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu,
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
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1466,6 +1482,8 @@ static int riscv_iommu_init_domain_s2(struct device *dev,
 	if (domain->gscid < 0)
 		return -ENOMEM;
 
+	domain->nest_parent = !!(flags & IOMMU_HWPT_ALLOC_NEST_PARENT);
+
 	/* AMO_HWAD is checked by iommufd via IOMMU_CAP_DIRTY_TRACKING */
 	if (flags & IOMMU_HWPT_ALLOC_DIRTY_TRACKING)
 		domain->domain.dirty_ops = &riscv_iommu_dirty_ops;
@@ -1662,6 +1680,63 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+struct riscv_viommu {
+	struct iommufd_viommu core;
+	struct riscv_iommu_device *iommu;
+	struct riscv_iommu_domain *s2_parent;
+	int gscid;
+};
+
+static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
+{
+	struct riscv_viommu *rv_viommu =
+		container_of(viommu, struct riscv_viommu, core);
+	/*
+	 * All devices are detached and iodir_update() has flushed this
+	 * GSCID, so the ID can be recycled here.
+	 */
+	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
+}
+
+static const struct iommufd_viommu_ops riscv_viommu_ops = {
+	.destroy = riscv_viommu_destroy,
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
+	rv_viommu->gscid = ida_alloc_range(&riscv_iommu_gscids, 1,
+					   RISCV_IOMMU_MAX_GSCID, GFP_KERNEL);
+	if (rv_viommu->gscid < 0)
+		return rv_viommu->gscid;
+
+	rv_viommu->iommu = iommu;
+	rv_viommu->s2_parent = s2_parent;
+	viommu->ops = &riscv_viommu_ops;
+
+	return 0;
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.capable = riscv_iommu_capable,
@@ -1669,6 +1744,8 @@ static const struct iommu_ops riscv_iommu_ops = {
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
