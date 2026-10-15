Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD4DCC6B34
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgRY8NRhVtPRzOl20FMVnpXN33CDXuv4OYcV71o0w04=; b=sSx5G7pOO6ahX1
	uBOwKIDWHJFSB2mgS341Kr9ZhysWyk/0t1RDz8AZ/0PJPEuVFOHgTbRcpwYuWNDr+w3Kos2caEeIJ
	SI+c1tKabYFLdTUDIL51KQN+051BSsEEhL3QXnKn20XNdb8QpfSsq593AbsKfKVueVFhnECp/OpGG
	zyCmADSAV7xy7EuC+TqwglIr5i7PY+8dgCIz/2mZ+ceyKGFcC5y/mTgr/64F6P5kgkPhjPWkmgevj
	RyxqgD9jdurX1ubV2UQFWjTsz3Smjd0BeX+yvj6hAoQT2VH0eXVw7uR58ZQKVINBryqz6yPXyiyMg
	akHnPD9Od2DFoZyTYFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKk-0000000Gy4t-1ihN;
	Thu, 15 Oct 2026 06:53:01 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKh-0000000Gy1f-2BDC;
	Thu, 15 Oct 2026 06:52:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4j4zKW6xnbz5B150;
	Thu, 15 Oct 2026 14:52:47 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 69F6qhI5013949;
	Thu, 15 Oct 2026 14:52:43 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 15 Oct 2026 14:52:46 +0800
X-Zmail-TransId: 3e816ad0783d024-5558a
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
Subject: [RFC PATCH 09/12] iommu/riscv: Add riscv_iommu_attach_dev_nested
Date: Thu, 15 Oct 2026 14:52:29 +0800
Message-ID: <20261015065232.604503-10-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69F6qhI5013949
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 15 Oct 2026 14:52:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD0783F.000/4j4zKW6xnbz5B150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_235255_888611_4E118918 
X-CRM114-Status: GOOD (  15.15  )
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

Attach a device to a nested domain by combining the guest-provided
stage-1 context (tc, iosatp) with the host-owned second-stage context
in the device directory entry.

The device is bonded to the stage-2 parent domain so that it shares the
parent's invalidation and interrupt-remapping state: the guest MSI page
table is allocated when missing, and an active table's MSI configuration
is preserved across the device context update. Since the iommu core
passes the nested domain object as the old domain while the bond lives
on the parent, resolve the bond-holding domain before unlinking.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu.c | 89 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e59a6a97589e..a484bf97c2f5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -871,6 +871,13 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
+/*
+ * Resolve the domain holding the device bond: when the previously attached
+ * domain is a nested domain, the device is bonded to its stage-2 parent,
+ * which also owns the MSI table.
+ */
+static struct iommu_domain *riscv_iommu_old_bond_domain(struct iommu_domain *old);
+
 struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info)
 {
 	struct riscv_iommu_domain *domain;
@@ -1593,6 +1600,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	unsigned long flags;
 	int ret;
 
+	old = riscv_iommu_old_bond_domain(old);
+
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
 	if (domain->gscid) {
@@ -1787,6 +1796,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
 
+	old = riscv_iommu_old_bond_domain(old);
+
 	dc.fsc = RISCV_IOMMU_DC_FSC_MODE_BARE;
 	dc.tc = 0;
 
@@ -1816,6 +1827,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
 
+	old = riscv_iommu_old_bond_domain(old);
+
 	dc.fsc = RISCV_IOMMU_DC_FSC_MODE_BARE;
 	dc.tc = RISCV_IOMMU_DC_TC_V;
 
@@ -1938,8 +1951,79 @@ struct riscv_iommu_nested_domain {
 	u64 iosatp;
 };
 
-#define to_riscv_iommu_nested_domain(domain) \
-	container_of(domain, struct riscv_iommu_nested_domain, domain)
+#define to_riscv_iommu_nested_domain(domain_ptr) \
+	container_of(domain_ptr, struct riscv_iommu_nested_domain, domain)
+
+static struct iommu_domain *riscv_iommu_old_bond_domain(struct iommu_domain *old)
+{
+	if (old && old->type == IOMMU_DOMAIN_NESTED)
+		return &to_riscv_iommu_nested_domain(old)->viommu->s2_parent->domain;
+	return old;
+}
+
+static int riscv_iommu_attach_dev_nested(struct iommu_domain *domain,
+					 struct device *dev,
+					 struct iommu_domain *old_domain)
+{
+	struct riscv_iommu_nested_domain *nested_domain =
+		to_riscv_iommu_nested_domain(domain);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *s2_parent = nested_domain->viommu->s2_parent;
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	struct pt_iommu_riscv_64_hw_info pt_info;
+	struct iommu_domain *old = riscv_iommu_old_bond_domain(old_domain);
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_dc dc = {0};
+	unsigned long flags;
+	int ret;
+
+	if (nested_domain->viommu->iommu != iommu)
+		return -EINVAL;
+
+	if (!s2_parent->nest_parent)
+		return -EINVAL;
+
+	pt_iommu_riscv_64_hw_info(&s2_parent->riscvpt, &pt_info);
+
+	dc.tc = nested_domain->tc;
+	dc.fsc = nested_domain->iosatp;
+
+	dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
+		     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn) |
+		     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, s2_parent->gscid);
+
+	/* SVA/PASID are not supported now, keep PSCID at 0. */
+	dc.ta = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, 0);
+
+	ret = riscv_iommu_msi_table_alloc(s2_parent, iommu, info);
+	if (ret)
+		return ret;
+
+	bond = kzalloc_obj(*bond);
+	if (!bond)
+		return -ENOMEM;
+	bond->dev = dev;
+
+	flags = riscv_iommu_msi_tables_lock(old, &s2_parent->domain);
+	if (!riscv_iommu_can_attach_paging_domain(&s2_parent->domain, dev, old)) {
+		riscv_iommu_msi_tables_unlock(old, &s2_parent->domain, flags);
+		kfree(bond);
+		return -EBUSY;
+	}
+
+	/* Keep an active guest MSI table published across the DC update. */
+	if (s2_parent->msi_table.nr_forwarded_irqs)
+		riscv_iommu_msi_table_set_dc(&s2_parent->msi_table, &dc, true);
+
+	info->dc = dc;
+	riscv_iommu_bond_link(s2_parent, bond);
+	riscv_iommu_iodir_update(dev, &info->dc);
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, s2_parent);
+	riscv_iommu_msi_tables_unlock(old, &s2_parent->domain, flags);
+
+	return 0;
+}
 
 static void riscv_iommu_domain_nested_free(struct iommu_domain *domain)
 {
@@ -1947,6 +2031,7 @@ static void riscv_iommu_domain_nested_free(struct iommu_domain *domain)
 }
 
 static const struct iommu_domain_ops riscv_iommu_nested_ops = {
+	.attach_dev = riscv_iommu_attach_dev_nested,
 	.free = riscv_iommu_domain_nested_free,
 };
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
