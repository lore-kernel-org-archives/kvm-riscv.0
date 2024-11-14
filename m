From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:57 +0100
Subject: [RFC PATCH 12/15] iommu/riscv: Add guest file irqbypass support
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-29-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement irq_set_vcpu_affinity() in the RISCV IOMMU driver.
irq_set_vcpu_affinity() is the channel from a hypervisor to the
IOMMU needed to ensure that assigned devices which direct MSIs to
guest IMSIC addresses will have those MSI writes redirected to
their corresponding guest interrupt files.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-ir.c | 151 +++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |   4 +-
 drivers/iommu/riscv/iommu.h    |   3 +
 3 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index c177e064b205..958270450ec1 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -7,6 +7,8 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 
+#include <asm/irq.h>
+
 #include "../iommu-pages.h"
 #include "iommu.h"
 
@@ -52,10 +54,159 @@ static size_t riscv_iommu_ir_nr_msiptes(struct riscv_iommu_domain *domain)
 	return max_idx + 1;
 }
 
+static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain,
+					struct riscv_iommu_msipte *pte)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_command cmd;
+	u64 addr;
+
+	addr = pfn_to_phys(FIELD_GET(RISCV_IOMMU_MSIPTE_PPN, pte->pte));
+	riscv_iommu_cmd_inval_gvma(&cmd);
+	riscv_iommu_cmd_inval_set_addr(&cmd, addr);
+
+	/* Like riscv_iommu_iotlb_inval(), synchronize with riscv_iommu_bond_link() */
+	smp_mb();
+
+	rcu_read_lock();
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_send(iommu, &cmd);
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
+static void riscv_iommu_ir_msitbl_update(struct riscv_iommu_domain *domain,
+					 struct riscv_iommu_msiptp_state *msiptp)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_command cmd;
+	struct iommu_fwspec *fwspec;
+	struct riscv_iommu_dc *dc;
+	int i;
+
+	/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
+	smp_mb();
+	rcu_read_lock();
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		fwspec = dev_iommu_fwspec_get(bond->dev);
+
+		for (i = 0; i < fwspec->num_ids; i++) {
+			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+			WRITE_ONCE(dc->msiptp, msiptp->msiptp);
+			WRITE_ONCE(dc->msi_addr_mask, msiptp->msi_addr_mask);
+			WRITE_ONCE(dc->msi_addr_pattern, msiptp->msi_addr_pattern);
+		}
+
+		dma_wmb();
+
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_send(iommu, &cmd);
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
+static int riscv_iommu_ir_msitbl_init(struct riscv_iommu_domain *domain,
+				      struct riscv_iommu_vcpu_info *vcpu_info)
+{
+	domain->msiptp.msi_addr_pattern = vcpu_info->msi_addr_pattern;
+	domain->msiptp.msi_addr_mask = vcpu_info->msi_addr_mask;
+	domain->group_index_bits = vcpu_info->group_index_bits;
+	domain->group_index_shift = vcpu_info->group_index_shift;
+
+	if (riscv_iommu_ir_nr_msiptes(domain) * sizeof(*domain->msi_root) > PAGE_SIZE * 2)
+		return -ENOMEM;
+
+	domain->msiptp.msiptp = virt_to_pfn(domain->msi_root) |
+				FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+					   RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+
+	riscv_iommu_ir_msitbl_update(domain, &domain->msiptp);
+
+	return 0;
+}
+
+static int riscv_iommu_irq_set_vcpu_affinity(struct irq_data *data, void *info)
+{
+	struct riscv_iommu_vcpu_info *vcpu_info = info;
+	struct riscv_iommu_domain *domain = data->domain->host_data;
+	struct riscv_iommu_msipte *pte;
+	int ret = -EINVAL;
+	u64 pteval;
+
+	if (WARN_ON(domain->domain.type != IOMMU_DOMAIN_UNMANAGED))
+		return ret;
+
+	spin_lock(&domain->msi_lock);
+
+	if (!domain->msiptp.msiptp) {
+		if (WARN_ON(!vcpu_info))
+			goto out_unlock;
+
+		ret = riscv_iommu_ir_msitbl_init(domain, vcpu_info);
+		if (ret)
+			goto out_unlock;
+	} else if (!vcpu_info) {
+		/*
+		 * Nothing to do here since we don't track host_irq <=> msipte mappings
+		 * nor reference count the ptes. If we did do that tracking then we would
+		 * decrement the reference count of the pte for the host_irq and possibly
+		 * clear its valid bit if it was the last one mapped.
+		 */
+		ret = 0;
+		goto out_unlock;
+	} else if (WARN_ON(vcpu_info->msi_addr_pattern != domain->msiptp.msi_addr_pattern ||
+			   vcpu_info->msi_addr_mask != domain->msiptp.msi_addr_mask ||
+			   vcpu_info->group_index_bits != domain->group_index_bits ||
+			   vcpu_info->group_index_shift != domain->group_index_shift)) {
+		goto out_unlock;
+	}
+
+	pte = riscv_iommu_ir_get_msipte(domain, vcpu_info->gpa);
+	if (!pte)
+		goto out_unlock;
+
+	pteval = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 3) |
+		 riscv_iommu_phys_to_ppn(vcpu_info->hpa) |
+		 FIELD_PREP(RISCV_IOMMU_MSIPTE_V, 1);
+
+	if (pte->pte != pteval) {
+		pte->pte = pteval;
+		riscv_iommu_ir_msitbl_inval(domain, pte);
+	}
+
+	ret = 0;
+
+out_unlock:
+	spin_unlock(&domain->msi_lock);
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_vcpu_affinity	= riscv_iommu_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c4a47b21c58f..46ac228ba7ac 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -544,8 +544,8 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 }
 
 /* Lookup and initialize device context info structure. */
-static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
-						 unsigned int devid)
+struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
+					  unsigned int devid)
 {
 	const bool base_format = !(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT);
 	unsigned int depth;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6ce71095781c..2ca76edf48f5 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -127,6 +127,9 @@ struct riscv_iommu_bond {
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 
+struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
+					  unsigned int devid);
+
 void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 			  struct riscv_iommu_command *cmd);
 void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-- 
2.47.0


