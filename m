Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A646CCC6B1A
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4nZykeUJfq4PDvv7dDx4B5zNwidXjbo5yXVmqDHXag=; b=XAFDaNzSr0Qyzj
	y9HgKzR8JCFOOkjJJEtla1hagXGrlHtOPtp8cfyIOFqiwVkR76S3SpXYg03LgBW1Tzilzu1HorK12
	sfZIcoZVLyQxgy4aqtyToG5DzeDwMGBU2epTBXl7S1idyIPsuFOwku9HIwo3J9nX97G+atjLHs08z
	G8aXP1FDDzIz46PDFo2IncJB3WZYJe/BQykgEJH2ivV4GGReqSTk8BA8A83DyiJxB1a6oZ3wlSRVH
	xX8F/WRQ9sR8+SeCBpOCuLbGWUyDJTl5S+mmC2XjebHpa9D0tv4alAz6UzLxUn3xOmIFNPulcYfQ8
	HmvxWJ42nbghOOrk47Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi9-0000000FglH-1In1;
	Wed, 14 Oct 2026 14:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi6-0000000FgjF-3Z3O;
	Wed, 14 Oct 2026 14:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3BDA8tuxbUYruftXQKUiM6Q2zzcDlFfuoJXp/9UZKuI=; b=DnyrYgCbiAJqmWc0r6XD00S+9m
	X1Fj4pjipbbrX3tQLfZQFbXnyyp+xYUArE7bbL7+YqiijAD1Cc6ybHib9aUKkuVjPfYQFMCP7cfCy
	Pj/ElzkyQ2xvHMb45isL//UDVwBZlRJkOV9+dlS0oIIr4B559tNOnysA3Kk3SXA/xrFtezHlbAhXf
	DxyDKRwx6lhmnHFDLGeml4vSVC7222dqAEU2LoZRnm9hrPNpmZjEuXOVy7e9odaP0jm2S764EAyFf
	vIBwe/Aeya/I22gzdX5D3AK0oFC/FN0zAutiBtYrLpl+Limgo5sLBGmE2//jatCRIkFbj2Pgb7isY
	WKl31X+Q==;
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzi2-0000000GriN-2qtM;
	Wed, 14 Oct 2026 14:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987101; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3BDA8tuxbUYruftXQKUiM6Q2zzcDlFfuoJXp/9UZKuI=;
	b=egAyB3lSe8l+3hKePoPC/YB/0HvJ70MvIwT0IVtaheZ6jbwEQ86wuecY9PP72Ar72ASWi80aNZBbnvumRoX4Qshd0STjC+/wrlBKaw1PnSWFATJAaNSixb2IiJo1YzdtE41XaTYqUaT8vexj5zCdDW+iotg8eSr3+Ch2zl11r/Q=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp410e_1791987099;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp410e_1791987099 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:40 +0800
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
Subject: [RFC PATCH v2 4/4] iommu/riscv: Support IRQ forwarding without MSI page tables
Date: Wed, 14 Oct 2026 22:11:24 +0800
Message-Id: <20261014141124.48569-5-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
References: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_151159_115505_66A006BB 
X-CRM114-Status: GOOD (  17.65  )
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

IOMMU implementations without the MSI_FLAT capability have no MSI page
table, and their MSI writes are translated by the second-stage page
table. Forward interrupts there by mapping the guest IMSIC GPA to the
host IMSIC HPA in the second-stage domain, so device MSI writes reach
the vCPU's interrupt file directly.

Dispatch on the IOMMU capabilities in the IRQ forwarding entry: with
MSI_FLAT nothing changes; without it, validate that every target is an
IMSIC page in the guest MSI address window, install the GPA mappings,
and replace the leaf PTE via the generic page table replace_leaf op
when a vCPU migration moves the VS-file host page. Mappings persist
for the lifetime of the domain; disabling forwarding or a failed
operation only drops the per-IRQ state so the IRQ falls back to host
delivery.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-ir.c | 156 ++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index b96baff9986d..bc474e44805d 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -271,14 +271,159 @@ static int riscv_iommu_ir_update_target(struct riscv_iommu_msi_table *msi_table,
 	return 0;
 }
 
-static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
+static int riscv_iommu_ir_validate_noflat_target(const struct riscv_iommu_ir_vcpu_info *vcpu_info,
+						 const struct riscv_iommu_ir_target *target)
+{
+	u64 addr = target->gpa >> IMSIC_MMIO_PAGE_SHIFT;
+
+	if (!IS_ALIGNED(target->gpa, IMSIC_MMIO_PAGE_SZ) ||
+	    (addr & ~vcpu_info->msi_addr_mask) != vcpu_info->msi_addr_pattern)
+		return -EINVAL;
+
+	/* Without MSI_FLAT there is no MSI page table, so only IMSIC targets work. */
+	if (target->type != RISCV_IOMMU_IR_TARGET_IMSIC)
+		return -EOPNOTSUPP;
+
+	if (!IS_ALIGNED(target->hpa, IMSIC_MMIO_PAGE_SZ))
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Caller must hold msi_table->lock. */
+static int riscv_iommu_ir_map_guest_imsic(struct riscv_iommu_msi_table *msi_table,
+					  const struct riscv_iommu_ir_target *target)
+{
+	unsigned long index = target->gpa >> IMSIC_MMIO_PAGE_SHIFT;
+	struct riscv_iommu_noflat_imsic *imsic;
+	int ret;
+
+	imsic = xa_load(&msi_table->noflat_imsics, index);
+	if (imsic) {
+		if (imsic->hpa == target->hpa)
+			return 0;
+
+		ret = riscv_iommu_msi_table_replace_gpa(msi_table, target->gpa,
+							imsic->hpa, target->hpa);
+		if (ret)
+			return ret;
+	} else {
+		imsic = kzalloc_obj(*imsic, GFP_ATOMIC);
+		if (!imsic)
+			return -ENOMEM;
+
+		ret = xa_err(xa_store(&msi_table->noflat_imsics, index, imsic,
+				      GFP_ATOMIC));
+		if (ret) {
+			kfree(imsic);
+			return ret;
+		}
+
+		ret = riscv_iommu_msi_table_map_gpa(msi_table, target->gpa, target->hpa);
+		if (ret) {
+			xa_erase(&msi_table->noflat_imsics, index);
+			kfree(imsic);
+			return ret;
+		}
+	}
+
+	imsic->hpa = target->hpa;
+	riscv_iommu_msi_table_inval(msi_table, target->gpa);
+	return 0;
+}
+
+static int riscv_iommu_ir_activate_noflat(struct riscv_iommu_msi_table *msi_table,
+					  struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	int ret;
+
+	ret = riscv_iommu_ir_validate_vcpu_info(vcpu_info);
+	if (ret)
+		return ret;
+
+	if (!vcpu_info->targets || !vcpu_info->nr_targets)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < vcpu_info->nr_targets; i++) {
+		ret = riscv_iommu_ir_validate_noflat_target(vcpu_info, &vcpu_info->targets[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (unsigned int i = 0; i < vcpu_info->nr_targets; i++) {
+		ret = riscv_iommu_ir_map_guest_imsic(msi_table, &vcpu_info->targets[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int riscv_iommu_ir_update_target_noflat(struct riscv_iommu_msi_table *msi_table,
+					       struct riscv_iommu_ir_vcpu_info *vcpu_info)
+{
+	const struct riscv_iommu_ir_target *target = &vcpu_info->target;
+	int ret;
+
+	ret = riscv_iommu_ir_validate_vcpu_info(vcpu_info);
+	if (ret)
+		return ret;
+
+	ret = riscv_iommu_ir_validate_noflat_target(vcpu_info, target);
+	if (ret)
+		return ret;
+
+	if (!xa_load(&msi_table->noflat_imsics, target->gpa >> IMSIC_MMIO_PAGE_SHIFT))
+		return -EINVAL;
+
+	return riscv_iommu_ir_map_guest_imsic(msi_table, target);
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity_noflat(struct irq_data *data,
 						       struct riscv_iommu_info *info,
 						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
 						       struct riscv_iommu_msi_table *msi_table)
+{
+	int ret;
+
+	if (!vcpu_info) {
+		/* Mappings persist; only the per-IRQ forwarding state is dropped. */
+		if (irqd_is_forwarded_to_vcpu(data)) {
+			irqd_clr_forwarded_to_vcpu(data);
+			info->nr_forwarded_irqs--;
+		}
+		return 0;
+	}
+
+	ret = vcpu_info->cmd == RISCV_IOMMU_IR_FORWARD ?
+		riscv_iommu_ir_activate_noflat(msi_table, vcpu_info) :
+		riscv_iommu_ir_update_target_noflat(msi_table, vcpu_info);
+	if (!ret) {
+		if (!irqd_is_forwarded_to_vcpu(data)) {
+			irqd_set_forwarded_to_vcpu(data);
+			info->nr_forwarded_irqs++;
+		}
+	} else if (irqd_is_forwarded_to_vcpu(data)) {
+		irqd_clr_forwarded_to_vcpu(data);
+		info->nr_forwarded_irqs--;
+	}
+
+	return ret;
+}
+
+static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
+						       struct riscv_iommu_info *info,
+						       struct riscv_iommu_ir_vcpu_info *vcpu_info,
+						       struct riscv_iommu_msi_table *msi_table,
+						       bool noflat)
 {
 	struct riscv_iommu_device *iommu = data->domain->host_data;
 	int ret;
 
+	if (noflat)
+		return riscv_iommu_ir_irq_set_vcpu_affinity_noflat(data, info,
+								    vcpu_info, msi_table);
+
 	if (!vcpu_info) {
 		if (WARN_ON_ONCE(!msi_table->nr_forwarded_irqs || !info->nr_forwarded_irqs))
 			return -EINVAL;
@@ -332,10 +477,12 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity_locked(struct irq_data *data,
 static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg)
 {
 	struct riscv_iommu_ir_vcpu_info *vcpu_info = arg;
+	struct riscv_iommu_device *iommu = data->domain->host_data;
 	struct riscv_iommu_msi_table *msi_table;
 	struct riscv_iommu_info *info;
 	struct msi_desc *desc;
 	struct device *dev;
+	bool noflat;
 	int ret;
 
 	if (!vcpu_info && !irqd_is_forwarded_to_vcpu(data))
@@ -354,6 +501,8 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 	if (WARN_ON_ONCE(!info))
 		return -EINVAL;
 
+	noflat = !(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT);
+
 	scoped_guard(rcu) {
 		/*
 		 * RCU keeps the table alive, but the device may switch domains before
@@ -361,7 +510,7 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 		 */
 		for (;;) {
 			msi_table = riscv_iommu_msi_table_rcu(info);
-			if (!msi_table || !msi_table->root)
+			if (!msi_table || (!noflat && !msi_table->root))
 				return -EOPNOTSUPP;
 
 			raw_spin_lock(&msi_table->lock);
@@ -371,7 +520,8 @@ static int riscv_iommu_ir_irq_set_vcpu_affinity(struct irq_data *data, void *arg
 		}
 	}
 
-	ret = riscv_iommu_ir_irq_set_vcpu_affinity_locked(data, info, vcpu_info, msi_table);
+	ret = riscv_iommu_ir_irq_set_vcpu_affinity_locked(data, info, vcpu_info,
+							  msi_table, noflat);
 	raw_spin_unlock(&msi_table->lock);
 
 	return ret;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
